Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 8FEAE71347
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 09:45:09 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 11EAA2253E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 11:45:08 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 11:44:33 +0200
Message-Id: <1409823873-19321-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH] chromium: Upgrade to version 37.0.2062.94
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 09:45:14 -0000

This is the current stable release of the 37 series. Since it is no longer
a beta, the DEFAULT_PREFERENCE = "-1" bit is removed. Furthermore, this
version adds the angle_use_commit_id flag, which makes the related patch
obsolete.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{chromium_37.0.2062.0.bb => chromium_37.0.2062.94.bb} | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename recipes-browser/chromium/{chromium_37.0.2062.0.bb => chromium_37.0.2062.94.bb} (93%)

diff --git a/recipes-browser/chromium/chromium_37.0.2062.0.bb b/recipes-browser/chromium/chromium_37.0.2062.94.bb
similarity index 93%
rename from recipes-browser/chromium/chromium_37.0.2062.0.bb
rename to recipes-browser/chromium/chromium_37.0.2062.94.bb
index c0e3b36..510b644 100644
--- a/recipes-browser/chromium/chromium_37.0.2062.0.bb
+++ b/recipes-browser/chromium/chromium_37.0.2062.94.bb
@@ -11,16 +11,11 @@ SRC_URI = "\
         ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://disable-rasterization-whitelist-unlocking-impl-side-painting.patch', '', d)} \
         ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://0002-Disable-API-keys-info-bar.patch', '', d)} \
         file://unistd-2.patch \
-        file://0001-Disable-ANGLE-commit-ID-generation.patch \
         file://google-chrome \
         file://google-chrome.desktop \
 "
-SRC_URI[md5sum] = "327e528a919239f18db581a8a6d1adea"
-SRC_URI[sha256sum] = "6b9ce84df2b6f9d20b209aab16034079cea981b00b8d20660571555f53c815cb"
-
-# Chromium 37 is currently in beta status
-DEFAULT_PREFERENCE = "-1"
-
+SRC_URI[md5sum] = "49bcf221a2e2e5406ae2e69964d01093"
+SRC_URI[sha256sum] = "d27c19580b74cbe143131f0bc097557b3b2fb3d2be966e688d8af51a779ce533"
 
 # conditionally add ozone-wayland and its patches to the Chromium sources
 
@@ -38,7 +33,10 @@ OZONE_WAYLAND_EXTRA_PATCHES = " \
         file://0001-Remove-X-libraries-from-GYP-files.patch \
 "
 
-SRC_URI += "${@base_conditional('ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=ozone-wayland-git;branch=Milestone-Summer;rev=a68f96aa1668de6f2a922a37b48d713d5d809ee0', '', d)}"
+OZONE_WAYLAND_GIT_DESTSUFFIX = "ozone-wayland-git"
+OZONE_WAYLAND_GIT_BRANCH = "Milestone-Summer"
+OZONE_WAYLAND_GIT_SRCREV = "8346e3cecb5c1331a25ba235f29b72f3f049966a"
+SRC_URI += "${@base_conditional('ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
 
 do_unpack[postfuncs] += "${@base_conditional('ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
 do_patch[prefuncs] += "${@base_conditional('ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
@@ -81,6 +79,7 @@ PACKAGECONFIG ??= "use-egl"
 PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
 
 EXTRA_OEGYP =	" \
+	-Dangle_use_commit_id=0 \
 	-Ddisable_fatal_linker_warnings=1 \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
-- 
1.8.3.2


