Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id CB874713C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 16:41:56 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 8978728291
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 18:41:56 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Sep 2014 18:41:07 +0200
Message-Id: <1409935267-13537-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH] chromium: Remove Chromium 35 recipe and obsolete patches
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
X-List-Received-Date: Fri, 05 Sep 2014 16:42:06 -0000

These patches are no longer used or needed anywhere. Chromium 35 is now
obsolete, since Chromium 37.0.2062.94 is the new stable version.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../0001-Disable-ANGLE-commit-ID-generation.patch  |  71 -------------
 ...tracker_notify_deprecated_since_ATK_2_9_4.patch |  17 ----
 .../chromium/fix-glib-deprecated-warning.patch     |  32 ------
 .../chromium/chromium/secitem_array.patch          |  26 -----
 .../chromium/chromium/uninitialised-warning.patch  |  90 -----------------
 recipes-browser/chromium/chromium_35.0.1916.114.bb | 112 ---------------------
 6 files changed, 348 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch
 delete mode 100644 recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
 delete mode 100644 recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch
 delete mode 100644 recipes-browser/chromium/chromium/secitem_array.patch
 delete mode 100644 recipes-browser/chromium/chromium/uninitialised-warning.patch
 delete mode 100644 recipes-browser/chromium/chromium_35.0.1916.114.bb

diff --git a/recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch b/recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch
deleted file mode 100644
index 72b978c..0000000
--- a/recipes-browser/chromium/chromium/0001-Disable-ANGLE-commit-ID-generation.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 6ee39ace731dabdbe5e169ac5bc52b713afb1275 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Tue, 29 Jul 2014 12:08:25 +0200
-Subject: [PATCH] Disable ANGLE commit ID generation
-
-As part of the build process, ANGLE generates an ID out of the SRCREV
-of the git repo's HEAD. Since these recipes do not use a git repository,
-but a tarball release of Chromium, there is no HEAD, and building ANGLE
-fails.
-
-This patch replaces the git-based commit ID generation with a dummy ID.
-
-Upstream-Status: Pending
-
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- third_party/angle/src/angle.gypi   |  2 +-
- third_party/angle/src/commit_id.py | 22 +++++++++++++---------
- 2 files changed, 14 insertions(+), 10 deletions(-)
-
-diff --git a/third_party/angle/src/angle.gypi b/third_party/angle/src/angle.gypi
-index 5339369..c7ef8c1 100644
---- a/third_party/angle/src/angle.gypi
-+++ b/third_party/angle/src/angle.gypi
-@@ -56,7 +56,7 @@
-                         {
-                             'action_name': 'Generate Commit ID Header',
-                             'message': 'Generating commit ID header...',
--                            'inputs': [ '<(SHARED_INTERMEDIATE_DIR)/commit_id.py', '<(angle_path)/.git/index' ],
-+                            'inputs': [ '<(SHARED_INTERMEDIATE_DIR)/commit_id.py' ],
-                             'outputs': [ '<(SHARED_INTERMEDIATE_DIR)/commit.h' ],
-                             'action': [ 'python', '<(SHARED_INTERMEDIATE_DIR)/commit_id.py', '<(SHARED_INTERMEDIATE_DIR)/commit.h' ],
-                         },
-diff --git a/third_party/angle/src/commit_id.py b/third_party/angle/src/commit_id.py
-index 6339cca..1a3c0a3 100644
---- a/third_party/angle/src/commit_id.py
-+++ b/third_party/angle/src/commit_id.py
-@@ -1,17 +1,21 @@
- import subprocess as sp
- import sys
- 
--def grab_output(*command):
--    return sp.Popen(command, stdout=sp.PIPE).communicate()[0].strip()
-+#def grab_output(*command):
-+#    return sp.Popen(command, stdout=sp.PIPE).communicate()[0].strip()
-+#
-+#commit_id_size = 12
-+#
-+#try:
-+#    commit_id = grab_output('git', 'rev-parse', '--short=%d' % commit_id_size, 'HEAD')
-+#    commit_date = grab_output('git', 'show', '-s', '--format=%ci', 'HEAD')
-+#except:
-+#    commit_id = 'invalid-hash'
-+#    commit_date = 'invalid-date'
- 
-+commit_id = "0123456789ab"
- commit_id_size = 12
--
--try:
--    commit_id = grab_output('git', 'rev-parse', '--short=%d' % commit_id_size, 'HEAD')
--    commit_date = grab_output('git', 'show', '-s', '--format=%ci', 'HEAD')
--except:
--    commit_id = 'invalid-hash'
--    commit_date = 'invalid-date'
-+commit_date = "2014-06-11 17:45:12 +0200"
- 
- hfile = open(sys.argv[1], 'w')
- 
--- 
-1.8.3.2
-
diff --git a/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch b/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
deleted file mode 100644
index a44abff..0000000
--- a/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
+++ /dev/null
@@ -1,17 +0,0 @@
---- a/content/browser/accessibility/browser_accessibility_manager_gtk.cc	2013-05-26 00:43:54.000000000 +0200
-+++ b/content/browser/accessibility/browser_accessibility_manager_gtk.cc	2013-12-14 15:45:44.251138663 +0100
-@@ -55,11 +55,9 @@
-       RecursivelySendChildrenChanged(GetRoot()->ToBrowserAccessibilityGtk());
-       break;
-     case AccessibilityNotificationFocusChanged:
--      // Note: atk_focus_tracker_notify may be deprecated in the future;
--      // follow this bug for the replacement:
--      // https://bugzilla.gnome.org/show_bug.cgi?id=649575#c4
--      g_signal_emit_by_name(atk_object, "focus-event", true);
--      atk_focus_tracker_notify(atk_object);
-+      // Note: the focus-event was deprecated in ATK 2.9.4
-+      // See https://bugzilla.gnome.org/show_bug.cgi?id=649575#c8  
-+      g_signal_emit_by_name(atk_object, "focus-event", true); 
-       break;
-     default:
-       break;
diff --git a/recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch b/recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch
deleted file mode 100644
index 05b3bbe..0000000
--- a/recipes-browser/chromium/chromium/fix-glib-deprecated-warning.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Stolen the applicable part of https://chromium.googlesource.com/chromium/src.git/+/27f62d43929d33f178e89a832fde0b091a452fdd
-to fix the -Werror problem from a deprecated warning in this file:
-
-| In file included from ../../net/proxy/proxy_config_service_linux.cc:41:0:
-| gen/library_loaders/libgio.h:29:13: error:
-|   'const gchar* const* g_settings_list_schemas()' is deprecated
-|   (declared at .../tmp/sysroots/imx6qsabresd/usr/include/glib-2.0/gio/gsettings.h:74):
-|   Use 'g_settings_schema_source_list_schemas' instead [-Werror=deprecated-declarations]
-|    typeof(&::g_settings_list_schemas) g_settings_list_schemas;
-|              ^
-| cc1plus: all warnings being treated as errors
-
-Upstream-Status: Backport [27f62d43929d33f178e89a832fde0b091a452fdd]
-
---- chromium-35.0.1883.0/net/proxy/proxy_config_service_linux.cc.old	2014-05-24 11:21:46.456263672 +0200
-+++ chromium-35.0.1883.0/net/proxy/proxy_config_service_linux.cc	2014-05-24 11:26:52.041519475 +0200
-@@ -4,6 +4,15 @@
- 
- #include "net/proxy/proxy_config_service_linux.h"
- 
-+// glib >=2.40 deprecate g_settings_list_schemas in favor of
-+// g_settings_schema_source_list_schemas. This function is not available on
-+// earlier versions that we still need to support (specifically, 2.32), so
-+// disable the warning.
-+// TODO(mgiuca): Remove this suppression when we drop support for Ubuntu 13.10
-+// (saucy) and earlier. Update the code to use
-+// g_settings_schema_source_list_schemas instead.
-+#define GLIB_DISABLE_DEPRECATION_WARNINGS
-+
- #include <errno.h>
- #include <fcntl.h>
- #if defined(USE_GCONF)
diff --git a/recipes-browser/chromium/chromium/secitem_array.patch b/recipes-browser/chromium/chromium/secitem_array.patch
deleted file mode 100644
index 3537952..0000000
--- a/recipes-browser/chromium/chromium/secitem_array.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:43:39	206183
-+++ trunk/src/net/third_party/nss/ssl/bodge/secitem_array.c	2013/06/13 22:44:52	206184
-@@ -6,6 +6,7 @@
-  * Support routines for SECItemArray data structure.
-  */
- 
-+#include "nssutil.h"
- #include "seccomon.h"
- #include "secitem.h"
- #include "secerr.h"
-@@ -13,10 +14,15 @@
- 
- typedef struct SECItemArrayStr SECItemArray;
- 
-+#define NSSUTIL_VERSION_NUM \
-+    (NSSUTIL_VMAJOR * 10000 + NSSUTIL_VMINOR * 100 + NSSUTIL_VPATCH)
-+#if NSSUTIL_VERSION_NUM < 31500
-+// Added in NSS 3.15.
- struct SECItemArrayStr {
-     SECItem *items;
-     unsigned int len;
- };
-+#endif
- 
- SECItemArray *
- SECITEM_AllocArray(PLArenaPool *arena, SECItemArray *array, unsigned int len)
diff --git a/recipes-browser/chromium/chromium/uninitialised-warning.patch b/recipes-browser/chromium/chromium/uninitialised-warning.patch
deleted file mode 100644
index afdd784..0000000
--- a/recipes-browser/chromium/chromium/uninitialised-warning.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Make gcc 4.8 happy. It complains about uninitialized symbols
-
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual uint64 webkit_glue::WebClipboardImpl::sequenceNumber(WebKit::WebClipboard::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:80:48: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    return client_->GetSequenceNumber(buffer_type);
-|                                                 ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebVector<WebKit::WebString> webkit_glue::WebClipboardImpl::readAvailableTypes(WebKit::WebClipboard::Buffer, bool*)':
-| ../../webkit/glue/webclipboard_impl.cc:118:73: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|      client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
-|                                                                          ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebData webkit_glue::WebClipboardImpl::readImage(WebKit::WebClipboard::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:169:45: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    client_->ReadImage(buffer_type, &png_data);
-|                                              ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readCustomData(WebKit::WebClipboard::Buffer, const WebKit::WebString&)':
-| ../../webkit/glue/webclipboard_impl.cc:180:52: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    client_->ReadCustomData(buffer_type, type, &data);
-|                                                     ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readHTML(WebKit::WebClipboard::Buffer, WebKit::WebURL*, unsigned int*, unsigned int*)':
-| ../../webkit/glue/webclipboard_impl.cc:158:56: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|                      static_cast<uint32*>(fragment_end));
-|                                                         ^
-| ../../webkit/glue/webclipboard_impl.cc: In member function 'virtual WebKit::WebString webkit_glue::WebClipboardImpl::readPlainText(WebKit::WebClipboard::Buffer)':
-| ../../webkit/glue/webclipboard_impl.cc:136:3: error: 'buffer_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|    if (client_->IsFormatAvailable(ui::Clipboard::GetPlainTextFormatType(),
-|    ^
-| cc1plus: all warnings being treated as errors
-
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Unknown
-Index: chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
-===================================================================
---- chromium-29.0.1518.2.orig/content/renderer/webclipboard_impl.cc
-+++ chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
-@@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
- }
- 
- uint64 WebClipboardImpl::sequenceNumber(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return 0;
- 
-@@ -112,7 +112,7 @@ bool WebClipboardImpl::isFormatAvailable
- 
- WebVector<WebString> WebClipboardImpl::readAvailableTypes(
-     Buffer buffer, bool* contains_filenames) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   std::vector<base::string16> types;
-   if (ConvertBufferType(buffer, &buffer_type)) {
-     client_->ReadAvailableTypes(buffer_type, &types, contains_filenames);
-@@ -121,7 +121,7 @@ WebVector<WebString> WebClipboardImpl::r
- }
- 
- WebString WebClipboardImpl::readPlainText(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
- 
-@@ -147,7 +147,7 @@ WebString WebClipboardImpl::readPlainTex
- WebString WebClipboardImpl::readHTML(Buffer buffer, WebURL* source_url,
-                                      unsigned* fragment_start,
-                                      unsigned* fragment_end) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
- 
-@@ -161,7 +161,7 @@ WebString WebClipboardImpl::readHTML(Buf
- }
- 
- WebData WebClipboardImpl::readImage(Buffer buffer) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebData();
- 
-@@ -172,7 +172,7 @@ WebData WebClipboardImpl::readImage(Buff
- 
- WebString WebClipboardImpl::readCustomData(Buffer buffer,
-                                            const WebString& type) {
--  ui::Clipboard::Buffer buffer_type;
-+  ui::Clipboard::Buffer buffer_type = ui::Clipboard::BUFFER_STANDARD;
-   if (!ConvertBufferType(buffer, &buffer_type))
-     return WebString();
- 
diff --git a/recipes-browser/chromium/chromium_35.0.1916.114.bb b/recipes-browser/chromium/chromium_35.0.1916.114.bb
deleted file mode 100644
index 3df1716..0000000
--- a/recipes-browser/chromium/chromium_35.0.1916.114.bb
+++ /dev/null
@@ -1,112 +0,0 @@
-DESCRIPTION = "Chromium browser"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
-DEPENDS = "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
-SRC_URI = "\
-        http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
-        file://include.gypi \
-        file://oe-defaults.gypi \
-        ${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'file://component-build.gypi', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://remove-linux-accel-canvas-from-blacklist.patch', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'disable-api-keys-info-bar', 'file://0002-Disable-API-keys-info-bar.patch', '', d)} \
-        file://unistd-2.patch \
-        file://fix-glib-deprecated-warning.patch \
-        file://google-chrome \
-        file://google-chrome.desktop \
-"
-SRC_URI[md5sum] = "52a42d4ae36d0104f414cb7b814526d1"
-SRC_URI[sha256sum] = "566fcdc05d53c551d142ac9742ef69ba7c6d5a450d8ec41c0efd4fc8249f77af"
-
-# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
-COMPATIBLE_MACHINE_x86-64 = "(.*)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-inherit gettext
-
-# this makes sure the dependencies for the EGL mode are present; otherwise, the configure scripts
-# automatically and silently fall back to GLX
-PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
-
-# when building with gold for qemux86-64 it fails with:
-# FAILED: x86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro -Wl,--fatal-warnings -pthread -Wl,-z,noexecstack -fPIC -B/home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/chromium/35.0.1916.114-r0/chromium-35.0.1916.114/third_party/gold -m64 -Wl,--icf=none -Wl,--gc-sections -o chrome_sandbox -Wl,--start-group obj/sandbox/linux/suid/chrome_sandbox.linux_util.o obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o obj/sandbox/linux/suid/chrome_sandbox.sandbox.o  -Wl,--end-group
-# chromium/35.0.1916.114-r0/chromium-35.0.1916.114/third_party/gold/gold64: -plugin: unknown option
-# chromium/35.0.1916.114-r0/chromium-35.0.1916.114/third_party/gold/gold64: use the --help option for usage information
-# collect2: error: ld returned 1 exit status
-# ninja: build stopped: subcommand failed.
-EXTRA_OEGYP_GOLD_x86-64 = "-Dlinux_use_gold_binary=0 -Dlinux_use_gold_flags=0"
-EXTRA_OEGYP_GOLD = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '', '-Dlinux_use_gold_binary=0 -Dlinux_use_gold_flags=0', d)}"
-
-EXTRA_OEGYP =	" \
-	${EXTRA_OEGYP_GOLD} \
-	-I ${WORKDIR}/oe-defaults.gypi \
-	-I ${WORKDIR}/include.gypi \
-	${@bb.utils.contains('PACKAGECONFIG', 'component-build', '-I ${WORKDIR}/component-build.gypi', '', d)} \
-	-f ninja \
-"
-ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
-
-CHROMIUM_EXTRA_ARGS ?= " \
-	${@bb.utils.contains('PACKAGECONFIG', 'use-egl', '--use-gl=egl', '', d)} \
-	${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', '--gpu-no-context-lost', '', d)} \
-"
-
-export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
-do_configure() {
-	cd ${S}
-	# replace LD with CXX, to workaround a possible gyp issue?
-	LD="${CXX}" export LD
-	CC="${CC}" export CC
-	CXX="${CXX}" export CXX
-	CC_host="gcc" export CC_host
-	CXX_host="g++" export CXX_host
-	build/gyp_chromium --depth=. ${EXTRA_OEGYP}
-}
-
-do_compile() {
-	# build with ninja
-	ninja -C ${S}/out/Release chrome chrome_sandbox
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
-
-	# Add extra command line arguments to google-chrome script by modifying
-	# the dummy "CHROME_EXTRA_ARGS" line
-	sed -i "s/^CHROME_EXTRA_ARGS=\"\"/CHROME_EXTRA_ARGS=\"${CHROMIUM_EXTRA_ARGS}\"/" ${D}${bindir}/google-chrome
-
-	install -d ${D}${datadir}/applications
-	install -m 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/
-
-	install -d ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
-	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/icudtl.dat ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
-	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
-	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
-
-	# Always adding this libdir (not just with component builds), because the
-	# LD_LIBRARY_PATH line in the google-chromium script refers to it
-	install -d ${D}${libdir}/chrome/
-	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'component-build', '', d)}" ]; then
-		install -m 0755 ${S}/out/Release/lib/*.so ${D}${libdir}/chrome/
-	fi
-
-	install -d ${D}${sbindir}
-	install -m 4755 ${S}/out/Release/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
-
-	install -d ${D}${bindir}/chrome/locales/
-	install -m 0644 ${S}/out/Release/locales/en-US.pak ${D}${bindir}/chrome/locales
-}
-
-FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/ ${libdir}/chrome/"
-FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/chrome/.debug/"
-
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
-- 
1.8.3.2


