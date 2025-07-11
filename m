Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12078C83F23
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:37 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web10.10258.1752228088092278613
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=YDqYj/QF;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228088; x=1783764088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9gfR/t2di2A8a2vhi+DcdAm2PN5XhZjoU0Prrld+1qs=;
  b=YDqYj/QFHyW2SfoMhFOjlkwf7XnqgomfLYfCvGkEO2VT9D2KBrQduxpx
   JeRdPaFF6jAnes27LxzfMTJ5vzwYWjVhkjJYQaK1Y98mFWfoi+X3DNqiL
   Smalu7+VzhooR5gThpvAdKqy5ys9pKaKOapRYG9GpE3lESQaTvrcU5w2h
   E=;
X-CSE-ConnectionGUID: QlO3OPlaTPmNn8rkP44hJA==
X-CSE-MsgGUID: JlKo3aT0QQWipOAVln5gyQ==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 11 Jul 2025 12:01:25 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:25 +0200
X-CSE-ConnectionGUID: UaIMhk3KSeWph8GFf0Weaw==
X-CSE-MsgGUID: COnFJVuITLWLyCLcoPuXeQ==
X-CSE-ConnectionGUID: 4zWASYB/TVGQc6em+gWuhQ==
X-CSE-MsgGUID: hLPQQhTjScaGNFvqX4+7DQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 10/10] [RFC] vulkan-cts: upgrade 1.4.2.1 -> 1.4.3.1
Date: Fri, 11 Jul 2025 12:00:27 +0200
Message-ID: <20250711100052.255467-11-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711100052.255467-1-Moritz.Haase@bmw.de>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118436

New version includes support to build against CMake 4+.

Release notes are available at [0].

[0]: https://github.com/KhronosGroup/VK-GL-CTS/releases

---

This is an RFC, as the build doesn't pass for me locally, it fails with:

    | CMake Error at external/spirv-tools/CMakeLists.txt:39 (message):
    |   spirv-tools not found

From what I can tell, the in-place fetching of the submodule doesn't seem to be
working correctly.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 29 -------------------
 .../vk-gl-cts/khronos-cts.inc                 |  1 -
 .../vk-gl-cts/vulkan-cts-sources.inc          | 25 ++++++++--------
 ...n-cts_1.4.2.1.bb => vulkan-cts_1.4.3.1.bb} |  2 +-
 4 files changed, 13 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.2.1.bb => vulkan-cts_1.4.3.1.bb} (92%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
deleted file mode 100644
index 9eef9a702e..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ec12bb7bda60cdf2c848e13df67452a7d30a42be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 3 Sep 2022 18:52:42 -0700
-Subject: [PATCH] cmake: Define WAYLAND_SCANNER and WAYLAND_PROTOCOLS_DIR if
- not already defined
-
-This helps with cross compiling and providing these knobs from cmake
-cmdline
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- framework/platform/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
---- a/framework/platform/CMakeLists.txt
-+++ b/framework/platform/CMakeLists.txt
-@@ -83,8 +83,9 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
- 				configure_file(${WAYLAND_XDG_SHELL_SRC_DIR}/xdg-shell.c ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.c COPYONLY)
- 				configure_file(${WAYLAND_XDG_SHELL_SRC_DIR}/xdg-shell.h ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.h COPYONLY)
- 			else ()
--				pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
--
-+				if (NOT WAYLAND_PROTOCOL_DIR)
-+					pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
-+				endif()
- 				if (NOT WAYLAND_SCANNER)
- 					pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
- 				endif()
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 1cc2da7a49..67a0dc564c 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -2,7 +2,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
-           file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
            file://0001-use-library-sonames-for-linking.patch \
            file://generate-srcuri.py \
            "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 563da1007a..df530e85e1 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,21 +6,20 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.2.1":
+    if d.getVar("PV") != "1.4.3.1":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
 SRC_URI += " \
-    https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=3364b982713a0440d1d342dd5eec65b122a61b71 \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=1b65bd602b23d401d1c4c86dfa90a36a52c66294 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=767e901c986e9755a17e7939b3046fc2911a4bbd \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=645c59c70e826d9738b6bb103316c03d887dfed3 \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6cf616f131e9870c499a50441bca2d07ccda9733 \
-    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=6fa5ac1fb3b01c93eef3caa2aeb8841565e38d90 \
-    git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
-    git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
-    file://0001-Fix-missing-include-cstdint-causing-build-failures.patch;patchdir=external/amber/src \
+    https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-tools/src;rev=f06e0f3d2e5acfe4b14e714e4103dd1ccdb237e5 \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=git/external/glslang/src;rev=963588074b26326ff0426c8953c1235213309bdb \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-headers/src;rev=6d0784e9f1ab92c17eeea94821b2465c14a52be9 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-docs/src;rev=112aee75d162412a4623e7d22a3de52e0233cbf5 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-validationlayers/src;rev=6ae58a2b17b2bcebdc5377995007391b85ffa10f \
+    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=git/external/amber/src;rev=57ba1ca211b6f4890c013dcf42cb16069ae916dd \
+    git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=git/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
+    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=git/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-video-samples/src;rev=a22e0084e6f38a16dc0dcebb4c19a14651a6665b \
+    git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=git/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
similarity index 92%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
index abbd026047..3f7a2480ef 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "644f10ca39dea3b7d9dbadaa75c56206b499a520"
+SRCREV_vk-gl-cts = "1ef11bc7acde6b53a499de73db4cf78db9572710"
 
 require vulkan-cts-sources.inc
 

