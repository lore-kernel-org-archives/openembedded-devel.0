Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B1110706D5
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 12:00:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8354.1773489605872401325
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 05:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=3qz9V+on;
 spf=pass (domain: navimatix.de, ip: 52.101.69.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYqPxY/mO3Jifcew2BVA/MO2/y8lJIcDV6i+JHYd3Wm9ztT7jLAmjBQWW2kkUaxv7Ucw1XTkMVlHLs/QnlpaHvRtu2gFpwVTUMbKN8MwLHg+nKIOEi58zQKvPIfnt4rlGoXvsTH4O/s7c7GJv5X8T6dy1G2PCenOzeJkiDk5gkNh0Oup3DQxNHfpdlvDtiw7C+37RMxi3VeJS2F1rJq4KXWeFVR9/OYJP8vMjs0PcENQOPnYYVxbOBzjV3i/I+ggCrHm3dSDDYGOYS5xqJkXwjfMqMa866jXR9jNklP+z7qBZ3kjUz3l2ph+bJZI0FKzGMlRoXzMID04K+iRJRXWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf8wpxiqk3cMgC5gmnJhh8NPUPnB23CKjvyKyxyUJfs=;
 b=oQsJ1pp5zindtXrnyLQ2LTXBxyboyLEWn0HKcOHfo067uAak2FJDLBlKR7viph0ZL7DtMbrZaP2oWpuhW7RZKH+01550/2XJ22QkEt8Clc5haZk+CmavlGCm4rWuPIBMgcQC8T3HrvXyPZSoutl3AXBMj9537XakqQ7XUWMFM+VNRtfMx0U0wFYuVoqxULnCVQhMLTO7uYSmG0bkBDiEIJXN+yACTe/tDKrmUgaECrcAdre6inY+p3fc0qLoaoVbqVS6zKWh+psdt+4DtTpQMXtwpUS61h/IhIdvdvqnArqIRafnrY2COUBsOLEK5GW7Hg7cTJApCSPd/jykVjj7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf8wpxiqk3cMgC5gmnJhh8NPUPnB23CKjvyKyxyUJfs=;
 b=3qz9V+onBeke4+odf2Xs3mgVChoxppp2r4k2TnQAH26bBHUt2UyX3NejV1PWjvC7ks7xC8Y5mcnCOpDzBO7BdoBcWw4afpINpHkxx3H9xdPtS0XrH2C/cgITicC5itLelhXUu5q03qnvdHC/YcCxl+m3p0C2JlCrYak/8aBqQE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by MI3PR01MB12410.eurprd01.prod.exchangelabs.com
 (2603:10a6:290:6e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:00:01 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Sat, 14 Mar 2026 11:59:57 +0000
Date: Sat, 14 Mar 2026 13:00:00 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] gd: Add patch to fix compiler error about missing const
Message-ID: <11abf2a38c37c565257019092e68b85ac257fb4f.1773489599.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|MI3PR01MB12410:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5f3849-20a7-4c69-5ee9-08de81c13688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	FgbaWURVEXkvOm7E05LfEsbeGKPDCJNFDZVjzjRI6PiX2kd5A8InI5NcF5i8D0QGe7DBCqZ/PyfvJ2Xr+Z65mGfyq+y8qn8KdmjNEhlISOO93rK36xeiWpoUwPGnCVf7h1WozVUNSq/AfVxuArMrbnmz14WyUr2h6P/hMxAPKstsWp7Zc5KSvFUsTYLf64EvVfpLxz6mInXcWjh0yco2XQSa+h9Lf4muBke8ucqxFPinP881rljw5sESOhWsTPNwEV0n2OjuBaUmj5bcW6V4qRKXgttIzRBLe7c4r1bsGDPC2TIKb5utJfViix7DOgqkWbDuGu8WKQE3vCjq8rdVDopBQYRhyPpgkzjNXqPxIWc0wIgVng/cLB73XHhyXWs75ktzdHtdgwZJ0KiP5Tx/N5I3/2t03aWqtV/nDwKNewaI1x4BUygEKxyna/swJIUAsJw04FNZSTw00zhpif8f0o6adg5a5fiFUkajniOsXVtH1K1n/l11+FyT9RedoZhPyfmFDvEsYoN7gHMk01Bgp1zz9kRievkX6I32eihuHueO1B0VZVSofb9yPgFRL2EMJTRQLfKxRpJ2NNtOweeN0MorCBmvid6j2ugtoZCO0wZAc3NfTJGtbXf26J/aNE4Zt7M5UQI/s4vC6+NhpWsikvXdluaA2OL0oNVQBvSh2gJsg8/jYAzBE5f2PEVNli5FqTCakdl6GgTBZMRKm9XPkcEKpyAclDlFZew+hsWBvlM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Oq48VHKNDIBDLF6IvbhH+xlXAY5W4ijLPxFWuVZlAILLsBH9Ntu9aU6B+Zzj?=
 =?us-ascii?Q?tDhVT6ZYVIbk94/SyWEsWnqv7CDJU/9JdZ18Oe6B4aN/lcsseamxRYFZpoE8?=
 =?us-ascii?Q?Vm/Tpmc2e5Y3Yv1TSvUuSJDBpTq46/8tXy1fb4kXIGihU0nAYUPiELAzibph?=
 =?us-ascii?Q?8ooLh9j7ud4i+wsgOdFASey90PQ1rTKe6Hb4NmU+nXyf//6VAh/CeCHQLHcA?=
 =?us-ascii?Q?vVtxw1YWhiZDm0hBvW+apWZdAGb+HG2FMk/HFKsLZv5r4gOW4zZOY5pGiCpq?=
 =?us-ascii?Q?rOBK1qCqwAI3LUtYHxIN9Ey/fI2L12hV8AbA+a7jSrFABERyGP1rkvb6A7mA?=
 =?us-ascii?Q?qsijDrT77iJcFiPj8Byd/5NWkWMULEvQ4dKfFjg4alTjy4swz2CiT9uVrl0K?=
 =?us-ascii?Q?FzojzyCd4mZBAzfe+QNYqG549RMzw4PQWGYyOlCeKrlTrtA4HeZh1pqa1Juc?=
 =?us-ascii?Q?ATykhhN/mwZUi2jt5V9DL9SnimAbOaA1mbPWz714DDOSvYjFVcNNAecg8F5F?=
 =?us-ascii?Q?E+dBTQ4t0NEcpL1CwUVcEnCYzDuneaglyEL6kGGlqm7JH8jHFRYRwUQG6kLl?=
 =?us-ascii?Q?FiSWpoIWePF+qrOO3BSdTEnFSU7NyYERpcIi2pmzuhIkZerRjXLm6/NjT9QG?=
 =?us-ascii?Q?nRfx65Q4RW3ya3idzYxQWYfPvuOYNbH0YSkeZdLtuR2u2hFcmAqGr1dHtSHR?=
 =?us-ascii?Q?DzUNpkx7f76aGK6iJS2vfgN80W8VsS37Q4AWCZoPW4bKkLUcccjZ8XL0b/3/?=
 =?us-ascii?Q?Y3HVPdilPM/hYWf76GjE7F/fYRG6Wm+2OTFPz+7IzkdbFqF+LChYOuJW2S90?=
 =?us-ascii?Q?MLACc+lHGobXdzBwaV3Zpm0SfBeNEApFPD7nHfPa+L7m2Fj4b05NWxd0sMFa?=
 =?us-ascii?Q?/T8F6GF37KFj20F3eARn3R8TQ/ISH+DLb9s7JuMPUMFWq4Y2k92VN+YDM1v6?=
 =?us-ascii?Q?iLJtUDybFDNfaCv7YUHDNmtuLTgxhtnlRzfcxO4iEjR3zd1blxdqYmn8fQU3?=
 =?us-ascii?Q?Pfwkf21WJ+Ht4n5tOhxYlMAkGQN5AYKn58ljSExIufYkL3lqyR8zfgWwK5Fd?=
 =?us-ascii?Q?kGYqK2Q/dutjlU0JHQBjJItJlNjQ9MjG57ualNPq2/Nshy1iG8QckJFXdByZ?=
 =?us-ascii?Q?XSLJjMEjsciSh5gpHtU+loozSYx88sQVXlqZ/WLIo3JYnpRRA7uy0EDzbIfx?=
 =?us-ascii?Q?56hQKe4tE/RudmALCOzYFs5X98sSrvHuCHBtG9VD+og6PLCzHrppDqPuUc/D?=
 =?us-ascii?Q?oF3w7ETj5MaVt58RisP6INt+AnJG5B9FZ7pRnirnGCHJGHb4c1COqMdOVcRi?=
 =?us-ascii?Q?AW3sFO+VAlMPJNhnabYcgDA2v3B6bH6bdmIAO+DzR+XHe2x/zPV4DYjXw+OP?=
 =?us-ascii?Q?Di4gEDlVQkyLEnFNq+We6n6QCwDKjQrlZyIddPxoWIL5XAVobR2QrD2QVhqp?=
 =?us-ascii?Q?50b6weRa20V0K4+sDO0UPvkZwKtbuYHjcrZESwvYyyC4+l2GwnZy7a5T6Udn?=
 =?us-ascii?Q?URymNvJ5bvLltDcGehdkkd3CW9nfrynL4Bbcta2ZjxnMC7YGEPGhd/0x0Lw1?=
 =?us-ascii?Q?p4LqzNZqbGErDDFnVkO2Aw7M0a/u3+BTdKvY2DcPxSRynB2LBMLhnY0736fb?=
 =?us-ascii?Q?IlXkiAfqdn70cTO4nZAcBRHyWO1Nz9N1rogO+oWTDa7gQCKYHRbjEZFGvZt+?=
 =?us-ascii?Q?nIiEiOq4GPxpaNlBT7XW/JQxe6Qnum4SZfamwGLXVJsate9R+xoDaYhNAage?=
 =?us-ascii?Q?J+ut6k2bCUzjt6oncW+9RXTpdi4Jyxw=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5f3849-20a7-4c69-5ee9-08de81c13688
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 11:59:57.8468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEPTyW/xTCZjnd/fx1YYkODQBZO+iS41DByaaacvonX/W3AFiIIvvR1Z0wiRqvTKuOuezk7osuqD3z12ejJHFjt1eQCRh7XZZZrG7yk/CXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR01MB12410
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 12:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125202

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Gcc complains about:

| ../../sources/gd-2.3.3/src/gd_filename.c: In function 'ftype':
| ../../sources/gd-2.3.3/src/gd_filename.c:99:9: error: assignment discards=
 'const' qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers=
]
|    99 |     ext =3D strrchr(filename, '.');
|       |         ^
| cc1: all warnings being treated as errors

Even the newest git master commit does not fix this.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../gd/gd/Fix-ftype-missing-const.patch       | 23 +++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.3.bb        |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/Fix-ftype-missing-const.p=
atch

diff --git a/meta-oe/recipes-support/gd/gd/Fix-ftype-missing-const.patch b/=
meta-oe/recipes-support/gd/gd/Fix-ftype-missing-const.patch
new file mode 100644
index 0000000000..294979ffd9
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/Fix-ftype-missing-const.patch
@@ -0,0 +1,23 @@
+gcc complains about
+
+| ../../sources/gd-2.3.3/src/gd_filename.c: In function 'ftype':
+| ../../sources/gd-2.3.3/src/gd_filename.c:99:9: error: assignment discard=
s 'const' qualifier from pointer target type [-Werror=3Ddiscarded-qualifier=
s]
+|    99 |     ext =3D strrchr(filename, '.');
+|       |         ^
+| cc1: all warnings being treated as errors
+
+Upstream-Status: Submitted [https://github.com/libgd/libgd/issues/985]
+
+diff --git i/src/gd_filename.c w/src/gd_filename.c
+index 7ce4817f..89b25204 100644
+--- i/src/gd_filename.c
++++ w/src/gd_filename.c
+@@ -93,7 +93,7 @@ static const struct FileType {
+ static const struct FileType *
+ ftype(const char *filename) {
+     int n;
+-    char *ext;
++    const char *ext;
+
+     /* Find the file extension (i.e. the last period in the string. */
+     ext =3D strrchr(filename, '.');
diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-suppo=
rt/gd/gd_2.3.3.bb
index ea5c487c52..0d7a6d34f9 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -15,6 +15,7 @@ DEPENDS =3D "freetype libpng jpeg zlib tiff"
=20
 SRC_URI =3D "git://github.com/libgd/libgd.git;nobranch=3D1;protocol=3Dhttp=
s \
            file://0001-Fix-deprecared-function-prototypes.patch \
+           file://Fix-ftype-missing-const.patch \
            "
=20
 SRCREV =3D "b5319a41286107b53daa0e08e402aa1819764bdc"
--=20
2.53.0


