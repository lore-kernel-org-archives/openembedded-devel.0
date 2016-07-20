Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D26C6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:51:43 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q62so4753730qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h8fTP8Au9mH7qLZiB7C8oC12GuOuT+qYY8OE7SLrC9I=;
	b=bpIAGXTlcD7SZZJe1P0kSTFuYdgBHHuInTzZ1T1f/iUEyfpgiTl5Ho6f+o7B7fFKMj
	vpLSuS2WgXn/bLL7ZbIjWJBt4c2DrQq6gjbTEvyqXDPQRpr6EswUd9Uqny9f3XsKBQY6
	NmnnUBYZ1XxBTuVBU8/wDGNvAQoU+m46ysIkc4loNWliV3NgTUmjrur5VgDd1gntjT15
	j81nkSM25bSbeWGB4yaTXkGOllPpaZUZXx9h/eXybV26CYwst+0aSPgf/YtJWNk/v9L5
	ZCJ6YHnGl2h51PVm0N5SWh8Xcjrvp9dJY8c/rtG9w1vmBIOmM5gwekCWEBYRXBn6ncNf
	E2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h8fTP8Au9mH7qLZiB7C8oC12GuOuT+qYY8OE7SLrC9I=;
	b=gjIVbHUR5V/zyZDax9NMtKGbLLTXe+yQjEA6MFXa1SN4SV/g+mDmUpkUPq/KXojsJQ
	Ulr+TKtbyA3PGgnGXnV4QenDx+G7lgLSyIQF9ZJyzp2RirZwA2Wj6Y++J30mFev322P3
	zwgGRjJm9gJf5gzXosgj5ahWiTIiTo+a4Gzg/6ClXYmfTCLiIVzYLzUXN5UcZ+f4U9TH
	Ehx19Wu2Q5WQ6GLDHCSjIYlhmVn7q8Fyzvyqbxz9NE/rfj9301PvNmxW265qN5v6ojKx
	QnDItjTEC0gWvizc5oUXFlC7qfl2R9hjxFODQVJsf4uBIUPRLe+ns7MYoYlnjc8S0tan
	yzag==
X-Gm-Message-State: ALyK8tL1xd06wDn9PGXxzu8fHPOPxX61qLJL8hzACf9zpeeAKq50TfC36q07YJJeBz/xBw==
X-Received: by 10.55.4.133 with SMTP id 127mr64691110qke.207.1469044303578;
	Wed, 20 Jul 2016 12:51:43 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l1sm2258049qtd.49.2016.07.20.12.51.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 12:51:42 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 15:52:00 -0400
Message-Id: <20160720195201.22250-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160720195201.22250-1-twoerner@gmail.com>
References: <20160720195201.22250-1-twoerner@gmail.com>
Subject: [meta-browser][PATCH 3/4] chromium: split into -wayland and -x11
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
X-List-Received-Date: Wed, 20 Jul 2016 19:51:44 -0000

The wayland dependency on the ozone patches holds back the x11 version. By
splitting the recipe into two separate recipes, each can target separate
versions.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc      |  31 +--
 .../chromium/chromium-wayland_48.0.2548.0.bb       |  33 +++
 .../chromium/chromium-x11_48.0.2548.0.bb           |  19 ++
 ...accelerated-Canvas-support-from-blacklist.patch |   0
 .../0002-Disable-API-keys-info-bar.patch           |   0
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch |   0
 ...y-i18n_process_css_test.html-file-to-avoi.patch |   0
 ...erride-root-filesystem-access-restriction.patch |   0
 .../0006-Remove-GBM-support-from-wayland.gyp.patch |   0
 ...for-glib-related-build-error-with-ozone-w.patch |   0
 .../0011-Replace-readdir_r-with-readdir.patch      |   0
 .../add_missing_stat_h_include.patch               |   0
 .../remove-Werror.patch                            |   0
 ...accelerated-Canvas-support-from-blacklist.patch |  49 +++++
 .../0002-Disable-API-keys-info-bar.patch           |  33 +++
 ...3-Remove-hard-coded-values-for-CC-and-CXX.patch |  43 ++++
 ...y-i18n_process_css_test.html-file-to-avoi.patch |  26 +++
 ...erride-root-filesystem-access-restriction.patch |  30 +++
 .../0011-Replace-readdir_r-with-readdir.patch      | 237 +++++++++++++++++++++
 .../chromium-x11/add_missing_stat_h_include.patch  |  39 ++++
 .../chromium/chromium-x11/remove-Werror.patch      |  73 +++++++
 recipes-browser/chromium/chromium_48.0.2548.0.bb   |  40 ----
 .../{chromium => files}/armv6/include.gypi         |   0
 .../{chromium => files}/armv6/oe-defaults.gypi     |   0
 .../{chromium => files}/armv7a/include.gypi        |   0
 .../{chromium => files}/armv7a/oe-defaults.gypi    |   0
 .../{chromium => files}/component-build.gypi       |   0
 .../chromium/{chromium => files}/google-chrome     |   0
 .../{chromium => files}/google-chrome.desktop      |   0
 .../{chromium => files}/x86-64/include.gypi        |   0
 .../{chromium => files}/x86-64/oe-defaults.gypi    |   0
 .../chromium/{chromium => files}/x86/include.gypi  |   0
 .../{chromium => files}/x86/oe-defaults.gypi       |   0
 33 files changed, 593 insertions(+), 60 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
 create mode 100644 recipes-browser/chromium/chromium-x11_48.0.2548.0.bb
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0001-Remove-accelerated-Canvas-support-from-blacklist.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0002-Disable-API-keys-info-bar.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0003-Remove-hard-coded-values-for-CC-and-CXX.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0005-Override-root-filesystem-access-restriction.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0006-Remove-GBM-support-from-wayland.gyp.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/0011-Replace-readdir_r-with-readdir.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/add_missing_stat_h_include.patch (100%)
 rename recipes-browser/chromium/chromium/{chromium-48 => chromium-wayland}/remove-Werror.patch (100%)
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch
 delete mode 100644 recipes-browser/chromium/chromium_48.0.2548.0.bb
 rename recipes-browser/chromium/{chromium => files}/armv6/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/armv6/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/armv7a/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/armv7a/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/component-build.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/google-chrome (100%)
 rename recipes-browser/chromium/{chromium => files}/google-chrome.desktop (100%)
 rename recipes-browser/chromium/{chromium => files}/x86-64/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/x86-64/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/x86/include.gypi (100%)
 rename recipes-browser/chromium/{chromium => files}/x86/oe-defaults.gypi (100%)

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index c9da1f7..fc7ac04 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -1,19 +1,16 @@
 # Recipe files have to perform the following tasks after including this file:
-# 1) Add patches to SRC_URI. Version specific patches should be contained in a
-#    "chromium-XX" subdirectory, where XX is the major version. There are also
-#    patches that are shared amongst versions but may one day no longer be
-#    needed. These do not belong in such a subdirectory, but still need to be
-#    explicitely be added. Do NOT add ozone-wayland patches to SRC_URI here!
+# 1) Add patches to SRC_URI. Platform-specific patches should be contained in
+#    either "chromium-x11" or "chromium-wayland". There are also patches that
+#    are shared amongst platforms but may one day no longer be needed. These
+#    do not belong in such a subdirectory, but still need to be explicitely be
+#    added. Do NOT add ozone-wayland patches to SRC_URI here!
 # 2) Add md5sum and sha256sum hashes of the tarball.
 # 3) Add ozone-wayland patches to the OZONE_WAYLAND_EXTRA_PATCHES variable.
-#    The rule with the chromium-XX subdirectory also applies here.
 # 4) Set the OZONE_WAYLAND_GIT_BRANCH and OZONE_WAYLAND_GIT_SRCREV values.
 # 5) Optionally, set values for these variables:
 #    * OZONE_WAYLAND_PATCH_FILE_GLOB
 #    * OZONE_WAYLAND_GIT_DESTSUFFIX
-#    * CHROMIUM_X11_DEPENDS
 #    * CHROMIUM_X11_GYP_DEFINES
-#    * CHROMIUM_WAYLAND_DEPENDS
 #    * CHROMIUM_WAYLAND_GYP_DEFINES
 
 include chromium.inc
@@ -22,13 +19,16 @@ DESCRIPTION = "Chromium browser"
 DEPENDS += "libgnome-keyring"
 
 SRC_URI = "\
-        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
+        http://gsdview.appspot.com/chromium-browser-official/chromium-${PV}.tar.xz \
         file://include.gypi \
         file://oe-defaults.gypi \
         file://google-chrome \
         file://google-chrome.desktop \
 "
 
+S = "${WORKDIR}/chromium-${PV}"
+BPN = "chromium"
+
 
 # PACKAGECONFIG options
 # ^^^^^^^^^^^^^^^^^^^^^
@@ -121,9 +121,7 @@ OZONE_WAYLAND_EXTRA_PATCHES ?= ""
 
 # These are present as their own variables, since they have changed between versions
 # a few times in the past already; making them variables makes it easier to handle that
-CHROMIUM_X11_DEPENDS ?= ""
 CHROMIUM_X11_GYP_DEFINES ?= ""
-CHROMIUM_WAYLAND_DEPENDS ?= ""
 CHROMIUM_WAYLAND_GYP_DEFINES ?= ""
 
 
@@ -134,12 +132,6 @@ CHROMIUM_EXTRA_ARGS ?= " \
         ${@bb.utils.contains('PACKAGECONFIG', 'kiosk-mode', '--start-fullscreen --kiosk --no-first-run', '', d)} \
 "
 
-SRC_URI += "\
-        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
-        ${@oe.utils.conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=${OZONE_WAYLAND_GIT_DESTSUFFIX};branch=${OZONE_WAYLAND_GIT_BRANCH};rev=${OZONE_WAYLAND_GIT_SRCREV}', '', d)} \
-"
-
-
 # Some sanity checks.
 python do_check_variables() {
     CHROMIUM_BUILD_TYPE = d.getVar('CHROMIUM_BUILD_TYPE', True)
@@ -158,7 +150,7 @@ python do_check_variables() {
     if (CHROMIUM_ENABLE_WAYLAND == '1'):
         bb.plain("INFO: Chromium has been configured with Wayland support (ozone-wayland). Build type is \'%s\'" %CHROMIUM_BUILD_TYPE)
     else:
-        bb.plain("INFO: Chromium has been configured without Wayland support. Build type is \'%s\'" %CHROMIUM_BUILD_TYPE)
+        bb.plain("INFO: Chromium has been configured for X11. Build type is \'%s\'" %CHROMIUM_BUILD_TYPE)
 }
 addtask check_variables before do_fetch
 
@@ -191,6 +183,7 @@ EXTRA_OEGYP = " \
 	-Dclang=0 \
 	-Dhost_clang=0 \
 	-Ddisable_fatal_linker_warnings=1 \
+	-Dv8_use_external_startup_data=0 \
 	-Dlinux_use_bundled_gold=0 \
 	-Dlinux_use_bundled_binutils=0 \
 	${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-Dlinux_use_gold_flags=1', '-Dlinux_use_gold_flags=0', d)} \
@@ -203,10 +196,8 @@ EXTRA_OEGYP = " \
 
 python() {
     if d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1':
-        d.appendVar('DEPENDS', ' %s ' % d.getVar('CHROMIUM_WAYLAND_DEPENDS', True))
         d.appendVar('GYP_DEFINES', ' %s ' % d.getVar('CHROMIUM_WAYLAND_GYP_DEFINES', True))
     else:
-        d.appendVar('DEPENDS', ' %s ' % d.getVar('CHROMIUM_X11_DEPENDS', True))
         d.appendVar('GYP_DEFINES', ' %s ' % d.getVar('CHROMIUM_X11_GYP_DEFINES', True))
 }
 
diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
new file mode 100644
index 0000000..a5d59a0
--- /dev/null
+++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
@@ -0,0 +1,33 @@
+include chromium-browser.inc
+
+DEPENDS += "wayland libxkbcommon"
+
+SRC_URI += "\
+        file://chromium-wayland/add_missing_stat_h_include.patch \
+        file://chromium-wayland/0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
+        file://chromium-wayland/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
+        file://chromium-wayland/0005-Override-root-filesystem-access-restriction.patch \
+	file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch \
+	file://chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
+        file://chromium-wayland/0011-Replace-readdir_r-with-readdir.patch \
+        file://chromium-wayland/remove-Werror.patch \
+        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-wayland/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-wayland/0002-Disable-API-keys-info-bar.patch', '', d)} \
+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
+SRC_URI[md5sum] = "0534981cc21efcd11e64b67b85854420"
+SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8"
+
+OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
+OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
+
+# Component build is unsupported in ozone-wayland for Chromium 48
+python() {
+    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
+        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
+            bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
+}
+
+CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
diff --git a/recipes-browser/chromium/chromium-x11_48.0.2548.0.bb b/recipes-browser/chromium/chromium-x11_48.0.2548.0.bb
new file mode 100644
index 0000000..c446b7f
--- /dev/null
+++ b/recipes-browser/chromium/chromium-x11_48.0.2548.0.bb
@@ -0,0 +1,19 @@
+include chromium-browser.inc
+
+DEPENDS += "xextproto gtk+ libxi libxss"
+
+SRC_URI += "\
+        file://chromium-x11/add_missing_stat_h_include.patch \
+        file://chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
+        file://chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
+        file://chromium-x11/0005-Override-root-filesystem-access-restriction.patch \
+        file://chromium-x11/0011-Replace-readdir_r-with-readdir.patch \
+        file://chromium-x11/remove-Werror.patch \
+        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-x11/0002-Disable-API-keys-info-bar.patch', '', d)} \
+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
+SRC_URI[md5sum] = "0534981cc21efcd11e64b67b85854420"
+SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8"
diff --git a/recipes-browser/chromium/chromium/chromium-48/0001-Remove-accelerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/chromium/chromium-wayland/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/0002-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-wayland/0002-Disable-API-keys-info-bar.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0002-Disable-API-keys-info-bar.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0002-Disable-API-keys-info-bar.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/chromium-wayland/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch b/recipes-browser/chromium/chromium/chromium-wayland/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/0005-Override-root-filesystem-access-restriction.patch b/recipes-browser/chromium/chromium/chromium-wayland/0005-Override-root-filesystem-access-restriction.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0005-Override-root-filesystem-access-restriction.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0005-Override-root-filesystem-access-restriction.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/0006-Remove-GBM-support-from-wayland.gyp.patch b/recipes-browser/chromium/chromium/chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0006-Remove-GBM-support-from-wayland.gyp.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch b/recipes-browser/chromium/chromium/chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/0011-Replace-readdir_r-with-readdir.patch b/recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/0011-Replace-readdir_r-with-readdir.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/0011-Replace-readdir_r-with-readdir.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/add_missing_stat_h_include.patch b/recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/add_missing_stat_h_include.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/add_missing_stat_h_include.patch
diff --git a/recipes-browser/chromium/chromium/chromium-48/remove-Werror.patch b/recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
similarity index 100%
rename from recipes-browser/chromium/chromium/chromium-48/remove-Werror.patch
rename to recipes-browser/chromium/chromium/chromium-wayland/remove-Werror.patch
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch b/recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
new file mode 100644
index 0000000..2d7bf84
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/0001-Remove-accelerated-Canvas-support-from-blacklist.patch
@@ -0,0 +1,49 @@
+From be6f1d02f3f784594642929dff289dae33014d56 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 3 Apr 2016 17:46:59 +0200
+Subject: [PATCH] Remove accelerated Canvas support from blacklist
+
+Together with the --gpu-no-context-lost command line switch, this patch is
+necessary to enable hardware accelerated 2D canvas rendering when using
+EGL.
+
+Note the implications on the behavior of Canvas, in particular with lost
+contexts, as discussed here:
+
+http://lists.whatwg.org/htdig.cgi/whatwg-whatwg.org/2012-September/206450.html
+
+Upstream-Status: Inappropiate [see link above]
+---
+ gpu/config/software_rendering_list_json.cc | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/gpu/config/software_rendering_list_json.cc b/gpu/config/software_rendering_list_json.cc
+index 484467d..c3b5855 100644
+--- a/gpu/config/software_rendering_list_json.cc
++++ b/gpu/config/software_rendering_list_json.cc
+@@ -240,22 +240,6 @@ const char kSoftwareRenderingListJson[] = LONG_STRING_CONST(
+       ]
+     },
+     {
+-      "id": 24,
+-      "description": "Accelerated 2d canvas is unstable in Linux at the moment",
+-      "os": {
+-        "type": "linux"
+-      },
+-      "exceptions": [
+-        {
+-          "gl_vendor": "Vivante Corporation", 
+-          "gl_renderer": "Vivante GC1000"
+-        }
+-      ],
+-      "features": [
+-        "accelerated_2d_canvas"
+-      ]
+-    },
+-    {
+       "id": 27,
+       "description": "ATI/AMD cards with older drivers in Linux are crash-prone",
+       "cr_bugs": [95934, 94973, 136240, 357314],
+-- 
+2.5.0
+
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch b/recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch
new file mode 100644
index 0000000..56a5b28
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/0002-Disable-API-keys-info-bar.patch
@@ -0,0 +1,33 @@
+From 68773f2faea2608145e820bf23cf5efaf50e3399 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Mon, 9 Jun 2014 15:05:11 +0200
+Subject: [PATCH] Disable API keys info bar
+
+Upstream-Status: Inappropriate [other]
+The info bar is not a bug; it is just undesirable in some use cases.
+A clean approach - which requires discussion with upstream - is to
+disable it by using a command line option.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
+index edea11a..4aef68f 100644
+--- a/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
++++ b/chrome/browser/ui/startup/google_api_keys_infobar_delegate.cc
+@@ -18,8 +18,10 @@ void GoogleApiKeysInfoBarDelegate::Create(InfoBarService* infobar_service) {
+   if (google_apis::HasKeysConfigured())
+     return;
+ 
++#if 0
+   infobar_service->AddInfoBar(infobar_service->CreateConfirmInfoBar(
+       scoped_ptr<ConfirmInfoBarDelegate>(new GoogleApiKeysInfoBarDelegate())));
++#endif
+ }
+ 
+ GoogleApiKeysInfoBarDelegate::GoogleApiKeysInfoBarDelegate()
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch b/recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
new file mode 100644
index 0000000..7bc8d14
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/0003-Remove-hard-coded-values-for-CC-and-CXX.patch
@@ -0,0 +1,43 @@
+From 518135b0cd6878e91e5fcf489f3185740ec307c0 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sun, 12 Oct 2014 19:31:47 +0200
+Subject: [PATCH] Remove hard coded values for CC and CXX
+
+In spite of what the comment says, the environment variables do *not*
+override the variables; "which which arm-linux-gnueabihf-gcc" etc. are
+always called. To undo this, remove the change.
+
+Upstream-Status: Pending
+
+The default values cannot be overriden without the patch; upstream
+might be interested in this.
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ build/common.gypi | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/build/common.gypi b/build/common.gypi
+index 7ec5ae2..11e8d1d 100644
+--- a/build/common.gypi
++++ b/build/common.gypi
+@@ -6047,16 +6047,6 @@
+         ['CXX.host', '<(host_cxx)'],
+       ],
+     }],
+-    ['OS=="linux" and target_arch=="arm" and host_arch!="arm" and chromeos==0 and clang==0', {
+-      # Set default ARM cross tools on linux.  These can be overridden
+-      # using CC,CXX,CC.host and CXX.host environment variables.
+-      'make_global_settings': [
+-        ['CC', '<!(which arm-linux-gnueabihf-gcc)'],
+-        ['CXX', '<!(which arm-linux-gnueabihf-g++)'],
+-        ['CC.host', '<(host_cc)'],
+-        ['CXX.host', '<(host_cxx)'],
+-      ],
+-    }],
+     # TODO(yyanagisawa): supports GENERATOR==make
+     #  make generator doesn't support CC_wrapper without CC
+     #  in make_global_settings yet.
+-- 
+1.9.1
+
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch b/recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
new file mode 100644
index 0000000..24bec71
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch
@@ -0,0 +1,26 @@
+From 5158da97132db1a43c95f4c0ad65b4ac2629c4da Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sat, 23 Apr 2016 14:05:04 +0200
+Subject: [PATCH] Create empty i18n_process_css_test.html file to avoid build
+ failure
+
+According to https://groups.google.com/a/chromium.org/forum/#!topic/chromium-packagers/9JX1N2nf4PU
+creating an empty i18n_process_css_test.html is a valid workaround for the
+following build error:
+
+"Exception: Failed to open test/data/webui/i18n_process_css_test.html while trying to flatten test/data/webui/i18n_process_css_test.html. (No such file or directory)"
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ chrome/test/data/webui/i18n_process_css_test.html | 0
+ 1 file changed, 0 insertions(+), 0 deletions(-)
+ create mode 100644 chrome/test/data/webui/i18n_process_css_test.html
+
+diff --git a/chrome/test/data/webui/i18n_process_css_test.html b/chrome/test/data/webui/i18n_process_css_test.html
+new file mode 100644
+index 0000000..e69de29
+-- 
+2.5.0
+
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch b/recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch
new file mode 100644
index 0000000..ceb6c6c
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/0005-Override-root-filesystem-access-restriction.patch
@@ -0,0 +1,30 @@
+From ef3aaa58be440c1845e60432a498501088da07fe Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Thu, 28 Apr 2016 09:29:59 +0200
+Subject: [PATCH] Override root filesystem access restriction
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ sandbox/linux/suid/client/setuid_sandbox_client.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sandbox/linux/suid/client/setuid_sandbox_client.cc b/sandbox/linux/suid/client/setuid_sandbox_client.cc
+index 12ef7f9..b59908a 100644
+--- a/sandbox/linux/suid/client/setuid_sandbox_client.cc
++++ b/sandbox/linux/suid/client/setuid_sandbox_client.cc
+@@ -21,8 +21,12 @@
+ namespace {
+ 
+ bool IsFileSystemAccessDenied() {
++#if 0
+   base::ScopedFD root_dir(HANDLE_EINTR(open("/", O_RDONLY)));
+   return !root_dir.is_valid();
++#else
++  return true;
++#endif
+ }
+ 
+ int GetHelperApi(base::Environment* env) {
+-- 
+2.5.0
+
diff --git a/recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch b/recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch
new file mode 100644
index 0000000..36c7ec2
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/0011-Replace-readdir_r-with-readdir.patch
@@ -0,0 +1,237 @@
+From feb645ae0259582e2075691047e27b5e064ec160 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Thu, 19 May 2016 21:12:05 +0200
+Subject: [PATCH] Replace readdir_r with readdir
+
+readdir_r is deprecated in newer glibc version. Documented at:
+https://sourceware.org/bugzilla/show_bug.cgi?id=19056
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ base/files/file_enumerator_posix.cc                | 15 ++++++++++---
+ net/disk_cache/simple/simple_index_file_posix.cc   | 10 ++++++---
+ sandbox/linux/services/proc_util.cc                | 24 +++++++++++++--------
+ third_party/boringssl/src/crypto/directory_posix.c | 25 +++-------------------
+ .../crashpad/crashpad/util/posix/close_multiple.cc |  8 +++++--
+ third_party/leveldatabase/env_chromium.cc          | 13 ++++++++---
+ 6 files changed, 53 insertions(+), 42 deletions(-)
+
+diff --git a/base/files/file_enumerator_posix.cc b/base/files/file_enumerator_posix.cc
+index 7533a24..637b8cd 100644
+--- a/base/files/file_enumerator_posix.cc
++++ b/base/files/file_enumerator_posix.cc
+@@ -7,6 +7,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fnmatch.h>
++#include <string.h>
+ 
+ #include "base/logging.h"
+ #include "base/threading/thread_restrictions.h"
+@@ -129,9 +130,17 @@ bool FileEnumerator::ReadDirectory(std::vector<FileInfo>* entries,
+          additional space for pathname may be needed
+ #endif
+ 
+-  struct dirent dent_buf;
+-  struct dirent* dent;
+-  while (readdir_r(dir, &dent_buf, &dent) == 0 && dent) {
++  while (true) {
++    struct dirent* dent;
++    errno = 0;
++    dent = readdir(dir);
++    if (errno != 0) {
++      DPLOG(ERROR) << "Couldn't read directory entry: " << strerror(errno);
++      break;
++    }
++    if (dent == NULL)
++      break;
++
+     FileInfo info;
+     info.filename_ = FilePath(dent->d_name);
+ 
+diff --git a/net/disk_cache/simple/simple_index_file_posix.cc b/net/disk_cache/simple/simple_index_file_posix.cc
+index 586699d..bbe81fc 100644
+--- a/net/disk_cache/simple/simple_index_file_posix.cc
++++ b/net/disk_cache/simple/simple_index_file_posix.cc
+@@ -34,8 +34,12 @@ bool SimpleIndexFile::TraverseCacheDirectory(
+     PLOG(ERROR) << "opendir " << cache_path.value();
+     return false;
+   }
+-  dirent entry, *result;
+-  while (readdir_r(dir.get(), &entry, &result) == 0) {
++  dirent *result;
++  while (true) {
++    errno = 0;
++    result = readdir(dir.get());
++    if (errno != 0)
++      break;
+     if (!result)
+       return true;  // The traversal completed successfully.
+     const std::string file_name(result->d_name);
+@@ -45,7 +49,7 @@ bool SimpleIndexFile::TraverseCacheDirectory(
+         base::FilePath(file_name));
+     entry_file_callback.Run(file_path);
+   }
+-  PLOG(ERROR) << "readdir_r " << cache_path.value();
++  PLOG(ERROR) << "readdir " << cache_path.value();
+   return false;
+ }
+ 
+diff --git a/sandbox/linux/services/proc_util.cc b/sandbox/linux/services/proc_util.cc
+index 8341b4a..1603415 100644
+--- a/sandbox/linux/services/proc_util.cc
++++ b/sandbox/linux/services/proc_util.cc
+@@ -50,15 +50,18 @@ int ProcUtil::CountOpenFds(int proc_fd) {
+   CHECK(dir);
+ 
+   int count = 0;
+-  struct dirent e;
+   struct dirent* de;
+-  while (!readdir_r(dir.get(), &e, &de) && de) {
+-    if (strcmp(e.d_name, ".") == 0 || strcmp(e.d_name, "..") == 0) {
++  while (true) {
++    errno = 0;
++    de = readdir(dir.get());
++    if (de == NULL || errno != 0)
++      break;
++    if (strcmp(de->d_name, ".") == 0 || strcmp(de->d_name, "..") == 0) {
+       continue;
+     }
+ 
+     int fd_num;
+-    CHECK(base::StringToInt(e.d_name, &fd_num));
++    CHECK(base::StringToInt(de->d_name, &fd_num));
+     if (fd_num == proc_fd || fd_num == proc_self_fd) {
+       continue;
+     }
+@@ -80,22 +83,25 @@ bool ProcUtil::HasOpenDirectory(int proc_fd) {
+   ScopedDIR dir(fdopendir(proc_self_fd));
+   CHECK(dir);
+ 
+-  struct dirent e;
+   struct dirent* de;
+-  while (!readdir_r(dir.get(), &e, &de) && de) {
+-    if (strcmp(e.d_name, ".") == 0 || strcmp(e.d_name, "..") == 0) {
++  while (true) {
++    errno = 0;
++    de = readdir(dir.get());
++    if (de == NULL || errno != 0)
++      break;
++    if (strcmp(de->d_name, ".") == 0 || strcmp(de->d_name, "..") == 0) {
+       continue;
+     }
+ 
+     int fd_num;
+-    CHECK(base::StringToInt(e.d_name, &fd_num));
++    CHECK(base::StringToInt(de->d_name, &fd_num));
+     if (fd_num == proc_fd || fd_num == proc_self_fd) {
+       continue;
+     }
+ 
+     struct stat s;
+     // It's OK to use proc_self_fd here, fstatat won't modify it.
+-    CHECK(fstatat(proc_self_fd, e.d_name, &s, 0) == 0);
++    CHECK(fstatat(proc_self_fd, de->d_name, &s, 0) == 0);
+     if (S_ISDIR(s.st_mode)) {
+       return true;
+     }
+diff --git a/third_party/boringssl/src/crypto/directory_posix.c b/third_party/boringssl/src/crypto/directory_posix.c
+index b944b69..17143a7 100644
+--- a/third_party/boringssl/src/crypto/directory_posix.c
++++ b/third_party/boringssl/src/crypto/directory_posix.c
+@@ -24,10 +24,6 @@
+  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. */
+ 
+-#if !defined(_POSIX_C_SOURCE)
+-#define _POSIX_C_SOURCE 201409  /* for readdir_r */
+-#endif
+-
+ #include "directory.h"
+ 
+ 
+@@ -38,21 +34,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-#if defined(OPENSSL_PNACL)
+-/* pnacl doesn't include readdir_r! So we do the best we can. */
+-int readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result) {
+-  errno = 0;
+-  *result = readdir(dirp);
+-  if (*result != NULL) {
+-    return 0;
+-  }
+-  if (errno) {
+-    return 1;
+-  }
+-  return 0;
+-}
+-#endif
+-
+ struct OPENSSL_dir_context_st {
+   DIR *dir;
+   struct dirent dirent;
+@@ -85,10 +66,10 @@ const char *OPENSSL_DIR_read(OPENSSL_DIR_CTX **ctx, const char *directory) {
+     }
+   }
+ 
+-  if (readdir_r((*ctx)->dir, &(*ctx)->dirent, &dirent) != 0 ||
+-      dirent == NULL) {
++  errno = 0;
++  dirent = readdir((*ctx)->dir);
++  if (dirent == NULL || errno != 0)
+     return 0;
+-  }
+ 
+   return (*ctx)->dirent.d_name;
+ }
+diff --git a/third_party/crashpad/crashpad/util/posix/close_multiple.cc b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
+index d94d575..4c1287a 100644
+--- a/third_party/crashpad/crashpad/util/posix/close_multiple.cc
++++ b/third_party/crashpad/crashpad/util/posix/close_multiple.cc
+@@ -100,10 +100,14 @@ bool CloseMultipleNowOrOnExecUsingFDDir(int fd, int preserve_fd) {
+     return false;
+   }
+ 
+-  dirent entry;
+   dirent* result;
+   int rv;
+-  while ((rv = readdir_r(dir, &entry, &result)) == 0 && result != nullptr) {
++  while (true) {
++    errno = 0;
++    result = readdir(dir);
++    if (errno != 0 || result == nullptr)
++      break;
++
+     const char* entry_name = &(*result->d_name);
+     if (strcmp(entry_name, ".") == 0 || strcmp(entry_name, "..") == 0) {
+       continue;
+diff --git a/third_party/leveldatabase/env_chromium.cc b/third_party/leveldatabase/env_chromium.cc
+index 939534c..f23142e 100644
+--- a/third_party/leveldatabase/env_chromium.cc
++++ b/third_party/leveldatabase/env_chromium.cc
+@@ -79,10 +79,17 @@ static base::File::Error GetDirectoryEntries(const FilePath& dir_param,
+   DIR* dir = opendir(dir_string.c_str());
+   if (!dir)
+     return base::File::OSErrorToFileError(errno);
+-  struct dirent dent_buf;
+   struct dirent* dent;
+-  int readdir_result;
+-  while ((readdir_result = readdir_r(dir, &dent_buf, &dent)) == 0 && dent) {
++  int readdir_result = 0;
++  while (true) {
++    errno = 0;
++    dent = readdir(dir);
++    if (errno != 0) {
++      readdir_result = 1;
++      break;
++    }
++    if (dent == NULL)
++      break;
+     if (strcmp(dent->d_name, ".") == 0 || strcmp(dent->d_name, "..") == 0)
+       continue;
+     result->push_back(FilePath::FromUTF8Unsafe(dent->d_name));
+-- 
+2.7.4
+
diff --git a/recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch b/recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch
new file mode 100644
index 0000000..4620db2
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/add_missing_stat_h_include.patch
@@ -0,0 +1,39 @@
+sys/stat.h used to be indirectly included through
+device/udev_linux/scoped_udev.h -> libudev.h -> sys/stat.h
+but libudev.h in jethro no longer includes sys/stat.h resulting in the
+following compile time errors:
+
+arm-angstrom-linux-gnueabi-g++ ...  ../../components/storage_monitor/storage_monitor_linux.cc -o obj/components/storage_monitor/storage_monitor.storage_monitor_linux.o
+../../components/storage_monitor/storage_monitor_linux.cc: In function 'scoped_ptr<storage_monitor::StorageInfo> storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)':
+../../components/storage_monitor/storage_monitor_linux.cc:132:15: error: aggregate 'storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat device_stat' has incomplete type and cannot be defined
+   struct stat device_stat;
+               ^
+../../components/storage_monitor/storage_monitor_linux.cc:133:53: error: invalid use of incomplete type 'struct storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat'
+   if (stat(device_path.value().c_str(), &device_stat) < 0)
+                                                     ^
+../../components/storage_monitor/storage_monitor_linux.cc:132:10: error: forward declaration of 'struct storage_monitor::{anonymous}::GetDeviceInfo(const base::FilePath&, const base::FilePath&)::stat'
+   struct stat device_stat;
+          ^
+../../components/storage_monitor/storage_monitor_linux.cc:137:34: error: 'S_ISCHR' was not declared in this scope
+   if (S_ISCHR(device_stat.st_mode))
+                                  ^
+../../components/storage_monitor/storage_monitor_linux.cc:139:39: error: 'S_ISBLK' was not declared in this scope
+   else if (S_ISBLK(device_stat.st_mode))
+                                       ^
+
+As the code makes use of stat systemcalls include the file explicitely.
+Tested with ARCH armv7.
+
+Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
+Upstream-Status: Pending
+
+--- a/components/storage_monitor/storage_monitor_linux.cc~	2015-01-21 21:28:16.000000000 +0100
++++ b/components/storage_monitor/storage_monitor_linux.cc	2015-10-27 13:21:08.405655894 +0100
+@@ -8,6 +8,7 @@
+ 
+ #include <mntent.h>
+ #include <stdio.h>
++#include <sys/stat.h>
+ 
+ #include <list>
+ 
diff --git a/recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch b/recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch
new file mode 100644
index 0000000..2d1842b
--- /dev/null
+++ b/recipes-browser/chromium/chromium/chromium-x11/remove-Werror.patch
@@ -0,0 +1,73 @@
+Index: chromium-48.0.2548.0/build/common.gypi
+===================================================================
+--- chromium-48.0.2548.0.orig/build/common.gypi
++++ chromium-48.0.2548.0/build/common.gypi
+@@ -1421,7 +1421,7 @@
+ 
+     # Disable fatal linker warnings, similarly to how we make it possible
+     # to disable -Werror (e.g. for different toolchain versions).
+-    'disable_fatal_linker_warnings%': 0,
++    'disable_fatal_linker_warnings%': 1,
+ 
+     'release_valgrind_build%': 0,
+ 
+@@ -3135,12 +3135,6 @@
+               '-Wsign-compare',
+             ]
+           }],
+-          # TODO: Fix all warnings on chromeos too.
+-          [ 'os_posix==1 and OS!="mac" and OS!="ios" and (clang!=1 or chromeos==1)', {
+-            'cflags!': [
+-              '-Werror',
+-            ],
+-          }],
+           [ 'os_posix==1 and os_bsd!=1 and OS!="mac" and OS!="android"', {
+             'cflags': [
+               # Don't warn about ignoring the return value from e.g. close().
+@@ -3692,10 +3686,10 @@
+     }],
+     ['os_posix==1 and OS!="mac" and OS!="ios"', {
+       'target_defaults': {
+-        # Enable -Werror by default, but put it in a variable so it can
++        # Disable -Werror by default, but put it in a variable so it can
+         # be disabled in ~/.gyp/include.gypi on the valgrind builders.
+         'variables': {
+-          'werror%': '-Werror',
++          'werror%': '',
+           'libraries_for_target%': '',
+         },
+         'defines': [
+@@ -5045,7 +5039,7 @@
+           'GCC_OBJC_CALL_CXX_CDTORS': 'YES',        # -fobjc-call-cxx-cdtors
+           'GCC_SYMBOLS_PRIVATE_EXTERN': 'YES',      # -fvisibility=hidden
+           'GCC_THREADSAFE_STATICS': 'NO',           # -fno-threadsafe-statics
+-          'GCC_TREAT_WARNINGS_AS_ERRORS': 'YES',    # -Werror
++          'GCC_TREAT_WARNINGS_AS_ERRORS': 'NO',     # -Werror
+           'GCC_VERSION': '4.2',
+           'GCC_WARN_ABOUT_MISSING_NEWLINE': 'YES',  # -Wnewline-eof
+           'USE_HEADERMAP': 'NO',
+Index: chromium-48.0.2548.0/build/config/compiler/BUILD.gn
+===================================================================
+--- chromium-48.0.2548.0.orig/build/config/compiler/BUILD.gn
++++ chromium-48.0.2548.0/build/config/compiler/BUILD.gn
+@@ -687,7 +687,6 @@ config("default_warnings") {
+     cflags += [
+       # Enables.
+       "-Wendif-labels",  # Weird old-style text after an #endif.
+-      "-Werror",  # Warnings as errors.
+ 
+       # Disables.
+       "-Wno-missing-field-initializers",  # "struct foo f = {0};"
+Index: chromium-48.0.2548.0/build/nocompile.gypi
+===================================================================
+--- chromium-48.0.2548.0.orig/build/nocompile.gypi
++++ chromium-48.0.2548.0/build/nocompile.gypi
+@@ -81,7 +81,7 @@
+             '<(nocompile_driver)',
+             '4', # number of compilers to invoke in parallel.
+             '<(RULE_INPUT_PATH)',
+-            '-Wall -Werror -Wfatal-errors -I<(DEPTH)',
++            '-Wall -I<(DEPTH)',
+             '<(nc_result_path)',
+             ],
+           'message': 'Generating no compile results for <(RULE_INPUT_PATH)',
diff --git a/recipes-browser/chromium/chromium_48.0.2548.0.bb b/recipes-browser/chromium/chromium_48.0.2548.0.bb
deleted file mode 100644
index 70afa6c..0000000
--- a/recipes-browser/chromium/chromium_48.0.2548.0.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-include chromium-browser.inc
-
-SRC_URI += "\
-        file://chromium-48/add_missing_stat_h_include.patch \
-        file://chromium-48/0003-Remove-hard-coded-values-for-CC-and-CXX.patch \
-        file://chromium-48/0004-Create-empty-i18n_process_css_test.html-file-to-avoi.patch \
-        file://chromium-48/0005-Override-root-filesystem-access-restriction.patch \
-        file://chromium-48/0011-Replace-readdir_r-with-readdir.patch \
-        file://chromium-48/remove-Werror.patch \
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://chromium-48/0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://chromium-48/0002-Disable-API-keys-info-bar.patch', '', d)} \
-"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
-SRC_URI[md5sum] = "0534981cc21efcd11e64b67b85854420"
-SRC_URI[sha256sum] = "4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8"
-
-EXTRA_OEGYP += " \
-	-Dv8_use_external_startup_data=0 \
-"
-
-OZONE_WAYLAND_GIT_BRANCH = "Milestone-SouthSister"
-OZONE_WAYLAND_GIT_SRCREV = "c605505044af3345a276abbd7c29fd53db1dea40"
-
-OZONE_WAYLAND_EXTRA_PATCHES = " \
-	file://chromium-48/0006-Remove-GBM-support-from-wayland.gyp.patch \
-	file://chromium-48/0007-Workaround-for-glib-related-build-error-with-ozone-w.patch \
-"
-
-# Component build is unsupported in ozone-wayland for Chromium 48
-python() {
-    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
-        if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
-            bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
-}
-
-CHROMIUM_X11_DEPENDS = "xextproto gtk+ libxi libxss"
-CHROMIUM_X11_GYP_DEFINES = ""
-CHROMIUM_WAYLAND_DEPENDS = "wayland libxkbcommon"
-CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
diff --git a/recipes-browser/chromium/chromium/armv6/include.gypi b/recipes-browser/chromium/files/armv6/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/armv6/include.gypi
rename to recipes-browser/chromium/files/armv6/include.gypi
diff --git a/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi b/recipes-browser/chromium/files/armv6/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
rename to recipes-browser/chromium/files/armv6/oe-defaults.gypi
diff --git a/recipes-browser/chromium/chromium/armv7a/include.gypi b/recipes-browser/chromium/files/armv7a/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/armv7a/include.gypi
rename to recipes-browser/chromium/files/armv7a/include.gypi
diff --git a/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi b/recipes-browser/chromium/files/armv7a/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
rename to recipes-browser/chromium/files/armv7a/oe-defaults.gypi
diff --git a/recipes-browser/chromium/chromium/component-build.gypi b/recipes-browser/chromium/files/component-build.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/component-build.gypi
rename to recipes-browser/chromium/files/component-build.gypi
diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/files/google-chrome
similarity index 100%
rename from recipes-browser/chromium/chromium/google-chrome
rename to recipes-browser/chromium/files/google-chrome
diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b/recipes-browser/chromium/files/google-chrome.desktop
similarity index 100%
rename from recipes-browser/chromium/chromium/google-chrome.desktop
rename to recipes-browser/chromium/files/google-chrome.desktop
diff --git a/recipes-browser/chromium/chromium/x86-64/include.gypi b/recipes-browser/chromium/files/x86-64/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/x86-64/include.gypi
rename to recipes-browser/chromium/files/x86-64/include.gypi
diff --git a/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi b/recipes-browser/chromium/files/x86-64/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
rename to recipes-browser/chromium/files/x86-64/oe-defaults.gypi
diff --git a/recipes-browser/chromium/chromium/x86/include.gypi b/recipes-browser/chromium/files/x86/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/x86/include.gypi
rename to recipes-browser/chromium/files/x86/include.gypi
diff --git a/recipes-browser/chromium/chromium/x86/oe-defaults.gypi b/recipes-browser/chromium/files/x86/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium/x86/oe-defaults.gypi
rename to recipes-browser/chromium/files/x86/oe-defaults.gypi
-- 
2.9.0


