Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54450CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.96])
 by mx.groups.io with SMTP id smtpd.web11.16447.1761212826138789078
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=qZfcYtqD;
 spf=pass (domain: phytec.de, ip: 40.107.130.96, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYT5IPj0waoXKR9N3s3NLOOdFRAev76yHYFBENw+XZIvATpaJsv7+CcuBhk2ka+Xn3lw8HBtEMHHEq521P8ZflwmTXUtUqUIXaBXm7Ii/rcAd51enea944jDOEm6dziJb+jCt5XR9sKyrM3M7GxcUJmiJDOKXeACXpdFJ/Afyn3k/RA2OJVlZ4EYy7BU8hw/DRcXSt2dMHrDNdKU5PzIvo1mm4u1I9DBgFC5JMHRHa0PGa6yDKlyLDelmoZO9JsDbMaW4jw+q7siXEbO0/xLryJTDPBOX9C0PSDKFzZPWr9zHJEiFJG94u1wTk7bz5H2CPAtv+poCrQ6Ewxn0YJ3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf5zROWFgBnkeHRCySiKD313Gp13Cj4gMiU/BJl7e88=;
 b=J3AfI3xJAcAEkX/GGMS3rEVQ5MzZ2678DAHYtAkXJpx4v7rvj277vPvfYo4JVGnPie3eyWBNGNafKyfiLWxnw7jOESEzD5h6wIWYtwCoTqWi0gHBRPYm4PwrZxGBR2F9dPYdoCtuzQj5fZFJXYotGk1JKyUk343hAEtKfd05Q/oZqingpxPbRcemyAlbf2lUj9uDqUWLPNOfyPhFT3rTSalyx9iyhZ3cOHXqxzFHWf+x+E2/sxYlp//r6KoSGMiDLL45esJp0NvcC0AZLzfJpCf5SRCz8NZlD1SQ7ZZBVCCNoeCIiCKtlOqaSDtvOjFB5fD7NDNu71U3zbsuc2Nsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf5zROWFgBnkeHRCySiKD313Gp13Cj4gMiU/BJl7e88=;
 b=qZfcYtqDAm2Em4PQqrt3XjvBlXHfHBWipcaFZqCVtfsmLPROReeC/cSPlTBa/XqKjHXvK75SGA0OggQAf70ci+1gtNEjMp8ig2DnWNhJzupc6SPz1YLN96o4Y+qE6gUyiTmZ6JJdjZvjIb7UJbkvLoJvbhaufmbYSob37x99PdtM9XK/RQnj51KMTon7iZoKiKWurw4g9BPF8Kv2QbL9CrYZiEcx3z6R0hDjWoWt4pqTQFHkdzbarzqjvO3rurkmueh4ycyM6wyAj14sbCoqCza0CJ1gf5ySBLPHBpojjq22KkZILyeLJ9WsEh9eGOIHMuewtyu57qCI8igcsYR3gA==
Received: from DUZPR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::14) by AS8P195MB2140.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:56c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:46:58 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::75) by DUZPR01CA0046.outlook.office365.com
 (2603:10a6:10:469::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:58 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:55 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:35 +0200
Subject: [PATCH 7/8] thingsboard-gateway: Use configs from source
 repository
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-7-570de0ecafb2@phytec.de>
References: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
In-Reply-To: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	<upstream@lists.phytec.de>, Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AS8P195MB2140:EE_
X-MS-Office365-Filtering-Correlation-Id: 518a8d20-625d-431d-4dea-08de12191bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b5pAy1B0VMZ/GTy/65gKiS+KAflXzayHE/Kj5bEVlvnuR1Tt9ykYSIZKggtY?=
 =?us-ascii?Q?exLuMYJ29a4bs1AG1b+niko6M6/M7KO9YPx1OSkoMJx27nCsSUYQ+mKt1D7z?=
 =?us-ascii?Q?q+PDz0gyO9tCJ+tRELQDIVx72qxZ5k3o6+2wnNMJBherqKpvNe9P6HPnr66O?=
 =?us-ascii?Q?mm4JGeiixTVOF0ReUg7iriqfqjqYdEMcwEktrernv70iIgzplLC0UDl3U6q5?=
 =?us-ascii?Q?jrVJbrXPDa+SzJg4Sj73T6Dhs6kDFdGQ8sOxjq/tM101gchfYgPYowvYHCpx?=
 =?us-ascii?Q?+rQBHO4kpD3vQKGnEOX403v1vHQZ6gZNNmy2BtN0PQnUNVBnjBWX7mtA4tVN?=
 =?us-ascii?Q?aM2clA7Ic4l4mm/YY91652nKGUWOPsd8q7dX0b7dffvk4CTATz1tlrgGuJ6Y?=
 =?us-ascii?Q?NAz1bEcWf/czPkMpgk3Ege5tsg5+pKSFTK/8p1XlnhpIVqHxEQ4xNXeNm9rb?=
 =?us-ascii?Q?Vu3Gz/2sOPea17TCKw2AXL6eZT/pmwLQo51hkbKLAcu8TilJB6uyQ/9f9if5?=
 =?us-ascii?Q?J21eipkS7RBq5umiNiD3XmFAjFVRvvJxwBu2NTeeUngMj2dx3cDRNiS6ZJqA?=
 =?us-ascii?Q?XhzjKY1X/G/WmVA9Y2vwKdlEzF+1qDDNPsicPKg+7qdbydI5BrpCvzdAWI4U?=
 =?us-ascii?Q?NqAzu+0UCMnCGBvQ9K72b1Azj2vSFA1i5qh0Mq4kEs91s9o3OIcfPS0pJkUn?=
 =?us-ascii?Q?OQfuRUubnVUzN4bDmowEXQHQn1lahdp96A03CqGE28V7pQPREtAOTTYFz++T?=
 =?us-ascii?Q?GwdgYg2/aetz6326HlTP6/8v62YEsdsUSwLqiDviulcGO1+bF20WbRspRjVA?=
 =?us-ascii?Q?eZGEpSrI2fSuvU2//5nOSPTWURhqI9QLuYKjxVKjah2c3naEsqvs/K6XKCzc?=
 =?us-ascii?Q?VONjR3CEqLtz+3sjd6s9oSzI+457ABqybF70MVP0HixWtlr+IAxodvoS01Sd?=
 =?us-ascii?Q?sG1LyZa4tkY+i9gqoTGM4cGM6GsKIrRBW1+zyEmnpDwyl3LaZPEiBfJtXqgt?=
 =?us-ascii?Q?A35kUidDfT8/qmxa14CixWIne9yVlHx9iD+0RNsas98HiPNdqsqLHxyVNOZF?=
 =?us-ascii?Q?dI0mi0LZZ2EZdAeXC5P87Rdt4m7TNsJyNbVHlrus1mxIHK0aFBmMy+j6t1we?=
 =?us-ascii?Q?RgH8nTGmmUepJHNkcSGih25cyaPFIb74PSSzF7MrW6Ghqto95Ny8xSMqu40o?=
 =?us-ascii?Q?qZotKLWTl6gq2JII5nqNdRebW6ICp/WpJz2mlP5FTrBG/SbuT2jjcQ8bq1X2?=
 =?us-ascii?Q?yHME3wBIaJF7VbdD1+RihRQFcJecJSU6UJqLJ18q5Wk4JOy59r5sJUcmbg+f?=
 =?us-ascii?Q?5qdqwmK7MkT08LL+dwI/m5FpeALQHC6tQuNmsAzkyHo/7UJG89kcE252A2gH?=
 =?us-ascii?Q?IKF11WVrXwZ6wvNQKxJRc0e3dyZ4A59mKd/EXB5VdUbTMs9R6FeFkDaBErlT?=
 =?us-ascii?Q?o57n7xgZ5Vhb7bDvxnNGhlzs6iD7sPa1G368XDo9Zt5bP00oDsb3736euZ/C?=
 =?us-ascii?Q?9EjBI4Th3uCWgFU=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:58.2846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 518a8d20-625d-431d-4dea-08de12191bd4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120927

Replace the outdated configuration files with the ones found the source
repository of thingsboard-gateway. This makes sure, the configuration
file examples stay up-to-date in future versions.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../thingsboard-gateway/bacnet.json                |  58 -------
 .../thingsboard-gateway/ble.json                   |  53 -------
 .../thingsboard-gateway/can.json                   |  89 -----------
 .../thingsboard-gateway/custom_serial.json         |  33 ----
 .../thingsboard-gateway/logs.conf                  |  77 ----------
 .../thingsboard-gateway/modbus.json                | 169 -----------------=
----
 .../thingsboard-gateway/modbus_serial.json         |  29 ----
 .../thingsboard-gateway/mqtt.json                  | 132 ----------------
 .../thingsboard-gateway/odbc.json                  |  54 -------
 .../thingsboard-gateway/opcua.json                 |  49 ------
 .../thingsboard-gateway/request.json               | 146 -----------------=
-
 .../thingsboard-gateway/rest.json                  | 152 -----------------=
-
 .../thingsboard-gateway/snmp.json                  | 138 -----------------
 .../thingsboard-gateway/tb_gateway.yaml            |  66 --------
 .../thingsboard-gateway_3.7.4.bb                   |  28 +---
 15 files changed, 3 insertions(+), 1270 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/bacnet.json b/meta-oe/dynamic-layers/meta=
-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/bacnet=
.json
deleted file mode 100644
index e36a2165d13ac514c17336f09cfe22f543cea670..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/bacnet.json
+++ /dev/null
@@ -1,58 +0,0 @@
-{
-    "general": {
-      "objectName": "TB_gateway",
-      "address": "192.168.188.181:1052",
-      "objectIdentifier": 599,
-      "maxApduLengthAccepted": 1024,
-      "segmentationSupported": "segmentedBoth",
-      "vendorIdentifier": 15
-    },
-    "devices": [
-      {
-        "deviceName": "BACnet Device ${objectName}",
-        "deviceType": "default",
-        "address": "192.168.188.181:10520",
-        "pollPeriod": 10000,
-        "attributes": [
-          {
-            "key": "temperature",
-            "type": "string",
-            "objectId": "analogOutput:1",
-            "propertyId": "presentValue"
-          }
-        ],
-        "timeseries": [
-          {
-            "key": "state",
-            "type": "bool",
-            "objectId": "binaryValue:1",
-            "propertyId": "presentValue"
-          }
-        ],
-        "attributeUpdates": [
-          {
-            "key": "brightness",
-            "requestType": "writeProperty",
-            "objectId": "analogOutput:1",
-            "propertyId": "presentValue"
-          }
-        ],
-        "serverSideRpc": [
-          {
-            "method": "set_state",
-            "requestType": "writeProperty",
-            "requestTimeout": 10000,
-            "objectId": "binaryOutput:1",
-            "propertyId": "presentValue"
-          },
-          {
-            "method": "get_state",
-            "requestType": "readProperty",
-            "requestTimeout": 10000,
-            "objectId": "binaryOutput:1",
-            "propertyId": "presentValue"
-          }
-        ]
-      }
-    ]
-  }
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/ble.json b/meta-oe/dynamic-layers/meta-py=
thon/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/ble.json
deleted file mode 100755
index 2a5da3f41d111ad6d5c0b27bea670d088d6b913b..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/ble.json
+++ /dev/null
@@ -1,53 +0,0 @@
-{
-    "name": "BLE Connector",
-    "rescanIntervalSeconds": 100,
-    "checkIntervalSeconds": 100,
-    "scanTimeSeconds": 5,
-    "passiveScanMode": true,
-    "devices": [
-        {
-            "name": "Temperature and humidity sensor",
-            "MACAddress": "4C:65:A8:DF:85:C0",
-            "addrType": "public",
-            "telemetry": [
-                {
-                    "key": "temperature",
-                    "method": "notify",
-                    "characteristicUUID": "226CAA55-6476-4566-7562-6673447=
0666D",
-                    "byteFrom": 2,
-                    "byteTo": 6
-                },
-                {
-                    "key": "humidity",
-                    "method": "notify",
-                    "characteristicUUID": "226CAA55-6476-4566-7562-6673447=
0666D",
-                    "byteFrom": 9,
-                    "byteTo": 13
-                }
-            ],
-            "attributes": [
-                {
-                    "key": "name",
-                    "characteristicUUID": "00002A00-0000-1000-8000-00805F9=
B34FB",
-                    "method": "read",
-                    "byteFrom": 0,
-                    "byteTo": -1
-                }
-            ],
-            "attributeUpdates": [
-                {
-                    "attributeOnThingsBoard": "sharedName",
-                    "characteristicUUID": "00002A00-0000-1000-8000-00805F9=
B34FB"
-                }
-            ],
-            "serverSideRpc": [
-                {
-                    "methodRPC": "rpcMethod1",
-                    "withResponse": true,
-                    "characteristicUUID": "00002A00-0000-1000-8000-00805F9=
B34FB",
-                    "methodProcessing": "read"
-                }
-            ]
-        }
-    ]
-}
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/can.json b/meta-oe/dynamic-layers/meta-py=
thon/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/can.json
deleted file mode 100644
index b5cec0045a9760e5881afe538b8620766057f819..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/can.json
+++ /dev/null
@@ -1,89 +0,0 @@
-{
-    "interface": "socketcan",
-    "channel": "vcan0",
-    "backend": {
-      "fd": true
-    },
-    "reconnectPeriod": 5,
-    "devices": [
-      {
-        "name": "Car",
-        "sendDataOnlyOnChange": false,
-        "enableUnknownRpc": true,
-        "strictEval": false,
-        "attributes": [
-          {
-            "key": "isDriverDoorOpened",
-            "nodeId": 41,
-            "command": "2:2:big:8717",
-            "value": "4:1:int",
-            "expression": "bool(value & 0b00000100)",
-            "polling": {
-              "type": "once",
-              "dataInHex": "AB CD AB CD"
-            }
-          }
-        ],
-        "timeseries": [
-          {
-            "key": "rpm",
-            "nodeId": 1918,
-            "isExtendedId": true,
-            "command": "2:2:big:48059",
-            "value": "4:2:big:int",
-            "expression": "value / 4",
-            "polling": {
-              "type": "always",
-              "period": 5,
-              "dataInHex": "aaaa bbbb aaaa bbbb"
-            }
-          },
-          {
-            "key": "milliage",
-            "nodeId": 1918,
-            "isExtendedId": true,
-            "value": "4:2:little:int",
-            "expression": "value * 10",
-            "polling": {
-              "type": "always",
-              "period": 30,
-              "dataInHex": "aa bb cc dd ee ff aa bb"
-            }
-          }
-        ],
-        "attributeUpdates": [
-          {
-            "attributeOnThingsBoard": "softwareVersion",
-            "nodeId": 64,
-            "isExtendedId": true,
-            "dataLength": 4,
-            "dataExpression": "value + 5",
-            "dataByteorder": "little"
-          }
-        ],
-        "serverSideRpc": [
-          {
-            "method": "sendSameData",
-            "nodeId": 4,
-            "isExtendedId": true,
-            "isFd": true,
-            "bitrateSwitch": true,
-            "dataInHex": "aa bb cc dd ee ff    aa bb aa bb cc d ee ff"
-          },
-          {
-            "method": "setLightLevel",
-            "nodeId": 5,
-            "dataLength": 2,
-            "dataByteorder": "little",
-            "dataBefore": "00AA"
-          },
-          {
-            "method": "setSpeed",
-            "nodeId": 16,
-            "dataAfter": "0102",
-            "dataExpression": "userSpeed if maxAllowedSpeed > userSpeed el=
se maxAllowedSpeed"
-          }
-        ]
-      }
-    ]
-  }
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/custom_serial.json b/meta-oe/dynamic-laye=
rs/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/custom_serial.json
deleted file mode 100755
index 0aee5cb765bd1d8a6efebba4bf6d4e972be613ef..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/custom_serial.json
+++ /dev/null
@@ -1,33 +0,0 @@
-{
-  "name": "Custom serial connector",
-  "devices": [
-    {
-      "name": "CustomSerialDevice1",
-      "type": "default",
-      "port": "/dev/ttyUSB0",
-      "baudrate": 9600,
-      "converter": "CustomSerialUplinkConverter",
-      "telemetry": [
-        {
-          "type": "byte",
-          "key": "humidity",
-          "untilDelimiter": "\r"
-        }
-      ],
-      "attributes":[
-        {
-          "key": "SerialNumber",
-          "type": "string",
-          "fromByte": 4,
-          "toByte": -1
-        }
-      ],
-      "attributeUpdates": [
-        {
-          "attributeOnThingsBoard": "attr1",
-          "stringToDevice": "value =3D ${attr1}\n"
-        }
-      ]
-    }
-  ]
-}
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/logs.conf b/meta-oe/dynamic-layers/meta-p=
ython/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/logs.con=
f
deleted file mode 100755
index d66c2b84a8f6c68285f4c07f42bcc59aaed5e8fd..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/logs.conf
+++ /dev/null
@@ -1,77 +0,0 @@
-[loggers]
-keys=3Droot, service, connector, converter, tb_connection, storage, extens=
ion
-[handlers]
-keys=3DconsoleHandler, serviceHandler, connectorHandler, converterHandler,=
 tb_connectionHandler, storageHandler, extensionHandler
-[formatters]
-keys=3DLogFormatter
-[logger_root]
-level=3DERROR
-handlers=3DconsoleHandler
-[logger_connector]
-level=3DINFO
-handlers=3DconnectorHandler
-formatter=3DLogFormatter
-qualname=3Dconnector
-[logger_storage]
-level=3DINFO
-handlers=3DstorageHandler
-formatter=3DLogFormatter
-qualname=3Dstorage
-[logger_tb_connection]
-level=3DINFO
-handlers=3Dtb_connectionHandler
-formatter=3DLogFormatter
-qualname=3Dtb_connection
-[logger_service]
-level=3DINFO
-handlers=3DserviceHandler
-formatter=3DLogFormatter
-qualname=3Dservice
-[logger_converter]
-level=3DINFO
-handlers=3DconverterHandler
-formatter=3DLogFormatter
-qualname=3Dconverter
-[logger_extension]
-level=3DINFO
-handlers=3DconnectorHandler
-formatter=3DLogFormatter
-qualname=3Dextension
-[handler_consoleHandler]
-class=3DStreamHandler
-level=3DINFO
-formatter=3DLogFormatter
-args=3D(sys.stdout,)
-[handler_connectorHandler]
-level=3DINFO
-class=3Dlogging.handlers.TimedRotatingFileHandler
-formatter=3DLogFormatter
-args=3D("./logs/connector.log", "d", 1, 7,)
-[handler_storageHandler]
-level=3DINFO
-class=3Dlogging.handlers.TimedRotatingFileHandler
-formatter=3DLogFormatter
-args=3D("./logs/storage.log", "d", 1, 7,)
-[handler_serviceHandler]
-level=3DINFO
-class=3Dlogging.handlers.TimedRotatingFileHandler
-formatter=3DLogFormatter
-args=3D("./logs/service.log", "d", 1, 7,)
-[handler_converterHandler]
-level=3DINFO
-class=3Dlogging.handlers.TimedRotatingFileHandler
-formatter=3DLogFormatter
-args=3D("./logs/converter.log", "d", 1, 3,)
-[handler_extensionHandler]
-level=3DINFO
-class=3Dlogging.handlers.TimedRotatingFileHandler
-formatter=3DLogFormatter
-args=3D("./logs/extension.log", "d", 1, 3,)
-[handler_tb_connectionHandler]
-level=3DINFO
-class=3Dlogging.handlers.TimedRotatingFileHandler
-formatter=3DLogFormatter
-args=3D("./logs/tb_connection.log", "d", 1, 3,)
-[formatter_LogFormatter]
-format=3D"%(asctime)s - %(levelname)s - [%(filename)s] - %(module)s - %(li=
neno)d - %(message)s"
-datefmt=3D"%Y-%m-%d %H:%M:%S"
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/modbus.json b/meta-oe/dynamic-layers/meta=
-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/modbus=
.json
deleted file mode 100755
index 479d8aa4d01f8d4cbfd2450b559ebabcf7d27583..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/modbus.json
+++ /dev/null
@@ -1,169 +0,0 @@
-{
-  "server": {
-    "type": "tcp",
-    "host": "127.0.0.1",
-    "port": 5020,
-    "timeout": 35,
-    "method": "socket",
-    "byteOrder": "BIG",
-    "devices": [
-      {
-        "unitId": 1,
-        "deviceName": "Temp Sensor",
-        "attributesPollPeriod": 5000,
-        "timeseriesPollPeriod": 5000,
-        "sendDataOnlyOnChange": true,
-        "attributes": [
-          {
-            "tag": "string_read",
-            "type": "string",
-            "functionCode": 4,
-            "objectsCount": 4,
-            "address": 1
-          },
-          {
-            "tag": "bits_read",
-            "type": "bits",
-            "functionCode": 4,
-            "objectsCount": 1,
-            "address": 5
-          },
-          {
-            "tag": "8int_read",
-            "type": "8int",
-            "functionCode": 4,
-            "objectsCount": 1,
-            "address": 6
-          },
-          {
-            "tag": "16int_read",
-            "type": "16int",
-            "functionCode": 4,
-            "objectsCount": 1,
-            "address": 7
-          },
-          {
-            "tag": "32int_read_divider",
-            "type": "32int",
-            "functionCode": 4,
-            "objectsCount": 2,
-            "address": 8,
-            "divider": 10
-          },
-          {
-            "tag": "8int_read_multiplier",
-            "type": "8int",
-            "functionCode": 4,
-            "objectsCount": 1,
-            "address": 10,
-            "multiplier": 10
-          },
-          {
-            "tag": "32int_read",
-            "type": "32int",
-            "functionCode": 4,
-            "objectsCount": 2,
-            "address": 11
-          },
-          {
-            "tag": "64int_read",
-            "type": "64int",
-            "functionCode": 4,
-            "objectsCount": 4,
-            "address": 13
-          }
-      ],
-      "timeseries": [
-          {
-            "tag": "8uint_read",
-            "type": "8uint",
-            "functionCode": 4,
-            "objectsCount": 1,
-            "address": 17
-          },
-          {
-            "tag": "16uint_read",
-            "type": "16uint",
-            "functionCode": 4,
-            "objectsCount": 2,
-            "address": 18
-          },
-          {
-            "tag": "32uint_read",
-            "type": "32uint",
-            "functionCode": 4,
-            "objectsCount": 4,
-            "address": 20
-          },
-          {
-            "tag": "64uint_read",
-            "type": "64uint",
-            "functionCode": 4,
-            "objectsCount": 1,
-            "address": 24
-          },
-          {
-            "tag": "16float_read",
-            "type": "16float",
-            "functionCode": 4,
-            "objectsCount": 1,
-            "address": 25
-          },
-          {
-            "tag": "32float_read",
-            "type": "32float",
-            "functionCode": 4,
-            "objectsCount": 2,
-            "address": 26
-          },
-          {
-            "tag": "64float_read",
-            "type": "64float",
-            "functionCode": 4,
-            "objectsCount": 4,
-            "address": 28
-          }
-        ],
-        "attributeUpdates": [
-          {
-            "tag": "shared_attribute_write",
-            "type": "32int",
-            "functionCode": 6,
-            "objectsCount": 2,
-            "address": 29
-          }
-        ],
-        "rpc": [
-          {
-            "tag": "setValue",
-            "type": "bits",
-            "functionCode": 5,
-            "objectsCount": 1,
-            "address": 31
-          },
-          {
-            "tag": "getValue",
-            "type": "bits",
-            "functionCode": 1,
-            "objectsCount": 1,
-            "address": 31
-          },
-          {
-            "tag": "setCPUFanSpeed",
-            "type": "32int",
-            "functionCode": 16,
-            "objectsCount": 2,
-            "address": 33
-          },
-          {
-            "tag":"getCPULoad",
-            "type": "32int",
-            "functionCode": 4,
-            "objectsCount": 2,
-            "address": 35
-          }
-        ]
-      }
-    ]
-  }
-}
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/modbus_serial.json b/meta-oe/dynamic-laye=
rs/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway=
/modbus_serial.json
deleted file mode 100755
index 19b38e3f7bcf7f7d7fbf4e34bb601718e983632d..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/modbus_serial.json
+++ /dev/null
@@ -1,29 +0,0 @@
-{
-  "server": {
-    "name": "Modbus Default Server",
-    "type": "serial",
-    "method": "rtu",
-    "port": "/dev/ttyUSB0",
-    "baudrate": 19200,
-    "timeout": 35,
-    "devices": [
-      {
-        "unitId": 1,
-        "deviceName": "Temp Sensor",
-        "attributesPollPeriod": 5000,
-        "timeseriesPollPeriod": 5000,
-        "sendDataOnlyOnChange": true,
-        "attributes": [
-          {
-            "byteOrder": "BIG",
-            "tag": "test",
-            "type": "long",
-            "functionCode": 4,
-            "registerCount": 1,
-            "address": 4
-          }
-        ]
-      }
-    ]
-  }
-}
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/mqtt.json b/meta-oe/dynamic-layers/meta-p=
ython/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/mqtt.jso=
n
deleted file mode 100755
index 6b78a7cec94fe332a9232099731c23479da3dc17..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/mqtt.json
+++ /dev/null
@@ -1,132 +0,0 @@
-{
-  "broker": {
-    "name":"Default Local Broker",
-    "host":"127.0.0.1",
-    "port":1883,
-    "clientId": "ThingsBoard_gateway",
-    "security": {
-      "type": "basic",
-      "username": "user",
-      "password": "password"
-    }
-  },
-  "mapping": [
-    {
-      "topicFilter": "/sensor/data",
-      "converter": {
-        "type": "json",
-        "deviceNameJsonExpression": "${serialNumber}",
-        "deviceTypeJsonExpression": "${sensorType}",
-        "timeout": 60000,
-        "attributes": [
-          {
-            "type": "string",
-            "key": "model",
-            "value": "${sensorModel}"
-          },
-          {
-            "type": "string",
-            "key": "${sensorModel}",
-            "value": "on"
-          }
-        ],
-        "timeseries": [
-          {
-            "type": "double",
-            "key": "temperature",
-            "value": "${temp}"
-          },
-          {
-            "type": "double",
-            "key": "humidity",
-            "value": "${hum}"
-          }
-        ]
-      }
-    },
-    {
-      "topicFilter": "/sensor/+/data",
-      "converter": {
-        "type": "json",
-        "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/data)",
-        "deviceTypeTopicExpression": "Thermometer",
-        "timeout": 60000,
-        "attributes": [
-          {
-            "type": "string",
-            "key": "model",
-            "value": "${sensorModel}"
-          }
-        ],
-        "timeseries": [
-          {
-            "type": "double",
-            "key": "temperature",
-            "value": "${temp}"
-          },
-          {
-            "type": "double",
-            "key": "humidity",
-            "value": "${hum}"
-          }
-        ]
-      }
-    },
-    {
-      "topicFilter": "/custom/sensors/+",
-      "converter": {
-        "type": "custom",
-        "extension": "CustomMqttUplinkConverter",
-        "extension-config": {
-            "temperatureBytes" : 2,
-            "humidityBytes" :  2,
-            "batteryLevelBytes" : 1
-        }
-      }
-    }
-  ],
-  "connectRequests": [
-    {
-      "topicFilter": "sensor/connect",
-      "deviceNameJsonExpression": "${SerialNumber}"
-    },
-    {
-      "topicFilter": "sensor/+/connect",
-      "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/connect)"
-    }
-  ],
-  "disconnectRequests": [
-    {
-      "topicFilter": "sensor/disconnect",
-      "deviceNameJsonExpression": "${SerialNumber}"
-    },
-    {
-      "topicFilter": "sensor/+/disconnect",
-      "deviceNameTopicExpression": "(?<=3Dsensor\/)(.*?)(?=3D\/disconnect)=
"
-    }
-  ],
-  "attributeUpdates": [
-    {
-      "deviceNameFilter": "SmartMeter.*",
-      "attributeFilter": "uploadFrequency",
-      "topicExpression": "sensor/${deviceName}/${attributeKey}",
-      "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
-    }
-  ],
-  "serverSideRpc": [
-    {
-      "deviceNameFilter": ".*",
-      "methodFilter": "echo",
-      "requestTopicExpression": "sensor/${deviceName}/request/${methodName=
}/${requestId}",
-      "responseTopicExpression": "sensor/${deviceName}/response/${methodNa=
me}/${requestId}",
-      "responseTimeout": 10000,
-      "valueExpression": "${params}"
-    },
-    {
-      "deviceNameFilter": ".*",
-      "methodFilter": "no-reply",
-      "requestTopicExpression": "sensor/${deviceName}/request/${methodName=
}/${requestId}",
-      "valueExpression": "${params}"
-    }
-  ]
-}
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/odbc.json b/meta-oe/dynamic-layers/meta-p=
ython/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/odbc.jso=
n
deleted file mode 100644
index c93992a2623bac5ceca276749a9d86d9d47b8e2a..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/odbc.json
+++ /dev/null
@@ -1,54 +0,0 @@
-{
-    "connection": {
-      "str": "Driver=3D{PostgreSQL};Server=3Dlocalhost;Port=3D5432;Databas=
e=3Dthingsboard;Uid=3Dpostgres;Pwd=3Dpostgres;",
-      "attributes": {
-        "autocommit": true,
-        "timeout": 0
-      },
-      "encoding": "utf-8",
-      "decoding": {
-        "char": "utf-8",
-        "wchar": "utf-8",
-        "metadata": "utf-16le"
-      },
-      "reconnect": true,
-      "reconnectPeriod": 60
-    },
-    "pyodbc": {
-      "pooling": false
-    },
-    "polling": {
-      "query": "SELECT bool_v, str_v, dbl_v, long_v, entity_id, ts FROM ts=
_kv WHERE ts > ? ORDER BY ts ASC LIMIT 10",
-      "period": 10,
-      "iterator": {
-        "column": "ts",
-        "query": "SELECT MIN(ts) - 1 FROM ts_kv",
-        "persistent": false
-      }
-    },
-    "mapping": {
-      "device": {
-        "type": "postgres",
-        "name": "'ODBC ' + entity_id"
-      },
-      "sendDataOnlyOnChange": false,
-      "attributes": "*",
-      "timeseries": [
-        {
-          "name": "value",
-          "value": "[i for i in [str_v, long_v, dbl_v,bool_v] if i is not =
None][0]"
-        }
-      ]
-    },
-    "serverSideRpc": {
-      "enableUnknownRpc": false,
-      "overrideRpcConfig": true,
-      "methods": [
-        "procedureOne",
-        {
-          "name": "procedureTwo",
-          "args": [ "One", 2, 3.0 ]
-        }
-      ]
-    }
-  }
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/opcua.json b/meta-oe/dynamic-layers/meta-=
python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/opcua.j=
son
deleted file mode 100755
index 1deed7d524e374542f459b9f2421524da604155a..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/opcua.json
+++ /dev/null
@@ -1,49 +0,0 @@
-{
-  "server": {
-    "name": "OPC-UA Default Server",
-    "url": "localhost:4840/freeopcua/server/",
-    "timeoutInMillis": 5000,
-    "scanPeriodInMillis": 5000,
-    "disableSubscriptions":false,
-    "subCheckPeriodInMillis": 100,
-    "showMap": false,
-    "security": "Basic128Rsa15",
-    "identity": {
-      "type": "anonymous"
-    },
-    "mapping": [
-      {
-        "deviceNodePattern": "Root\\.Objects\\.Device1",
-        "deviceNamePattern": "Device ${Root\\.Objects\\.Device1\\.serialNu=
mber}",
-        "attributes": [
-          {
-            "key": "temperature =C2=B0C",
-            "path": "${ns=3D2;i=3D5}"
-          }
-        ],
-        "timeseries": [
-          {
-            "key": "humidity",
-            "path": "${Root\\.Objects\\.Device1\\.TemperatureAndHumiditySe=
nsor\\.Humidity}"
-          },
-          {
-            "key": "batteryLevel",
-            "path": "${Battery\\.batteryLevel}"
-          }
-        ],
-        "rpc_methods": [
-          {
-            "method": "multiply",
-            "arguments": [2, 4]
-          }
-        ],
-        "attributes_updates": [
-          {
-            "attributeOnThingsBoard": "deviceName",
-            "attributeOnDevice": "Root\\.Objects\\.Device1\\.serialNumber"
-          }
-        ]
-      }
-    ]
-  }
-}
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/request.json b/meta-oe/dynamic-layers/met=
a-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/reque=
st.json
deleted file mode 100644
index 43237a7dc059142b7433ea48956e4ff55f3b0f19..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/request.json
+++ /dev/null
@@ -1,146 +0,0 @@
-"job": "leader"
-},
-"allowRedirects": true,
-"timeout": 0.5,
-"scanPeriod": 5,
-"converter": {
-  "type": "json",
-  "deviceNameJsonExpression": "SD8500",
-  "deviceTypeJsonExpression": "SD",
-  "attributes": [
-    {
-      "key": "serialNumber",
-      "type": "string",
-      "value": "${serial}"
-    }
-  ],
-  "telemetry": [
-    {
-      "key": "Maintainer",
-      "type": "string",
-      "value": "${Developer}"
-    }
-  ]
-}
-},
-{
-"url": "get_info",
-"httpMethod": "GET",
-"httpHeaders": {
-  "ACCEPT": "application/json"
-},
-"allowRedirects": true,
-"timeout": 0.5,
-"scanPeriod": 100,
-"converter": {
-  "type": "custom",
-  "deviceNameJsonExpression": "SD8500",
-  "deviceTypeJsonExpression": "SD",
-  "extension": "CustomRequestUplinkConverter",
-  "extension-config": [
-    {
-      "key": "Totaliser",
-      "type": "float",
-      "fromByte": 0,
-      "toByte": 4,
-      "byteorder": "big",
-      "signed": true,
-      "multiplier": 1
-    },
-    {
-      "key": "Flow",
-      "type": "int",
-      "fromByte": 4,
-      "toByte": 6,
-      "byteorder": "big",
-      "signed": true,
-      "multiplier": 0.01
-    },
-    {
-      "key": "Temperature",
-      "type": "int",
-      "fromByte": 8,
-      "toByte": 10,
-      "byteorder": "big",
-      "signed": true,
-      "multiplier": 0.01
-    },
-    {
-      "key": "Pressure",
-      "type": "int",
-      "fromByte": 12,
-      "toByte": 14,
-      "byteorder": "big",
-      "signed": true,
-      "multiplier": 0.01
-    },
-    {
-      "key": "deviceStatus",
-      "type": "int",
-      "byteAddress": 15,
-      "fromBit": 4,
-      "toBit": 8,
-      "byteorder": "big",
-      "signed": false
-    },
-    {
-      "key": "OUT2",
-      "type": "int",
-      "byteAddress": 15,
-      "fromBit": 1,
-      "toBit": 2,
-      "byteorder": "big"
-    },
-    {
-      "key": "OUT1",
-      "type": "int",
-      "byteAddress": 15,
-      "fromBit": 0,
-      "toBit": 1,
-      "byteorder": "big"
-    }
-  ]
-}
-}
-],
-"attributeUpdates": [
-{
-  "httpMethod": "POST",
-  "httpHeaders": {
-    "CONTENT-TYPE": "application/json"
-  },
-  "timeout": 0.5,
-  "tries": 3,
-  "allowRedirects": true,
-  "deviceNameFilter": "SD.*",
-  "attributeFilter": "send_data",
-  "requestUrlExpression": "sensor/${deviceName}/${attributeKey}",
-  "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
-}
-],
-"serverSideRpc": [
-{
-"deviceNameFilter": ".*",
-"methodFilter": "echo",
-"requestUrlExpression": "sensor/${deviceName}/request/${methodName}/${requ=
estId}",
-"responseTimeout": 1,
-"httpMethod": "GET",
-"valueExpression": "${params}",
-"timeout": 0.5,
-"tries": 3,
-"httpHeaders": {
-  "Content-Type": "application/json"
-}
-},
-{
-"deviceNameFilter": ".*",
-"methodFilter": "no-reply",
-"requestUrlExpression": "sensor/${deviceName}/request/${methodName}/${requ=
estId}",
-"httpMethod": "POST",
-"valueExpression": "${params}",
-"httpHeaders": {
-  "Content-Type": "application/json"
-}
-}
-]
-}
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/rest.json b/meta-oe/dynamic-layers/meta-p=
ython/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/rest.jso=
n
deleted file mode 100644
index be6c6ff18eccd7ca205f5ea53a1af892ddd65897..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/rest.json
+++ /dev/null
@@ -1,152 +0,0 @@
-{
-    "host": "127.0.0.1",
-    "port": "5000",
-    "mapping":[
-      {
-        "endpoint": "/device1",
-        "HTTPMethods": [
-          "POST"
-        ],
-        "security":
-        {
-          "type": "basic",
-          "username": "user",
-          "password": "passwd"
-        },
-        "converter": {
-          "type": "json",
-          "deviceNameExpression": "Device ${name}",
-          "deviceTypeExpression": "default",
-          "attributes": [
-            {
-              "type": "string",
-              "key": "model",
-              "value": "${sensorModel}"
-            }
-          ],
-          "timeseries": [
-            {
-              "type": "double",
-              "key": "${sensorModel}",
-              "value": "${temp}"
-            },
-            {
-              "type": "double",
-              "key": "humidity",
-              "value": "${hum}"
-            }
-          ]
-        }
-      },
-      {
-        "endpoint": "/anon1",
-        "HTTPMethods": [
-          "GET",
-          "POST"
-        ],
-        "security":
-        {
-          "type": "anonymous"
-        },
-        "converter": {
-          "type": "json",
-          "deviceNameExpression": "Device 2",
-          "deviceTypeExpression": "default",
-          "attributes": [
-            {
-              "type": "string",
-              "key": "model",
-              "value": "Model2"
-            }
-          ],
-          "timeseries": [
-            {
-              "type": "double",
-              "key": "temperature",
-              "value": "${temp}"
-            },
-            {
-              "type": "double",
-              "key": "humidity",
-              "value": "${hum}"
-            }
-          ]
-        }
-      },
-      {
-        "endpoint": "/anon2",
-        "HTTPMethods": [
-          "POST"
-        ],
-        "security":
-        {
-          "type": "anonymous"
-        },
-        "converter": {
-          "type": "custom",
-          "deviceNameExpression": "SuperAnonDevice",
-          "deviceTypeExpression": "default",
-          "extension": "CustomRestUplinkConverter",
-          "extension-config": [
-            {
-            "key": "Totaliser",
-            "datatype": "float",
-            "fromByte": 0,
-            "toByte": 4,
-            "byteorder": "big",
-            "signed": true,
-            "multiplier": 1
-            }]
-        }
-      }
-    ],
-    "attributeUpdates": [
-        {
-          "HTTPMethod": "POST",
-          "SSLVerify": false,
-          "httpHeaders": {
-            "CONTENT-TYPE": "application/json"
-          },
-          "security": {
-            "type": "basic",
-            "username": "user",
-            "password": "passwd"
-          },
-          "timeout": 0.5,
-          "tries": 3,
-          "allowRedirects": true,
-          "deviceNameFilter": ".*REST$",
-          "attributeFilter": "data",
-          "requestUrlExpression": "sensor/${deviceName}/${attributeKey}",
-          "valueExpression": "{\"${attributeKey}\":\"${attributeValue}\"}"
-        }
-    ],
-    "serverSideRpc": [
-      {
-        "deviceNameFilter": ".*",
-        "methodFilter": "echo",
-        "requestUrlExpression": "http://127.0.0.1:5001/${deviceName}",
-        "responseTimeout": 1,
-        "HTTPMethod": "GET",
-        "valueExpression": "${params}",
-        "timeout": 0.5,
-        "tries": 3,
-        "httpHeaders": {
-          "Content-Type": "application/json"
-        },
-        "security": {
-          "type": "anonymous"
-        }
-      },
-      {
-        "deviceNameFilter": ".*",
-        "methodFilter": "no-reply",
-        "requestUrlExpression": "sensor/${deviceName}/request/${methodName=
}/${requestId}",
-        "HTTPMethod": "POST",
-        "valueExpression": "${params}",
-        "httpHeaders": {
-          "Content-Type": "application/json"
-        }
-      }
-    ]
-  }
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/snmp.json b/meta-oe/dynamic-layers/meta-p=
ython/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/snmp.jso=
n
deleted file mode 100644
index b4ddb4264581513bf90446cb6b4983a7cbf91beb..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/snmp.json
+++ /dev/null
@@ -1,138 +0,0 @@
-{
-    "devices": [
-      {
-        "deviceName": "SNMP router",
-        "deviceType": "snmp",
-        "ip": "snmp.live.gambitcommunications.com",
-        "port": 161,
-        "pollPeriod": 5000,
-        "community": "public",
-        "attributes": [
-          {
-            "key": "ReceivedFromGet",
-            "method": "get",
-            "oid": "1.3.6.1.2.1.1.1.0",
-            "timeout": 6
-          },
-          {
-            "key": "ReceivedFromMultiGet",
-            "method": "multiget",
-            "oid": [
-              "1.3.6.1.2.1.1.1.0",
-              "1.3.6.1.2.1.1.2.0"
-            ],
-            "timeout": 6
-          },
-          {
-            "key": "ReceivedFromGetNext",
-            "method": "getnext",
-            "oid": "1.3.6.1.2.1.1.1.0",
-            "timeout": 6
-          },
-          {
-            "key": "ReceivedFromMultiWalk",
-            "method": "multiwalk",
-            "oid": [
-              "1.3.6.1.2.1.1.1.0",
-              "1.3.6.0.1.2.1"
-            ]
-          },
-          {
-            "key": "ReceivedFromBulkWalk",
-            "method": "bulkwalk",
-            "oid": [
-              "1.3.6.1.2.1.1.1.0",
-              "1.3.6.1.2.1.1.2.0"
-            ]
-          },
-          {
-            "key": "ReceivedFromBulkGet",
-            "method": "bulkget",
-            "scalarOid": [
-              "1.3.6.1.2.1.1.1.0",
-              "1.3.6.1.2.1.1.2.0"
-            ],
-            "repeatingOid": [
-              "1.3.6.1.2.1.1.1.0",
-              "1.3.6.1.2.1.1.2.0"
-            ],
-            "maxListSize": 10
-          }
-        ],
-        "telemetry": [
-          {
-            "key": "ReceivedFromWalk",
-            "community": "private",
-            "method": "walk",
-            "oid": "1.3.6.1.2.1.1.1.0"
-          },
-          {
-            "key": "ReceivedFromTable",
-            "method": "table",
-            "oid": "1.3.6.1.2.1.1"
-          }
-        ],
-        "attributeUpdateRequests": [
-          {
-            "attributeFilter": "dataToSet",
-            "method": "set",
-            "oid": "1.3.6.1.2.1.1.1.0"
-          },
-          {
-            "attributeFilter": "dataToMultiSet",
-            "method": "multiset",
-            "mappings": {
-              "1.2.3": "10",
-              "2.3.4": "${attribute}"
-            }
-          }
-        ],
-        "serverSideRpcRequests": [
-          {
-            "requestFilter": "setData",
-            "method": "set",
-            "oid": "1.3.6.1.2.1.1.1.0"
-          },
-          {
-            "requestFilter": "multiSetData",
-            "method": "multiset"
-          },
-          {
-            "requestFilter": "getData",
-            "method": "get",
-            "oid": "1.3.6.1.2.1.1.1.0"
-          },
-          {
-            "requestFilter": "runBulkWalk",
-            "method": "bulkwalk",
-            "oid": [
-              "1.3.6.1.2.1.1.1.0",
-              "1.3.6.1.2.1.1.2.0"
-            ]
-          }
-        ]
-      },
-      {
-        "deviceName": "SNMP router",
-        "deviceType": "snmp",
-        "ip": "127.0.0.1",
-        "pollPeriod": 5000,
-        "community": "public",
-        "converter": "CustomSNMPConverter",
-        "attributes": [
-          {
-            "key": "ReceivedFromGetWithCustomConverter",
-            "method": "get",
-            "oid": "1.3.6.1.2.1.1.1.0"
-          }
-        ],
-        "telemetry": [
-          {
-            "key": "ReceivedFromTableWithCustomConverter",
-            "method": "table",
-            "oid": "1.3.6.1.2.1.1.1.0"
-          }
-        ]
-      }
-    ]
-  }
\ No newline at end of file
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway/tb_gateway.yaml b/meta-oe/dynamic-layers/=
meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway/tb=
_gateway.yaml
deleted file mode 100755
index e3eb8f1fc7014b8502b63eabb86e2ae0683cec0f..000000000000000000000000000=
0000000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway/tb_gateway.yaml
+++ /dev/null
@@ -1,66 +0,0 @@
-thingsboard:
-  host: demo.thingsboard.io
-  port: 1883
-  remoteConfiguration: false
-  security:
-    accessToken: PUT_YOUR_GW_ACCESS_TOKEN_HERE
-storage:
-  type: memory
-  read_records_count: 100
-  max_records_count: 100000
-#  type: file
-#  data_folder_path: ./data/
-#  max_file_count: 10
-#  max_read_records_count: 10
-#  max_records_per_file: 10000
-connectors:
-  -
-    name: MQTT Broker Connector
-    type: mqtt
-    configuration: mqtt.json
-
-#  -
-#    name: Modbus Connector
-#    type: modbus
-#    configuration: modbus.json
-#
-#  -
-#    name: Modbus Connector
-#    type: modbus
-#    configuration: modbus_serial.json
-#
-#  -
-#    name: OPC-UA Connector
-#    type: opcua
-#    configuration: opcua.json
-#
-#  -
-#    name: BLE Connector
-#    type: ble
-#    configuration: ble.json
-#
-#  -
-#    name: REQUEST Connector
-#    type: request
-#    configuration: request.json
-#
-#  -
-#    name: CAN Connector
-#    type: can
-#    configuration: can.json
-#
-#  -
-#    name: BACnet Connector
-#    type: bacnet
-#    configuration: bacnet.json
-#
-#  -
-#    name: ODBC Connector
-#    type: odbc
-#    configuration: odbc.json
-#
-#  -
-#    name: Custom Serial Connector
-#    type: serial
-#    configuration: custom_serial.json
-#    class: CustomSerialConnector
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/things=
board-gateway/thingsboard-gateway_3.7.4.bb b/meta-oe/dynamic-layers/meta-py=
thon/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
index 83baffdc054a4530adca2fbebe97b04c7064010c..8ff06285f9be60a09c1d49c2f07=
140e8212d22fc 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway_3.7.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-g=
ateway/thingsboard-gateway_3.7.4.bb
@@ -41,22 +41,7 @@ RDEPENDS:${PN} +=3D " python3-jsonpath-rw \
                     python3-pysocks \
 "
=20
-SRC_URI +=3D "file://bacnet.json \
-            file://ble.json \
-            file://can.json \
-            file://custom_serial.json \
-            file://modbus.json \
-            file://modbus_serial.json \
-            file://mqtt.json \
-            file://opcua.json \
-            file://odbc.json \
-            file://request.json \
-            file://rest.json \
-            file://snmp.json \
-            file://tb_gateway.yaml \
-            file://logs.conf \
-            file://thingsboard-gateway.service \
-            "
+SRC_URI +=3D "file://thingsboard-gateway.service"
=20
=20
 inherit systemd
@@ -70,15 +55,8 @@ FILES:${PN} +=3D "/etc \
 "
=20
 do_install:append(){
-
-    install -d ${D}${sysconfdir}/thingsboard-gateway/config
-
-    for file in $(find ${UNPACKDIR} -maxdepth 1 -type f -name *.json); do
-        install -m 0644 "$file" ${D}${sysconfdir}/thingsboard-gateway/conf=
ig
-    done
-
-    install -m 0644 ${UNPACKDIR}/tb_gateway.yaml ${D}${sysconfdir}/thingsb=
oard-gateway/config
-    install -m 0644 ${UNPACKDIR}/logs.conf ${D}${sysconfdir}/thingsboard-g=
ateway/config
+    install -d ${D}${sysconfdir}/${BPN}/config
+    install -m 0644 ${S}/thingsboard_gateway/config/*.json ${D}${sysconfdi=
r}/${BPN}/config
=20
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${UNPACKDIR}/thingsboard-gateway.service ${D}${systemd=
_system_unitdir}/thingsboard-gateway.service

--=20
2.25.1


