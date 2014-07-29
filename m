Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 357717091E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id D818C3314B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 12:22:14 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jul 2014 12:22:07 +0200
Message-Id: <1406629327-29169-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-browser][PATCH 2/2] chromium: Add recipe for version 37.0.2062.0
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
X-List-Received-Date: Tue, 29 Jul 2014 10:22:18 -0000

This version includes Wayland support by adding ozone-wayland

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../0001-Disable-ANGLE-commit-ID-generation.patch  |  71 +++++++++
 .../0001-Remove-X-libraries-from-GYP-files.patch   |  79 ++++++++++
 recipes-browser/chromium/chromium_37.0.2062.0.bb   | 165 +++++++++++++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch
 create mode 100644 recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch
 create mode 100644 recipes-browser/chromium/chromium_37.0.2062.0.bb

diff --git a/recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch b/recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch
new file mode 100644
index 0000000..72b978c
--- /dev/null
+++ b/recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch
@@ -0,0 +1,71 @@
+From 6ee39ace731dabdbe5e169ac5bc52b713afb1275 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Tue, 29 Jul 2014 12:08:25 +0200
+Subject: [PATCH] Disable ANGLE commit ID generation
+
+As part of the build process, ANGLE generates an ID out of the SRCREV
+of the git repo's HEAD. Since these recipes do not use a git repository,
+but a tarball release of Chromium, there is no HEAD, and building ANGLE
+fails.
+
+This patch replaces the git-based commit ID generation with a dummy ID.
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ third_party/angle/src/angle.gypi   |  2 +-
+ third_party/angle/src/commit_id.py | 22 +++++++++++++---------
+ 2 files changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/third_party/angle/src/angle.gypi b/third_party/angle/src/angle.gypi
+index 5339369..c7ef8c1 100644
+--- a/third_party/angle/src/angle.gypi
++++ b/third_party/angle/src/angle.gypi
+@@ -56,7 +56,7 @@
+                         {
+                             'action_name': 'Generate Commit ID Header',
+                             'message': 'Generating commit ID header...',
+-                            'inputs': [ '<(SHARED_INTERMEDIATE_DIR)/commit_id.py', '<(angle_path)/.git/index' ],
++                            'inputs': [ '<(SHARED_INTERMEDIATE_DIR)/commit_id.py' ],
+                             'outputs': [ '<(SHARED_INTERMEDIATE_DIR)/commit.h' ],
+                             'action': [ 'python', '<(SHARED_INTERMEDIATE_DIR)/commit_id.py', '<(SHARED_INTERMEDIATE_DIR)/commit.h' ],
+                         },
+diff --git a/third_party/angle/src/commit_id.py b/third_party/angle/src/commit_id.py
+index 6339cca..1a3c0a3 100644
+--- a/third_party/angle/src/commit_id.py
++++ b/third_party/angle/src/commit_id.py
+@@ -1,17 +1,21 @@
+ import subprocess as sp
+ import sys
+ 
+-def grab_output(*command):
+-    return sp.Popen(command, stdout=sp.PIPE).communicate()[0].strip()
++#def grab_output(*command):
++#    return sp.Popen(command, stdout=sp.PIPE).communicate()[0].strip()
++#
++#commit_id_size = 12
++#
++#try:
++#    commit_id = grab_output('git', 'rev-parse', '--short=%d' % commit_id_size, 'HEAD')
++#    commit_date = grab_output('git', 'show', '-s', '--format=%ci', 'HEAD')
++#except:
++#    commit_id = 'invalid-hash'
++#    commit_date = 'invalid-date'
+ 
++commit_id = "0123456789ab"
+ commit_id_size = 12
+-
+-try:
+-    commit_id = grab_output('git', 'rev-parse', '--short=%d' % commit_id_size, 'HEAD')
+-    commit_date = grab_output('git', 'show', '-s', '--format=%ci', 'HEAD')
+-except:
+-    commit_id = 'invalid-hash'
+-    commit_date = 'invalid-date'
++commit_date = "2014-06-11 17:45:12 +0200"
+ 
+ hfile = open(sys.argv[1], 'w')
+ 
+-- 
+1.8.3.2
+
diff --git a/recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch b/recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch
new file mode 100644
index 0000000..44f9710
--- /dev/null
+++ b/recipes-browser/chromium/chromium/0001-Remove-X-libraries-from-GYP-files.patch
@@ -0,0 +1,79 @@
+From 32642c65e31c26673cc4687eefacdf0087cf4498 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Mon, 28 Jul 2014 00:10:03 +0200
+Subject: [PATCH] Remove X libraries from GYP files
+
+Some X libraries are linked even when ozone-wayland is used, causing
+linker errors if no X libraries are around
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ third_party/libjingle/source/talk/libjingle.gyp                 | 4 ----
+ third_party/libjingle/source/talk/libjingle_examples.gyp        | 4 ----
+ third_party/webrtc/base/base.gyp                                | 4 ----
+ third_party/webrtc/modules/desktop_capture/desktop_capture.gypi | 2 +-
+ 4 files changed, 1 insertion(+), 13 deletions(-)
+
+diff --git a/third_party/libjingle/source/talk/libjingle.gyp b/third_party/libjingle/source/talk/libjingle.gyp
+index 2182561..86c243b 100755
+--- a/third_party/libjingle/source/talk/libjingle.gyp
++++ b/third_party/libjingle/source/talk/libjingle.gyp
+@@ -633,10 +633,6 @@
+               '-lcrypto',
+               '-ldl',
+               '-lrt',
+-              '-lXext',
+-              '-lX11',
+-              '-lXcomposite',
+-              '-lXrender',
+               '<!@(<(pkg-config) --libs-only-l nss | sed -e "s/-lssl3//")',
+             ],
+           },
+diff --git a/third_party/libjingle/source/talk/libjingle_examples.gyp b/third_party/libjingle/source/talk/libjingle_examples.gyp
+index f69c5dc..e1ff366 100755
+--- a/third_party/libjingle/source/talk/libjingle_examples.gyp
++++ b/third_party/libjingle/source/talk/libjingle_examples.gyp
+@@ -206,10 +206,6 @@
+                 'libraries': [
+                   '<!@(pkg-config --libs-only-l glib-2.0 gobject-2.0'
+                       ' gthread-2.0 gtk+-2.0)',
+-                  '-lX11',
+-                  '-lXcomposite',
+-                  '-lXext',
+-                  '-lXrender',
+                 ],
+               },
+             }],  # OS=="linux"
+diff --git a/third_party/webrtc/base/base.gyp b/third_party/webrtc/base/base.gyp
+index 330ea82..fa524cc 100644
+--- a/third_party/webrtc/base/base.gyp
++++ b/third_party/webrtc/base/base.gyp
+@@ -573,10 +573,6 @@
+               '-lcrypto',
+               '-ldl',
+               '-lrt',
+-              '-lXext',
+-              '-lX11',
+-              '-lXcomposite',
+-              '-lXrender',
+               '<!@(<(pkg-config) --libs-only-l nss | sed -e "s/-lssl3//")',
+             ],
+           },
+diff --git a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
+index 6f4a083..79efef8 100644
+--- a/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
++++ b/third_party/webrtc/modules/desktop_capture/desktop_capture.gypi
+@@ -95,7 +95,7 @@
+             'desktop_capture_differ_sse2',
+           ],
+         }],
+-        ['use_x11 == 1', {
++        ['use_x11 == 1 and <(ozone_platform_wayland) != 1', {
+           'link_settings': {
+             'libraries': [
+               '-lX11',
+-- 
+1.8.3.2
+
diff --git a/recipes-browser/chromium/chromium_37.0.2062.0.bb b/recipes-browser/chromium/chromium_37.0.2062.0.bb
new file mode 100644
index 0000000..2cf6d2a
--- /dev/null
+++ b/recipes-browser/chromium/chromium_37.0.2062.0.bb
@@ -0,0 +1,165 @@
+DESCRIPTION = "Chromium browser"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
+DEPENDS = "xz-native pciutils pulseaudio cairo nss zlib-native libav libgnome-keyring cups ninja-native gconf libexif pango libdrm"
+SRC_URI = "\
+        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
+        file://include.gypi \
+        file://oe-defaults.gypi \
+        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://remove-linux-accel-canvas-from-blacklist.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', 'file://disable-rasterization-whitelist-unlocking-impl-side-painting.patch', '', d)} \
+        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://0002-Disable-API-keys-info-bar.patch', '', d)} \
+        file://unistd-2.patch \
+        file://0001-Disable-ANGLE-commit-ID-generation.patch \
+        file://google-chrome \
+        file://google-chrome.desktop \
+"
+SRC_URI[md5sum] = "327e528a919239f18db581a8a6d1adea"
+SRC_URI[sha256sum] = "6b9ce84df2b6f9d20b209aab16034079cea981b00b8d20660571555f53c815cb"
+
+# Chromium 37 is currently in beta status
+DEFAULT_PREFERENCE = "-1"
+
+
+# conditionally add ozone-wayland and its patches to the Chromium sources
+
+ENABLE_X11 = "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
+# only enable Wayland if X11 isn't already enabled
+ENABLE_WAYLAND = "${@base_contains('DISTRO_FEATURES', 'x11', '0', \
+                     base_contains('DISTRO_FEATURES', 'wayland', '1', \
+                     '0', d),d)}"
+
+# variable for extra ozone-wayland patches, typically extended by BSP layer .bbappends
+# IMPORTANT: do not simply add extra ozone-wayland patches to the SRC_URI in a
+# .bbappend, since the base ozone-wayland patches need to be applied first (see below)
+
+OZONE_WAYLAND_EXTRA_PATCHES = " \
+        file://0001-Remove-X-libraries-from-GYP-files.patch \
+"
+
+SRC_URI += "${@base_conditional('ENABLE_WAYLAND', '1', 'git://github.com/01org/ozone-wayland.git;destsuffix=ozone-wayland-git;branch=Milestone-Summer;rev=a68f96aa1668de6f2a922a37b48d713d5d809ee0', '', d)}"
+
+do_unpack[postfuncs] += "${@base_conditional('ENABLE_WAYLAND', '1', 'copy_ozone_wayland_files', '', d)}"
+do_patch[prefuncs] += "${@base_conditional('ENABLE_WAYLAND', '1', 'add_ozone_wayland_patches', '', d)}"
+
+copy_ozone_wayland_files() {
+	# ozone-wayland sources must be placed in an "ozone"
+	# subdirectory in ${S} in order for the .gyp build
+	# scripts to work
+	cp -r ${WORKDIR}/ozone-wayland-git ${S}/ozone
+}
+
+python add_ozone_wayland_patches() {
+    import glob
+    srcdir = d.getVar('S', True)
+    # find all ozone-wayland patches and add them to SRC_URI
+    upstream_patches_dir = srcdir + "/ozone/patches"
+    upstream_patches = glob.glob(upstream_patches_dir + "/*.patch")
+    upstream_patches.sort()
+    for upstream_patch in upstream_patches:
+        d.appendVar('SRC_URI', ' file://' + upstream_patch)
+    # then, add the extra patches to SRC_URI order matters;
+    # extra patches may depend on the base ozone-wayland ones
+    d.appendVar('SRC_URI', ' ' + d.getVar('OZONE_WAYLAND_EXTRA_PATCHES'))
+}
+
+
+# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
+inherit gettext
+
+PACKAGECONFIG ??= "use-egl"
+
+# this makes sure the dependencies for the EGL mode are present; otherwise, the configure scripts
+# automatically and silently fall back to GLX
+PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
+
+EXTRA_OEGYP =	" \
+	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0', d)} \
+	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_flags=0', d)} \
+	-I ${WORKDIR}/oe-defaults.gypi \
+	-I ${WORKDIR}/include.gypi \
+	${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I ${WORKDIR}/component-build.gypi', '', d)} \
+	-f ninja \
+"
+ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
+
+CHROMIUM_EXTRA_ARGS ?= " \
+	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '--gpu-no-context-lost', '', d)} \
+	${@bb.utils.contains('PACKAGECONFIG', 'impl-side-painting', '--enable-gpu-rasterization --enable-impl-side-painting', '', d)} \
+"
+
+GYP_DEFINES = "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
+
+python() {
+    if d.getVar('ENABLE_X11', True) == '1':
+        d.appendVar('DEPENDS', ' xextproto gtk+ libxi libxss ')
+    if d.getVar('ENABLE_WAYLAND', True) == '1':
+        d.appendVar('DEPENDS', ' wayland libxkbcommon ')
+        d.appendVar('GYP_DEFINES', ' use_ash=1 use_aura=1 chromeos=0 use_ozone=1 ')
+}
+
+do_configure() {
+	cd ${S}
+	GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
+	# replace LD with CXX, to workaround a possible gyp issue?
+	LD="${CXX}" export LD
+	CC="${CC}" export CC
+	CXX="${CXX}" export CXX
+	CC_host="gcc" export CC_host
+	CXX_host="g++" export CXX_host
+	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
+}
+
+do_compile() {
+	# build with ninja
+	ninja -C ${S}/out/Release chrome chrome_sandbox
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
+
+	# Add extra command line arguments to google-chrome script by modifying
+	# the dummy "CHROME_EXTRA_ARGS" line
+	sed -i "s/^CHROME_EXTRA_ARGS=\"\"/CHROME_EXTRA_ARGS=\"${CHROMIUM_EXTRA_ARGS}\"/" ${D}${bindir}/google-chrome
+
+	install -d ${D}${datadir}/applications
+	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
+
+	install -d ${D}${bindir}/chrome/
+	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
+	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/icudtl.dat ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
+	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
+
+	# Always adding this libdir (not just with component builds), because the
+	# LD_LIBRARY_PATH line in the google-chromium script refers to it
+	install -d ${D}${libdir}/chrome/
+	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'component-build', '', d)}" ]; then
+		install -m 0755 ${S}/out/Release/lib/*.so ${D}${libdir}/chrome/
+	fi
+
+	install -d ${D}${sbindir}
+	install -m 4755 ${S}/out/Release/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
+
+	install -d ${D}${bindir}/chrome/locales/
+	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
+}
+
+FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/ ${libdir}/chrome/"
+FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/chrome/.debug/"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
-- 
1.8.3.2


