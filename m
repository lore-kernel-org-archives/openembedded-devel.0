Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 941EC60761
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:16:27 +0000 (UTC)
Received: by igvg19 with SMTP id g19so99029645igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EZaUE9P++Y3c/mx7iath3cwh92oQ8O9XW5qoIZnmMUI=;
	b=dWhAImhLaqtSxI0fmgXBQDVVzL9A3swtr2NcinBqEj8FREw9MSnsZgCNgGMxP0GEh3
	dCmAiBytn6vKXWJWcLcG9Uri0qeqQNWYudZWp1WZB2Dyqd6s/dYxm82XGIJXK8EcNyXs
	NwFVIUJsQ/ieyd9zYCb7Hq5Mw0x2+q04jqECQfnllG2377yKGLCLYeiWm6HODud8xYiO
	7Jem4mk7OVo+A8tnUCeEwfTc33fR1gmW7Hx2nNJMsjZavmL9AIgDBFLi8WP/kNshDkyK
	7Mlj2Rkuln5ynB5E9Ojj9QLosMclTZGc3cwIiA+TNKr6GQ7K4D8a6yzn+5jgQpEqMCr2
	fw6w==
X-Received: by 10.50.92.6 with SMTP id ci6mr26648923igb.45.1448990187775;
	Tue, 01 Dec 2015 09:16:27 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	qb7sm288509igb.8.2015.12.01.09.16.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 09:16:27 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 12:15:50 -0500
Message-Id: <1448990151-27720-2-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
In-Reply-To: <1448990151-27720-1-git-send-email-twoerner@gmail.com>
References: <1448990151-27720-1-git-send-email-twoerner@gmail.com>
Subject: [meta-oe][PATCH 1/2] nodejs: cleanup
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
X-List-Received-Date: Tue, 01 Dec 2015 17:16:29 -0000

Currently the latest stable version of node.js is 4.2.2. Also, currently,
there are two nodejs recipes: one for nodejs and one for nodejs4. A user would
naturally assume nodejs4 would be for the latest stable, but they would be
wrong. Nodejs4 refers to version 0.4.12.

Cleanup the node recipes such that there are two nodejs recipes from which to
choose. A user can select between them using the regular
PREFERRED_VERSION_nodejs notation.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../enable-armv5e-build.patch                      |  0
 .../{nodejs => nodejs-0.12.7}/no-registry.patch    |  0
 .../libev-cross-cc_0.4.12.patch                    |  0
 meta-oe/recipes-devtools/nodejs/nodejs.inc         | 80 ++++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb   | 74 +-------------------
 .../nodejs/{nodejs4_0.4.12.bb => nodejs_0.4.12.bb} |  2 +-
 6 files changed, 83 insertions(+), 73 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs => nodejs-0.12.7}/enable-armv5e-build.patch (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs => nodejs-0.12.7}/no-registry.patch (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs4 => nodejs-0.4.12}/libev-cross-cc_0.4.12.patch (100%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs.inc
 rename meta-oe/recipes-devtools/nodejs/{nodejs4_0.4.12.bb => nodejs_0.4.12.bb} (87%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch b/meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/enable-armv5e-build.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/enable-armv5e-build.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch b/meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/no-registry.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-0.12.7/no-registry.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs-0.4.12/libev-cross-cc_0.4.12.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-0.4.12/libev-cross-cc_0.4.12.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs.inc b/meta-oe/recipes-devtools/nodejs/nodejs.inc
new file mode 100644
index 0000000..41eb5ee
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs.inc
@@ -0,0 +1,80 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD & Artistic-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+    file://enable-armv5e-build.patch \
+    file://no-registry.patch \
+"
+SRC_URI[md5sum] = "5523ec4347d7fe6b0f6dda1d1c7799d5"
+SRC_URI[sha256sum] = "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
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
+    oe_runmake BUILDTYPE=Release
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
+    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+}
+
+do_install_append_class-target() {
+    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
+}
+
+PACKAGES =+ "${PN}-npm"
+FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm"
+RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
+
+PACKAGES =+ "${PN}-systemtap"
+FILES_${PN}-systemtap = "${datadir}/systemtap"
+
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
index 41eb5ee..f9d3f04 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
@@ -1,9 +1,6 @@
-DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
+require nodejs.inc
 
-DEPENDS = "openssl"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
@@ -11,70 +8,3 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
 "
 SRC_URI[md5sum] = "5523ec4347d7fe6b0f6dda1d1c7799d5"
 SRC_URI[sha256sum] = "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-def map_nodejs_arch(a, d):
-    import re
-
-    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
-    elif re.match('i.86$', a): return 'ia32'
-    elif re.match('x86_64$', a): return 'x64'
-    elif re.match('arm64$', a): return 'arm'
-    return a
-
-ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
-GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
-ARCHFLAGS ?= ""
-
-# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
-do_configure () {
-    export LD="${CXX}"
-    GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
-    # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-snapshot --shared-openssl \
-               --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH', True), d)}" \
-               --dest-os=linux \
-               ${ARCHFLAGS}
-}
-
-do_compile () {
-    export LD="${CXX}"
-    oe_runmake BUILDTYPE=Release
-}
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-}
-
-do_install_append_class-native() {
-    # use node from PATH instead of absolute path to sysroot
-    # node-v0.10.25/tools/install.py is using:
-    # shebang = os.path.join(node_prefix, 'bin/node')
-    # update_shebang(link_path, shebang)
-    # and node_prefix can be very long path to bindir in native sysroot and
-    # when it exceeds 128 character shebang limit it's stripped to incorrect path
-    # and npm fails to execute like in this case with 133 characters show in log.do_install:
-    # updating shebang of /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/nodejs-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/npm to /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
-    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.js
-    # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
-    # npm-cli.js continues to use old shebang
-    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-}
-
-do_install_append_class-target() {
-    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
-}
-
-PACKAGES =+ "${PN}-npm"
-FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm"
-RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
-
-PACKAGES =+ "${PN}-systemtap"
-FILES_${PN}-systemtap = "${datadir}/systemtap"
-
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
similarity index 87%
rename from meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
index c73cefc..0525143 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
 
 DEPENDS = "openssl"
 
-PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
+PNBLACKLIST[nodejs_0.4.12] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
 
 SRC_URI = " \
     http://nodejs.org/dist/node-v${PV}.tar.gz \
-- 
2.6.0.rc3


