Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.7601.1618907930416049952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 01:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p/mVjZBF;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id g17so43331374edm.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DZBHpjooDgxwdILW+MIAUgPW9ASa1xv1BgqMNrRgx+Y=;
        b=p/mVjZBFxZ2WlxHZ6yKVVNzOPAUBKG0fawPRxq9/2nRu8a4mQntId6bW7HmYfbgM0e
         aosRDSXfplhImhNZPv52y0p1hgvngRmPTfzYqsVAD59gm7VT5oe1B1Knxl5dLGHg3Awg
         XzXW0SPzHxHGjZJG1SULBxMfd5Jb4euso9atcWmBjqR0pCHVpmdUlMK69ndg3p7W9EPW
         laOlZtldB4DrWpFJtvk9TlWrpUobOAw6T+ezmCbH0zTD9f1hbnmNOm2QFR0H/jxBWdh0
         H+DWeMabJfU82WiD2160XlmHBS7LrHXjEKjBQdZb8aQsYMazNWAfrE9M83z7V1mAyb/l
         auMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DZBHpjooDgxwdILW+MIAUgPW9ASa1xv1BgqMNrRgx+Y=;
        b=V+GALLUNsoG4G8001x//klRWnGHUQ2P0lMuwmcAeUENu63dlVHO/Td0LM+FI0Aveyo
         SMPxI8+UqTSZKA3RMREIeS33mt/uK9sFViq8Y3uK64LomjNFGOX/Q23ITxYBHuvX96qu
         KwQOHCH6khwKZvsKQXM3bTpaKeVE5yJ05uuUi71fIBbwqYpkIub/OsiZazvIBNpy0TPN
         nvzSdbpY6HL5JYAALSgHZFbhDb+kiZ7M2ccmbJ5ajoK/fKW6QbM/pO3myt4rTuVQQ2Hf
         +5MIV0oKDYBt+2Cg4Lh9wjCR0lPjy0xVZWDpMv8BHBRKgGBfe4CaZf4awQ0FMJ6mW5Jt
         3e0Q==
X-Gm-Message-State: AOAM533Pv98s5oXGbAm43EYW4tRNZiDTiy7ahS9T7s9AS6pN8syIeqQo
	tFK0mSdgyy1DEbriPdfXKtpkUAMcVjYbWNT0s/I=
X-Google-Smtp-Source: ABdhPJyypFmn+lyANAkwfrlD+ooqS/YuNZvRfZ8QpkUI4UE2zYvsJ1/6p5aBm2uGYWjRr1qsLL/quHsYeDT5h6PUsXE=
X-Received: by 2002:aa7:d9cf:: with SMTP id v15mr30717672eds.358.1618907928903;
 Tue, 20 Apr 2021 01:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210419202801.3834-1-u.oelmann@pengutronix.de>
In-Reply-To: <20210419202801.3834-1-u.oelmann@pengutronix.de>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 20 Apr 2021 09:39:43 +0100
Message-ID: <CANPvuRnSx6Hy4VNnPk9WcMcyN+1HBu_hji0dGvfw+RsG5-KbbA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: fix reproducibility
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulrich,

The patches misses the Upstream-Status

Ulrich =C3=96lmann <u.oelmann@pengutronix.de> escreveu no dia segunda,
19/04/2021 =C3=A0(s) 21:28:
>
> Add upstream patches [1] & [2] to automatically detect the availability =
of
> systemd and (currently) never install '50-rc_keymap.conf' at all as the
> prerequisite would be the ability to compile BPF programs which is not s=
upported
> in this recipe (at least not now).
>
> Previously if your distro was not systemd based the existance of the hos=
t
> system's path "/lib/systemd/system" decided if '50-rc_keymap.conf' was i=
nstalled
> or not.
>
> [1] https://git.linuxtv.org/v4l-utils.git/commit/?id=3D3f61e353424fb9ea3=
dce742022b94dfd7ea1ed9f
> [2] https://git.linuxtv.org/v4l-utils.git/commit/?id=3D01f2c6c58e6f4441d=
f7df8e27eb7919f1f01e310
>
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  ...c-autodetect-availability-of-systemd.patch | 45 +++++++++++++++++++
>  ...ct-installation-of-50-rc_keymap.conf.patch | 38 ++++++++++++++++
>  .../v4l2apps/v4l-utils_1.20.0.bb              | 11 ++---
>  3 files changed, 89 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-c=
onfigure.ac-autodetect-availability-of-systemd.patch
>  create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-k=
eytable-restrict-installation-of-50-rc_keymap.conf.patch
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configur=
e.ac-autodetect-availability-of-systemd.patch b/meta-oe/recipes-multimedia/=
v4l2apps/v4l-utils/0008-configure.ac-autodetect-availability-of-systemd.pat=
ch
> new file mode 100644
> index 000000000000..a24b967e2497
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-au=
todetect-availability-of-systemd.patch
> @@ -0,0 +1,45 @@
> +From 3f61e353424fb9ea3dce742022b94dfd7ea1ed9f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Ulrich=3D20=3DC3=3D96lmann?=3D <u.oelmann@pengutronix=
.de>
> +Date: Thu, 4 Mar 2021 14:23:39 +0100
> +Subject: [PATCH] configure.ac: autodetect availability of systemd
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Import systemd's official suggestion [1] how this should be handled in =
packages
> +using autoconf. A side effect of this is the removal of the hardcoded f=
allback
> +path "/lib/systemd/system" which leaks build host information when cros=
s
> +compiling v4l-utils and therefore defeats reproducible builds.
> +
> +[1] https://www.freedesktop.org/software/systemd/man/daemon.html#Instal=
ling%20systemd%20Service%20Files
> +

Upstream-Status: Backport
[https://git.linuxtv.org/v4l-utils.git/commit/?id=3D3f61e353424fb9ea3dce74=
2022b94dfd7ea1ed9f]

> +Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> +Signed-off-by: Sean Young <sean@mess.org>
> +---
> + configure.ac | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 727730c5ccf4..8470116df4b1 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -388,7 +388,15 @@ AC_ARG_WITH(udevdir,
> + AC_ARG_WITH(systemdsystemunitdir,
> +       AS_HELP_STRING([--with-systemdsystemunitdir=3DDIR], [set systemd=
 system unit directory]),
> +       [],
> +-      [with_systemdsystemunitdir=3D`$PKG_CONFIG --variable=3Dsystemdsy=
stemunitdir systemd || echo /lib/systemd/system`])
> ++      [with_systemdsystemunitdir=3Dauto])
> ++AS_IF([test "x$with_systemdsystemunitdir" =3D "xyes" -o "x$with_system=
dsystemunitdir" =3D "xauto"],
> ++      [def_systemdsystemunitdir=3D$($PKG_CONFIG --variable=3Dsystemdsy=
stemunitdir systemd)
> ++       AS_IF([test "x$def_systemdsystemunitdir" =3D "x"],
> ++             [AS_IF([test "x$with_systemdsystemunitdir" =3D "xyes"],
> ++                    [AC_MSG_ERROR([systemd support requested but pkg-c=
onfig unable to query systemd package])])
> ++              with_systemdsystemunitdir=3Dno],
> ++             [with_systemdsystemunitdir=3D"$def_systemdsystemunitdir"]=
)])
> ++AM_CONDITIONAL([HAVE_SYSTEMD], [test "x$with_systemdsystemunitdir" !=
=3D "xno"])
> +
> + # Generic check: works with most distributions
> + def_gconv_dir=3D`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr=
/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; bre=
ak; fi; done`
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable=
-restrict-installation-of-50-rc_keymap.conf.patch b/meta-oe/recipes-multime=
dia/v4l2apps/v4l-utils/0009-keytable-restrict-installation-of-50-rc_keymap.=
conf.patch
> new file mode 100644
> index 000000000000..866eda54ddf4
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restri=
ct-installation-of-50-rc_keymap.conf.patch
> @@ -0,0 +1,38 @@
> +From 01f2c6c58e6f4441df7df8e27eb7919f1f01e310 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Ulrich=3D20=3DC3=3D96lmann?=3D <u.oelmann@pengutronix=
.de>
> +Date: Thu, 4 Mar 2021 14:23:40 +0100
> +Subject: [PATCH] keytable: restrict installation of 50-rc_keymap.conf
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It is only needed if BPF is effectively used and the package is compile=
d for a
> +systemd based target.

Upstream-Status: Backport
[https://git.linuxtv.org/v4l-utils.git/commit/?id=3D01f2c6c58e6f4441df7df8=
e27eb7919f1f01e310]

> +
> +Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> +Signed-off-by: Sean Young <sean@mess.org>
> +---
> + utils/keytable/Makefile.am | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
> +index c5eb414acf2f..eee61f0e0551 100644
> +--- a/utils/keytable/Makefile.am
> ++++ b/utils/keytable/Makefile.am
> +@@ -3,9 +3,13 @@ man_MANS =3D ir-keytable.1 rc_keymap.5
> + sysconf_DATA =3D rc_maps.cfg
> + keytablesystem_DATA =3D $(srcdir)/rc_keymaps/*
> + udevrules_DATA =3D 70-infrared.rules
> ++if WITH_BPF
> ++if HAVE_SYSTEMD
> + if HAVE_UDEVDSYSCALLFILTER
> + systemdsystemunit_DATA =3D 50-rc_keymap.conf
> + endif
> ++endif
> ++endif
> +
> + ir_keytable_SOURCES =3D keytable.c parse.h ir-encode.c ir-encode.h tom=
l.c toml.h keymap.c keymap.h
> +
> +--
> +2.29.2
> +
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb b/m=
eta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> index 3e92d49b4fbb..2261feb56c20 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
> @@ -5,7 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D48da995784905=
6017dc568bbc43d8975 \
>  PROVIDES =3D "libv4l media-ctl"
>
>  DEPENDS =3D "jpeg \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx=
11', '', d)}"
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx=
11', '', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd'=
, '', d)}"
>  DEPENDS_append_libc-musl =3D " argp-standalone"
>  DEPENDS_append_class-target =3D " udev"
>  LDFLAGS_append =3D " -pthread"
> @@ -21,13 +22,14 @@ SRC_URI =3D "http://linuxtv.org/downloads/v4l-utils/=
v4l-utils-${PV}.tar.bz2 \
>             file://export-mediactl-headers.patch \
>             file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-i=
f-ne.patch \
>             file://0007-Do-not-use-getsubopt.patch \
> +           file://0008-configure.ac-autodetect-availability-of-systemd.=
patch \
> +           file://0009-keytable-restrict-installation-of-50-rc_keymap.c=
onf.patch \
>             "
>  SRC_URI[md5sum] =3D "46f9e2c0b2fdccd009da2f7e1aa87894"
>  SRC_URI[sha256sum] =3D "956118713f7ccb405c55c7088a6a2490c32d54300dd9a30=
d8d5008c28d3726f7"
>
>  EXTRA_OECONF =3D "--disable-qv4l2 --enable-shared --with-udevdir=3D${ba=
se_libdir}/udev \
> -                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32 \
> -                --with-systemdsystemunitdir=3D${systemd_system_unitdir}=
"
> +                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
>
>  VIRTUAL-RUNTIME_ir-keytable-keymaps ?=3D "rc-keymaps"
>
> @@ -37,8 +39,7 @@ RPROVIDES_${PN}-dbg +=3D "libv4l-dbg"
>
>  FILES_media-ctl =3D "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
>
> -FILES_ir-keytable =3D "${bindir}/ir-keytable ${base_libdir}/udev/rules.=
d/*-infrared.rules \
> -                     ${systemd_system_unitdir}/systemd-udevd.service.d/=
50-rc_keymap.conf"
> +FILES_ir-keytable =3D "${bindir}/ir-keytable ${base_libdir}/udev/rules.=
d/*-infrared.rules"
>  RDEPENDS_ir-keytable +=3D "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
>
>  FILES_rc-keymaps =3D "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> --
> 2.29.2
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
