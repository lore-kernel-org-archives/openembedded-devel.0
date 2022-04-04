Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B8CC54EC4
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.30880.1649042766139695615
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 20:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UWfqZ8YR;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id kk12so6514720qvb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 20:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qrf4txNZFY46uIfImiAGBVY5lIWU1S4ntiTnzjmfOWg=;
        b=UWfqZ8YRnDzQwItNxkO1+SNgWXD3MJCCouQn5WQdr0NlEt8pgKI7vqlovl9r2GXyEY
         DHn1Nt5pnaaAE6QAhP4vhH4FhqLVqsKlz+zH7+VeRDePD9lJbaor2eusl6712+Y0OJ7p
         12glV5k2K98kVkbmmJF5IaqXPyWgDiiDtH02KuI1dn28tSuKcPDivQy2NYqnFTM5DIxN
         qcLcVMXn2pDHB7UcfwQWTxtQeIT0yLhLWNMWYYMtA8H5i/gXf+O7C3JxJwL0BEdTxol4
         nR/0u8G0B3Ip9Jkd1RqtjHdk7DLf9xmCHeeMdamA9avaNxiHn+XLPozWP7SLbhfJxhe5
         cRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qrf4txNZFY46uIfImiAGBVY5lIWU1S4ntiTnzjmfOWg=;
        b=xKJBz4liJFJvakrodx8eLrLuycx8h0hHqxvtGVECGPmRtt6PTVqNnlgBs2VNAj7zAD
         vzG3M2mRWdN0i9/IYQR3u1LspjLDjLUvaL2IPQ8+NABB18azwFcfLIHxWYgyJGKCPh/u
         94GXu7ZGu5ub8tFiITvOFULOzG+keGj9CTBcoBYtVvEwGKrmlyUpHrl5PWnUbAd1N7m0
         aGx74ApqJR87NsvBlsn4y6R8PGynyq8EJZu33Y2KSeJZJ8TXt3XO8L7NMZirlC8utaox
         H3kkVjmJCD5mqu4aWPr/j/ZrYYzwzOzxb9UOeTtFiVhIqLEaHnG7pv0CH7Od93K+vaoR
         8xgg==
X-Gm-Message-State: AOAM53271IcKLI0PAuaoi6R2RRmU9E+hoUdW1eW+JfxaMTr95qH9aVa+
	iwrhGaNZwM0Ep2kbc0xqRHPJ4GhpCUUlncM9C2A=
X-Google-Smtp-Source: 
 ABdhPJyD54PTU5JmGTNwKAX9OyNuadhM+/zTxOuDkPEyWhFSJ/UaIOifTuMPYK815q2K4hOHtBaCNiVv06n8LaRBDys=
X-Received: by 2002:a0c:f9cc:0:b0:443:cec3:c9b5 with SMTP id
 j12-20020a0cf9cc000000b00443cec3c9b5mr4807082qvo.36.1649042765176; Sun, 03
 Apr 2022 20:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220403173611.3422002-1-schnitzeltony@gmail.com>
 <20220403173611.3422002-14-schnitzeltony@gmail.com>
 <CAMKF1sq+UjWmsh1p96SfkMpwXd8X=22fj5pSPptXV8M=7DksHw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq+UjWmsh1p96SfkMpwXd8X=22fj5pSPptXV8M=7DksHw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Apr 2022 20:25:39 -0700
Message-ID: 
 <CAMKF1sqOtaaPHTUxK=YzutCHPCULBRyN7dievG7J37aXW7ge=g@mail.gmail.com>
Subject: Re: [oe] [PATCH 14/19] upower: upgrade 0.99.13 -> 0.99.17 / build
 with mesom
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96373

On Sun, Apr 3, 2022 at 6:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails on x86_64/systemd with

I should have said sysvinit not systemd here. It works ok with systemd
but not when using sysvinit.

>
> ERROR: upower-0.99.17-r0 do_package: QA Issue: upower:
> Files/directories were installed but not shipped in any package:
>   /usr/rules.d
>   /usr/rules.d/95-upower-hid.rules
>   /usr/rules.d/95-upower-wup.rules
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> upower: 3 installed and not shipped files. [installed-vs-shipped]
>
> For details see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1608/st=
eps/14/logs/stdio
>
> On Sun, Apr 3, 2022 at 10:36 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > Port to meson turned into total overhaul of recipe
> >
> > Version 0.99.17
> > ---------------
> > Released: 2022-03-09
> >
> > Bug fixes:
> > - Fix FD handling issues that may cause lid to not be detected
> >
> > Version 0.99.16
> > ---------------
> > Released: 2022-02-23
> >
> > Bug fixes:
> > - Silence unnecessary udev event warnings
> > - Increase test timeout (#171)
> > - Explicitly link with plist
> > - Fix UpClient reference leak
> > - Fix DisplayDevice state on battery hotplug
> > - Fix critical action to work after it was cancelled (#172)
> >
> > Version 0.99.15
> > ---------------
> > Released: 2022-02-09
> >
> > Bug fixes:
> > - Various build fixes
> > - Update bluetooth device alias when it changes (#169)
> >
> > No info for 0.99.14
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../recipes-support/upower/upower_0.99.13.bb  | 38 ----------------
> >  .../recipes-support/upower/upower_0.99.17.bb  | 44 +++++++++++++++++++
> >  2 files changed, 44 insertions(+), 38 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/upower/upower_0.99.13.bb
> >  create mode 100644 meta-oe/recipes-support/upower/upower_0.99.17.bb
> >
> > diff --git a/meta-oe/recipes-support/upower/upower_0.99.13.bb b/meta-oe=
/recipes-support/upower/upower_0.99.13.bb
> > deleted file mode 100644
> > index 55a735482..000000000
> > --- a/meta-oe/recipes-support/upower/upower_0.99.13.bb
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -DESCRIPTION =3D "UPower is an abstraction for enumerating power device=
s, listening to device events and querying history and statistics. "
> > -LICENSE =3D "GPL-2.0-or-later"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de8fbf1d97a140d1d93b9f14dc=
fbf08"
> > -
> > -DEPENDS =3D "intltool-native libusb1 libgudev glib-2.0 dbus-glib"
> > -
> > -SRC_URI =3D "git://gitlab.freedesktop.org/upower/upower.git;protocol=
=3Dhttps;branch=3Dmaster"
> > -SRCREV =3D "0f6cc0a10be22d7ddd684e1cd851e4364a440494"
> > -S =3D "${WORKDIR}/git"
> > -
> > -UPSTREAM_CHECK_GITTAGREGEX =3D "UPOWER_(?P<pver>\d+(\_\d+)+)"
> > -
> > -inherit autotools pkgconfig gtk-doc gettext gobject-introspection syst=
emd
> > -
> > -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', =
d)}"
> > -PACKAGECONFIG[idevice] =3D "--with-idevice,--without-idevice,libimobil=
edevice libplist"
> > -PACKAGECONFIG[systemd] =3D "--with-systemdutildir=3D${systemd_unitdir}=
 --with-systemdsystemunitdir=3D${systemd_system_unitdir}, \
> > -                          --without-systemdutildir --without-systemdsy=
stemunitdir,systemd"
> > -
> > -EXTRA_OECONF =3D " --with-backend=3Dlinux"
> > -
> > -SYSTEMD_SERVICE:${PN} =3D "upower.service"
> > -# don't start on boot by default - dbus does that on demand
> > -SYSTEMD_AUTO_ENABLE =3D "disable"
> > -
> > -do_configure:prepend() {
> > -    touch ${S}/ABOUT-NLS
> > -    mkdir -p ${S}/build-aux
> > -    touch ${S}/build-aux/config.rpath
> > -    sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am
> > -    sed -i -e 's: doc : :g' ${S}/Makefile.am
> > -}
> > -
> > -RDEPENDS:${PN} +=3D "dbus"
> > -RRECOMMENDS:${PN} +=3D "pm-utils"
> > -FILES:${PN} +=3D "${datadir}/dbus-1/ \
> > -                ${base_libdir}/udev/* \
> > -"
> > diff --git a/meta-oe/recipes-support/upower/upower_0.99.17.bb b/meta-oe=
/recipes-support/upower/upower_0.99.17.bb
> > new file mode 100644
> > index 000000000..d30fcea87
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/upower/upower_0.99.17.bb
> > @@ -0,0 +1,44 @@
> > +SUMMARY =3D "UPower is an abstraction for enumerating power devices"
> > +DESCRIPTION =3D "UPower is an abstraction for enumerating power device=
s, listening to device events and querying history and statistics."
> > +LICENSE =3D "GPL-2.0-or-later"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de8fbf1d97a140d1d93b9f14dc=
fbf08"
> > +
> > +DEPENDS =3D " \
> > +    intltool-native \
> > +    libusb1 \
> > +    libgudev \
> > +    glib-2.0 \
> > +    dbus-glib \
> > +"
> > +
> > +SRC_URI =3D "git://gitlab.freedesktop.org/upower/upower.git;protocol=
=3Dhttps;branch=3Dmaster"
> > +SRCREV =3D "c889154ec8e3e2239db9260d48b2e198d72ba002"
> > +S =3D "${WORKDIR}/git"
> > +
> > +UPSTREAM_CHECK_GITTAGREGEX =3D "UPOWER_(?P<pver>\d+(\_\d+)+)"
> > +
> > +GIR_MESON_ENABLE_FLAG =3D "enabled"
> > +GIR_MESON_DISABLE_FLAG =3D "disabled"
> > +GTKDOC_MESON_OPTION =3D "gtk-doc"
> > +
> > +inherit meson pkgconfig gtk-doc gettext gobject-introspection systemd
> > +
> > +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', =
d)}"
> > +PACKAGECONFIG[idevice] =3D "-Didevice=3Denabled,-Didevice=3Ddisabled,l=
ibimobiledevice libplist"
> > +PACKAGECONFIG[systemd] =3D "-Dsystemdsystemunitdir=3D${systemd_system_=
unitdir},-Dsystemdsystemunitdir=3Dno,systemd"
> > +
> > +EXTRA_OEMESON =3D " \
> > +    -Dos_backend=3Dlinux \
> > +    -Dman=3Dfalse \
> > +"
> > +
> > +SYSTEMD_SERVICE:${PN} =3D "upower.service"
> > +# don't start on boot by default - dbus does that on demand
> > +SYSTEMD_AUTO_ENABLE =3D "disable"
> > +
> > +RDEPENDS:${PN} +=3D "dbus"
> > +RRECOMMENDS:${PN} +=3D "pm-utils"
> > +FILES:${PN} +=3D " \
> > +    ${datadir}/dbus-1/ \
> > +    ${base_libdir}/udev/* \
> > +"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96363): https://lists.openembedded.org/g/openembedd=
ed-devel/message/96363
> > Mute This Topic: https://lists.openembedded.org/mt/90224168/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

