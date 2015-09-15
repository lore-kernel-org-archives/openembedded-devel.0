Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBFB73D13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:00:23 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AWBQDLEvhV/5tjdVteGQEBAYMHIzFpqgaTVIFSHQqFeQKBQjkTAQEBAQEBAYEKhCQBAQSBCVFXGQmIKQEIyWgBK4ZzihGCLgxBgTEFlVyFEIdzgUxGg22CfpIGIwM9ghIbFoFAPDMBAYooAQEB
X-IPAS-Result: A2AWBQDLEvhV/5tjdVteGQEBAYMHIzFpqgaTVIFSHQqFeQKBQjkTAQEBAQEBAYEKhCQBAQSBCVFXGQmIKQEIyWgBK4ZzihGCLgxBgTEFlVyFEIdzgUxGg22CfpIGIwM9ghIbFoFAPDMBAYooAQEB
X-IronPort-AV: E=Sophos;i="5.17,535,1437429600"; d="scan'208";a="22813610"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 15 Sep 2015 14:50:04 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZbpgR-0000Fk-SE; Tue, 15 Sep 2015 14:50:03 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:50:02 +0200
Message-Id: <1442321402-22469-4-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442321402-22469-1-git-send-email-clopez@igalia.com>
References: <1442321402-22469-1-git-send-email-clopez@igalia.com>
Subject: [meta-browser][PATCH 3/3] chromium: Rework the evaluation of the Wayland feature.
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
X-List-Received-Date: Tue, 15 Sep 2015 13:00:24 -0000

  * Remove the ENABLE_X11 variable and rename ENABLE_WAYLAND to
    CHROMIUM_ENABLE_WAYLAND. Make the old ENABLE_X11 be just
    "not CHROMIUM_ENABLE_WAYLAND".

  * Allow configuring this in the local.conf file.

  * Add a couple of sanity checks and two notes that will
    let the user be sure if the ozone-wayland patches will
    be applied or not. This will be checked before running
    the do_fetch step of Chromium. That way we avoid printing
    any warning or doing any check when parsing the recipe.
    So we only warn or abort when Chromium is actually going
    to be built.

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 45 ++++++++++++++++-------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 195246d..44f8593 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -56,22 +56,41 @@ SRC_URI = "\
 #                        See http://www.chromium.org/developers/design-documents/impl-side-painting for more.
 #                        Off by default.
 
-# conditionally add ozone-wayland and its patches to the Chromium sources
-
-ENABLE_X11 = "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
-# only enable Wayland if X11 isn't already enabled
-ENABLE_WAYLAND = "${@base_contains('DISTRO_FEATURES', 'x11', '0', \
+# Conditionally add ozone-wayland and its patches to the Chromium sources
+# You can override this by setting CHROMIUM_ENABLE_WAYLAND=1 or CHROMIUM_ENABLE_WAYLAND=0 in local.conf
+CHROMIUM_ENABLE_WAYLAND ??= "${@base_contains('DISTRO_FEATURES', 'x11', '0', \
                      base_contains('DISTRO_FEATURES', 'wayland', '1', \
                      '0', d),d)}"
+# Some sanity checks.
+python do_check_variables() {
+    CHROMIUM_BUILD_TYPE = d.getVar('CHROMIUM_BUILD_TYPE', True)
+    CHROMIUM_ENABLE_WAYLAND = d.getVar('CHROMIUM_ENABLE_WAYLAND', True)
+    DISTRO_FEATURES = d.getVar("DISTRO_FEATURES", True).split()
+    if CHROMIUM_BUILD_TYPE not in ['Release', 'Debug']:
+        bb.fatal("Wrong value for CHROMIUM_BUILD_TYPE. Please set it either to \'Release\' or to \'Debug\'")
+    if CHROMIUM_ENABLE_WAYLAND not in ['0', '1']:
+        bb.fatal("Wrong value for CHROMIUM_ENABLE_WAYLAND. Please set it to \'1\' to enable the feature or to \'0\' to disable it")
+    if ( (CHROMIUM_ENABLE_WAYLAND == '1') and ('wayland' not in DISTRO_FEATURES) ):
+        bb.warn("You have selected to build Chromium with Wayland support, but you have not enabled wayland in DISTRO_FEATURES")
+    if ( (CHROMIUM_ENABLE_WAYLAND != '1') and ('x11' not in DISTRO_FEATURES) ):
+        bb.warn("You have selected to build Chromium without Wayland support, but you have not enabled x11 in DISTRO_FEATURES")
+    # Print both on log.do_checkvariables and on the console the configuration that is selected.
+    # This useful both for throubleshooting and for checking how the build is finally configured.
+    if (CHROMIUM_ENABLE_WAYLAND == '1'):
+        bb.plain("INFO: Chromium has been configured with Wayland support (ozone-wayland). Build type is \'%s\'" %CHROMIUM_BUILD_TYPE)
+    else:
+        bb.plain("INFO: Chromium has been configured without Wayland support. Build type is \'%s\'" %CHROMIUM_BUILD_TYPE)
+}
+addtask check_variables before do_fetch
 
 OZONE_WAYLAND_GIT_DESTSUFFIX = "ozone-wayland-git"
 OZONE_WAYLAND_GIT_BRANCH = "Milestone-ThanksGiving"
 OZONE_WAYLAND_GIT_SRCREV = "5d7baa9bc3b8c88e9b7e476e3d6bc8cd44a887fe"
-SRC_URI += "${@base_conditional('ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
+SRC_URI += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)}"
 OZONE_WAYLAND_PATCH_FILE_GLOB = "*.patch"
 
-do_unpack[postfuncs] += "${@base_conditional('ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
-do_patch[prefuncs] += "${@base_conditional('ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
+do_unpack[postfuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
+do_patch[prefuncs] += "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
 SRC_URI += "\
@@ -101,7 +120,7 @@ OZONE_WAYLAND_PATCH_FILE_GLOB = "00*.patch"
 # Component build is broken in ozone-wayland for Chromium 40,
 # and is not planned to work again before version 41
 python() {
-    if (d.getVar('ENABLE_X11', True) != '1') and (d.getVar('ENABLE_WAYLAND', True) == '1'):
+    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
         if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
             bb.fatal("Chromium 40 Wayland version cannot be built in component-mode")
 }
@@ -157,12 +176,12 @@ CHROMIUM_WAYLAND_DEPENDS = "wayland libxkbcommon"
 CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1"
 
 python() {
-    if d.getVar('ENABLE_X11', True) == '1':
-        d.appendVar('DEPENDS', ' %s ' % d.getVar('CHROMIUM_X11_DEPENDS', True))
-        d.appendVar('GYP_DEFINES', ' %s ' % d.getVar('CHROMIUM_X11_GYP_DEFINES', True))
-    if d.getVar('ENABLE_WAYLAND', True) == '1':
+    if d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1':
         d.appendVar('DEPENDS', ' %s ' % d.getVar('CHROMIUM_WAYLAND_DEPENDS', True))
         d.appendVar('GYP_DEFINES', ' %s ' % d.getVar('CHROMIUM_WAYLAND_GYP_DEFINES', True))
+    else:
+        d.appendVar('DEPENDS', ' %s ' % d.getVar('CHROMIUM_X11_DEPENDS', True))
+        d.appendVar('GYP_DEFINES', ' %s ' % d.getVar('CHROMIUM_X11_GYP_DEFINES', True))
 }
 
 do_configure_append() {
-- 
2.1.4


