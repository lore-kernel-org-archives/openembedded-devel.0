Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768EC77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:40:22 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.28784.1680190815634797386
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JSxRXf2G;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id h11so18090347lfu.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680190814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDCDi1RuI63vOEfofTXniqZKxo1trBH5LFjrlqinQNc=;
        b=JSxRXf2GqAV423waFYYY48iuRM8yd48sua8AS1FejtZlxpgCQqDz2kWZ3j9MGu2sSB
         9HnvIQjj0xhMXa0b7OXH8fAGpdnTQhoQjDJ2Tuzb+gwvC4PhPwzHKDToq+1OICAOfEEi
         KhsRPixOzNyvSvzrLUFmZP2MRS94RjIafaeFEaKHQhtDzTD0yRxHPE+AhGYTuFgm5VvN
         3ZA4sPUAQ+seOEhJyERqh4AYdwPJT50yHxQC9eSo2yRQEanbKAa5+inLGuilnC7DhKuP
         jde/jCUMduWyXTIoYmj9xIC6QMscq1/4EfPB4Yvuhn96/G8CUhY+NRjthAbauFilaZT6
         hTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680190814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDCDi1RuI63vOEfofTXniqZKxo1trBH5LFjrlqinQNc=;
        b=EPiFbzi7jOGDUFwKc3HWbjb45Db68AKoZA4x7RtGFgFQ5Q9hx7UK1ttRG0YsB2UvFw
         A1YgitD94R2jxbv1e+1fNJpuCp8DrRlzjdwsyaymTxwO9tVfyS+cwYfeVuhPVOYS4684
         7w72Uy8mi8iA4xBCJKcZ2wyIWVasne4WV/cKKI6Lr6nlie8rq/Orts7g11wMuyaBcHmc
         aP8zN8x777rW8Za5ZTkLD8ENpMEjI2k4E1TlNrh5GawZtlpq0rF7NquYNxERCyhHVvN6
         m4WwBQkMs850KhiW1Oc3Zu6fypODQ4F7lzSehEEWERexg2JC0kUmHXVNhQGkiLZt1wxg
         i1EA==
X-Gm-Message-State: AAQBX9daXbBo7dBFd1RapNPZHLPnU3GqlBHPrEM7526hQy29pVikcIvR
	mVvLdS0PfLIxie7/8YmpGRDy4I77JOsiMpCHMfM=
X-Google-Smtp-Source: AKy350bMPLfe8BQPz/VsdPcNntNW4AsvDb45+LQ0vrXyd2XevOXtuXcuU/rLq49tuosYBLBIkidXb063TpFp+ZLGq1Y=
X-Received: by 2002:ac2:5ddb:0:b0:4e8:c8f1:a010 with SMTP id
 x27-20020ac25ddb000000b004e8c8f1a010mr6879574lfq.11.1680190813701; Thu, 30
 Mar 2023 08:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134302.2789448-1-zboszor@gmail.com> <20230330134302.2789448-2-zboszor@gmail.com>
 <CANNYZj9hC+JgW7F-WWbtQ-_Qf5WDcvyPy38pi1BNqgBPJVAUxw@mail.gmail.com> <09b3c1e8-50fc-dbed-45a4-b78699a1ea3d@gmail.com>
In-Reply-To: <09b3c1e8-50fc-dbed-45a4-b78699a1ea3d@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 17:40:02 +0200
Message-ID: <CANNYZj-_qD8qog7s7zvdHZA9NM2Yfnftn70pA6tcAo0HAAMF6g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 15:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101841

How do libfprint's meson rules for producing the executable and then
running it look like?

Any meson based recipe has a similar entry in ${WORKDIR}/meson.cross:

exe_wrapper =3D '/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-pok=
y-linux/glib-2.0/1_2.74.6-r0/meson-qemuwrapper'

And the use of the exe_wrapper is documented here:
https://mesonbuild.com/Cross-compilation.html

Alex

On Thu, 30 Mar 2023 at 17:24, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2023. 03. 30. 15:50 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > Meson is specifically configured in yocto to user qemu usermode as the
> > wrapper to run cross binaries, so can libfprint build configuration be
> > tweaked to use that? This would avoid all the nasty -native extensions
> > and modifications.
>
> How would I do that? This is the error if I not use the
> externally built executables:
>
> | [122/124]
> /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprin=
t/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real
> --internal exe --capture libfprint/70-libfprint-2.rules --
> /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprin=
t/1.94.5-r0/build/libfprint/fprint-list-udev-rules
> | FAILED: libfprint/70-libfprint-2.rules
> |
> /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprin=
t/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real
> --internal exe --capture libfprint/70-libfprint-2.rules --
> /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprin=
t/1.94.5-r0/build/libfprint/fprint-list-udev-rules
> | Traceback (most recent call last):
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real",
> line 8, in <module>
> |     sys.exit(main())
> |              ^^^^^^
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbu=
ild/mesonmain.py",
> line 287, in main
> |     return run(sys.argv[1:], launcher)
> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbu=
ild/mesonmain.py",
> line 275, in run
> |     return run_script_command(args[1], args[2:])
> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbu=
ild/mesonmain.py",
> line 223, in run_script_command
> |     return module.run(script_args)
> |            ^^^^^^^^^^^^^^^^^^^^^^^
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbu=
ild/scripts/meson_exe.py",
> line 121, in run
> |     return run_exe(exe)
> |            ^^^^^^^^^^^^
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbu=
ild/scripts/meson_exe.py",
> line 66, in run_exe
> |     p =3D subprocess.Popen(cmd_args, env=3Dchild_env, cwd=3Dexe.workdir=
,
> |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py",
> line 1024, in __init__
> |     self._execute_child(args, executable, preexec_fn, close_fds,
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py",
> line 1789, in _execute_child
> |     self._posix_spawn(args, executable, env, restore_signals,
> |   File
> "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py",
> line 1733, in _posix_spawn
> |     self.pid =3D os.posix_spawn(executable, args, env, **kwargs)
> |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> | FileNotFoundError: [Errno 2] No such file or directory:
> '/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpri=
nt/1.94.5-r0/build/libfprint/fprint-list-udev-rules'
>
> The executable is built, it is there, and it's using the target system's
> runtime linker path.
>
> Obviously, meson doesn't run it through the exe_wrapper.
>
> >
> > Alex
> >
> > On Thu, 30 Mar 2023 at 15:43, Zoltan Boszormenyi <zboszor@gmail.com> wr=
ote:
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
> >> Mute This Topic: https://lists.openembedded.org/mt/97950767/1686489
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

