FROM docker.io/library/golang:1.16 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o helloworld .

FROM scratch
COPY --from=builder /app/helloworld /
ENTRYPOINT ["/helloworld"]
