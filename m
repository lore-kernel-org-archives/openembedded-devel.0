Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1D47F60881
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 07:28:58 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 3so5251201pdj.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jun 2013 00:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/EH39qxwp9nklbiKCjBn/5hcW0ERNJwUlYqKQWlQ2Y8=;
	b=zzSLw6UMe2j8XPlw4G9XS1ZHwkFBuPJO61FexOg2MFUHQUuVhK78k+j5b6I2i/c4jj
	05e3Fxz42ta6TLKvNOFeJtonqeIK4MCwqqOmUzLcaW0IZl7PEHxiK9ia4nGqyqtvupyC
	iDIAKpuqQWy/QReoKmaFH42EAH8blnQvxjOlHwGvuQEZvuR+G4iJ0QFVRcBsl1vH0C9O
	RdxIw7A4Z71T6TObteRCVfaqW2ZMkwFw05I85uoW1tsQT6sI+wutTDWG8p99WM+wkJEK
	01JdM28A84hCTz/beSQ9ww5F0vFxu1XsswG6Nvpiu3ceNzcJx5nYsLUdTGjshf8g8WUr
	fOqg==
X-Received: by 10.66.253.74 with SMTP id zy10mr23137024pac.123.1370244539147; 
	Mon, 03 Jun 2013 00:28:59 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 10sm57948929pbm.0.2013.06.03.00.28.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 00:28:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jun 2013 17:42:42 +1000
Message-Id: <1370245362-3518-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-oe][PATCH v4] llvm3.2: new recipe
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
X-List-Received-Date: Mon, 03 Jun 2013 07:28:58 -0000

arm_fenv_uclibc.patch was copied from llvm2.9 recipe.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../llvm/llvm3.2/arm_fenv_uclibc.patch             | 14 ++++
 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb           | 97 ++++++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb

diff --git a/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
new file mode 100644
index 0000000..c3ae494
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
@@ -0,0 +1,14 @@
+Index: llvm-2.9/include/llvm/Support/FEnv.h
+===================================================================
+--- llvm-2.9.orig/include/llvm/Support/FEnv.h	2010-11-29 20:44:50.000000000 +0100
++++ llvm-2.9/include/llvm/Support/FEnv.h	2011-11-18 18:42:22.580161297 +0100
+@@ -17,6 +17,9 @@
+ 
+ #include "llvm/Config/config.h"
+ #include <cerrno>
++
++#undef HAVE_FENV_H
++
+ #ifdef HAVE_FENV_H
+ #include <fenv.h>
+ #endif
diff --git a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
new file mode 100644
index 0000000..3b74306
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
@@ -0,0 +1,97 @@
+DESCRIPTION = "The Low Level Virtual Machine"
+HOMEPAGE = "http://llvm.org"
+# 3-clause BSD-like
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=60fdd7739841f04a2ce2171a726be8f3"
+
+DEPENDS = "libffi llvm-common"
+
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
+
+SRC_URI[md5sum] = "71610289bbc819e3e15fdd562809a2d7"
+SRC_URI[sha256sum] = "125090c4d26740f1d5e9838477c931ed7d9ad70d599ba265f46f3a42cb066343"
+
+S = "${WORKDIR}/llvm-${PV}.src"
+
+inherit autotools perlnative pythonnative
+
+LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
+LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
+LLVM_RELEASE = "3.2"
+LLVM_DIR = "llvm${LLVM_RELEASE}"
+
+EXTRA_OECONF += "--disable-assertions \
+                 --enable-debug-runtime \
+                 --disable-expensive-checks \
+                 --enable-bindings=none \
+                 --enable-keep-symbols \
+                 --enable-libffi \
+                 --enable-optimized \
+                 --enable-shared \
+                 --enable-targets=host-only"
+EXTRA_OEMAKE += "REQUIRES_RTTI=1"
+FILES_${PN} = "${libdir}/lib*.so \
+               ${libdir}/${LLVM_DIR}/*"
+FILES_${PN}-dbg = "${bindir}/${LLVM_DIR}/.debug \
+                   ${libdir}/${LLVM_DIR}/.debug \
+                   ${libdir}/.debug \
+                   /usr/src/debug"
+FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
+                   ${includedir}/${LLVM_DIR} \
+                   ${libdir}/${LLVM_DIR}/BugpointPasses.so \
+                   ${libdir}/${LLVM_DIR}/LLVMHello.so"
+FILES_${PN}-static-dev = "${libdir}/${LLVM_DIR}/*.a"
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} = "dev-so"
+
+do_configure_prepend() {
+	# Remove RPATHs
+	sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules
+
+	# Drop "svn" suffix from version string
+	sed -i 's/3\.2svn/3.2/g' configure
+
+	# Fix paths in llvm-config
+	sed -i "s|sys::path::parent_path(CurrentPath))|sys::path::parent_path(sys::path::parent_path(CurrentPath)))|g" tools/llvm-config/llvm-config.cpp
+	sed -i "s|/bin|/bin/${LLVM_DIR}|g" tools/llvm-config/llvm-config.cpp
+	sed -i "s|/include|/include/${LLVM_DIR}|g" tools/llvm-config/llvm-config.cpp
+	sed -i "s|/lib|/lib/${LLVM_DIR}|g" tools/llvm-config/llvm-config.cpp
+
+	# Fails to build unless using separate directory from source
+	mkdir -p ${LLVM_BUILD_DIR}
+	cd ${LLVM_BUILD_DIR}
+}
+
+do_compile() {
+	cd ${LLVM_BUILD_DIR}
+	oe_runmake CC=${BUILD_CC} CXX=${BUILD_CXX} cross-compile-build-tools
+	oe_runmake
+}
+
+do_install() {
+	cd ${LLVM_BUILD_DIR}
+	oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
+
+	mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
+
+	install -d ${D}${bindir}/${LLVM_DIR}
+	mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
+
+	install -d ${D}${includedir}/${LLVM_DIR}
+	mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
+
+	install -d ${D}${libdir}/${LLVM_DIR}
+	mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
+	ln -s ${LLVM_DIR}/libLLVM-${LLVM_RELEASE}.so ${D}${libdir}/libLLVM-${LLVM_RELEASE}.so
+
+	install -d ${D}${docdir}/${LLVM_DIR}
+	mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
+}
+
+SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
+
+llvm_sysroot_preprocess() {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+	mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${LLVM_RELEASE}
+}
-- 
1.8.2.3


