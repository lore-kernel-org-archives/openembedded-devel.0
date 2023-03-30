Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7664C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 16:44:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.30725.1680194674042290391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 09:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ION+A7Qs;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id e9so4994156ljq.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680194672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FFKoq4v2GaPGhF7xtyss+ym79ICcTG5hLxUWosOuZg=;
        b=ION+A7Qs2JzYZC41URLHKhnnFj1ay1bbkRmu4TdU/gUOCjAd1eBBIgX4Jr1dC2ZL+c
         Ls9HhBFSR3UtnLv+iuWv0NaZittlOggQvHS5+IHRoXCua0/4EM7H5t9CwTGk+rf1JM5A
         QpPKCeea8y0VcFUC2+oTdwmpK+uNABqmhU2qCSGIzX3ErAWM8eq5qUdNpuf0CrU+z95d
         tLnHLhZW5HIj4cKZiGEcuJZZ6BgL4+Io63DSrMUO1JmEL644gE5K00/JlUzD2PCoBKMe
         d/PU5bpY70yYa/rdqQFA9eSMHdUoeYS89S1rgxAXBvApiI48J+jl9+rMc2TWffsUo8YD
         2WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680194672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FFKoq4v2GaPGhF7xtyss+ym79ICcTG5hLxUWosOuZg=;
        b=3PRjfm7a8V5/soQXHz7qUQXMpO2Um4BzrArfVU7jsdxHTvXnN75uQot8OD83TpGivT
         y0ddT7nSJqYwPRaOw/dMaxDWnK+yMMWYpMQu/g+ltjYMvhKhCrghG/NY2LqzM4PvU+9R
         JYCIw+3N++PcxHk3czf905hEG6BJbSMxqOKEtUJ8IUU0goEPHL011od0rwuA2xbkdksU
         BcqYpks+hmpAmqrchdlGJqJX3MGbHHvk9/5xfvjKk46a1wFv1wssh+yM2FXIUKjShafI
         bRGTNiZwlZnXv386f+bqLVlYVKmtl/SgronHIX/4QiPqBFnLB1P2Humi4yxdI+kh4+Hj
         w8Vw==
X-Gm-Message-State: AAQBX9d60mLiJ0xbL+Mys8hfyXd+4o6MJ1dNytVISfTf0FyB86Q7leoz
	YzHpsJGcGTIYKOGtM5PksflMpoxNWl9ROytn2gs=
X-Google-Smtp-Source: AKy350aQN5mzWWAdjVcRdqaVIDfBYrfwxxu9B6hz5T0B/d6ZLXat8C+G0XpwAg2zZKZzQS47PTlk+sWOEH/2n+s0jpU=
X-Received: by 2002:a05:651c:115:b0:299:9de5:2f1b with SMTP id
 a21-20020a05651c011500b002999de52f1bmr7280762ljb.7.1680194672174; Thu, 30 Mar
 2023 09:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230330134302.2789448-1-zboszor@gmail.com> <20230330134302.2789448-2-zboszor@gmail.com>
 <CANNYZj9hC+JgW7F-WWbtQ-_Qf5WDcvyPy38pi1BNqgBPJVAUxw@mail.gmail.com>
 <17513BCD51B17AEE.27612@lists.openembedded.org> <79cca085-907e-2135-e7a7-89209c492277@gmail.com>
In-Reply-To: <79cca085-907e-2135-e7a7-89209c492277@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Mar 2023 18:44:20 +0200
Message-ID: <CANNYZj-GZ+ueUJ2D6uMShaeV_cG3RP1tpD0d1m0pxBGPo=0NNQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 16:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101843

Maybe you can raise the concern with upstream and see what they say?
How, in their opinion, should their component be cross-compiled? Can
the need to run target executables be eliminated from the build in
some other way we're not seeing?

Alex

On Thu, 30 Mar 2023 at 17:52, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
>
> 2023. 03. 30. 17:24 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openem=
bedded.org =C3=ADrta:
> > 2023. 03. 30. 15:50 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> >> Meson is specifically configured in yocto to user qemu usermode as the
> >> wrapper to run cross binaries, so can libfprint build configuration be
> >> tweaked to use that? This would avoid all the nasty -native extensions
> >> and modifications.
> >
> > How would I do that? This is the error if I not use the
> > externally built executables:
> >
> > | [122/124]
> > /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpr=
int/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real
> > --internal exe --capture libfprint/70-libfprint-2.rules --
> > /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpr=
int/1.94.5-r0/build/libfprint/fprint-list-udev-rules
> > | FAILED: libfprint/70-libfprint-2.rules
> > |
> > /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpr=
int/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real
> > --internal exe --capture libfprint/70-libfprint-2.rules --
> > /home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfpr=
int/1.94.5-r0/build/libfprint/fprint-list-udev-rules
> > | Traceback (most recent call last):
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real",
> > line 8, in <module>
> > |     sys.exit(main())
> > |              ^^^^^^
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/meson=
build/mesonmain.py",
> > line 287, in main
> > |     return run(sys.argv[1:], launcher)
> > |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/meson=
build/mesonmain.py",
> > line 275, in run
> > |     return run_script_command(args[1], args[2:])
> > |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/meson=
build/mesonmain.py",
> > line 223, in run_script_command
> > |     return module.run(script_args)
> > |            ^^^^^^^^^^^^^^^^^^^^^^^
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/meson=
build/scripts/meson_exe.py",
> > line 121, in run
> > |     return run_exe(exe)
> > |            ^^^^^^^^^^^^
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/meson=
build/scripts/meson_exe.py",
> > line 66, in run_exe
> > |     p =3D subprocess.Popen(cmd_args, env=3Dchild_env, cwd=3Dexe.workd=
ir,
> > | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py",
> > line 1024, in __init__
> > |     self._execute_child(args, executable, preexec_fn, close_fds,
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py",
> > line 1789, in _execute_child
> > |     self._posix_spawn(args, executable, env, restore_signals,
> > |   File
> > "/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py",
> > line 1733, in _posix_spawn
> > |     self.pid =3D os.posix_spawn(executable, args, env, **kwargs)
> > |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > | FileNotFoundError: [Errno 2] No such file or directory:
> > '/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfp=
rint/1.94.5-r0/build/libfprint/fprint-list-udev-rules'
> >
> > The executable is built, it is there, and it's using the target system'=
s
> > runtime linker path.
> >
> > Obviously, meson doesn't run it through the exe_wrapper.
>
> It is possible that meson doesn't support running executables
> via exe_wrapper whose output is captured in a file?
>
> Maybe rewriting the generators to write their output directly
> instead of on stdout will make libfprint more cross compiler
> friendly.
>
> >
> >>
> >> Alex
> >>
> >> On Thu, 30 Mar 2023 at 15:43, Zoltan Boszormenyi <zboszor@gmail.com> w=
rote:
> >>> libfprint is the library used by fprintd.
> >>>
> >>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >>> ---
> >>>   ...001-Optionally-use-native-generators.patch | 111 +++++++++++++++=
+++
> >>>   .../0002-Make-building-tests-optional.patch   |  47 ++++++++
> >>>   .../libfprint/libfprint_1.94.5.bb             |  45 +++++++
> >>>   3 files changed, 203 insertions(+)
> >>>   create mode 100644
> >>> meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-nativ=
e-generators.patch
> >>>   create mode 100644
> >>> meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-=
optional.patch
> >>>   create mode 100644 meta-oe/recipes-support/libfprint/libfprint_1.94=
.5.bb
> >>>
> >>> diff --git
> >>> a/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-nat=
ive-generators.patch
> >>> b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-nat=
ive-generators.patch
> >>> new file mode 100644
> >>> index 000000000..779d78c28
> >>> --- /dev/null
> >>> +++
> >>> b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-nat=
ive-generators.patch
> >>> @@ -0,0 +1,111 @@
> >>> +From 4f0f84448dbc46c18d2700ddb45acdee67687574 Mon Sep 17 00:00:00 20=
01
> >>> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >>> + <zboszor@gmail.com>
> >>> +Date: Thu, 30 Mar 2023 09:45:31 +0200
> >>> +Subject: [PATCH 1/2] Optionally use native generators
> >>> +MIME-Version: 1.0
> >>> +Content-Type: text/plain; charset=3DUTF-8
> >>> +Content-Transfer-Encoding: 8bit
> >>> +
> >>> +fprint-list-udev-hwdb and fprint-list-udev-rules are run
> >>> +during the build to generate autosuspend.hwdb and 70-*.rules,
> >>> +respectively.
> >>> +
> >>> +Since they are not marked as "native: true", a cross-compiled
> >>> +version is not possible.
> >>> +
> >>> +Since these binaries are linked with the libfprint_drivers target,
> >>> +marking them as native binaries would also need libfprint_drivers
> >>> +to be duplicated as a native version and possibly other library
> >>> +targets, too.
> >>> +
> >>> +Instead, make it the responsibility of the cross-compiler
> >>> +framework to build the native variant separately and allow
> >>> +the external binaries to be passed in.
> >>> +
> >>> +Upstream-Status: Submitted
> >>> +
> >>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> >>> +---
> >>> + libfprint/meson.build | 30 ++++++++++++++++++++----------
> >>> + meson_options.txt     |  8 ++++++++
> >>> + 2 files changed, 28 insertions(+), 10 deletions(-)
> >>> +
> >>> +diff --git a/libfprint/meson.build b/libfprint/meson.build
> >>> +index d3c8b03..2a4de67 100644
> >>> +--- a/libfprint/meson.build
> >>> ++++ b/libfprint/meson.build
> >>> +@@ -301,11 +301,16 @@ libfprint_private_dep =3D declare_dependency(
> >>> +     ]
> >>> + )
> >>> +
> >>> +-udev_hwdb =3D executable('fprint-list-udev-hwdb',
> >>> +-    'fprint-list-udev-hwdb.c',
> >>> +-    dependencies: libfprint_private_dep,
> >>> +-    link_with: libfprint_drivers,
> >>> +-    install: false)
> >>> ++udev_hwdb_cmd =3D get_option('udev_hwdb_cmd')
> >>> ++if udev_hwdb_cmd =3D=3D ''
> >>> ++    udev_hwdb =3D executable('fprint-list-udev-hwdb',
> >>> ++        'fprint-list-udev-hwdb.c',
> >>> ++        dependencies: libfprint_private_dep,
> >>> ++        link_with: libfprint_drivers,
> >>> ++        install: false)
> >>> ++else
> >>> ++    udev_hwdb =3D find_program(udev_hwdb_cmd)
> >>> ++endif
> >>> +
> >>> + udev_hwdb_generator =3D custom_target('udev-hwdb',
> >>> +     output: 'autosuspend.hwdb',
> >>> +@@ -315,12 +320,17 @@ udev_hwdb_generator =3D custom_target('udev-hw=
db',
> >>> +     install: false,
> >>> + )
> >>> +
> >>> ++udev_rules_cmd =3D get_option('udev_rules_cmd')
> >>> + if install_udev_rules
> >>> +-    udev_rules =3D executable('fprint-list-udev-rules',
> >>> +-        'fprint-list-udev-rules.c',
> >>> +-        dependencies: libfprint_private_dep,
> >>> +-        link_with: libfprint_drivers,
> >>> +-        install: false)
> >>> ++    if udev_rules_cmd =3D=3D ''
> >>> ++        udev_rules =3D executable('fprint-list-udev-rules',
> >>> ++            'fprint-list-udev-rules.c',
> >>> ++            dependencies: libfprint_private_dep,
> >>> ++            link_with: libfprint_drivers,
> >>> ++            install: false)
> >>> ++    else
> >>> ++        udev_rules =3D find_program(udev_rules_cmd)
> >>> ++    endif
> >>> +
> >>> +     custom_target('udev-rules',
> >>> +         output: '70-@0@.rules'.format(versioned_libname),
> >>> +diff --git a/meson_options.txt b/meson_options.txt
> >>> +index f9b801f..a6f0c4d 100644
> >>> +--- a/meson_options.txt
> >>> ++++ b/meson_options.txt
> >>> +@@ -14,6 +14,10 @@ option('udev_rules_dir',
> >>> +        description: 'Installation path for udev rules',
> >>> +        type: 'string',
> >>> +        value: 'auto')
> >>> ++option('udev_rules_cmd',
> >>> ++       description : 'Optional path for native build of fprint-list=
-udev-rules',
> >>> ++       type : 'string',
> >>> ++       value : '')
> >>> + option('udev_hwdb',
> >>> +        description: 'Whether to create a udev hwdb for autosuspend =
(included in
> >>> systemd v248 and later)',
> >>> +        type: 'feature',
> >>> +@@ -22,6 +26,10 @@ option('udev_hwdb_dir',
> >>> +        description: 'Installation path for udev hwdb',
> >>> +        type: 'string',
> >>> +        value: 'auto')
> >>> ++option('udev_hwdb_cmd',
> >>> ++       description : 'Optional path for native build of fprint-list=
-udev-hwdb',
> >>> ++       type : 'string',
> >>> ++       value : '')
> >>> + option('gtk-examples',
> >>> +        description: 'Whether to build GTK+ example applications',
> >>> +        type: 'boolean',
> >>> +--
> >>> +2.39.2
> >>> +
> >>> diff --git
> >>> a/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-test=
s-optional.patch
> >>> b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-test=
s-optional.patch
> >>> new file mode 100644
> >>> index 000000000..c83ea95e1
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-=
tests-optional.patch
> >>> @@ -0,0 +1,47 @@
> >>> +From 8e27d45a7747c9aaf8e619f2de3ad3eae9659da8 Mon Sep 17 00:00:00 20=
01
> >>> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >>> + <zboszor@gmail.com>
> >>> +Date: Thu, 30 Mar 2023 09:57:35 +0200
> >>> +Subject: [PATCH 2/2] Make building tests optional
> >>> +MIME-Version: 1.0
> >>> +Content-Type: text/plain; charset=3DUTF-8
> >>> +Content-Transfer-Encoding: 8bit
> >>> +
> >>> +Upstream-Status: Submitted
> >>> +
> >>> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> >>> +---
> >>> + meson.build       | 4 +++-
> >>> + meson_options.txt | 4 ++++
> >>> + 2 files changed, 7 insertions(+), 1 deletion(-)
> >>> +
> >>> +diff --git a/meson.build b/meson.build
> >>> +index 1badb16..05edb8d 100644
> >>> +--- a/meson.build
> >>> ++++ b/meson.build
> >>> +@@ -309,7 +309,9 @@ if get_option('gtk-examples')
> >>> + endif
> >>> +
> >>> + subdir('data')
> >>> +-subdir('tests')
> >>> ++if get_option('tests')
> >>> ++    subdir('tests')
> >>> ++endif
> >>> +
> >>> + pkgconfig =3D import('pkgconfig')
> >>> + pkgconfig.generate(
> >>> +diff --git a/meson_options.txt b/meson_options.txt
> >>> +index a6f0c4d..175710d 100644
> >>> +--- a/meson_options.txt
> >>> ++++ b/meson_options.txt
> >>> +@@ -38,3 +38,7 @@ option('doc',
> >>> +        description: 'Whether to build the API documentation',
> >>> +        type: 'boolean',
> >>> +        value: true)
> >>> ++option('tests',
> >>> ++       description: 'Whether to build the tests',
> >>> ++       type: 'boolean',
> >>> ++       value: true)
> >>> +--
> >>> +2.39.2
> >>> +
> >>> diff --git a/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> >>> b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> >>> new file mode 100644
> >>> index 000000000..b0133409a
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> >>> @@ -0,0 +1,45 @@
> >>> +SUMMARY =3D "Library for fingerprint readers"
> >>> +DESCRIPTION =3D "libfprint is an open source software library \
> >>> +designed to make it easy for application developers to add \
> >>> +support for consumer fingerprint readers to their software."
> >>> +HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/fprint/libfp=
rint/"
> >>> +
> >>> +DEPENDS =3D "glib-2.0 libgusb udev libgudev nspr nss pixman cairo"
> >>> +
> >>> +DEPENDS:append:class-target =3D " libfprint-native "
> >>> +
> >>> +LICENSE =3D "LGPL-2.1-only"
> >>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f90=
0982c24"
> >>> +
> >>> +#PR =3D "r1"
> >>> +
> >>> +SRCREV =3D "86961a9429d589c387da37351fd6b4ff3caf67ea"
> >>> +
> >>> +SRC_URI =3D " \
> >>> +
> >>> git://anongit.freedesktop.org/git/libfprint/libfprint.git;branch=3Dma=
ster;protocol=3Dhttps \
> >>> +       file://0001-Optionally-use-native-generators.patch \
> >>> +       file://0002-Make-building-tests-optional.patch \
> >>> +"
> >>> +
> >>> +S =3D "${WORKDIR}/git"
> >>> +
> >>> +inherit meson pkgconfig useradd python3native gobject-introspection
> >>> +
> >>> +EXTRA_OEMESON:class-native =3D "-Ddoc=3Dfalse -Dtests=3Dfalse -Dintr=
ospection=3Dfalse"
> >>> +
> >>> +EXTRA_OEMESON:class-target =3D "-Ddoc=3Dfalse -Dtests=3Dfalse \
> >>> +       -Dudev_hwdb=3Denabled -Dudev_hwdb_dir=3D${sysconfdir}/udev/hw=
db.d \
> >>> + -Dudev_hwdb_cmd=3D${STAGING_BINDIR_NATIVE}/fprint-list-udev-hwdb \
> >>> + -Dudev_rules_cmd=3D${STAGING_BINDIR_NATIVE}/fprint-list-udev-rules =
\
> >>> +"
> >>> +
> >>> +do_install:append:class-native () {
> >>> +       install -d ${D}${bindir}
> >>> +       install -m0755 ${B}/libfprint/fprint-list-udev-hwdb
> >>> ${D}${bindir}/fprint-list-udev-hwdb
> >>> +       install -m0755 ${B}/libfprint/fprint-list-udev-rules
> >>> ${D}${bindir}/fprint-list-udev-rules
> >>> +}
> >>> +
> >>> +BBCLASSEXTEND =3D "native"
> >>> +
> >>> +USERADD_PACKAGES =3D "${PN}"
> >>> +GROUPADD_PARAM:${PN} =3D "fprint"
> >>> --
> >>> 2.39.2
> >>>
> >>>
> >>>
> >>>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101840): https://lists.openembedded.org/g/openembed=
ded-devel/message/101840
> > Mute This Topic: https://lists.openembedded.org/mt/97950767/3617728
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

