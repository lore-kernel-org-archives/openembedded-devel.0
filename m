Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709D9C76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 12:55:38 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.20260.1680353728119995380
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Apr 2023 05:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/ieWc3i;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id q27so17913073oiw.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680353727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaGbeoDOUn9x2EGejREiOJfyUQPJtBz4302GAJS9rBk=;
        b=m/ieWc3isCd0Oj1YagOiyNSJU9g16InA51ub+1lYJNCLPe9OjcmbihldF7g/MLxvzp
         w4M8vElJAzZeCo7kPusYihRYjQF3bQTeNbvehJy+BSFJyw+dBB53uyUU+9iJxI9BXYih
         OcRh/sv+GzyUj/m/htgc5q3au77ZA9SrBUgIOt1ThKW1D47EqH44JZw96lJEkmehH2Qx
         szUH8pvfuRS82+KHwNG/QhsKsJpppD1hVoStgrbKCA4Gz4bljs34NJSxLgmiAqsrZ9VD
         poKi/b5uFVHnfXz5R37TzFQIy3/yOQ8KhLMBNm4yXAx8jeSJM//DhhXicC9dOQq+E6Nh
         OA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680353727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaGbeoDOUn9x2EGejREiOJfyUQPJtBz4302GAJS9rBk=;
        b=r9Gyz/3KT7HVNlhKDT/FKru8VMyVTmKZK6FUb4WI9O1SuNSZjf3ZqtvBOY+I3m1RTY
         OiXF2PEhUmOtjD325mnaDRQWYbrGkw3xMig+1mVDTcYgeg1T8sS0+LNBV6MoppjpI45m
         PKk4EBU+UZVb2Wg2Lw+uyYxJRPm3ZccVN/5KVquhki89FQkVGfgqaORlyvAoayPBkAu7
         u5f6UkxS4AR7y39jZzHrGdljkbXZ9CjXKpaAmiPj79aus3rtqYAwYitF2odLNTZNk6VX
         5l+vXTQtjHKxwS+OSDx/H1/63QgqhLOdHsc4aBa3A3t0/uFWNlxNHh5HzQISgLwNebmA
         G7uw==
X-Gm-Message-State: AAQBX9fXpJREddlLIrqIbjl7FAp8pKw3qye6tWg/F8LTLo9a6iPygBKr
	D9PewR8NyJkiML1EGwUHsel85R9m2EUyjs9WApg=
X-Google-Smtp-Source: AKy350b3WUQheGunhjFhuSsbT2j2oJhQKHpoVGsFyXVn2CKyhC5kKwBXihAdIf4/jQi/rjN/6rD9b/NYu0hiYk9caHU=
X-Received: by 2002:a54:450a:0:b0:389:53dc:cdf2 with SMTP id
 l10-20020a54450a000000b0038953dccdf2mr5035099oil.4.1680353727125; Sat, 01 Apr
 2023 05:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134302.2789448-1-zboszor@gmail.com> <20230330134302.2789448-2-zboszor@gmail.com>
 <CAMKF1srTH30WD2-eaK66bCU9wjmF-XsrxCfQzT1SJy375n=mHA@mail.gmail.com> <92071a0d-c230-85dc-f704-e96165710a15@gmail.com>
In-Reply-To: <92071a0d-c230-85dc-f704-e96165710a15@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Apr 2023 05:55:01 -0700
Message-ID: <CAMKF1sqPFAUC+=kaepn32yQM-7=u-wy8XNoqxTBS7KHA4+JLHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 12:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101867

i am also seeing this on AB

ERROR: Nothing PROVIDES 'polkit' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-support/fprintd/fprintd_git.bb
DEPENDS on or otherwise requires it)
polkit was skipped: missing required distro feature 'polkit' (not in
DISTRO_FEATURES)
polkit was skipped: missing required distro feature 'polkit' (not in
DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'fprintd', 'polkit']

On Fri, Mar 31, 2023 at 11:01=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2023. 03. 31. 19:41 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > It needs to address native deps on udev-native I am seeing
> >
> > ERROR: Nothing PROVIDES 'udev-native' (but
> > virtual:native:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/reci=
pes-support/libfprint/libfprint_1.94.5.bb
> > DEPENDS on or otherwise requires it).
>
> This is a problem with using two different mailing lists
> and separate layers. Interconnected changes are often
> overlooked without taking the changed in the other layer.
>
> This particular problem is addressed by the systemd change
> with BBCLASSEXTEND =3D "native" and other tweaks which
> was sent to the openembedded-core ML and is being debated there.
>
> FWIW, this meson bug prevents libfprint to use the exe_wrapper,
> which would make the systemd-native recipe unnecessary:
> https://github.com/mesonbuild/meson/issues/11029
>
> > On Thu, Mar 30, 2023 at 6:43=E2=80=AFAM Zoltan Boszormenyi <zboszor@gma=
il.com> wrote:
> >> libfprint is the library used by fprintd.
> >>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   ...001-Optionally-use-native-generators.patch | 111 ++++++++++++++++=
++
> >>   .../0002-Make-building-tests-optional.patch   |  47 ++++++++
> >>   .../libfprint/libfprint_1.94.5.bb             |  45 +++++++
> >>   3 files changed, 203 insertions(+)
> >>   create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0001-=
Optionally-use-native-generators.patch
> >>   create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0002-=
Make-building-tests-optional.patch
> >>   create mode 100644 meta-oe/recipes-support/libfprint/libfprint_1.94.=
5.bb
> >>
> >> diff --git a/meta-oe/recipes-support/libfprint/libfprint/0001-Optional=
ly-use-native-generators.patch b/meta-oe/recipes-support/libfprint/libfprin=
t/0001-Optionally-use-native-generators.patch
> >> new file mode 100644
> >> index 000000000..779d78c28
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-=
native-generators.patch
> >> @@ -0,0 +1,111 @@
> >> +From 4f0f84448dbc46c18d2700ddb45acdee67687574 Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >> + <zboszor@gmail.com>
> >> +Date: Thu, 30 Mar 2023 09:45:31 +0200
> >> +Subject: [PATCH 1/2] Optionally use native generators
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +fprint-list-udev-hwdb and fprint-list-udev-rules are run
> >> +during the build to generate autosuspend.hwdb and 70-*.rules,
> >> +respectively.
> >> +
> >> +Since they are not marked as "native: true", a cross-compiled
> >> +version is not possible.
> >> +
> >> +Since these binaries are linked with the libfprint_drivers target,
> >> +marking them as native binaries would also need libfprint_drivers
> >> +to be duplicated as a native version and possibly other library
> >> +targets, too.
> >> +
> >> +Instead, make it the responsibility of the cross-compiler
> >> +framework to build the native variant separately and allow
> >> +the external binaries to be passed in.
> >> +
> >> +Upstream-Status: Submitted
> >> +
> >> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> +---
> >> + libfprint/meson.build | 30 ++++++++++++++++++++----------
> >> + meson_options.txt     |  8 ++++++++
> >> + 2 files changed, 28 insertions(+), 10 deletions(-)
> >> +
> >> +diff --git a/libfprint/meson.build b/libfprint/meson.build
> >> +index d3c8b03..2a4de67 100644
> >> +--- a/libfprint/meson.build
> >> ++++ b/libfprint/meson.build
> >> +@@ -301,11 +301,16 @@ libfprint_private_dep =3D declare_dependency(
> >> +     ]
> >> + )
> >> +
> >> +-udev_hwdb =3D executable('fprint-list-udev-hwdb',
> >> +-    'fprint-list-udev-hwdb.c',
> >> +-    dependencies: libfprint_private_dep,
> >> +-    link_with: libfprint_drivers,
> >> +-    install: false)
> >> ++udev_hwdb_cmd =3D get_option('udev_hwdb_cmd')
> >> ++if udev_hwdb_cmd =3D=3D ''
> >> ++    udev_hwdb =3D executable('fprint-list-udev-hwdb',
> >> ++        'fprint-list-udev-hwdb.c',
> >> ++        dependencies: libfprint_private_dep,
> >> ++        link_with: libfprint_drivers,
> >> ++        install: false)
> >> ++else
> >> ++    udev_hwdb =3D find_program(udev_hwdb_cmd)
> >> ++endif
> >> +
> >> + udev_hwdb_generator =3D custom_target('udev-hwdb',
> >> +     output: 'autosuspend.hwdb',
> >> +@@ -315,12 +320,17 @@ udev_hwdb_generator =3D custom_target('udev-hwd=
b',
> >> +     install: false,
> >> + )
> >> +
> >> ++udev_rules_cmd =3D get_option('udev_rules_cmd')
> >> + if install_udev_rules
> >> +-    udev_rules =3D executable('fprint-list-udev-rules',
> >> +-        'fprint-list-udev-rules.c',
> >> +-        dependencies: libfprint_private_dep,
> >> +-        link_with: libfprint_drivers,
> >> +-        install: false)
> >> ++    if udev_rules_cmd =3D=3D ''
> >> ++        udev_rules =3D executable('fprint-list-udev-rules',
> >> ++            'fprint-list-udev-rules.c',
> >> ++            dependencies: libfprint_private_dep,
> >> ++            link_with: libfprint_drivers,
> >> ++            install: false)
> >> ++    else
> >> ++        udev_rules =3D find_program(udev_rules_cmd)
> >> ++    endif
> >> +
> >> +     custom_target('udev-rules',
> >> +         output: '70-@0@.rules'.format(versioned_libname),
> >> +diff --git a/meson_options.txt b/meson_options.txt
> >> +index f9b801f..a6f0c4d 100644
> >> +--- a/meson_options.txt
> >> ++++ b/meson_options.txt
> >> +@@ -14,6 +14,10 @@ option('udev_rules_dir',
> >> +        description: 'Installation path for udev rules',
> >> +        type: 'string',
> >> +        value: 'auto')
> >> ++option('udev_rules_cmd',
> >> ++       description : 'Optional path for native build of fprint-list-=
udev-rules',
> >> ++       type : 'string',
> >> ++       value : '')
> >> + option('udev_hwdb',
> >> +        description: 'Whether to create a udev hwdb for autosuspend (=
included in systemd v248 and later)',
> >> +        type: 'feature',
> >> +@@ -22,6 +26,10 @@ option('udev_hwdb_dir',
> >> +        description: 'Installation path for udev hwdb',
> >> +        type: 'string',
> >> +        value: 'auto')
> >> ++option('udev_hwdb_cmd',
> >> ++       description : 'Optional path for native build of fprint-list-=
udev-hwdb',
> >> ++       type : 'string',
> >> ++       value : '')
> >> + option('gtk-examples',
> >> +        description: 'Whether to build GTK+ example applications',
> >> +        type: 'boolean',
> >> +--
> >> +2.39.2
> >> +
> >> diff --git a/meta-oe/recipes-support/libfprint/libfprint/0002-Make-bui=
lding-tests-optional.patch b/meta-oe/recipes-support/libfprint/libfprint/00=
02-Make-building-tests-optional.patch
> >> new file mode 100644
> >> index 000000000..c83ea95e1
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-t=
ests-optional.patch
> >> @@ -0,0 +1,47 @@
> >> +From 8e27d45a7747c9aaf8e619f2de3ad3eae9659da8 Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >> + <zboszor@gmail.com>
> >> +Date: Thu, 30 Mar 2023 09:57:35 +0200
> >> +Subject: [PATCH 2/2] Make building tests optional
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +Upstream-Status: Submitted
> >> +
> >> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> +---
> >> + meson.build       | 4 +++-
> >> + meson_options.txt | 4 ++++
> >> + 2 files changed, 7 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/meson.build b/meson.build
> >> +index 1badb16..05edb8d 100644
> >> +--- a/meson.build
> >> ++++ b/meson.build
> >> +@@ -309,7 +309,9 @@ if get_option('gtk-examples')
> >> + endif
> >> +
> >> + subdir('data')
> >> +-subdir('tests')
> >> ++if get_option('tests')
> >> ++    subdir('tests')
> >> ++endif
> >> +
> >> + pkgconfig =3D import('pkgconfig')
> >> + pkgconfig.generate(
> >> +diff --git a/meson_options.txt b/meson_options.txt
> >> +index a6f0c4d..175710d 100644
> >> +--- a/meson_options.txt
> >> ++++ b/meson_options.txt
> >> +@@ -38,3 +38,7 @@ option('doc',
> >> +        description: 'Whether to build the API documentation',
> >> +        type: 'boolean',
> >> +        value: true)
> >> ++option('tests',
> >> ++       description: 'Whether to build the tests',
> >> ++       type: 'boolean',
> >> ++       value: true)
> >> +--
> >> +2.39.2
> >> +
> >> diff --git a/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb b/m=
eta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> >> new file mode 100644
> >> index 000000000..b0133409a
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> >> @@ -0,0 +1,45 @@
> >> +SUMMARY =3D "Library for fingerprint readers"
> >> +DESCRIPTION =3D "libfprint is an open source software library \
> >> +designed to make it easy for application developers to add \
> >> +support for consumer fingerprint readers to their software."
> >> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/fprint/libfpr=
int/"
> >> +
> >> +DEPENDS =3D "glib-2.0 libgusb udev libgudev nspr nss pixman cairo"
> >> +
> >> +DEPENDS:append:class-target =3D " libfprint-native "
> >> +
> >> +LICENSE =3D "LGPL-2.1-only"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900=
982c24"
> >> +
> >> +#PR =3D "r1"
> >> +
> >> +SRCREV =3D "86961a9429d589c387da37351fd6b4ff3caf67ea"
> >> +
> >> +SRC_URI =3D " \
> >> +       git://anongit.freedesktop.org/git/libfprint/libfprint.git;bran=
ch=3Dmaster;protocol=3Dhttps \
> >> +       file://0001-Optionally-use-native-generators.patch \
> >> +       file://0002-Make-building-tests-optional.patch \
> >> +"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit meson pkgconfig useradd python3native gobject-introspection
> >> +
> >> +EXTRA_OEMESON:class-native =3D "-Ddoc=3Dfalse -Dtests=3Dfalse -Dintro=
spection=3Dfalse"
> >> +
> >> +EXTRA_OEMESON:class-target =3D "-Ddoc=3Dfalse -Dtests=3Dfalse \
> >> +       -Dudev_hwdb=3Denabled -Dudev_hwdb_dir=3D${sysconfdir}/udev/hwd=
b.d \
> >> +       -Dudev_hwdb_cmd=3D${STAGING_BINDIR_NATIVE}/fprint-list-udev-hw=
db \
> >> +       -Dudev_rules_cmd=3D${STAGING_BINDIR_NATIVE}/fprint-list-udev-r=
ules \
> >> +"
> >> +
> >> +do_install:append:class-native () {
> >> +       install -d ${D}${bindir}
> >> +       install -m0755 ${B}/libfprint/fprint-list-udev-hwdb ${D}${bind=
ir}/fprint-list-udev-hwdb
> >> +       install -m0755 ${B}/libfprint/fprint-list-udev-rules ${D}${bin=
dir}/fprint-list-udev-rules
> >> +}
> >> +
> >> +BBCLASSEXTEND =3D "native"
> >> +
> >> +USERADD_PACKAGES =3D "${PN}"
> >> +GROUPADD_PARAM:${PN} =3D "fprint"
> >> --
> >> 2.39.2
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#101836): https://lists.openembedded.org/g/openembe=
dded-devel/message/101836
> >> Mute This Topic: https://lists.openembedded.org/mt/97950767/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

