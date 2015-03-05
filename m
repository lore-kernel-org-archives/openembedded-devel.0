Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1B99C65C88
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 01:27:37 +0000 (UTC)
Received: by iecrp18 with SMTP id rp18so4619366iec.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 17:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nofcGMhcvkR6CtKLwChrpP5tz/i8fa5UkBoD4c4KqmY=;
	b=PZljEh4LgECxi06Co6zPmiMAcc5rfmzSlJji82pmDBHGjHQge/Tx/fiSTWO78GiIIC
	sHcGGdN7ZxKWqEsQarWqK8XeB3bdo2vsaoEWWz3CJBJGUIX579k73HrqW6Vd4ipMZjrn
	Ji6FASYQEKMvbLlLJ254gGTOFglLfIaudOKJFxs4JgRgWp4YqU8uccXkizhbWTXwru5m
	pXyB1AN8+X6dVGc3CGL1Lm7DrB1DP3Awip8vWcqoLtbuFnIr8+qdIeTzqPvwMhVIbE7c
	oKn3Mk4e4J01tiw2nFyfVsLUX89HR4O8saQrHjuwEFXc1+nQY4pKNlGzDdIc1xKFbc92
	D73w==
X-Received: by 10.43.63.80 with SMTP id xd16mr834594icb.21.1425518858839;
	Wed, 04 Mar 2015 17:27:38 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	gz4sm11804305igb.19.2015.03.04.17.27.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 17:27:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 01:27:32 +0000
Message-Id: <1425518853-20124-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] nodejs: Upgrade to 0.12.0
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
X-List-Received-Date: Thu, 05 Mar 2015 01:27:39 -0000

Tested on mips1

Change-Id: I54211c2c323dbec1d38eb526ae183775ba3241f1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb | 83 ++++++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 44 -------------
 2 files changed, 83 insertions(+), 44 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
new file mode 100644
index 0000000..fae4b59
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
@@ -0,0 +1,83 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD & Artistic-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
+SRC_URI[md5sum] = "62c8d9c74c8f68193f60e4cba020eb48"
+SRC_URI[sha256sum] = "9700e23af4e9b3643af48cef5f2ad20a1331ff531a12154eef2bfb0bb1682e32"
+
+S = "${WORKDIR}/node-v${PV}"
+
+# v8 errors out if you have set CCACHE
+CCACHE = ""
+
+def map_nodejs_arch(a, d):
+    import re
+
+    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
+    elif re.match('i.86$', a): return 'ia32'
+    elif re.match('x86_64$', a): return 'x64'
+    elif re.match('arm64$', a): return 'arm'
+    return a
+
+ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
+GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
+ARCHFLAGS ?= ""
+
+# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
+do_configure () {
+    export LD="${CXX}"
+    GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
+    # $TARGET_ARCH settings don't match --dest-cpu settings
+   ./configure --prefix=${prefix} --without-snapshot --shared-openssl \
+               --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH', True), d)}" \
+               --dest-os=linux \
+               ${ARCHFLAGS}
+}
+
+do_compile () {
+    export LD="${CXX}"
+    make BUILDTYPE=Release
+}
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+do_install_append_class-native() {
+    # use node from PATH instead of absolute path to sysroot
+    # node-v0.10.25/tools/install.py is using:
+    # shebang = os.path.join(node_prefix, 'bin/node')
+    # update_shebang(link_path, shebang)
+    # and node_prefix can be very long path to bindir in native sysroot and
+    # when it exceeds 128 character shebang limit it's stripped to incorrect path
+    # and npm fails to execute like in this case with 133 characters show in log.do_install:
+    # updating shebang of /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/nodejs-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/npm to /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
+    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
+    # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
+    # npm-cli.js continues to use old shebang
+    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${libdir}/node_modules/npm/bin/npm-cli.js
+}
+
+do_install_append_class-target() {
+    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${libdir}/node_modules/npm/bin/npm-cli.js
+}
+
+RDEPENDS_${PN} = "curl"
+RDEPENDS_${PN}_class-native = ""
+
+PACKAGES =+ "${PN}-npm"
+FILES_${PN}-npm = "${libdir}/node_modules ${bindir}/npm"
+RDEPENDS_${PN}-npm = "python-shell python-datetime python-subprocess python-textutils"
+
+PACKAGES =+ "${PN}-dtrace"
+FILES_${PN}-dtrace = "${libdir}/dtrace"
+
+PACKAGES =+ "${PN}-systemtap"
+FILES_${PN}-systemtap = "${datadir}/systemtap"
+
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
deleted file mode 100644
index 839bfa4..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
-
-DEPENDS = "openssl"
-
-inherit pythonnative
-
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
-"
-SRC_URI[md5sum] = "25ed6aa5710ac46b867ff3f17a4da1d6"
-SRC_URI[sha256sum] = "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
-ARCHFLAGS ?= ""
-
-# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
-do_configure () {
-    export LD="${CXX}"
-
-    ./configure --prefix=${prefix} --without-snapshot ${ARCHFLAGS}
-}
-
-do_compile () {
-    export LD="${CXX}"
-    make BUILDTYPE=Release
-}
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-}
-
-RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
-RDEPENDS_${PN}_class-native = ""
-
-FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace ${libdir}/*"
-BBCLASSEXTEND = "native"
-- 
2.1.4


