Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE938CD6E79
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 22:51:44 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67353.1780959096457590135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 15:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vFIkEHwU;
 spf=pass (domain: ti.com, ip: 40.93.201.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUmlgXNIs6p0Y8pmJ1xqz7Kcugo3HGonA7yzPcvaUIPg2YuvhPkwCZETDPASovtpBj1dIaVfM46JxrWzpqqIg6pF/tSOPewettmGp/9jS5UB2Us1ioqD9aWgTy+v+D4TrPYck1ZOcsyFBO9VclZGHrPVEH4ZnUxTtRyzQg7c+QKM5EUZEFjXvzkJj6yvZ0CiyOa0ic4ZdCJm49PbZ1d00uSnL5LGW5eDyMU2n0dn8m4ey4Q6xeTD8EC8vpek/yS24uTqX66/3431rnS3FJnI84+32xDUMf8rryV+Pch0MWxIkP7gwrniu2JYtmInJmVhuY17CAnG+zxqbsq3iUemYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jbpnoLwHoSPXFG6NGIoHWBERxEM6nZCvSvd2qvGtH8=;
 b=RDsdev+By+8j65p0gjuoLMnU20mgOYgudyIsvnh3nabixs7Lvrk2eLZ8EytO9xoK8QA90Cskxm9zBR7/0JJcNGlTvNyf4x7WIqLA7Woezp1UpQ0+UNRGz1SB5NDY86/nGNxhn9DjtSB2O74tafSNrt5phOXnoXJmZ3vUN51uL2e2PWE9t1YeXtGY5N7SGSB2rbO1FWmxmOU6bDu195Gd9OWKfHMfqbXCNfEdL8G0z57v6oAHOXP/kX0fBjCKgv764/hsay3fhfENlvJ3lT4xrXFepUxvpkXdDZNZ/7E2nKC5N4lYCQyX5JCDF8079jdsA+Y+LsPNuU/fe+qP+yI5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jbpnoLwHoSPXFG6NGIoHWBERxEM6nZCvSvd2qvGtH8=;
 b=vFIkEHwUU8mM9tJQxhhSPZcNjuqurVL2vm0KBhPTG6a1yDDD6PiRy76u651u5x9ze1HKFk8YT5j5Zn1CbsYJVekAszXU+2G9IxoRfb2TVCv5+Y+gG1aP8nuZ6Ev5Cxt31qTyYmlC28rrgxOPztlOOwN/kIuJh2baxZTPYpOfSMA=
Received: from MN2PR22CA0018.namprd22.prod.outlook.com (2603:10b6:208:238::23)
 by DS4PR10MB997597.namprd10.prod.outlook.com (2603:10b6:8:31e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 22:51:33 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::45) by MN2PR22CA0018.outlook.office365.com
 (2603:10b6:208:238::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 22:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 22:51:32 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 17:51:32 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 17:51:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 17:51:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658MpWgt354748
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2026 17:51:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wWioe-0000000Gpst-0Z9G
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2026 17:51:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] opencl-cts: update to release 2026-05-05
Date: Mon, 8 Jun 2026 17:51:32 -0500
Message-ID: <20260608225132.4012664-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS4PR10MB997597:EE_
X-MS-Office365-Filtering-Correlation-Id: 2122a71b-a720-40d4-bcf9-08dec5b07cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|6133799003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EiMLQR1Dw7E4VOx64Vl4Obfi/di3IlrQ4cDiAnnmnmaDaDUEWebR8CTnjck2gOf+xW0AkNxSBN9SaYLbcOa0cA1ya+aI/gsdPAq12sBi6H7+UxKn7MBILP1E0hYWV23Z6oko0jXHQliZPo3BRHwLJVQcbn+tYgOpNgSGItGfKo22mO1t9wdDiT7Zeu3C2bYRKfPJuTfy3txHZ7de3xux7ScOktZjZtw5fUs2TW0Z6o78lgaYIVtUF98GHpr8wekh/GuTovdy5EJIwMOhV8ysgZnLZYTPmZqYOoB5n2DyvpqNTdNN+latzLjQGo0YHqa8jFFOTrbWYdleAcQ9lLvAKxWanV9uof/Z6tN92LSzA+Jfqb3SS3aTDR9YakBPgl71l4M1f+g6ZE6YV1y98jtmD2Vul68UaqWGhoFj9pmf79Wtx4bN3bCLs04wC/ZnR0m2g8W3O4oaOg/Skg7+Xti8LJa3q+3OYtvFctNQIThpDfHzkA+RmO+DaTOCEE6ebL2ZJvzvdH/fOEzyBn1NPcOcx79lcNfnryQPWAxCCavYiisJXzGGU2uq4+KzbYfzS8Gcl7O/GzyoE4J3W3vYGvBlgBupFjRdKimqntwa2u6ek86vtomHgpjumxPdm/9E9LogwCGmlwVHWYT3grzZ9unLPD7wMWF1X3E3YgPuNPucCwAQcYVwJ+WDdGqyoK9sx09xRplhevbb5rPdUFhy4SG9Ts7eT1eZhbSR+Qa9/77+MiE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(6133799003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OsImBdcXQDKAXcfcGj6KCl1cMIxxkiUgBCS2LuN+lQylyDyb4yCO5PJOidIEFrhPapbkyza85y45NXrXPc2f8waQdj4/nW8d+4GKWBPC34KBYsF4FDcjYHoZ9fB2jeKww5Kzsz0Qafvz1IJZfTIQxpkCHx6WWeuZmcOOcuu1BYmSuk/ghJmVJnqdAEgnrQu5fE8/itLMZckGdaqN61E/cuyULpbLqgp4u4AMoGbs2VaC2Sb6Wtd2GlzbPqybfaZu8OZ8vUHP4D4ccVre/jL6HEwAHwH9OiEv8uOtR/HCwb+pemUf/MNMn7v4GzcGbjYvYV9A+xYwWC3PU74cmTHQDfPLF7tOW+O45Bg0kz9vvKOKtocYdnHvWGBczs8g9IrYtrUJ8PLfRm7gyfKu915RBnm/t8XyAT0cfBqJZJLA1pHaFQaSMnTi+kAtmdP/N+YU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:51:32.8642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2122a71b-a720-40d4-bcf9-08dec5b07cac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997597
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 22:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127424

Update OpenCL CTS to the latest release.  With the move of the
opencl-headers and other opencl-* packages to a newer version, this one
also needs to update to fix compile issues related to the header
changes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../files/0001-Ignore-Compiler-Warnings.patch | 43 -------------------
 ...2025.04.14.bb =3D> opencl-cts_2026.05.05.bb} |  9 ++--
 2 files changed, 4 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-=
Warnings.patch
 rename meta-oe/recipes-core/opencl/{opencl-cts_2025.04.14.bb =3D> opencl-c=
ts_2026.05.05.bb} (80%)

diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warning=
s.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.p=
atch
deleted file mode 100644
index 2495f195c1..0000000000
--- a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
-From: Antonios Christidis <a-christidis@ti.com>
-Date: Fri, 17 Jan 2025 15:05:39 -0600
-Subject: [PATCH] Create CMake option ENABLE_WERROR
-
-This creates an option that can be toggled on or off when configuring the =
project.
-By default, it's set to ON
-
-Upstream-Status: Pending
-Signed-off-by: Antonios Christidis <a-christidis@ti.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -19,6 +19,16 @@ add_definitions(-DCL_USE_DEPRECATED_OPEN
- add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
- add_definitions(-DCL_ENABLE_BETA_EXTENSIONS)
-=20
-+option(ENABLE_WERROR "Enable warnings as errors" ON)
-+
-+if(ENABLE_WERROR)
-+  if(MSVC)
-+    add_compile_options(/WX)
-+  else()
-+    add_compile_options(-Werror)
-+  endif()
-+endif()
-+
- option(USE_CL_EXPERIMENTAL "Use Experimental definitions" OFF)
- if(USE_CL_EXPERIMENTAL)
-   add_definitions(-DCL_EXPERIMENTAL)
-@@ -99,7 +109,6 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_C
-     add_cxx_flag_if_supported(-Wmisleading-indentation)
-     add_cxx_flag_if_supported(-Wunused-function)
-     add_cxx_flag_if_supported(-Wunused-variable)
--    add_cxx_flag_if_supported(-Werror)
-     if(NOT CMAKE_BUILD_TYPE MATCHES "Release|RelWithDebInfo|MinSizeRel")
-         # Enable more warnings if not doing a release build.
-         add_cxx_flag_if_supported(-Wall)
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb b/meta-oe=
/recipes-core/opencl/opencl-cts_2026.05.05.bb
similarity index 80%
rename from meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
rename to meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb
index fe1d6075e2..e99c305d9a 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb
@@ -7,16 +7,15 @@ inherit pkgconfig cmake features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opencl"
=20
-DEPENDS +=3D "opencl-headers virtual/libopencl1 spirv-tools-native"
+DEPENDS +=3D "opencl-headers virtual/libopencl1 spirv-headers spirv-tools-=
native"
 RDEPENDS:${PN} +=3D "python3-core python3-io"
=20
=20
-SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=3Dhttps=
;branch=3Dmain;lfs=3D0 \
-	   file://0001-Ignore-Compiler-Warnings.patch"
+SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=3Dhttps=
;branch=3Dmain;lfs=3D0"
=20
-SRCREV =3D "e96edaef8b582c2412a2aab4b82f5c88af88617d"
+SRCREV =3D "0979549a997090c0569da4c4e995422b8f73f1fe"
=20
-EXTRA_OECMAKE:append =3D " -DENABLE_WERROR=3DOFF -DCL_INCLUDE_DIR=3D${STAG=
ING_INCDIR} -DCL_LIB_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
+EXTRA_OECMAKE:append =3D " --compile-no-warning-as-error -DSPIRV_INCLUDE_D=
IR=3D${STAGING_EXECPREFIXDIR} -DCL_INCLUDE_DIR=3D${STAGING_INCDIR} -DCL_LIB=
_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
=20
 PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gles', '', d)} =
\
--=20
2.43.0


