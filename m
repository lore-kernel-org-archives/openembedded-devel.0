Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id EF82E6FA42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Mar 2014 17:13:15 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z11so2477290lbi.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Mar 2014 10:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bMEfaQ/D0xjl3urWLluJ27lXrQ6bjpbM5wNyd678hwg=;
	b=b3bWANSJvEYQ04xVsSuvDps7y2+5EmKPrzMF8TrEwEqv2Rkj6HqHtMry6FCY9wEklN
	NcxWy4ENzKKgAHsrShEvMApXyhUtBRclFdY96FbFSKsYYgGETm8PCAzG32lexF9WHOep
	WlCVF9YxUTnrI2avpBuMOndUj2jjyvdxg9+wOoniikmuwV146RP4cI19HsLbAv4HDV4d
	qurG57xuSUIrlQ5wwRGnagTiI+waTZfzGVLy+DUyFLSHumwBwhaJzP3MhOeeSBve+Cn5
	vjkQthzQYMpiEDoPf7Wp8g83Vk/lYVJvmUY3hum5UHed1nSgf9pUzsrjfKhK/QzUiZs0
	DQ4w==
MIME-Version: 1.0
X-Received: by 10.112.142.68 with SMTP id ru4mr69424lbb.49.1395508395279; Sat,
	22 Mar 2014 10:13:15 -0700 (PDT)
Received: by 10.112.162.100 with HTTP; Sat, 22 Mar 2014 10:13:15 -0700 (PDT)
In-Reply-To: <1395442766-4319-1-git-send-email-andrea.adami@gmail.com>
References: <1395442766-4319-1-git-send-email-andrea.adami@gmail.com>
Date: Sat, 22 Mar 2014 18:13:15 +0100
Message-ID: <CAAQYJAszrjr470jF4Secm69FRXbWEuYyXS7m4uxMWfFTTCG8rg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH v2] klibc: restylize a bit the recipes
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
X-List-Received-Date: Sat, 22 Mar 2014 17:13:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please discard. Patch v3 is following.

Andrea

On Fri, Mar 21, 2014 at 11:59 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> No runtime changes.
> Reorder and fix some typos in the comments.
> Remove unneeded empty do_install from utils.
> Fix bogus PACKAGES_${PN} = "${PN}".
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../recipes-devtools/klibc/klcc-cross_2.0.3.bb     | 24 +++++-----
>  .../klibc/klibc-static-utils_2.0.3.bb              | 13 +++---
>  .../recipes-devtools/klibc/klibc-utils.inc         | 14 ++----
>  .../recipes-devtools/klibc/klibc-utils_2.0.3.bb    | 13 +++---
>  meta-initramfs/recipes-devtools/klibc/klibc.inc    | 52 ++++++++++------------
>  .../recipes-devtools/klibc/klibc_2.0.3.bb          |  9 ++--
>  6 files changed, 52 insertions(+), 73 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
> index 068b3d5..7187ba4 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
> +++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
> @@ -1,25 +1,29 @@
> -require klibc.inc
>  SUMMARY = "The klcc crosscompiler for klibc"
> -
> -SRC_URI += "file://use-env-for-perl.patch"
> -
>  DEPENDS = "klibc"
>
> +require klibc.inc
> +
>  FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
>
> +SRC_URI += "file://use-env-for-perl.patch"
> +
>  inherit cross
>
> +# disable task already run in klibc recipe
> +do_configure[noexec] = "1"
>  do_compile() {
>      oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${target_libdir}/klibc' klcc
>  }
> -
> +# The linux-libc-headers and klibc custom headers are not machine-specific
> +# but are installed into machine sysroot.
> +# Klcc wrapper is hardcoding some of these paths thus, to keep the recipe
> +# arch-specific, we force the rebuild of klcc-cross for each machine.
> +do_compile[vardeps] += "MACHINE"
>  do_install() {
>      install -d ${D}${bindir}
>      install -m 0755 klcc/klcc ${D}${bindir}/${TARGET_PREFIX}klcc
>  }
>
> -# disable task already run in klibc recipe
> -do_configure[noexec] = "1"
>
>  # disable unneeded tasks
>  do_package[noexec] = "1"
> @@ -28,9 +32,3 @@ do_package_write_ipk[noexec] = "1"
>  do_package_write_rpm[noexec] = "1"
>  do_package_write_deb[noexec] = "1"
>  do_package_write_tar[noexec] = "1"
> -
> -# The linux-libc-headers and klibc custom headers are not machine-specific
> -# but are installed into machine sysroot.
> -# Klcc wrapper is hardcoding som eof these paths thus, to keep te recipe
> -# arch-specific, we force the rebuild of klcc-cross for each machine.
> -do_compile[vardeps] += "MACHINE"
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
> index 36d4f12..c835fd6 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
> @@ -1,15 +1,12 @@
> -KLIBC_UTILS_VARIANT = "static"
> -KLIBC_UTILS_PKGNAME = "klibc-static-utils"
> +SUMMARY = "klibc utils for initramfs statically compiled"
>
>  FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
>
> -do_install() {
> -    :
> -}
> -
> -PACKAGES_${PN} = "${PN}"
> +PACKAGES = "${PN}"
>  FILES_${PN} = ""
>
> +KLIBC_UTILS_VARIANT = "static"
> +KLIBC_UTILS_PKGNAME = "klibc-static-utils"
> +
>  require klibc-utils.inc
>  require klibc.inc
> -SUMMARY = "klibc utils for initramfs statically compiled"
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> index a626c96..9014f52 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
> @@ -1,12 +1,6 @@
> -KLIBC_UTILS_VARIANT ?= "shared"
> -KLIBC_UTILS_PKGNAME ?= "klibc-utils"
> -
> -# losetup goes in ${base_sbindir}
> -
> -do_install_append() {
> +do_install() {
>      install -d ${D}${base_bindir}
>      install -d ${D}${base_sbindir}
> -
>      # debian packages kinit + kinit.shared but only sh.shared
>      if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then
>          install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
> @@ -16,7 +10,6 @@ do_install_append() {
>          install -m 755 usr/dash/sh ${D}${base_bindir}/sh
>          install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
>      fi
> -
>      install -m 755 usr/gzip/gzip ${D}${base_bindir}
>      install -m 755 usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir}
>      install -m 755 usr/kinit/ipconfig/${KLIBC_UTILS_VARIANT}/ipconfig ${D}${base_bindir}
> @@ -32,6 +25,7 @@ do_install_append() {
>      install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/halt ${D}${base_bindir}
>      install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/kill ${D}${base_bindir}
>      install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ln ${D}${base_bindir}
> +    # losetup goes in ${base_sbindir}
>      install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/losetup ${D}${base_sbindir}
>      install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
>      install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/minips ${D}${base_bindir}
> @@ -54,15 +48,13 @@ do_install_append() {
>      ln -s gzip ${D}${base_bindir}/zcat
>  }
>
> -EXTRA_KLIBC_DEPS = '${@base_conditional("KLIBC_UTILS_VARIANT", "shared", "${THIS_LIBKLIBC}", "", d)}'
> +EXTRA_KLIBC_DEPS = "${@base_conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
>
>  PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
>
>  python populate_packages_prepend () {
> -
>      base_bin_dir = d.expand('${base_bindir}')
>      do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_links=True, allow_dirs=True)
> -
>      base_sbin_dir = d.expand('${base_sbindir}')
>      do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_dirs=True)
>  }
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
> index d3cebad..fc53bec 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
> @@ -1,15 +1,12 @@
> -KLIBC_UTILS_VARIANT = "shared"
> -KLIBC_UTILS_PKGNAME = "klibc-utils"
> +SUMMARY = "klibc utils for initramfs"
>
>  FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
>
> -do_install() {
> -    :
> -}
> -
> -PACKAGES_${PN} = "${PN}"
> +PACKAGES = "${PN}"
>  FILES_${PN} = ""
>
> +KLIBC_UTILS_VARIANT = "shared"
> +KLIBC_UTILS_PKGNAME = "klibc-utils"
> +
>  require klibc-utils.inc
>  require klibc.inc
> -SUMMARY = "klibc utils for initramfs"
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 983681a..b4f0cab 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -1,44 +1,22 @@
> -DEPENDS = "linux-libc-headers perl-native"
> -SECTION = "libs"
>  DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
>  use with initramfs.  It is deliberately written for small size, \
>  minimal entaglement, and portability, not speed."
> +SECTION = "libs"
>  LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
>  LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
> -
> -# Prevents do_package failures with:
> -# debugsources.list: No such file or directory:
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -
> -KLIBC_ARCH = '${TARGET_ARCH}'
> -KLIBC_ARCH_aarch64 = 'arm64'
> -KLIBC_ARCH_armeb = 'arm'
> -KLIBC_ARCH_mipsel = 'mips'
> -KLIBC_ARCH_x86 = 'i386'
> -KLIBC_ARCH_x86-64 = 'x86_64'
> -KLIBC_ARCH_i486 = 'i386'
> -KLIBC_ARCH_i586 = 'i386'
> -KLIBC_ARCH_i686 = 'i386'
> -KLIBC_ARCH_pentium = 'i386'
> -KLIBC_ARCH_powerpc = 'ppc'
> -KLIBC_ARCH_powerpc64 = 'ppc64'
> -
> -export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
> -
> +DEPENDS = "linux-libc-headers perl-native"
>  SRCREV = "f0440baf7f2dc1d9a25863c184d0a8fb73c4ee6c"
> -SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
>
> +SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
>  SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
>                                   file://armv4-fix-v4bx.patch \
> -"
> +                                 "
>  SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
>                                      file://armv4-fix-v4bx.patch \
> -"
> -
> +                                    "
>  SRC_URI += "file://klibc-linux-libc-dev.patch \
>              file://staging.patch \
> -"
> +            "
>
>  S = "${WORKDIR}/git"
>
> @@ -48,10 +26,26 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
>                  'prefix=${exec_prefix}' \
>                  'INSTALLROOT=${D}' \
>                  'SHLIBDIR=${libdir}' \
> -"
> +                "
> +
> +export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
>
>  do_configure () {
>      ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
>  }
>
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +KLIBC_ARCH = "${TARGET_ARCH}"
> +KLIBC_ARCH_aarch64 = "arm64"
> +KLIBC_ARCH_armeb = "arm"
> +KLIBC_ARCH_mipsel = "mips"
> +KLIBC_ARCH_x86 = "i386"
> +KLIBC_ARCH_x86-64 = "x86_64"
> +KLIBC_ARCH_i486 = "i386"
> +KLIBC_ARCH_i586 = "i386"
> +KLIBC_ARCH_i686 = "i386"
> +KLIBC_ARCH_pentium = "i386"
> +KLIBC_ARCH_powerpc = "ppc"
> +KLIBC_ARCH_powerpc64 = "ppc64"
>  THIS_LIBKLIBC = "libklibc (= ${PV})"
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
> index e97d2c7..bc80f38 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
> @@ -1,23 +1,24 @@
> +SUMMARY = "klibc, a small C library for use with initramfs"
> +
>  do_install() {
>      oe_runmake install
> -
>      # the crosscompiler is packaged by klcc-cross
>      # remove klcc
>      rm ${D}${bindir}/klcc
>      # remove now empty dir
>      rmdir ${D}${bindir}
> -
>      install -d ${D}${libdir}
>      install -m 755 usr/klibc/klibc-*.so ${D}${libdir}
>      (cd  ${D}${libdir}; ln -s klibc-*.so klibc.so)
>  }
>
>  PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
> +
>  FILES_libklibc = "${libdir}/klibc-*.so"
>  FILES_libklibc-staticdev = "${libdir}/klibc/lib/libc.a"
>  FILES_libklibc-dev = "${libdir}/klibc.so \
>                        ${libdir}/klibc/lib/* \
>                        ${libdir}/klibc/include/* \
> -"
> +                      "
> +
>  require klibc.inc
> -SUMMARY = "klibc, a small C library for use with initramfs"
> --
> 1.8.1.5
>

