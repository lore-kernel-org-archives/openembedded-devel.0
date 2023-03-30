Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EC1C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:50:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.25599.1680184240220215422
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 06:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kC+NevHy;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id br6so24567861lfb.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680184238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkAO2Eaz8bama1KvpdJOFyEYIXQdO89YoEK4jk5A/zg=;
        b=kC+NevHyDFHnS73/gOeuHFDFBJoO+0HzTN06I9W7pxn+5rUYtKn82O4Vyyst/KMIJZ
         KQFgT+y+pVqWfUoS1EU0Kd16IcszhI89vvt72aE4aSriNZNGTs4xbo5ISjQYOoTNMRuS
         yakPfKs+tb+l3HPi1JFCip2i73+5sLP0P5jMF3yMuhifQYEvWyMY+JxWEgCWYhF0oz+M
         bVkrNqKoGr81FBLmW64ldyPhy+WD3s936dez+ZJcG4GA2tBJxN8UTid3IJpx+GnFKeCH
         zNMgfoEd/biOO0f/l3mCVkI6rJ6XUjfD5dirmpRnUA1nJOJo9CQg4NgHPOup9jnjHtBc
         a4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkAO2Eaz8bama1KvpdJOFyEYIXQdO89YoEK4jk5A/zg=;
        b=wX8wep5ZzBb4f2REepJyE2fks/2lkoFjROycGVMG4wuQBjWdfigvLTdAO+udV1TjD8
         08dc/Vpb89Mx+83xNU1ptK5r4gzAnyGjfUXBRUpW+ykyChETTfjvvfNPl7q/2ma/CAi1
         ZTAHc6k56gF+aZT4jj1NUb7Th2rXcYsQ+9fcVs26mroYe37Q2QMN7Yk1w1/WMy5M4fJM
         kCC0dEydVkPts+n3j+434WdB81WBsRfv8YzPNTo/yjU/2zpA3UtBpaF+bZDYVyUxKgxZ
         614TF9Hw45PV39GoiFFsSyiX/fKM1xCKIHVAgEMvuFAP6iAtw/iiQzBMKaxmrR9/7B9r
         iGlQ==
X-Gm-Message-State: AAQBX9duVtsZyG3QjbUR7wX+pV+IV3OquU+moJ/G6Cej5I/jpVe1E/dZ
	UeLFUhKEUSuTcy2IOd/v2Nfl4/8yOlAkTkZPYtE=
X-Google-Smtp-Source: AKy350Z1lK0URu/2KIqpc93ZvjZXyqp3MY6bol0CwrqNX0fkto6dLqlhDSWPNPv404vVmjy1wj0w7ToAlDCrskSudzI=
X-Received: by 2002:ac2:522e:0:b0:4ea:e2f8:5ed6 with SMTP id
 i14-20020ac2522e000000b004eae2f85ed6mr6633581lfl.11.1680184238258; Thu, 30
 Mar 2023 06:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134302.2789448-1-zboszor@gmail.com> <20230330134302.2789448-2-zboszor@gmail.com>
In-Reply-To: <20230330134302.2789448-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 15:50:26 +0200
Message-ID: <CANNYZj9hC+JgW7F-WWbtQ-_Qf5WDcvyPy38pi1BNqgBPJVAUxw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 13:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101838

Meson is specifically configured in yocto to user qemu usermode as the
wrapper to run cross binaries, so can libfprint build configuration be
tweaked to use that? This would avoid all the nasty -native extensions
and modifications.

Alex

On Thu, 30 Mar 2023 at 15:43, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> libfprint is the library used by fprintd.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...001-Optionally-use-native-generators.patch | 111 ++++++++++++++++++
>  .../0002-Make-building-tests-optional.patch   |  47 ++++++++
>  .../libfprint/libfprint_1.94.5.bb             |  45 +++++++
>  3 files changed, 203 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0001-Opti=
onally-use-native-generators.patch
>  create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0002-Make=
-building-tests-optional.patch
>  create mode 100644 meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
>
> diff --git a/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-=
use-native-generators.patch b/meta-oe/recipes-support/libfprint/libfprint/0=
001-Optionally-use-native-generators.patch
> new file mode 100644
> index 000000000..779d78c28
> --- /dev/null
> +++ b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-nat=
ive-generators.patch
> @@ -0,0 +1,111 @@
> +From 4f0f84448dbc46c18d2700ddb45acdee67687574 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> + <zboszor@gmail.com>
> +Date: Thu, 30 Mar 2023 09:45:31 +0200
> +Subject: [PATCH 1/2] Optionally use native generators
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +fprint-list-udev-hwdb and fprint-list-udev-rules are run
> +during the build to generate autosuspend.hwdb and 70-*.rules,
> +respectively.
> +
> +Since they are not marked as "native: true", a cross-compiled
> +version is not possible.
> +
> +Since these binaries are linked with the libfprint_drivers target,
> +marking them as native binaries would also need libfprint_drivers
> +to be duplicated as a native version and possibly other library
> +targets, too.
> +
> +Instead, make it the responsibility of the cross-compiler
> +framework to build the native variant separately and allow
> +the external binaries to be passed in.
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +---
> + libfprint/meson.build | 30 ++++++++++++++++++++----------
> + meson_options.txt     |  8 ++++++++
> + 2 files changed, 28 insertions(+), 10 deletions(-)
> +
> +diff --git a/libfprint/meson.build b/libfprint/meson.build
> +index d3c8b03..2a4de67 100644
> +--- a/libfprint/meson.build
> ++++ b/libfprint/meson.build
> +@@ -301,11 +301,16 @@ libfprint_private_dep =3D declare_dependency(
> +     ]
> + )
> +
> +-udev_hwdb =3D executable('fprint-list-udev-hwdb',
> +-    'fprint-list-udev-hwdb.c',
> +-    dependencies: libfprint_private_dep,
> +-    link_with: libfprint_drivers,
> +-    install: false)
> ++udev_hwdb_cmd =3D get_option('udev_hwdb_cmd')
> ++if udev_hwdb_cmd =3D=3D ''
> ++    udev_hwdb =3D executable('fprint-list-udev-hwdb',
> ++        'fprint-list-udev-hwdb.c',
> ++        dependencies: libfprint_private_dep,
> ++        link_with: libfprint_drivers,
> ++        install: false)
> ++else
> ++    udev_hwdb =3D find_program(udev_hwdb_cmd)
> ++endif
> +
> + udev_hwdb_generator =3D custom_target('udev-hwdb',
> +     output: 'autosuspend.hwdb',
> +@@ -315,12 +320,17 @@ udev_hwdb_generator =3D custom_target('udev-hwdb',
> +     install: false,
> + )
> +
> ++udev_rules_cmd =3D get_option('udev_rules_cmd')
> + if install_udev_rules
> +-    udev_rules =3D executable('fprint-list-udev-rules',
> +-        'fprint-list-udev-rules.c',
> +-        dependencies: libfprint_private_dep,
> +-        link_with: libfprint_drivers,
> +-        install: false)
> ++    if udev_rules_cmd =3D=3D ''
> ++        udev_rules =3D executable('fprint-list-udev-rules',
> ++            'fprint-list-udev-rules.c',
> ++            dependencies: libfprint_private_dep,
> ++            link_with: libfprint_drivers,
> ++            install: false)
> ++    else
> ++        udev_rules =3D find_program(udev_rules_cmd)
> ++    endif
> +
> +     custom_target('udev-rules',
> +         output: '70-@0@.rules'.format(versioned_libname),
> +diff --git a/meson_options.txt b/meson_options.txt
> +index f9b801f..a6f0c4d 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -14,6 +14,10 @@ option('udev_rules_dir',
> +        description: 'Installation path for udev rules',
> +        type: 'string',
> +        value: 'auto')
> ++option('udev_rules_cmd',
> ++       description : 'Optional path for native build of fprint-list-ude=
v-rules',
> ++       type : 'string',
> ++       value : '')
> + option('udev_hwdb',
> +        description: 'Whether to create a udev hwdb for autosuspend (inc=
luded in systemd v248 and later)',
> +        type: 'feature',
> +@@ -22,6 +26,10 @@ option('udev_hwdb_dir',
> +        description: 'Installation path for udev hwdb',
> +        type: 'string',
> +        value: 'auto')
> ++option('udev_hwdb_cmd',
> ++       description : 'Optional path for native build of fprint-list-ude=
v-hwdb',
> ++       type : 'string',
> ++       value : '')
> + option('gtk-examples',
> +        description: 'Whether to build GTK+ example applications',
> +        type: 'boolean',
> +--
> +2.39.2
> +
> diff --git a/meta-oe/recipes-support/libfprint/libfprint/0002-Make-buildi=
ng-tests-optional.patch b/meta-oe/recipes-support/libfprint/libfprint/0002-=
Make-building-tests-optional.patch
> new file mode 100644
> index 000000000..c83ea95e1
> --- /dev/null
> +++ b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-test=
s-optional.patch
> @@ -0,0 +1,47 @@
> +From 8e27d45a7747c9aaf8e619f2de3ad3eae9659da8 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> + <zboszor@gmail.com>
> +Date: Thu, 30 Mar 2023 09:57:35 +0200
> +Subject: [PATCH 2/2] Make building tests optional
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +---
> + meson.build       | 4 +++-
> + meson_options.txt | 4 ++++
> + 2 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 1badb16..05edb8d 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -309,7 +309,9 @@ if get_option('gtk-examples')
> + endif
> +
> + subdir('data')
> +-subdir('tests')
> ++if get_option('tests')
> ++    subdir('tests')
> ++endif
> +
> + pkgconfig =3D import('pkgconfig')
> + pkgconfig.generate(
> +diff --git a/meson_options.txt b/meson_options.txt
> +index a6f0c4d..175710d 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -38,3 +38,7 @@ option('doc',
> +        description: 'Whether to build the API documentation',
> +        type: 'boolean',
> +        value: true)
> ++option('tests',
> ++       description: 'Whether to build the tests',
> ++       type: 'boolean',
> ++       value: true)
> +--
> +2.39.2
> +
> diff --git a/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb b/meta=
-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> new file mode 100644
> index 000000000..b0133409a
> --- /dev/null
> +++ b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> @@ -0,0 +1,45 @@
> +SUMMARY =3D "Library for fingerprint readers"
> +DESCRIPTION =3D "libfprint is an open source software library \
> +designed to make it easy for application developers to add \
> +support for consumer fingerprint readers to their software."
> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/fprint/libfprint=
/"
> +
> +DEPENDS =3D "glib-2.0 libgusb udev libgudev nspr nss pixman cairo"
> +
> +DEPENDS:append:class-target =3D " libfprint-native "
> +
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +
> +#PR =3D "r1"
> +
> +SRCREV =3D "86961a9429d589c387da37351fd6b4ff3caf67ea"
> +
> +SRC_URI =3D " \
> +       git://anongit.freedesktop.org/git/libfprint/libfprint.git;branch=
=3Dmaster;protocol=3Dhttps \
> +       file://0001-Optionally-use-native-generators.patch \
> +       file://0002-Make-building-tests-optional.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig useradd python3native gobject-introspection
> +
> +EXTRA_OEMESON:class-native =3D "-Ddoc=3Dfalse -Dtests=3Dfalse -Dintrospe=
ction=3Dfalse"
> +
> +EXTRA_OEMESON:class-target =3D "-Ddoc=3Dfalse -Dtests=3Dfalse \
> +       -Dudev_hwdb=3Denabled -Dudev_hwdb_dir=3D${sysconfdir}/udev/hwdb.d=
 \
> +       -Dudev_hwdb_cmd=3D${STAGING_BINDIR_NATIVE}/fprint-list-udev-hwdb =
\
> +       -Dudev_rules_cmd=3D${STAGING_BINDIR_NATIVE}/fprint-list-udev-rule=
s \
> +"
> +
> +do_install:append:class-native () {
> +       install -d ${D}${bindir}
> +       install -m0755 ${B}/libfprint/fprint-list-udev-hwdb ${D}${bindir}=
/fprint-list-udev-hwdb
> +       install -m0755 ${B}/libfprint/fprint-list-udev-rules ${D}${bindir=
}/fprint-list-udev-rules
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM:${PN} =3D "fprint"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101836): https://lists.openembedded.org/g/openembedde=
d-devel/message/101836
> Mute This Topic: https://lists.openembedded.org/mt/97950767/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

