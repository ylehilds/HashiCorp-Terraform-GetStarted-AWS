terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

   # Configure the remote backend with HashiCorp Cloud Platform
    cloud {
      organization = "lehi-organization"
      workspaces {
        name = "learn-terraform-aws"
      }
    }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  # the below 2 lines is only to work with work aws training fullstack account
  # vpc_security_group_ids = ["sg-0c307b7917e9a86f1"]
  # subnet_id              = "subnet-001dfaa2fd20759cc"

  tags = {
    Name = var.instance_name
  }
}
