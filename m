Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2EEC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 18:05:48 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.229.1642788347337813232
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 10:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B7cB97Ak;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 193so10722941qkh.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 10:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3WXRFqfgACRpWWH1PAO6XwWNFwexMHW5G+jlxm/b+6E=;
        b=B7cB97AkVsoDlIMS+4a+J/7KqA2aS6y83yxeDRWQm7hLPFSqFGVDLfINWykfzia/wB
         9j5mtDwNHbongOaL86tHSph221gZCeBJFTeJ1QQaLEXD2XtR6tFQkH81zgwld9pHhmG+
         Ze8s0WWrOhcTHhxpk+8twxymfSdhjga6gLCqWUhdgvHbqLRG8N67syLsSXzdQxY7e3UZ
         vxonNGZRK1w8aYGyp5zmGYv7MsoMNLLFXTwyZU/jq+LqioeEYrIQaPk0S0YDaO0Pamxj
         Ut3ZnCNFrjFwzkpyJq3XL9FvBQHD5bjqv6teLhH2+L19u9YLMQ1Pa3O4pKIHJToKJ3ls
         pJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3WXRFqfgACRpWWH1PAO6XwWNFwexMHW5G+jlxm/b+6E=;
        b=YIRGpVk/Y4vMAiJMlVP7N4Yc5C2rScvEXVa7VC0nTcERb/dAWgU2td4TJinn/FE+bm
         MUF+DHceUqLa7QLjnakJyS6zus/yBOUSbNGPcxWX0EwFoOnuBsktYuxRjS/2Xr0CXRSd
         HFjsAgjoOf8IfR2nO+JSGcvptCOrL44+Kfq2AJh7swu8UrYt/N/IYlDWVFfn2v+PUV3F
         0s+lvQe51W1moSN9L8EucutEq9LbMkbQ7KzWupinfbt5MiYl7Md1WICK9lyM57Bwt0yd
         eoW8+OVkbmPH2amZGsrVJ9h0TWKxZ7LAt6hTbhfBmjUgw7/uJleEWsGlNsP5IYNVwyCX
         lATQ==
X-Gm-Message-State: AOAM5308q1W/bS7zY01MNERJKFTMVb55JK5OhsswZSvw9sl+hov9Tb3R
	cYI9T6eGyE7vNwjpvXSby62tfiQtE1oosACmP5k=
X-Google-Smtp-Source: 
 ABdhPJyQLu7dauM7KHS6r2+m4Y+puKWp6Cs0h2wH5SdWblsVW477E0AkIzzGwHiXgqtP2cdIz67wV5Nqtf0IAAKMFsY=
X-Received: by 2002:a37:5541:: with SMTP id j62mr3567952qkb.180.1642788346274;
 Fri, 21 Jan 2022 10:05:46 -0800 (PST)
MIME-Version: 1.0
References: <1642725323-23968-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1642725323-23968-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jan 2022 10:05:17 -0800
Message-ID: 
 <CAMKF1soMTioS9bR31U4eG8vjDLN7TcU9gYc9YfHnP2M5VTzMkA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] dlt-daemon: upgrade 2.18.7 -> 2.18.8
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 18:05:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94976

fails to build see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1376

On Thu, Jan 20, 2022 at 4:36 PM wangmy <wangmy@fujitsu.com> wrote:
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
>  ...-daemon_2.18.7.bb =3D> dlt-daemon_2.18.8.bb} |  9 ++--
>  2 files changed, 4 insertions(+), 48 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/317.pa=
tch
>  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.7.bb =3D> dl=
t-daemon_2.18.8.bb} (93%)
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
> similarity index 93%
> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.7.bb
> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
> index e5a3c7c29..fc90d30b8 100644
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
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94960): https://lists.openembedded.org/g/openembedded=
-devel/message/94960
> Mute This Topic: https://lists.openembedded.org/mt/88573650/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

