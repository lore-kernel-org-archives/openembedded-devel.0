Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id C5FA06D88C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 15:46:32 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id tp5so11829977ieb.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 07:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UqgmlJ3EZdGeSDtJjchK7ewxShTXHRG0W+XXQDWekgc=;
	b=f6tWT5uLuLg4NGa4KkCMfq85uWr18oKbbtLV52RCeCWNp8HsE9MeP6Lkj+bfIp1Z00
	nE5YTow20NIih7XHrghytA2BIQV2Zsxs1G+6X74M5ICRCRaawuOgO17/tMVpHfRsjEQ3
	nwfALOTF/7gS52Go4prcHQseuN3XdKNGCs+gNZ5B2nV1HUbuAjHgqvQBeLwJ7Up24p9K
	C+5UDsJbZQkAU+xbssLz7ywjcy3zaf6FQjuamDdOLT2qSpYMQAa1+IyR0Dj91ki9GLWU
	u0pj34FPXWG5jqiyNWwMs83NgZ6/GyghwVcCb9QH+V+o54flUZhNdBhslSEgra1CoHLt
	6I6A==
MIME-Version: 1.0
X-Received: by 10.43.132.66 with SMTP id ht2mr24851397icc.26.1385567192460;
	Wed, 27 Nov 2013 07:46:32 -0800 (PST)
Received: by 10.50.79.167 with HTTP; Wed, 27 Nov 2013 07:46:32 -0800 (PST)
In-Reply-To: <1385565534-17423-1-git-send-email-riku.voipio@linaro.org>
References: <1385565534-17423-1-git-send-email-riku.voipio@linaro.org>
Date: Wed, 27 Nov 2013 07:46:32 -0800
Message-ID: <CAMKF1srN9fjvzo8hN=xn4hxSWbSwoa5g3xy=s9Qr2h-DAP4JCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"patches@linaro.org" <patches@linaro.org>
Subject: Re: [meta-browser][PATCH] nss: remove
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
X-List-Received-Date: Wed, 27 Nov 2013 15:46:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wednesday, November 27, 2013, Riku Voipio wrote:

> nss has been added to OE-core, so an old copy in meta-browser
> is just confusing.
>
>

Can you also report if there are any feature differences between these
recipes and one from oe-core ?


> Signed-off-by: Riku Voipio <riku.voipio@linaro.org <javascript:;>>
> ---
>  recipes-support/nss/nss-3.13.3/native_cc.patch    |  55 ----------
>  recipes-support/nss/nss-3.13.3/nss.pc.in          |  11 --
>  recipes-support/nss/nss-3.13.3/skip_signing.patch |  18 ----
>  recipes-support/nss/nss_3.13.3.bb                 | 116
> ----------------------
>  4 files changed, 200 deletions(-)
>  delete mode 100644 recipes-support/nss/nss-3.13.3/native_cc.patch
>  delete mode 100644 recipes-support/nss/nss-3.13.3/nss.pc.in
>  delete mode 100644 recipes-support/nss/nss-3.13.3/skip_signing.patch
>  delete mode 100644 recipes-support/nss/nss_3.13.3.bb
>
> diff --git a/recipes-support/nss/nss-3.13.3/native_cc.patch
> b/recipes-support/nss/nss-3.13.3/native_cc.patch
> deleted file mode 100644
> index 41d4980..0000000
> --- a/recipes-support/nss/nss-3.13.3/native_cc.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -we need to override ARCHFLAG as well since this is set to either -m32 or
> -m64
> -and LDFLAGS add it explicitly which means when NATIVE_CC is defined then
> we build
> -the objects as 64bit but link them to be 32bit binary which may not fly
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com <javascript:;>>
> -Index: mozilla/security/coreconf/mkdepend/Makefile
> -===================================================================
> ---- mozilla.orig/security/coreconf/mkdepend/Makefile   2013-01-09
> 13:23:51.747694602 -0800
> -+++ mozilla/security/coreconf/mkdepend/Makefile        2013-01-09
> 13:56:27.003734720 -0800
> -@@ -64,11 +64,11 @@
> - endif
> -
> - ifdef NATIVE_CC
> --CC=$(NATIVE_CC)
> -+override CC=$(NATIVE_CC)
> - endif
> -
> - ifdef NATIVE_FLAGS
> --OS_CFLAGS=$(NATIVE_FLAGS)
> -+override OS_CFLAGS=$(NATIVE_FLAGS)
> - endif
> -
> - include $(DEPTH)/coreconf/rules.mk
> -Index: mozilla/security/coreconf/nsinstall/Makefile
> -===================================================================
> ---- mozilla.orig/security/coreconf/nsinstall/Makefile  2013-01-09
> 13:23:51.747694602 -0800
> -+++ mozilla/security/coreconf/nsinstall/Makefile       2013-01-09
> 13:56:11.775734407 -0800
> -@@ -58,11 +58,11 @@
> - endif
> -
> - ifdef NATIVE_CC
> --CC=$(NATIVE_CC)
> -+override CC=$(NATIVE_CC)
> - endif
> -
> - ifdef NATIVE_FLAGS
> --OS_CFLAGS=$(NATIVE_FLAGS)
> -+override OS_CFLAGS=$(NATIVE_FLAGS)
> - endif
> -
> - include $(DEPTH)/coreconf/rules.mk
> -Index: mozilla/security/coreconf/Linux.mk
> -===================================================================
> ---- mozilla.orig/security/coreconf/Linux.mk    2013-01-09
> 13:50:01.427726808 -0800
> -+++ mozilla/security/coreconf/Linux.mk 2013-01-09 13:55:58.815734141 -0800
> -@@ -98,6 +98,9 @@
> - endif
> - endif
> -
> -+ifdef NATIVE_FLAGS
> -+    override ARCHFLAG=
> -+endif
> -
> - LIBC_TAG              = _glibc
> -
> diff --git a/recipes-support/nss/nss-3.13.3/nss.pc.inb/recipes-support/nss/nss-3.13.3/
> nss.pc.in
> deleted file mode 100644
> index abbc850..0000000
> --- a/recipes-support/nss/nss-3.13.3/nss.pc.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -prefix=OEPREFIX
> -exec_prefix=OEEXECPREFIX
> -libdir=OELIBDIR
> -includedir=OEINCDIR
> -
> -Name: NSS
> -Description: Mozilla Network Security Services
> -Version: @VERSION@
> -Requires: nspr
> -Libs: -L${libdir} -lnss3 -lnssutil3 -lsmime3 -lssl3
> -Cflags: -I${includedir} -I${includedir}/mozilla/nss
> diff --git a/recipes-support/nss/nss-3.13.3/skip_signing.patch
> b/recipes-support/nss/nss-3.13.3/skip_signing.patch
> deleted file mode 100644
> index 64e440d..0000000
> --- a/recipes-support/nss/nss-3.13.3/skip_signing.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# HG changeset patch
> -# User Ted Mielczarek <ted.mielczarek@gmail.com <javascript:;>>
> -# Date 1314190279 14400
> -# Node ID a993dd883a502a15d0a8acebb7bf31fdbd0fd18f
> -# Parent  5a4a2b65e7b4950aa7cadc03aac43489ee314ba7
> -[mq]: skip-shlibsigh
> -
> -diff --git a/security/nss/cmd/shlibsign/Makefile
> b/security/nss/cmd/shlibsign/Makefile
> ---- a/security/nss/cmd/shlibsign/Makefile
> -+++ b/security/nss/cmd/shlibsign/Makefile
> -@@ -120,5 +120,6 @@
> -       $(call core_abspath,$(NSPR_LIB_DIR)) $(call core_abspath,$<)
> - endif
> -
> -+ifndef SKIP_SHLIBSIGN
> - libs install :: $(CHECKLOC)
> --
> -+endif
> diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/
> nss_3.13.3.bb
> deleted file mode 100644
> index ac77547..0000000
> --- a/recipes-support/nss/nss_3.13.3.bb
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -DESCRIPTION = "Mozilla's SSL and TLS implementation"
> -HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
> -
> -PR = "r4"
> -
> -LICENSE = "MPL1.1 GPL LGPL"
> -LIC_FILES_CHKSUM = "file://security/nss/manifest.mn
> ;md5=d71978748f23eae3156c38ac2a691924"
> -
> -DEPENDS = "sqlite3 nspr nspr-native"
> -
> -SRC_URI = "\
> -
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_13_3_RTM/src/${PN}-${PV}.tar.gz\
> -       file://nss.pc.in \
> -       file://skip_signing.patch \
> -        file://native_cc.patch \
> -"
> -
> -S = "${WORKDIR}/${P}/mozilla"
> -
> -SRC_URI[md5sum] = "006cb82fa900e9e664b4b14a9b7810ca"
> -SRC_URI[sha256sum] =
> "efa10f2c70da4bddabf1a6081964969bb23359b93d6eadbf4739274a77bc3587"
> -
> -TD = "${S}/tentative-dist"
> -
> -PARALLEL_MAKE = ""
> -
> -USE64BIT_x86-64 = "USE_64=1"
> -USE64BIT_mips64 = "USE_64=1"
> -USE64BIT_mips64el = "USE_64=1"
> -USE64BIT ?= ""
> -
> -do_compile() {
> -#      sed -e 's:SOURCE_PREFIX = $(CORE_DEPTH)/\.\./dist:SOURCE_PREFIX =
> $(CORE_DEPTH)/dist:' -i ${S}/security/coreconf/source.mk
> -       make -C security/nss \
> -               build_coreconf \
> -               build_dbm \
> -               export libs program \
> -               MOZILLA_CLIENT=1 \
> -               BUILD_OPT=1 \
> -               SKIP_SHLIBSIGN=1 \
> -               OS_TARGET="Linux" \
> -               OS_TARGET_RELEASE="2.6" \
> -               OS_TEST="${TARGET_ARCH}" \
> -               NSPR_INCLUDE_DIR="${STAGING_INCDIR}/mozilla/nspr" \
> -               NSPR_LIB_DIR="${STAGING_LIBDIR}" \
> -               SQLITE3_INCLUDE_DIR="${STAGING_INCDIR}" \
> -               OPTIMIZER="${CFLAGS}" \
> -               NS_USE_GCC=1 \
> -               NSS_USE_SYSTEM_SQLITE=1 \
> -               NSS_ENABLE_ECC=1 \
> -               DEFAULT_COMPILER="${TARGET_CC}" \
> -               CC="${CC}" \
> -               CCC="${CXX}" \
> -               CXX="${CXX}" \
> -               RANLIB="${RANLIB}" \
> -               NATIVE_CC="${BUILD_CC}" \
> -               NATIVE_FLAGS="${BUILD_CFLAGS}" \
> -               ${USE64BIT}
> -}
> -
> -do_install() {
> -       make -C security/nss \
> -               install \
> -               MOZILLA_CLIENT=1 \
> -               BUILD_OPT=1 \
> -               SKIP_SHLIBSIGN=1 \
> -               OS_TARGET=Linux \
> -               OS_TARGET_RELEASE="2.6" \
> -               OS_TEST="${TARGET_ARCH}" \
> -               NSPR_INCLUDE_DIR="${STAGING_INCDIR}/mozilla/nspr" \
> -               NSPR_LIB_DIR="${STAGING_LIBDIR}" \
> -               NS_USE_GCC=1 \
> -               NSS_USE_SYSTEM_SQLITE=1 \
> -               NSS_ENABLE_ECC=1 \
> -               FREEBL_CHILD_BUILD=1 \
> -               CC="${CC}" \
> -               SOURCE_LIB_DIR="${TD}/${libdir}" \
> -               SOURCE_BIN_DIR="${TD}/${bindir}" \
> -               ${USE64BIT}
> -
> -       install -d ${D}/${libdir}
> -
> -       for shared_lib in ${TD}/${libdir}/*.so*
> -       do
> -#              oe_libinstall -C ${TD}/${libdir} `basename $shared_lib
> .so` ${D}/${libdir}
> -               cp $shared_lib ${D}/${libdir}
> -#              ln -sf $(basename $shared_lib) ${D}/${libdir}/$(basename
> $shared_lib .1oe)
> -       done
> -
> -       install -d ${D}/${includedir}/mozilla/nss
> -       install -m 644 -t ${D}/${includedir}/mozilla/nss
> ${S}/dist/public/nss/*
> -
> -       for static_lib in ${TD}/${libdir}/*.a
> -       do
> -               oe_libinstall -C ${TD}/${libdir} `basename $static_lib .a`
> ${D}/${libdir}
> -       done
> -
> -       install -d ${D}/${bindir}
> -       for binary in ${TD}/${bindir}/*
> -       do
> -               install -m 755 -t ${D}/${bindir} $binary
> -       done
> -
> -       install -D ${WORKDIR}/nss.pc.in ${D}${libdir}/pkgconfig/nss.pc
> -       sed -i s:@VERSION@:${PV}:g ${D}${libdir}/pkgconfig/nss.pc
> -       sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
> -       sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
> -       sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nss.pc
> -       sed -i s:OEEXECPREFIX:${exec_prefix}:g
> ${D}${libdir}/pkgconfig/nss.pc
> -
> -       sed -i s:/usr/local/bin/perl:${bindir}/perl:g ${D}${bindir}/smime
> -}
> -
> -FILES_SOLIBSDEV := ""
> -FILES_${PN} += "${base_libdir}/lib*${SOLIBSDEV}
> ${libdir}/lib*${SOLIBSDEV}"
> -RDEPENDS_${PN} += "perl"
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

