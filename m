Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 61AB077BB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:12 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id t86so19541646pfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bxSR9WY8MvZtcw7sQO8x5uvqtIJZuSiIWxByHOMDHt4=;
	b=BEBnjiI32OHbBmWA6Z8DJAqTOxnIO+7vWF5I/Aqy08kxw+76ZBssdIx8ohVxbXH4NC
	5CXhLuhpRt5OSel45CyyKHKmnJcp1eq+nKs8KwnhDfv+TW+zGlZuSdKHYsxJjKhrVRIj
	NVuTNiWUwwH9ncYlweto8J3KAN3JRML6+MEgbnzh5Buzpf8wIVcU3lQMsDM7TaT2GHx6
	K85MHX1XjyIE5Glkw2XQlhqlAubofv8iPmIDS4XMzUIvmhJ985pfSKqymtyWF3I09NIe
	B8BLfoMU3OPER68PnSrY7/ADJkoMh1i1c7Jr+/Yhbip4Eum/CKXduJCXV6GA1zY6cGAC
	kPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bxSR9WY8MvZtcw7sQO8x5uvqtIJZuSiIWxByHOMDHt4=;
	b=UW8qUWM65L6MUebeqS8s+6TfdXyR+U6/pycsPBr2IjMUrGXUlBRIdqAmSTnlxhu4RM
	nQh25VMM7C8nfz3SZrhDjPDk/bccvpR/UtjoLf2r8NuosuewOkTmsuTvuBhW9BuesyTM
	Iv1dnxcpbNFtV4qbFYRf8b0PTy5BDeN7XUgT3f4DV+iDIcxLbZIYRTUZmnHIr+/2ZRMZ
	Aa03CPQrGGNr7w9QlEBozhcQqhY8FRPkg/lA2KDHaxj+wSlqYOoE+Z6MtKuGA5hvOYhL
	rbVQ/ZqoJKxcpMKKn2+zbGEi4U1xF194COtJddiiSJDn7hpvVCbEwjXjzqFkvItO1iGy
	0JJg==
X-Gm-Message-State: AHYfb5hA8sSeg2fcKvu+x9g8rI/m++iilSB6DyWgOWj/ff6EtzHjKh3P
	KanYpGXspaLF5V2+
X-Received: by 10.84.194.228 with SMTP id h91mr6394518pld.46.1502228894036;
	Tue, 08 Aug 2017 14:48:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:53 -0700
Message-Id: <20170808214800.39621-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170808214800.39621-1-raj.khem@gmail.com>
References: <20170808214800.39621-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/9] llvm: Remove
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
X-List-Received-Date: Tue, 08 Aug 2017 21:48:13 -0000

Moved to OE-core, with a version upgrade

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm-common.bb           |  22 ---
 meta-oe/recipes-core/llvm/llvm-common/llvm-config  |  11 --
 meta-oe/recipes-core/llvm/llvm.inc                 | 162 ---------------------
 ...r-output-from-configure-if-CFLAGS-is-set-.patch |  52 -------
 .../llvm/llvm3.3/arm_fenv_uclibc.patch             |  14 --
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb           |  22 ---
 6 files changed, 283 deletions(-)
 delete mode 100644 meta-oe/recipes-core/llvm/llvm-common.bb
 delete mode 100644 meta-oe/recipes-core/llvm/llvm-common/llvm-config
 delete mode 100644 meta-oe/recipes-core/llvm/llvm.inc
 delete mode 100644 meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb

diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
deleted file mode 100644
index 618cc1e9d..000000000
--- a/meta-oe/recipes-core/llvm/llvm-common.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Helper script for OE's llvm support"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
-"
-
-SRC_URI = "file://llvm-config"
-
-ALLOW_EMPTY_${PN} = "1"
-SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_common_sysroot_preprocess"
-
-llvm_common_sysroot_preprocess() {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-}
-
-do_install_class-native() {
-    install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-core/llvm/llvm-common/llvm-config b/meta-oe/recipes-core/llvm/llvm-common/llvm-config
deleted file mode 100644
index b0f33c8d6..000000000
--- a/meta-oe/recipes-core/llvm/llvm-common/llvm-config
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# Wrapper script for real llvm-config. Simply calls
-
-if [ $WANT_LLVM_RELEASE ]; then
-	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
-else
-	echo "To use llvm-common WANT_LLVM_RELEASE needs to be exported."
-	echo "For example if this is being called through a recipe:"
-	echo "export WANT_LLVM_RELEASE=\"3.3\""
-	exit 1
-fi
diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
deleted file mode 100644
index f27261fa9..000000000
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ /dev/null
@@ -1,162 +0,0 @@
-# LLVM does not provide ABI stability between different versions. For this
-# reason OE makes it possible to build and install different llvm versions
-# at the same time.
-#
-# This is true for the normal recipes as well as the native ones.
-#
-# All regular installation directories are prefixed with 'llvm${LLVM_RELEASE}'
-# e.g. "${STAGING_BINDIR}/llvm2.5" or "${STAGING_INCDIR}/llvm2.5"
-#
-# For your program or library that makes use of llvm you do should not need to
-# modify anything as long as it uses the results of various llvm-config
-# invocations. If you need customizations something is wrong and it needs to be
-# fixed (report bug).
-#
-# However the *recipe* for your program/library *must* declare
-# export WANT_LLVM_RELEASE = "<valid version number>"
-# The version number is picked up by a generic wrapper script which just calls
-# the variant of the specified version.
-
-DESCRIPTION = "The Low Level Virtual Machine"
-HOMEPAGE = "http://llvm.org"
-
-# 3-clause BSD-like
-# University of Illinois/NCSA Open Source License
-LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
-
-DEPENDS = "libffi libxml2-native llvm-common"
-
-inherit perlnative pythonnative autotools
-
-LLVM_RELEASE = "${PV}"
-LLVM_DIR = "llvm${LLVM_RELEASE}"
-
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
-S = "${WORKDIR}/llvm-${PV}.src"
-
-LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-
-EXTRA_OECONF += "--disable-assertions \
-                 --enable-debug-runtime \
-                 --disable-expensive-checks \
-                 --enable-bindings=none \
-                 --enable-keep-symbols \
-                 --enable-libffi \
-                 --enable-optimized \
-                 --enable-shared \
-                 --enable-targets=host-only"
-EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
-
-do_configure_prepend() {
-    # Remove RPATHs
-    sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' ${S}/Makefile.rules
-
-    # Drop "svn" suffix from version string
-    sed -i 's/${PV}svn/${PV}/g' ${S}/configure
-
-    # Fix paths in llvm-config
-    sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
-    sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
-
-    # Fix the hardcoded libdir in llvm-config
-    sed -i 's:/lib\>:/${baselib}:g' ${S}/tools/llvm-config/llvm-config.cpp
-
-    # Fails to build unless using separate directory from source
-    mkdir -p ${LLVM_BUILD_DIR}
-    cd ${LLVM_BUILD_DIR}
-}
-
-do_compile() {
-    cd ${LLVM_BUILD_DIR}
-
-    # Fix libdir for multilib
-    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.config
-
-    oe_runmake \
-        AR="${BUILD_AR}" \
-        CC="${BUILD_CC}" \
-        CFLAGS="${BUILD_CFLAGS}" \
-        CXX="${BUILD_CXX}" \
-        CXXFLAGS="${BUILD_CXXFLAGS}" \
-        CPP="${BUILD_CPP}" \
-        CPPFLAGS="${BUILD_CPPFLAGS}" \
-        NM="${BUILD_NM}" \
-        RANLIB="${BUILD_RANLIB}" \
-        PATH="${STAGING_BINDIR_NATIVE}:$PATH" \
-        cross-compile-build-tools
-    oe_runmake
-}
-
-do_install() {
-    cd ${LLVM_BUILD_DIR}
-    oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
-
-    mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
-
-    install -d ${D}${bindir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
-
-    install -d ${D}${includedir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
-
-    install -d ${D}${libdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
-    ln -s ${LLVM_DIR}/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
-
-    install -d ${D}${docdir}/${LLVM_DIR}
-    mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
-}
-
-SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-    mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
-}
-
-PACKAGES += "${PN}-bugpointpasses ${PN}-llvmhello"
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-staticdev = "1"
-FILES_${PN} = ""
-FILES_${PN}-staticdev = ""
-FILES_${PN}-dbg = " \
-    ${bindir}/${LLVM_DIR}/.debug \
-    ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
-    ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
-    /usr/src/debug \
-"
-
-FILES_${PN}-dev = " \
-    ${bindir}/${LLVM_DIR} \
-    ${includedir}/${LLVM_DIR} \
-"
-RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello"
-
-FILES_${PN}-bugpointpasses = "\
-    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
-"
-FILES_${PN}-llvmhello = "\
-    ${libdir}/${LLVM_DIR}/LLVMHello.so \
-"
-
-PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
-NOAUTOPACKAGEDEBUG = "1"
-
-INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
-
-python llvm_populate_packages() {
-    libdir = bb.data.expand('${libdir}', d)
-    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
-    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
-    split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
-    split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
-    if split_packages:
-        pn = d.getVar('PN')
-        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
-        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
-        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
-}
-
-PACKAGESPLITFUNCS_prepend = "llvm_populate_packages "
diff --git a/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch b/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch
deleted file mode 100644
index 44387e898..000000000
--- a/meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output-from-configure-if-CFLAGS-is-set-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d4bf7a3853dab12c11cbfc8088fd76f548a8d017 Mon Sep 17 00:00:00 2001
-From: Patrik Hagglund <patrik.h.hagglund@ericsson.com>
-Date: Tue, 24 Sep 2013 11:38:45 +0000
-Subject: [PATCH] Remove error output from configure if CFLAGS is set (r174313).
-
-This fixes PR16724.
-
-git-svn-id: https://llvm.org/svn/llvm-project/llvm/trunk@191289 91177308-0d34-0410-b5e6-96231b3b80d8
-
-https://github.com/llvm-mirror/llvm/commit/d4bf7a3853dab12c11cbfc8088fd76f548a8d017
-
-Upstream-Status: Backport
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- autoconf/configure.ac | 4 ++--
- configure             | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/autoconf/configure.ac b/autoconf/configure.ac
-index f9c365c..45f2fe4 100644
---- a/autoconf/configure.ac
-+++ b/autoconf/configure.ac
-@@ -61,8 +61,8 @@ fi
- 
- dnl Default to empty (i.e. assigning the null string to) CFLAGS and CXXFLAGS,
- dnl instead of the autoconf default (for example, '-g -O2' for CC=gcc).
--${CFLAGS=}
--${CXXFLAGS=}
-+: ${CFLAGS=}
-+: ${CXXFLAGS=}
- 
- dnl We need to check for the compiler up here to avoid anything else
- dnl starting with a different one.
-diff --git a/configure b/configure
-index f3a6594..9090cda 100755
---- a/configure
-+++ b/configure
-@@ -1992,8 +1992,8 @@ echo "$as_me: error: Already configured in ${srcdir}" >&2;}
-   fi
- fi
- 
--${CFLAGS=}
--${CXXFLAGS=}
-+: ${CFLAGS=}
-+: ${CXXFLAGS=}
- 
- ac_ext=c
- ac_cpp='$CPP $CPPFLAGS'
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch
deleted file mode 100644
index c3ae49464..000000000
--- a/meta-oe/recipes-core/llvm/llvm3.3/arm_fenv_uclibc.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: llvm-2.9/include/llvm/Support/FEnv.h
-===================================================================
---- llvm-2.9.orig/include/llvm/Support/FEnv.h	2010-11-29 20:44:50.000000000 +0100
-+++ llvm-2.9/include/llvm/Support/FEnv.h	2011-11-18 18:42:22.580161297 +0100
-@@ -17,6 +17,9 @@
- 
- #include "llvm/Config/config.h"
- #include <cerrno>
-+
-+#undef HAVE_FENV_H
-+
- #ifdef HAVE_FENV_H
- #include <fenv.h>
- #endif
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
deleted file mode 100644
index 60a222185..000000000
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require llvm.inc
-
-DEPENDS += "zlib"
-EXTRA_OECONF += "--enable-zlib"
-
-SRC_URI += "file://Remove-error-output-from-configure-if-CFLAGS-is-set-.patch"
-
-SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
-
-SRC_URI[md5sum] = "40564e1dc390f9844f1711c08b08e391"
-SRC_URI[sha256sum] = "68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6727578"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[r600] = "--enable-experimental-targets=R600,,,"
-
-# Fails to build with thumb-1 (qemuarm)
-# | {standard input}: Assembler messages:
-# | {standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
-# | {standard input}:31: Error: lo register required -- `ldmia sp!,{r0,r1,r2,r3,lr}'
-# | {standard input}:32: Error: lo register required -- `ldr pc,[sp],#4'
-# | make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/llvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Release/ARMJITInfo.o] Error 1
-ARM_INSTRUCTION_SET = "arm"
-- 
2.14.0


