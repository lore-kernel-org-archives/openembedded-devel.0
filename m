Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32945EB64D7
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 00:56:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1032.1686704198859499118
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 17:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CiMGb8sa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35E0uWjE112043;
	Tue, 13 Jun 2023 19:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686704192;
	bh=33Iysy8GDqGyH02/eu7tN/55EUWwUED/Cwz/euNpTno=;
	h=From:To:CC:Subject:Date;
	b=CiMGb8saWk9G3Jx6dHhAEOXGCSNi+dVPV8tN4fJ5OUs8swbCIDkzVG0homZbuwRYf
	 ROUpVsSGWfgkvbBFT9muQeCMveEwjgniY/6gEWDZWbFSAdAf4kJ/HusQ3Di0W/LAH4
	 DXyb/EZG4L4ugFD+mjKo/w4ABiyb5Z+oiIAioY4M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35E0uWJc038678
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Jun 2023 19:56:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 19:56:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 19:56:32 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35E0uW7E074306;
	Tue, 13 Jun 2023 19:56:32 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <raj.khem@gmail.com>
CC: <Openembedded-devel@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [oe][meta-oe][PATCH] opengl-es-cts: 3.2.8.0 -> 3.2.9.3
Date: Tue, 13 Jun 2023 19:56:22 -0500
Message-ID: <20230614005622.2586311-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 00:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103278

From: Randolph Sapp <rs@ti.com>

Bump the opengl-es-cts version to latest since this package is currently
incompatible with Weston 10 due to changes in wayland-protocols.

I would bump the vulkan-cts test revision here as well, but
unfortunately newer versions of vulkan-cts add video encode/decode tests
from Nvidia that break on any arch other than amd64 in their current
format.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../vk-gl-cts/khronos-cts.inc                 | 10 ++++++----
 ...ts_3.2.8.0.bb => opengl-es-cts_3.2.9.3.bb} | 19 +++++++++----------
 .../vk-gl-cts/vulkan-cts_1.3.3.1.bb           |  3 +++
 3 files changed, 18 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.8.0.bb => opengl-es-cts_3.2.9.3.bb} (65%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 4fd32d93c..097acc1a0 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -4,12 +4,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "\
 	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
 	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
-	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=master \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=master \
-	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=master \
+	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=main \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=main \
+	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=main \
         git://github.com/open-source-parsers/jsoncpp.git;protocol=https;destsuffix=git/external/jsoncpp/src;name=jsoncpp;branch=master \
         git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;destsuffix=git/external/vulkan-docs/src;name=vulkan-docs;branch=main \
-        https://raw.githubusercontent.com/baldurk/renderdoc/fcdea67879fa1991e56cf7734ce0ce27866b665f/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
+        https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
+        git://github.com/Igalia/ESExtractor.git;protocol=https;destsuffix=git/external/ESExtractor/src;name=ESExtractor;branch=main \
+        git://github.com/nvpro-samples/vk_video_samples.git;protocol=https;destsuffix=git/external/video-parser/src;name=video-parser;branch=main \
         file://gen-framework-path.patch \
 "
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
similarity index 65%
rename from meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
index edfeda2be..67ce5f2b9 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
@@ -1,20 +1,19 @@
 DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
-# opengl-es-cts-3.2.8.0
-SRCREV_vk-gl-cts = "317f467fac032b88a4789e4345421f92c4e8716d"
-SRCREV_amber = "209d92e2c27a333e723d24497e8c7a07b2f2eb39"
-SRCREV_glslang = "9158061398a96033c990e69156bd28c67114544b"
-SRCREV_spirv-headers = "449bc986ba6f4c5e10e32828783f9daef2a77644"
-SRCREV_spirv-tools = "ee30773650eca50b1cd3c913babcc2b50d7b91fd"
+# opengl-es-cts-3.2.9.3
+SRCREV_vk-gl-cts = "7f5fb62245d535a1fc0bf50b2c7e5a342dc551fe"
+SRCREV_amber = "933ecb4d6288675a92eb1650e0f52b1d7afe8273"
+SRCREV_glslang = "a0ad0d7067521fff880e36acfb8ce453421c3f25"
+SRCREV_spirv-headers = "87d5b782bec60822aa878941e6b13c0a9a954c9b"
+SRCREV_spirv-tools = "f98473ceeb1d33700d01e20910433583e5256030"
+SRCREV_ESExtractor = "ce5d7ebcf0ebb0d78385ee4cc34653eb6764bfc4"
 # Not yet needed
 SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
-SRCREV_vulkan-docs = "d70e01c0be7b8a7d20b186b30b29a75b18bba75d"
+SRCREV_vulkan-docs = "9a2e576a052a1e65a5d41b593e693ff02745604b"
+SRCREV_video-parser = "7d68747d3524842afaf050c5e00a10f5b8c07904"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
-SRC_URI += "file://0001-Remove-dead-variable-984.patch;patchdir=external/amber/src \
-            file://0001-include-missing-cstdint.patch;patchdir=external/amber/src"
-
 S = "${WORKDIR}/git"
 
 do_install() {
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
index b1aa7d9b1..f491385b3 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
@@ -10,6 +10,9 @@ SRCREV_spirv-tools = "b930e734ea198b7aabbbf04ee1562cf6f57962f0"
 SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
 SRCREV_vulkan-docs = "9b5562187a8ad72c171410b036ceedbc450153ba"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+# Not yet needed
+SRCREV_ESExtractor = "ce5d7ebcf0ebb0d78385ee4cc34653eb6764bfc4"
+SRCREV_video-parser = "7d68747d3524842afaf050c5e00a10f5b8c07904"
 
 SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
             file://0001-vulkan-cts-include-missing-cstdint.patch \
-- 
2.41.0


