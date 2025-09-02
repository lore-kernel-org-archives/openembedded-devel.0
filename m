Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59B3CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:30:38 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.web10.78938.1756823436527770791
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=mTlLIbFV;
 spf=pass (domain: axis.com, ip: 40.107.130.54, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A88COFCz6cPsfAkzNm2HoY14Af1VLkeIueZVH5ABBIKL181x0zM4lOdvY2QaG09WGezoZbH7clU4w7D/22K0pAYUZ8boOf99ehd5UAWrxd5ppD9iC7gEUbppqI9LDA08msmR1uTly46QrQidAsfY3fWI21aWPV1+P0CwBxByZ8wSBeEpmE21vOQg00ezhDgTx2hEXF7jsDsrsNw9TXTkhI8N8d5MyCcZUXWrOUZMXsaO/6EIV3DK8Y1u1TYVFz2wafzOX7AhJQBd3if0mP5+wJo5CLieFtw3eBhHdJbtOt7im/nXaYJSkQSflqCdkakTspvrJwdaAR1sur6odbWJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhqvW3moFf2gbRgXyFs9fIMoM5Sz0d2f/37g/WXrSh0=;
 b=BXUwtrvUiURdYoTRajM+D67ukuzH4un4bbOtbJrtimM0ZvGWHjGQBvXBMy4iNvIw97Ofc6BgCrpeSvJogUB9HQqTj7sYeO6zdDrWwE44CsSCri0sr+Vnxh9YwmPNfyWNj170UrNITDvS6wxhDyVl6pyYBlJOpjtU67Uf8HRGV5mMIMNgqeQkT4Atm9YeWKbEfspJNBfeaGrmsUW3zfrs25sFFMKoshOeoT/09FSDUuhhQis5qz1SAcb1JuBq6MmdOvsmbdaH3PTAb51lRLlOD76t1xYNnNCtQp6pqnuu/q9VhZ/6y/jFvFbr35qvwlpfu9q/l++RooBBL7EXz5X08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhqvW3moFf2gbRgXyFs9fIMoM5Sz0d2f/37g/WXrSh0=;
 b=mTlLIbFVIpv/d3fkfLUcHn2Mqp87Iz/Hlo5mjEqdFv5kuVbMZkAg3bNfDFCCLEie/FfspqQHdQG77pkHi5YAXxg+2vVonxFAnh0SVYb0BUBHVcXd8i14iUeNPM1NvgAd5YJ12+yH7EXq++RnkbCylEaYw3uCupCQTLw42hOi9DM=
Received: from AM9P193CA0010.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::15)
 by GV1PR02MB10985.eurprd02.prod.outlook.com (2603:10a6:150:200::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:30:31 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::9d) by AM9P193CA0010.outlook.office365.com
 (2603:10a6:20b:21e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 14:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 2 Sep 2025 14:30:31 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:30:30 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 2 Sep
 2025 16:30:30 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Sep 2025 16:30:30 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 88A512D18
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 8519E2426D0A; Tue,  2 Sep 2025 16:30:30 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 3/4] influxdb: Add spdx parameter to license URIs
Date: Tue, 2 Sep 2025 16:30:29 +0200
Message-ID: <20250902143030.139421-4-christli@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250902143030.139421-1-christli@axis.com>
References: <20250902143030.139421-1-christli@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|GV1PR02MB10985:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b5cb1f-f367-4a8e-d772-08ddea2d4528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0HZGpd9elZtrEt8OLf612lH5Hy9FvFBm+pLJwzMvkR9XSDelDj6hsRd99IYT?=
 =?us-ascii?Q?9+yeVy19o/GdZ+vpC+OTKa5seLMypjBoG12tHjq2l+yvmAnKV80Uhepbm3lm?=
 =?us-ascii?Q?E9YLYGzRhC74xbtSaCquy5rdbfOJV8m2h6lk4ckcVhdbEJaor5Dj3FMjm3v1?=
 =?us-ascii?Q?vPOYz50YzVwjrzpO3fuPjOIwbIRrabCorTDq367WzHw3z79PL8tYANh4yk8s?=
 =?us-ascii?Q?P8jrqrOWVu6PBmFzezE3AC+wtn+j/awZ1WtC97bgCsFLnw7twK8/F1OiNFXH?=
 =?us-ascii?Q?aj7QvkOn5DWJVdBOHHYJvXERuG7DyGvhszKRz6vqFh/qzzVb2K/Sh6iytMka?=
 =?us-ascii?Q?qW1RHEANiFr5bKTjQISIHyayJcOAZxEml+Z7e8jQZWZqmmgaQBVgkcz84mzx?=
 =?us-ascii?Q?XHiPgDZJU9k8AfNAWTzysECwjvbWCKSs5RDxVMi99V7K2zkrDx/3KPIYbuAj?=
 =?us-ascii?Q?35JvHxXfNV0imhnYmH/VcqVNIkJYpnIm0e5vPKuaUUgL+7nM2bHJuhziOq2C?=
 =?us-ascii?Q?zMLrgnDlQmYcvH+IGVEV/5QAvZtC0XrjmifTECCjEg5HtCLjm+wgcAyNeGDi?=
 =?us-ascii?Q?wpoApVzBk8NiIih3tatqVpQkRjhCBBUeRLxVUl4mVPFwNEY93ZhZkqcN9cdu?=
 =?us-ascii?Q?RQaNTcSgHbc0YBEQXUlHTKpvdSQIYVsBKaCid98Jg0p9WIhTO9mK6CmvWWjW?=
 =?us-ascii?Q?CFJ8lXcEL8CipdFXYLyGDMtew5hPHUJ3MNXkpQNxOLeH7KzJVuLQcdXaVfZw?=
 =?us-ascii?Q?7p9+YcCKti/Cft1pG+MTts1eTtW6hHdspDFtQDX1aYAwNyfehdek/i+tCFV3?=
 =?us-ascii?Q?yItNkCVgK1z5uMGOSFL6KzEfHCMtQoJ0JlV8WTLGOFb5/X9PIyvX1515YOwZ?=
 =?us-ascii?Q?N7QP9/tgiImzNuHcsPP6BRyPe/4150QYGfphV2qPjSaY5qctZRHj7i7SUgfQ?=
 =?us-ascii?Q?8Bu3Q3rcQnG1ar45XDy8q81mI7RXLIlSCKyx6eIaROuAnfmMrMymhpeqy9z0?=
 =?us-ascii?Q?6IN0g8RZ5VlfBI10u+Giz/wl/Sduy5Og8VVK017YVMA4a+soFPFwp+IElQzy?=
 =?us-ascii?Q?v+6Xquoe3afbFTWXv5iJ+koRuuz0anbDHxFUuafooOuA/V+ucrZzneLi3Prq?=
 =?us-ascii?Q?ly8F+W5LZnevEUmN70HX1bHUDUIZktQEtN6i6yNMAYmB0KMvT0IvbWVIko4K?=
 =?us-ascii?Q?QUlv/HXetKz+ifJJ3vrGaF3VV6fQlOaVN/+TT0plGHYTaKi1JltbS2DhPL8z?=
 =?us-ascii?Q?DKXLTLTJaBuk/gf9jS7d81sDlr5RZlncKnRuCOuYvU5Mxvjv1mOTpGOEOWPb?=
 =?us-ascii?Q?gGHgxuYdm6tMZj+7sTTQ8Ja+Y0dXm6D/BhZPoc8en+5X1aqSqVPQXj1H/elq?=
 =?us-ascii?Q?MdB6MxNQt8TJYFc7V1xLWp2EWiT5y/6UtCdffjz2bbAIzCJiJCHPimy7nZu5?=
 =?us-ascii?Q?baSTMIxdtie15Imb3lcYMZo2zjbdbxHIagGW2GN6aiUYl1mCClcVbpNtSS2M?=
 =?us-ascii?Q?7PcC4BdbRnabsnhH+Hoz0mfhp2UHv9+bT5r3?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:30:31.0819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b5cb1f-f367-4a8e-d772-08ddea2d4528
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10985
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 14:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119181

From: Christian Lindeberg <christian.lindeberg@axis.com>

Add an "spdx" parameter with the identified license name to the URIs in
LIC_FILES_CHECKSUM in influxdb-licenses.inc.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 .../influxdb/influxdb-licenses.inc            | 128 +++++++++---------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc b/meta-oe/r=
ecipes-dbs/influxdb/influxdb-licenses.inc
index 1454f05de5..417925546c 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc
+++ b/meta-oe/recipes-dbs/influxdb/influxdb-licenses.inc
@@ -1,68 +1,68 @@
 GO_MOD_LICENSES =3D "Apache-2.0 & BSD-2-Clause & BSD-3-Clause & EPL-1.0 & =
ISC & MIT & MPL-2.0"
=20
 LIC_FILES_CHKSUM +=3D "\
-    file://pkg/mod/cloud.google.com/go/bigtable@v1.2.0/LICENSE;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/cloud.google.com/go@v0.51.0/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57 \
-    file://pkg/mod/collectd.org@v0.3.0/LICENSE;md5=3D51e2bb425ba79cdbe9788=
9a28f47eea8 \
-    file://pkg/mod/github.com/!burnt!sushi/toml@v0.3.1/COPYING;md5=3D9e24c=
0e2a784c1d1fcabb279f4f107e0 \
-    file://pkg/mod/github.com/beorn7/perks@v1.0.0/LICENSE;md5=3D0d0738f37e=
e8dc0b5f88a32e83c60198 \
-    file://pkg/mod/github.com/bmizerany/pat@v0.0.0-20170815010413-6226ea59=
1a40/README.md;md5=3D3b558b273cee6c2b170793783b3d2e13 \
-    file://pkg/mod/github.com/c-bata/go-prompt@v0.2.2/LICENSE;md5=3Df234b2=
c6d7f152e88593827000a76ee1 \
-    file://pkg/mod/github.com/dgrijalva/jwt-go/v4@v4.0.0-preview1/LICENSE;=
md5=3D276f2f3ba3749d25f6a6f5fb852d462e \
-    file://pkg/mod/github.com/dgryski/go-bitstream@v0.0.0-20180413035011-3=
522498ce2c8/LICENSE;md5=3D94d87602d16546d50e0b7e0930c3dae5 \
-    file://pkg/mod/github.com/eclipse/paho.mqtt.golang@v1.2.0/LICENSE;md5=
=3D3e75bb9ec12a51993bd30e51011b4229 \
-    file://pkg/mod/github.com/go-sql-driver/mysql@v1.4.1/LICENSE;md5=3D815=
ca599c9df247a0c7f619bab123dad \
-    file://pkg/mod/github.com/gofrs/uuid@v3.3.0+incompatible/LICENSE;md5=
=3Dae4ba217c6e20c2d8f48f69966b9121b \
-    file://pkg/mod/github.com/gogo/protobuf@v1.3.2/LICENSE;md5=3D38be95f95=
200434dc208e2ee3dab5081 \
-    file://pkg/mod/github.com/golang/geo@v0.0.0-20190916061304-5b978397cfe=
c/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20191227052852-215e=
87163ea7/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5 \
-    file://pkg/mod/github.com/golang/protobuf@v1.3.2/LICENSE;md5=3D939cce1=
ec101726fa754e698ac871622 \
-    file://pkg/mod/github.com/golang/snappy@v0.0.0-20180518054509-2e65f852=
55db/LICENSE;md5=3Db8b79c7d4cda128290b98c6a21f9aac6 \
-    file://pkg/mod/github.com/google/flatbuffers@v1.11.0/LICENSE.txt;md5=
=3Da873c5645c184d51e0f9b34e1d7cf559 \
-    file://pkg/mod/github.com/google/go-cmp@v0.4.0/LICENSE;md5=3D4ac66f7de=
a41d8d116cb7fb28aeff2ab \
-    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.0.5/LICENSE;md5=3D0d=
d48ae8103725bd7b401261520cdfbb \
-    file://pkg/mod/github.com/influxdata/flux@v0.65.1/LICENSE;md5=3Df39a8d=
10930fb37bd59adabb3b9d0bd6 \
-    file://pkg/mod/github.com/influxdata/influxql@v1.1.1-0.20200828144457-=
65d3ef77d385/LICENSE;md5=3Dba8146ad9cc2a128209983265136e06a \
-    file://pkg/mod/github.com/influxdata/roaring@v0.4.13-0.20180809181101-=
fc520f41fab6/LICENSE;md5=3Db13d5600b5dc9e6cfb93ac14d7d6cfbf \
-    file://pkg/mod/github.com/influxdata/tdigest@v0.0.0-20181121200506-bf2=
b5ad3c0a9/LICENSE;md5=3Dfd9c5bdb98de5b3e7b20f14b1cf17e32 \
-    file://pkg/mod/github.com/influxdata/usage-client@v0.0.0-2016082918005=
4-6d3895376368/LICENSE.txt;md5=3D17cff8e5ad17d1d8c2ac21440e86d366 \
-    file://pkg/mod/github.com/jsternberg/zap-logfmt@v1.0.0/LICENSE;md5=3D8=
60d1817101f99a56b547104ebfd4801 \
-    file://pkg/mod/github.com/jwilder/encoding@v0.0.0-20170811194829-b4e17=
01a28ef/LICENSE;md5=3De75d4fbdba08ce3a518e7aab13042096 \
-    file://pkg/mod/github.com/klauspost/compress@v1.4.0/LICENSE;md5=3D5917=
78525c869cdde0ab5a1bf283cd81 \
-    file://pkg/mod/github.com/klauspost/crc32@v0.0.0-20161016154125-cb6bfc=
a970f6/LICENSE;md5=3D0f63a5a579a75ddec9f3464b085818a4 \
-    file://pkg/mod/github.com/klauspost/pgzip@v1.0.2-0.20170402124221-0bf5=
dcad4ada/LICENSE;md5=3D9ea3772c7ca56b5e8cbd5caf795588b5 \
-    file://pkg/mod/github.com/kraj/term@v0.0.0-20210111231523-7c42fcb0e627=
/LICENSE;md5=3Dc11f50de045e1f8eb4502b2f50550720 \
-    file://pkg/mod/github.com/kraj/xxhash@v1.1.1-0.20211201014032-8254a11e=
ab56/LICENSE.txt;md5=3D802da049c92a99b4387d3f3d91b00fa9 \
-    file://pkg/mod/github.com/lib/pq@v1.0.0/LICENSE.md;md5=3D0eab29964025b=
358179aa6d8f7db14bf \
-    file://pkg/mod/github.com/mattn/go-isatty@v0.0.4/LICENSE;md5=3Df509bea=
dd5a11227c27b5d2ad6c9f2c6 \
-    file://pkg/mod/github.com/mattn/go-runewidth@v0.0.3/LICENSE;md5=3D24ce=
168f90aec2456a73de1839037245 \
-    file://pkg/mod/github.com/matttproud/golang_protobuf_extensions@v1.0.1=
/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e \
-    file://pkg/mod/github.com/opentracing/opentracing-go@v1.0.3-0.20180606=
204148-bd9c31933947/LICENSE;md5=3Df4e91fcd9abdeb3c904b834127d5cb20 \
-    file://pkg/mod/github.com/peterh/liner@v1.0.1-0.20180619022028-8c1271f=
cf47f/COPYING;md5=3D7316a33df6826d7cc2854e686cb9279f \
-    file://pkg/mod/github.com/philhofer/fwd@v1.0.0/LICENSE.md;md5=3Dcfd452=
e4c91aa5191e3af8f3e4b67a9a \
-    file://pkg/mod/github.com/pkg/errors@v0.9.1/LICENSE;md5=3D6fe682a02df5=
2c6653f33bd0f7126b5a \
-    file://pkg/mod/github.com/prometheus/client_golang@v1.0.0/LICENSE;md5=
=3D86d3f3a95c324c9479bd8986968f4327 \
-    file://pkg/mod/github.com/prometheus/client_model@v0.0.0-2019081215424=
1-14fe0d1b01d4/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
-    file://pkg/mod/github.com/prometheus/common@v0.6.0/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327 \
-    file://pkg/mod/github.com/prometheus/common@v0.6.0/internal/bitbucket.=
org/ww/goautoneg/README.txt;md5=3Da33eda65f1bc658f358e1d690c6a93d4 \
-    file://pkg/mod/github.com/prometheus/procfs@v0.0.2/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327 \
-    file://pkg/mod/github.com/segmentio/kafka-go@v0.2.0/LICENSE;md5=3D2451=
77e51c68aa2071d537392357ab87 \
-    file://pkg/mod/github.com/tinylib/msgp@v1.0.2/LICENSE;md5=3D37acb030ba=
070680be4a9fcb57f2735a \
-    file://pkg/mod/github.com/xlab/treeprint@v0.0.0-20180616005107-d6fb674=
7feb6/LICENSE;md5=3D41d2819776299442cbac81ad74bfc094 \
-    file://pkg/mod/go.opencensus.io@v0.22.2/LICENSE;md5=3D175792518e4ac015=
ab6696d16c4f607e \
-    file://pkg/mod/go.uber.org/atomic@v1.5.1/LICENSE.txt;md5=3D1caee865194=
56feda989f8a838102b50 \
-    file://pkg/mod/go.uber.org/multierr@v1.4.0/LICENSE.txt;md5=3Df65b21a54=
7112d1bc7b11b90f9b31997 \
-    file://pkg/mod/go.uber.org/zap@v1.9.1/LICENSE.txt;md5=3D5e8153e456a825=
29ea845e0d511abb69 \
-    file://pkg/mod/golang.org/x/crypto@v0.0.0-20210322153248-0c34fe9e7dc2/=
LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/net@v0.0.0-20210226172049-e18ecbb05110/LIC=
ENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/oauth2@v0.0.0-20200107190931-bf48bf16ab8d/=
LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/sync@v0.0.0-20201020160332-67f06af15bc9/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/LIC=
ENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/term@v0.0.0-20201126162022-7de9c90e9dd1/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/text@v0.3.3/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707 \
-    file://pkg/mod/golang.org/x/time@v0.0.0-20190308202827-9d24e82272b4/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-    file://pkg/mod/google.golang.org/api@v0.15.0/LICENSE;md5=3Da651bb3d8b1=
c412632e28823bb432b40 \
-    file://pkg/mod/google.golang.org/api@v0.15.0/internal/third_party/urit=
emplates/LICENSE;md5=3D4ee4feb2b545c2231749e5c54ace343e \
-    file://pkg/mod/google.golang.org/genproto@v0.0.0-20200108215221-bd8f9a=
0ef82f/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
-    file://pkg/mod/google.golang.org/grpc@v1.26.0/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57 \
+    file://pkg/mod/cloud.google.com/go/bigtable@v1.2.0/LICENSE;md5=3D3b83e=
f96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/cloud.google.com/go@v0.51.0/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/collectd.org@v0.3.0/LICENSE;md5=3D51e2bb425ba79cdbe9788=
9a28f47eea8;spdx=3DISC \
+    file://pkg/mod/github.com/!burnt!sushi/toml@v0.3.1/COPYING;md5=3D9e24c=
0e2a784c1d1fcabb279f4f107e0;spdx=3DMIT \
+    file://pkg/mod/github.com/beorn7/perks@v1.0.0/LICENSE;md5=3D0d0738f37e=
e8dc0b5f88a32e83c60198;spdx=3DMIT \
+    file://pkg/mod/github.com/bmizerany/pat@v0.0.0-20170815010413-6226ea59=
1a40/README.md;md5=3D3b558b273cee6c2b170793783b3d2e13;spdx=3DMIT \
+    file://pkg/mod/github.com/c-bata/go-prompt@v0.2.2/LICENSE;md5=3Df234b2=
c6d7f152e88593827000a76ee1;spdx=3DMIT \
+    file://pkg/mod/github.com/dgrijalva/jwt-go/v4@v4.0.0-preview1/LICENSE;=
md5=3D276f2f3ba3749d25f6a6f5fb852d462e;spdx=3DMIT \
+    file://pkg/mod/github.com/dgryski/go-bitstream@v0.0.0-20180413035011-3=
522498ce2c8/LICENSE;md5=3D94d87602d16546d50e0b7e0930c3dae5;spdx=3DMIT \
+    file://pkg/mod/github.com/eclipse/paho.mqtt.golang@v1.2.0/LICENSE;md5=
=3D3e75bb9ec12a51993bd30e51011b4229;spdx=3DEPL-1.0 \
+    file://pkg/mod/github.com/go-sql-driver/mysql@v1.4.1/LICENSE;md5=3D815=
ca599c9df247a0c7f619bab123dad;spdx=3DMPL-2.0 \
+    file://pkg/mod/github.com/gofrs/uuid@v3.3.0+incompatible/LICENSE;md5=
=3Dae4ba217c6e20c2d8f48f69966b9121b;spdx=3DMIT \
+    file://pkg/mod/github.com/gogo/protobuf@v1.3.2/LICENSE;md5=3D38be95f95=
200434dc208e2ee3dab5081;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/golang/geo@v0.0.0-20190916061304-5b978397cfe=
c/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/golang/groupcache@v0.0.0-20191227052852-215e=
87163ea7/LICENSE;md5=3D19cbd64715b51267a47bf3750cc6a8a5;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/golang/protobuf@v1.3.2/LICENSE;md5=3D939cce1=
ec101726fa754e698ac871622;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/golang/snappy@v0.0.0-20180518054509-2e65f852=
55db/LICENSE;md5=3Db8b79c7d4cda128290b98c6a21f9aac6;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/google/flatbuffers@v1.11.0/LICENSE.txt;md5=
=3Da873c5645c184d51e0f9b34e1d7cf559;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/google/go-cmp@v0.4.0/LICENSE;md5=3D4ac66f7de=
a41d8d116cb7fb28aeff2ab;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/googleapis/gax-go/v2@v2.0.5/LICENSE;md5=3D0d=
d48ae8103725bd7b401261520cdfbb;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/influxdata/flux@v0.65.1/LICENSE;md5=3Df39a8d=
10930fb37bd59adabb3b9d0bd6;spdx=3DMIT \
+    file://pkg/mod/github.com/influxdata/influxql@v1.1.1-0.20200828144457-=
65d3ef77d385/LICENSE;md5=3Dba8146ad9cc2a128209983265136e06a;spdx=3DMIT \
+    file://pkg/mod/github.com/influxdata/roaring@v0.4.13-0.20180809181101-=
fc520f41fab6/LICENSE;md5=3Db13d5600b5dc9e6cfb93ac14d7d6cfbf;spdx=3DApache-2=
.0 \
+    file://pkg/mod/github.com/influxdata/tdigest@v0.0.0-20181121200506-bf2=
b5ad3c0a9/LICENSE;md5=3Dfd9c5bdb98de5b3e7b20f14b1cf17e32;spdx=3DApache-2.0 =
\
+    file://pkg/mod/github.com/influxdata/usage-client@v0.0.0-2016082918005=
4-6d3895376368/LICENSE.txt;md5=3D17cff8e5ad17d1d8c2ac21440e86d366;spdx=3DMI=
T \
+    file://pkg/mod/github.com/jsternberg/zap-logfmt@v1.0.0/LICENSE;md5=3D8=
60d1817101f99a56b547104ebfd4801;spdx=3DMIT \
+    file://pkg/mod/github.com/jwilder/encoding@v0.0.0-20170811194829-b4e17=
01a28ef/LICENSE;md5=3De75d4fbdba08ce3a518e7aab13042096;spdx=3DMIT \
+    file://pkg/mod/github.com/klauspost/compress@v1.4.0/LICENSE;md5=3D5917=
78525c869cdde0ab5a1bf283cd81;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/crc32@v0.0.0-20161016154125-cb6bfc=
a970f6/LICENSE;md5=3D0f63a5a579a75ddec9f3464b085818a4;spdx=3DBSD-3-Clause \
+    file://pkg/mod/github.com/klauspost/pgzip@v1.0.2-0.20170402124221-0bf5=
dcad4ada/LICENSE;md5=3D9ea3772c7ca56b5e8cbd5caf795588b5;spdx=3DMIT \
+    file://pkg/mod/github.com/kraj/term@v0.0.0-20210111231523-7c42fcb0e627=
/LICENSE;md5=3Dc11f50de045e1f8eb4502b2f50550720;spdx=3DBSD-2-Clause \
+    file://pkg/mod/github.com/kraj/xxhash@v1.1.1-0.20211201014032-8254a11e=
ab56/LICENSE.txt;md5=3D802da049c92a99b4387d3f3d91b00fa9;spdx=3DMIT \
+    file://pkg/mod/github.com/lib/pq@v1.0.0/LICENSE.md;md5=3D0eab29964025b=
358179aa6d8f7db14bf;spdx=3DMIT \
+    file://pkg/mod/github.com/mattn/go-isatty@v0.0.4/LICENSE;md5=3Df509bea=
dd5a11227c27b5d2ad6c9f2c6;spdx=3DMIT \
+    file://pkg/mod/github.com/mattn/go-runewidth@v0.0.3/LICENSE;md5=3D24ce=
168f90aec2456a73de1839037245;spdx=3DMIT \
+    file://pkg/mod/github.com/matttproud/golang_protobuf_extensions@v1.0.1=
/LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29e;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/opentracing/opentracing-go@v1.0.3-0.20180606=
204148-bd9c31933947/LICENSE;md5=3Df4e91fcd9abdeb3c904b834127d5cb20;spdx=3DA=
pache-2.0 \
+    file://pkg/mod/github.com/peterh/liner@v1.0.1-0.20180619022028-8c1271f=
cf47f/COPYING;md5=3D7316a33df6826d7cc2854e686cb9279f;spdx=3DMIT \
+    file://pkg/mod/github.com/philhofer/fwd@v1.0.0/LICENSE.md;md5=3Dcfd452=
e4c91aa5191e3af8f3e4b67a9a;spdx=3DMIT \
+    file://pkg/mod/github.com/pkg/errors@v0.9.1/LICENSE;md5=3D6fe682a02df5=
2c6653f33bd0f7126b5a;spdx=3DBSD-2-Clause \
+    file://pkg/mod/github.com/prometheus/client_golang@v1.0.0/LICENSE;md5=
=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/prometheus/client_model@v0.0.0-2019081215424=
1-14fe0d1b01d4/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327;spdx=3DApache=
-2.0 \
+    file://pkg/mod/github.com/prometheus/common@v0.6.0/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/prometheus/common@v0.6.0/internal/bitbucket.=
org/ww/goautoneg/README.txt;md5=3Da33eda65f1bc658f358e1d690c6a93d4;spdx=3DB=
SD-3-Clause \
+    file://pkg/mod/github.com/prometheus/procfs@v0.0.2/LICENSE;md5=3D86d3f=
3a95c324c9479bd8986968f4327;spdx=3DApache-2.0 \
+    file://pkg/mod/github.com/segmentio/kafka-go@v0.2.0/LICENSE;md5=3D2451=
77e51c68aa2071d537392357ab87;spdx=3DMIT \
+    file://pkg/mod/github.com/tinylib/msgp@v1.0.2/LICENSE;md5=3D37acb030ba=
070680be4a9fcb57f2735a;spdx=3DMIT \
+    file://pkg/mod/github.com/xlab/treeprint@v0.0.0-20180616005107-d6fb674=
7feb6/LICENSE;md5=3D41d2819776299442cbac81ad74bfc094;spdx=3DMIT \
+    file://pkg/mod/go.opencensus.io@v0.22.2/LICENSE;md5=3D175792518e4ac015=
ab6696d16c4f607e;spdx=3DApache-2.0 \
+    file://pkg/mod/go.uber.org/atomic@v1.5.1/LICENSE.txt;md5=3D1caee865194=
56feda989f8a838102b50;spdx=3DMIT \
+    file://pkg/mod/go.uber.org/multierr@v1.4.0/LICENSE.txt;md5=3Df65b21a54=
7112d1bc7b11b90f9b31997;spdx=3DMIT \
+    file://pkg/mod/go.uber.org/zap@v1.9.1/LICENSE.txt;md5=3D5e8153e456a825=
29ea845e0d511abb69;spdx=3DMIT \
+    file://pkg/mod/golang.org/x/crypto@v0.0.0-20210322153248-0c34fe9e7dc2/=
LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/net@v0.0.0-20210226172049-e18ecbb05110/LIC=
ENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/oauth2@v0.0.0-20200107190931-bf48bf16ab8d/=
LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sync@v0.0.0-20201020160332-67f06af15bc9/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/sys@v0.0.0-20201119102817-f84b799fce68/LIC=
ENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/term@v0.0.0-20201126162022-7de9c90e9dd1/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/text@v0.3.3/LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/golang.org/x/time@v0.0.0-20190308202827-9d24e82272b4/LI=
CENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707;spdx=3DBSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.15.0/LICENSE;md5=3Da651bb3d8b1=
c412632e28823bb432b40;spdx=3DBSD-3-Clause \
+    file://pkg/mod/google.golang.org/api@v0.15.0/internal/third_party/urit=
emplates/LICENSE;md5=3D4ee4feb2b545c2231749e5c54ace343e;spdx=3DBSD-3-Clause=
 \
+    file://pkg/mod/google.golang.org/genproto@v0.0.0-20200108215221-bd8f9a=
0ef82f/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
+    file://pkg/mod/google.golang.org/grpc@v1.26.0/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57;spdx=3DApache-2.0 \
 "
--=20
2.39.5


