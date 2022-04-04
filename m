Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D88DC54EC5
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.29782.1649035390145033814
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 18:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CDqBCcq3;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id t7so6590004qta.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 18:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wcm54Yhm8lonXboFdmsfO+ozNC3T7+R4ejq9l8qZE2c=;
        b=CDqBCcq3iXX8nAOYV8WdXEBr2OMu3AWcRRxqn4IijgL1aK15iRYcvIn/542cVktPPB
         NhuR3n1MFnyN+eSsRjgDxxWSOwX1mqQtZTTw/95M+lv2x25sKXBOvAE+1YuwlQRtK/Q4
         BgRP721On2rS6E2GU8Vf4AtgvEgZLVXD7HlEhXEwvQCQfdLPlobWpQzWPhL/tmroh4xs
         86uOCYOq5U3v4HLTzmtuMdDt6H/+tVSuTGbFOGEpIGsiRZOoM9lOT6a4CBuH0zOwbDcl
         b1YXa8t6LyfSL499PHvw7SBHgDXIem377kU/6PRjszecL/kDKpCJQ68ltJAHS+s2o9tQ
         F77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wcm54Yhm8lonXboFdmsfO+ozNC3T7+R4ejq9l8qZE2c=;
        b=fuzehH3v+q8/Z+cS6SOQt+/WczKFgSiau6XDoswXSJwHf2TQyoAhcg+d5iZYDgIcmv
         FVHenEjNCW/faFmHuN0UpqtIpNwVFHkX89YtRJ/D/HlU+k6S/oQoEwrQ7HGNhrjSQFS7
         u66Q8d5EyVtTi2af4sBN1ashEUq7h/ErK9brvja1fzEAI9iDmJ4zN3pU8MBnJ8arYvnj
         o2cYsn2SowYYSS/fcs2bWrgkFQtx4HwMScEhIhnEqpzYw0NtW+H6+W8i8ezu07EprwK+
         w8AXH2TCW5519lGzj/R+sg52EJahww9IiiO7jUdbSoexf67ndY5Y6YUbY5KwTqP2fj1r
         tsWg==
X-Gm-Message-State: AOAM530NIqWnbRoJuBj2OJBG3lpuMJIKzoVdoCmck056mz1OZWmew0Bl
	FjGgQrUZK7rq/zws9waF42KMPaWYAWNLu/U9ymD8mCbDCuBeKg==
X-Google-Smtp-Source: 
 ABdhPJwnzDMTS5/kgSB88qw+1uyGSl2x6RPI1DwptuZ44DD/cCDAW3PTsgPGoCahV3CXJDucyZUyrqGpPlpOP0OsN5E=
X-Received: by 2002:ac8:5842:0:b0:2e1:aa10:e7cd with SMTP id
 h2-20020ac85842000000b002e1aa10e7cdmr16082034qth.330.1649035389138; Sun, 03
 Apr 2022 18:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220403173611.3422002-1-schnitzeltony@gmail.com>
 <20220403173611.3422002-14-schnitzeltony@gmail.com>
In-Reply-To: <20220403173611.3422002-14-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Apr 2022 18:22:42 -0700
Message-ID: 
 <CAMKF1sq+UjWmsh1p96SfkMpwXd8X=22fj5pSPptXV8M=7DksHw@mail.gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/96372

fails on x86_64/systemd with

ERROR: upower-0.99.17-r0 do_package: QA Issue: upower:
Files/directories were installed but not shipped in any package:
  /usr/rules.d
  /usr/rules.d/95-upower-hid.rules
  /usr/rules.d/95-upower-wup.rules
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
upower: 3 installed and not shipped files. [installed-vs-shipped]

For details see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1608/step=
s/14/logs/stdio

On Sun, Apr 3, 2022 at 10:36 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Port to meson turned into total overhaul of recipe
>
> Version 0.99.17
> ---------------
> Released: 2022-03-09
>
> Bug fixes:
> - Fix FD handling issues that may cause lid to not be detected
>
> Version 0.99.16
> ---------------
> Released: 2022-02-23
>
> Bug fixes:
> - Silence unnecessary udev event warnings
> - Increase test timeout (#171)
> - Explicitly link with plist
> - Fix UpClient reference leak
> - Fix DisplayDevice state on battery hotplug
> - Fix critical action to work after it was cancelled (#172)
>
> Version 0.99.15
> ---------------
> Released: 2022-02-09
>
> Bug fixes:
> - Various build fixes
> - Update bluetooth device alias when it changes (#169)
>
> No info for 0.99.14
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-support/upower/upower_0.99.13.bb  | 38 ----------------
>  .../recipes-support/upower/upower_0.99.17.bb  | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 38 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/upower/upower_0.99.13.bb
>  create mode 100644 meta-oe/recipes-support/upower/upower_0.99.17.bb
>
> diff --git a/meta-oe/recipes-support/upower/upower_0.99.13.bb b/meta-oe/r=
ecipes-support/upower/upower_0.99.13.bb
> deleted file mode 100644
> index 55a735482..000000000
> --- a/meta-oe/recipes-support/upower/upower_0.99.13.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -DESCRIPTION =3D "UPower is an abstraction for enumerating power devices,=
 listening to device events and querying history and statistics. "
> -LICENSE =3D "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de8fbf1d97a140d1d93b9f14dcfb=
f08"
> -
> -DEPENDS =3D "intltool-native libusb1 libgudev glib-2.0 dbus-glib"
> -
> -SRC_URI =3D "git://gitlab.freedesktop.org/upower/upower.git;protocol=3Dh=
ttps;branch=3Dmaster"
> -SRCREV =3D "0f6cc0a10be22d7ddd684e1cd851e4364a440494"
> -S =3D "${WORKDIR}/git"
> -
> -UPSTREAM_CHECK_GITTAGREGEX =3D "UPOWER_(?P<pver>\d+(\_\d+)+)"
> -
> -inherit autotools pkgconfig gtk-doc gettext gobject-introspection system=
d
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> -PACKAGECONFIG[idevice] =3D "--with-idevice,--without-idevice,libimobiled=
evice libplist"
> -PACKAGECONFIG[systemd] =3D "--with-systemdutildir=3D${systemd_unitdir} -=
-with-systemdsystemunitdir=3D${systemd_system_unitdir}, \
> -                          --without-systemdutildir --without-systemdsyst=
emunitdir,systemd"
> -
> -EXTRA_OECONF =3D " --with-backend=3Dlinux"
> -
> -SYSTEMD_SERVICE:${PN} =3D "upower.service"
> -# don't start on boot by default - dbus does that on demand
> -SYSTEMD_AUTO_ENABLE =3D "disable"
> -
> -do_configure:prepend() {
> -    touch ${S}/ABOUT-NLS
> -    mkdir -p ${S}/build-aux
> -    touch ${S}/build-aux/config.rpath
> -    sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am
> -    sed -i -e 's: doc : :g' ${S}/Makefile.am
> -}
> -
> -RDEPENDS:${PN} +=3D "dbus"
> -RRECOMMENDS:${PN} +=3D "pm-utils"
> -FILES:${PN} +=3D "${datadir}/dbus-1/ \
> -                ${base_libdir}/udev/* \
> -"
> diff --git a/meta-oe/recipes-support/upower/upower_0.99.17.bb b/meta-oe/r=
ecipes-support/upower/upower_0.99.17.bb
> new file mode 100644
> index 000000000..d30fcea87
> --- /dev/null
> +++ b/meta-oe/recipes-support/upower/upower_0.99.17.bb
> @@ -0,0 +1,44 @@
> +SUMMARY =3D "UPower is an abstraction for enumerating power devices"
> +DESCRIPTION =3D "UPower is an abstraction for enumerating power devices,=
 listening to device events and querying history and statistics."
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de8fbf1d97a140d1d93b9f14dcfb=
f08"
> +
> +DEPENDS =3D " \
> +    intltool-native \
> +    libusb1 \
> +    libgudev \
> +    glib-2.0 \
> +    dbus-glib \
> +"
> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/upower/upower.git;protocol=3Dh=
ttps;branch=3Dmaster"
> +SRCREV =3D "c889154ec8e3e2239db9260d48b2e198d72ba002"
> +S =3D "${WORKDIR}/git"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "UPOWER_(?P<pver>\d+(\_\d+)+)"
> +
> +GIR_MESON_ENABLE_FLAG =3D "enabled"
> +GIR_MESON_DISABLE_FLAG =3D "disabled"
> +GTKDOC_MESON_OPTION =3D "gtk-doc"
> +
> +inherit meson pkgconfig gtk-doc gettext gobject-introspection systemd
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> +PACKAGECONFIG[idevice] =3D "-Didevice=3Denabled,-Didevice=3Ddisabled,lib=
imobiledevice libplist"
> +PACKAGECONFIG[systemd] =3D "-Dsystemdsystemunitdir=3D${systemd_system_un=
itdir},-Dsystemdsystemunitdir=3Dno,systemd"
> +
> +EXTRA_OEMESON =3D " \
> +    -Dos_backend=3Dlinux \
> +    -Dman=3Dfalse \
> +"
> +
> +SYSTEMD_SERVICE:${PN} =3D "upower.service"
> +# don't start on boot by default - dbus does that on demand
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +RDEPENDS:${PN} +=3D "dbus"
> +RRECOMMENDS:${PN} +=3D "pm-utils"
> +FILES:${PN} +=3D " \
> +    ${datadir}/dbus-1/ \
> +    ${base_libdir}/udev/* \
> +"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96363): https://lists.openembedded.org/g/openembedded=
-devel/message/96363
> Mute This Topic: https://lists.openembedded.org/mt/90224168/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

