Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A70C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 05:57:23 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.2501.1684907834360048358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 22:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=K5TgZTNW;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-19a5831610dso401744fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 22:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684907833; x=1687499833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGTBlgtdHQwZTPJ4nWk1DkUZa+8/tYAyadw93IXuTpE=;
        b=K5TgZTNWEKeYYlZOeHWmfka44JzKsYnCXRRKcb3g5NgHK/JCUcDN6Ooqvcf+kcWCxI
         X3Ltm0D5gWcs/fgLaAb+SpK+d/PPKzZ9u0nxJErBb6wObLhvgzLRgYYZN+qYDeQcRfHL
         FQMH+bB15s0jsljd2qpt9vAR8AJSmWhaUK1zI+ms+hGdKhDyJa7PJ5DLknkW+b3Qm84f
         IyICAULsHvMKcvef2agYRnNKhB8fLH/tt/LqLIs4wESpGkmI9xJYI7uSQsY+kcmEt90S
         3//x6cnBQ8wwSzGaG/49Q8DHSOMcaJW17bJE7y8Sxtb5ZPQsjb4Ugm1dN9OGPD6ysytu
         Dxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684907833; x=1687499833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGTBlgtdHQwZTPJ4nWk1DkUZa+8/tYAyadw93IXuTpE=;
        b=YRdSQ+gyzGVIjt0ARsmDWCO8lRwnVDPUHpgxsG3onimQHmTU1/GrpqtP60yzSccZd/
         PsJJdRcKW12Ghme7VG2lYgcZBd6iPhvB/DEkKAsNLcogmvkCAT4rhObsoOp7r7SkhdQD
         jmqIW1AfGtzk+QEkf1f1RtYo/+sC/VIRxMMbbHs0noxDMDVDLdhxQnVbBqGn2tT8N5st
         ZGcWUMaMAem5PjX/+6AUaTE9WLNxSXOuoJcRMmnqOpHn5qm9ryzOJTv12HPzG+lt5ExQ
         X4ZTp/za3KIn4cE7HfI38uWJ5QjOlLqp6xWFmlICDN7UhmzQEYJMxSr1BD+nYNme7SX/
         GCGg==
X-Gm-Message-State: AC+VfDyb/+pbDwdTvCbvkJ8FxZ7kKwvw+bMYhFmy49FbumcP8j/7gQbQ
	pnVaLzh//exW3cV3naa919JtoczkixEa+err2qE=
X-Google-Smtp-Source: ACHHUZ4tmQjOGutTD2Ux6T9IrNnohm7ImUPbllgalbRrZGVcKJTxmgllUWxrQHVUr8Jv66LCS+ZTppjwz23ClmS1MVg=
X-Received: by 2002:a05:6808:102:b0:396:12ba:f9d3 with SMTP id
 b2-20020a056808010200b0039612baf9d3mr7991058oie.25.1684907833258; Tue, 23 May
 2023 22:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230523121831.1877208-1-ross.burton@arm.com> <20230523121831.1877208-3-ross.burton@arm.com>
In-Reply-To: <20230523121831.1877208-3-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2023 22:56:47 -0700
Message-ID: <CAMKF1spFeyaU-Ym699XLNOV+cFsG4uvBwRdFx5rnke3jYCYCjg@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/3] gutenprint: rewrite recipe and update
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 05:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102751

seeing this error

https://errors.yoctoproject.org/Errors/Details/704895/

On Tue, May 23, 2023 at 5:18=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> There hasn't been a gutenprint upgrade for quite a while, but a lot of
> fixes upstream, so grab the latest SHA.
>
> This means we can now do out-of-tree builds, so drop the use of
> autotools-brokensep. Also stop autogen.sh from running configure as we
> run it again.
>
> Clean up build dependencies.
>
> Enable NLS, as there's no reason to disable it.
>
> Remove the explicit gutenprint-native recipe, instead use class extension
> and build as little as possible in the native do_compile.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../gutenprint/gutenprint-native_git.bb       | 42 -------------
>  .../gutenprint/gutenprint.inc                 | 22 -------
>  .../gutenprint/gutenprint_git.bb              | 60 +++++++++++++------
>  3 files changed, 43 insertions(+), 81 deletions(-)
>  delete mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint-native=
_git.bb
>  delete mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint.inc
>
> diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb=
 b/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb
> deleted file mode 100644
> index c6e00c340a..0000000000
> --- a/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -# Recipe for building gutenprint-native
> -#
> -# Native part is for generating strings - xmli18n-tmp.h used by target r=
ecipe
> -# We don't depend on cups as this is for generating the string header.
> -#
> -# Copyright (c) Ambu A/S - All rights reserved
> -# SPDX-License-Identifier: MIT
> -#
> -# Author(s)
> -#   clst@ambu.com (Claus Stovgaard)
> -#
> -
> -require gutenprint.inc
> -
> -# We could consider switching to BBCLASSEXTEND native instead of inherit
> -# Using devtool with this results in warning, as devtool append external=
src to
> -# inheritance, making native not being inherited last.
> -inherit autotools-brokensep pkgconfig native
> -
> -SECTION =3D "libs"
> -
> -# binutils is for xz etc.
> -# gettext-native for configuration
> -# flex-native is used for compilation
> -# byacc-native is for yacc command (compilation)
> -DEPENDS +=3D "binutils-native gettext-native flex-native byacc-native"
> -
> -EXTRA_OECONF =3D "--without-doc --without-cups"
> -
> -# gutenprint does not have a configure file in its root folder.
> -# Rather it has a autogen.sh in its root folder. We just use it
> -do_configure() {
> -    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> -    oe_runconf
> -}
> -
> -# Currently we only uses the string header, even though we compile the c=
omplete
> -# native version of the library. So we limit the install to the needed.
> -do_install() {
> -    install -d ${D}${datadir}/gutenprint/
> -    install -m644 ${B}/src/xml/xmli18n-tmp.h ${D}${datadir}/gutenprint/
> -}
> \ No newline at end of file
> diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint.inc b/meta-oe=
/recipes-printing/gutenprint/gutenprint.inc
> deleted file mode 100644
> index 1f712585f7..0000000000
> --- a/meta-oe/recipes-printing/gutenprint/gutenprint.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -# common part for gutenprint-native / gutenprint
> -#
> -# As we are using the native part for generating string header to the ta=
rget
> -# version, it is important they use the same version.
> -# So we set the SRC_URI and SRCREV here.
> -#
> -# Copyright (c) Ambu A/S - All rights reserved
> -# SPDX-License-Identifier: MIT
> -#
> -# Author(s)
> -#   clst@ambu.com (Claus Stovgaard)
> -#
> -
> -DESCRIPTION =3D "Gutenprint printer drivers"
> -HOMEPAGE =3D "http://gimp-print.sourceforge.net/"
> -LICENSE =3D "GPL-2.0-or-later"
> -
> -SRC_URI =3D "git://git.code.sf.net/p/gimp-print/source;protocol=3Dhttps;=
branch=3Dmaster"
> -SRCREV =3D "8e47dc44dd7738302ba9e8fbc1f918461fed0236"
> -S =3D "${WORKDIR}/git"
> -
> -LIC_FILES_CHKSUM =3D "file://${S}/COPYING;md5=3D59530bdf33659b29e73d4adb=
9f9f6552"
> \ No newline at end of file
> diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb b/meta=
-oe/recipes-printing/gutenprint/gutenprint_git.bb
> index 7779793948..abdd3d5e40 100644
> --- a/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
> +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
> @@ -9,38 +9,64 @@
>  #   clst@ambu.com (Claus Stovgaard)
>  #
>
> -require gutenprint.inc
> +DESCRIPTION =3D "Gutenprint printer drivers"
> +HOMEPAGE =3D "http://gimp-print.sourceforge.net/"
> +LICENSE =3D "GPL-2.0-or-later"
>
> -inherit autotools-brokensep pkgconfig
> +SRC_URI =3D "git://git.code.sf.net/p/gimp-print/source;protocol=3Dhttps;=
branch=3Dmaster"
> +SRCREV =3D "66b0a7bc3fd25659a3f295db0ebb39d04e413c01"
> +PV =3D "5.3.3+git${SRCPV}"
>
> -DEPENDS +=3D "cups gutenprint-native"
> +S =3D "${WORKDIR}/git"
>
> -# cups-genppdupdate depend on perl
> -# We also set the path to PERL as else the version in hosttools would be=
 used
> -# with full path
> -RDEPENDS:${PN} =3D "perl "
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
>
> -EXTRA_OECONF =3D "--without-doc --disable-test --disable-nls PERL=3D/usr=
/bin/perl"
> +inherit autotools gettext pkgconfig
>
> -# gutenprint does not have a configure file in its root folder.
> -# Rather it has a autogen.sh in its root folder. We just use it
> -# together with adapting for cross compilation
> -do_configure() {
> +DEPENDS +=3D "cups gutenprint-native"
> +# autogen.sh needs autopoint
> +DEPENDS:class-native =3D "gettext-native"
> +
> +EXTRA_OECONF =3D "--without-doc --disable-test PERL=3D/usr/bin/perl"
> +EXTRA_OECONF:append:class-native =3D " --without-cups"
> +
> +do_configure:prepend:class-target() {
>      # Disable the xmli18n-tmp.h rule
>      # It depend on the local build extract-strings, we are not able to r=
un this
>      # So we are using the xmli18n-tmp.h created by gutenprint-native
>      sed -i 's/all-local: xmli18n-tmp.h xml-stamp/all-local: xml-stamp/' =
 ${S}/src/xml/Makefile.am
>      sed -i 's/dist-hook: xmli18n-tmp.h xml-stamp/dist-hook: xml-stamp/' =
 ${S}/src/xml/Makefile.am
> -    cp ${RECIPE_SYSROOT_NATIVE}${datadir}/gutenprint/xmli18n-tmp.h ${S}/=
src/xml/
> +    # Despite being a generated file, this needs to be in S.
> +    cp ${STAGING_DATADIR_NATIVE}/gutenprint/xmli18n-tmp.h ${S}/src/xml/
> +}
>
> -    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> +do_configure() {
> +    # Need to call autogen.sh as that creates m4/stp_release.m4
> +    cd ${S}
> +    NOCONFIGURE=3D1 ./autogen.sh
> +    cd ${B}
>      oe_runconf
>  }
>
> -# gutenprint install the calibrate.ppm and net.sf.gimp-print.usb-quirks =
in
> -# /usr/share/cups
> +do_install:append() {
> +    # This file contains build paths and isn't very useful, remove it
> +    rm -f ${D}${libdir}/gutenprint/*/config.summary
> +}
> +
> +do_compile:class-native() {
> +    oe_runmake -C ${B}/src/xml
> +}
> +
> +do_install:class-native() {
> +    install -d ${D}${datadir}/gutenprint/
> +    install -m644 ${B}/src/xml/xmli18n-tmp.h ${D}${datadir}/gutenprint/
> +}
> +
>  FILES:${PN} +=3D "${datadir}/cups/*"
> +RDEPENDS:${PN} =3D "perl"
>
>  # Install in /etc/cups when RPM needs DIRFILES to not conflict
>  # https://stackoverflow.com/questions/44762430/why-do-i-get-etc-cups-con=
flicts-between-attempted-installs-in-yocto
> -DIRFILES =3D "1"
> \ No newline at end of file
> +DIRFILES =3D "1"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102734): https://lists.openembedded.org/g/openembedde=
d-devel/message/102734
> Mute This Topic: https://lists.openembedded.org/mt/99085728/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

