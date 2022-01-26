Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EEEC5AC75
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 00:50:25 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.6261.1643158224788106815
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 16:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1Y8sQYs;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id a12so11686643qkk.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 16:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NjB5CJT2+IWhyf9BsFv5ECMAdXVl1IpHLfPcza9lJb0=;
        b=L1Y8sQYsB4SbRtcc5DYttNAJJbUM0CJVjs5Zd1WhQlLHZS1vL94PZCwrmalfn3mNCg
         emkHaHvTzVTyeh9Eoa9z/ZaVFF5Q9GH2L6pfKR2pJCeu9tRIbqoL8rnW/zjjvz6Y4gYM
         ID2Drn9cUSxIz/xJw7pFSCFnQ7KUdTQHgwZmxRSj4/NKYl1a8zjeYGFsQRuNnbcWw2Qw
         11R2jPci65aEDOSza4TfG1UO0pstU0xnYhmM4hss8Dmx2x+BWZKYhPVM3qXuDfLfHHOg
         XpoYTUGYalUnC8B+F/4DEDk03HnWmx8jfAauqjGjVhhjBWAntKgZaGetluWQYYLtuBhk
         E06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NjB5CJT2+IWhyf9BsFv5ECMAdXVl1IpHLfPcza9lJb0=;
        b=e6Vi2ZypiYAFVhQ8julOI5sWWRbptwT8ukYbbBbIsoyfgunyxNqp2QZwoNvnE13YMI
         VTBBC4cJ9GpQ+NNWDNgp/SrdybpG3IR7G8hjMTkmQqYYfqXzT7B4HcZH2Z74e6SzJQmB
         KkcmYnLEK4P7//M9Dav3Gj1u3GmmU2NG/9AmHI8PmrGG1Thema7BUOCu8Ye+CmmwSTBA
         C47Gb2Ghbl5WQD6/OjtvO7ETVqEkDpTFLAVNyPkxvzL8V7EoiXYeix8kLfXwGko1k8Lj
         LQ1I0KspcTrllNzcZgjlFrai2hP2ihgz4W6y8QlU+P5yo5r4WaLZc+pJo/u5ZSvyrHjF
         e7Rw==
X-Gm-Message-State: AOAM532zF8IHaP30Cm7mm25fSECu9q8nO1GaCVmvavbrgdqBhJAYDDTI
	Bs3noiahHIBT04QOifx7gHVOxnaSD9iFPbvfzIU=
X-Google-Smtp-Source: 
 ABdhPJwry6JkFnoBQMV5xiOh0Xnf51SyM+LYTqTLqt0/3MnTZigOhiOrLkGW2YaZqYEFiA7W0NxisGPihCmoznijJKQ=
X-Received: by 2002:a37:5541:: with SMTP id
 j62mr16295084qkb.180.1643158223747;
 Tue, 25 Jan 2022 16:50:23 -0800 (PST)
MIME-Version: 1.0
References: <1643092604-6478-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1643092604-6478-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2022 16:49:57 -0800
Message-ID: 
 <CAMKF1sptgvi3Np-TWQ=CVNXJDHLcD5Q=Bt1s+khpMFvvmeiZqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] dlt-daemon: upgrade 2.18.7 -> 2.18.8
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 00:50:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95087

fails on mips/glibc and x86/musl perhaps more combinations too see

https://errors.yoctoproject.org/Errors/Details/623558/

On Mon, Jan 24, 2022 at 10:37 PM wangmy <wangmy@fujitsu.com> wrote:
>
> 317.patch
> removed since it is included in 2.18.8
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> lib: Fix wrong type alert from lgtm
> gtest_dlt_daemon_gateway: fix gtest build failed
> lib: generate dlt library internal log file
> tests: add stdlib to dlt_cpp_extension
> dlt_user: Make dlt_init thread safe
> remove clang-tidy analyzer warnings: incompatible pointer type
> debian: improve debian build package
> dlt-control-common: shutdown and close socket
> dlt_common: improve function description
> gtest: Bring-in changes
> gtest: Rework WORKING_DIRECTORY
> gtest: Correct data amount in gtest_dlt_common
> cmake: Set empty to systemd_SRCS
> gtest: Refactor tests/CMakeLists.txt
> lib: Add SOCK_CLOEXEC to socket
> daemon: Create parent directory for unix socket
> cmake: Correct added subdirectories
> console: Add cmake options for control and timestamp
> tests: Adapt to DLT_DISABLE_MACRO
> header: Adapt to DLT_DISABLE_MACRO
> include: Refactor CMakeLists.txt
> gtest: Change script name to gtest_dlt_daemon_offline_log.sh
> daemon: Enable to use FIFO on QNX
> tests: Add new test case with given buffer
> tests: Enable macro disabling
> lib: Add new interfaces with given buffer
> Implemention of tests for the dlt-qnx-system module
> lib: Add MaxFileSize handling
> client: pthread_join for deinit
> doc: update initial log level document
> dlt-system: Fix memory leak in dlt-system config
> dlt_common: remove duplicate stdbool header
> dlt-control: Add option to config port
> system: use signalfd for dlt-system
> console: provides args option to enable send/receive serial header
> fix malformed printf format strings (#295)
> cmake: Set WITH_LEGACY_INCLUDE_PATH to ON as default (#334)
> Make the legacy include path a CMake option (#332)
> daemon: Call dlt_daemon_configuration_load() properly (#330)
> dlt_user: Use pthread_setname_np() if available (#326)
> libdlt: Add legacy include path in exported CMake config file (#327)
> lib: Set TYLE to 1 for BOOL type (#320)
> file-transfer: Abort file transfer if get serial number failed
> dlt_user.c: fixing casting wrong type
> dlt-sortbytimestamp: Remove duplicated conditional statements code
> dlt-convert: Remove duplicated conditional statements code
> doc: Minor fix in dlt_for_developers.md (#321)
> dlt-control-common.c: Fix build failure due to out-of-bound write -Werror=
=3Dstringop-truncation
> Extend include path in *.pc file (#319)
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../dlt-daemon/dlt-daemon/317.patch           | 43 -------------------
>  ...-daemon_2.18.7.bb =3D> dlt-daemon_2.18.8.bb} | 11 +++--
>  2 files changed, 5 insertions(+), 49 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.pa=
tch
>  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.7.bb =3D> dl=
t-daemon_2.18.8.bb} (90%)
>
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch b/m=
eta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> deleted file mode 100644
> index fe40334b6..000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Origin: https://github.com/GENIVI/dlt-daemon/pull/317
> -From 55d31216823841a1547fe261cdf8e3b1002d5f94 Mon Sep 17 00:00:00 2001
> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Thu, 1 Jul 2021 12:58:20 +0200
> -Subject: [PATCH] dlt-control-common.c: Fix build failure due to out-of-b=
ound
> - write -Werror=3Dstringop-truncation
> -
> -cd /build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/src/console/logstorage =
&& /usr/bin/cc -DCONFIGURATION_FILES_DIR=3D\"/etc\" -DDLT_DAEMON_USE_FIFO_I=
PC -DDLT_LIB_USE_FIFO_IPC -DDLT_NETWORK_TRACE_ENABLE -DDLT_SYSTEMD_ENABLE -=
DDLT_SYSTEMD_JOURNAL_ENABLE -DDLT_UNIT_TESTS -DDLT_USER_IPC_PATH=3D\"/tmp\"=
 -DDLT_USE_IPv6 -DEXTENDED_FILTERING -D_GNU_SOURCE -I/build/dlt-daemon-2.18=
.7 -I/build/dlt-daemon-2.18.7/obj-x86_64-linux-gnu/include/dlt -I/build/dlt=
-daemon-2.18.7/include/dlt -I/build/dlt-daemon-2.18.7/src/shared -I/build/d=
lt-daemon-2.18.7/src/core_dump_handler -I/build/dlt-daemon-2.18.7/src/offli=
nelogstorage -I/build/dlt-daemon-2.18.7/src/lib -I/build/dlt-daemon-2.18.7/=
src/daemon -I/build/dlt-daemon-2.18.7/src/console -I/build/dlt-daemon-2.18.=
7/src/gateway -I/build/dlt-daemon-2.18.7/systemd/3rdparty -g -O2 -ffile-pre=
fix-map=3D/build/dlt-daemon-2.18.7=3D. -fstack-protector-strong -Wformat -W=
error=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=3D2   -Werror -std=3D=
gnu99 -Wall -Wextra -Wno-variadic-macros -Wno-strict-aliasing -o CMakeFiles=
/dlt-logstorage-ctrl.dir/__/dlt-control-common.c.o -c /build/dlt-daemon-2.1=
8.7/src/console/dlt-control-common.c
> -make[3]: Leaving directory '/build/dlt-daemon-2.18.7/obj-x86_64-linux-gn=
u'
> -In file included from /usr/include/string.h:495,
> -                 from /build/dlt-daemon-2.18.7/src/console/dlt-control-c=
ommon.c:56:
> -In function 'strncpy',
> -    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src/=
console/dlt-control-common.c:716:13:
> -/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '__=
builtin_strncpy' specified bound 4 equals destination size [-Werror=3Dstrin=
gop-truncation]
> -  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (_=
_dest));
> -      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> -In function 'strncpy',
> -    inlined from 'dlt_json_filter_load' at /build/dlt-daemon-2.18.7/src/=
console/dlt-control-common.c:721:13:
> -/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: '__=
builtin_strncpy' specified bound 4 equals destination size [-Werror=3Dstrin=
gop-truncation]
> -  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (_=
_dest));
> -      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> -
> -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ----
> - src/console/dlt-control-common.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-=
common.c
> -index 8a9d29f0..f58d8268 100644
> ---- a/src/console/dlt-control-common.c
> -+++ b/src/console/dlt-control-common.c
> -@@ -671,8 +671,8 @@ DltReturnValue dlt_json_filter_load(DltFilter *filte=
r, const char *filename, int
> -     struct json_object *j_payload_max;
> -     enum json_tokener_error jerr;
> -
> --    char app_id[DLT_ID_SIZE] =3D "";
> --    char context_id[DLT_ID_SIZE] =3D "";
> -+    char app_id[DLT_ID_SIZE + 1] =3D "";
> -+    char context_id[DLT_ID_SIZE + 1] =3D "";
> -     int32_t log_level =3D 0;
> -     int32_t payload_max =3D INT32_MAX;
> -     int32_t payload_min =3D 0;
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb b/m=
eta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
> similarity index 90%
> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
> index e5a3c7c29..c3fa4677e 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
> @@ -15,11 +15,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8184208060=
df880fe3137b93eb88aeea"
>  DEPENDS =3D "zlib gzip-native json-c"
>
>  SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps;branch=
=3Dmaster \
> -    file://0002-Don-t-execute-processes-as-a-specific-user.patch \
> -    file://0004-Modify-systemd-config-directory.patch \
> -    file://317.patch \
> -"
> -SRCREV =3D "24d197214bfdcec7430d31b42e5c87df27287aaf"
> +           file://0002-Don-t-execute-processes-as-a-specific-user.patch =
\
> +           file://0004-Modify-systemd-config-directory.patch \
> +           "
> +SRCREV =3D "1438fcf8c88cd47b20b2984180a8457c3eb9193d"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -31,7 +30,7 @@ PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATUR=
ES', 'systemd', ' systemd s
>  PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXA=
MPLES=3DOFF,,dlt-daemon-systemd"
>
>  # Linux options
> -PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF,sys=
temd"
> +PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF -DW=
ITH_DLT_SYSTEM=3DOFF,systemd"
>  PACKAGECONFIG[systemd-watchdog] =3D "-DWITH_SYSTEMD_WATCHDOG=3DON,-DWITH=
_SYSTEMD_WATCHDOG=3DOFF,systemd,libsystemd"
>  PACKAGECONFIG[systemd-journal] =3D "-DWITH_SYSTEMD_JOURNAL=3DON,-DWITH_S=
YSTEMD_JOURNAL=3DOFF,systemd,libsystemd"
>  PACKAGECONFIG[dlt-dbus] =3D "-DWITH_DLT_DBUS=3DON,-DWITH_DLT_DBUS=3DOFF,=
dbus,dbus-lib"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95052): https://lists.openembedded.org/g/openembedded=
-devel/message/95052
> Mute This Topic: https://lists.openembedded.org/mt/88666815/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

