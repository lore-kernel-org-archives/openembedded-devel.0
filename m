Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 73EA465CFD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 06:40:00 +0000 (UTC)
Received: from localhost.localdomain (chello080108088242.14.11.vie.surfer.at
	[80.108.88.242]) by ptmx.org (Postfix) with ESMTPSA id 96E4529672
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:40:01 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Apr 2014 08:39:50 +0200
Message-Id: <1398753593-4447-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
References: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH v2 1/4] chromium: Add component-build PACKAGECONFIG option
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
X-List-Received-Date: Tue, 29 Apr 2014 06:40:04 -0000

In a component build, the individual Chromium components are contained in
separate shared objects. This is useful when building on a system with
8 GB RAM or less (since the linker needs at least that much for link
time optimization otherwise if a non-component build is done), and during
development and testing of Chromium internals.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 recipes-browser/chromium/chromium/component-build.gypi |  5 +++++
 recipes-browser/chromium/chromium/google-chrome        |  2 ++
 recipes-browser/chromium/chromium_35.0.1883.0.bb       | 11 +++++++++--
 3 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 recipes-browser/chromium/chromium/component-build.gypi

diff --git a/recipes-browser/chromium/chromium/component-build.gypi b/recipes-browser/chromium/chromium/component-build.gypi
new file mode 100644
index 0000000..e58b4ca
--- /dev/null
+++ b/recipes-browser/chromium/chromium/component-build.gypi
@@ -0,0 +1,5 @@
+{
+  'variables': {
+     'component' : 'shared_library'
+  },
+}
diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
index 2f6ad2e..8ce400b 100644
--- a/recipes-browser/chromium/chromium/google-chrome
+++ b/recipes-browser/chromium/chromium/google-chrome
@@ -1,6 +1,8 @@
 #!/bin/sh
 
 export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
+export LD_LIBRARY_PATH=/usr/lib/chrome
+
 if [ "${USER}" = "root" ] ; then 
 	/usr/bin/chrome/chrome --user-data-dir=${HOME}/.chromium/ $@
 else
diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
index 2497f10..203474d 100644
--- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -6,6 +6,7 @@ SRC_URI = "\
         http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
         file://include.gypi \
         file://oe-defaults.gypi \
+        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
         file://unistd-2.patch \
         file://google-chrome \
         file://google-chrome.desktop \
@@ -27,6 +28,7 @@ EXTRA_OEGYP =	" \
 	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
 	-I ${WORKDIR}/oe-defaults.gypi \
 	-I ${WORKDIR}/include.gypi \
+	${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I ${WORKDIR}/component-build.gypi', '', d)} \
 	-f ninja \
 "
 ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
@@ -65,6 +67,11 @@ do_install() {
 	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
 	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
 
+	install -d ${D}${libdir}/chrome/
+	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'component-build', '', d)}" ]; then
+		install -m 0755 ${S}/out/Release/lib/*.so ${D}${libdir}/chrome/
+	fi
+
 	install -d ${D}${sbindir}
 	install -m 4755 ${S}/out/Release/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
 
@@ -72,8 +79,8 @@ do_install() {
 	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
 }
 
-FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/"
-FILES_${PN}-dbg += "${bindir}/chrome/.debug/"
+FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/ ${libdir}/chrome/"
+FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/chrome/.debug/"
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
-- 
1.8.3.2


