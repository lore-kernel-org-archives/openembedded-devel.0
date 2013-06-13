Return-Path: <net147@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id DC1736A5DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 12:46:02 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 10so10222452pdc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QTYr9zTDguJUjggmzFlsyWOQe+HycH5iFBcFwPvfIV4=;
	b=I+BghJPRKmfpOCghqixaHus485Zrztk7N/QqSa+6koLoy3Hn4OmLYSsj2PbkMVhdQk
	+/YZzBQZHcmq6jC15AhHdxSWrLDpN5LCv4pNdfDwsUFmE21+rnHEzCtd7yyKpcueJXrn
	fFBS5I54U8M9PDfcj6dvBkEpx7gN1GJJMOV4G4BbzPn8ASry6aiTIqEh6lz4G3Ha8GsT
	pikdbg0eyrP407PjGNz4pruxTvC9nAtUa65TekI9QBGEKqa8xBSumwKUOW+6W5tnTY+B
	+XVMBy9RP54sM2m31fMIEW3fFEsaC3XS8iHJ1u++EOGIuqt4kLrK1D1ADuh2okQJXNs3
	HJxQ==
X-Received: by 10.68.203.161 with SMTP id kr1mr600351pbc.192.1371127563897;
	Thu, 13 Jun 2013 05:46:03 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id pl9sm23309518pbc.5.2013.06.13.05.46.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 05:46:03 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2013 23:00:23 +1000
Message-Id: <1371128423-16744-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH] llvm3.3: new recipe
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
X-List-Received-Date: Thu, 13 Jun 2013 12:46:03 -0000

arm_fenv_uclibc.patch was copied from llvm3.2 recipe.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../llvm/llvm3.3/arm_fenv_uclibc.patch             |  14 +++
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb           | 105 +++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb

diff --git a/meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch
new file mode 100644
index 0000000..c3ae494
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch
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
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
new file mode 100644
index 0000000..d3aa963
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -0,0 +1,105 @@
+DESCRIPTION = "The Low Level Virtual Machine"
+HOMEPAGE = "http://llvm.org"
+# 3-clause BSD-like
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
+
+DEPENDS = "libffi libxml2-native llvm-common"
+
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
+
+SRC_URI[md5sum] = "40564e1dc390f9844f1711c08b08e391"
+SRC_URI[sha256sum] = "68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6727578"
+
+S = "${WORKDIR}/llvm-${PV}.src"
+
+inherit autotools perlnative pythonnative
+
+LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
+LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
+LLVM_DIR = "llvm${PV}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[r600] = "--enable-experimental-targets=R600,,,"
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
+EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
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
+	# Fix paths in llvm-config
+	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" tools/llvm-config/llvm-config.cpp
+	sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" tools/llvm-config/llvm-config.cpp
+
+	# Fails to build unless using separate directory from source
+	mkdir -p ${LLVM_BUILD_DIR}
+	cd ${LLVM_BUILD_DIR}
+}
+
+do_compile() {
+	cd ${LLVM_BUILD_DIR}
+	oe_runmake \
+		AR="${BUILD_AR}" \
+		CC="${BUILD_CC}" \
+		CFLAGS="${BUILD_CFLAGS}" \
+		CXX="${BUILD_CXX}" \
+		CXXFLAGS="${BUILD_CXXFLAGS}" \
+		CPP="${BUILD_CPP}" \
+		CPPFLAGS="${BUILD_CPPFLAGS}" \
+		NM="${BUILD_NM}" \
+		RANLIB="${BUILD_RANLIB}" \
+		PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
+		cross-compile-build-tools
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
+	ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
+
+	install -d ${D}${docdir}/${LLVM_DIR}
+	mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
+}
+
+SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
+
+llvm_sysroot_preprocess() {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+	mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
+}
-- 
1.8.3


