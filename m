Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAFBC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 13:14:28 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web10.13674.1752239657842553224
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 06:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=CupbjbeI;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752239658; x=1783775658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WryLoskpgDeoukc6ArKLHh5kuMKtzKWH2Qeyc+YNba4=;
  b=CupbjbeI8rB79ZuVVIEFWWwP6qMXl6HPauDLM6j029abNSqY4K66MEWr
   0tCHFoaP2LTo7D5ACV1ltdi8+rSo6VYcUH7ylWChRUYzMb4hsHJbktmwK
   PPjazR5fjc7JhoF8AwdyokH5Q3cGswhZ1ANAr/tYpsNVAU120bHu4JX20
   E=;
X-CSE-ConnectionGUID: k0A0QCQHT7ilKFiUjrGOmA==
X-CSE-MsgGUID: a1W/TZd/SW2qMGp6Zkn2Gw==
Received: from 160.46.252.38.spf.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 15:14:16 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 11 Jul 2025 15:14:14 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 11 Jul 2025 15:14:13 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 15:14:12 +0200
X-CSE-ConnectionGUID: NxZ2m/nqRmuGVGSk+Gnaug==
X-CSE-MsgGUID: QixY5FgpQ7mfqHIsPbWWaw==
X-CSE-ConnectionGUID: 8DBSJV99TtKO4QMhD0ppXA==
X-CSE-MsgGUID: lC3MwwnjQDOXPShhpjvyqQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH v2 10/10] vulkan-cts: upgrade 1.4.2.1 -> 1.4.3.1
Date: Fri, 11 Jul 2025 15:12:55 +0200
Message-ID: <20250711131254.303582-2-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17c.europe.bmw.corp (2a03:1e80:a15:58f::1:46) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118449

New version includes support to build against CMake 4+.

Release notes are available at [0].

The SRC_URI update helper script required adaptations, as it was broken by
recent Poky changes. The SRC_URI entries were only updated manually back then
via [1].

[0]: https://github.com/KhronosGroup/VK-GL-CTS/releases
[1]: https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc?h=master-next&id=fc78d37ff0ce9e0d60455465851dbe4e86d7a8b3

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 29 -------------------
 .../vk-gl-cts/files/generate-srcuri.py        |  8 +++--
 .../vk-gl-cts/khronos-cts.inc                 |  1 -
 .../vk-gl-cts/vulkan-cts-sources.inc          | 17 +++++------
 ...n-cts_1.4.2.1.bb => vulkan-cts_1.4.3.1.bb} |  2 +-
 5 files changed, 15 insertions(+), 42 deletions(-)
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
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py b/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
index c2756b592c..3f64e9dc4a 100755
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/generate-srcuri.py
@@ -53,11 +53,15 @@ def convert_fetch(basedir):
             # Ignore these as so far we can use the system copies
             pass
         elif isinstance(p, fetch.SourceFile):
-            dest = "/".join(["git/external", p.baseDir, p.extractDir])
+            dest = "/".join(
+                ["${BB_GIT_DEFAULT_DESTSUFFIX}/external", p.baseDir, p.extractDir]
+            )
             url = f"{p.url};subdir={dest};sha256sum={p.checksum}"
             lines.append(f"    {url} \\")
         elif isinstance(p, fetch.GitRepo):
-            dest = "/".join(["git/external", p.baseDir, p.extractDir])
+            dest = "/".join(
+                ["${BB_GIT_DEFAULT_DESTSUFFIX}/external", p.baseDir, p.extractDir]
+            )
             url = transform_git(p.httpsUrl, p.revision, dest)
             lines.append(f"    {url} \\")
         else:
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
index 563da1007a..8d70bf08c3 100644
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
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=3364b982713a0440d1d342dd5eec65b122a61b71 \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=1b65bd602b23d401d1c4c86dfa90a36a52c66294 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=767e901c986e9755a17e7939b3046fc2911a4bbd \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=645c59c70e826d9738b6bb103316c03d887dfed3 \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6cf616f131e9870c499a50441bca2d07ccda9733 \
-    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=6fa5ac1fb3b01c93eef3caa2aeb8841565e38d90 \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=f06e0f3d2e5acfe4b14e714e4103dd1ccdb237e5 \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=963588074b26326ff0426c8953c1235213309bdb \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=6d0784e9f1ab92c17eeea94821b2465c14a52be9 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=112aee75d162412a4623e7d22a3de52e0233cbf5 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6ae58a2b17b2bcebdc5377995007391b85ffa10f \
+    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=57ba1ca211b6f4890c013dcf42cb16069ae916dd \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
     git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=a22e0084e6f38a16dc0dcebb4c19a14651a6665b \
     git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
-    file://0001-Fix-missing-include-cstdint-causing-build-failures.patch;patchdir=external/amber/src \
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
 

