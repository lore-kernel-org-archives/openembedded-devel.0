Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web09.11199.1623771685391371175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=bkm9T6Pw;
 spf=pass (domain: de.bosch.com, ip: 40.107.15.70, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2ndaUJMAe6fBcxlJyTU+We6MnIDOqjcfNO5166q1U6tEnwTJV9emKa3WRmh0Xq8/CsziQsst9+uNwCpAvRJjAIrWEA/p9mksJZxykJF6zPpuiAY/Ldd/cDYzrN8e1xaBQOoQJr+x9J4nJr/aXkjlqKX8yvh6p6v4y3MbITDcMlS3HHfgNnDyyNMiY9hHDrz1YY2oYwJHNZnMXThzvbODylfvw0sN0D0X9+0GfDK3j5AJZj9d+onP/uo7aCoywmtDI4jNXyHN983mpuxwRtdNhgmPi+6yHMRZ1kBW3xwGv4RO5EEmj+z7QCt00rFOfkk1GehDRLbsrC6pcr8st02yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPpZcyWWfNAqLtx2d36P266ty16emlnRe3zpNrByxHI=;
 b=ArOWNaggiXCMxzwFX69mkOHpyjji26AGyRE5i6wt18dSy5KjpZpAjS5vNO2yepiMZ8suGMIbbd+U4kU+7jttgJOjhefedPKXFTQAyj1JvnhYgjxNKsH8HI1QKLnjdB79kZLzBS4bldnbYc6RQp6bLDP/m6PE3xEzpnUamvRmqeW10q6j7Djoy9+IpXyEz9nRN8il0/cx5YOUt9M0Dgv9kQG0UocpKSJM6FS8IpHSiXOIvo3rCylXvrbeqUKyTY+umK2BJIpgzYSFQkswyYamAQFkG3YiQPoaUxJS2knfENpqNcUVkXhWw4QkB/1xfOZNAzWkBNMQELxybFvaaLRDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPpZcyWWfNAqLtx2d36P266ty16emlnRe3zpNrByxHI=;
 b=bkm9T6PwM4Dlo7iswovWUHslZh1AUXPWvi4gIQLlIOR47NLdm4aMLxvzPFcdhtnHl/sH/BuG1kYsfrk0iJtCHSrSq6Y6BuHOO3ABlYgyNqrcx9ZrAKYgOn0WJRED1WQkfyLBt0VbCVTsU6XAM18PZqBnYAVO4N4nNtXFAnGEc08=
Received: from AM7PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:20b:130::24)
 by PA4PR10MB4574.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Tue, 15 Jun
 2021 15:41:23 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::fb) by AM7PR03CA0014.outlook.office365.com
 (2603:10a6:20b:130::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.199) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:22 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Tue, 15 Jun
 2021 17:41:09 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:09 +0200
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:09 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <kevin.zhang3@cn.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-openwrt][PATCH 6/7] lucihttp: Add recipe
Date: Tue, 15 Jun 2021 17:40:48 +0200
Message-ID: <20210615154049.173769-7-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a5008e3-1614-4931-b0b8-08d93014073a
X-MS-TrafficTypeDiagnostic: PA4PR10MB4574:
X-Microsoft-Antispam-PRVS: 
	<PA4PR10MB4574E39C3058982A65C5FB36AD309@PA4PR10MB4574.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fMQ62V8QsRN5yMM8v3mgoMRgqXyN3jvQ6bA1SG6KwX/yp1sK21QfmAns3gHgZ1jN/ffAL81X2y7pXlKg0okc0POnkbRRtngYCAAIynv3vvMR8kAU7UUbbPJq2iCXXVXnLCX5fe6NG8kuJpBA8DYdBMX/vo1zElJziAKIKtTxA8RB+5WL0/ObpLx4Bb2VYHaFlhjtxSGeaSn8rzKVTGGG+VKcSXq9uSYmwLTXDLD/CsA+wW+NU+P9R4GxYlnhWP71JUAJtFQu19M9E15JiRpegpcPSr6+Ugab0hWkksymo51nmUdfvL3NU79w5ROQsedXDXeohB51izV3d71OP84jYXliqud63tPpFMhjW0I9kZshz5lqNqfEV9OT/z07aocDa8wDlysfFRKI5j3Sjuh0ETr9EE3geTMyiTqMcqqO4CVcJQKE23qJqAXKDoJOlXFS+9v8BUovet3Xp3Y/+lx8Q47gq9PSMqp/FL+7jwf8DmJQL2GwU3kNZNg333u0Y6R/IvZ1jB009GF6XTTBm126bf4SoUpovDmPywc+rDfR43jKAXo8qxQ23ShfDP5CE9gOoXIlFA0W5q3nULP2ifEo4kWh9mx72a/EFkoByyL/zQqDwVjcas2hX0FrWL8EtOKO1ziYEBPI0cfWaTD9kvCJEa4Rd+UoAUzu02GHvn9Ssfqntmp4kVyB2YgL3SfmeGiayCcUUwpXgB9bnI+ujBKAv3CfCl81ls/fJbbrihJu6MRG1q+8gzchKCmD2gdHjlxk4dlB1XIrXYQ3jBvPvr0xDiGZegcUb5JtA94XQwGCanoPaEZ53BB6RSmhRMx8cF8o
X-Forefront-Antispam-Report: 
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(110136005)(82310400003)(36860700001)(107886003)(26005)(2906002)(356005)(6666004)(4326008)(47076005)(70586007)(336012)(54906003)(426003)(70206006)(86362001)(2616005)(5660300002)(7696005)(8676002)(8936002)(498600001)(81166007)(186003)(44832011)(1076003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:22.7302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5008e3-1614-4931-b0b8-08d93014073a
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB4574
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kevin Zhang <kevin.zhang3@cn.bosch.com>

The latest luci depends on lucihttp library.

Signed-off-by: Kevin Zhang <kevin.zhang3@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 recipes-extended/luci/luci_git.bb     |  2 +-
 recipes-extended/lucihttp/lucihttp.bb | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/lucihttp/lucihttp.bb

diff --git a/recipes-extended/luci/luci_git.bb b/recipes-extended/luci/luci=
_git.bb
index 97cce23..25e2d03 100644
--- a/recipes-extended/luci/luci_git.bb
+++ b/recipes-extended/luci/luci_git.bb
@@ -7,7 +7,7 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b42edef8fa55315f34f2370b4715ca=
9"
 SECTION =3D "base"
 DEPENDS =3D "json-c libubox libnl lua5.1 iwinfo openssl libxcrypt"
-RDEPENDS_${PN} =3D "lua5.1"
+RDEPENDS_${PN} =3D "lua5.1 lucihttp"
=20
 SRCREV =3D "07d9006d239b29c9377fccb91b45eb2d0e447919"
=20
diff --git a/recipes-extended/lucihttp/lucihttp.bb b/recipes-extended/lucih=
ttp/lucihttp.bb
new file mode 100644
index 0000000..db330bc
--- /dev/null
+++ b/recipes-extended/lucihttp/lucihttp.bb
@@ -0,0 +1,23 @@
+# SPDX-FileCopyrightText: 2021 Bosch Sicherheitssysteme GmbH
+#
+# SPDX-License-Identifier: MIT
+
+DESCRIPTION =3D "LuCI HTTP utility library"
+HOMEPAGE =3D "https://github.com/jow-/lucihttp"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6b7565d075eb26cd08b6ac739db35e=
3"
+
+DEPENDS_class-target +=3D " lua5.1"
+
+SRCREV =3D "a34a17d501c0e23f0a91dd9d3e87697347c861ba"
+SRC_URI =3D "git://github.com/jow-/lucihttp.git"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig openwrt-lua
+
+# Do not build tests
+EXTRA_OECMAKE +=3D "-DBUILD_TESTS=3DOFF"
+
+RDEPENDS_${PN} =3D "lua5.1"
--=20
2.25.1

