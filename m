Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0129.outbound.protection.outlook.com [157.55.234.129])
	by mail.openembedded.org (Postfix) with ESMTP id 34438734B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2016 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=digiaonline.onmicrosoft.com; s=selector1-theqtcompany-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qc2iR3Y5vr5f3v/1laxrAqjhemwKW3pe5V/wsCxn6Oc=;
	b=iPyn8spqXiK2AthOB7WTh8Zqcdqf/3gNQFDPlcI3CX5W3U7X+tmcbVkdSckYBNqi3e9KD3T34cBQdwidNvsLYurkPe8xg18WqlSYu2rhUwSz81Kl0jhohga85bkcFQATojLyEEi31BH6ibaQ82m+Ta8MOY/pXl4fTyhTace/vt4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=theqtcompany.com;
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.403.16; Fri, 12 Feb 2016 16:04:23 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Feb 2016 18:04:16 +0200
Message-ID: <1455293056-31901-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB4PR07CA029.eurprd07.prod.outlook.com (10.242.229.39) To
	DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:bMtGU35BJyVJDL67PLoNmhlXUnMzQQDPW4G/d1HxlNDkiT47ABjyd5JtuJUzPNo3nQtFarMxuTPAbE0J1h0Qx5hKLuylDeppKblkBAio4tXAJwZghLg0GoABIckRRei5ulzdUud/9sbS0nfqavai6Q==;
	3:2HZMLfZEYEKWZ1riZj9bnVUiR+770vLC4go8c0QdUCP/KMmseD7jUp+2crgIienuU/lVE5Z0KpabodgOhQQxdxJC7S1Q8wOOvPv6ZeYSePx3IC2lUT5yZV8n+bEa497i;
	25:9cGJvscH4i0gEHBIzQq2ohibvrw2aws3Bpq6wFTx/LichEbidiaYorJvwtWvZHVfG2578B3+LyalP5VnElFizZaq4b4DQFP1jkU8brZ/JblaTWyakXccSBRATSTsHC0G3D8APQiFElkvtCuLm60eQ2EI/0hX6O6FF9Rg+w2G5v8LVXLioZNmAy/EfijCHxUM5/xa0pfv2lwEefmX5n1wI9kg8oF2DdB5yMcs4iMDANSpjK00HYIYdm16RI26f14GtARdj2TxaS+f8LwUy0s0hhGf8if9iHSrMd/mvGiNA4BJhRE5BRwhhW+izt8++mHK
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-MS-Office365-Filtering-Correlation-Id: 40a4b4e3-c96a-442c-2253-08d333c62cc1
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:OsGK+pDMZI1pqOdOvXPbkuClEyO2RWB3Ag2TAxsEewxzUfyArsx9WPcCg+KT8hzGXMbWFGxEd7lsBDe0EYxA3Qfl6Xy7coWKY1KAvtvaYF73817zZMZIlX9f5a1IdUZvpPr7vdpbmTi9+gj0wMFqHSRUqF11UofmD1v4WkO0k6AqbuUEnxpjsfqo/DvTpnxOS3zq2sUGXNtvPENCWcOgdr80YblTN9VkTFGgarzDS4NjK8EDsO92nQTfVJR7FzjBPZmsCqucX6b6yhjujZcrbi0fj1o06zEytClcZh5mlRCohlb91ZFC1Uw4i08g5NmB9v+0G40p5hR9ctGHhuRy42hF76xYdPv6byevE8ljE/NMIJn7Xt6F4jdNgKj12FfCiot3Y1yOMJnk/e6UhmQwmihvO+7xL6/8auX3GGkoA4xFqc5eOf3JAQvVKkxf8as5qgLTFp1YlxhLehBdQzTV2NEZkPaJIttDF8mjNOvOevOLmAofvNpl9Xb24VtqP3XA;
	4:kvdBDLturxd7n1LEdHX5kq568/GPfeB40k12aRRuB+mvlPLyehPguADVJ7+iT/l9De+fqSH3ItJgmWCZqMbKDrst49NUPh78LY5vRhBAktIakVpOxwy+wYketbxuwhoH0Heuo6FJtnbJG93xtKSDjQ+7VXEzviFyfQaBX5Mj+SMNoNRnNQYfdy+MCh17ZA3Ut036ruV2IZ2061NTJy0JsnS3jXxkeoXAtleJZzWVxc1KZWQ3BlXkTIqG0d+kMI1f5q9InnSZeq4WE9aHBh3ILrPDF555X7JOXjg1ffdH4f/r0hjXta0gLKLmbtoJspve21fzm39U4AdkUJvLS81exVAmqSk79TiJFBZb0QdGpvkxHCz5iGZNrKVpiJRDy2ae
X-Microsoft-Antispam-PRVS: <DB5PR02MB117444757EAE54A4426CBB4890A90@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 0850800A29
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(2906002)(50226001)(5001960100002)(36756003)(50466002)(5003940100001)(86362001)(42186005)(33646002)(586003)(1096002)(107886002)(5004730100002)(50986999)(6116002)(229853001)(3846002)(40100003)(77096005)(19580395003)(450100001)(48376002)(575784001)(2351001)(110136002)(122386002)(19580405001)(92566002)(66066001)(189998001)(5008740100001)(87976001)(47776003)(7099028)(32563001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:D1qXFSjmLZ8N/FcAwQNvB14Ry1JdhzC+aJXTCLwqn?=
	=?us-ascii?Q?zlINKxuogEX4Seg2Oium7awlkwu2q9IKXGYhN6CoWCq40To1Gls6QPo8yLm2?=
	=?us-ascii?Q?cr4pEOaE8cO2fHXEksWJXqyq9Q+8MIrVx54OV3m6heblCaxuAMHOTt9ayrLw?=
	=?us-ascii?Q?hmD/q4gadM0ZjyJjTCH70LiYx2YOxgf7JOsipriGzN5IBqo+ekAWHYuS4aPq?=
	=?us-ascii?Q?t4hXcVcNy+5l/PiCA4SZBH2zt5RxxGLxgDZxauRsAzXVaq8b8EiOkhhYnZdK?=
	=?us-ascii?Q?kTElPnyq4d/dp8wPRYK4Nv/j+J6e1poKM2g1x6zF8j5QZbBFwO5BeU3DrXA4?=
	=?us-ascii?Q?GUXomBCvYQ/xcT8k5ml7CI5DC7iLTxUGzeYYSNJZaxoC/XsFOncDhik/5Q1w?=
	=?us-ascii?Q?PnFregBdhKyVIMjqcPJWcCD/BdMyAd9GrqcofAdU0OZdUkozjlSAk2A0u50Y?=
	=?us-ascii?Q?osEy6kkIPI/CwPb7AZA7QEU2oDm6zUrLWiHvCYbKvg5ifJN5VKNlX7klTbDh?=
	=?us-ascii?Q?sSGmdHlC+jTzHGZravAVcSpmWcNkd1xzF/0s8iPcwdXGEYMmQXSSqeo25FLo?=
	=?us-ascii?Q?IDTurDalSLG8DIKBW26crGVh8FMmFzSuz/QRNqLnYmFHFed2pTkKMqV0cZQn?=
	=?us-ascii?Q?MWGmiPS4ib1zdi/E/ePXB8UCT5aDzoDrBgVn5nysCmVY0WVBOd5+5sucjpnh?=
	=?us-ascii?Q?uJymiB41OGC/8YQD165blAWDT3DLHmfNyJju3lzDUMn2lNSIqdgegBDPGYKw?=
	=?us-ascii?Q?RD21zAFE5pD1zXGBMxso4iV2MUKAkN7nnxAQj0YRyt9Q6XpNdDC2A4E21G0H?=
	=?us-ascii?Q?2CCVpB9wZAhL2LAjO1WJ86CN2ZgpBNro+LidFYyB2DLxq6+VXNuz+NOERD8f?=
	=?us-ascii?Q?Ev4/tEsp4Qs9AwZMVr2ovP4EFU0n13qqKsRIbHUfjEpzyMrHcO22zqF9atYe?=
	=?us-ascii?Q?op1+91gIKbsA9NTEKxqYYwitoEAzoDDMspY3eKExVEloCfWnhsDcUvWkKZW6?=
	=?us-ascii?Q?as=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:lsUWnBEYtUe6ZxYueyOW6OnoTUAnvkoQuoY+I6Qv+8RdWZhqN0fT4kjv6iS0GQi3xsLO7Shi0jP3LYqmoXex/6EUpkwW1N8G10JVVrA6TUnNDGBn25Rv2H4vNMnvkFUdCPtCuhnA+xwkhgjK9pw0HQ==;
	24:fKbkCxiW7XRnmx/ayWfNDSn3n0CUnp0aAHKQLGzra5M0KkEmf6r7jEOhNqnWGfLzrUgPr/HicX5AE2ACz0l1UnyqJyGQR1GohZXXAcNGAbk=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2016 16:04:23.4267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH] qt3d: support qgltf in native and nativesdk builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2016 16:20:22 -0000
Content-Type: text/plain

qgltf is used to import a variety of 3D model formats and export into
fast-to-load, optimized glTF assets embedded into Qt resource files
---
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   | 31 ++++++++++++++++++++++
 recipes-qt/qt5/qt3d_git.bb                         | 16 ++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch

diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
new file mode 100644
index 0000000..c9d2223
--- /dev/null
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -0,0 +1,31 @@
+From 778d0c4515bae5bdeb650fb3e6b3e32a73722b51 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@theqtcompany.com>
+Date: Wed, 10 Feb 2016 09:02:09 +0200
+Subject: [PATCH] Allow a tools-only build
+
+---
+ qt3d.pro | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/qt3d.pro b/qt3d.pro
+index a26e76d..263e3c4 100644
+--- a/qt3d.pro
++++ b/qt3d.pro
+@@ -1,4 +1,4 @@
+-requires(contains(QT_CONFIG, opengl))
++!tools-only:requires(contains(QT_CONFIG, opengl))
+ 
+ load(configure)
+ qtCompileTest(assimp)
+@@ -17,3 +17,8 @@ load(qt_parts)
+ 
+ OTHER_FILES += \
+     sync.profile
++
++tools-only {
++    sub_tools.depends -= sub_src
++    SUBDIRS = sub_tools
++}
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 0ec99c6..a19422b 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -8,7 +8,19 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec \
 "
 
-DEPENDS = "qtdeclarative"
+DEPENDS += "qtbase"
+DEPENDS_class-target += "qtdeclarative qt3d-native"
+
+SRC_URI += " \
+    file://0001-Allow-a-tools-only-build.patch \
+    "
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG_class-native ??= "tools-only"
+PACKAGECONFIG_class-nativesdk ??= "tools-only"
+PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
+
+EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
 
 FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.bez \
@@ -16,3 +28,5 @@ FILES_${PN}-qmlplugins += " \
 "
 
 SRCREV = "9b9f34701f47824e8201453d148152fb0855f98a"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
1.9.1


