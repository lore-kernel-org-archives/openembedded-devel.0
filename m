Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 702AA605BB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 08:50:36 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 5C652204E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 10:50:35 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 May 2016 10:50:24 +0200
Message-Id: <1462092626-26478-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-browser][PATCH 1/3] chromium: Replace deprecated base_* wrapper calls
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
X-List-Received-Date: Sun, 01 May 2016 08:50:38 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 recipes-browser/chromium/cef3_280796.bb           |  2 +-
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index dab721e..4bfa783 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -36,7 +36,7 @@ export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
 EXTRA_OEGYP =	" \
-    ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '-Ddisable_fatal_linker_warnings=1', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-Ddisable_fatal_linker_warnings=1', '', d)} \
 "
 
 do_configure_prepend() {
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 25489c1..48a5a9e 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -97,8 +97,8 @@ CHROMIUM_EXTRA_ARGS ?= " \
 
 # Conditionally add ozone-wayland and its patches to the Chromium sources
 # You can override this by setting CHROMIUM_ENABLE_WAYLAND=1 or CHROMIUM_ENABLE_WAYLAND=0 in local.conf
-CHROMIUM_ENABLE_WAYLAND ??= "${@base_contains('DISTRO_FEATURES', 'x11', '0', \
-                     base_contains('DISTRO_FEATURES', 'wayland', '1', \
+CHROMIUM_ENABLE_WAYLAND ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', \
+                     bb.utils.contains('DISTRO_FEATURES', 'wayland', '1', \
                      '0', d),d)}"
 # Some sanity checks.
 python do_check_variables() {
@@ -125,11 +125,11 @@ addtask check_variables before do_fetch
 OZONE_WAYLAND_GIT_DESTSUFFIX = "ozone-wayland-git"
 OZONE_WAYLAND_GIT_BRANCH = "Milestone-ThanksGiving"
 OZONE_WAYLAND_GIT_SRCREV = "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
-SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
+SRC_URI += "${@oe.utils.conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
 OZONE_WAYLAND_PATCH_FILE_GLOB = "*.patch"
 
-do_unpack[postfuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
-do_patch[prefuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
+do_unpack[postfuncs] += "${@oe.utils.conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
+do_patch[prefuncs] += "${@oe.utils.conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
 SRC_URI[md5sum] = "1f5093bd7e435fdebad070e74bfb3438"
@@ -183,8 +183,8 @@ EXTRA_OEGYP =	" \
 	-Dclang=0 \
 	-Dhost_clang=0 \
 	-Ddisable_fatal_linker_warnings=1 \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
 	-I ${WORKDIR}/oe-defaults.gypi \
 	-I ${WORKDIR}/include.gypi \
 	${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I ${WORKDIR}/component-build.gypi', '', d)} \
-- 
2.7.4


