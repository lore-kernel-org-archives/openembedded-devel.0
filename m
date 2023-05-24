Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F07FC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 06:08:13 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.2593.1684908488906045713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 23:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PdRLv/tm;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-39817f3e08eso244939b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908488; x=1687500488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spuIKbd9LbdJ5ZM73ZB9nUKVoXu19Tulmu2gDs8+JTE=;
        b=PdRLv/tmiJJG5Ru8swSyWe6jL43Ny11F16Xa8QIsi5icFPr+ybQKm/zU/Y/y6nJEO2
         TQwirq4Gry3AnZAUWGRv34Nj4EJa2D+swZZkLUT1gf8CJys0/PUSLQGyRpS0uVW0DmK9
         30ID1sXS3rNxKCefi8B2b4V2XkziisCSc6Nfr2wCAFG1snHMOHS4ZVScgega5zjMOB8x
         SktAyMkW8OrdL6GUb7hrfYujBfdzFUkqmoKZdHZ0MeDAL81iAmFu+QjDtG20SXgQ52Uy
         vNfpzSYFFKVAgNRiAYqQixBYOqdXZk8wFPmkriNG2PuR4dGgnoEh5B3+1jytdSfMzhts
         mwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908488; x=1687500488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spuIKbd9LbdJ5ZM73ZB9nUKVoXu19Tulmu2gDs8+JTE=;
        b=Q8yFsYTcqFBCImvgjmEc2i4gXIvZsfy7/ylYXn7hBEyiAPcnFnQzeUvHUXMeCW4TZa
         om0IwJstzoPH6kclmTowM77d8cIWQ/rDaJ28Tk8EtmoCZMPz3bHIcdecHq3anXLTn8Ko
         /am3u6aqiBwaoW3JoeWhaA7NTuUrPscTRVlZLyuD2/aBKGK3kJUwQDFFJl5fXnT9+5hI
         Covs0EhDtYBEGDlmDsUe5djhYTmhOJXckEBvT0OgMPkHYx1tSi23dfV/IeSKkhHmuruV
         Zs5pD56RX1jYlnzzG5B+pWdWs17UuGoeR4jIrO2xNaZZO0yq6B++MZmlO2ZPgD4V5/MU
         gGlw==
X-Gm-Message-State: AC+VfDyGdq4R4ra/k0TgseHe7NZqNVNeaAinoBeNqmItTEgOijI/RtCJ
	NGWyUXNY/xAJBG1nkPv/2SA39t0/AMvirMa/Ut8=
X-Google-Smtp-Source: ACHHUZ41O6+NlBr+AukWloOnW5ZUb0m1Tbw0Q3Fsgm4ERgOXFOoEPmOmTJVncMkVBIyRv1f9VcZzu4b1tCROZl6lf3s=
X-Received: by 2002:a54:460e:0:b0:398:948:db7f with SMTP id
 p14-20020a54460e000000b003980948db7fmr4381995oip.6.1684908487795; Tue, 23 May
 2023 23:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230523121831.1877208-1-ross.burton@arm.com> <20230523121831.1877208-3-ross.burton@arm.com>
 <CAMKF1spFeyaU-Ym699XLNOV+cFsG4uvBwRdFx5rnke3jYCYCjg@mail.gmail.com>
In-Reply-To: <CAMKF1spFeyaU-Ym699XLNOV+cFsG4uvBwRdFx5rnke3jYCYCjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2023 23:07:41 -0700
Message-ID: <CAMKF1sqnmKP0LU4QPet7Gm_ZXzKtgnvC+H=JRNHvVbn8X2PzEQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/3] gutenprint: rewrite recipe and update
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 06:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102752

also this

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2767

On Tue, May 23, 2023 at 10:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> seeing this error
>
> https://errors.yoctoproject.org/Errors/Details/704895/
>
> On Tue, May 23, 2023 at 5:18=E2=80=AFAM Ross Burton <ross.burton@arm.com>=
 wrote:
> >
> > From: Ross Burton <ross.burton@arm.com>
> >
> > There hasn't been a gutenprint upgrade for quite a while, but a lot of
> > fixes upstream, so grab the latest SHA.
> >
> > This means we can now do out-of-tree builds, so drop the use of
> > autotools-brokensep. Also stop autogen.sh from running configure as we
> > run it again.
> >
> > Clean up build dependencies.
> >
> > Enable NLS, as there's no reason to disable it.
> >
> > Remove the explicit gutenprint-native recipe, instead use class extensi=
on
> > and build as little as possible in the native do_compile.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../gutenprint/gutenprint-native_git.bb       | 42 -------------
> >  .../gutenprint/gutenprint.inc                 | 22 -------
> >  .../gutenprint/gutenprint_git.bb              | 60 +++++++++++++------
> >  3 files changed, 43 insertions(+), 81 deletions(-)
> >  delete mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint-nati=
ve_git.bb
> >  delete mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint.inc
> >
> > diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.=
bb b/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb
> > deleted file mode 100644
> > index c6e00c340a..0000000000
> > --- a/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -# Recipe for building gutenprint-native
> > -#
> > -# Native part is for generating strings - xmli18n-tmp.h used by target=
 recipe
> > -# We don't depend on cups as this is for generating the string header.
> > -#
> > -# Copyright (c) Ambu A/S - All rights reserved
> > -# SPDX-License-Identifier: MIT
> > -#
> > -# Author(s)
> > -#   clst@ambu.com (Claus Stovgaard)
> > -#
> > -
> > -require gutenprint.inc
> > -
> > -# We could consider switching to BBCLASSEXTEND native instead of inher=
it
> > -# Using devtool with this results in warning, as devtool append extern=
alsrc to
> > -# inheritance, making native not being inherited last.
> > -inherit autotools-brokensep pkgconfig native
> > -
> > -SECTION =3D "libs"
> > -
> > -# binutils is for xz etc.
> > -# gettext-native for configuration
> > -# flex-native is used for compilation
> > -# byacc-native is for yacc command (compilation)
> > -DEPENDS +=3D "binutils-native gettext-native flex-native byacc-native"
> > -
> > -EXTRA_OECONF =3D "--without-doc --without-cups"
> > -
> > -# gutenprint does not have a configure file in its root folder.
> > -# Rather it has a autogen.sh in its root folder. We just use it
> > -do_configure() {
> > -    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> > -    oe_runconf
> > -}
> > -
> > -# Currently we only uses the string header, even though we compile the=
 complete
> > -# native version of the library. So we limit the install to the needed=
.
> > -do_install() {
> > -    install -d ${D}${datadir}/gutenprint/
> > -    install -m644 ${B}/src/xml/xmli18n-tmp.h ${D}${datadir}/gutenprint=
/
> > -}
> > \ No newline at end of file
> > diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint.inc b/meta-=
oe/recipes-printing/gutenprint/gutenprint.inc
> > deleted file mode 100644
> > index 1f712585f7..0000000000
> > --- a/meta-oe/recipes-printing/gutenprint/gutenprint.inc
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -# common part for gutenprint-native / gutenprint
> > -#
> > -# As we are using the native part for generating string header to the =
target
> > -# version, it is important they use the same version.
> > -# So we set the SRC_URI and SRCREV here.
> > -#
> > -# Copyright (c) Ambu A/S - All rights reserved
> > -# SPDX-License-Identifier: MIT
> > -#
> > -# Author(s)
> > -#   clst@ambu.com (Claus Stovgaard)
> > -#
> > -
> > -DESCRIPTION =3D "Gutenprint printer drivers"
> > -HOMEPAGE =3D "http://gimp-print.sourceforge.net/"
> > -LICENSE =3D "GPL-2.0-or-later"
> > -
> > -SRC_URI =3D "git://git.code.sf.net/p/gimp-print/source;protocol=3Dhttp=
s;branch=3Dmaster"
> > -SRCREV =3D "8e47dc44dd7738302ba9e8fbc1f918461fed0236"
> > -S =3D "${WORKDIR}/git"
> > -
> > -LIC_FILES_CHKSUM =3D "file://${S}/COPYING;md5=3D59530bdf33659b29e73d4a=
db9f9f6552"
> > \ No newline at end of file
> > diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb b/me=
ta-oe/recipes-printing/gutenprint/gutenprint_git.bb
> > index 7779793948..abdd3d5e40 100644
> > --- a/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
> > +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
> > @@ -9,38 +9,64 @@
> >  #   clst@ambu.com (Claus Stovgaard)
> >  #
> >
> > -require gutenprint.inc
> > +DESCRIPTION =3D "Gutenprint printer drivers"
> > +HOMEPAGE =3D "http://gimp-print.sourceforge.net/"
> > +LICENSE =3D "GPL-2.0-or-later"
> >
> > -inherit autotools-brokensep pkgconfig
> > +SRC_URI =3D "git://git.code.sf.net/p/gimp-print/source;protocol=3Dhttp=
s;branch=3Dmaster"
> > +SRCREV =3D "66b0a7bc3fd25659a3f295db0ebb39d04e413c01"
> > +PV =3D "5.3.3+git${SRCPV}"
> >
> > -DEPENDS +=3D "cups gutenprint-native"
> > +S =3D "${WORKDIR}/git"
> >
> > -# cups-genppdupdate depend on perl
> > -# We also set the path to PERL as else the version in hosttools would =
be used
> > -# with full path
> > -RDEPENDS:${PN} =3D "perl "
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9=
f6552"
> >
> > -EXTRA_OECONF =3D "--without-doc --disable-test --disable-nls PERL=3D/u=
sr/bin/perl"
> > +inherit autotools gettext pkgconfig
> >
> > -# gutenprint does not have a configure file in its root folder.
> > -# Rather it has a autogen.sh in its root folder. We just use it
> > -# together with adapting for cross compilation
> > -do_configure() {
> > +DEPENDS +=3D "cups gutenprint-native"
> > +# autogen.sh needs autopoint
> > +DEPENDS:class-native =3D "gettext-native"
> > +
> > +EXTRA_OECONF =3D "--without-doc --disable-test PERL=3D/usr/bin/perl"
> > +EXTRA_OECONF:append:class-native =3D " --without-cups"
> > +
> > +do_configure:prepend:class-target() {
> >      # Disable the xmli18n-tmp.h rule
> >      # It depend on the local build extract-strings, we are not able to=
 run this
> >      # So we are using the xmli18n-tmp.h created by gutenprint-native
> >      sed -i 's/all-local: xmli18n-tmp.h xml-stamp/all-local: xml-stamp/=
'  ${S}/src/xml/Makefile.am
> >      sed -i 's/dist-hook: xmli18n-tmp.h xml-stamp/dist-hook: xml-stamp/=
'  ${S}/src/xml/Makefile.am
> > -    cp ${RECIPE_SYSROOT_NATIVE}${datadir}/gutenprint/xmli18n-tmp.h ${S=
}/src/xml/
> > +    # Despite being a generated file, this needs to be in S.
> > +    cp ${STAGING_DATADIR_NATIVE}/gutenprint/xmli18n-tmp.h ${S}/src/xml=
/
> > +}
> >
> > -    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> > +do_configure() {
> > +    # Need to call autogen.sh as that creates m4/stp_release.m4
> > +    cd ${S}
> > +    NOCONFIGURE=3D1 ./autogen.sh
> > +    cd ${B}
> >      oe_runconf
> >  }
> >
> > -# gutenprint install the calibrate.ppm and net.sf.gimp-print.usb-quirk=
s in
> > -# /usr/share/cups
> > +do_install:append() {
> > +    # This file contains build paths and isn't very useful, remove it
> > +    rm -f ${D}${libdir}/gutenprint/*/config.summary
> > +}
> > +
> > +do_compile:class-native() {
> > +    oe_runmake -C ${B}/src/xml
> > +}
> > +
> > +do_install:class-native() {
> > +    install -d ${D}${datadir}/gutenprint/
> > +    install -m644 ${B}/src/xml/xmli18n-tmp.h ${D}${datadir}/gutenprint=
/
> > +}
> > +
> >  FILES:${PN} +=3D "${datadir}/cups/*"
> > +RDEPENDS:${PN} =3D "perl"
> >
> >  # Install in /etc/cups when RPM needs DIRFILES to not conflict
> >  # https://stackoverflow.com/questions/44762430/why-do-i-get-etc-cups-c=
onflicts-between-attempted-installs-in-yocto
> > -DIRFILES =3D "1"
> > \ No newline at end of file
> > +DIRFILES =3D "1"
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102734): https://lists.openembedded.org/g/openembed=
ded-devel/message/102734
> > Mute This Topic: https://lists.openembedded.org/mt/99085728/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

