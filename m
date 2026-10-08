Return-Path: <t.schmelzer@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B61CA600F
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:06:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12206.1791454011439565128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=fZ1Knya/;
 spf=pass (domain: phytec.de, ip: 52.101.83.135, mailfrom: t.schmelzer@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofTrp7T+l2f7f8nqEvRXKRNXYGi3moJSihY/GRpsMlV5UatrqyNhwg7hBliPUBJDp60WJoLR0nEREFpT5i6usqNj2XfprLC1LrdokvLrsN3COWZ0TI0sj3B9+b9N75lLuQtRClFyk+IgIBuhNRlUe1Q/mCQ9vjhsslXqLz6NkQ4RGKd7UBFNgofCLTgFRBa9VuD7ufxP0cv14ujhGxlz4seyZj8S6Qu4uNc/uL+0Q4c/TBvfLf16XzwOR+Z7Vs8SSwGt55tbwkgZ0xdXbgiIZz+S5/lYKAEHPmRi58UXo0L0yyOvuzIsypr9SnlIi1vXpHd+lT7qYiNgkMcxs1dwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HGTDB8ES9inp/K3a1tG9bh0xPt9Dz5dzlpFP/6UuF0=;
 b=CGwwGuc2QbfG5AIC2cBc9QpNWJi/C41ZUG/6iBgvS4IBjftXRt+RolGT6/m8hZ2/EHiGeD+CAy0sgUAyQ6Vo7QNIRR1nPKJ32AwLAimvfo9HwJw9CBeKFtiDzoEES2bsGkmRngzLKJYs6CJhVfIBncA3ZPVgYwCYuxNEpb0AghdjJrDr+Mec1XuS/VsGfG0nuhquGh71z7MxBUWdbqtmNjh38H7luePAHFn0tsACsMciJvkmix5/SADiaHdGXlhWFRVtEa4i466ORpP+IOFuVMzNeVoMbsbvebw5Y0m+p8JHaF188zFIk2wa9jIpT9SrP8k2PN3Z/Agneo45j6K5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HGTDB8ES9inp/K3a1tG9bh0xPt9Dz5dzlpFP/6UuF0=;
 b=fZ1Knya/J5TeuM+X/JzpwkPljg+Z4CNBTyvdhg/hAQ5Nnopt4BNDcqrJTeUBWGQ4pYXXu0iSIEbewNfFSz22Ds8AaKXd1qw347zEZe1UtlWfzUnQaEEYU0AgioSdEK1QQtZzPY8yNQoU2N4UAGd8MxIYIqTeVj+OEfdZ6rXmWzDejN5rnMLyrRPQBaMj+D9cTQHxg+qRQaqLVm9fMGesgo9KBWi2lfo2A9GmKmHU94Q9H21EDYEV2cRQfr0DaF6+TEFIB9iKnJCdGYkE0sCNSLdXyurHutLohboEC0Ebv0JEkP4YMNURiQ1QIK4R6NM9d6MO0gRLEJyYyWdnK/HCnA==
Received: from DUZPR01CA0337.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::10) by VI3P195MB107555.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:379::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:06:43 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:4b8:cafe::84) by DUZPR01CA0337.outlook.office365.com
 (2603:10a6:10:4b8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 10:06:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 10:06:42 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:06:41 +0200
From: Thorsten Schmelzer <t.schmelzer@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH 1/5] lvgl: Update to 9.6.0
Date: Thu, 8 Oct 2026 12:06:22 +0200
Message-ID: <20261008100626.2259941-2-t.schmelzer@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008100626.2259941-1-t.schmelzer@phytec.de>
References: <20261008100626.2259941-1-t.schmelzer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BA:EE_|VI3P195MB107555:EE_
X-MS-Office365-Filtering-Correlation-Id: e15f264b-9cc4-4632-f265-08df2523da5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|42112799006|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|10067099003|13003099007|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	0jSejh6TiUOqxIfzOn8ZxTGJTxoOQjohxW9Eo4BVw+uxxviWr/hVyN/6PW5F4t7iphGf5V+s8WoYoRnsmZLEEuXAu+dk4sjra8pyzCDW4J7+naumDJTM/+Jabh6WIcvQ2PKK3oKIHazMBRVl25wOy/5m5QxZL1XxOq53a/JfKsF7+ZGjVjg8KzlrnAfMj9Ma464j7aQElaz7JsDpizfD9Jl7ZBy982LgUk2ahExRSNBPKgVKbKb104mmhIMl9tHUYiamKpbsY4qBNAHvL5qBz4QMU49YP8E96iVSDfED6zdbfP2R96g/VDJYHixfOPDJ9RIYFwRk1UptT00xX88USWywH7bhFiL19vxQeDx608B6j2SVenXfg8XRtzJPCzcCmU9faet0fyjs08TXPWVCwF6jHEym5+qqhoZ/H6/NxC8Xrp1QmXcMHKf53tyX/WO9N+Ss4Cag1dnvtPo+JYAv+z8ZlPSBuhLrz6D1ayfleE4bVpsHbzVUlA+ZVqxpQmUEaHEkW3eCA06iehhTTqCce/VpBCTMGqeihnstHi2GslLt+CXLupj1dm1QOIrlGvhMv/vHy2VbNYDBSeNtYceM/NEuhVvgzZwe4yrGplKdXWYswanx/ntWZFGP5iRzgfuqu0wpvqv0/HwawC6aYCgubg==
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(13003099007)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9qnFovehzsAVkqpXIK0hU/OrFu+fj4yDzqzIvqLO5pzBzreudaz6xi6wv5LsyebAoWXFDUpljDGB7vLFLepB08xKjRz5EsPZkpSAeSnJGUI4mtwtGODzM2rTG6o1ZlfRO1uR+FC1CwJdWKPhrGMf+8k0edDBxm0uZMuUkuH+3+3FKvvlrZqXtPH5dGBZfaYxJtxlxsekLIdf1/dWex5szkVkbZb/OCZfO0yyswAyjxjtcQxyr1VBuRQ3SXTSfRGCsJiT8qqQbhKb+pfiA+NGOSjG7rz2feWVUrzvAzGeWLF44tU2t93kpw1Qot+Tf6z4Pi6KDWKAmnBZfAZlPtyRy/zBXxcMoh+7TUMW5egC76bQEUyD9h5ABYic2fNIMTgI07egt6hhwz6/yKxeZgfSg+S5383krCf+J06PBwwE+NolVFdD6mWhYZSMyqU74K8W
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:42.6804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e15f264b-9cc4-4632-f265-08df2523da5d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3P195MB107555
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 10:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130666

Add pkgconfig inherit and drop manually adding include paths to CFLAGS
and CXXFLAGS. The lvgl cmake can handle this meanwhile.

Add a patch to fix missing version and links for installed .so files.

Signed-off-by: Thorsten Schmelzer <t.schmelzer@phytec.de>
---
 ...rate-proper-.so-links-when-installin.patch | 71 +++++++++++++++++++
 meta-oe/recipes-graphics/lvgl/lv-conf.inc     |  7 --
 .../lvgl/{lvgl_9.5.0.bb =3D> lvgl_9.6.0.bb}     |  8 ++-
 3 files changed, 76 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0001-build-cmake-ge=
nerate-proper-.so-links-when-installin.patch
 rename meta-oe/recipes-graphics/lvgl/{lvgl_9.5.0.bb =3D> lvgl_9.6.0.bb} (7=
1%)

diff --git a/meta-oe/recipes-graphics/lvgl/files/0001-build-cmake-generate-=
proper-.so-links-when-installin.patch b/meta-oe/recipes-graphics/lvgl/files=
/0001-build-cmake-generate-proper-.so-links-when-installin.patch
new file mode 100644
index 000000000000..07e6557cb72d
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0001-build-cmake-generate-proper-=
.so-links-when-installin.patch
@@ -0,0 +1,71 @@
+From a9841c03f4670d1b0373cb869573740df92cd1cf Mon Sep 17 00:00:00 2001
+From: Thorsten Schmelzer <t.schmelzer@phytec.de>
+Date: Tue, 6 Oct 2026 11:58:15 +0200
+Subject: [PATCH] build(cmake): generate proper .so links when installing
+ shared library
+
+Commit 789d453 removed the set_target_properties sections for the
+library installations. That results in only the plain liblvgl.so being
+installed in the install location, when building a shared library.
+Other package and build systems (like yocto), however expect to have a
+proper versioned library and links like this:
+liblvgl.so -> liblvgl.so.9
+liblvgl.so.9 -> liblvgl.so.9.6.0
+liblvgl.so.9.6.0
+
+Fix this by setting VERSION and SOVERSION in set_target_properties
+for lvgl, lvgl_demos and lvgl_examples library targets.
+
+Upstream-Status: Backport [8df3de9c4c5e45ad7b0fef5adc2fa6eaa5d21579]
+
+Signed-off-by: Thorsten Schmelzer <t.schmelzer@phytec.de>
+---
+ env_support/cmake/install.cmake | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/env_support/cmake/install.cmake b/env_support/cmake/install.c=
make
+index cb647af9ea9b..93a0272f81c8 100644
+--- a/env_support/cmake/install.cmake
++++ b/env_support/cmake/install.cmake
+@@ -91,6 +91,13 @@ install(
+     DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/lvgl"
+ )
+=20
++set_target_properties(
++    lvgl
++    PROPERTIES OUTPUT_NAME lvgl
++    VERSION ${LVGL_VERSION}
++    SOVERSION ${LVGL_SOVERSION}
++)
++
+ install(TARGETS lvgl
+     EXPORT lvglTargets
+     ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+@@ -132,6 +139,13 @@ if(CONFIG_LV_BUILD_DEMOS)
+         FILES_MATCHING PATTERN "*.h"
+     )
+=20
++    set_target_properties(
++        lvgl_demos
++        PROPERTIES OUTPUT_NAME lvgl_demos
++        VERSION ${LVGL_VERSION}
++        SOVERSION ${LVGL_SOVERSION}
++    )
++
+     # Demo library target (if you build one)
+     install(TARGETS lvgl_demos
+ 	EXPORT lvglDemosTargets
+@@ -155,6 +169,13 @@ if(CONFIG_LV_BUILD_EXAMPLES)
+         FILES_MATCHING PATTERN "*.h"
+     )
+=20
++    set_target_properties(
++        lvgl_examples
++        PROPERTIES OUTPUT_NAME lvgl_examples
++        VERSION ${LVGL_VERSION}
++        SOVERSION ${LVGL_SOVERSION}
++    )
++
+     install(TARGETS lvgl_examples
+ 	EXPORT lvglExamplesTargets
+         ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc
index 4264f20895de..84115b68cc51 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -27,13 +27,6 @@ inherit cml1 python3native
=20
 EXTRA_OECMAKE +=3D "-DLV_BUILD_USE_KCONFIG=3DON"
=20
-LVGL_FLAGS +=3D " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'drm', '-I${STAGING_INCDIR}/libd=
rm', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'freetype', '-I${STAGING_INCDIR}=
/freetype2', '', d)} \
-"
-CFLAGS +=3D "${LVGL_FLAGS}"
-CXXFLAGS +=3D "${LVGL_FLAGS}"
-
 KCONFIG_CONFIG_ROOTDIR ?=3D "${S}"
 KCONFIG_FILE ?=3D "${KCONFIG_CONFIG_ROOTDIR}/Kconfig"
 export KCONFIG_CONFIG ?=3D "${KCONFIG_CONFIG_ROOTDIR}/.config"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.5.0.bb b/meta-oe/recipes-=
graphics/lvgl/lvgl_9.6.0.bb
similarity index 71%
rename from meta-oe/recipes-graphics/lvgl/lvgl_9.5.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_9.6.0.bb
index 18a5b5de5160..260ea094e68c 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.5.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.6.0.bb
@@ -9,11 +9,13 @@ HOMEPAGE =3D "https://lvgl.io/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3D4570b6241b4fced1d1d18eb691a=
0e083"
=20
-SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/=
v9.5;tag=3Dv9.5.0"
+SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/=
v9.6;tag=3Dv9.6.0 \
+           file://0001-build-cmake-generate-proper-.so-links-when-installi=
n.patch \
+           "
=20
-SRCREV =3D "85aa60d18b3d5e5588d7b247abf90198f07c8a63"
+SRCREV =3D "80ca777e37a2b176770726a02e07a6fb79ef0b39"
=20
-inherit cmake
+inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3DO=
N"
=20

