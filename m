Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6530F013E8
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:57:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46535.1773651424917569422
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXb/5kjV;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so991418f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773651423; x=1774256223; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnJDITSKyptZouDtMRBb+E7QcTRuB0iHvABmn1eABWI=;
        b=bXb/5kjVG1pKadsU86rqkZpSpFfGNsXRXfex+uUQkaRqcQFDgd/mmJaQLvrTIlWQU3
         VsqMsw332t7WwAuhopGmaogHcKM8rRkTvekMI5i0N4JxfqoXClC0rZ30RU2i8fjQgtjV
         g/AHU/kzB/j2N0IfkTdCmUPsRqdrn5S1wfbDRXm5QPL+6xUpgfp/JoTDS0ZMvAX0+OG0
         cOkwR382gWrVmyPmEmg86FBKpSSrohxfyi72WxfEAkB3nAhtXGnCI0QrDec3WF7Akc8c
         /ICv+pR0rqFwwAAQArhsAqP3HLTQXNRku4wiOz9mnxKnGSDtCFPgheKWvVNMEPEE2ciB
         OXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651423; x=1774256223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnJDITSKyptZouDtMRBb+E7QcTRuB0iHvABmn1eABWI=;
        b=mhI/vQKNGT4WsCQLv1uAHrNFQH9sR2/Ewl0jyK+Th6Y/L2wdyWFIm925qJa6ldjKWe
         aXuuQM9Ek+L1O55/EPIpwl3DNOBJnayv/wLJJyMopAKK0pM91z+5C6b/IPFYE/M0bjPk
         vrrSWYMj1t1vBxdLLqeqibt0fM6SUvH32MFdT/omzUQ9iE51wdxCGnrwCddask2eSu3S
         zuw74hpuKUu9IkJW3VrcChTjW69S46VdTzCw6WdD8i2GQTcL6lyOp1OwTYh99AymU9ev
         gqCRWhvR89sOfmfxfmuhVsjPXynpKHGi7m5dBdLkco/IFki54pVTqt3d/8/L4Sjcu2hc
         1oxg==
X-Forwarded-Encrypted: i=1; AJvYcCXtp6T850rJrY6XLD6fbPjbALmv6aM/oqtmQsmi/LxmtPTnHpiow/uy7yl+bSCP3UPMKmSpo13g0K58KgcV2eX3bhg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxSV+G+0uET5DSEHhSmlv62v0laavgZEzHxs5YZPYcYMdDbL1qU
	4O7i15WL0kfdf/sLUwQMqCwvP5NCbes20DI0th4d3OJdf5EHOcsSjedtJFDZrQ==
X-Gm-Gg: ATEYQzx9zaVRpq0W5YIIZFJG+ozMsLUJoz5DlqBI5gMYDH2y33HyY0X3xGcDTKoNQsF
	uyXlRgu+ICKGN4BeYAorySlpvc5j6VsyeLX+r+uKrvNBRJB90UL4aYfGfN1Srktn8iy8ZedZE6g
	6CObC2Fo0dXPtr0pk4WPV6pZfiLTcIMI5CESmRIsCW3NWGQD3rHRYhzP/lkchK8y8Gud4ZyANyd
	hFko4GNsHZUbXWTRy8CSZeW7y19aCqSHHLWcrrSA66D9Ye7mt6nwqhw9R+pJmKOirs8PrG7wMem
	7BnmPEVLQZmVucwk298J9l2fEsYb2SHeOStF+PKcQBjPvgxgAsEQt0yWlYYmz4/+nm/tljanq6T
	8h7c24VuEDoMKh/Jjz5LSsVpORoNSww/T8jS75SYbT4r7SGAF2uzq0LI3LFzJFlyjr5q7nafzmD
	7FGtdWXUwzeSFXjeOD1Pe2a8n3lJAVRdE=
X-Received: by 2002:a05:6000:1869:b0:439:ddc0:4bef with SMTP id ffacd0b85a97d-43a04d80cb3mr21828996f8f.8.1773651422442;
        Mon, 16 Mar 2026 01:57:02 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b41ff92a6sm12987102f8f.11.2026.03.16.01.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:57:01 -0700 (PDT)
Message-ID: <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
Date: Mon, 16 Mar 2026 09:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: upgrade 2.18.10 to 3.0.0
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260316083826.1550599-1-changqing.li@windriver.com>
 <20260316083826.1550599-6-changqing.li@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260316083826.1550599-6-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125265



On 3/16/26 09:38, Changqing Li via lists.openembedded.org wrote:
> Changes:
> https://github.com/COVESA/dlt-daemon/releases
> 
> Remove patches already in 3.0.0:
> 544.patch
> 567.patch
> 0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
> 0003-allow-build-with-cmake-4.patch
> 
> Add 3 patches to fix build failures
> 0001-Fix-compile-failure-related-to-gzlog.patch
> 0001-Fix-kinds-of-build-failure.patch
> 0001-Fix-build-failures.patch
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../glib-2.0/glibmm-2.68_2.86.0.bb            |   4 +-


Is this glibmm change intentional in this patch?


>  ...e-DLT_WatchdogSec-can-be-set-by-user.patch |  40 --
>  .../dlt-daemon/0001-Fix-build-failures.patch  | 360 ++++++++++++++++++
>  ...Fix-compile-failure-related-to-gzlog.patch |  69 ++++
>  .../0001-Fix-kinds-of-build-failure.patch     | 174 +++++++++
>  .../0003-allow-build-with-cmake-4.patch       |  99 -----
>  .../dlt-daemon/dlt-daemon/544.patch           |  80 ----
>  .../dlt-daemon/dlt-daemon/567.patch           |  36 --
>  ...-daemon_2.18.10.bb => dlt-daemon_3.0.0.bb} |  10 +-
>  9 files changed, 610 insertions(+), 262 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.patch
>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure-related-to-gzlog.patch
>  create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch
>  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch
>  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>  delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.10.bb => dlt-daemon_3.0.0.bb} (91%)
> 
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
> index 621a85456d..b0c83f7eba 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
> @@ -2,8 +2,8 @@ SUMMARY = "C++ bindings for the glib library"
>  HOMEPAGE = "http://www.gtkmm.org/"
>  SECTION = "libs"
>  LICENSE = "LGPL-2.1-only & GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
> -                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
> +                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
>  
>  DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
>  
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
> deleted file mode 100644
> index 335872c40f..0000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Fri, 13 Dec 2024 16:37:24 +0800
> -Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can be set by user
> -
> -In my test env, WatchdogSec default value 2 is not enough, manually
> -changed to 3 is ok. This makes dlt.service/dlt-system.service start
> -failed during boot time. So, make DLT_WatchdogSec can be set by user, so
> -user can set them to proper value at build time, then service can start
> -successfully in boot time.
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> -Upstream-Status: Backport [https://github.com/COVESA/dlt-daemon/pull/720/commits/bc03f142507da92add8ba325fdf8187d47a7d719]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - systemd/CMakeLists.txt | 8 ++++++--
> - 1 file changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/systemd/CMakeLists.txt b/systemd/CMakeLists.txt
> -index 16cbe86b5..659378d16 100644
> ---- a/systemd/CMakeLists.txt
> -+++ b/systemd/CMakeLists.txt
> -@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)
> -     set(SYSTEMD_CONFIGURATIONS_FILES_DIR ${SYSTEMD_UNITDIR} )
> - 
> -     if(WITH_SYSTEMD_WATCHDOG)
> --        set( DLT_WatchdogSec 2 )
> -+        if(NOT DEFINED DLT_WatchdogSec)
> -+            set(DLT_WatchdogSec 2 CACHE STRING "Watchdog timeout in seconds")
> -+        endif()
> -         message( STATUS "The systemd watchdog is enabled - timeout is set to ${DLT_WatchdogSec} seconds")
> -     else(WITH_SYSTEMD_WATCHDOG)
> --        set( DLT_WatchdogSec 0 )
> -+        if(NOT DEFINED DLT_WatchdogSec)
> -+             set(DLT_WatchdogSec 0 CACHE STRING "Watchdog timeout in seconds")
> -+        endif()
> -         message( STATUS "The systemd watchdog is disabled")
> -     endif(WITH_SYSTEMD_WATCHDOG)
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.patch
> new file mode 100644
> index 0000000000..6cfa3a5482
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.patch
> @@ -0,0 +1,360 @@
> +From 4813b72cfe82062db41dd1d8cfa7069634d78d9e Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Mon, 16 Mar 2026 13:28:40 +0800
> +Subject: [PATCH] Fix build failures
> +
> +Fix the following similar build failures, some of the build failure
> +reproduced with arm64/riscv64, some of the build reproduced with 32bit
> +x86/arm.
> +
> +dlt_daemon_common.c:2785:26: error: conversion to 'int8_t' {aka 'signed char'} from 'char' may change the sign of the result [-Werror=sign-conversion]
> +
> +src/tests/dlt-test-multi-process-client-v2.c:302:49: error: format '%lld' expects argument of type 'long long int', but argument 2 has type 'time_t' {aka 'long int'} [-Werror=format=]
> +  302 |     printf(" Time running (seconds)        : %lld\n", time(NULL) - stats.first_message_time);
> +      |                                              ~~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +      |                                                 |                |
> +      |                                                 long long int    time_t {aka long int}
> +      |                                              %ld
> +
> +src/lib/dlt_user.c:5109:60: error: format '%lld' expects argument of type 'long long int', but argument 4 has type '__off_t' {aka 'long int'} [-Werror=format=]
> + 5109 |             dlt_vlog(LOG_DEBUG, "%s: Current file size=[%lld]\n", __func__,
> +      |                                                         ~~~^
> +      |                                                            |
> +      |                                                            long long int
> +      |                                                         %ld
> + 5110 |                      st.st_size);
> +      |                      ~~~~~~~~~~
> +      |                        |
> +      |                        __off_t {aka long int}
> +
> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/827]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/daemon/dlt-daemon.c                      |  8 ++---
> + src/daemon/dlt_daemon_client.c               | 32 ++++++++++----------
> + src/daemon/dlt_daemon_common.c               |  4 +--
> + src/lib/dlt_user.c                           | 18 +++++------
> + src/shared/dlt_common.c                      |  2 +-
> + src/shared/dlt_multiple_files.c              |  2 +-
> + src/tests/dlt-test-multi-process-client-v2.c |  8 ++---
> + src/tests/dlt-test-multi-process-v2.c        |  2 +-
> + src/tests/dlt-test-multi-process.c           |  2 +-
> + 9 files changed, 39 insertions(+), 39 deletions(-)
> +
> +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
> +index 523bf33..2ae5bc9 100644
> +--- a/src/daemon/dlt-daemon.c
> ++++ b/src/daemon/dlt-daemon.c
> +@@ -457,7 +457,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
> + 
> +     if (n < 0 || (size_t)n > sizeof(daemon_local->flags.loggingFilename)) {
> +         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n",
> +-                __func__, n, daemon_local->flags.loggingFilename);
> ++                __func__, (long int)n, daemon_local->flags.loggingFilename);
> +     }
> +     daemon_local->flags.enableLoggingFileLimit = false;
> +     daemon_local->flags.loggingFileSize = 250000;
> +@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()
> +     n = snprintf(tmp, DLT_PATH_MAX, "%s/dlt", dltFifoBaseDir);
> +     if (n < 0 || (size_t)n > DLT_PATH_MAX) {
> +         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n",
> +-                __func__, n, tmp);
> ++                __func__, (long int)n, tmp);
> +     }
> + 
> +     (void)unlink(tmp);
> +@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon *daemon, DltDaemonLocal *daemon_local,
> +         dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon,daemon_local,
> +                             msg.headerbuffer, sizeof(DltStorageHeader),
> +                             msg.headerbuffer + sizeof(DltStorageHeader),
> +-                            (size_t)(msg.headersize - (int32_t)sizeof(DltStorageHeader)),
> +-                            msg.databuffer, (size_t)msg.datasize, verbose);
> ++                            (int)(msg.headersize - (int32_t)sizeof(DltStorageHeader)),
> ++                            msg.databuffer, (int)msg.datasize, verbose);
> + 
> +         free(msg.databuffer);
> +     }else {
> +diff --git a/src/daemon/dlt_daemon_client.c b/src/daemon/dlt_daemon_client.c
> +index 50d8f19..20a512b 100644
> +--- a/src/daemon/dlt_daemon_client.c
> ++++ b/src/daemon/dlt_daemon_client.c
> +@@ -551,8 +551,8 @@ int dlt_daemon_client_send_message_to_all_client(DltDaemon *daemon,
> +     return dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon, daemon_local,
> +                 daemon_local->msg.headerbuffer, sizeof(DltStorageHeader),
> +                 daemon_local->msg.headerbuffer + sizeof(DltStorageHeader),
> +-                (size_t)(daemon_local->msg.headersize - (int32_t)sizeof(DltStorageHeader)),
> +-                daemon_local->msg.databuffer, (size_t)daemon_local->msg.datasize, verbose);
> ++                (int)(daemon_local->msg.headersize - (int32_t)sizeof(DltStorageHeader)),
> ++                daemon_local->msg.databuffer, (int)daemon_local->msg.datasize, verbose);
> + 
> + }
> + 
> +@@ -771,8 +771,8 @@ int dlt_daemon_client_send_control_message(int sock,
> +     if ((ret =
> +              dlt_daemon_client_send(sock, daemon, daemon_local, msg->headerbuffer, sizeof(DltStorageHeader),
> +                                     msg->headerbuffer + sizeof(DltStorageHeader),
> +-                                    (size_t)(msg->headersize - (int32_t)sizeof(DltStorageHeader)),
> +-                                    msg->databuffer, (size_t)msg->datasize, verbose))) {
> ++                                    (int)(msg->headersize - (int32_t)sizeof(DltStorageHeader)),
> ++                                    msg->databuffer, (int)msg->datasize, verbose))) {
> +         dlt_log(LOG_DEBUG, "dlt_daemon_control_send_control_message: DLT message send to all failed!.\n");
> +         return ret;
> +     }
> +@@ -1919,7 +1919,7 @@ void dlt_daemon_control_get_log_info(int sock,
> + 
> +     /* Allocate buffer for response message */
> +     resp.databuffer = (uint8_t *)malloc((size_t)resp.datasize);
> +-    resp.databuffersize = (size_t)resp.datasize;
> ++    resp.databuffersize = resp.datasize;
> + 
> +     if (resp.databuffer == 0) {
> +         dlt_daemon_control_service_response(sock,
> +@@ -2572,7 +2572,7 @@ int dlt_daemon_control_message_buffer_overflow(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -2633,7 +2633,7 @@ int dlt_daemon_control_message_buffer_overflow_v2(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -2686,7 +2686,7 @@ void dlt_daemon_control_service_response(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -2732,7 +2732,7 @@ void dlt_daemon_control_service_response_v2(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -2779,7 +2779,7 @@ int dlt_daemon_control_message_unregister_context(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -2842,7 +2842,7 @@ int dlt_daemon_control_message_unregister_context_v2(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -2909,7 +2909,7 @@ int dlt_daemon_control_message_connection_info(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -2962,7 +2962,7 @@ int dlt_daemon_control_message_connection_info_v2(int sock,
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -3010,7 +3010,7 @@ int dlt_daemon_control_message_timezone(int sock, DltDaemon *daemon, DltDaemonLo
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -3072,7 +3072,7 @@ int dlt_daemon_control_message_timezone_v2(int sock, DltDaemon *daemon, DltDaemo
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +@@ -3127,7 +3127,7 @@ int dlt_daemon_control_message_marker(int sock, DltDaemon *daemon, DltDaemonLoca
> + 
> +     if (msg.databuffer == 0) {
> +         msg.databuffer = (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize = (size_t)msg.datasize;
> ++        msg.databuffersize = msg.datasize;
> +     }
> + 
> +     if (msg.databuffer == 0)
> +diff --git a/src/daemon/dlt_daemon_common.c b/src/daemon/dlt_daemon_common.c
> +index 2f08c6a..65b264a 100644
> +--- a/src/daemon/dlt_daemon_common.c
> ++++ b/src/daemon/dlt_daemon_common.c
> +@@ -2782,7 +2782,7 @@ int dlt_daemon_user_send_log_state(DltDaemon *daemon, DltDaemonApplication *app,
> +     if (dlt_user_set_userheader(&userheader, DLT_USER_MESSAGE_LOG_STATE) < DLT_RETURN_OK)
> +         return -1;
> + 
> +-    logstate.log_state = daemon->connectionState;
> ++    logstate.log_state = (int8_t)daemon->connectionState;
> + 
> +     /* log to FIFO */
> +     ret = dlt_user_log_out2_with_timeout(app->user_handle,
> +@@ -2811,7 +2811,7 @@ int dlt_daemon_user_send_log_state_v2(DltDaemon *daemon, DltDaemonApplication *a
> +     if (dlt_user_set_userheader_v2(&userheader, DLT_USER_MESSAGE_LOG_STATE) < DLT_RETURN_OK)
> +         return -1;
> + 
> +-    logstate.log_state = daemon->connectionState;
> ++    logstate.log_state = (int8_t)daemon->connectionState;
> + 
> +     /* log to FIFO */
> +     ret = dlt_user_log_out2_with_timeout(app->user_handle,
> +diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
> +index 6d0098d..e432e26 100644
> +--- a/src/lib/dlt_user.c
> ++++ b/src/lib/dlt_user.c
> +@@ -5106,8 +5106,8 @@ DltReturnValue dlt_user_log_send_log(DltContextData *log, const int mtype, int *
> +                 return DLT_RETURN_ERROR;
> +             }
> + 
> +-            dlt_vlog(LOG_DEBUG, "%s: Current file size=[%ld]\n", __func__,
> +-                     st.st_size);
> ++            dlt_vlog(LOG_DEBUG, "%s: Current file size=[%lld]\n", __func__,
> ++                     (long long int)st.st_size);
> +             /* Check filesize */
> +             /* Return error if the file size has reached to maximum */
> +             unsigned int msg_size = (unsigned int)st.st_size + (unsigned int)msg.headersize +
> +@@ -5115,8 +5115,8 @@ DltReturnValue dlt_user_log_send_log(DltContextData *log, const int mtype, int *
> +             if (msg_size > dlt_user.filesize_max) {
> +                 dlt_user_file_reach_max = true;
> +                 dlt_vlog(LOG_ERR,
> +-                         "%s: File size (%ld bytes) reached to defined maximum size (%d bytes)\n",
> +-                         __func__, st.st_size, dlt_user.filesize_max);
> ++                         "%s: File size (%lld bytes) reached to defined maximum size (%d bytes)\n",
> ++                         __func__, (long long int)st.st_size, dlt_user.filesize_max);
> +                 dlt_mutex_unlock();
> +                 return DLT_RETURN_FILESZERR;
> +             }
> +@@ -5612,21 +5612,21 @@ DltReturnValue dlt_user_log_send_log_v2(DltContextData *log, const int mtype, Dl
> +                 return DLT_RETURN_ERROR;
> +             }
> + 
> +-            dlt_vlog(LOG_DEBUG, "%s: Current file size=[%ld]\n", __func__,
> +-                     st.st_size);
> ++            dlt_vlog(LOG_DEBUG, "%s: Current file size=[%lld]\n", __func__,
> ++                     (long long int)st.st_size);
> +             /* Check filesize */
> +             /* Return error if the file size has reached to maximum */
> +             unsigned int msg_size = 0;
> +             if (st.st_size < 0 || st.st_size > UINT_MAX) {
> +-                dlt_vlog(LOG_ERR, "%s: File size (%ld bytes) is invalid or too large for unsigned int\n", __func__, st.st_size);
> ++                dlt_vlog(LOG_ERR, "%s: File size (%lld bytes) is invalid or too large for unsigned int\n", __func__, (long long int)st.st_size);
> +                 return DLT_RETURN_FILESZERR;
> +             }
> +             msg_size = (unsigned int)st.st_size + (unsigned int) msg.headersizev2 + (unsigned int) log->size;
> +             if (msg_size > dlt_user.filesize_max) {
> +                 dlt_user_file_reach_max = true;
> +                 dlt_vlog(LOG_ERR,
> +-                         "%s: File size (%ld bytes) reached to defined maximum size (%d bytes)\n",
> +-                         __func__, st.st_size, dlt_user.filesize_max);
> ++                         "%s: File size (%lld bytes) reached to defined maximum size (%d bytes)\n",
> ++                         __func__, (long long int)st.st_size, dlt_user.filesize_max);
> +                 return DLT_RETURN_FILESZERR;
> +             }
> +             else {
> +diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
> +index 6ad354b..aa0aaaa 100644
> +--- a/src/shared/dlt_common.c
> ++++ b/src/shared/dlt_common.c
> +@@ -1220,7 +1220,7 @@ DltReturnValue dlt_message_header_flags_v2(DltMessageV2 *msg, char *text, size_t
> +             for (int i = 0; i<5; ++i){
> +                 tt = (tt << 8) | msg->headerextrav2.seconds[i];
> +             }
> +-            snprintf(text + strlen(text), textlength - strlen(text), "%ld.%.9u ", tt, msg->headerextrav2.nanoseconds);
> ++            snprintf(text + strlen(text), textlength - strlen(text), "%lld.%.9u ", (long long int)tt, msg->headerextrav2.nanoseconds);
> +         }
> +         else
> +             snprintf(text + strlen(text), textlength - strlen(text), "---------- ");
> +diff --git a/src/shared/dlt_multiple_files.c b/src/shared/dlt_multiple_files.c
> +index c4019e5..65529ff 100644
> +--- a/src/shared/dlt_multiple_files.c
> ++++ b/src/shared/dlt_multiple_files.c
> +@@ -257,7 +257,7 @@ ssize_t multiple_files_buffer_get_total_size(const MultipleFilesRingBuffer *file
> +             if (((unsigned int)res < sizeof(filename)) && (res > 0)) {
> +                 errno = 0;
> +                 if (0 == stat(filename, &status))
> +-                    size += status.st_size;
> ++                    size += (ssize_t)status.st_size;
> +                 else
> +                     fprintf(stderr, "file %s cannot be stat-ed, error=%s\n", filename, strerror(errno));
> +             }
> +diff --git a/src/tests/dlt-test-multi-process-client-v2.c b/src/tests/dlt-test-multi-process-client-v2.c
> +index 2bb1158..ec99720 100644
> +--- a/src/tests/dlt-test-multi-process-client-v2.c
> ++++ b/src/tests/dlt-test-multi-process-client-v2.c
> +@@ -299,10 +299,10 @@ void print_stats(s_statistics stats, s_parameters params)
> +     printf(" Messages received             : %d\n", stats.messages_received);
> +     printf(" Broken messages received      : %d\n", stats.broken_messages_received);
> +     printf(" Bytes received                : %d\n", stats.bytes_received);
> +-    printf(" Time running (seconds)        : %ld\n", time(NULL) - stats.first_message_time);
> +-    printf(" Throughput (msgs/sec)/(B/sec) : %ld/%ld\n",
> +-           stats.messages_received / ((time(NULL) - stats.first_message_time) + 1),
> +-           (stats.bytes_received) / ((time(NULL) - stats.first_message_time) + 1));
> ++    printf(" Time running (seconds)        : %lld\n", (long long int)(time(NULL) - stats.first_message_time));
> ++    printf(" Throughput (msgs/sec)/(B/sec) : %lld/%lld\n",
> ++           (long long int)(stats.messages_received / ((time(NULL) - stats.first_message_time) + 1)),
> ++           (long long int)((stats.bytes_received) / ((time(NULL) - stats.first_message_time) + 1)));
> + 
> +     if (params.messages_left == 0) {
> +         if (stats.broken_messages_received == 0)
> +diff --git a/src/tests/dlt-test-multi-process-v2.c b/src/tests/dlt-test-multi-process-v2.c
> +index 44a8622..1d3a54a 100644
> +--- a/src/tests/dlt-test-multi-process-v2.c
> ++++ b/src/tests/dlt-test-multi-process-v2.c
> +@@ -393,7 +393,7 @@ void *do_logging(void *arg)
> + 
> +         sleep_time = mksleep_time(data->params.delay, data->params.delay_fudge);
> +         ts.tv_sec = sleep_time / 1000000000;
> +-        ts.tv_nsec = sleep_time % 1000000000;
> ++        ts.tv_nsec = (long int)(sleep_time % 1000000000);
> +         nanosleep(&ts, NULL);
> +     }
> + 
> +diff --git a/src/tests/dlt-test-multi-process.c b/src/tests/dlt-test-multi-process.c
> +index 016c8b4..00fb11c 100644
> +--- a/src/tests/dlt-test-multi-process.c
> ++++ b/src/tests/dlt-test-multi-process.c
> +@@ -370,7 +370,7 @@ void *do_logging(void *arg)
> + 
> +         sleep_time = mksleep_time(data->params.delay, data->params.delay_fudge);
> +         ts.tv_sec = sleep_time / 1000000000;
> +-        ts.tv_nsec = sleep_time % 1000000000;
> ++        ts.tv_nsec = (long int)(sleep_time % 1000000000);
> +         nanosleep(&ts, NULL);
> +     }
> + 
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure-related-to-gzlog.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure-related-to-gzlog.patch
> new file mode 100644
> index 0000000000..f9692d9f4d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure-related-to-gzlog.patch
> @@ -0,0 +1,69 @@
> +From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 12 Mar 2026 19:37:11 +0800
> +Subject: [PATCH] Fix compile failure related to gzlog
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* In commit [1], gzlog is changed from gzFile to gzFile*, this cause
> +  failure:
> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21: error: passing argument 1 of ‘gzclose’ from incompatible pointer type [-Werror=incompatible-pointer-types]
> +   88 |         gzclose(data->gzlog);
> +      |                 ~~~~^~~~~~~
> +      |                     |
> +      |                     struct gzFile_s **
> +compilation terminated due to -Wfatal-errors.
> +
> +so change gzlog back to gzFile, so that all the gzxxx function can work
> +well.
> +
> +* Change to gzFile causes the following failure, since fileno need
> +  FILE*, according to code "config->gzlog = gzdopen(config->fd, mode)",
> +  seems we don't need to use fileno, just use config->fd is ok.
> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.c:1133:48: error: passing argument 1 of ‘fileno’ from incompatible pointer type [-Werror=incompatible-pointer-types]
> + 1133 |                         if (fsync(fileno(config->gzlog)) != 0) {
> +      |                                          ~~~~~~^~~~~~~
> +      |                                                |
> +      |                                                gzFile {aka struct gzFile_s *}
> +compilation terminated due to -Wfatal-errors.
> +
> +[1] https://github.com/COVESA/dlt-daemon/commit/543087ba98c103dc576edadeccf614c9dab1b9b3
> +
> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/826]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/offlinelogstorage/dlt_offline_logstorage.h          | 2 +-
> + src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinelogstorage/dlt_offline_logstorage.h
> +index fe38687..09ea5ce 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
> +@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig
> +     FILE *log;                      /* current open log file */
> +     int fd;                         /* The file descriptor for the active log file */
> + #ifdef DLT_LOGSTORAGE_USE_GZIP
> +-    gzFile *gzlog;                  /* current open gz log file */
> ++    gzFile gzlog;                   /* current open gz log file */
> + #endif
> +     void *cache;                    /* log data cache */
> +     unsigned int specific_size;     /* cache size used for specific_size sync strategy */
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +index f17fbb2..ff09c9e 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +@@ -1130,7 +1130,7 @@ int dlt_logstorage_prepare_on_msg(DltLogStorageFilterConfig *config,
> +                     (config->sync == DLT_LOGSTORAGE_SYNC_UNSET)) {
> + #ifdef DLT_LOGSTORAGE_USE_GZIP
> +                     if (config->gzip_compression == DLT_LOGSTORAGE_GZIP_ON) {
> +-                        if (fsync(fileno(config->gzlog)) != 0) {
> ++                        if (fsync(config->fd) != 0) {
> +                             if (errno != ENOSYS) {
> +                                 dlt_vlog(LOG_ERR, "%s: failed to sync gzip log file\n", __func__);
> +                             }
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch
> new file mode 100644
> index 0000000000..403d1089e2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-failure.patch
> @@ -0,0 +1,174 @@
> +From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 12 Mar 2026 20:06:34 +0800
> +Subject: [PATCH] Fix kinds of build failure
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fix kinds of build failures caused by -Werror=sign-conversion,
> +-Werror=cast-qual, -Werror=conversion etc.
> +Eg:
> +src/offlinelogstorage/dlt_offline_logstorage.h:129:49: error: unsigned conversion from ‘int’ to ‘unsigned int’ changes value from ‘-1’ to ‘4294967295’ [-Werror=sign-conversion]
> +  129 | #define DLT_LOGSTORAGE_GZIP_ERROR               -1 /* error case */
> +      |                                                 ^
> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36: note: in expansion of macro ‘DLT_LOGSTORAGE_GZIP_ERROR’
> + 1303 |         config->gzip_compression = DLT_LOGSTORAGE_GZIP_ERROR;
> +
> +      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16: error: conversion from ‘z_size_t’ {aka ‘long unsigned int’} to ‘int’ may change value [-Werror=conversion]
> +  851 |         return gzfwrite(ptr, size, nmemb, config->gzlog);
> +      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +src/console/dlt-control-common.c:922:25: error: cast discards 'const' qualifier from pointer target type [-Werror=cast-qual]
> +  922 |     json_object_to_file((char*)filename, json_filter_obj);
> +      |
> +
> +Use explicit type conversion to make the build can pass
> +
> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/826]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/console/dlt-control-common.c                       |  2 +-
> + src/daemon/dlt-daemon.c                                |  4 ++--
> + src/daemon/udp_connection/dlt_daemon_udp_socket.c      | 10 +++++-----
> + src/examples/dlt-example-multicast-clientmsg-view.c    |  8 ++++----
> + src/offlinelogstorage/dlt_offline_logstorage.h         |  2 +-
> + .../dlt_offline_logstorage_behavior.c                  |  4 ++--
> + 6 files changed, 15 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-common.c
> +index 2aeea280..4f9e95b4 100644
> +--- a/src/console/dlt-control-common.c
> ++++ b/src/console/dlt-control-common.c
> +@@ -919,7 +919,7 @@ DltReturnValue dlt_json_filter_save(DltFilter *filter, const char *filename, int
> +     }
> + 
> +     printf("Saving current filter into '%s'\n", filename);
> +-    json_object_to_file((char*)filename, json_filter_obj);
> ++    json_object_to_file(filename, json_filter_obj);
> + 
> +     return DLT_RETURN_OK;
> + }
> +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
> +index 97af1cd9..94024eb4 100644
> +--- a/src/daemon/dlt-daemon.c
> ++++ b/src/daemon/dlt-daemon.c
> +@@ -867,7 +867,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
> + 
> +                         if ((longval == MULTICAST_CONNECTION_DISABLED)
> +                             || (longval == MULTICAST_CONNECTION_ENABLED)) {
> +-                            daemon_local->UDPConnectionSetup = longval;
> ++                            daemon_local->UDPConnectionSetup = (int)longval;
> +                             printf("Option: %s=%s\n", token, value);
> +                         }
> +                         else {
> +@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
> +                     }
> +                     else if (strcmp(token, "UDPMulticastIPPort") == 0)
> +                     {
> +-                        daemon_local->UDPMulticastIPPort = strtol(value, NULL, 10);
> ++                        daemon_local->UDPMulticastIPPort = (int)strtol(value, NULL, 10);
> +                     }
> + #endif
> +                     else if (strcmp(token, "BindAddress") == 0)
> +diff --git a/src/daemon/udp_connection/dlt_daemon_udp_socket.c b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
> +index 4c40cda8..b3408773 100644
> +--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
> ++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
> +@@ -66,7 +66,7 @@ void dlt_daemon_udp_setmulticast_addr(DltDaemonLocal *daemon_local)
> +     struct sockaddr_in clientaddr;
> +     clientaddr.sin_family = AF_INET;
> +     inet_pton(AF_INET, daemon_local->UDPMulticastIPAddress, &clientaddr.sin_addr);
> +-    clientaddr.sin_port = htons(daemon_local->UDPMulticastIPPort);
> ++    clientaddr.sin_port = htons((uint16_t)daemon_local->UDPMulticastIPPort);
> +     memcpy(&g_udpmulticast_addr.clientaddr, &clientaddr, sizeof(struct sockaddr_in));
> +     g_udpmulticast_addr.clientaddr_size = sizeof(g_udpmulticast_addr.clientaddr);
> +     g_udpmulticast_addr.isvalidflag = ADDRESS_VALID;
> +@@ -224,17 +224,17 @@ void dlt_daemon_udp_clientmsg_send(DltDaemonClientSockInfo *clientinfo,
> + 
> +     if ((clientinfo->isvalidflag == ADDRESS_VALID) &&
> +         (size1 > 0) && (size2 > 0)) {
> +-        void *data = (void *)calloc(size1 + size2, sizeof(char));
> ++        void *data = (void *)calloc((size_t)(size1 + size2), sizeof(char));
> + 
> +         if (data == NULL) {
> +             dlt_vlog(LOG_ERR, "%s: calloc failure\n", __func__);
> +             return;
> +         }
> + 
> +-        memcpy(data, data1, size1);
> +-        memcpy(data + size1, data2, size2);
> ++        memcpy(data, data1, (size_t)size1);
> ++        memcpy((int*)data + size1, data2, (size_t)size2);
> + 
> +-        if (sendto(g_udp_sock_fd, data, size1 + size2, 0, (struct sockaddr *)&clientinfo->clientaddr,
> ++        if (sendto(g_udp_sock_fd, data, (size_t)(size1 + size2), 0, (struct sockaddr *)&clientinfo->clientaddr,
> +                    clientinfo->clientaddr_size) < 0)
> +             dlt_vlog(LOG_ERR, "%s: Send UDP Packet Data failed\n", __func__);
> + 
> +diff --git a/src/examples/dlt-example-multicast-clientmsg-view.c b/src/examples/dlt-example-multicast-clientmsg-view.c
> +index c00537e5..f8920453 100644
> +--- a/src/examples/dlt-example-multicast-clientmsg-view.c
> ++++ b/src/examples/dlt-example-multicast-clientmsg-view.c
> +@@ -74,9 +74,9 @@ int dlt_receiver_receive_socket_udp(struct clientinfostruct *clientinfo, DltRece
> +     /* wait for data from socket */
> +     unsigned int addrlen = sizeof(clientinfo->addr);
> + 
> +-    if ((receiver->bytesRcvd = recvfrom(clientinfo->fd,
> ++    if ((receiver->bytesRcvd = (int32_t)recvfrom(clientinfo->fd,
> +                                         receiver->buf + receiver->lastBytesRcvd,
> +-                                        receiver->buffersize - receiver->lastBytesRcvd,
> ++                                        (size_t)(receiver->buffersize - receiver->lastBytesRcvd),
> +                                         0,
> +                                         (struct sockaddr *)&(clientinfo->addr), &addrlen))
> +         <= 0) {
> +@@ -177,11 +177,11 @@ int main()
> +         dlt_receiver_receive_socket_udp(&clientinfo, &(clientinfo.receiver));
> + 
> +         while (dlt_message_read(&msg, (unsigned char *)(clientinfo.receiver.buf),
> +-                                clientinfo.receiver.bytesRcvd, 0, 0) == DLT_MESSAGE_ERROR_OK) {
> ++                                (unsigned int)clientinfo.receiver.bytesRcvd, 0, 0) == DLT_MESSAGE_ERROR_OK) {
> +             dlt_receive_message_callback_udp(&msg);
> + 
> +             if (dlt_receiver_remove(&(clientinfo.receiver),
> +-                                    msg.headersize + msg.datasize - sizeof(DltStorageHeader))
> ++                                    msg.headersize + msg.datasize - ((int32_t)(sizeof(DltStorageHeader))))
> +                 == DLT_RETURN_ERROR) {
> +                 /* Return value ignored */
> +                 dlt_message_free(&msg, 0);
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinelogstorage/dlt_offline_logstorage.h
> +index 09ea5ce4..cfb70f33 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
> +@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig
> +     int overwrite;                  /* Overwrite strategy */
> +     int skip;                       /* Flag to skip file logging if DISCARD_NEW */
> +     char *ecuid;                    /* ECU identifier */
> +-    unsigned int gzip_compression;  /* Toggle if log files should be gzip compressed */
> ++    int gzip_compression;           /* Toggle if log files should be gzip compressed */
> +     /* callback function for filter configurations */
> +     int (*dlt_logstorage_prepare)(DltLogStorageFilterConfig *config,
> +                                   DltLogStorageUserConfig *file_config,
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +index ff09c9eb..ae8f4442 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +@@ -848,10 +848,10 @@ DLT_STATIC int dlt_logstorage_write_to_log(void *ptr, size_t size, size_t nmemb,
> + {
> + #ifdef DLT_LOGSTORAGE_USE_GZIP
> +     if (config->gzip_compression == DLT_LOGSTORAGE_GZIP_ON) {
> +-        return gzfwrite(ptr, size, nmemb, config->gzlog);
> ++        return (int)gzfwrite(ptr, size, nmemb, config->gzlog);
> +     }
> +     else {
> +-        return fwrite(ptr, size, nmemb, config->log);
> ++        return (int)fwrite(ptr, size, nmemb, config->log);
> +     }
> + #else
> +     return (int)fwrite(ptr, size, nmemb, config->log);
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch
> deleted file mode 100644
> index ac5fec5684..0000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17 00:00:00 2001
> -From: Alper Ak <alperyasinak1@gmail.com>
> -Date: Wed, 9 Jul 2025 18:18:33 +0300
> -Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> - compatibility
> -
> -Fix:
> -
> -| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):
> -|   Compatibility with CMake < 3.5 has been removed from CMake.
> -|
> -|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> -|   to tell CMake that the project requires at least <min> but has been updated
> -|   to work with policies introduced by <max> or earlier.
> -|
> -|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> -|
> -|
> -| -- Configuring incomplete, errors occurred!
> -
> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/755]
> -
> -Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ----
> - CMakeLists.txt                   | 2 +-
> - examples/example1/CMakeLists.txt | 2 +-
> - examples/example2/CMakeLists.txt | 2 +-
> - examples/example3/CMakeLists.txt | 2 +-
> - examples/example4/CMakeLists.txt | 2 +-
> - 5 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 94185b8..2a0f619 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -14,7 +14,7 @@
> - #######
> - 
> - # Set minimum Cmake version and setup policy behavior
> --cmake_minimum_required(VERSION 3.3)
> -+cmake_minimum_required(VERSION 3.5)
> - 
> - if(${CMAKE_VERSION} VERSION_GREATER "3.20" OR ${CMAKE_VERSION} VERSION_EQUAL "3.20")
> -     cmake_policy(SET CMP0115 OLD)
> -diff --git a/examples/example1/CMakeLists.txt b/examples/example1/CMakeLists.txt
> -index 60644a1..44cd053 100644
> ---- a/examples/example1/CMakeLists.txt
> -+++ b/examples/example1/CMakeLists.txt
> -@@ -17,7 +17,7 @@
> - # DLT example implementation
> - #
> - 
> --cmake_minimum_required( VERSION 2.6 )
> -+cmake_minimum_required( VERSION 3.5 )
> - project( automotive-dlt-example1 )
> - 
> - #
> -diff --git a/examples/example2/CMakeLists.txt b/examples/example2/CMakeLists.txt
> -index 66a4f24..a8efbcf 100644
> ---- a/examples/example2/CMakeLists.txt
> -+++ b/examples/example2/CMakeLists.txt
> -@@ -17,7 +17,7 @@
> - # DLT example implementation
> - #
> - 
> --cmake_minimum_required( VERSION 2.6 )
> -+cmake_minimum_required( VERSION 3.5 )
> - project( automotive-dlt-example2 )
> - 
> - #
> -diff --git a/examples/example3/CMakeLists.txt b/examples/example3/CMakeLists.txt
> -index 45b7467..4d4958d 100644
> ---- a/examples/example3/CMakeLists.txt
> -+++ b/examples/example3/CMakeLists.txt
> -@@ -17,7 +17,7 @@
> - # DLT example implementation
> - #
> - 
> --cmake_minimum_required( VERSION 2.6 )
> -+cmake_minimum_required( VERSION 3.5 )
> - project( automotive-dlt-example3 )
> - 
> - #
> -diff --git a/examples/example4/CMakeLists.txt b/examples/example4/CMakeLists.txt
> -index 53a4fad..161c333 100644
> ---- a/examples/example4/CMakeLists.txt
> -+++ b/examples/example4/CMakeLists.txt
> -@@ -17,7 +17,7 @@
> - # DLT example implementation
> - #
> - 
> --cmake_minimum_required( VERSION 2.6 )
> -+cmake_minimum_required( VERSION 3.5 )
> - project( automotive-dlt-example4 )
> - 
> - #
> --- 
> -2.43.0
> -
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> deleted file mode 100644
> index 3699b8c83a..0000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/544]
> -
> -From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001
> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Thu, 28 Sep 2023 12:54:23 +0200
> -Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non amd64
> - and i386 arcs
> -
> ----
> - src/core_dump_handler/dlt_cdh.h         |  2 ++
> - src/core_dump_handler/dlt_cdh_cpuinfo.c | 33 +++++++++++++++++++++++++
> - src/core_dump_handler/dlt_cdh_crashid.c |  2 +-
> - 3 files changed, 36 insertions(+), 1 deletion(-)
> - create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c
> -
> -diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt_cdh.h
> -index d572ecf3..8608c6c4 100644
> ---- a/src/core_dump_handler/dlt_cdh.h
> -+++ b/src/core_dump_handler/dlt_cdh.h
> -@@ -55,6 +55,8 @@ typedef struct
> -     uint64_t pc;
> -     uint64_t ip;
> -     uint64_t lr;
> -+    uint64_t sp;
> -+    uint64_t fp;
> - 
> - } cdh_registers_t;
> - 
> -diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_handler/dlt_cdh_cpuinfo.c
> -new file mode 100644
> -index 00000000..03509fda
> ---- /dev/null
> -+++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
> -@@ -0,0 +1,33 @@
> -+/*
> -+ * SPDX license identifier: MPL-2.0
> -+ *
> -+ * Copyright (C) 2011-2015, BMW AG
> -+ *
> -+ * This file is part of COVESA Project DLT - Diagnostic Log and Trace.
> -+ *
> -+ * This Source Code Form is subject to the terms of the
> -+ * Mozilla Public License (MPL), v. 2.0.
> -+ * If a copy of the MPL was not distributed with this file,
> -+ * You can obtain one at http://mozilla.org/MPL/2.0/.
> -+ *
> -+ * For further information see http://www.covesa.org/.
> -+ */
> -+
> -+/*!
> -+ * \author Gianfranco Costamagna <locutusofborg@debian.org>
> -+ *
> -+ * \copyright Copyright © 2011-2015 BMW AG. \n
> -+ * License MPL-2.0: Mozilla Public License version 2.0 http://mozilla.org/MPL/2.0/.
> -+ *
> -+ * \file dlt_cdh_cpuinfo.c
> -+ */
> -+
> -+#include "dlt_cdh_cpuinfo.h"
> -+
> -+void get_registers(prstatus_t *prstatus, cdh_registers_t *registers)
> -+{
> -+/*    struct user_regs_struct *ptr_reg = (struct user_regs_struct *)prstatus->pr_reg;
> -+
> -+    registers->pc = ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
> -+
> -+}
> -diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_handler/dlt_cdh_crashid.c
> -index bca44e0e..8dd98d70 100644
> ---- a/src/core_dump_handler/dlt_cdh_crashid.c
> -+++ b/src/core_dump_handler/dlt_cdh_crashid.c
> -@@ -30,7 +30,7 @@
> - #include <stdio.h>
> - #include <string.h>
> - #include <errno.h>
> --#include <asm/prctl.h>
> -+#include <sys/prctl.h>
> - #include <inttypes.h>
> - 
> - #include "dlt_cdh.h"
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
> deleted file mode 100644
> index fd36480456..0000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/567]
> -
> -From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17 00:00:00 2001
> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Mon, 13 Nov 2023 12:37:23 +0100
> -Subject: [PATCH] dlt_cdh:
> -
> -Make sure on 64 bit we read an ELF64 structure.
> -Otherwise we get a read error, and the context file is missing some good
> -to know information
> ----
> - src/core_dump_handler/dlt_cdh.h | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt_cdh.h
> -index 8608c6c4..3dac480a 100644
> ---- a/src/core_dump_handler/dlt_cdh.h
> -+++ b/src/core_dump_handler/dlt_cdh.h
> -@@ -45,10 +45,17 @@
> - #define CORE_FILE_PATTERN           "%s/core.%d.%s.%d.gz"
> - #define CONTEXT_FILE_PATTERN        "%s/context.%d.%s.%d.txt"
> - 
> -+#if ((__SIZEOF_POINTER) == 4)
> - #define ELF_Ehdr    Elf32_Ehdr
> - #define ELF_Phdr    Elf32_Phdr
> - #define ELF_Shdr    Elf32_Shdr
> - #define ELF_Nhdr    Elf32_Nhdr
> -+#else
> -+#define ELF_Ehdr    Elf64_Ehdr
> -+#define ELF_Phdr    Elf64_Phdr
> -+#define ELF_Shdr    Elf64_Shdr
> -+#define ELF_Nhdr    Elf64_Nhdr
> -+#endif
> - 
> - typedef struct
> - {
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
> index 82edde6c9d..838a619a42 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
> @@ -17,12 +17,11 @@ DEPENDS = "zlib gzip-native json-c"
>  SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
>             file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>             file://0004-Modify-systemd-config-directory.patch \
> -           file://544.patch \
> -           file://567.patch \
> -           file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch \
> -           file://0003-allow-build-with-cmake-4.patch \
> +           file://0001-Fix-compile-failure-related-to-gzlog.patch \
> +           file://0001-Fix-kinds-of-build-failure.patch \
> +           file://0001-Fix-build-failures.patch \
>             "
> -SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
> +SRCREV = "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
>  
>  
>  PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
> @@ -71,4 +70,5 @@ FILES:${PN}-doc += "${datadir}/dlt-filetransfer"
>  
>  do_install:append() {
>      rm -f ${D}${bindir}/dlt-test-*
> +    sed -i -e 's:${RECIPE_SYSROOT}::g' ${D}/usr/lib/pkgconfig/automotive-dlt.pc
>  }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125263): https://lists.openembedded.org/g/openembedded-devel/message/125263
> Mute This Topic: https://lists.openembedded.org/mt/118341597/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


