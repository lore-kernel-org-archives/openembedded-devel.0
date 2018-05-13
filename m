Return-Path: <robert.joslyn@redrectangle.org>
Received: from slow1-d.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 2591A789E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 02:10:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id EC9B03A5289
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 03:59:07 +0200 (CEST)
X-Originating-IP: 64.126.143.1
Received: from localhost.localdomain (w143001.wireless.fsr.net [64.126.143.1])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1A951C0002;
	Sun, 13 May 2018 03:59:06 +0200 (CEST)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 May 2018 18:58:42 -0700
Message-Id: <20180513015842.4284-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.1
X-Spam-Level: 
Subject: [meta-oe][rocko][PATCH] meson.bbclass: Backport rework from OE-core
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
X-List-Received-Date: Sun, 13 May 2018 02:10:17 -0000

Starting from commit cead3c4925d39f8adc328007d8a8c1b23cc72842 in
OE-core, uninative forces the use of the uninative ld in BUILD_LDFLAGS.
This causes target binaries built with this class to use the uninative
ld at runtime, which doesn't exist on the target.

Since this class has been migrated to OE-core for future releases,
backport the entire class to fix this issue and others.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/classes/meson.bbclass | 74 ++++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 25 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index a09bc240d..2d7ee4fff 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -9,21 +9,11 @@ do_configure[cleandirs] = "${B}"
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
-# These variables in the environment override the *native* tools, not the cross.
-export CPPFLAGS = "${BUILD_CPPFLAGS}"
-export CC = "${BUILD_CC}"
-export CFLAGS = "${BUILD_CFLAGS}"
-export CXX = "${BUILD_CXX}"
-export CXXFLAGS = "${BUILD_CXXFLAGS}"
-export LD = "${BUILD_LD}"
-export LDFLAGS = "${BUILD_LDFLAGS}"
-export AR = "${BUILD_AR}"
-export PKG_CONFIG = "pkg-config-native"
-
 def noprefix(var, d):
-    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
+    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
 MESONOPTS = " --prefix ${prefix} \
+              --buildtype plain \
               --bindir ${@noprefix('bindir', d)} \
               --sbindir ${@noprefix('sbindir', d)} \
               --datadir ${@noprefix('datadir', d)} \
@@ -36,40 +26,46 @@ MESONOPTS = " --prefix ${prefix} \
               --localstatedir ${localstatedir} \
               --sharedstatedir ${sharedstatedir}"
 
-MESON_C_ARGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_LINK_ARGS = "${MESON_C_ARGS} ${LDFLAGS}"
+MESON_TOOLCHAIN_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
+MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
+MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
 
-MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
-MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
+# both are required but not used by meson
+MESON_HOST_ENDIAN = "bogus-endian"
+MESON_TARGET_ENDIAN = "bogus-endian"
 
 EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
 
 MESON_CROSS_FILE = ""
 MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
+MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
 
 def meson_array(var, d):
-    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
+    return "', '".join(d.getVar(var).split()).join(("'", "'"))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
+do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD AR NM STRIP READELF"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
 [binaries]
-c = '${HOST_PREFIX}gcc'
-cpp = '${HOST_PREFIX}g++'
-ar = '${HOST_PREFIX}ar'
-ld = '${HOST_PREFIX}ld'
-strip = '${HOST_PREFIX}strip'
-readelf = '${HOST_PREFIX}readelf'
+c = [${@meson_array('CC', d)}]
+cpp = [${@meson_array('CXX', d)}]
+ar = [${@meson_array('AR', d)}]
+nm = [${@meson_array('NM', d)}]
+ld = [${@meson_array('LD', d)}]
+strip = [${@meson_array('STRIP', d)}]
+readelf = [${@meson_array('READELF', d)}]
 pkgconfig = 'pkg-config'
 
 [properties]
 needs_exe_wrapper = true
 c_args = [${@meson_array('MESON_C_ARGS', d)}]
 c_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
-cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
+cpp_args = [${@meson_array('MESON_CPP_ARGS', d)}]
 cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
+gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
 
 [host_machine]
 system = '${HOST_OS}'
@@ -94,6 +90,34 @@ meson_do_configure() {
     fi
 }
 
+meson_do_configure_prepend_class-target() {
+    # Set these so that meson uses the native tools for its build sanity tests,
+    # which require executables to be runnable. The cross file will still
+    # override these for the target build. Note that we do *not* set CFLAGS,
+    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
+    # target build, causing errors.
+    export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
+    export LD="${BUILD_LD}"
+    export AR="${BUILD_AR}"
+}
+
+meson_do_configure_prepend_class-nativesdk() {
+    # Set these so that meson uses the native tools for its build sanity tests,
+    # which require executables to be runnable. The cross file will still
+    # override these for the nativesdk build. Note that we do *not* set CFLAGS,
+    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
+    # nativesdk build, causing errors.
+    export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
+    export LD="${BUILD_LD}"
+    export AR="${BUILD_AR}"
+}
+
+meson_do_configure_prepend_class-native() {
+    export PKG_CONFIG="pkg-config-native"
+}
+
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
     ninja ${PARALLEL_MAKE}
-- 
2.16.1


