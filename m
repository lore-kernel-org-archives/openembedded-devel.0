Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web08.7351.1605780908421325093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 02:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rLPBfrwN;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id f23so7135586ejk.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2020 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+2nR1J/Qk4BYd1E5eJMmECwfed6RnganropQXjuZ3M=;
        b=rLPBfrwN3hvbyRAA6HoPa7ODNrPuv/esX84KAqzCqwxgMwiteyHfIx3sT4YAmSHYZA
         2bSGK4UCcX/257Hf4BLtKiWVZgOJbqTXz4ShaoeLr1LOKib1fJBFCkSOFxreLPPp/hlC
         naoUBqZTPgbbch2Af3WlGO+wT9kcY3k5nUwRr/jjmxktCm80pFE6CLzBvKxt1psftsCo
         zTYBBGZ9YlGPNgwQKkiI3zoW/xQfyl1NUd/gtlef30fZOhxWYnm8ex5ZlZSLFov4GNlc
         vOoQ0eLzyJIP57bi9ITwwB8l3NChhSKfQon1oXPaWkxCBXB0NZ6J3wKt1W3VZNo04QIb
         tGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+2nR1J/Qk4BYd1E5eJMmECwfed6RnganropQXjuZ3M=;
        b=PdgbjOi7tCTJCqeYsi2MYIAkcGKM0/00RGRhxSTFSjqLDAgxK7j8yvBg4HvjDS3Q/v
         /JSIW+mDFq/9WxRXQ68zykCZCDcQdRvYqLl0k33t69qtSI9e8oYduWZfIjJbgbh6vjK9
         kH1pZJidUAhJnuLk+vQPlcBl4WvjbvGRS0tr9yy4bz+fEnl0FI3oocKI7yKYRmLyx4FB
         GV+84v6lGUTu+fcu08cZakzTFaXMXN1wkpRAFUqIx+WTctXbx2PbbiEpoEbZbHL8Hy3g
         +eux6MK6G1j3mC7JcxuRc2bx2yLGh1e1MMRgrItgUZFsZP/m034rV5MDPj7QDnLBvj3Z
         ziAg==
X-Gm-Message-State: AOAM533RQf8yOtvfBhoS6wPBvFJYn7l8OrXwjY0nNdLIdMSI6RJRJ0tz
	rXsqFXV0PuvAvB8c8KY8uzPUuk31G9h1RdRtMDM=
X-Google-Smtp-Source: ABdhPJyilib386JPSe3ZWrdEK2/ukq2kS7qiuO33pxI2bxbk4RECB9Dx1f3CsWX+yubBCMz+1Vi1ysB6rqiWae8uag4=
X-Received: by 2002:a17:906:3c53:: with SMTP id i19mr9856311ejg.392.1605780906630;
 Thu, 19 Nov 2020 02:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20201117230404.880724-1-raj.khem@gmail.com> <20201117230404.880724-4-raj.khem@gmail.com>
In-Reply-To: <20201117230404.880724-4-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 19 Nov 2020 11:14:55 +0100
Message-ID: <CA+chaQcja1Qh+Rfu9e3GZmU1A3ikvSJa81WsFHZRrW0Ohhtjjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/5] thingsboard-gateway: Add recipe for v2.5.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"hasan.men" <hasan.men@bosphorusiss.com>
Content-Type: multipart/alternative; boundary="00000000000086e3f105b473003b"

--00000000000086e3f105b473003b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

python3-jsonpath-rw dependency was added to meta-python, but meta-oe
doesn't depend on meta-python, so either python3-jsonpath-rw needs to be
moved to meta-oe (if it doesn't depend on other stuff from meta-python) or
thingsboard-gateway needs to be moved to meta-python.

On Wed, Nov 18, 2020 at 12:04 AM Khem Raj <raj.khem@gmail.com> wrote:

> From: "hasan.men" <hasan.men@bosphorusiss.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../thingsboard-gateway/bacnet.json           |  58 ++++++
>  .../thingsboard-gateway/ble.json              |  53 ++++++
>  .../thingsboard-gateway/can.json              |  89 +++++++++
>  .../thingsboard-gateway/custom_serial.json    |  33 ++++
>  .../thingsboard-gateway/logs.conf             |  77 ++++++++
>  .../thingsboard-gateway/modbus.json           | 169 ++++++++++++++++++
>  .../thingsboard-gateway/modbus_serial.json    |  29 +++
>  .../thingsboard-gateway/mqtt.json             | 132 ++++++++++++++
>  .../thingsboard-gateway/odbc.json             |  54 ++++++
>  .../thingsboard-gateway/opcua.json            |  49 +++++
>  .../thingsboard-gateway/request.json          | 146 +++++++++++++++
>  .../thingsboard-gateway/rest.json             | 152 ++++++++++++++++
>  .../thingsboard-gateway/snmp.json             | 138 ++++++++++++++
>  .../thingsboard-gateway/tb_gateway.yaml       |  66 +++++++
>  .../thingsboard-gateway.service               |  13 ++
>  .../thingsboard-gateway_2.5.2.bb              |  68 +++++++
>  16 files changed, 1326 insertions(+)
>  create mode 100644
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bac=
net.json
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble=
.json
>  create mode 100644
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can=
.json
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/cus=
tom_serial.json
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/log=
s.conf
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mod=
bus.json
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mod=
bus_serial.json
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqt=
t.json
>  create mode 100644
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odb=
c.json
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opc=
ua.json
>  create mode 100644
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/req=
uest.json
>  create mode 100644
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/res=
t.json
>  create mode 100644
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snm=
p.json
>  create mode 100755
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb_=
gateway.yaml
>  create mode 100644
> meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/thi=
ngsboard-gateway.service
>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
>
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/b=
acnet.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/b=
acnet.json
> new file mode 100644
> index 0000000000..e36a2165d1
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/b=
acnet.json
> @@ -0,0 +1,58 @@
> +{
> +    "general": {
> +      "objectName": "TB_gateway",
> +      "address": "192.168.188.181:1052",
> +      "objectIdentifier": 599,
> +      "maxApduLengthAccepted": 1024,
> +      "segmentationSupported": "segmentedBoth",
> +      "vendorIdentifier": 15
> +    },
> +    "devices": [
> +      {
> +        "deviceName": "BACnet Device ${objectName}",
> +        "deviceType": "default",
> +        "address": "192.168.188.181:10520",
> +        "pollPeriod": 10000,
> +        "attributes": [
> +          {
> +            "key": "temperature",
> +            "type": "string",
> +            "objectId": "analogOutput:1",
> +            "propertyId": "presentValue"
> +          }
> +        ],
> +        "timeseries": [
> +          {
> +            "key": "state",
> +            "type": "bool",
> +            "objectId": "binaryValue:1",
> +            "propertyId": "presentValue"
> +          }
> +        ],
> +        "attributeUpdates": [
> +          {
> +            "key": "brightness",
> +            "requestType": "writeProperty",
> +            "objectId": "analogOutput:1",
> +            "propertyId": "presentValue"
> +          }
> +        ],
> +        "serverSideRpc": [
> +          {
> +            "method": "set_state",
> +            "requestType": "writeProperty",
> +            "requestTimeout": 10000,
> +            "objectId": "binaryOutput:1",
> +            "propertyId": "presentValue"
> +          },
> +          {
> +            "method": "get_state",
> +            "requestType": "readProperty",
> +            "requestTimeout": 10000,
> +            "objectId": "binaryOutput:1",
> +            "propertyId": "presentValue"
> +          }
> +        ]
> +      }
> +    ]
> +  }
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/b=
le.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/b=
le.json
> new file mode 100755
> index 0000000000..2a5da3f41d
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/b=
le.json
> @@ -0,0 +1,53 @@
> +{
> +    "name": "BLE Connector",
> +    "rescanIntervalSeconds": 100,
> +    "checkIntervalSeconds": 100,
> +    "scanTimeSeconds": 5,
> +    "passiveScanMode": true,
> +    "devices": [
> +        {
> +            "name": "Temperature and humidity sensor",
> +            "MACAddress": "4C:65:A8:DF:85:C0",
> +            "addrType": "public",
> +            "telemetry": [
> +                {
> +                    "key": "temperature",
> +                    "method": "notify",
> +                    "characteristicUUID":
> "226CAA55-6476-4566-7562-66734470666D",
> +                    "byteFrom": 2,
> +                    "byteTo": 6
> +                },
> +                {
> +                    "key": "humidity",
> +                    "method": "notify",
> +                    "characteristicUUID":
> "226CAA55-6476-4566-7562-66734470666D",
> +                    "byteFrom": 9,
> +                    "byteTo": 13
> +                }
> +            ],
> +            "attributes": [
> +                {
> +                    "key": "name",
> +                    "characteristicUUID":
> "00002A00-0000-1000-8000-00805F9B34FB",
> +                    "method": "read",
> +                    "byteFrom": 0,
> +                    "byteTo": -1
> +                }
> +            ],
> +            "attributeUpdates": [
> +                {
> +                    "attributeOnThingsBoard": "sharedName",
> +                    "characteristicUUID":
> "00002A00-0000-1000-8000-00805F9B34FB"
> +                }
> +            ],
> +            "serverSideRpc": [
> +                {
> +                    "methodRPC": "rpcMethod1",
> +                    "withResponse": true,
> +                    "characteristicUUID":
> "00002A00-0000-1000-8000-00805F9B34FB",
> +                    "methodProcessing": "read"
> +                }
> +            ]
> +        }
> +    ]
> +}
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/c=
an.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/c=
an.json
> new file mode 100644
> index 0000000000..b5cec0045a
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/c=
an.json
> @@ -0,0 +1,89 @@
> +{
> +    "interface": "socketcan",
> +    "channel": "vcan0",
> +    "backend": {
> +      "fd": true
> +    },
> +    "reconnectPeriod": 5,
> +    "devices": [
> +      {
> +        "name": "Car",
> +        "sendDataOnlyOnChange": false,
> +        "enableUnknownRpc": true,
> +        "strictEval": false,
> +        "attributes": [
> +          {
> +            "key": "isDriverDoorOpened",
> +            "nodeId": 41,
> +            "command": "2:2:big:8717",
> +            "value": "4:1:int",
> +            "expression": "bool(value & 0b00000100)",
> +            "polling": {
> +              "type": "once",
> +              "dataInHex": "AB CD AB CD"
> +            }
> +          }
> +        ],
> +        "timeseries": [
> +          {
> +            "key": "rpm",
> +            "nodeId": 1918,
> +            "isExtendedId": true,
> +            "command": "2:2:big:48059",
> +            "value": "4:2:big:int",
> +            "expression": "value / 4",
> +            "polling": {
> +              "type": "always",
> +              "period": 5,
> +              "dataInHex": "aaaa bbbb aaaa bbbb"
> +            }
> +          },
> +          {
> +            "key": "milliage",
> +            "nodeId": 1918,
> +            "isExtendedId": true,
> +            "value": "4:2:little:int",
> +            "expression": "value * 10",
> +            "polling": {
> +              "type": "always",
> +              "period": 30,
> +              "dataInHex": "aa bb cc dd ee ff aa bb"
> +            }
> +          }
> +        ],
> +        "attributeUpdates": [
> +          {
> +            "attributeOnThingsBoard": "softwareVersion",
> +            "nodeId": 64,
> +            "isExtendedId": true,
> +            "dataLength": 4,
> +            "dataExpression": "value + 5",
> +            "dataByteorder": "little"
> +          }
> +        ],
> +        "serverSideRpc": [
> +          {
> +            "method": "sendSameData",
> +            "nodeId": 4,
> +            "isExtendedId": true,
> +            "isFd": true,
> +            "bitrateSwitch": true,
> +            "dataInHex": "aa bb cc dd ee ff    aa bb aa bb cc d ee ff"
> +          },
> +          {
> +            "method": "setLightLevel",
> +            "nodeId": 5,
> +            "dataLength": 2,
> +            "dataByteorder": "little",
> +            "dataBefore": "00AA"
> +          },
> +          {
> +            "method": "setSpeed",
> +            "nodeId": 16,
> +            "dataAfter": "0102",
> +            "dataExpression": "userSpeed if maxAllowedSpeed > userSpeed
> else maxAllowedSpeed"
> +          }
> +        ]
> +      }
> +    ]
> +  }
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/c=
ustom_serial.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/c=
ustom_serial.json
> new file mode 100755
> index 0000000000..0aee5cb765
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/c=
ustom_serial.json
> @@ -0,0 +1,33 @@
> +{
> +  "name": "Custom serial connector",
> +  "devices": [
> +    {
> +      "name": "CustomSerialDevice1",
> +      "type": "default",
> +      "port": "/dev/ttyUSB0",
> +      "baudrate": 9600,
> +      "converter": "CustomSerialUplinkConverter",
> +      "telemetry": [
> +        {
> +          "type": "byte",
> +          "key": "humidity",
> +          "untilDelimiter": "\r"
> +        }
> +      ],
> +      "attributes":[
> +        {
> +          "key": "SerialNumber",
> +          "type": "string",
> +          "fromByte": 4,
> +          "toByte": -1
> +        }
> +      ],
> +      "attributeUpdates": [
> +        {
> +          "attributeOnThingsBoard": "attr1",
> +          "stringToDevice": "value =3D ${attr1}\n"
> +        }
> +      ]
> +    }
> +  ]
> +}
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/l=
ogs.conf
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/l=
ogs.conf
> new file mode 100755
> index 0000000000..d66c2b84a8
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/l=
ogs.conf
> @@ -0,0 +1,77 @@
> +[loggers]
> +keys=3Droot, service, connector, converter, tb_connection, storage,
> extension
> +[handlers]
> +keys=3DconsoleHandler, serviceHandler, connectorHandler, converterHandl=
er,
> tb_connectionHandler, storageHandler, extensionHandler
> +[formatters]
> +keys=3DLogFormatter
> +[logger_root]
> +level=3DERROR
> +handlers=3DconsoleHandler
> +[logger_connector]
> +level=3DINFO
> +handlers=3DconnectorHandler
> +formatter=3DLogFormatter
> +qualname=3Dconnector
> +[logger_storage]
> +level=3DINFO
> +handlers=3DstorageHandler
> +formatter=3DLogFormatter
> +qualname=3Dstorage
> +[logger_tb_connection]
> +level=3DINFO
> +handlers=3Dtb_connectionHandler
> +formatter=3DLogFormatter
> +qualname=3Dtb_connection
> +[logger_service]
> +level=3DINFO
> +handlers=3DserviceHandler
> +formatter=3DLogFormatter
> +qualname=3Dservice
> +[logger_converter]
> +level=3DINFO
> +handlers=3DconverterHandler
> +formatter=3DLogFormatter
> +qualname=3Dconverter
> +[logger_extension]
> +level=3DINFO
> +handlers=3DconnectorHandler
> +formatter=3DLogFormatter
> +qualname=3Dextension
> +[handler_consoleHandler]
> +class=3DStreamHandler
> +level=3DINFO
> +formatter=3DLogFormatter
> +args=3D(sys.stdout,)
> +[handler_connectorHandler]
> +level=3DINFO
> +class=3Dlogging.handlers.TimedRotatingFileHandler
> +formatter=3DLogFormatter
> +args=3D("./logs/connector.log", "d", 1, 7,)
> +[handler_storageHandler]
> +level=3DINFO
> +class=3Dlogging.handlers.TimedRotatingFileHandler
> +formatter=3DLogFormatter
> +args=3D("./logs/storage.log", "d", 1, 7,)
> +[handler_serviceHandler]
> +level=3DINFO
> +class=3Dlogging.handlers.TimedRotatingFileHandler
> +formatter=3DLogFormatter
> +args=3D("./logs/service.log", "d", 1, 7,)
> +[handler_converterHandler]
> +level=3DINFO
> +class=3Dlogging.handlers.TimedRotatingFileHandler
> +formatter=3DLogFormatter
> +args=3D("./logs/converter.log", "d", 1, 3,)
> +[handler_extensionHandler]
> +level=3DINFO
> +class=3Dlogging.handlers.TimedRotatingFileHandler
> +formatter=3DLogFormatter
> +args=3D("./logs/extension.log", "d", 1, 3,)
> +[handler_tb_connectionHandler]
> +level=3DINFO
> +class=3Dlogging.handlers.TimedRotatingFileHandler
> +formatter=3DLogFormatter
> +args=3D("./logs/tb_connection.log", "d", 1, 3,)
> +[formatter_LogFormatter]
> +format=3D"%(asctime)s - %(levelname)s - [%(filename)s] - %(module)s -
> %(lineno)d - %(message)s"
> +datefmt=3D"%Y-%m-%d %H:%M:%S"
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
odbus.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
odbus.json
> new file mode 100755
> index 0000000000..479d8aa4d0
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
odbus.json
> @@ -0,0 +1,169 @@
> +{
> +  "server": {
> +    "type": "tcp",
> +    "host": "127.0.0.1",
> +    "port": 5020,
> +    "timeout": 35,
> +    "method": "socket",
> +    "byteOrder": "BIG",
> +    "devices": [
> +      {
> +        "unitId": 1,
> +        "deviceName": "Temp Sensor",
> +        "attributesPollPeriod": 5000,
> +        "timeseriesPollPeriod": 5000,
> +        "sendDataOnlyOnChange": true,
> +        "attributes": [
> +          {
> +            "tag": "string_read",
> +            "type": "string",
> +            "functionCode": 4,
> +            "objectsCount": 4,
> +            "address": 1
> +          },
> +          {
> +            "tag": "bits_read",
> +            "type": "bits",
> +            "functionCode": 4,
> +            "objectsCount": 1,
> +            "address": 5
> +          },
> +          {
> +            "tag": "8int_read",
> +            "type": "8int",
> +            "functionCode": 4,
> +            "objectsCount": 1,
> +            "address": 6
> +          },
> +          {
> +            "tag": "16int_read",
> +            "type": "16int",
> +            "functionCode": 4,
> +            "objectsCount": 1,
> +            "address": 7
> +          },
> +          {
> +            "tag": "32int_read_divider",
> +            "type": "32int",
> +            "functionCode": 4,
> +            "objectsCount": 2,
> +            "address": 8,
> +            "divider": 10
> +          },
> +          {
> +            "tag": "8int_read_multiplier",
> +            "type": "8int",
> +            "functionCode": 4,
> +            "objectsCount": 1,
> +            "address": 10,
> +            "multiplier": 10
> +          },
> +          {
> +            "tag": "32int_read",
> +            "type": "32int",
> +            "functionCode": 4,
> +            "objectsCount": 2,
> +            "address": 11
> +          },
> +          {
> +            "tag": "64int_read",
> +            "type": "64int",
> +            "functionCode": 4,
> +            "objectsCount": 4,
> +            "address": 13
> +          }
> +      ],
> +      "timeseries": [
> +          {
> +            "tag": "8uint_read",
> +            "type": "8uint",
> +            "functionCode": 4,
> +            "objectsCount": 1,
> +            "address": 17
> +          },
> +          {
> +            "tag": "16uint_read",
> +            "type": "16uint",
> +            "functionCode": 4,
> +            "objectsCount": 2,
> +            "address": 18
> +          },
> +          {
> +            "tag": "32uint_read",
> +            "type": "32uint",
> +            "functionCode": 4,
> +            "objectsCount": 4,
> +            "address": 20
> +          },
> +          {
> +            "tag": "64uint_read",
> +            "type": "64uint",
> +            "functionCode": 4,
> +            "objectsCount": 1,
> +            "address": 24
> +          },
> +          {
> +            "tag": "16float_read",
> +            "type": "16float",
> +            "functionCode": 4,
> +            "objectsCount": 1,
> +            "address": 25
> +          },
> +          {
> +            "tag": "32float_read",
> +            "type": "32float",
> +            "functionCode": 4,
> +            "objectsCount": 2,
> +            "address": 26
> +          },
> +          {
> +            "tag": "64float_read",
> +            "type": "64float",
> +            "functionCode": 4,
> +            "objectsCount": 4,
> +            "address": 28
> +          }
> +        ],
> +        "attributeUpdates": [
> +          {
> +            "tag": "shared_attribute_write",
> +            "type": "32int",
> +            "functionCode": 6,
> +            "objectsCount": 2,
> +            "address": 29
> +          }
> +        ],
> +        "rpc": [
> +          {
> +            "tag": "setValue",
> +            "type": "bits",
> +            "functionCode": 5,
> +            "objectsCount": 1,
> +            "address": 31
> +          },
> +          {
> +            "tag": "getValue",
> +            "type": "bits",
> +            "functionCode": 1,
> +            "objectsCount": 1,
> +            "address": 31
> +          },
> +          {
> +            "tag": "setCPUFanSpeed",
> +            "type": "32int",
> +            "functionCode": 16,
> +            "objectsCount": 2,
> +            "address": 33
> +          },
> +          {
> +            "tag":"getCPULoad",
> +            "type": "32int",
> +            "functionCode": 4,
> +            "objectsCount": 2,
> +            "address": 35
> +          }
> +        ]
> +      }
> +    ]
> +  }
> +}
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
odbus_serial.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
odbus_serial.json
> new file mode 100755
> index 0000000000..19b38e3f7b
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
odbus_serial.json
> @@ -0,0 +1,29 @@
> +{
> +  "server": {
> +    "name": "Modbus Default Server",
> +    "type": "serial",
> +    "method": "rtu",
> +    "port": "/dev/ttyUSB0",
> +    "baudrate": 19200,
> +    "timeout": 35,
> +    "devices": [
> +      {
> +        "unitId": 1,
> +        "deviceName": "Temp Sensor",
> +        "attributesPollPeriod": 5000,
> +        "timeseriesPollPeriod": 5000,
> +        "sendDataOnlyOnChange": true,
> +        "attributes": [
> +          {
> +            "byteOrder": "BIG",
> +            "tag": "test",
> +            "type": "long",
> +            "functionCode": 4,
> +            "registerCount": 1,
> +            "address": 4
> +          }
> +        ]
> +      }
> +    ]
> +  }
> +}
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
qtt.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
qtt.json
> new file mode 100755
> index 0000000000..6b78a7cec9
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/m=
qtt.json
> @@ -0,0 +1,132 @@
> +{
> +  "broker": {
> +    "name":"Default Local Broker",
> +    "host":"127.0.0.1",
> +    "port":1883,
> +    "clientId": "ThingsBoard_gateway",
> +    "security": {
> +      "type": "basic",
> +      "username": "user",
> +      "password": "password"
> +    }
> +  },
> +  "mapping": [
> +    {
> +      "topicFilter": "/sensor/data",
> +      "converter": {
> +        "type": "json",
> +        "deviceNameJsonExpression": "${serialNumber}",
> +        "deviceTypeJsonExpression": "${sensorType}",
> +        "timeout": 60000,
> +        "attributes": [
> +          {
> +            "type": "string",
> +            "key": "model",
> +            "value": "${sensorModel}"
> +          },
> +          {
> +            "type": "string",
> +            "key": "${sensorModel}",
> +            "value": "on"
> +          }
> +        ],
> +        "timeseries": [
> +          {
> +            "type": "double",
> +            "key": "temperature",
> +            "value": "${temp}"
> +          },
> +          {
> +            "type": "double",
> +            "key": "humidity",
> +            "value": "${hum}"
> +          }
> +        ]
> +      }
> +    },
> +    {
> +      "topicFilter": "/sensor/+/data",
> +      "converter": {
> +        "type": "json",
> +        "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/data)"=
,
> +        "deviceTypeTopicExpression": "Thermometer",
> +        "timeout": 60000,
> +        "attributes": [
> +          {
> +            "type": "string",
> +            "key": "model",
> +            "value": "${sensorModel}"
> +          }
> +        ],
> +        "timeseries": [
> +          {
> +            "type": "double",
> +            "key": "temperature",
> +            "value": "${temp}"
> +          },
> +          {
> +            "type": "double",
> +            "key": "humidity",
> +            "value": "${hum}"
> +          }
> +        ]
> +      }
> +    },
> +    {
> +      "topicFilter": "/custom/sensors/+",
> +      "converter": {
> +        "type": "custom",
> +        "extension": "CustomMqttUplinkConverter",
> +        "extension-config": {
> +            "temperatureBytes" : 2,
> +            "humidityBytes" :  2,
> +            "batteryLevelBytes" : 1
> +        }
> +      }
> +    }
> +  ],
> +  "connectRequests": [
> +    {
> +      "topicFilter": "sensor/connect",
> +      "deviceNameJsonExpression": "${SerialNumber}"
> +    },
> +    {
> +      "topicFilter": "sensor/+/connect",
> +      "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/connect)=
"
> +    }
> +  ],
> +  "disconnectRequests": [
> +    {
> +      "topicFilter": "sensor/disconnect",
> +      "deviceNameJsonExpression": "${SerialNumber}"
> +    },
> +    {
> +      "topicFilter": "sensor/+/disconnect",
> +      "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/disconne=
ct)"
> +    }
> +  ],
> +  "attributeUpdates": [
> +    {
> +      "deviceNameFilter": "SmartMeter.*",
> +      "attributeFilter": "uploadFrequency",
> +      "topicExpression": "sensor/${deviceName}/${attributeKey}",
> +      "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
> +    }
> +  ],
> +  "serverSideRpc": [
> +    {
> +      "deviceNameFilter": ".*",
> +      "methodFilter": "echo",
> +      "requestTopicExpression":
> "sensor/${deviceName}/request/${methodName}/${requestId}",
> +      "responseTopicExpression":
> "sensor/${deviceName}/response/${methodName}/${requestId}",
> +      "responseTimeout": 10000,
> +      "valueExpression": "${params}"
> +    },
> +    {
> +      "deviceNameFilter": ".*",
> +      "methodFilter": "no-reply",
> +      "requestTopicExpression":
> "sensor/${deviceName}/request/${methodName}/${requestId}",
> +      "valueExpression": "${params}"
> +    }
> +  ]
> +}
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/o=
dbc.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/o=
dbc.json
> new file mode 100644
> index 0000000000..c93992a262
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/o=
dbc.json
> @@ -0,0 +1,54 @@
> +{
> +    "connection": {
> +      "str":
> "Driver=3D{PostgreSQL};Server=3Dlocalhost;Port=3D5432;Database=3Dthingsb=
oard;Uid=3Dpostgres;Pwd=3Dpostgres;",
> +      "attributes": {
> +        "autocommit": true,
> +        "timeout": 0
> +      },
> +      "encoding": "utf-8",
> +      "decoding": {
> +        "char": "utf-8",
> +        "wchar": "utf-8",
> +        "metadata": "utf-16le"
> +      },
> +      "reconnect": true,
> +      "reconnectPeriod": 60
> +    },
> +    "pyodbc": {
> +      "pooling": false
> +    },
> +    "polling": {
> +      "query": "SELECT bool_v, str_v, dbl_v, long_v, entity_id, ts FROM
> ts_kv WHERE ts > ? ORDER BY ts ASC LIMIT 10",
> +      "period": 10,
> +      "iterator": {
> +        "column": "ts",
> +        "query": "SELECT MIN(ts) - 1 FROM ts_kv",
> +        "persistent": false
> +      }
> +    },
> +    "mapping": {
> +      "device": {
> +        "type": "postgres",
> +        "name": "'ODBC ' + entity_id"
> +      },
> +      "sendDataOnlyOnChange": false,
> +      "attributes": "*",
> +      "timeseries": [
> +        {
> +          "name": "value",
> +          "value": "[i for i in [str_v, long_v, dbl_v,bool_v] if i is n=
ot
> None][0]"
> +        }
> +      ]
> +    },
> +    "serverSideRpc": {
> +      "enableUnknownRpc": false,
> +      "overrideRpcConfig": true,
> +      "methods": [
> +        "procedureOne",
> +        {
> +          "name": "procedureTwo",
> +          "args": [ "One", 2, 3.0 ]
> +        }
> +      ]
> +    }
> +  }
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/o=
pcua.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/o=
pcua.json
> new file mode 100755
> index 0000000000..1deed7d524
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/o=
pcua.json
> @@ -0,0 +1,49 @@
> +{
> +  "server": {
> +    "name": "OPC-UA Default Server",
> +    "url": "localhost:4840/freeopcua/server/",
> +    "timeoutInMillis": 5000,
> +    "scanPeriodInMillis": 5000,
> +    "disableSubscriptions":false,
> +    "subCheckPeriodInMillis": 100,
> +    "showMap": false,
> +    "security": "Basic128Rsa15",
> +    "identity": {
> +      "type": "anonymous"
> +    },
> +    "mapping": [
> +      {
> +        "deviceNodePattern": "Root\\.Objects\\.Device1",
> +        "deviceNamePattern": "Device
> ${Root\\.Objects\\.Device1\\.serialNumber}",
> +        "attributes": [
> +          {
> +            "key": "temperature =C2=B0C",
> +            "path": "${ns=3D2;i=3D5}"
> +          }
> +        ],
> +        "timeseries": [
> +          {
> +            "key": "humidity",
> +            "path":
> "${Root\\.Objects\\.Device1\\.TemperatureAndHumiditySensor\\.Humidity}"
> +          },
> +          {
> +            "key": "batteryLevel",
> +            "path": "${Battery\\.batteryLevel}"
> +          }
> +        ],
> +        "rpc_methods": [
> +          {
> +            "method": "multiply",
> +            "arguments": [2, 4]
> +          }
> +        ],
> +        "attributes_updates": [
> +          {
> +            "attributeOnThingsBoard": "deviceName",
> +            "attributeOnDevice": "Root\\.Objects\\.Device1\\.serialNumb=
er"
> +          }
> +        ]
> +      }
> +    ]
> +  }
> +}
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/r=
equest.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/r=
equest.json
> new file mode 100644
> index 0000000000..43237a7dc0
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/r=
equest.json
> @@ -0,0 +1,146 @@
> +"job": "leader"
> +},
> +"allowRedirects": true,
> +"timeout": 0.5,
> +"scanPeriod": 5,
> +"converter": {
> +  "type": "json",
> +  "deviceNameJsonExpression": "SD8500",
> +  "deviceTypeJsonExpression": "SD",
> +  "attributes": [
> +    {
> +      "key": "serialNumber",
> +      "type": "string",
> +      "value": "${serial}"
> +    }
> +  ],
> +  "telemetry": [
> +    {
> +      "key": "Maintainer",
> +      "type": "string",
> +      "value": "${Developer}"
> +    }
> +  ]
> +}
> +},
> +{
> +"url": "get_info",
> +"httpMethod": "GET",
> +"httpHeaders": {
> +  "ACCEPT": "application/json"
> +},
> +"allowRedirects": true,
> +"timeout": 0.5,
> +"scanPeriod": 100,
> +"converter": {
> +  "type": "custom",
> +  "deviceNameJsonExpression": "SD8500",
> +  "deviceTypeJsonExpression": "SD",
> +  "extension": "CustomRequestUplinkConverter",
> +  "extension-config": [
> +    {
> +      "key": "Totaliser",
> +      "type": "float",
> +      "fromByte": 0,
> +      "toByte": 4,
> +      "byteorder": "big",
> +      "signed": true,
> +      "multiplier": 1
> +    },
> +    {
> +      "key": "Flow",
> +      "type": "int",
> +      "fromByte": 4,
> +      "toByte": 6,
> +      "byteorder": "big",
> +      "signed": true,
> +      "multiplier": 0.01
> +    },
> +    {
> +      "key": "Temperature",
> +      "type": "int",
> +      "fromByte": 8,
> +      "toByte": 10,
> +      "byteorder": "big",
> +      "signed": true,
> +      "multiplier": 0.01
> +    },
> +    {
> +      "key": "Pressure",
> +      "type": "int",
> +      "fromByte": 12,
> +      "toByte": 14,
> +      "byteorder": "big",
> +      "signed": true,
> +      "multiplier": 0.01
> +    },
> +    {
> +      "key": "deviceStatus",
> +      "type": "int",
> +      "byteAddress": 15,
> +      "fromBit": 4,
> +      "toBit": 8,
> +      "byteorder": "big",
> +      "signed": false
> +    },
> +    {
> +      "key": "OUT2",
> +      "type": "int",
> +      "byteAddress": 15,
> +      "fromBit": 1,
> +      "toBit": 2,
> +      "byteorder": "big"
> +    },
> +    {
> +      "key": "OUT1",
> +      "type": "int",
> +      "byteAddress": 15,
> +      "fromBit": 0,
> +      "toBit": 1,
> +      "byteorder": "big"
> +    }
> +  ]
> +}
> +}
> +],
> +"attributeUpdates": [
> +{
> +  "httpMethod": "POST",
> +  "httpHeaders": {
> +    "CONTENT-TYPE": "application/json"
> +  },
> +  "timeout": 0.5,
> +  "tries": 3,
> +  "allowRedirects": true,
> +  "deviceNameFilter": "SD.*",
> +  "attributeFilter": "send_data",
> +  "requestUrlExpression": "sensor/${deviceName}/${attributeKey}",
> +  "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
> +}
> +],
> +"serverSideRpc": [
> +{
> +"deviceNameFilter": ".*",
> +"methodFilter": "echo",
> +"requestUrlExpression":
> "sensor/${deviceName}/request/${methodName}/${requestId}",
> +"responseTimeout": 1,
> +"httpMethod": "GET",
> +"valueExpression": "${params}",
> +"timeout": 0.5,
> +"tries": 3,
> +"httpHeaders": {
> +  "Content-Type": "application/json"
> +}
> +},
> +{
> +"deviceNameFilter": ".*",
> +"methodFilter": "no-reply",
> +"requestUrlExpression":
> "sensor/${deviceName}/request/${methodName}/${requestId}",
> +"httpMethod": "POST",
> +"valueExpression": "${params}",
> +"httpHeaders": {
> +  "Content-Type": "application/json"
> +}
> +}
> +]
> +}
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/r=
est.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/r=
est.json
> new file mode 100644
> index 0000000000..be6c6ff18e
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/r=
est.json
> @@ -0,0 +1,152 @@
> +{
> +    "host": "127.0.0.1",
> +    "port": "5000",
> +    "mapping":[
> +      {
> +        "endpoint": "/device1",
> +        "HTTPMethods": [
> +          "POST"
> +        ],
> +        "security":
> +        {
> +          "type": "basic",
> +          "username": "user",
> +          "password": "passwd"
> +        },
> +        "converter": {
> +          "type": "json",
> +          "deviceNameExpression": "Device ${name}",
> +          "deviceTypeExpression": "default",
> +          "attributes": [
> +            {
> +              "type": "string",
> +              "key": "model",
> +              "value": "${sensorModel}"
> +            }
> +          ],
> +          "timeseries": [
> +            {
> +              "type": "double",
> +              "key": "${sensorModel}",
> +              "value": "${temp}"
> +            },
> +            {
> +              "type": "double",
> +              "key": "humidity",
> +              "value": "${hum}"
> +            }
> +          ]
> +        }
> +      },
> +      {
> +        "endpoint": "/anon1",
> +        "HTTPMethods": [
> +          "GET",
> +          "POST"
> +        ],
> +        "security":
> +        {
> +          "type": "anonymous"
> +        },
> +        "converter": {
> +          "type": "json",
> +          "deviceNameExpression": "Device 2",
> +          "deviceTypeExpression": "default",
> +          "attributes": [
> +            {
> +              "type": "string",
> +              "key": "model",
> +              "value": "Model2"
> +            }
> +          ],
> +          "timeseries": [
> +            {
> +              "type": "double",
> +              "key": "temperature",
> +              "value": "${temp}"
> +            },
> +            {
> +              "type": "double",
> +              "key": "humidity",
> +              "value": "${hum}"
> +            }
> +          ]
> +        }
> +      },
> +      {
> +        "endpoint": "/anon2",
> +        "HTTPMethods": [
> +          "POST"
> +        ],
> +        "security":
> +        {
> +          "type": "anonymous"
> +        },
> +        "converter": {
> +          "type": "custom",
> +          "deviceNameExpression": "SuperAnonDevice",
> +          "deviceTypeExpression": "default",
> +          "extension": "CustomRestUplinkConverter",
> +          "extension-config": [
> +            {
> +            "key": "Totaliser",
> +            "datatype": "float",
> +            "fromByte": 0,
> +            "toByte": 4,
> +            "byteorder": "big",
> +            "signed": true,
> +            "multiplier": 1
> +            }]
> +        }
> +      }
> +    ],
> +    "attributeUpdates": [
> +        {
> +          "HTTPMethod": "POST",
> +          "SSLVerify": false,
> +          "httpHeaders": {
> +            "CONTENT-TYPE": "application/json"
> +          },
> +          "security": {
> +            "type": "basic",
> +            "username": "user",
> +            "password": "passwd"
> +          },
> +          "timeout": 0.5,
> +          "tries": 3,
> +          "allowRedirects": true,
> +          "deviceNameFilter": ".*REST$",
> +          "attributeFilter": "data",
> +          "requestUrlExpression": "sensor/${deviceName}/${attributeKey}=
",
> +          "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\=
"}"
> +        }
> +    ],
> +    "serverSideRpc": [
> +      {
> +        "deviceNameFilter": ".*",
> +        "methodFilter": "echo",
> +        "requestUrlExpression": "http://127.0.0.1:5001/${deviceName}",
> +        "responseTimeout": 1,
> +        "HTTPMethod": "GET",
> +        "valueExpression": "${params}",
> +        "timeout": 0.5,
> +        "tries": 3,
> +        "httpHeaders": {
> +          "Content-Type": "application/json"
> +        },
> +        "security": {
> +          "type": "anonymous"
> +        }
> +      },
> +      {
> +        "deviceNameFilter": ".*",
> +        "methodFilter": "no-reply",
> +        "requestUrlExpression":
> "sensor/${deviceName}/request/${methodName}/${requestId}",
> +        "HTTPMethod": "POST",
> +        "valueExpression": "${params}",
> +        "httpHeaders": {
> +          "Content-Type": "application/json"
> +        }
> +      }
> +    ]
> +  }
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/s=
nmp.json
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/s=
nmp.json
> new file mode 100644
> index 0000000000..b4ddb42645
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/s=
nmp.json
> @@ -0,0 +1,138 @@
> +{
> +    "devices": [
> +      {
> +        "deviceName": "SNMP router",
> +        "deviceType": "snmp",
> +        "ip": "snmp.live.gambitcommunications.com",
> +        "port": 161,
> +        "pollPeriod": 5000,
> +        "community": "public",
> +        "attributes": [
> +          {
> +            "key": "ReceivedFromGet",
> +            "method": "get",
> +            "oid": "1.3.6.1.2.1.1.1.0",
> +            "timeout": 6
> +          },
> +          {
> +            "key": "ReceivedFromMultiGet",
> +            "method": "multiget",
> +            "oid": [
> +              "1.3.6.1.2.1.1.1.0",
> +              "1.3.6.1.2.1.1.2.0"
> +            ],
> +            "timeout": 6
> +          },
> +          {
> +            "key": "ReceivedFromGetNext",
> +            "method": "getnext",
> +            "oid": "1.3.6.1.2.1.1.1.0",
> +            "timeout": 6
> +          },
> +          {
> +            "key": "ReceivedFromMultiWalk",
> +            "method": "multiwalk",
> +            "oid": [
> +              "1.3.6.1.2.1.1.1.0",
> +              "1.3.6.0.1.2.1"
> +            ]
> +          },
> +          {
> +            "key": "ReceivedFromBulkWalk",
> +            "method": "bulkwalk",
> +            "oid": [
> +              "1.3.6.1.2.1.1.1.0",
> +              "1.3.6.1.2.1.1.2.0"
> +            ]
> +          },
> +          {
> +            "key": "ReceivedFromBulkGet",
> +            "method": "bulkget",
> +            "scalarOid": [
> +              "1.3.6.1.2.1.1.1.0",
> +              "1.3.6.1.2.1.1.2.0"
> +            ],
> +            "repeatingOid": [
> +              "1.3.6.1.2.1.1.1.0",
> +              "1.3.6.1.2.1.1.2.0"
> +            ],
> +            "maxListSize": 10
> +          }
> +        ],
> +        "telemetry": [
> +          {
> +            "key": "ReceivedFromWalk",
> +            "community": "private",
> +            "method": "walk",
> +            "oid": "1.3.6.1.2.1.1.1.0"
> +          },
> +          {
> +            "key": "ReceivedFromTable",
> +            "method": "table",
> +            "oid": "1.3.6.1.2.1.1"
> +          }
> +        ],
> +        "attributeUpdateRequests": [
> +          {
> +            "attributeFilter": "dataToSet",
> +            "method": "set",
> +            "oid": "1.3.6.1.2.1.1.1.0"
> +          },
> +          {
> +            "attributeFilter": "dataToMultiSet",
> +            "method": "multiset",
> +            "mappings": {
> +              "1.2.3": "10",
> +              "2.3.4": "${attribute}"
> +            }
> +          }
> +        ],
> +        "serverSideRpcRequests": [
> +          {
> +            "requestFilter": "setData",
> +            "method": "set",
> +            "oid": "1.3.6.1.2.1.1.1.0"
> +          },
> +          {
> +            "requestFilter": "multiSetData",
> +            "method": "multiset"
> +          },
> +          {
> +            "requestFilter": "getData",
> +            "method": "get",
> +            "oid": "1.3.6.1.2.1.1.1.0"
> +          },
> +          {
> +            "requestFilter": "runBulkWalk",
> +            "method": "bulkwalk",
> +            "oid": [
> +              "1.3.6.1.2.1.1.1.0",
> +              "1.3.6.1.2.1.1.2.0"
> +            ]
> +          }
> +        ]
> +      },
> +      {
> +        "deviceName": "SNMP router",
> +        "deviceType": "snmp",
> +        "ip": "127.0.0.1",
> +        "pollPeriod": 5000,
> +        "community": "public",
> +        "converter": "CustomSNMPConverter",
> +        "attributes": [
> +          {
> +            "key": "ReceivedFromGetWithCustomConverter",
> +            "method": "get",
> +            "oid": "1.3.6.1.2.1.1.1.0"
> +          }
> +        ],
> +        "telemetry": [
> +          {
> +            "key": "ReceivedFromTableWithCustomConverter",
> +            "method": "table",
> +            "oid": "1.3.6.1.2.1.1.1.0"
> +          }
> +        ]
> +      }
> +    ]
> +  }
> \ No newline at end of file
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/t=
b_gateway.yaml
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/t=
b_gateway.yaml
> new file mode 100755
> index 0000000000..e3eb8f1fc7
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/t=
b_gateway.yaml
> @@ -0,0 +1,66 @@
> +thingsboard:
> +  host: demo.thingsboard.io
> +  port: 1883
> +  remoteConfiguration: false
> +  security:
> +    accessToken: PUT_YOUR_GW_ACCESS_TOKEN_HERE
> +storage:
> +  type: memory
> +  read_records_count: 100
> +  max_records_count: 100000
> +#  type: file
> +#  data_folder_path: ./data/
> +#  max_file_count: 10
> +#  max_read_records_count: 10
> +#  max_records_per_file: 10000
> +connectors:
> +  -
> +    name: MQTT Broker Connector
> +    type: mqtt
> +    configuration: mqtt.json
> +
> +#  -
> +#    name: Modbus Connector
> +#    type: modbus
> +#    configuration: modbus.json
> +#
> +#  -
> +#    name: Modbus Connector
> +#    type: modbus
> +#    configuration: modbus_serial.json
> +#
> +#  -
> +#    name: OPC-UA Connector
> +#    type: opcua
> +#    configuration: opcua.json
> +#
> +#  -
> +#    name: BLE Connector
> +#    type: ble
> +#    configuration: ble.json
> +#
> +#  -
> +#    name: REQUEST Connector
> +#    type: request
> +#    configuration: request.json
> +#
> +#  -
> +#    name: CAN Connector
> +#    type: can
> +#    configuration: can.json
> +#
> +#  -
> +#    name: BACnet Connector
> +#    type: bacnet
> +#    configuration: bacnet.json
> +#
> +#  -
> +#    name: ODBC Connector
> +#    type: odbc
> +#    configuration: odbc.json
> +#
> +#  -
> +#    name: Custom Serial Connector
> +#    type: serial
> +#    configuration: custom_serial.json
> +#    class: CustomSerialConnector
> diff --git
> a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/t=
hingsboard-gateway.service
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/t=
hingsboard-gateway.service
> new file mode 100644
> index 0000000000..5dd352a553
> --- /dev/null
> +++
> b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/t=
hingsboard-gateway.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description =3D Systemd service for Thingsboard Gateway
> +After       =3D network.target
> +
> +[Service]
> +ExecStart   =3D /usr/bin/python3 /usr/bin/thingsboard-gateway
> +ExecStop    =3D /bin/kill -INT $MAINPID
> +ExecReload  =3D /bin/kill -TERM $MAINPID
> +Restart     =3D always
> +Type        =3D simple
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
> b/meta-oe/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
> new file mode 100644
> index 0000000000..2f0ef16c80
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/
> thingsboard-gateway_2.5.2.bb
> @@ -0,0 +1,68 @@
> +SUMMARY =3D "Open-source IoT platform for data collection, processing,
> visualization, and device management"
> +DESCRIPTION =3D "\
> +The Thingsboard IoT Gateway is an open-source solution that allows you =
\
> +to integrate devices connected to legacy and third-party systems with
> Thingsboard."
> +HOMEPAGE =3D "https://thingsboard.io/"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a=
0096b10"
> +
> +SRC_URI[md5sum] =3D "469c8b5cd1c16c20ef40f0a97a3a0fda"
> +SRC_URI[sha256sum] =3D
> "b328f4e315c3541ac80a4931974a34a81afe4d1f382f48e8604669a55816c0d7"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE =3D "thingsboard-gateway"
> +
> +RDEPENDS_${PN} +=3D " python3-jsonpath-rw \
> +                    python3-regex \
> +                    python3-paho-mqtt \
> +                    python3-pyyaml \
> +                    python3-simplejson \
> +                    python3-requests \
> +                    python3-pip \
> +                    python3-pyrsistent \
> +"
> +
> +SRC_URI +=3D "file://bacnet.json \
> +            file://ble.json \
> +            file://can.json \
> +            file://custom_serial.json \
> +            file://modbus.json \
> +            file://modbus_serial.json \
> +            file://mqtt.json \
> +            file://opcua.json \
> +            file://odbc.json \
> +            file://request.json \
> +            file://rest.json \
> +            file://snmp.json \
> +            file://tb_gateway.yaml \
> +            file://logs.conf \
> +            file://thingsboard-gateway.service \
> +            "
> +
> +
> +inherit systemd
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "thingsboard-gateway.service"
> +
> +FILES_${PN} +=3D "/etc \
> +                /lib \
> +                /usr \
> +"
> +
> +do_install_append(){
> +
> +    install -d ${D}${sysconfdir}/thingsboard-gateway/config
> +
> +    for file in $(find ${WORKDIR} -maxdepth 1 -type f -name *.json); do
> +        install -m 0644 "$file"
> ${D}${sysconfdir}/thingsboard-gateway/config
> +    done
> +
> +    install -m 0644 ${WORKDIR}/tb_gateway.yaml
> ${D}${sysconfdir}/thingsboard-gateway/config
> +    install -m 0644 ${WORKDIR}/logs.conf
> ${D}${sysconfdir}/thingsboard-gateway/config
> +
> +    install -d ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${WORKDIR}/thingsboard-gateway.service
>  ${D}${systemd_system_unitdir}/thingsboard-gateway.service
> +}
> \ No newline at end of file
> --
> 2.29.2
>
>=20
>
>

--00000000000086e3f105b473003b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">python3-jsonpath-rw=C2=A0dependency was a=
dded to meta-python, but meta-oe doesn&#39;t depend on meta-python, so eith=
er=C2=A0<span style=3D"color:rgb(51,51,51);white-space:pre-wrap">python3-js=
onpath-rw needs to be moved to meta-oe (if it doesn&#39;t depend on other s=
tuff from meta-python) or thingsboard-gateway needs to be moved to meta-pyt=
hon.</span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Nov 18, 2020 at 12:04 AM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: &quot;hasan.men&quot; &lt;<a hr=
ef=3D"mailto:hasan.men@bosphorusiss.com" target=3D"_blank">hasan.men@bospho=
rusiss.com</a>&gt;<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../thingsboard-gateway/bacnet.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 58 ++++++<br>
=C2=A0.../thingsboard-gateway/ble.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 53 ++++++<br>
=C2=A0.../thingsboard-gateway/can.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 89 +++++++++<br>
=C2=A0.../thingsboard-gateway/custom_serial.json=C2=A0 =C2=A0 |=C2=A0 33 +=
+++<br>
=C2=A0.../thingsboard-gateway/logs.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 77 ++++++++<br>
=C2=A0.../thingsboard-gateway/modbus.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 169 ++++++++++++++++++<br>
=C2=A0.../thingsboard-gateway/modbus_serial.json=C2=A0 =C2=A0 |=C2=A0 29 +=
++<br>
=C2=A0.../thingsboard-gateway/mqtt.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 132 ++++++++++++++<br>
=C2=A0.../thingsboard-gateway/odbc.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 54 ++++++<br>
=C2=A0.../thingsboard-gateway/opcua.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 49 +++++<br>
=C2=A0.../thingsboard-gateway/request.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 146 +++++++++++++++<br>
=C2=A0.../thingsboard-gateway/rest.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 152 ++++++++++++++++<br>
=C2=A0.../thingsboard-gateway/snmp.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 138 ++++++++++++++<br>
=C2=A0.../thingsboard-gateway/tb_gateway.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 66 +++++++<br>
=C2=A0.../thingsboard-gateway.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 13 ++<br>
=C2=A0.../<a href=3D"http://thingsboard-gateway_2.5.2.bb" rel=3D"noreferre=
r" target=3D"_blank">thingsboard-gateway_2.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 68 +++++++<br>
=C2=A016 files changed, 1326 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/bacnet.json<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/ble.json<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/can.json<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/custom_serial.json<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/logs.conf<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/modbus.json<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/modbus_serial.json<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/mqtt.json<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/odbc.json<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/opcua.json<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/request.json<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/rest.json<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/snmp.json<br>
=C2=A0create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/tb_gateway.yaml<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/thingsboard-gateway.service<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/=
<a href=3D"http://thingsboard-gateway_2.5.2.bb" rel=3D"noreferrer" target=
=3D"_blank">thingsboard-gateway_2.5.2.bb</a><br>
<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/bacnet.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thin=
gsboard-gateway/bacnet.json<br>
new file mode 100644<br>
index 0000000000..e36a2165d1<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/bacnet.json<br>
@@ -0,0 +1,58 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;general&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;objectName&quot;: &quot;TB_gateway&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: &quot;<a href=3D"http://192.168=
.188.181:1052" rel=3D"noreferrer" target=3D"_blank">192.168.188.181:1052</a=
>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;objectIdentifier&quot;: 599,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;maxApduLengthAccepted&quot;: 1024,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;segmentationSupported&quot;: &quot;segmentedBo=
th&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;vendorIdentifier&quot;: 15<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;devices&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceName&quot;: &quot;BACnet Device $=
{objectName}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceType&quot;: &quot;default&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: &quot;<a href=3D"http://=
192.168.188.181:10520" rel=3D"noreferrer" target=3D"_blank">192.168.188.181=
:10520</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pollPeriod&quot;: 10000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;temperat=
ure&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectId&quot;: &quot;ana=
logOutput:1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;propertyId&quot;: &quot;p=
resentValue&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;state&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;bool&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectId&quot;: &quot;bin=
aryValue:1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;propertyId&quot;: &quot;p=
resentValue&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeUpdates&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;brightne=
ss&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestType&quot;: &quot;=
writeProperty&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectId&quot;: &quot;ana=
logOutput:1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;propertyId&quot;: &quot;p=
resentValue&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;serverSideRpc&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;set_s=
tate&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestType&quot;: &quot;=
writeProperty&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestTimeout&quot;: 100=
00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectId&quot;: &quot;bin=
aryOutput:1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;propertyId&quot;: &quot;p=
resentValue&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;get_s=
tate&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestType&quot;: &quot;=
readProperty&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestTimeout&quot;: 100=
00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectId&quot;: &quot;bin=
aryOutput:1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;propertyId&quot;: &quot;p=
resentValue&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+=C2=A0 }<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/ble.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsb=
oard-gateway/ble.json<br>
new file mode 100755<br>
index 0000000000..2a5da3f41d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/ble.json<br>
@@ -0,0 +1,53 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;name&quot;: &quot;BLE Connector&quot;,<br>
+=C2=A0 =C2=A0 &quot;rescanIntervalSeconds&quot;: 100,<br>
+=C2=A0 =C2=A0 &quot;checkIntervalSeconds&quot;: 100,<br>
+=C2=A0 =C2=A0 &quot;scanTimeSeconds&quot;: 5,<br>
+=C2=A0 =C2=A0 &quot;passiveScanMode&quot;: true,<br>
+=C2=A0 =C2=A0 &quot;devices&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;Tempera=
ture and humidity sensor&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;MACAddress&quot;: &quot;4=
C:65:A8:DF:85:C0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;addrType&quot;: &quot;pub=
lic&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;telemetry&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;key&quot;: &quot;temperature&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;method&quot;: &quot;notify&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;characteristicUUID&quot;: &quot;226CAA55-6476-4566-7562-66734470666D&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;byteFrom&quot;: 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;byteTo&quot;: 6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;key&quot;: &quot;humidity&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;method&quot;: &quot;notify&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;characteristicUUID&quot;: &quot;226CAA55-6476-4566-7562-66734470666D&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;byteFrom&quot;: 9,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;byteTo&quot;: 13<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;key&quot;: &quot;name&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;characteristicUUID&quot;: &quot;00002A00-0000-1000-8000-00805F9B34FB&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;method&quot;: &quot;read&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;byteFrom&quot;: 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;byteTo&quot;: -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeUpdates&quot;: [=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;attributeOnThingsBoard&quot;: &quot;sharedName&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;characteristicUUID&quot;: &quot;00002A00-0000-1000-8000-00805F9B34FB&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;serverSideRpc&quot;: [<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;methodRPC&quot;: &quot;rpcMethod1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;withResponse&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;characteristicUUID&quot;: &quot;00002A00-0000-1000-8000-00805F9B34FB&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;methodProcessing&quot;: &quot;read&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+}<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/can.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsb=
oard-gateway/can.json<br>
new file mode 100644<br>
index 0000000000..b5cec0045a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/can.json<br>
@@ -0,0 +1,89 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;interface&quot;: &quot;socketcan&quot;,<br>
+=C2=A0 =C2=A0 &quot;channel&quot;: &quot;vcan0&quot;,<br>
+=C2=A0 =C2=A0 &quot;backend&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fd&quot;: true<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;reconnectPeriod&quot;: 5,<br>
+=C2=A0 =C2=A0 &quot;devices&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;Car&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sendDataOnlyOnChange&quot;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;enableUnknownRpc&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;strictEval&quot;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;isDriver=
DoorOpened&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nodeId&quot;: 41,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;command&quot;: &quot;2:2:=
big:8717&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;4:1:in=
t&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;expression&quot;: &quot;b=
ool(value &amp; 0b00000100)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;polling&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
once&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataInHex&quot;: &=
quot;AB CD AB CD&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;rpm&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nodeId&quot;: 1918,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isExtendedId&quot;: true,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;command&quot;: &quot;2:2:=
big:48059&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;4:2:bi=
g:int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;expression&quot;: &quot;v=
alue / 4&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;polling&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
always&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;period&quot;: 5,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataInHex&quot;: &=
quot;aaaa bbbb aaaa bbbb&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;milliage=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nodeId&quot;: 1918,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isExtendedId&quot;: true,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;4:2:li=
ttle:int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;expression&quot;: &quot;v=
alue * 10&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;polling&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
always&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;period&quot;: 30,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataInHex&quot;: &=
quot;aa bb cc dd ee ff aa bb&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeUpdates&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeOnThingsBoard&qu=
ot;: &quot;softwareVersion&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nodeId&quot;: 64,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isExtendedId&quot;: true,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataLength&quot;: 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataExpression&quot;: &qu=
ot;value + 5&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataByteorder&quot;: &quo=
t;little&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;serverSideRpc&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;sendS=
ameData&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nodeId&quot;: 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isExtendedId&quot;: true,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;isFd&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bitrateSwitch&quot;: true=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataInHex&quot;: &quot;aa=
 bb cc dd ee ff=C2=A0 =C2=A0 aa bb aa bb cc d ee ff&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;setLi=
ghtLevel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nodeId&quot;: 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataLength&quot;: 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataByteorder&quot;: &quo=
t;little&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataBefore&quot;: &quot;0=
0AA&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;setSp=
eed&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;nodeId&quot;: 16,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataAfter&quot;: &quot;01=
02&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dataExpression&quot;: &qu=
ot;userSpeed if maxAllowedSpeed &gt; userSpeed else maxAllowedSpeed&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+=C2=A0 }<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/custom_serial.json b/meta-oe/recipes-connectivity/thingsboard-gatew=
ay/thingsboard-gateway/custom_serial.json<br>
new file mode 100755<br>
index 0000000000..0aee5cb765<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/custom_serial.json<br>
@@ -0,0 +1,33 @@<br>
+{<br>
+=C2=A0 &quot;name&quot;: &quot;Custom serial connector&quot;,<br>
+=C2=A0 &quot;devices&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;CustomSerialDevice1&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;default&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;port&quot;: &quot;/dev/ttyUSB0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;baudrate&quot;: 9600,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: &quot;CustomSerialUplinkConve=
rter&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;telemetry&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;byte&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;humidity&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;untilDelimiter&quot;: &quot;\r&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;:[<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;SerialNumber&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fromByte&quot;: 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;toByte&quot;: -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;attributeUpdates&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeOnThingsBoard&quot;: &q=
uot;attr1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stringToDevice&quot;: &quot;valu=
e =3D ${attr1}\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ]<br>
+}<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/logs.conf b/meta-oe/recipes-connectivity/thingsboard-gateway/things=
board-gateway/logs.conf<br>
new file mode 100755<br>
index 0000000000..d66c2b84a8<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/logs.conf<br>
@@ -0,0 +1,77 @@<br>
+[loggers]<br>
+keys=3Droot, service, connector, converter, tb_connection, storage, exten=
sion<br>
+[handlers]<br>
+keys=3DconsoleHandler, serviceHandler, connectorHandler, converterHandler=
, tb_connectionHandler, storageHandler, extensionHandler<br>
+[formatters]<br>
+keys=3DLogFormatter<br>
+[logger_root]<br>
+level=3DERROR<br>
+handlers=3DconsoleHandler<br>
+[logger_connector]<br>
+level=3DINFO<br>
+handlers=3DconnectorHandler<br>
+formatter=3DLogFormatter<br>
+qualname=3Dconnector<br>
+[logger_storage]<br>
+level=3DINFO<br>
+handlers=3DstorageHandler<br>
+formatter=3DLogFormatter<br>
+qualname=3Dstorage<br>
+[logger_tb_connection]<br>
+level=3DINFO<br>
+handlers=3Dtb_connectionHandler<br>
+formatter=3DLogFormatter<br>
+qualname=3Dtb_connection<br>
+[logger_service]<br>
+level=3DINFO<br>
+handlers=3DserviceHandler<br>
+formatter=3DLogFormatter<br>
+qualname=3Dservice<br>
+[logger_converter]<br>
+level=3DINFO<br>
+handlers=3DconverterHandler<br>
+formatter=3DLogFormatter<br>
+qualname=3Dconverter<br>
+[logger_extension]<br>
+level=3DINFO<br>
+handlers=3DconnectorHandler<br>
+formatter=3DLogFormatter<br>
+qualname=3Dextension<br>
+[handler_consoleHandler]<br>
+class=3DStreamHandler<br>
+level=3DINFO<br>
+formatter=3DLogFormatter<br>
+args=3D(sys.stdout,)<br>
+[handler_connectorHandler]<br>
+level=3DINFO<br>
+class=3Dlogging.handlers.TimedRotatingFileHandler<br>
+formatter=3DLogFormatter<br>
+args=3D(&quot;./logs/connector.log&quot;, &quot;d&quot;, 1, 7,)<br>
+[handler_storageHandler]<br>
+level=3DINFO<br>
+class=3Dlogging.handlers.TimedRotatingFileHandler<br>
+formatter=3DLogFormatter<br>
+args=3D(&quot;./logs/storage.log&quot;, &quot;d&quot;, 1, 7,)<br>
+[handler_serviceHandler]<br>
+level=3DINFO<br>
+class=3Dlogging.handlers.TimedRotatingFileHandler<br>
+formatter=3DLogFormatter<br>
+args=3D(&quot;./logs/service.log&quot;, &quot;d&quot;, 1, 7,)<br>
+[handler_converterHandler]<br>
+level=3DINFO<br>
+class=3Dlogging.handlers.TimedRotatingFileHandler<br>
+formatter=3DLogFormatter<br>
+args=3D(&quot;./logs/converter.log&quot;, &quot;d&quot;, 1, 3,)<br>
+[handler_extensionHandler]<br>
+level=3DINFO<br>
+class=3Dlogging.handlers.TimedRotatingFileHandler<br>
+formatter=3DLogFormatter<br>
+args=3D(&quot;./logs/extension.log&quot;, &quot;d&quot;, 1, 3,)<br>
+[handler_tb_connectionHandler]<br>
+level=3DINFO<br>
+class=3Dlogging.handlers.TimedRotatingFileHandler<br>
+formatter=3DLogFormatter<br>
+args=3D(&quot;./logs/tb_connection.log&quot;, &quot;d&quot;, 1, 3,)<br>
+[formatter_LogFormatter]<br>
+format=3D&quot;%(asctime)s - %(levelname)s - [%(filename)s] - %(module)s =
- %(lineno)d - %(message)s&quot;<br>
+datefmt=3D&quot;%Y-%m-%d %H:%M:%S&quot;<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/modbus.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thin=
gsboard-gateway/modbus.json<br>
new file mode 100755<br>
index 0000000000..479d8aa4d0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/modbus.json<br>
@@ -0,0 +1,169 @@<br>
+{<br>
+=C2=A0 &quot;server&quot;: {<br>
+=C2=A0 =C2=A0 &quot;type&quot;: &quot;tcp&quot;,<br>
+=C2=A0 =C2=A0 &quot;host&quot;: &quot;127.0.0.1&quot;,<br>
+=C2=A0 =C2=A0 &quot;port&quot;: 5020,<br>
+=C2=A0 =C2=A0 &quot;timeout&quot;: 35,<br>
+=C2=A0 =C2=A0 &quot;method&quot;: &quot;socket&quot;,<br>
+=C2=A0 =C2=A0 &quot;byteOrder&quot;: &quot;BIG&quot;,<br>
+=C2=A0 =C2=A0 &quot;devices&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unitId&quot;: 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceName&quot;: &quot;Temp Sensor&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributesPollPeriod&quot;: 5000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseriesPollPeriod&quot;: 5000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sendDataOnlyOnChange&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;string_r=
ead&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;bits_rea=
d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;bits&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;8int_rea=
d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;8int&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;16int_re=
ad&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;16int&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;32int_re=
ad_divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;32int&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 2,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;divider&quot;: 10<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;8int_rea=
d_multiplier&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;8int&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;multiplier&quot;: 10<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;32int_re=
ad&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;32int&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 2,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;64int_re=
ad&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;64int&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 13<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;8uint_re=
ad&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;8uint&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 17<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;16uint_r=
ead&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;16uint&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 2,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 18<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;32uint_r=
ead&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;32uint&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 20<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;64uint_r=
ead&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;64uint&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 24<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;16float_=
read&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;16float=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 25<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;32float_=
read&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;32float=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 2,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 26<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;64float_=
read&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;64float=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 28<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeUpdates&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;shared_a=
ttribute_write&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;32int&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 6,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 2,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 29<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rpc&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;setValue=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;bits&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 5,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 31<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;getValue=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;bits&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 1,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 31<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;setCPUFa=
nSpeed&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;32int&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 16,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 2,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 33<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;:&quot;getCPULoa=
d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;32int&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;objectsCount&quot;: 2,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 35<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+=C2=A0 }<br>
+}<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/modbus_serial.json b/meta-oe/recipes-connectivity/thingsboard-gatew=
ay/thingsboard-gateway/modbus_serial.json<br>
new file mode 100755<br>
index 0000000000..19b38e3f7b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/modbus_serial.json<br>
@@ -0,0 +1,29 @@<br>
+{<br>
+=C2=A0 &quot;server&quot;: {<br>
+=C2=A0 =C2=A0 &quot;name&quot;: &quot;Modbus Default Server&quot;,<br>
+=C2=A0 =C2=A0 &quot;type&quot;: &quot;serial&quot;,<br>
+=C2=A0 =C2=A0 &quot;method&quot;: &quot;rtu&quot;,<br>
+=C2=A0 =C2=A0 &quot;port&quot;: &quot;/dev/ttyUSB0&quot;,<br>
+=C2=A0 =C2=A0 &quot;baudrate&quot;: 19200,<br>
+=C2=A0 =C2=A0 &quot;timeout&quot;: 35,<br>
+=C2=A0 =C2=A0 &quot;devices&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unitId&quot;: 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceName&quot;: &quot;Temp Sensor&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributesPollPeriod&quot;: 5000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseriesPollPeriod&quot;: 5000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sendDataOnlyOnChange&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;byteOrder&quot;: &quot;BI=
G&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tag&quot;: &quot;test&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;long&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;functionCode&quot;: 4,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;registerCount&quot;: 1,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: 4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+=C2=A0 }<br>
+}<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/mqtt.json b/meta-oe/recipes-connectivity/thingsboard-gateway/things=
board-gateway/mqtt.json<br>
new file mode 100755<br>
index 0000000000..6b78a7cec9<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/mqtt.json<br>
@@ -0,0 +1,132 @@<br>
+{<br>
+=C2=A0 &quot;broker&quot;: {<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;Default Local Broker&quot;,<br>
+=C2=A0 =C2=A0 &quot;host&quot;:&quot;127.0.0.1&quot;,<br>
+=C2=A0 =C2=A0 &quot;port&quot;:1883,<br>
+=C2=A0 =C2=A0 &quot;clientId&quot;: &quot;ThingsBoard_gateway&quot;,<br>
+=C2=A0 =C2=A0 &quot;security&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;basic&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;username&quot;: &quot;user&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;password&quot;: &quot;password&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 },<br>
+=C2=A0 &quot;mapping&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicFilter&quot;: &quot;/sensor/data&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameJsonExpression&quot;: &quot;$=
{serialNumber}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceTypeJsonExpression&quot;: &quot;$=
{sensorType}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 60000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;model&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${sens=
orModel}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;${sensor=
Model}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;on&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;double&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;temperat=
ure&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${temp=
}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;double&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;humidity=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${hum}=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicFilter&quot;: &quot;/sensor/+/data&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;json&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameTopicExpression&quot;: &quot;=
(?&lt;=3Dsensor\/)(.*?)(?=3D\/data)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceTypeTopicExpression&quot;: &quot;=
Thermometer&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 60000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;model&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${sens=
orModel}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;double&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;temperat=
ure&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${temp=
}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;double&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;humidity=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${hum}=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicFilter&quot;: &quot;/custom/sensors/+&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;custom&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;extension&quot;: &quot;CustomMqttUplink=
Converter&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;extension-config&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;temperatureBytes&quot; : =
2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;humidityBytes&quot; :=C2=
=A0 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;batteryLevelBytes&quot; :=
 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ],<br>
+=C2=A0 &quot;connectRequests&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicFilter&quot;: &quot;sensor/connect&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;deviceNameJsonExpression&quot;: &quot;${Serial=
Number}&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicFilter&quot;: &quot;sensor/+/connect&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;deviceNameTopicExpression&quot;: &quot;(?&lt;=
=3Dsensor\/)(.*?)(?=3D\/connect)&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ],<br>
+=C2=A0 &quot;disconnectRequests&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicFilter&quot;: &quot;sensor/disconnect&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;deviceNameJsonExpression&quot;: &quot;${Serial=
Number}&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicFilter&quot;: &quot;sensor/+/disconnect&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;deviceNameTopicExpression&quot;: &quot;(?&lt;=
=3Dsensor\/)(.*?)(?=3D\/disconnect)&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ],<br>
+=C2=A0 &quot;attributeUpdates&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;deviceNameFilter&quot;: &quot;SmartMeter.*&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;attributeFilter&quot;: &quot;uploadFrequency&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;topicExpression&quot;: &quot;sensor/${deviceNa=
me}/${attributeKey}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;valueExpression&quot;: &quot;{\&quot;${attribu=
teKey}\&quot;:\&quot;${attributeValue}\&quot;}&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ],<br>
+=C2=A0 &quot;serverSideRpc&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;deviceNameFilter&quot;: &quot;.*&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;methodFilter&quot;: &quot;echo&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;requestTopicExpression&quot;: &quot;sensor/${d=
eviceName}/request/${methodName}/${requestId}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;responseTopicExpression&quot;: &quot;sensor/${=
deviceName}/response/${methodName}/${requestId}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;responseTimeout&quot;: 10000,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;valueExpression&quot;: &quot;${params}&quot;<b=
r>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;deviceNameFilter&quot;: &quot;.*&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;methodFilter&quot;: &quot;no-reply&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;requestTopicExpression&quot;: &quot;sensor/${d=
eviceName}/request/${methodName}/${requestId}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;valueExpression&quot;: &quot;${params}&quot;<b=
r>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ]<br>
+}<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/odbc.json b/meta-oe/recipes-connectivity/thingsboard-gateway/things=
board-gateway/odbc.json<br>
new file mode 100644<br>
index 0000000000..c93992a262<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/odbc.json<br>
@@ -0,0 +1,54 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;connection&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;str&quot;: &quot;Driver=3D{PostgreSQL};Server=
=3Dlocalhost;Port=3D5432;Database=3Dthingsboard;Uid=3Dpostgres;Pwd=3Dpostg=
res;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;autocommit&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 0<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;encoding&quot;: &quot;utf-8&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;decoding&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;char&quot;: &quot;utf-8&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;wchar&quot;: &quot;utf-8&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;metadata&quot;: &quot;utf-16le&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;reconnect&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;reconnectPeriod&quot;: 60<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;pyodbc&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;pooling&quot;: false<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;polling&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;query&quot;: &quot;SELECT bool_v, str_v, dbl_v=
, long_v, entity_id, ts FROM ts_kv WHERE ts &gt; ? ORDER BY ts ASC LIMIT 10=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;period&quot;: 10,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;iterator&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;column&quot;: &quot;ts&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;query&quot;: &quot;SELECT MIN(ts) - 1 F=
ROM ts_kv&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;persistent&quot;: false<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;mapping&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;device&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;postgres&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;&#39;ODBC &#39; + ent=
ity_id&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;sendDataOnlyOnChange&quot;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: &quot;*&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;value&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;[i for i in [=
str_v, long_v, dbl_v,bool_v] if i is not None][0]&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;serverSideRpc&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;enableUnknownRpc&quot;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;overrideRpcConfig&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;methods&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;procedureOne&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;procedureTwo&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;args&quot;: [ &quot;One&quot;, 2=
, 3.0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 }<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/opcua.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thing=
sboard-gateway/opcua.json<br>
new file mode 100755<br>
index 0000000000..1deed7d524<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/opcua.json<br>
@@ -0,0 +1,49 @@<br>
+{<br>
+=C2=A0 &quot;server&quot;: {<br>
+=C2=A0 =C2=A0 &quot;name&quot;: &quot;OPC-UA Default Server&quot;,<br>
+=C2=A0 =C2=A0 &quot;url&quot;: &quot;localhost:4840/freeopcua/server/&quo=
t;,<br>
+=C2=A0 =C2=A0 &quot;timeoutInMillis&quot;: 5000,<br>
+=C2=A0 =C2=A0 &quot;scanPeriodInMillis&quot;: 5000,<br>
+=C2=A0 =C2=A0 &quot;disableSubscriptions&quot;:false,<br>
+=C2=A0 =C2=A0 &quot;subCheckPeriodInMillis&quot;: 100,<br>
+=C2=A0 =C2=A0 &quot;showMap&quot;: false,<br>
+=C2=A0 =C2=A0 &quot;security&quot;: &quot;Basic128Rsa15&quot;,<br>
+=C2=A0 =C2=A0 &quot;identity&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;anonymous&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;mapping&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNodePattern&quot;: &quot;Root\\.O=
bjects\\.Device1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNamePattern&quot;: &quot;Device $=
{Root\\.Objects\\.Device1\\.serialNumber}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;temperat=
ure =C2=B0C&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;${ns=3D=
2;i=3D5}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;humidity=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;${Root\=
\.Objects\\.Device1\\.TemperatureAndHumiditySensor\\.Humidity}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;batteryL=
evel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;${Batte=
ry\\.batteryLevel}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rpc_methods&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;multi=
ply&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;arguments&quot;: [2, 4]<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes_updates&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeOnThingsBoard&qu=
ot;: &quot;deviceName&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeOnDevice&quot;: =
&quot;Root\\.Objects\\.Device1\\.serialNumber&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+=C2=A0 }<br>
+}<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/request.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thi=
ngsboard-gateway/request.json<br>
new file mode 100644<br>
index 0000000000..43237a7dc0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/request.json<br>
@@ -0,0 +1,146 @@<br>
+&quot;job&quot;: &quot;leader&quot;<br>
+},<br>
+&quot;allowRedirects&quot;: true,<br>
+&quot;timeout&quot;: 0.5,<br>
+&quot;scanPeriod&quot;: 5,<br>
+&quot;converter&quot;: {<br>
+=C2=A0 &quot;type&quot;: &quot;json&quot;,<br>
+=C2=A0 &quot;deviceNameJsonExpression&quot;: &quot;SD8500&quot;,<br>
+=C2=A0 &quot;deviceTypeJsonExpression&quot;: &quot;SD&quot;,<br>
+=C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;serialNumber&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${serial}&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ],<br>
+=C2=A0 &quot;telemetry&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Maintainer&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;string&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;${Developer}&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ]<br>
+}<br>
+},<br>
+{<br>
+&quot;url&quot;: &quot;get_info&quot;,<br>
+&quot;httpMethod&quot;: &quot;GET&quot;,<br>
+&quot;httpHeaders&quot;: {<br>
+=C2=A0 &quot;ACCEPT&quot;: &quot;application/json&quot;<br>
+},<br>
+&quot;allowRedirects&quot;: true,<br>
+&quot;timeout&quot;: 0.5,<br>
+&quot;scanPeriod&quot;: 100,<br>
+&quot;converter&quot;: {<br>
+=C2=A0 &quot;type&quot;: &quot;custom&quot;,<br>
+=C2=A0 &quot;deviceNameJsonExpression&quot;: &quot;SD8500&quot;,<br>
+=C2=A0 &quot;deviceTypeJsonExpression&quot;: &quot;SD&quot;,<br>
+=C2=A0 &quot;extension&quot;: &quot;CustomRequestUplinkConverter&quot;,<b=
r>
+=C2=A0 &quot;extension-config&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Totaliser&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;float&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fromByte&quot;: 0,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;toByte&quot;: 4,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;big&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;signed&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;multiplier&quot;: 1<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Flow&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fromByte&quot;: 4,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;toByte&quot;: 6,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;big&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;signed&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;multiplier&quot;: 0.01<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Temperature&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fromByte&quot;: 8,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;toByte&quot;: 10,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;big&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;signed&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;multiplier&quot;: 0.01<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Pressure&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fromByte&quot;: 12,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;toByte&quot;: 14,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;big&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;signed&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;multiplier&quot;: 0.01<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;deviceStatus&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteAddress&quot;: 15,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fromBit&quot;: 4,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;toBit&quot;: 8,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;big&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;signed&quot;: false<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;OUT2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteAddress&quot;: 15,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fromBit&quot;: 1,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;toBit&quot;: 2,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;big&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;OUT1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;int&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteAddress&quot;: 15,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;fromBit&quot;: 0,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;toBit&quot;: 1,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;big&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ]<br>
+}<br>
+}<br>
+],<br>
+&quot;attributeUpdates&quot;: [<br>
+{<br>
+=C2=A0 &quot;httpMethod&quot;: &quot;POST&quot;,<br>
+=C2=A0 &quot;httpHeaders&quot;: {<br>
+=C2=A0 =C2=A0 &quot;CONTENT-TYPE&quot;: &quot;application/json&quot;<br>
+=C2=A0 },<br>
+=C2=A0 &quot;timeout&quot;: 0.5,<br>
+=C2=A0 &quot;tries&quot;: 3,<br>
+=C2=A0 &quot;allowRedirects&quot;: true,<br>
+=C2=A0 &quot;deviceNameFilter&quot;: &quot;SD.*&quot;,<br>
+=C2=A0 &quot;attributeFilter&quot;: &quot;send_data&quot;,<br>
+=C2=A0 &quot;requestUrlExpression&quot;: &quot;sensor/${deviceName}/${att=
ributeKey}&quot;,<br>
+=C2=A0 &quot;valueExpression&quot;: &quot;{\&quot;${attributeKey}\&quot;:=
\&quot;${attributeValue}\&quot;}&quot;<br>
+}<br>
+],<br>
+&quot;serverSideRpc&quot;: [<br>
+{<br>
+&quot;deviceNameFilter&quot;: &quot;.*&quot;,<br>
+&quot;methodFilter&quot;: &quot;echo&quot;,<br>
+&quot;requestUrlExpression&quot;: &quot;sensor/${deviceName}/request/${me=
thodName}/${requestId}&quot;,<br>
+&quot;responseTimeout&quot;: 1,<br>
+&quot;httpMethod&quot;: &quot;GET&quot;,<br>
+&quot;valueExpression&quot;: &quot;${params}&quot;,<br>
+&quot;timeout&quot;: 0.5,<br>
+&quot;tries&quot;: 3,<br>
+&quot;httpHeaders&quot;: {<br>
+=C2=A0 &quot;Content-Type&quot;: &quot;application/json&quot;<br>
+}<br>
+},<br>
+{<br>
+&quot;deviceNameFilter&quot;: &quot;.*&quot;,<br>
+&quot;methodFilter&quot;: &quot;no-reply&quot;,<br>
+&quot;requestUrlExpression&quot;: &quot;sensor/${deviceName}/request/${me=
thodName}/${requestId}&quot;,<br>
+&quot;httpMethod&quot;: &quot;POST&quot;,<br>
+&quot;valueExpression&quot;: &quot;${params}&quot;,<br>
+&quot;httpHeaders&quot;: {<br>
+=C2=A0 &quot;Content-Type&quot;: &quot;application/json&quot;<br>
+}<br>
+}<br>
+]<br>
+}<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/rest.json b/meta-oe/recipes-connectivity/thingsboard-gateway/things=
board-gateway/rest.json<br>
new file mode 100644<br>
index 0000000000..be6c6ff18e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/rest.json<br>
@@ -0,0 +1,152 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;host&quot;: &quot;127.0.0.1&quot;,<br>
+=C2=A0 =C2=A0 &quot;port&quot;: &quot;5000&quot;,<br>
+=C2=A0 =C2=A0 &quot;mapping&quot;:[<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;endpoint&quot;: &quot;/device1&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTPMethods&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;POST&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;security&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;basic&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;username&quot;: &quot;user&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;password&quot;: &quot;passwd&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;json&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameExpression&quot;: &quo=
t;Device ${name}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceTypeExpression&quot;: &quo=
t;default&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
string&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;m=
odel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot=
;${sensorModel}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
double&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;$=
{sensorModel}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot=
;${temp}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
double&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;h=
umidity&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot=
;${hum}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;endpoint&quot;: &quot;/anon1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTPMethods&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;GET&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;POST&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;security&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;anonymous&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;json&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameExpression&quot;: &quo=
t;Device 2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceTypeExpression&quot;: &quo=
t;default&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
string&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;m=
odel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot=
;Model2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeseries&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
double&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;t=
emperature&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot=
;${temp}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;=
double&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;h=
umidity&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot=
;${hum}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;endpoint&quot;: &quot;/anon2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTPMethods&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;POST&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;security&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;anonymous&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;custom&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameExpression&quot;: &quo=
t;SuperAnonDevice&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceTypeExpression&quot;: &quo=
t;default&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;extension&quot;: &quot;CustomRes=
tUplinkConverter&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;extension-config&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Totalise=
r&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;datatype&quot;: &quot;flo=
at&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fromByte&quot;: 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;toByte&quot;: 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;byteorder&quot;: &quot;bi=
g&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;signed&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;multiplier&quot;: 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 &quot;attributeUpdates&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTPMethod&quot;: &quot;POST&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SSLVerify&quot;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;httpHeaders&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CONTENT-TYPE&quot;: &quot=
;application/json&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;security&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;basic&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;username&quot;: &quot;use=
r&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;password&quot;: &quot;pas=
swd&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 0.5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tries&quot;: 3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;allowRedirects&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameFilter&quot;: &quot;.*=
REST$&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeFilter&quot;: &quot;dat=
a&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestUrlExpression&quot;: &quo=
t;sensor/${deviceName}/${attributeKey}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;valueExpression&quot;: &quot;{\&=
quot;${attributeKey}\&quot;:\&quot;${attributeValue}\&quot;}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 &quot;serverSideRpc&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameFilter&quot;: &quot;.*&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;methodFilter&quot;: &quot;echo&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestUrlExpression&quot;: &quot;<a hr=
ef=3D"http://127.0.0.1:5001/$%7BdeviceName%7D" rel=3D"noreferrer" target=3D=
"_blank">http://127.0.0.1:5001/${deviceName}</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;responseTimeout&quot;: 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTPMethod&quot;: &quot;GET&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;valueExpression&quot;: &quot;${params}&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 0.5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tries&quot;: 3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;httpHeaders&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Content-Type&quot;: &quot;applic=
ation/json&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;security&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;anonymous&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceNameFilter&quot;: &quot;.*&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;methodFilter&quot;: &quot;no-reply&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestUrlExpression&quot;: &quot;senso=
r/${deviceName}/request/${methodName}/${requestId}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HTTPMethod&quot;: &quot;POST&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;valueExpression&quot;: &quot;${params}&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;httpHeaders&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Content-Type&quot;: &quot;applic=
ation/json&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+=C2=A0 }<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/snmp.json b/meta-oe/recipes-connectivity/thingsboard-gateway/things=
board-gateway/snmp.json<br>
new file mode 100644<br>
index 0000000000..b4ddb42645<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/snmp.json<br>
@@ -0,0 +1,138 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;devices&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceName&quot;: &quot;SNMP router&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceType&quot;: &quot;snmp&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ip&quot;: &quot;<a href=3D"http://snmp.=
live.gambitcommunications.com" rel=3D"noreferrer" target=3D"_blank">snmp.li=
ve.gambitcommunications.com</a>&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;port&quot;: 161,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pollPeriod&quot;: 5000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;community&quot;: &quot;public&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromGet&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;get&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromMultiGet&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;multi=
get&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.1.0&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.2.0&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromGetNext&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;getne=
xt&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;timeout&quot;: 6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromMultiWalk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;multi=
walk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.1.0&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.0.1.2.1&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromBulkWalk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;bulkw=
alk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.1.0&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.2.0&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromBulkGet&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;bulkg=
et&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;scalarOid&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.1.0&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.2.0&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;repeatingOid&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.1.0&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.2.0&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;maxListSize&quot;: 10<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;telemetry&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromWalk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;community&quot;: &quot;pr=
ivate&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;walk&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromTable&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;table=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeUpdateRequests&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeFilter&quot;: &q=
uot;dataToSet&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;set&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributeFilter&quot;: &q=
uot;dataToMultiSet&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;multi=
set&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mappings&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.2.3&quot;: &quot=
;10&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;2.3.4&quot;: &quot=
;${attribute}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;serverSideRpcRequests&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestFilter&quot;: &quo=
t;setData&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;set&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestFilter&quot;: &quo=
t;multiSetData&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;multi=
set&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestFilter&quot;: &quo=
t;getData&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;get&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requestFilter&quot;: &quo=
t;runBulkWalk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;bulkw=
alk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.1.0&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1.3.6.1.2.1.1.2.0&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceName&quot;: &quot;SNMP router&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;deviceType&quot;: &quot;snmp&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ip&quot;: &quot;127.0.0.1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pollPeriod&quot;: 5000,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;community&quot;: &quot;public&quot;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;converter&quot;: &quot;CustomSNMPConver=
ter&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;attributes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromGetWithCustomConverter&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;get&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;telemetry&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;Received=
FromTableWithCustomConverter&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;method&quot;: &quot;table=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oid&quot;: &quot;1.3.6.1.=
2.1.1.1.0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+=C2=A0 }<br>
\ No newline at end of file<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/tb_gateway.yaml b/meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/tb_gateway.yaml<br>
new file mode 100755<br>
index 0000000000..e3eb8f1fc7<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/tb_gateway.yaml<br>
@@ -0,0 +1,66 @@<br>
+thingsboard:<br>
+=C2=A0 host: <a href=3D"http://demo.thingsboard.io" rel=3D"noreferrer" ta=
rget=3D"_blank">demo.thingsboard.io</a><br>
+=C2=A0 port: 1883<br>
+=C2=A0 remoteConfiguration: false<br>
+=C2=A0 security:<br>
+=C2=A0 =C2=A0 accessToken: PUT_YOUR_GW_ACCESS_TOKEN_HERE<br>
+storage:<br>
+=C2=A0 type: memory<br>
+=C2=A0 read_records_count: 100<br>
+=C2=A0 max_records_count: 100000<br>
+#=C2=A0 type: file<br>
+#=C2=A0 data_folder_path: ./data/<br>
+#=C2=A0 max_file_count: 10<br>
+#=C2=A0 max_read_records_count: 10<br>
+#=C2=A0 max_records_per_file: 10000<br>
+connectors:<br>
+=C2=A0 -<br>
+=C2=A0 =C2=A0 name: MQTT Broker Connector<br>
+=C2=A0 =C2=A0 type: mqtt<br>
+=C2=A0 =C2=A0 configuration: mqtt.json<br>
+<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: Modbus Connector<br>
+#=C2=A0 =C2=A0 type: modbus<br>
+#=C2=A0 =C2=A0 configuration: modbus.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: Modbus Connector<br>
+#=C2=A0 =C2=A0 type: modbus<br>
+#=C2=A0 =C2=A0 configuration: modbus_serial.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: OPC-UA Connector<br>
+#=C2=A0 =C2=A0 type: opcua<br>
+#=C2=A0 =C2=A0 configuration: opcua.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: BLE Connector<br>
+#=C2=A0 =C2=A0 type: ble<br>
+#=C2=A0 =C2=A0 configuration: ble.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: REQUEST Connector<br>
+#=C2=A0 =C2=A0 type: request<br>
+#=C2=A0 =C2=A0 configuration: request.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: CAN Connector<br>
+#=C2=A0 =C2=A0 type: can<br>
+#=C2=A0 =C2=A0 configuration: can.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: BACnet Connector<br>
+#=C2=A0 =C2=A0 type: bacnet<br>
+#=C2=A0 =C2=A0 configuration: bacnet.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: ODBC Connector<br>
+#=C2=A0 =C2=A0 type: odbc<br>
+#=C2=A0 =C2=A0 configuration: odbc.json<br>
+#<br>
+#=C2=A0 -<br>
+#=C2=A0 =C2=A0 name: Custom Serial Connector<br>
+#=C2=A0 =C2=A0 type: serial<br>
+#=C2=A0 =C2=A0 configuration: custom_serial.json<br>
+#=C2=A0 =C2=A0 class: CustomSerialConnector<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-=
gateway/thingsboard-gateway.service b/meta-oe/recipes-connectivity/thingsbo=
ard-gateway/thingsboard-gateway/thingsboard-gateway.service<br>
new file mode 100644<br>
index 0000000000..5dd352a553<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/thingsboard-gateway.service<br>
@@ -0,0 +1,13 @@<br>
+[Unit]<br>
+Description =3D Systemd service for Thingsboard Gateway<br>
+After=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D network.target<br>
+<br>
+[Service]<br>
+ExecStart=C2=A0 =C2=A0=3D /usr/bin/python3 /usr/bin/thingsboard-gateway<b=
r>
+ExecStop=C2=A0 =C2=A0 =3D /bin/kill -INT $MAINPID<br>
+ExecReload=C2=A0 =3D /bin/kill -TERM $MAINPID<br>
+Restart=C2=A0 =C2=A0 =C2=A0=3D always<br>
+Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D simple<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/<a href=3D"h=
ttp://thingsboard-gateway_2.5.2.bb" rel=3D"noreferrer" target=3D"_blank">th=
ingsboard-gateway_2.5.2.bb</a> b/meta-oe/recipes-connectivity/thingsboard-g=
ateway/<a href=3D"http://thingsboard-gateway_2.5.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">thingsboard-gateway_2.5.2.bb</a><br>
new file mode 100644<br>
index 0000000000..2f0ef16c80<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/thingsboard-gateway/<a href=3D"http://t=
hingsboard-gateway_2.5.2.bb" rel=3D"noreferrer" target=3D"_blank">thingsboa=
rd-gateway_2.5.2.bb</a><br>
@@ -0,0 +1,68 @@<br>
+SUMMARY =3D &quot;Open-source IoT platform for data collection, processin=
g, visualization, and device management&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+The Thingsboard IoT Gateway is an open-source solution that allows you \<=
br>
+to integrate devices connected to legacy and third-party systems with Thi=
ngsboard.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://thingsboard.io/" rel=3D"noreferrer"=
 target=3D"_blank">https://thingsboard.io/</a>&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D=
89aea4e17d99a7cacdbeed46a0096b10&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;469c8b5cd1c16c20ef40f0a97a3a0fda&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b328f4e315c3541ac80a4931974a34a81afe4d1f382f=
48e8604669a55816c0d7&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+PYPI_PACKAGE =3D &quot;thingsboard-gateway&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot; python3-jsonpath-rw \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyt=
hon3-regex \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyt=
hon3-paho-mqtt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyt=
hon3-pyyaml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyt=
hon3-simplejson \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyt=
hon3-requests \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyt=
hon3-pip \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pyt=
hon3-pyrsistent \<br>
+&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://bacnet.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ble.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://can.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://custom_serial.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://modbus.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://modbus_serial.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mqtt.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opcua.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://odbc.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://request.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rest.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://snmp.json \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tb_gateway.yaml \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://logs.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://thingsboard-gateway.serv=
ice \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+<br>
+inherit systemd<br>
+<br>
+SYSTEMD_PACKAGES =3D &quot;${PN}&quot;<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;thingsboard-gateway.service&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;/etc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr \<br>
+&quot;<br>
+<br>
+do_install_append(){<br>
+<br>
+=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/thingsboard-gateway/config<br>
+<br>
+=C2=A0 =C2=A0 for file in $(find ${WORKDIR} -maxdepth 1 -type f -name *.j=
son); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 &quot;$file&quot; ${D}${sysco=
nfdir}/thingsboard-gateway/config<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/tb_gateway.yaml ${D}${sysconfdir=
}/thingsboard-gateway/config<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/logs.conf ${D}${sysconfdir}/thin=
gsboard-gateway/config<br>
+<br>
+=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system/<br>
+=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/thingsboard-gateway.service=C2=
=A0 =C2=A0 =C2=A0${D}${systemd_system_unitdir}/thingsboard-gateway.service=
<br>
+}<br>
\ No newline at end of file<br>
--<br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000086e3f105b473003b--
