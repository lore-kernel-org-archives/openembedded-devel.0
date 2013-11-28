Return-Path: <riku.voipio@linaro.org>
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA0B6D75C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 09:40:39 +0000 (UTC)
Received: by mail-bk0-f42.google.com with SMTP id w11so3706055bkz.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 01:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1i21TM4myf8KNLzpGQYx/0F4RMv/zVGukPWGHEbxJJY=;
	b=cZIINiN9iEI8rCAt1wlJxOoKHpapHg2R/eOZH5fOROi8BG2jGkHNGSh7h2vmhycxNE
	YGx154/FEyW2FtQQXrOCKrCn0dRlPowFLrd2zj5cjllKzLEO9MUGInjH+aOonu8EVZ4L
	BtQTNIW0NVn8UZ4bYIDm3aI3XhPfrC50s38zN5FXaN1wIIkeJyvxJWhbBdmjhcaAXeK3
	VgUyetdLpmiLF1zEuuRLZWqkYll32hB429GBfJzKuzfsDDC9bK/bpWXk/oyj6sgaQ+RI
	GGpFeHITDJyEUyfP+pwspYqPw8QG5w+9xysn87h+4uwIFRha5fDiRo3FtBBKbvt5XTsx
	juKQ==
X-Gm-Message-State: ALoCoQnbpmfYJIKxAc+y2vg+gel+FrVa9/agDcKxGA4hLztxJAz9jxzfBHQm26oehSqdjpdKspSg
MIME-Version: 1.0
X-Received: by 10.204.114.68 with SMTP id d4mr24080161bkq.13.1385631638201;
	Thu, 28 Nov 2013 01:40:38 -0800 (PST)
Received: by 10.204.78.196 with HTTP; Thu, 28 Nov 2013 01:40:38 -0800 (PST)
In-Reply-To: <CAAqcGH=u646zYz-rDx31fes_7OB9KcX+Dj-Aw3FqVXEZv3+pUA@mail.gmail.com>
References: <1385565534-17423-1-git-send-email-riku.voipio@linaro.org>
	<CAMKF1srN9fjvzo8hN=xn4hxSWbSwoa5g3xy=s9Qr2h-DAP4JCA@mail.gmail.com>
	<CAAqcGH=u646zYz-rDx31fes_7OB9KcX+Dj-Aw3FqVXEZv3+pUA@mail.gmail.com>
Date: Thu, 28 Nov 2013 11:40:38 +0200
Message-ID: <CAAqcGHnq4yiJwsXFQSqUjk4m90AW7vYyXvKrr1Zwt03gnhiWJA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 28 Nov 2013 09:40:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 November 2013 09:59, Riku Voipio <riku.voipio@linaro.org> wrote:

> On 27 November 2013 17:46, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wednesday, November 27, 2013, Riku Voipio wrote:
>>
>> > nss has been added to OE-core, so an old copy in meta-browser
>> > is just confusing.
>> >
>> >
>>
>> Can you also report if there are any feature differences between these
>> recipes and one from oe-core ?
>>
>
>
> A quick recap of differences:
>
> - nss in meta-browser skips signing libraries, while in oe-core lets user
> sign libraries on target device
> - nss in meta-browser makes staticdev (*.a) package
> - nss in meta-browser disables parallel make
> - nss in meta-oe enables lowhash support, meta-browser doesn't
>
> So the only thing lost would be staticdev package, which I don't think is
> being used anyway.
>


The nss-staticdev in meta-browser was conflicting with openssl anyways:

WARNING: The recipe openssl is trying to install files into a shared area
when those files already exist. Those files and their manifest location are:
   /srv/oe/build/tmp-eglibc/sysroots/genericarmv7a/usr/lib/libssl.a
   Matched in manifest-genericarmv7a-nss





>
>
> Riku
>
>
>>
>>
>> > Signed-off-by: Riku Voipio <riku.voipio@linaro.org <javascript:;>>
>> > ---
>> >  recipes-support/nss/nss-3.13.3/native_cc.patch    |  55 ----------
>> >  recipes-support/nss/nss-3.13.3/nss.pc.in          |  11 --
>> >  recipes-support/nss/nss-3.13.3/skip_signing.patch |  18 ----
>> >  recipes-support/nss/nss_3.13.3.bb                 | 116
>> > ----------------------
>> >  4 files changed, 200 deletions(-)
>> >  delete mode 100644 recipes-support/nss/nss-3.13.3/native_cc.patch
>> >  delete mode 100644 recipes-support/nss/nss-3.13.3/nss.pc.in
>> >  delete mode 100644 recipes-support/nss/nss-3.13.3/skip_signing.patch
>> >  delete mode 100644 recipes-support/nss/nss_3.13.3.bb
>> >
>> > diff --git a/recipes-support/nss/nss-3.13.3/native_cc.patch
>> > b/recipes-support/nss/nss-3.13.3/native_cc.patch
>> > deleted file mode 100644
>> > index 41d4980..0000000
>> > --- a/recipes-support/nss/nss-3.13.3/native_cc.patch
>> > +++ /dev/null
>> > @@ -1,55 +0,0 @@
>> > -we need to override ARCHFLAG as well since this is set to either -m32
>> or
>> > -m64
>> > -and LDFLAGS add it explicitly which means when NATIVE_CC is defined
>> then
>> > we build
>> > -the objects as 64bit but link them to be 32bit binary which may not fly
>> > -
>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com <javascript:;>>
>> > -Index: mozilla/security/coreconf/mkdepend/Makefile
>> > -===================================================================
>> > ---- mozilla.orig/security/coreconf/mkdepend/Makefile   2013-01-09
>> > 13:23:51.747694602 -0800
>> > -+++ mozilla/security/coreconf/mkdepend/Makefile        2013-01-09
>> > 13:56:27.003734720 -0800
>> > -@@ -64,11 +64,11 @@
>> > - endif
>> > -
>> > - ifdef NATIVE_CC
>> > --CC=$(NATIVE_CC)
>> > -+override CC=$(NATIVE_CC)
>> > - endif
>> > -
>> > - ifdef NATIVE_FLAGS
>> > --OS_CFLAGS=$(NATIVE_FLAGS)
>> > -+override OS_CFLAGS=$(NATIVE_FLAGS)
>> > - endif
>> > -
>> > - include $(DEPTH)/coreconf/rules.mk
>> > -Index: mozilla/security/coreconf/nsinstall/Makefile
>> > -===================================================================
>> > ---- mozilla.orig/security/coreconf/nsinstall/Makefile  2013-01-09
>> > 13:23:51.747694602 -0800
>> > -+++ mozilla/security/coreconf/nsinstall/Makefile       2013-01-09
>> > 13:56:11.775734407 -0800
>> > -@@ -58,11 +58,11 @@
>> > - endif
>> > -
>> > - ifdef NATIVE_CC
>> > --CC=$(NATIVE_CC)
>> > -+override CC=$(NATIVE_CC)
>> > - endif
>> > -
>> > - ifdef NATIVE_FLAGS
>> > --OS_CFLAGS=$(NATIVE_FLAGS)
>> > -+override OS_CFLAGS=$(NATIVE_FLAGS)
>> > - endif
>> > -
>> > - include $(DEPTH)/coreconf/rules.mk
>> > -Index: mozilla/security/coreconf/Linux.mk
>> > -===================================================================
>> > ---- mozilla.orig/security/coreconf/Linux.mk    2013-01-09
>> > 13:50:01.427726808 -0800
>> > -+++ mozilla/security/coreconf/Linux.mk 2013-01-09 13:55:58.815734141
>> -0800
>> > -@@ -98,6 +98,9 @@
>> > - endif
>> > - endif
>> > -
>> > -+ifdef NATIVE_FLAGS
>> > -+    override ARCHFLAG=
>> > -+endif
>> > -
>> > - LIBC_TAG              = _glibc
>> > -
>> > diff --git
>> a/recipes-support/nss/nss-3.13.3/nss.pc.inb/recipes-support/nss/nss-3.13.3/
>> > nss.pc.in
>> > deleted file mode 100644
>> > index abbc850..0000000
>> > --- a/recipes-support/nss/nss-3.13.3/nss.pc.in
>> > +++ /dev/null
>> > @@ -1,11 +0,0 @@
>> > -prefix=OEPREFIX
>> > -exec_prefix=OEEXECPREFIX
>> > -libdir=OELIBDIR
>> > -includedir=OEINCDIR
>> > -
>> > -Name: NSS
>> > -Description: Mozilla Network Security Services
>> > -Version: @VERSION@
>> > -Requires: nspr
>> > -Libs: -L${libdir} -lnss3 -lnssutil3 -lsmime3 -lssl3
>> > -Cflags: -I${includedir} -I${includedir}/mozilla/nss
>> > diff --git a/recipes-support/nss/nss-3.13.3/skip_signing.patch
>> > b/recipes-support/nss/nss-3.13.3/skip_signing.patch
>> > deleted file mode 100644
>> > index 64e440d..0000000
>> > --- a/recipes-support/nss/nss-3.13.3/skip_signing.patch
>> > +++ /dev/null
>> > @@ -1,18 +0,0 @@
>> > -# HG changeset patch
>> > -# User Ted Mielczarek <ted.mielczarek@gmail.com <javascript:;>>
>> > -# Date 1314190279 14400
>> > -# Node ID a993dd883a502a15d0a8acebb7bf31fdbd0fd18f
>> > -# Parent  5a4a2b65e7b4950aa7cadc03aac43489ee314ba7
>> > -[mq]: skip-shlibsigh
>> > -
>> > -diff --git a/security/nss/cmd/shlibsign/Makefile
>> > b/security/nss/cmd/shlibsign/Makefile
>> > ---- a/security/nss/cmd/shlibsign/Makefile
>> > -+++ b/security/nss/cmd/shlibsign/Makefile
>> > -@@ -120,5 +120,6 @@
>> > -       $(call core_abspath,$(NSPR_LIB_DIR)) $(call core_abspath,$<)
>> > - endif
>> > -
>> > -+ifndef SKIP_SHLIBSIGN
>> > - libs install :: $(CHECKLOC)
>> > --
>> > -+endif
>> > diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/
>> > nss_3.13.3.bb
>> > deleted file mode 100644
>> > index ac77547..0000000
>> > --- a/recipes-support/nss/nss_3.13.3.bb
>> > +++ /dev/null
>> > @@ -1,116 +0,0 @@
>> > -DESCRIPTION = "Mozilla's SSL and TLS implementation"
>> > -HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
>> > -
>> > -PR = "r4"
>> > -
>> > -LICENSE = "MPL1.1 GPL LGPL"
>> > -LIC_FILES_CHKSUM = "file://security/nss/manifest.mn
>> > ;md5=d71978748f23eae3156c38ac2a691924"
>> > -
>> > -DEPENDS = "sqlite3 nspr nspr-native"
>> > -
>> > -SRC_URI = "\
>> > -
>> >
>> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_13_3_RTM/src/${PN}-${PV}.tar.gz\
>> > -       file://nss.pc.in \
>> > -       file://skip_signing.patch \
>> > -        file://native_cc.patch \
>> > -"
>> > -
>> > -S = "${WORKDIR}/${P}/mozilla"
>> > -
>> > -SRC_URI[md5sum] = "006cb82fa900e9e664b4b14a9b7810ca"
>> > -SRC_URI[sha256sum] =
>> > "efa10f2c70da4bddabf1a6081964969bb23359b93d6eadbf4739274a77bc3587"
>> > -
>> > -TD = "${S}/tentative-dist"
>> > -
>> > -PARALLEL_MAKE = ""
>> > -
>> > -USE64BIT_x86-64 = "USE_64=1"
>> > -USE64BIT_mips64 = "USE_64=1"
>> > -USE64BIT_mips64el = "USE_64=1"
>> > -USE64BIT ?= ""
>> > -
>> > -do_compile() {
>> > -#      sed -e 's:SOURCE_PREFIX = $(CORE_DEPTH)/\.\./dist:SOURCE_PREFIX
>> =
>> > $(CORE_DEPTH)/dist:' -i ${S}/security/coreconf/source.mk
>> > -       make -C security/nss \
>> > -               build_coreconf \
>> > -               build_dbm \
>> > -               export libs program \
>> > -               MOZILLA_CLIENT=1 \
>> > -               BUILD_OPT=1 \
>> > -               SKIP_SHLIBSIGN=1 \
>> > -               OS_TARGET="Linux" \
>> > -               OS_TARGET_RELEASE="2.6" \
>> > -               OS_TEST="${TARGET_ARCH}" \
>> > -               NSPR_INCLUDE_DIR="${STAGING_INCDIR}/mozilla/nspr" \
>> > -               NSPR_LIB_DIR="${STAGING_LIBDIR}" \
>> > -               SQLITE3_INCLUDE_DIR="${STAGING_INCDIR}" \
>> > -               OPTIMIZER="${CFLAGS}" \
>> > -               NS_USE_GCC=1 \
>> > -               NSS_USE_SYSTEM_SQLITE=1 \
>> > -               NSS_ENABLE_ECC=1 \
>> > -               DEFAULT_COMPILER="${TARGET_CC}" \
>> > -               CC="${CC}" \
>> > -               CCC="${CXX}" \
>> > -               CXX="${CXX}" \
>> > -               RANLIB="${RANLIB}" \
>> > -               NATIVE_CC="${BUILD_CC}" \
>> > -               NATIVE_FLAGS="${BUILD_CFLAGS}" \
>> > -               ${USE64BIT}
>> > -}
>> > -
>> > -do_install() {
>> > -       make -C security/nss \
>> > -               install \
>> > -               MOZILLA_CLIENT=1 \
>> > -               BUILD_OPT=1 \
>> > -               SKIP_SHLIBSIGN=1 \
>> > -               OS_TARGET=Linux \
>> > -               OS_TARGET_RELEASE="2.6" \
>> > -               OS_TEST="${TARGET_ARCH}" \
>> > -               NSPR_INCLUDE_DIR="${STAGING_INCDIR}/mozilla/nspr" \
>> > -               NSPR_LIB_DIR="${STAGING_LIBDIR}" \
>> > -               NS_USE_GCC=1 \
>> > -               NSS_USE_SYSTEM_SQLITE=1 \
>> > -               NSS_ENABLE_ECC=1 \
>> > -               FREEBL_CHILD_BUILD=1 \
>> > -               CC="${CC}" \
>> > -               SOURCE_LIB_DIR="${TD}/${libdir}" \
>> > -               SOURCE_BIN_DIR="${TD}/${bindir}" \
>> > -               ${USE64BIT}
>> > -
>> > -       install -d ${D}/${libdir}
>> > -
>> > -       for shared_lib in ${TD}/${libdir}/*.so*
>> > -       do
>> > -#              oe_libinstall -C ${TD}/${libdir} `basename $shared_lib
>> > .so` ${D}/${libdir}
>> > -               cp $shared_lib ${D}/${libdir}
>> > -#              ln -sf $(basename $shared_lib) ${D}/${libdir}/$(basename
>> > $shared_lib .1oe)
>> > -       done
>> > -
>> > -       install -d ${D}/${includedir}/mozilla/nss
>> > -       install -m 644 -t ${D}/${includedir}/mozilla/nss
>> > ${S}/dist/public/nss/*
>> > -
>> > -       for static_lib in ${TD}/${libdir}/*.a
>> > -       do
>> > -               oe_libinstall -C ${TD}/${libdir} `basename $static_lib
>> .a`
>> > ${D}/${libdir}
>> > -       done
>> > -
>> > -       install -d ${D}/${bindir}
>> > -       for binary in ${TD}/${bindir}/*
>> > -       do
>> > -               install -m 755 -t ${D}/${bindir} $binary
>> > -       done
>> > -
>> > -       install -D ${WORKDIR}/nss.pc.in ${D}${libdir}/pkgconfig/nss.pc
>> > -       sed -i s:@VERSION@:${PV}:g ${D}${libdir}/pkgconfig/nss.pc
>> > -       sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
>> > -       sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
>> > -       sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nss.pc
>> > -       sed -i s:OEEXECPREFIX:${exec_prefix}:g
>> > ${D}${libdir}/pkgconfig/nss.pc
>> > -
>> > -       sed -i s:/usr/local/bin/perl:${bindir}/perl:g
>> ${D}${bindir}/smime
>> > -}
>> > -
>> > -FILES_SOLIBSDEV := ""
>> > -FILES_${PN} += "${base_libdir}/lib*${SOLIBSDEV}
>> > ${libdir}/lib*${SOLIBSDEV}"
>> > -RDEPENDS_${PN} += "perl"
>> > --
>> > 1.8.1.2
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org <javascript:;>
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

