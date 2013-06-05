Return-Path: <net147@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id CBC516A4A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2013 03:09:35 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hz10so765463vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jun 2013 20:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oYKso8VajkJIK1/W4F8VyLRh/gdjJz7cHI1sc7hSxFg=;
	b=QeGshKAtTYLPS6gYorgwGCcNcTBEWhI3zuHwmXP2u7YsKE5iPoVjhciHTSjkMkm0hN
	Jrc3apDdJNAUgGCOGTU1q98eSEfQFchh8jj1ITrfhAHmF7Yek1Fxw11suvthMAt6pcNj
	0zY2S2axtSoFifUJmetZrm1IvyjLhq18lNZMiuANAx6fCU4VL3Y7LjH0opJ7jjYOU7u8
	jzTIlkZXD9r3EIBDMPBDC9LeK/jsMaBo+xErahililTRk9huiVsTDamd/+tjFX25wFia
	MYdEOwyJo6V7zY2s01jr1bxv8sGb/TP+XWGE2NUidbxOmJqMSUPU2PadejnLE9D6yf6G
	kdvw==
MIME-Version: 1.0
X-Received: by 10.58.75.41 with SMTP id z9mr9474952vev.4.1370401775391; Tue,
	04 Jun 2013 20:09:35 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Tue, 4 Jun 2013 20:09:35 -0700 (PDT)
In-Reply-To: <1370245362-3518-1-git-send-email-net147@gmail.com>
References: <1370245362-3518-1-git-send-email-net147@gmail.com>
Date: Wed, 5 Jun 2013 13:09:35 +1000
Message-ID: <CANwerB2bD5DZswYb13=da0GHNNFyzkLjRAmy2nbreF3PUgchQA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v4] llvm3.2: new recipe
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
X-List-Received-Date: Wed, 05 Jun 2013 03:09:36 -0000
Content-Type: text/plain; charset=UTF-8

I have submitted patch V5 which address some issues as follows.

On 3 June 2013 17:42, Jonathan Liu <net147@gmail.com> wrote:
> arm_fenv_uclibc.patch was copied from llvm2.9 recipe.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../llvm/llvm3.2/arm_fenv_uclibc.patch             | 14 ++++
>  meta-oe/recipes-core/llvm/llvm3.2_3.2.bb           | 97 ++++++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
>  create mode 100644 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
>
> diff --git a/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
> new file mode 100644
> index 0000000..c3ae494
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
> @@ -0,0 +1,14 @@
> +Index: llvm-2.9/include/llvm/Support/FEnv.h
> +===================================================================
> +--- llvm-2.9.orig/include/llvm/Support/FEnv.h  2010-11-29 20:44:50.000000000 +0100
> ++++ llvm-2.9/include/llvm/Support/FEnv.h       2011-11-18 18:42:22.580161297 +0100
> +@@ -17,6 +17,9 @@
> +
> + #include "llvm/Config/config.h"
> + #include <cerrno>
> ++
> ++#undef HAVE_FENV_H
> ++
> + #ifdef HAVE_FENV_H
> + #include <fenv.h>
> + #endif
> diff --git a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
> new file mode 100644
> index 0000000..3b74306
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
> @@ -0,0 +1,97 @@
> +DESCRIPTION = "The Low Level Virtual Machine"
> +HOMEPAGE = "http://llvm.org"
> +# 3-clause BSD-like
> +LICENSE = "NCSA"
> +LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=60fdd7739841f04a2ce2171a726be8f3"
> +
> +DEPENDS = "libffi llvm-common"
Missing libxml2-native dependency.

> +
> +SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
> +SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
> +
> +SRC_URI[md5sum] = "71610289bbc819e3e15fdd562809a2d7"
> +SRC_URI[sha256sum] = "125090c4d26740f1d5e9838477c931ed7d9ad70d599ba265f46f3a42cb066343"
> +
> +S = "${WORKDIR}/llvm-${PV}.src"
> +
> +inherit autotools perlnative pythonnative
> +
> +LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
> +LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
> +LLVM_RELEASE = "3.2"
> +LLVM_DIR = "llvm${LLVM_RELEASE}"
> +
> +EXTRA_OECONF += "--disable-assertions \
> +                 --enable-debug-runtime \
> +                 --disable-expensive-checks \
> +                 --enable-bindings=none \
> +                 --enable-keep-symbols \
> +                 --enable-libffi \
> +                 --enable-optimized \
> +                 --enable-shared \
> +                 --enable-targets=host-only"
> +EXTRA_OEMAKE += "REQUIRES_RTTI=1"
> +FILES_${PN} = "${libdir}/lib*.so \
> +               ${libdir}/${LLVM_DIR}/*"
> +FILES_${PN}-dbg = "${bindir}/${LLVM_DIR}/.debug \
> +                   ${libdir}/${LLVM_DIR}/.debug \
> +                   ${libdir}/.debug \
> +                   /usr/src/debug"
> +FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
> +                   ${includedir}/${LLVM_DIR} \
> +                   ${libdir}/${LLVM_DIR}/BugpointPasses.so \
> +                   ${libdir}/${LLVM_DIR}/LLVMHello.so"
> +FILES_${PN}-static-dev = "${libdir}/${LLVM_DIR}/*.a"
> +FILES_SOLIBSDEV = ""
> +INSANE_SKIP_${PN} = "dev-so"
> +
> +do_configure_prepend() {
> +       # Remove RPATHs
> +       sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules
> +
> +       # Drop "svn" suffix from version string
> +       sed -i 's/3\.2svn/3.2/g' configure
> +
> +       # Fix paths in llvm-config
> +       sed -i "s|sys::path::parent_path(CurrentPath))|sys::path::parent_path(sys::path::parent_path(CurrentPath)))|g" tools/llvm-config/llvm-config.cpp
> +       sed -i "s|/bin|/bin/${LLVM_DIR}|g" tools/llvm-config/llvm-config.cpp
> +       sed -i "s|/include|/include/${LLVM_DIR}|g" tools/llvm-config/llvm-config.cpp
> +       sed -i "s|/lib|/lib/${LLVM_DIR}|g" tools/llvm-config/llvm-config.cpp
The sed expressions will fail if applied more than once.

> +
> +       # Fails to build unless using separate directory from source
> +       mkdir -p ${LLVM_BUILD_DIR}
> +       cd ${LLVM_BUILD_DIR}
> +}
> +
> +do_compile() {
> +       cd ${LLVM_BUILD_DIR}
> +       oe_runmake CC=${BUILD_CC} CXX=${BUILD_CXX} cross-compile-build-tools
It is missing overrides for AR, RANLIB, LD, NM, etc.
${STAGING_BINDIR_NATIVE} needs to be prepended to PATH for it to pick
up native xml2-config.

> +       oe_runmake
> +}
> +
> +do_install() {
> +       cd ${LLVM_BUILD_DIR}
> +       oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
> +
> +       mv ${LLVM_INSTALL_DIR}${bindir}/${HOST_SYS}-llvm-config-host ${LLVM_INSTALL_DIR}/llvm-config-host
> +
> +       install -d ${D}${bindir}/${LLVM_DIR}
> +       mv ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
> +
> +       install -d ${D}${includedir}/${LLVM_DIR}
> +       mv ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
> +
> +       install -d ${D}${libdir}/${LLVM_DIR}
> +       mv ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
> +       ln -s ${LLVM_DIR}/libLLVM-${LLVM_RELEASE}.so ${D}${libdir}/libLLVM-${LLVM_RELEASE}.so
> +
> +       install -d ${D}${docdir}/${LLVM_DIR}
> +       mv ${LLVM_INSTALL_DIR}${prefix}/docs/llvm/* ${D}${docdir}/${LLVM_DIR}
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
> +
> +llvm_sysroot_preprocess() {
> +       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +       mv ${LLVM_INSTALL_DIR}/llvm-config-host ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${LLVM_RELEASE}
> +}
> --
> 1.8.2.3
>

