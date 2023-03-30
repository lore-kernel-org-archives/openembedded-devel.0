Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD5BC77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:24:52 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.28321.1680189888561597730
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DjJ/l49h;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id er13so36969826edb.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680189887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLzpmdyo7jBmh5/nNLAr2CDeKPK3IX/zOvn/UZhLxdY=;
        b=DjJ/l49h9m+mwP7ItC20qrHZ43E3mmIWGUjJqeNLvQa5IpUji/4gEtfzjECvpIIF7z
         8L4IEp+MC3NB1K6UthX4DDteUmqoVwZwxGMqO/pmdYz4xZ1kq/EeoCX6nUmfbRMYQIXJ
         HADYarIwHobI5Qc8qTiFhIQlMbzRGLqto+B6Pn1O61WBMpGAacTBSOJWoI4yi20HvweB
         Jo8y2q/MP1j9p8Qvg+FKTz32FvQgBvnZEHxqP4s8QT89iGwBXbgbtCyviDf5SVnXJaNH
         /vxO3ge/64FlW3lSaXp3vtBqlX3Nv+I5l8qAW4TAE1u0LVEQW1b/tThr5NulSuq+Fnat
         7ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680189887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLzpmdyo7jBmh5/nNLAr2CDeKPK3IX/zOvn/UZhLxdY=;
        b=IzCx2pA9O88vxnm06kbGzWoGnwwPGbP9XLgsgSYPRY1wwuCsrTXvBOMCDDYWrj9qUV
         K+gtOPluR6XIU34pWsMlIyxfbBYtwAfiFFF77FlbuEGrQzy+waYxSvEBPg3zK798tqhe
         sEGsfGxmX4FVllHrS6qF2S/W5Gx1LHWwz7Cl1p4XaWzaZD5h/tjpPDHnM9NL41LVVx32
         xj2TB4Sf47jkjxzo6gUQuQd/qDy7wnNVLY1eQK3H2luGY7JIh4Q98iGgpZii1AYZ0Zyb
         R1VlE9fuDQTmP4M5dVUFmURqoQ6kNaHDRtKGh10uriA9r0mDhbL5QNlT8r8jo7sAT9MA
         UhrQ==
X-Gm-Message-State: AAQBX9coXSBa+cnWI3vMqAFdBU+vrXSMMXjhzuwcTFNI43Mkm/wQnjOD
	AaiJP7CfzdkgEki3piKy/iU=
X-Google-Smtp-Source: AKy350bKeiLBQ5WnAk+dpIc81h0LWOaKSbob0nfCbJL3KaO6PLRHo2QHPow359p472MhLB5gNbFzLg==
X-Received: by 2002:a05:6402:5213:b0:502:50b0:a879 with SMTP id s19-20020a056402521300b0050250b0a879mr6657153edd.5.1680189886706;
        Thu, 30 Mar 2023 08:24:46 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id t20-20020a50d714000000b005021d17d896sm39801edi.21.2023.03.30.08.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 08:24:46 -0700 (PDT)
Message-ID: <09b3c1e8-50fc-dbed-45a4-b78699a1ea3d@gmail.com>
Date: Thu, 30 Mar 2023 17:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230330134302.2789448-1-zboszor@gmail.com>
 <20230330134302.2789448-2-zboszor@gmail.com>
 <CANNYZj9hC+JgW7F-WWbtQ-_Qf5WDcvyPy38pi1BNqgBPJVAUxw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9hC+JgW7F-WWbtQ-_Qf5WDcvyPy38pi1BNqgBPJVAUxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 15:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101840

2023. 03. 30. 15:50 keltezéssel, Alexander Kanavin írta:
> Meson is specifically configured in yocto to user qemu usermode as the
> wrapper to run cross binaries, so can libfprint build configuration be
> tweaked to use that? This would avoid all the nasty -native extensions
> and modifications.

How would I do that? This is the error if I not use the
externally built executables:

| [122/124] 
/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real 
--internal exe --capture libfprint/70-libfprint-2.rules -- 
/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/build/libfprint/fprint-list-udev-rules
| FAILED: libfprint/70-libfprint-2.rules
| 
/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real 
--internal exe --capture libfprint/70-libfprint-2.rules -- 
/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/build/libfprint/fprint-list-udev-rules
| Traceback (most recent call last):
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/bin/meson.real", 
line 8, in <module>
|     sys.exit(main())
|              ^^^^^^
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbuild/mesonmain.py", 
line 287, in main
|     return run(sys.argv[1:], launcher)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbuild/mesonmain.py", 
line 275, in run
|     return run_script_command(args[1], args[2:])
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbuild/mesonmain.py", 
line 223, in run_script_command
|     return module.run(script_args)
|            ^^^^^^^^^^^^^^^^^^^^^^^
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbuild/scripts/meson_exe.py", 
line 121, in run
|     return run_exe(exe)
|            ^^^^^^^^^^^^
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/mesonbuild/scripts/meson_exe.py", 
line 66, in run_exe
|     p = subprocess.Popen(cmd_args, env=child_env, cwd=exe.workdir,
|         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py", 
line 1024, in __init__
|     self._execute_child(args, executable, preexec_fn, close_fds,
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py", 
line 1789, in _execute_child
|     self._posix_spawn(args, executable, env, restore_signals,
|   File 
"/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/recipe-sysroot-native/usr/lib/python3.11/subprocess.py", 
line 1733, in _posix_spawn
|     self.pid = os.posix_spawn(executable, args, env, **kwargs)
|                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| FileNotFoundError: [Errno 2] No such file or directory: 
'/home/zozo/dtd-yocto-4.2/tmp-sicom-glibc/work/corei7-64-oe-linux/libfprint/1.94.5-r0/build/libfprint/fprint-list-udev-rules'

The executable is built, it is there, and it's using the target system's
runtime linker path.

Obviously, meson doesn't run it through the exe_wrapper.

>
> Alex
>
> On Thu, 30 Mar 2023 at 15:43, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> libfprint is the library used by fprintd.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...001-Optionally-use-native-generators.patch | 111 ++++++++++++++++++
>>   .../0002-Make-building-tests-optional.patch   |  47 ++++++++
>>   .../libfprint/libfprint_1.94.5.bb             |  45 +++++++
>>   3 files changed, 203 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch
>>   create mode 100644 meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch
>>   create mode 100644 meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
>>
>> diff --git a/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch
>> new file mode 100644
>> index 000000000..779d78c28
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libfprint/libfprint/0001-Optionally-use-native-generators.patch
>> @@ -0,0 +1,111 @@
>> +From 4f0f84448dbc46c18d2700ddb45acdee67687574 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Thu, 30 Mar 2023 09:45:31 +0200
>> +Subject: [PATCH 1/2] Optionally use native generators
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +fprint-list-udev-hwdb and fprint-list-udev-rules are run
>> +during the build to generate autosuspend.hwdb and 70-*.rules,
>> +respectively.
>> +
>> +Since they are not marked as "native: true", a cross-compiled
>> +version is not possible.
>> +
>> +Since these binaries are linked with the libfprint_drivers target,
>> +marking them as native binaries would also need libfprint_drivers
>> +to be duplicated as a native version and possibly other library
>> +targets, too.
>> +
>> +Instead, make it the responsibility of the cross-compiler
>> +framework to build the native variant separately and allow
>> +the external binaries to be passed in.
>> +
>> +Upstream-Status: Submitted
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +---
>> + libfprint/meson.build | 30 ++++++++++++++++++++----------
>> + meson_options.txt     |  8 ++++++++
>> + 2 files changed, 28 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/libfprint/meson.build b/libfprint/meson.build
>> +index d3c8b03..2a4de67 100644
>> +--- a/libfprint/meson.build
>> ++++ b/libfprint/meson.build
>> +@@ -301,11 +301,16 @@ libfprint_private_dep = declare_dependency(
>> +     ]
>> + )
>> +
>> +-udev_hwdb = executable('fprint-list-udev-hwdb',
>> +-    'fprint-list-udev-hwdb.c',
>> +-    dependencies: libfprint_private_dep,
>> +-    link_with: libfprint_drivers,
>> +-    install: false)
>> ++udev_hwdb_cmd = get_option('udev_hwdb_cmd')
>> ++if udev_hwdb_cmd == ''
>> ++    udev_hwdb = executable('fprint-list-udev-hwdb',
>> ++        'fprint-list-udev-hwdb.c',
>> ++        dependencies: libfprint_private_dep,
>> ++        link_with: libfprint_drivers,
>> ++        install: false)
>> ++else
>> ++    udev_hwdb = find_program(udev_hwdb_cmd)
>> ++endif
>> +
>> + udev_hwdb_generator = custom_target('udev-hwdb',
>> +     output: 'autosuspend.hwdb',
>> +@@ -315,12 +320,17 @@ udev_hwdb_generator = custom_target('udev-hwdb',
>> +     install: false,
>> + )
>> +
>> ++udev_rules_cmd = get_option('udev_rules_cmd')
>> + if install_udev_rules
>> +-    udev_rules = executable('fprint-list-udev-rules',
>> +-        'fprint-list-udev-rules.c',
>> +-        dependencies: libfprint_private_dep,
>> +-        link_with: libfprint_drivers,
>> +-        install: false)
>> ++    if udev_rules_cmd == ''
>> ++        udev_rules = executable('fprint-list-udev-rules',
>> ++            'fprint-list-udev-rules.c',
>> ++            dependencies: libfprint_private_dep,
>> ++            link_with: libfprint_drivers,
>> ++            install: false)
>> ++    else
>> ++        udev_rules = find_program(udev_rules_cmd)
>> ++    endif
>> +
>> +     custom_target('udev-rules',
>> +         output: '70-@0@.rules'.format(versioned_libname),
>> +diff --git a/meson_options.txt b/meson_options.txt
>> +index f9b801f..a6f0c4d 100644
>> +--- a/meson_options.txt
>> ++++ b/meson_options.txt
>> +@@ -14,6 +14,10 @@ option('udev_rules_dir',
>> +        description: 'Installation path for udev rules',
>> +        type: 'string',
>> +        value: 'auto')
>> ++option('udev_rules_cmd',
>> ++       description : 'Optional path for native build of fprint-list-udev-rules',
>> ++       type : 'string',
>> ++       value : '')
>> + option('udev_hwdb',
>> +        description: 'Whether to create a udev hwdb for autosuspend (included in systemd v248 and later)',
>> +        type: 'feature',
>> +@@ -22,6 +26,10 @@ option('udev_hwdb_dir',
>> +        description: 'Installation path for udev hwdb',
>> +        type: 'string',
>> +        value: 'auto')
>> ++option('udev_hwdb_cmd',
>> ++       description : 'Optional path for native build of fprint-list-udev-hwdb',
>> ++       type : 'string',
>> ++       value : '')
>> + option('gtk-examples',
>> +        description: 'Whether to build GTK+ example applications',
>> +        type: 'boolean',
>> +--
>> +2.39.2
>> +
>> diff --git a/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch
>> new file mode 100644
>> index 000000000..c83ea95e1
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libfprint/libfprint/0002-Make-building-tests-optional.patch
>> @@ -0,0 +1,47 @@
>> +From 8e27d45a7747c9aaf8e619f2de3ad3eae9659da8 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Thu, 30 Mar 2023 09:57:35 +0200
>> +Subject: [PATCH 2/2] Make building tests optional
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Upstream-Status: Submitted
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +---
>> + meson.build       | 4 +++-
>> + meson_options.txt | 4 ++++
>> + 2 files changed, 7 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 1badb16..05edb8d 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -309,7 +309,9 @@ if get_option('gtk-examples')
>> + endif
>> +
>> + subdir('data')
>> +-subdir('tests')
>> ++if get_option('tests')
>> ++    subdir('tests')
>> ++endif
>> +
>> + pkgconfig = import('pkgconfig')
>> + pkgconfig.generate(
>> +diff --git a/meson_options.txt b/meson_options.txt
>> +index a6f0c4d..175710d 100644
>> +--- a/meson_options.txt
>> ++++ b/meson_options.txt
>> +@@ -38,3 +38,7 @@ option('doc',
>> +        description: 'Whether to build the API documentation',
>> +        type: 'boolean',
>> +        value: true)
>> ++option('tests',
>> ++       description: 'Whether to build the tests',
>> ++       type: 'boolean',
>> ++       value: true)
>> +--
>> +2.39.2
>> +
>> diff --git a/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
>> new file mode 100644
>> index 000000000..b0133409a
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
>> @@ -0,0 +1,45 @@
>> +SUMMARY = "Library for fingerprint readers"
>> +DESCRIPTION = "libfprint is an open source software library \
>> +designed to make it easy for application developers to add \
>> +support for consumer fingerprint readers to their software."
>> +HOMEPAGE = "https://www.freedesktop.org/wiki/Software/fprint/libfprint/"
>> +
>> +DEPENDS = "glib-2.0 libgusb udev libgudev nspr nss pixman cairo"
>> +
>> +DEPENDS:append:class-target = " libfprint-native "
>> +
>> +LICENSE = "LGPL-2.1-only"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>> +
>> +#PR = "r1"
>> +
>> +SRCREV = "86961a9429d589c387da37351fd6b4ff3caf67ea"
>> +
>> +SRC_URI = " \
>> +       git://anongit.freedesktop.org/git/libfprint/libfprint.git;branch=master;protocol=https \
>> +       file://0001-Optionally-use-native-generators.patch \
>> +       file://0002-Make-building-tests-optional.patch \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit meson pkgconfig useradd python3native gobject-introspection
>> +
>> +EXTRA_OEMESON:class-native = "-Ddoc=false -Dtests=false -Dintrospection=false"
>> +
>> +EXTRA_OEMESON:class-target = "-Ddoc=false -Dtests=false \
>> +       -Dudev_hwdb=enabled -Dudev_hwdb_dir=${sysconfdir}/udev/hwdb.d \
>> +       -Dudev_hwdb_cmd=${STAGING_BINDIR_NATIVE}/fprint-list-udev-hwdb \
>> +       -Dudev_rules_cmd=${STAGING_BINDIR_NATIVE}/fprint-list-udev-rules \
>> +"
>> +
>> +do_install:append:class-native () {
>> +       install -d ${D}${bindir}
>> +       install -m0755 ${B}/libfprint/fprint-list-udev-hwdb ${D}${bindir}/fprint-list-udev-hwdb
>> +       install -m0755 ${B}/libfprint/fprint-list-udev-rules ${D}${bindir}/fprint-list-udev-rules
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>> +
>> +USERADD_PACKAGES = "${PN}"
>> +GROUPADD_PARAM:${PN} = "fprint"
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101836): https://lists.openembedded.org/g/openembedded-devel/message/101836
>> Mute This Topic: https://lists.openembedded.org/mt/97950767/1686489
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


