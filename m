Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A123C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:22:32 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.26419.1680186142944369341
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kQhh7s7M;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y4so77257063edo.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680186141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=isZWzADjY3YVfeC3phCDbG2iysLswX8shYa3Eqm9WYw=;
        b=kQhh7s7MPUZ+ypx5YR60HQbDZ3FB4b0pQJKkxsnfB4wY2qGado0fo3mThfCoq06CEI
         +BjXshSnLcaaXRvnZu4cbMVQoJDLsVjRZWJUmBK89QhfWChS/tSpBIPKLblWnES2lD9+
         mD1fG0c1xKIYPn9PEOfcWaztSZReH5H/Mt9PHA9ddRgCagcjedl86+Tg9TPNW7MYbhtg
         tHDDhztNtv7u/u0fVdN4YCha6Z1YmkrulvHFWMf/UeGgXsmEbgy2msB/q+tOzZyqGh4E
         7t9QjIUu+Euz0QJ+SAT0RLmWSj3WzcDihs2Wosl7SKHlRokyJSJBPCiMUksVA4Ed5Mmn
         a2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680186141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isZWzADjY3YVfeC3phCDbG2iysLswX8shYa3Eqm9WYw=;
        b=Q9JmNX+eaJBsXcICh2adMp0DNihQvLV5OqJTk2d2Gybd4rz/DL1g4cO8l9Nw2mBGVL
         owSAgrfRMCaVwoipsCVtR/7BmRPMPi1k8ugm8CrK1+NP9/rbKuFeZvdaFAZP/GeNWb69
         1N4BjNoR/rXEEXYDnCQSm3MK0ytoVDb8gJn0VVTSBiMHjG6DKjx4R2n399U2MRnwssqQ
         Jpj/Po5o+Hd8LOwyPJgwvMX/8eHwD+7mCW2qGM3KkClkGYpKGQXvUJWUj7bHLYZnCVM6
         bouW0Mknc4Xl/Wmip/9ylVxsd58FrO+gbjH9Fdd7i3Ku441mxKB3CFMfvaWxmx0BqTLk
         SC0g==
X-Gm-Message-State: AAQBX9f8ut1WUYB6vMwg8ckcQMpU5ZkRB1kg6MRIN1z6y2Q7G8sG8ZHb
	fQQcSspC7koK48Jmc6j3E0Q=
X-Google-Smtp-Source: AKy350Yy2+wou9a0z7x0mmzgFqdLF9IQ4q8pR4aDfIkSiAIQV46FzkM9cwH+c6JBXyq7SD6q6XVsDQ==
X-Received: by 2002:a17:906:3786:b0:8dd:76d5:a82 with SMTP id n6-20020a170906378600b008dd76d50a82mr22609394ejc.47.1680186141315;
        Thu, 30 Mar 2023 07:22:21 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id qb16-20020a1709077e9000b0093f3d41b9ebsm6838873ejc.220.2023.03.30.07.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:22:21 -0700 (PDT)
Message-ID: <31833c0a-a00f-5966-3625-bb7ddc37c55d@gmail.com>
Date: Thu, 30 Mar 2023 16:22:20 +0200
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
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 14:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101839

2023. 03. 30. 15:50 keltezéssel, Alexander Kanavin írta:
> Meson is specifically configured in yocto to user qemu usermode as the
> wrapper to run cross binaries, so can libfprint build configuration be
> tweaked to use that? This would avoid all the nasty -native extensions
> and modifications.

Wasn't the mariadb change I made about 2 years ago
to use cmake's CROSSCOMPILING_EMULATOR that saved
building the whole mariadb-native just for one small binary
reverted recently because qemu doesn't emulate certain
parts of the instruction set and caused crashes?

The same principle applies to meson running binaries via qemu, too.

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


