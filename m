Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web09.10718.1605799254733201952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 07:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lH3WhPiQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n132so5679727qke.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2020 07:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=azdAWn7OiykdIDjK6Mvqdijw4Q2rzxBYfWB9yQM6Bss=;
        b=lH3WhPiQeI58pXxaajuQE4/to7d1VMyf8myKq/rYym241wWVe6EescMgWj/UvLFk0Q
         OtPgMIpT4LP29fHZoFceflhZMKvi99yWQAZSZRjjUFGPA42HmHQKdwRM+9s5CUdmUghE
         Vt1dfboHgKGQ8AnxxhIUbOVsWQFFYtu2sZcRCX89y3wY85vHrZRIz6HeMkm0R5aoOv3f
         12FiYU+EXlYYO5ryeikPuQPfFNnKP6IAAhcXO/yveuYnKZRrvusML7fyxAVsiJSVcFO9
         uz7qgAvmKFTdmsuxeyLN9NAauK3QTUxx33hTDwsEf7KTJccRwOcS0VEkvwSEYaveaHWH
         aHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=azdAWn7OiykdIDjK6Mvqdijw4Q2rzxBYfWB9yQM6Bss=;
        b=TbAdBt8pHH+8Kri+uissxmyZyYy1lYs9JRDqSqfzhEgqlyk9inAkzf6JuOvVav6o6/
         lkcd8YJO0pRXgrIwJWTUHXuBOYwkylbEKn0SkcBTejOtYu1r3+wV0HdLay7cf2Tq/C9r
         wl5mQ9+yVK4205x7tvCeYecBLidUAFogOfeIgFgGwvktp9S/MvhDSkIchSYy4gj4AVW1
         hMIEsaYEXZ/yfSxKlYklQ7/ES25/zioHRsA78P1ZW+g2CkQvDIxI/e86kE5cakYakgKb
         cBvqPYyNDI0FBAAMGrYzAxdebvHdjol9gMe6ouqcz3A12fdma4MleFuv/KGMIefkNmb5
         7X0Q==
X-Gm-Message-State: AOAM530kwk8h5qWRtUUsZAA39u6IAZz+pzvaqSnoldKnvPpaVG/RWgJo
	eglrfKrNzQtjivN1488jv9RqMdmzguuJj/FCxIE=
X-Google-Smtp-Source: ABdhPJxsl3nrNaEBzepC9XY4yLYTG1E716rx14h69UkDR5APsJ1Lqb62w7ZeQPFMA4RTH1k/xRAnM3eKARri3OmiCkc=
X-Received: by 2002:a37:6195:: with SMTP id v143mr10698239qkb.71.1605799253347;
 Thu, 19 Nov 2020 07:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20201117230404.880724-1-raj.khem@gmail.com> <20201117230404.880724-4-raj.khem@gmail.com>
 <CA+chaQcja1Qh+Rfu9e3GZmU1A3ikvSJa81WsFHZRrW0Ohhtjjw@mail.gmail.com>
In-Reply-To: <CA+chaQcja1Qh+Rfu9e3GZmU1A3ikvSJa81WsFHZRrW0Ohhtjjw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 19 Nov 2020 07:20:26 -0800
Message-ID: <CAMKF1soX0GKraFt3PG4jxAJxFvtC_3idK-k9mwxkMYUe3qz_wg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/5] thingsboard-gateway: Add recipe for v2.5.2
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"hasan.men" <hasan.men@bosphorusiss.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 2:15 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> python3-jsonpath-rw dependency was added to meta-python, but meta-oe doe=
sn't depend on meta-python, so either python3-jsonpath-rw needs to be moved=
 to meta-oe (if it doesn't depend on other stuff from meta-python) or thing=
sboard-gateway needs to be moved to meta-python.
>

perhaps move it to meta-python is fine

> On Wed, Nov 18, 2020 at 12:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> From: "hasan.men" <hasan.men@bosphorusiss.com>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../thingsboard-gateway/bacnet.json           |  58 ++++++
>>  .../thingsboard-gateway/ble.json              |  53 ++++++
>>  .../thingsboard-gateway/can.json              |  89 +++++++++
>>  .../thingsboard-gateway/custom_serial.json    |  33 ++++
>>  .../thingsboard-gateway/logs.conf             |  77 ++++++++
>>  .../thingsboard-gateway/modbus.json           | 169 ++++++++++++++++++
>>  .../thingsboard-gateway/modbus_serial.json    |  29 +++
>>  .../thingsboard-gateway/mqtt.json             | 132 ++++++++++++++
>>  .../thingsboard-gateway/odbc.json             |  54 ++++++
>>  .../thingsboard-gateway/opcua.json            |  49 +++++
>>  .../thingsboard-gateway/request.json          | 146 +++++++++++++++
>>  .../thingsboard-gateway/rest.json             | 152 ++++++++++++++++
>>  .../thingsboard-gateway/snmp.json             | 138 ++++++++++++++
>>  .../thingsboard-gateway/tb_gateway.yaml       |  66 +++++++
>>  .../thingsboard-gateway.service               |  13 ++
>>  .../thingsboard-gateway_2.5.2.bb              |  68 +++++++
>>  16 files changed, 1326 insertions(+)
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/bacnet.json
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/ble.json
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/can.json
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/custom_serial.json
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/logs.conf
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/modbus.json
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/modbus_serial.json
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/mqtt.json
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/odbc.json
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/opcua.json
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/request.json
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/rest.json
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/snmp.json
>>  create mode 100755 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/tb_gateway.yaml
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/thingsboard-gateway.service
>>  create mode 100644 meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway_2.5.2.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/bacnet.json b/meta-oe/recipes-connectivity/thingsboard-gateway/t=
hingsboard-gateway/bacnet.json
>> new file mode 100644
>> index 0000000000..e36a2165d1
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/bacnet.json
>> @@ -0,0 +1,58 @@
>> +{
>> +    "general": {
>> +      "objectName": "TB_gateway",
>> +      "address": "192.168.188.181:1052",
>> +      "objectIdentifier": 599,
>> +      "maxApduLengthAccepted": 1024,
>> +      "segmentationSupported": "segmentedBoth",
>> +      "vendorIdentifier": 15
>> +    },
>> +    "devices": [
>> +      {
>> +        "deviceName": "BACnet Device ${objectName}",
>> +        "deviceType": "default",
>> +        "address": "192.168.188.181:10520",
>> +        "pollPeriod": 10000,
>> +        "attributes": [
>> +          {
>> +            "key": "temperature",
>> +            "type": "string",
>> +            "objectId": "analogOutput:1",
>> +            "propertyId": "presentValue"
>> +          }
>> +        ],
>> +        "timeseries": [
>> +          {
>> +            "key": "state",
>> +            "type": "bool",
>> +            "objectId": "binaryValue:1",
>> +            "propertyId": "presentValue"
>> +          }
>> +        ],
>> +        "attributeUpdates": [
>> +          {
>> +            "key": "brightness",
>> +            "requestType": "writeProperty",
>> +            "objectId": "analogOutput:1",
>> +            "propertyId": "presentValue"
>> +          }
>> +        ],
>> +        "serverSideRpc": [
>> +          {
>> +            "method": "set_state",
>> +            "requestType": "writeProperty",
>> +            "requestTimeout": 10000,
>> +            "objectId": "binaryOutput:1",
>> +            "propertyId": "presentValue"
>> +          },
>> +          {
>> +            "method": "get_state",
>> +            "requestType": "readProperty",
>> +            "requestTimeout": 10000,
>> +            "objectId": "binaryOutput:1",
>> +            "propertyId": "presentValue"
>> +          }
>> +        ]
>> +      }
>> +    ]
>> +  }
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/ble.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thin=
gsboard-gateway/ble.json
>> new file mode 100755
>> index 0000000000..2a5da3f41d
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/ble.json
>> @@ -0,0 +1,53 @@
>> +{
>> +    "name": "BLE Connector",
>> +    "rescanIntervalSeconds": 100,
>> +    "checkIntervalSeconds": 100,
>> +    "scanTimeSeconds": 5,
>> +    "passiveScanMode": true,
>> +    "devices": [
>> +        {
>> +            "name": "Temperature and humidity sensor",
>> +            "MACAddress": "4C:65:A8:DF:85:C0",
>> +            "addrType": "public",
>> +            "telemetry": [
>> +                {
>> +                    "key": "temperature",
>> +                    "method": "notify",
>> +                    "characteristicUUID": "226CAA55-6476-4566-7562-667=
34470666D",
>> +                    "byteFrom": 2,
>> +                    "byteTo": 6
>> +                },
>> +                {
>> +                    "key": "humidity",
>> +                    "method": "notify",
>> +                    "characteristicUUID": "226CAA55-6476-4566-7562-667=
34470666D",
>> +                    "byteFrom": 9,
>> +                    "byteTo": 13
>> +                }
>> +            ],
>> +            "attributes": [
>> +                {
>> +                    "key": "name",
>> +                    "characteristicUUID": "00002A00-0000-1000-8000-008=
05F9B34FB",
>> +                    "method": "read",
>> +                    "byteFrom": 0,
>> +                    "byteTo": -1
>> +                }
>> +            ],
>> +            "attributeUpdates": [
>> +                {
>> +                    "attributeOnThingsBoard": "sharedName",
>> +                    "characteristicUUID": "00002A00-0000-1000-8000-008=
05F9B34FB"
>> +                }
>> +            ],
>> +            "serverSideRpc": [
>> +                {
>> +                    "methodRPC": "rpcMethod1",
>> +                    "withResponse": true,
>> +                    "characteristicUUID": "00002A00-0000-1000-8000-008=
05F9B34FB",
>> +                    "methodProcessing": "read"
>> +                }
>> +            ]
>> +        }
>> +    ]
>> +}
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/can.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thin=
gsboard-gateway/can.json
>> new file mode 100644
>> index 0000000000..b5cec0045a
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/can.json
>> @@ -0,0 +1,89 @@
>> +{
>> +    "interface": "socketcan",
>> +    "channel": "vcan0",
>> +    "backend": {
>> +      "fd": true
>> +    },
>> +    "reconnectPeriod": 5,
>> +    "devices": [
>> +      {
>> +        "name": "Car",
>> +        "sendDataOnlyOnChange": false,
>> +        "enableUnknownRpc": true,
>> +        "strictEval": false,
>> +        "attributes": [
>> +          {
>> +            "key": "isDriverDoorOpened",
>> +            "nodeId": 41,
>> +            "command": "2:2:big:8717",
>> +            "value": "4:1:int",
>> +            "expression": "bool(value & 0b00000100)",
>> +            "polling": {
>> +              "type": "once",
>> +              "dataInHex": "AB CD AB CD"
>> +            }
>> +          }
>> +        ],
>> +        "timeseries": [
>> +          {
>> +            "key": "rpm",
>> +            "nodeId": 1918,
>> +            "isExtendedId": true,
>> +            "command": "2:2:big:48059",
>> +            "value": "4:2:big:int",
>> +            "expression": "value / 4",
>> +            "polling": {
>> +              "type": "always",
>> +              "period": 5,
>> +              "dataInHex": "aaaa bbbb aaaa bbbb"
>> +            }
>> +          },
>> +          {
>> +            "key": "milliage",
>> +            "nodeId": 1918,
>> +            "isExtendedId": true,
>> +            "value": "4:2:little:int",
>> +            "expression": "value * 10",
>> +            "polling": {
>> +              "type": "always",
>> +              "period": 30,
>> +              "dataInHex": "aa bb cc dd ee ff aa bb"
>> +            }
>> +          }
>> +        ],
>> +        "attributeUpdates": [
>> +          {
>> +            "attributeOnThingsBoard": "softwareVersion",
>> +            "nodeId": 64,
>> +            "isExtendedId": true,
>> +            "dataLength": 4,
>> +            "dataExpression": "value + 5",
>> +            "dataByteorder": "little"
>> +          }
>> +        ],
>> +        "serverSideRpc": [
>> +          {
>> +            "method": "sendSameData",
>> +            "nodeId": 4,
>> +            "isExtendedId": true,
>> +            "isFd": true,
>> +            "bitrateSwitch": true,
>> +            "dataInHex": "aa bb cc dd ee ff    aa bb aa bb cc d ee ff"
>> +          },
>> +          {
>> +            "method": "setLightLevel",
>> +            "nodeId": 5,
>> +            "dataLength": 2,
>> +            "dataByteorder": "little",
>> +            "dataBefore": "00AA"
>> +          },
>> +          {
>> +            "method": "setSpeed",
>> +            "nodeId": 16,
>> +            "dataAfter": "0102",
>> +            "dataExpression": "userSpeed if maxAllowedSpeed > userSpee=
d else maxAllowedSpeed"
>> +          }
>> +        ]
>> +      }
>> +    ]
>> +  }
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/custom_serial.json b/meta-oe/recipes-connectivity/thingsboard-ga=
teway/thingsboard-gateway/custom_serial.json
>> new file mode 100755
>> index 0000000000..0aee5cb765
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/custom_serial.json
>> @@ -0,0 +1,33 @@
>> +{
>> +  "name": "Custom serial connector",
>> +  "devices": [
>> +    {
>> +      "name": "CustomSerialDevice1",
>> +      "type": "default",
>> +      "port": "/dev/ttyUSB0",
>> +      "baudrate": 9600,
>> +      "converter": "CustomSerialUplinkConverter",
>> +      "telemetry": [
>> +        {
>> +          "type": "byte",
>> +          "key": "humidity",
>> +          "untilDelimiter": "\r"
>> +        }
>> +      ],
>> +      "attributes":[
>> +        {
>> +          "key": "SerialNumber",
>> +          "type": "string",
>> +          "fromByte": 4,
>> +          "toByte": -1
>> +        }
>> +      ],
>> +      "attributeUpdates": [
>> +        {
>> +          "attributeOnThingsBoard": "attr1",
>> +          "stringToDevice": "value =3D ${attr1}\n"
>> +        }
>> +      ]
>> +    }
>> +  ]
>> +}
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/logs.conf b/meta-oe/recipes-connectivity/thingsboard-gateway/thi=
ngsboard-gateway/logs.conf
>> new file mode 100755
>> index 0000000000..d66c2b84a8
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/logs.conf
>> @@ -0,0 +1,77 @@
>> +[loggers]
>> +keys=3Droot, service, connector, converter, tb_connection, storage, ex=
tension
>> +[handlers]
>> +keys=3DconsoleHandler, serviceHandler, connectorHandler, converterHand=
ler, tb_connectionHandler, storageHandler, extensionHandler
>> +[formatters]
>> +keys=3DLogFormatter
>> +[logger_root]
>> +level=3DERROR
>> +handlers=3DconsoleHandler
>> +[logger_connector]
>> +level=3DINFO
>> +handlers=3DconnectorHandler
>> +formatter=3DLogFormatter
>> +qualname=3Dconnector
>> +[logger_storage]
>> +level=3DINFO
>> +handlers=3DstorageHandler
>> +formatter=3DLogFormatter
>> +qualname=3Dstorage
>> +[logger_tb_connection]
>> +level=3DINFO
>> +handlers=3Dtb_connectionHandler
>> +formatter=3DLogFormatter
>> +qualname=3Dtb_connection
>> +[logger_service]
>> +level=3DINFO
>> +handlers=3DserviceHandler
>> +formatter=3DLogFormatter
>> +qualname=3Dservice
>> +[logger_converter]
>> +level=3DINFO
>> +handlers=3DconverterHandler
>> +formatter=3DLogFormatter
>> +qualname=3Dconverter
>> +[logger_extension]
>> +level=3DINFO
>> +handlers=3DconnectorHandler
>> +formatter=3DLogFormatter
>> +qualname=3Dextension
>> +[handler_consoleHandler]
>> +class=3DStreamHandler
>> +level=3DINFO
>> +formatter=3DLogFormatter
>> +args=3D(sys.stdout,)
>> +[handler_connectorHandler]
>> +level=3DINFO
>> +class=3Dlogging.handlers.TimedRotatingFileHandler
>> +formatter=3DLogFormatter
>> +args=3D("./logs/connector.log", "d", 1, 7,)
>> +[handler_storageHandler]
>> +level=3DINFO
>> +class=3Dlogging.handlers.TimedRotatingFileHandler
>> +formatter=3DLogFormatter
>> +args=3D("./logs/storage.log", "d", 1, 7,)
>> +[handler_serviceHandler]
>> +level=3DINFO
>> +class=3Dlogging.handlers.TimedRotatingFileHandler
>> +formatter=3DLogFormatter
>> +args=3D("./logs/service.log", "d", 1, 7,)
>> +[handler_converterHandler]
>> +level=3DINFO
>> +class=3Dlogging.handlers.TimedRotatingFileHandler
>> +formatter=3DLogFormatter
>> +args=3D("./logs/converter.log", "d", 1, 3,)
>> +[handler_extensionHandler]
>> +level=3DINFO
>> +class=3Dlogging.handlers.TimedRotatingFileHandler
>> +formatter=3DLogFormatter
>> +args=3D("./logs/extension.log", "d", 1, 3,)
>> +[handler_tb_connectionHandler]
>> +level=3DINFO
>> +class=3Dlogging.handlers.TimedRotatingFileHandler
>> +formatter=3DLogFormatter
>> +args=3D("./logs/tb_connection.log", "d", 1, 3,)
>> +[formatter_LogFormatter]
>> +format=3D"%(asctime)s - %(levelname)s - [%(filename)s] - %(module)s - =
%(lineno)d - %(message)s"
>> +datefmt=3D"%Y-%m-%d %H:%M:%S"
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/modbus.json b/meta-oe/recipes-connectivity/thingsboard-gateway/t=
hingsboard-gateway/modbus.json
>> new file mode 100755
>> index 0000000000..479d8aa4d0
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/modbus.json
>> @@ -0,0 +1,169 @@
>> +{
>> +  "server": {
>> +    "type": "tcp",
>> +    "host": "127.0.0.1",
>> +    "port": 5020,
>> +    "timeout": 35,
>> +    "method": "socket",
>> +    "byteOrder": "BIG",
>> +    "devices": [
>> +      {
>> +        "unitId": 1,
>> +        "deviceName": "Temp Sensor",
>> +        "attributesPollPeriod": 5000,
>> +        "timeseriesPollPeriod": 5000,
>> +        "sendDataOnlyOnChange": true,
>> +        "attributes": [
>> +          {
>> +            "tag": "string_read",
>> +            "type": "string",
>> +            "functionCode": 4,
>> +            "objectsCount": 4,
>> +            "address": 1
>> +          },
>> +          {
>> +            "tag": "bits_read",
>> +            "type": "bits",
>> +            "functionCode": 4,
>> +            "objectsCount": 1,
>> +            "address": 5
>> +          },
>> +          {
>> +            "tag": "8int_read",
>> +            "type": "8int",
>> +            "functionCode": 4,
>> +            "objectsCount": 1,
>> +            "address": 6
>> +          },
>> +          {
>> +            "tag": "16int_read",
>> +            "type": "16int",
>> +            "functionCode": 4,
>> +            "objectsCount": 1,
>> +            "address": 7
>> +          },
>> +          {
>> +            "tag": "32int_read_divider",
>> +            "type": "32int",
>> +            "functionCode": 4,
>> +            "objectsCount": 2,
>> +            "address": 8,
>> +            "divider": 10
>> +          },
>> +          {
>> +            "tag": "8int_read_multiplier",
>> +            "type": "8int",
>> +            "functionCode": 4,
>> +            "objectsCount": 1,
>> +            "address": 10,
>> +            "multiplier": 10
>> +          },
>> +          {
>> +            "tag": "32int_read",
>> +            "type": "32int",
>> +            "functionCode": 4,
>> +            "objectsCount": 2,
>> +            "address": 11
>> +          },
>> +          {
>> +            "tag": "64int_read",
>> +            "type": "64int",
>> +            "functionCode": 4,
>> +            "objectsCount": 4,
>> +            "address": 13
>> +          }
>> +      ],
>> +      "timeseries": [
>> +          {
>> +            "tag": "8uint_read",
>> +            "type": "8uint",
>> +            "functionCode": 4,
>> +            "objectsCount": 1,
>> +            "address": 17
>> +          },
>> +          {
>> +            "tag": "16uint_read",
>> +            "type": "16uint",
>> +            "functionCode": 4,
>> +            "objectsCount": 2,
>> +            "address": 18
>> +          },
>> +          {
>> +            "tag": "32uint_read",
>> +            "type": "32uint",
>> +            "functionCode": 4,
>> +            "objectsCount": 4,
>> +            "address": 20
>> +          },
>> +          {
>> +            "tag": "64uint_read",
>> +            "type": "64uint",
>> +            "functionCode": 4,
>> +            "objectsCount": 1,
>> +            "address": 24
>> +          },
>> +          {
>> +            "tag": "16float_read",
>> +            "type": "16float",
>> +            "functionCode": 4,
>> +            "objectsCount": 1,
>> +            "address": 25
>> +          },
>> +          {
>> +            "tag": "32float_read",
>> +            "type": "32float",
>> +            "functionCode": 4,
>> +            "objectsCount": 2,
>> +            "address": 26
>> +          },
>> +          {
>> +            "tag": "64float_read",
>> +            "type": "64float",
>> +            "functionCode": 4,
>> +            "objectsCount": 4,
>> +            "address": 28
>> +          }
>> +        ],
>> +        "attributeUpdates": [
>> +          {
>> +            "tag": "shared_attribute_write",
>> +            "type": "32int",
>> +            "functionCode": 6,
>> +            "objectsCount": 2,
>> +            "address": 29
>> +          }
>> +        ],
>> +        "rpc": [
>> +          {
>> +            "tag": "setValue",
>> +            "type": "bits",
>> +            "functionCode": 5,
>> +            "objectsCount": 1,
>> +            "address": 31
>> +          },
>> +          {
>> +            "tag": "getValue",
>> +            "type": "bits",
>> +            "functionCode": 1,
>> +            "objectsCount": 1,
>> +            "address": 31
>> +          },
>> +          {
>> +            "tag": "setCPUFanSpeed",
>> +            "type": "32int",
>> +            "functionCode": 16,
>> +            "objectsCount": 2,
>> +            "address": 33
>> +          },
>> +          {
>> +            "tag":"getCPULoad",
>> +            "type": "32int",
>> +            "functionCode": 4,
>> +            "objectsCount": 2,
>> +            "address": 35
>> +          }
>> +        ]
>> +      }
>> +    ]
>> +  }
>> +}
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/modbus_serial.json b/meta-oe/recipes-connectivity/thingsboard-ga=
teway/thingsboard-gateway/modbus_serial.json
>> new file mode 100755
>> index 0000000000..19b38e3f7b
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/modbus_serial.json
>> @@ -0,0 +1,29 @@
>> +{
>> +  "server": {
>> +    "name": "Modbus Default Server",
>> +    "type": "serial",
>> +    "method": "rtu",
>> +    "port": "/dev/ttyUSB0",
>> +    "baudrate": 19200,
>> +    "timeout": 35,
>> +    "devices": [
>> +      {
>> +        "unitId": 1,
>> +        "deviceName": "Temp Sensor",
>> +        "attributesPollPeriod": 5000,
>> +        "timeseriesPollPeriod": 5000,
>> +        "sendDataOnlyOnChange": true,
>> +        "attributes": [
>> +          {
>> +            "byteOrder": "BIG",
>> +            "tag": "test",
>> +            "type": "long",
>> +            "functionCode": 4,
>> +            "registerCount": 1,
>> +            "address": 4
>> +          }
>> +        ]
>> +      }
>> +    ]
>> +  }
>> +}
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/mqtt.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thi=
ngsboard-gateway/mqtt.json
>> new file mode 100755
>> index 0000000000..6b78a7cec9
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/mqtt.json
>> @@ -0,0 +1,132 @@
>> +{
>> +  "broker": {
>> +    "name":"Default Local Broker",
>> +    "host":"127.0.0.1",
>> +    "port":1883,
>> +    "clientId": "ThingsBoard_gateway",
>> +    "security": {
>> +      "type": "basic",
>> +      "username": "user",
>> +      "password": "password"
>> +    }
>> +  },
>> +  "mapping": [
>> +    {
>> +      "topicFilter": "/sensor/data",
>> +      "converter": {
>> +        "type": "json",
>> +        "deviceNameJsonExpression": "${serialNumber}",
>> +        "deviceTypeJsonExpression": "${sensorType}",
>> +        "timeout": 60000,
>> +        "attributes": [
>> +          {
>> +            "type": "string",
>> +            "key": "model",
>> +            "value": "${sensorModel}"
>> +          },
>> +          {
>> +            "type": "string",
>> +            "key": "${sensorModel}",
>> +            "value": "on"
>> +          }
>> +        ],
>> +        "timeseries": [
>> +          {
>> +            "type": "double",
>> +            "key": "temperature",
>> +            "value": "${temp}"
>> +          },
>> +          {
>> +            "type": "double",
>> +            "key": "humidity",
>> +            "value": "${hum}"
>> +          }
>> +        ]
>> +      }
>> +    },
>> +    {
>> +      "topicFilter": "/sensor/+/data",
>> +      "converter": {
>> +        "type": "json",
>> +        "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/data)=
",
>> +        "deviceTypeTopicExpression": "Thermometer",
>> +        "timeout": 60000,
>> +        "attributes": [
>> +          {
>> +            "type": "string",
>> +            "key": "model",
>> +            "value": "${sensorModel}"
>> +          }
>> +        ],
>> +        "timeseries": [
>> +          {
>> +            "type": "double",
>> +            "key": "temperature",
>> +            "value": "${temp}"
>> +          },
>> +          {
>> +            "type": "double",
>> +            "key": "humidity",
>> +            "value": "${hum}"
>> +          }
>> +        ]
>> +      }
>> +    },
>> +    {
>> +      "topicFilter": "/custom/sensors/+",
>> +      "converter": {
>> +        "type": "custom",
>> +        "extension": "CustomMqttUplinkConverter",
>> +        "extension-config": {
>> +            "temperatureBytes" : 2,
>> +            "humidityBytes" :  2,
>> +            "batteryLevelBytes" : 1
>> +        }
>> +      }
>> +    }
>> +  ],
>> +  "connectRequests": [
>> +    {
>> +      "topicFilter": "sensor/connect",
>> +      "deviceNameJsonExpression": "${SerialNumber}"
>> +    },
>> +    {
>> +      "topicFilter": "sensor/+/connect",
>> +      "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/connect=
)"
>> +    }
>> +  ],
>> +  "disconnectRequests": [
>> +    {
>> +      "topicFilter": "sensor/disconnect",
>> +      "deviceNameJsonExpression": "${SerialNumber}"
>> +    },
>> +    {
>> +      "topicFilter": "sensor/+/disconnect",
>> +      "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/disconn=
ect)"
>> +    }
>> +  ],
>> +  "attributeUpdates": [
>> +    {
>> +      "deviceNameFilter": "SmartMeter.*",
>> +      "attributeFilter": "uploadFrequency",
>> +      "topicExpression": "sensor/${deviceName}/${attributeKey}",
>> +      "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
>> +    }
>> +  ],
>> +  "serverSideRpc": [
>> +    {
>> +      "deviceNameFilter": ".*",
>> +      "methodFilter": "echo",
>> +      "requestTopicExpression": "sensor/${deviceName}/request/${method=
Name}/${requestId}",
>> +      "responseTopicExpression": "sensor/${deviceName}/response/${meth=
odName}/${requestId}",
>> +      "responseTimeout": 10000,
>> +      "valueExpression": "${params}"
>> +    },
>> +    {
>> +      "deviceNameFilter": ".*",
>> +      "methodFilter": "no-reply",
>> +      "requestTopicExpression": "sensor/${deviceName}/request/${method=
Name}/${requestId}",
>> +      "valueExpression": "${params}"
>> +    }
>> +  ]
>> +}
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/odbc.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thi=
ngsboard-gateway/odbc.json
>> new file mode 100644
>> index 0000000000..c93992a262
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/odbc.json
>> @@ -0,0 +1,54 @@
>> +{
>> +    "connection": {
>> +      "str": "Driver=3D{PostgreSQL};Server=3Dlocalhost;Port=3D5432;Dat=
abase=3Dthingsboard;Uid=3Dpostgres;Pwd=3Dpostgres;",
>> +      "attributes": {
>> +        "autocommit": true,
>> +        "timeout": 0
>> +      },
>> +      "encoding": "utf-8",
>> +      "decoding": {
>> +        "char": "utf-8",
>> +        "wchar": "utf-8",
>> +        "metadata": "utf-16le"
>> +      },
>> +      "reconnect": true,
>> +      "reconnectPeriod": 60
>> +    },
>> +    "pyodbc": {
>> +      "pooling": false
>> +    },
>> +    "polling": {
>> +      "query": "SELECT bool_v, str_v, dbl_v, long_v, entity_id, ts FRO=
M ts_kv WHERE ts > ? ORDER BY ts ASC LIMIT 10",
>> +      "period": 10,
>> +      "iterator": {
>> +        "column": "ts",
>> +        "query": "SELECT MIN(ts) - 1 FROM ts_kv",
>> +        "persistent": false
>> +      }
>> +    },
>> +    "mapping": {
>> +      "device": {
>> +        "type": "postgres",
>> +        "name": "'ODBC ' + entity_id"
>> +      },
>> +      "sendDataOnlyOnChange": false,
>> +      "attributes": "*",
>> +      "timeseries": [
>> +        {
>> +          "name": "value",
>> +          "value": "[i for i in [str_v, long_v, dbl_v,bool_v] if i is =
not None][0]"
>> +        }
>> +      ]
>> +    },
>> +    "serverSideRpc": {
>> +      "enableUnknownRpc": false,
>> +      "overrideRpcConfig": true,
>> +      "methods": [
>> +        "procedureOne",
>> +        {
>> +          "name": "procedureTwo",
>> +          "args": [ "One", 2, 3.0 ]
>> +        }
>> +      ]
>> +    }
>> +  }
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/opcua.json b/meta-oe/recipes-connectivity/thingsboard-gateway/th=
ingsboard-gateway/opcua.json
>> new file mode 100755
>> index 0000000000..1deed7d524
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/opcua.json
>> @@ -0,0 +1,49 @@
>> +{
>> +  "server": {
>> +    "name": "OPC-UA Default Server",
>> +    "url": "localhost:4840/freeopcua/server/",
>> +    "timeoutInMillis": 5000,
>> +    "scanPeriodInMillis": 5000,
>> +    "disableSubscriptions":false,
>> +    "subCheckPeriodInMillis": 100,
>> +    "showMap": false,
>> +    "security": "Basic128Rsa15",
>> +    "identity": {
>> +      "type": "anonymous"
>> +    },
>> +    "mapping": [
>> +      {
>> +        "deviceNodePattern": "Root\\.Objects\\.Device1",
>> +        "deviceNamePattern": "Device ${Root\\.Objects\\.Device1\\.seri=
alNumber}",
>> +        "attributes": [
>> +          {
>> +            "key": "temperature =C2=B0C",
>> +            "path": "${ns=3D2;i=3D5}"
>> +          }
>> +        ],
>> +        "timeseries": [
>> +          {
>> +            "key": "humidity",
>> +            "path": "${Root\\.Objects\\.Device1\\.TemperatureAndHumidi=
tySensor\\.Humidity}"
>> +          },
>> +          {
>> +            "key": "batteryLevel",
>> +            "path": "${Battery\\.batteryLevel}"
>> +          }
>> +        ],
>> +        "rpc_methods": [
>> +          {
>> +            "method": "multiply",
>> +            "arguments": [2, 4]
>> +          }
>> +        ],
>> +        "attributes_updates": [
>> +          {
>> +            "attributeOnThingsBoard": "deviceName",
>> +            "attributeOnDevice": "Root\\.Objects\\.Device1\\.serialNum=
ber"
>> +          }
>> +        ]
>> +      }
>> +    ]
>> +  }
>> +}
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/request.json b/meta-oe/recipes-connectivity/thingsboard-gateway/=
thingsboard-gateway/request.json
>> new file mode 100644
>> index 0000000000..43237a7dc0
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/request.json
>> @@ -0,0 +1,146 @@
>> +"job": "leader"
>> +},
>> +"allowRedirects": true,
>> +"timeout": 0.5,
>> +"scanPeriod": 5,
>> +"converter": {
>> +  "type": "json",
>> +  "deviceNameJsonExpression": "SD8500",
>> +  "deviceTypeJsonExpression": "SD",
>> +  "attributes": [
>> +    {
>> +      "key": "serialNumber",
>> +      "type": "string",
>> +      "value": "${serial}"
>> +    }
>> +  ],
>> +  "telemetry": [
>> +    {
>> +      "key": "Maintainer",
>> +      "type": "string",
>> +      "value": "${Developer}"
>> +    }
>> +  ]
>> +}
>> +},
>> +{
>> +"url": "get_info",
>> +"httpMethod": "GET",
>> +"httpHeaders": {
>> +  "ACCEPT": "application/json"
>> +},
>> +"allowRedirects": true,
>> +"timeout": 0.5,
>> +"scanPeriod": 100,
>> +"converter": {
>> +  "type": "custom",
>> +  "deviceNameJsonExpression": "SD8500",
>> +  "deviceTypeJsonExpression": "SD",
>> +  "extension": "CustomRequestUplinkConverter",
>> +  "extension-config": [
>> +    {
>> +      "key": "Totaliser",
>> +      "type": "float",
>> +      "fromByte": 0,
>> +      "toByte": 4,
>> +      "byteorder": "big",
>> +      "signed": true,
>> +      "multiplier": 1
>> +    },
>> +    {
>> +      "key": "Flow",
>> +      "type": "int",
>> +      "fromByte": 4,
>> +      "toByte": 6,
>> +      "byteorder": "big",
>> +      "signed": true,
>> +      "multiplier": 0.01
>> +    },
>> +    {
>> +      "key": "Temperature",
>> +      "type": "int",
>> +      "fromByte": 8,
>> +      "toByte": 10,
>> +      "byteorder": "big",
>> +      "signed": true,
>> +      "multiplier": 0.01
>> +    },
>> +    {
>> +      "key": "Pressure",
>> +      "type": "int",
>> +      "fromByte": 12,
>> +      "toByte": 14,
>> +      "byteorder": "big",
>> +      "signed": true,
>> +      "multiplier": 0.01
>> +    },
>> +    {
>> +      "key": "deviceStatus",
>> +      "type": "int",
>> +      "byteAddress": 15,
>> +      "fromBit": 4,
>> +      "toBit": 8,
>> +      "byteorder": "big",
>> +      "signed": false
>> +    },
>> +    {
>> +      "key": "OUT2",
>> +      "type": "int",
>> +      "byteAddress": 15,
>> +      "fromBit": 1,
>> +      "toBit": 2,
>> +      "byteorder": "big"
>> +    },
>> +    {
>> +      "key": "OUT1",
>> +      "type": "int",
>> +      "byteAddress": 15,
>> +      "fromBit": 0,
>> +      "toBit": 1,
>> +      "byteorder": "big"
>> +    }
>> +  ]
>> +}
>> +}
>> +],
>> +"attributeUpdates": [
>> +{
>> +  "httpMethod": "POST",
>> +  "httpHeaders": {
>> +    "CONTENT-TYPE": "application/json"
>> +  },
>> +  "timeout": 0.5,
>> +  "tries": 3,
>> +  "allowRedirects": true,
>> +  "deviceNameFilter": "SD.*",
>> +  "attributeFilter": "send_data",
>> +  "requestUrlExpression": "sensor/${deviceName}/${attributeKey}",
>> +  "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
>> +}
>> +],
>> +"serverSideRpc": [
>> +{
>> +"deviceNameFilter": ".*",
>> +"methodFilter": "echo",
>> +"requestUrlExpression": "sensor/${deviceName}/request/${methodName}/${=
requestId}",
>> +"responseTimeout": 1,
>> +"httpMethod": "GET",
>> +"valueExpression": "${params}",
>> +"timeout": 0.5,
>> +"tries": 3,
>> +"httpHeaders": {
>> +  "Content-Type": "application/json"
>> +}
>> +},
>> +{
>> +"deviceNameFilter": ".*",
>> +"methodFilter": "no-reply",
>> +"requestUrlExpression": "sensor/${deviceName}/request/${methodName}/${=
requestId}",
>> +"httpMethod": "POST",
>> +"valueExpression": "${params}",
>> +"httpHeaders": {
>> +  "Content-Type": "application/json"
>> +}
>> +}
>> +]
>> +}
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/rest.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thi=
ngsboard-gateway/rest.json
>> new file mode 100644
>> index 0000000000..be6c6ff18e
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/rest.json
>> @@ -0,0 +1,152 @@
>> +{
>> +    "host": "127.0.0.1",
>> +    "port": "5000",
>> +    "mapping":[
>> +      {
>> +        "endpoint": "/device1",
>> +        "HTTPMethods": [
>> +          "POST"
>> +        ],
>> +        "security":
>> +        {
>> +          "type": "basic",
>> +          "username": "user",
>> +          "password": "passwd"
>> +        },
>> +        "converter": {
>> +          "type": "json",
>> +          "deviceNameExpression": "Device ${name}",
>> +          "deviceTypeExpression": "default",
>> +          "attributes": [
>> +            {
>> +              "type": "string",
>> +              "key": "model",
>> +              "value": "${sensorModel}"
>> +            }
>> +          ],
>> +          "timeseries": [
>> +            {
>> +              "type": "double",
>> +              "key": "${sensorModel}",
>> +              "value": "${temp}"
>> +            },
>> +            {
>> +              "type": "double",
>> +              "key": "humidity",
>> +              "value": "${hum}"
>> +            }
>> +          ]
>> +        }
>> +      },
>> +      {
>> +        "endpoint": "/anon1",
>> +        "HTTPMethods": [
>> +          "GET",
>> +          "POST"
>> +        ],
>> +        "security":
>> +        {
>> +          "type": "anonymous"
>> +        },
>> +        "converter": {
>> +          "type": "json",
>> +          "deviceNameExpression": "Device 2",
>> +          "deviceTypeExpression": "default",
>> +          "attributes": [
>> +            {
>> +              "type": "string",
>> +              "key": "model",
>> +              "value": "Model2"
>> +            }
>> +          ],
>> +          "timeseries": [
>> +            {
>> +              "type": "double",
>> +              "key": "temperature",
>> +              "value": "${temp}"
>> +            },
>> +            {
>> +              "type": "double",
>> +              "key": "humidity",
>> +              "value": "${hum}"
>> +            }
>> +          ]
>> +        }
>> +      },
>> +      {
>> +        "endpoint": "/anon2",
>> +        "HTTPMethods": [
>> +          "POST"
>> +        ],
>> +        "security":
>> +        {
>> +          "type": "anonymous"
>> +        },
>> +        "converter": {
>> +          "type": "custom",
>> +          "deviceNameExpression": "SuperAnonDevice",
>> +          "deviceTypeExpression": "default",
>> +          "extension": "CustomRestUplinkConverter",
>> +          "extension-config": [
>> +            {
>> +            "key": "Totaliser",
>> +            "datatype": "float",
>> +            "fromByte": 0,
>> +            "toByte": 4,
>> +            "byteorder": "big",
>> +            "signed": true,
>> +            "multiplier": 1
>> +            }]
>> +        }
>> +      }
>> +    ],
>> +    "attributeUpdates": [
>> +        {
>> +          "HTTPMethod": "POST",
>> +          "SSLVerify": false,
>> +          "httpHeaders": {
>> +            "CONTENT-TYPE": "application/json"
>> +          },
>> +          "security": {
>> +            "type": "basic",
>> +            "username": "user",
>> +            "password": "passwd"
>> +          },
>> +          "timeout": 0.5,
>> +          "tries": 3,
>> +          "allowRedirects": true,
>> +          "deviceNameFilter": ".*REST$",
>> +          "attributeFilter": "data",
>> +          "requestUrlExpression": "sensor/${deviceName}/${attributeKey=
}",
>> +          "valueExpression": "{\"${attributeKey}\":\"${attributeValue}=
\"}"
>> +        }
>> +    ],
>> +    "serverSideRpc": [
>> +      {
>> +        "deviceNameFilter": ".*",
>> +        "methodFilter": "echo",
>> +        "requestUrlExpression": "http://127.0.0.1:5001/${deviceName}",
>> +        "responseTimeout": 1,
>> +        "HTTPMethod": "GET",
>> +        "valueExpression": "${params}",
>> +        "timeout": 0.5,
>> +        "tries": 3,
>> +        "httpHeaders": {
>> +          "Content-Type": "application/json"
>> +        },
>> +        "security": {
>> +          "type": "anonymous"
>> +        }
>> +      },
>> +      {
>> +        "deviceNameFilter": ".*",
>> +        "methodFilter": "no-reply",
>> +        "requestUrlExpression": "sensor/${deviceName}/request/${method=
Name}/${requestId}",
>> +        "HTTPMethod": "POST",
>> +        "valueExpression": "${params}",
>> +        "httpHeaders": {
>> +          "Content-Type": "application/json"
>> +        }
>> +      }
>> +    ]
>> +  }
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/snmp.json b/meta-oe/recipes-connectivity/thingsboard-gateway/thi=
ngsboard-gateway/snmp.json
>> new file mode 100644
>> index 0000000000..b4ddb42645
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/snmp.json
>> @@ -0,0 +1,138 @@
>> +{
>> +    "devices": [
>> +      {
>> +        "deviceName": "SNMP router",
>> +        "deviceType": "snmp",
>> +        "ip": "snmp.live.gambitcommunications.com",
>> +        "port": 161,
>> +        "pollPeriod": 5000,
>> +        "community": "public",
>> +        "attributes": [
>> +          {
>> +            "key": "ReceivedFromGet",
>> +            "method": "get",
>> +            "oid": "1.3.6.1.2.1.1.1.0",
>> +            "timeout": 6
>> +          },
>> +          {
>> +            "key": "ReceivedFromMultiGet",
>> +            "method": "multiget",
>> +            "oid": [
>> +              "1.3.6.1.2.1.1.1.0",
>> +              "1.3.6.1.2.1.1.2.0"
>> +            ],
>> +            "timeout": 6
>> +          },
>> +          {
>> +            "key": "ReceivedFromGetNext",
>> +            "method": "getnext",
>> +            "oid": "1.3.6.1.2.1.1.1.0",
>> +            "timeout": 6
>> +          },
>> +          {
>> +            "key": "ReceivedFromMultiWalk",
>> +            "method": "multiwalk",
>> +            "oid": [
>> +              "1.3.6.1.2.1.1.1.0",
>> +              "1.3.6.0.1.2.1"
>> +            ]
>> +          },
>> +          {
>> +            "key": "ReceivedFromBulkWalk",
>> +            "method": "bulkwalk",
>> +            "oid": [
>> +              "1.3.6.1.2.1.1.1.0",
>> +              "1.3.6.1.2.1.1.2.0"
>> +            ]
>> +          },
>> +          {
>> +            "key": "ReceivedFromBulkGet",
>> +            "method": "bulkget",
>> +            "scalarOid": [
>> +              "1.3.6.1.2.1.1.1.0",
>> +              "1.3.6.1.2.1.1.2.0"
>> +            ],
>> +            "repeatingOid": [
>> +              "1.3.6.1.2.1.1.1.0",
>> +              "1.3.6.1.2.1.1.2.0"
>> +            ],
>> +            "maxListSize": 10
>> +          }
>> +        ],
>> +        "telemetry": [
>> +          {
>> +            "key": "ReceivedFromWalk",
>> +            "community": "private",
>> +            "method": "walk",
>> +            "oid": "1.3.6.1.2.1.1.1.0"
>> +          },
>> +          {
>> +            "key": "ReceivedFromTable",
>> +            "method": "table",
>> +            "oid": "1.3.6.1.2.1.1"
>> +          }
>> +        ],
>> +        "attributeUpdateRequests": [
>> +          {
>> +            "attributeFilter": "dataToSet",
>> +            "method": "set",
>> +            "oid": "1.3.6.1.2.1.1.1.0"
>> +          },
>> +          {
>> +            "attributeFilter": "dataToMultiSet",
>> +            "method": "multiset",
>> +            "mappings": {
>> +              "1.2.3": "10",
>> +              "2.3.4": "${attribute}"
>> +            }
>> +          }
>> +        ],
>> +        "serverSideRpcRequests": [
>> +          {
>> +            "requestFilter": "setData",
>> +            "method": "set",
>> +            "oid": "1.3.6.1.2.1.1.1.0"
>> +          },
>> +          {
>> +            "requestFilter": "multiSetData",
>> +            "method": "multiset"
>> +          },
>> +          {
>> +            "requestFilter": "getData",
>> +            "method": "get",
>> +            "oid": "1.3.6.1.2.1.1.1.0"
>> +          },
>> +          {
>> +            "requestFilter": "runBulkWalk",
>> +            "method": "bulkwalk",
>> +            "oid": [
>> +              "1.3.6.1.2.1.1.1.0",
>> +              "1.3.6.1.2.1.1.2.0"
>> +            ]
>> +          }
>> +        ]
>> +      },
>> +      {
>> +        "deviceName": "SNMP router",
>> +        "deviceType": "snmp",
>> +        "ip": "127.0.0.1",
>> +        "pollPeriod": 5000,
>> +        "community": "public",
>> +        "converter": "CustomSNMPConverter",
>> +        "attributes": [
>> +          {
>> +            "key": "ReceivedFromGetWithCustomConverter",
>> +            "method": "get",
>> +            "oid": "1.3.6.1.2.1.1.1.0"
>> +          }
>> +        ],
>> +        "telemetry": [
>> +          {
>> +            "key": "ReceivedFromTableWithCustomConverter",
>> +            "method": "table",
>> +            "oid": "1.3.6.1.2.1.1.1.0"
>> +          }
>> +        ]
>> +      }
>> +    ]
>> +  }
>> \ No newline at end of file
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/tb_gateway.yaml b/meta-oe/recipes-connectivity/thingsboard-gatew=
ay/thingsboard-gateway/tb_gateway.yaml
>> new file mode 100755
>> index 0000000000..e3eb8f1fc7
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/tb_gateway.yaml
>> @@ -0,0 +1,66 @@
>> +thingsboard:
>> +  host: demo.thingsboard.io
>> +  port: 1883
>> +  remoteConfiguration: false
>> +  security:
>> +    accessToken: PUT_YOUR_GW_ACCESS_TOKEN_HERE
>> +storage:
>> +  type: memory
>> +  read_records_count: 100
>> +  max_records_count: 100000
>> +#  type: file
>> +#  data_folder_path: ./data/
>> +#  max_file_count: 10
>> +#  max_read_records_count: 10
>> +#  max_records_per_file: 10000
>> +connectors:
>> +  -
>> +    name: MQTT Broker Connector
>> +    type: mqtt
>> +    configuration: mqtt.json
>> +
>> +#  -
>> +#    name: Modbus Connector
>> +#    type: modbus
>> +#    configuration: modbus.json
>> +#
>> +#  -
>> +#    name: Modbus Connector
>> +#    type: modbus
>> +#    configuration: modbus_serial.json
>> +#
>> +#  -
>> +#    name: OPC-UA Connector
>> +#    type: opcua
>> +#    configuration: opcua.json
>> +#
>> +#  -
>> +#    name: BLE Connector
>> +#    type: ble
>> +#    configuration: ble.json
>> +#
>> +#  -
>> +#    name: REQUEST Connector
>> +#    type: request
>> +#    configuration: request.json
>> +#
>> +#  -
>> +#    name: CAN Connector
>> +#    type: can
>> +#    configuration: can.json
>> +#
>> +#  -
>> +#    name: BACnet Connector
>> +#    type: bacnet
>> +#    configuration: bacnet.json
>> +#
>> +#  -
>> +#    name: ODBC Connector
>> +#    type: odbc
>> +#    configuration: odbc.json
>> +#
>> +#  -
>> +#    name: Custom Serial Connector
>> +#    type: serial
>> +#    configuration: custom_serial.json
>> +#    class: CustomSerialConnector
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway/thingsboard-gateway.service b/meta-oe/recipes-connectivity/thing=
sboard-gateway/thingsboard-gateway/thingsboard-gateway.service
>> new file mode 100644
>> index 0000000000..5dd352a553
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way/thingsboard-gateway.service
>> @@ -0,0 +1,13 @@
>> +[Unit]
>> +Description =3D Systemd service for Thingsboard Gateway
>> +After       =3D network.target
>> +
>> +[Service]
>> +ExecStart   =3D /usr/bin/python3 /usr/bin/thingsboard-gateway
>> +ExecStop    =3D /bin/kill -INT $MAINPID
>> +ExecReload  =3D /bin/kill -TERM $MAINPID
>> +Restart     =3D always
>> +Type        =3D simple
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboa=
rd-gateway_2.5.2.bb b/meta-oe/recipes-connectivity/thingsboard-gateway/thin=
gsboard-gateway_2.5.2.bb
>> new file mode 100644
>> index 0000000000..2f0ef16c80
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/thingsboard-gateway/thingsboard-gate=
way_2.5.2.bb
>> @@ -0,0 +1,68 @@
>> +SUMMARY =3D "Open-source IoT platform for data collection, processing,=
 visualization, and device management"
>> +DESCRIPTION =3D "\
>> +The Thingsboard IoT Gateway is an open-source solution that allows you=
 \
>> +to integrate devices connected to legacy and third-party systems with =
Thingsboard."
>> +HOMEPAGE =3D "https://thingsboard.io/"
>> +
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89=
aea4e17d99a7cacdbeed46a0096b10"
>> +
>> +SRC_URI[md5sum] =3D "469c8b5cd1c16c20ef40f0a97a3a0fda"
>> +SRC_URI[sha256sum] =3D "b328f4e315c3541ac80a4931974a34a81afe4d1f382f48=
e8604669a55816c0d7"
>> +
>> +inherit pypi setuptools3
>> +
>> +PYPI_PACKAGE =3D "thingsboard-gateway"
>> +
>> +RDEPENDS_${PN} +=3D " python3-jsonpath-rw \
>> +                    python3-regex \
>> +                    python3-paho-mqtt \
>> +                    python3-pyyaml \
>> +                    python3-simplejson \
>> +                    python3-requests \
>> +                    python3-pip \
>> +                    python3-pyrsistent \
>> +"
>> +
>> +SRC_URI +=3D "file://bacnet.json \
>> +            file://ble.json \
>> +            file://can.json \
>> +            file://custom_serial.json \
>> +            file://modbus.json \
>> +            file://modbus_serial.json \
>> +            file://mqtt.json \
>> +            file://opcua.json \
>> +            file://odbc.json \
>> +            file://request.json \
>> +            file://rest.json \
>> +            file://snmp.json \
>> +            file://tb_gateway.yaml \
>> +            file://logs.conf \
>> +            file://thingsboard-gateway.service \
>> +            "
>> +
>> +
>> +inherit systemd
>> +
>> +SYSTEMD_PACKAGES =3D "${PN}"
>> +SYSTEMD_SERVICE_${PN} =3D "thingsboard-gateway.service"
>> +
>> +FILES_${PN} +=3D "/etc \
>> +                /lib \
>> +                /usr \
>> +"
>> +
>> +do_install_append(){
>> +
>> +    install -d ${D}${sysconfdir}/thingsboard-gateway/config
>> +
>> +    for file in $(find ${WORKDIR} -maxdepth 1 -type f -name *.json); d=
o
>> +        install -m 0644 "$file" ${D}${sysconfdir}/thingsboard-gateway/=
config
>> +    done
>> +
>> +    install -m 0644 ${WORKDIR}/tb_gateway.yaml ${D}${sysconfdir}/thing=
sboard-gateway/config
>> +    install -m 0644 ${WORKDIR}/logs.conf ${D}${sysconfdir}/thingsboard=
-gateway/config
>> +
>> +    install -d ${D}${systemd_unitdir}/system/
>> +    install -m 0644 ${WORKDIR}/thingsboard-gateway.service     ${D}${s=
ystemd_system_unitdir}/thingsboard-gateway.service
>> +}
>> \ No newline at end of file
>> --
>> 2.29.2
>>
>>=20
>>
