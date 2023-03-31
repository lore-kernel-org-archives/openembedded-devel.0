Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CB3C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 17:42:32 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.1355.1680284545377988300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 10:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dUJ5Itod;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-177ca271cb8so23966039fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 10:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680284544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPlhD9jc5GmTj9+SHcrcunxQPOEHyKOHYkQZHtnZSN8=;
        b=dUJ5ItodHamoRRZb8vubmQvjhMLvh8b+homxTqNs/afTYW/Po3NLGnY82OsdV867xo
         4n091YBY5chFJ4qNriAP4oqu9fbOc3Q5FxO5Q+m7ojIVjMN84cZ1m1sHADhg+b4UHSv5
         Fi0SSCMz+AaAGYF0FzTnVaQB/PHoYQ1+wh8c6Mho/rd5/8jQinSWVLAU7fJPS67TQv2T
         A4duP5vg1lCxH/hUtIOcBuu/HkAOh8xoiyuiDcCISqN75LJPzJboAZYvC2iMTexYlPdf
         wOcHsfvNv8HhTYl1I2mb+uaULU8SrSodTH4xUXI5IPv7i+tY7OZBHJym60du7OdKkByd
         IZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPlhD9jc5GmTj9+SHcrcunxQPOEHyKOHYkQZHtnZSN8=;
        b=iGnQiZVIvAZt4Wy0W1DAJBLeD3uwMB6fw3w+wGT/dvqIZ8sYNtXUJCwl9TjQm17vCx
         U1Fw7LGAG7Kqd95cJBhm1Av0VuIETzSRy6iTUTlUXePfGiRgINVGP72RWLa8bk+HXOFN
         c1EcKR5pbqpqaS7sNX5lApkFlqxQ6mXbhi5hiqgaz3XRjZs3hl4+7zxuSLwfdX9kGSAT
         pztKLAa3UkOMsITVMqw8l25aVTl7OoS3oH44VTEcWi0BH8ox2EZP0xw4YVPl/WYXzaPI
         C8F5q1ADmH1BE9tWsTCL/OTgDJviPGh0YPSiX7/YVhpYyCAzjiuVlBenvVqfqeiHD+3I
         PVNA==
X-Gm-Message-State: AAQBX9fCAeHut2mifNrvY3lm1NDa3C5Ua79hTxTe6zUBsOKJKY6NrobW
	L6gykTriZT1ZJn/WdSRPcAOUidvsYxeQE6dlFblsq+XwyvM=
X-Google-Smtp-Source: AKy350YXXdNyOSFcgfFYq7jUSY+YnKE3pjh3boQCyyI2p2T7g99+Z+7H9PXR3zyAtgOHtpDACt5Q9du/2oI+I9CNS04=
X-Received: by 2002:a05:6871:8e9c:b0:177:b393:4009 with SMTP id
 zq28-20020a0568718e9c00b00177b3934009mr9050922oab.4.1680284544370; Fri, 31
 Mar 2023 10:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134302.2789448-1-zboszor@gmail.com> <20230330134302.2789448-2-zboszor@gmail.com>
In-Reply-To: <20230330134302.2789448-2-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Mar 2023 10:41:58 -0700
Message-ID: <CAMKF1srTH30WD2-eaK66bCU9wjmF-XsrxCfQzT1SJy375n=mHA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 17:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101862

It needs to address native deps on udev-native I am seeing

ERROR: Nothing PROVIDES 'udev-native' (but
virtual:native:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-=
support/libfprint/libfprint_1.94.5.bb
DEPENDS on or otherwise requires it).

On Thu, Mar 30, 2023 at 6:43=E2=80=AFAM Zoltan Boszormenyi <zboszor@gmail.c=
om> wrote:
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
> Mute This Topic: https://lists.openembedded.org/mt/97950767/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

