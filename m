Return-Path: <net147@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id CD73E60420
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2013 01:40:20 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hf12so847861vcb.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2013 18:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SVVKxhbaW4O69lgcby3+uf84YEeUgGLX+dUe1ZR3LVk=;
	b=Pe97N6IzyG2Lk9XveQc6HTebn5vbDHsuZrnAsz35BpHvRwE68+EZuesMWyGqSWhF2Y
	HwEFXE1h0kUKzb50W+6JDW9LRt9vs9q4whgZnSFhq7PRQ7j14GH7HhxNf68UDIhrvPN9
	MjXcsMk7sQBGEy5MHMYTdGi+BC7fYfaLCkGBXmJOAJz4s7yTNF1YPme0fS4sp3GlCx2o
	HnfjOmCweIeGOkWNJjZHs0w1gpi7ItJMPQR4pxmvk5OdcYRHJ/0ONaIEpFvZnquYx0Br
	WTw3xgv28OZwM+IySuu07g6jZDDtC+UlwfQjjlJrd3Gr7YX0Ffn7PTWsF63yeTllFwQ5
	oJlw==
MIME-Version: 1.0
X-Received: by 10.221.7.67 with SMTP id on3mr15955850vcb.70.1370223621323;
	Sun, 02 Jun 2013 18:40:21 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Sun, 2 Jun 2013 18:40:21 -0700 (PDT)
In-Reply-To: <1370223042-27086-1-git-send-email-net147@gmail.com>
References: <1370223042-27086-1-git-send-email-net147@gmail.com>
Date: Mon, 3 Jun 2013 11:40:21 +1000
Message-ID: <CANwerB1V_oLGGCsHuvBqtxSiDLACjsOPQ5O9+7KZ8gZiJorOzQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] llvm3.2: new recipe
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
X-List-Received-Date: Mon, 03 Jun 2013 01:40:21 -0000
Content-Type: text/plain; charset=UTF-8

On 3 June 2013 11:30, Jonathan Liu <net147@gmail.com> wrote:
> arm_fenv_uclibc.patch was copied from llvm2.9 recipe.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../llvm/llvm3.2/arm_fenv_uclibc.patch             |  14 +++
>  meta-oe/recipes-core/llvm/llvm3.2_3.2.bb           | 114 +++++++++++++++++++++
>  2 files changed, 128 insertions(+)
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
> index 0000000..0796e22
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
> @@ -0,0 +1,114 @@
> +DESCRIPTION = "The Low Level Virtual Machine"
> +HOMEPAGE = "http://llvm.org"
> +# 3-clause BSD-like
> +LICENSE = "NCSA"
> +LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=60fdd7739841f04a2ce2171a726be8f3"
> +
> +DEPENDS = "libffi llvm-common"
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
> +LLVM_ARCH = "${@get_llvm_arch(d)}"
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
> +                 --enable-targets=${LLVM_ARCH}"
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
> +
> +       # Fails to build unless using separate directory from source
> +       mkdir -p ${LLVM_BUILD_DIR}
> +       cd ${LLVM_BUILD_DIR}
> +}
> +
> +do_compile() {
> +       cd ${LLVM_BUILD_DIR}
> +       oe_runmake CC=${BUILD_CC} CXX=${BUILD_CXX} cross-compile-build-tools
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
> +
> +def get_llvm_arch(d):
> +    import bb;
> +
> +    arch = bb.data.getVar('TARGET_ARCH', d, 1)
> +
> +    if arch == "x86_64" or arch == "i486" or arch == "i586" or arch == "i686":
> +        arch = "x86"
> +    elif arch == "x86_64":
> +        arch = "x86_64"
> +    elif arch == "arm":
> +        arch = "arm"
> +    elif arch == "mipsel" or arch == "mips":
> +        arch = "mips"
> +    elif arch == "powerpc" or arch == "powerpc64":
> +        arch = "powerpc"
> +
> +    return arch
I will try to get rid of get_llvm_arch() function for v3 patch.

Regards,
Jonathan

> --
> 1.8.2.3
>

