Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F7EC6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 06:01:16 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.15718.1680328873304837590
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 23:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PC5FO9sS;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id ew6so97902563edb.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Mar 2023 23:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680328871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbh5bHZl7yulg+CR1hZc+/jfmjyIgCugCRwU0g2f4hU=;
        b=PC5FO9sS3wWCb8sm6aHFTaNLXcTBekv4XHFsChMuvBZBxUPamer3YRmB4SoqcLSR0i
         0ZTNZ0yb2I3U2cpdV3BSAFfpajaR9E8Ib2oDV6gK1XXVjmm5XW+j32QWErrxbkOB13g/
         jvVzNSW26y2AwM3sk27y3dLtVgNZLj+C2RjjI4X8RH/mR/q/AmoD49+eL1Ve6dMecexU
         vx1bVlpZT4tXbWlPFlKDSa6c+N+O2A/hWqdmS66+HAYJx3U5FCobYWavHiBbF1SqA8/6
         BW0wJ4r2Nr6N5mO8t1BOQoKcxKcLv9Z7IrXYjeDFEjyy0sj9gYICxy8EMvKizohOOgLa
         QukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680328871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbh5bHZl7yulg+CR1hZc+/jfmjyIgCugCRwU0g2f4hU=;
        b=61s1Dm1SPqwzT7OYHc6BXBYFphY/881kCcB9imbD465xfO9FR3RXG3ucW+XwHMpHO2
         NW6texRbVyQygPPdS5KG/GC3qR+tmgGFGDam+Ht9UP0B1JxqTjVEQCmYjR4Vdu4JHdgP
         WpDidmeocnPsSYxrQE5YNpAe0VDGEIo4OwgGypPJXPZHx/O8r4cto8AHT63p7+g1zyLc
         9E3TV0ordIZL/phDh53/E7LR8Y5isb8H/Kn9h3bz0qY9x7GOsR4WyYEcEP7nS9mFTbSP
         LNgiANP3h47NTdvGm7HDuSFqZBx2DUGJ1E4bM33GpQ6m8CfVdMCFjQWKFhZlEii6aQJB
         XWCw==
X-Gm-Message-State: AAQBX9eHHKP3vxULgvVLziHvFYEFUuaNCWP3cKmWB+Dq6EWL9Njw+LXn
	QWkAVlS4ve21WmGEh6q7mBA=
X-Google-Smtp-Source: AKy350YII/+mqPLOE5q1toJINqkdemKD8ez6cIy3nGveO3rDA0P1C6O70f3CVpo53Ogs6hKzjGhBsg==
X-Received: by 2002:a17:906:2513:b0:907:183f:328a with SMTP id i19-20020a170906251300b00907183f328amr26638178ejb.65.1680328871378;
        Fri, 31 Mar 2023 23:01:11 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id s18-20020a1709067b9200b008b904cb2bcdsm1780008ejo.11.2023.03.31.23.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 23:01:11 -0700 (PDT)
Message-ID: <92071a0d-c230-85dc-f704-e96165710a15@gmail.com>
Date: Sat, 1 Apr 2023 08:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-oe][PATCH 2/3] libfprint: New recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230330134302.2789448-1-zboszor@gmail.com>
 <20230330134302.2789448-2-zboszor@gmail.com>
 <CAMKF1srTH30WD2-eaK66bCU9wjmF-XsrxCfQzT1SJy375n=mHA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1srTH30WD2-eaK66bCU9wjmF-XsrxCfQzT1SJy375n=mHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 06:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101866

2023. 03. 31. 19:41 keltezéssel, Khem Raj írta:
> It needs to address native deps on udev-native I am seeing
>
> ERROR: Nothing PROVIDES 'udev-native' (but
> virtual:native:/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-support/libfprint/libfprint_1.94.5.bb
> DEPENDS on or otherwise requires it).

This is a problem with using two different mailing lists
and separate layers. Interconnected changes are often
overlooked without taking the changed in the other layer.

This particular problem is addressed by the systemd change
with BBCLASSEXTEND = "native" and other tweaks which
was sent to the openembedded-core ML and is being debated there.

FWIW, this meson bug prevents libfprint to use the exe_wrapper,
which would make the systemd-native recipe unnecessary:
https://github.com/mesonbuild/meson/issues/11029

> On Thu, Mar 30, 2023 at 6:43 AM Zoltan Boszormenyi <zboszor@gmail.com> wrote:
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
>> Mute This Topic: https://lists.openembedded.org/mt/97950767/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


