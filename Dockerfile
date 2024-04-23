ARG BASE_IMAGE
FROM ${BASE_IMAGE}

USER root

RUN apt-get update && apt-get install -y git graphviz curl unzip groff uuid-runtime
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip -qu awscliv2.zip && \
    ./aws/install --update

# Copy the entire repository directory
COPY . /app

COPY entrypoint.sh /entrypoint.sh
COPY dump_dags.py /dump_dags.py

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]