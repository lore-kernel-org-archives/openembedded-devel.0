Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C18FCD0A7
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 04:53:36 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7146.1773809613085593910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 21:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QyoS6Ups;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad8435f46so7086756d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 21:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773809612; cv=none;
        d=google.com; s=arc-20240605;
        b=SYIjmBfLHBum65Bp9H+/czAGmIt7+f2mHb9nIjJzcXZaMZC/WRhAoHZbWIG43UmaeR
         A7V3NrOuwLeI/ZmCezKHhzekFm/09iJgX/rRLWaQKy2aNIFtPYDIlmRmdSsIXfhovH1T
         uem2PhbCGsRJ/o/O6ZbnpheHPQ1wfjska+zCDqUincO9rBcaKZB45Bn5DOwt+avDfxVv
         Yl73KjEBkdShmRdmIN3xd8RQMigbs5KopwW7RJECGrCtH0ZIAHIrcR4EWfJkGSqOna3q
         Gz3XX+O5KIfe0s9ygJOS4ZMHvHYD2YCK7qYCoko0UBU45I8AymtsEqS6pve/dhfwwkG3
         MpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kkRNDDNtUxJM9vFXPBm7uoJUusXOG7ns1OKdEumRu6w=;
        fh=IdKuTZhrygwjS6H9YujwhjKTm1acyyh7Q88keTxiug4=;
        b=XLpuqOczoddDkJy8fBYkoav9gFbNhh2YTjVnah9d5PimzejuviwzC3HnmaSfAN0J8+
         2Depb2XQtrMbP0rDT3vC66VV7nNtZ5k87BXjbXu49Yx1p/vd1ImRQdvpr4ndGQERuOL4
         vg2WML01S2LxN2RADYkoCf2uOnT1mv4lyBBpjRjkejs9emgQS7roe0FIx/xjm4IWzkSD
         CzLl8Q1hmXsetZT/8ayESfrOvBw0T2ntlmfacmvTztw4r7ot0NASuNtjbXsaCoGvcTHj
         OTjsu3LRaoUhvqoQ5tBFtZoBCbjie6qClqpcinJDPW764sNpdmoaTXfDFOY67cQtXQ9Y
         gLlg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773809612; x=1774414412; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kkRNDDNtUxJM9vFXPBm7uoJUusXOG7ns1OKdEumRu6w=;
        b=QyoS6UpsZI/qySPdyOwuxjxlNyy76TdESSqq2/fsGV6bxliOcsnyF50Of7QhixcpIO
         UnBltPVY/FuYBsYRIrc6Jdu9bjn7tPE/mXmWG9nMfyogY1YIr7peNFztACreED8bc1/0
         1ZtR3zrVUbOVsvEGwCZcDa/ZQ7yHIWCV5NN6r0IrJbaDjdOJHhqxPWEwGik9KZfAE226
         NFzt6IV5x3HH1wUf7PbSPkHBjmnEz4Epd6u2hKaK79NKHTJzc671e7dXsfm82P5Es62B
         v4HWBtBmGV7JG/ksTBXahYR5z0+pnydWqMxh6jTOI+KP1zBEJhlTUPRgAufdvd98heOC
         DTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773809612; x=1774414412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkRNDDNtUxJM9vFXPBm7uoJUusXOG7ns1OKdEumRu6w=;
        b=dLpI8q8ICE0ANWBH33qvc5jZCSG5ESmb1BpBprWiDyIgSQVlnqJx9bIjokOczpBfcQ
         eH9+mnPIkTKkdKfIfYGwyVGYtfwC03NMJY5RZyzN8qa7I3ASjJ+gmGnhyC5jbD6jFiGa
         7somzbYAMB4qMutJJ6rJsX+WaGre/KvSlZFnSqNhwuX4ufY3EM843Bml039AHk9Q98d6
         7HZsQPSKPrLRWEoprnFPU0dPD/XwW3Xut/a2g8T9dGu440ApsNIx3LHc2AYzMvQ/4SlY
         wT4mMJCgJvJCfF56NEYuVooEOA+yjvyGAfDEp1ZzkUxDHfwwBr4t9J6IfxIJA/5hDn+k
         x0sA==
X-Gm-Message-State: AOJu0YxsLogwXK3SW9YcPpVtpJ7CMCXh+QkKW+RpkjNjfFLIqTQ3KZam
	GQoCPSegC/ZV9ZEAXGs78QGQQF2tzz2FFCWozuvOwXmyMFU6VkYB87iJ0WU954sVjuMCtS4KKf0
	r71kKLQBswXMlWA6EYXKVB/5GKI4iHsrSiYNX
X-Gm-Gg: ATEYQzzGUtzwwE0ja0reSmCgZvpPIPqsozyYrOhp2wz4DZbS1wkRIoL4CXWMYQmgtp5
	0nQC3Pd+7RdfT/bh7fmYEBp2xbaIWl3vh6F8utld/Cl/Vvfy3kKMepC0rMCr21YfEpDgY0uDFhX
	dOFlLNDgQESyevoNGPid3R38H/YRUfrKLdDHZMo+1oAiaNQnbe+twHoOsEizyZeFKBCbR2hGOho
	yA/Hn9dRBChbozFSSdx3YjIb/cBuS23mXzqZ80qegu6wzhgDRPzM4L75essnUdScAI35hcV+0M+
	+9mIeCPXg1p1CEc2qpGCwt4Sk0bD8dycfvZJl1EoCRMNNR55IFXeUqIE+N0WhkJRa2oAECw9KBo
	yS/LH6nmrmAA6goUKYKnVoQh6X6rPUq8kC2Y=
X-Received: by 2002:a53:ecdd:0:b0:64c:9a9a:e2c9 with SMTP id
 956f58d0204a3-64e915db56dmr1529184d50.60.1773809611614; Tue, 17 Mar 2026
 21:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260317093126.2796106-1-changqing.li@windriver.com>
In-Reply-To: <20260317093126.2796106-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 21:53:03 -0700
X-Gm-Features: AaiRm51_hvYb0NTXVyOCQJZUU4KWuJ6mc8eTMmbLOID700fL8akuJUHdvsoa154
Message-ID: <CAMKF1sr-wqHNeh5Qxv8hUWE7nOajcRXuiyn54CFkUWYTLF150w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V2] dlt-daemon: upgrade 2.18.10 to 3.0.0
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ccad17064d453bf4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 04:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125340

--000000000000ccad17064d453bf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build see -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867436/raw_inlin=
e

On Tue, Mar 17, 2026 at 2:31=E2=80=AFAM Changqing Li via lists.openembedded=
.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

> Changes:
> https://github.com/COVESA/dlt-daemon/releases
>
> Remove patches already in 3.0.0:
> 544.patch
> 567.patch
> 0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
> 0003-allow-build-with-cmake-4.patch
>
> Add patches to fix build failures
> 0001-Fix-compile-failure-related-to-gzlog.patch
> 0001-Fix-kinds-of-build-failure.patch
> 0001-Fix-build-failures.patch
> 0001-fix-build-failure-when-systemd-is-enabled.patch
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...e-DLT_WatchdogSec-can-be-set-by-user.patch |  40 --
>  .../dlt-daemon/0001-Fix-build-failures.patch  | 360 +++++++++++++++
>  ...Fix-compile-failure-related-to-gzlog.patch |  69 +++
>  .../0001-Fix-kinds-of-build-failure.patch     | 174 +++++++
>  ...uild-failure-when-systemd-is-enabled.patch | 423 ++++++++++++++++++
>  .../0003-allow-build-with-cmake-4.patch       |  99 ----
>  .../dlt-daemon/dlt-daemon/544.patch           |  80 ----
>  .../dlt-daemon/dlt-daemon/567.patch           |  36 --
>  ...-daemon_2.18.10.bb =3D> dlt-daemon_3.0.0.bb} |  11 +-
>  9 files changed, 1032 insertions(+), 260 deletions(-)
>  delete mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-D=
LT_WatchdogSec-can-be-set-by-user.patch
>  create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.pa=
tch
>  create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure-r=
elated-to-gzlog.patch
>  create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-fa=
ilure.patch
>  create mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-whe=
n-systemd-is-enabled.patch
>  delete mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmak=
e-4.patch
>  delete mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>  delete mode 100644
> meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>  rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.10.bb =3D>
> dlt-daemon_3.0.0.bb} (90%)
>
> diff --git
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make=
-DLT_WatchdogSec-can-be-set-by-user.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make=
-DLT_WatchdogSec-can-be-set-by-user.patch
> deleted file mode 100644
> index 335872c40f..0000000000
> ---
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make=
-DLT_WatchdogSec-can-be-set-by-user.patch
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
> -Upstream-Status: Backport [
> https://github.com/COVESA/dlt-daemon/pull/720/commits/bc03f142507da92add8=
ba325fdf8187d47a7d719
> ]
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
> -+            set(DLT_WatchdogSec 2 CACHE STRING "Watchdog timeout in
> seconds")
> -+        endif()
> -         message( STATUS "The systemd watchdog is enabled - timeout is
> set to ${DLT_WatchdogSec} seconds")
> -     else(WITH_SYSTEMD_WATCHDOG)
> --        set( DLT_WatchdogSec 0 )
> -+        if(NOT DEFINED DLT_WatchdogSec)
> -+             set(DLT_WatchdogSec 0 CACHE STRING "Watchdog timeout in
> seconds")
> -+        endif()
> -         message( STATUS "The systemd watchdog is disabled")
> -     endif(WITH_SYSTEMD_WATCHDOG)
> diff --git
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.=
patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.=
patch
> new file mode 100644
> index 0000000000..6cfa3a5482
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.=
patch
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
> +dlt_daemon_common.c:2785:26: error: conversion to 'int8_t' {aka 'signed
> char'} from 'char' may change the sign of the result
> [-Werror=3Dsign-conversion]
> +
> +src/tests/dlt-test-multi-process-client-v2.c:302:49: error: format '%lld=
'
> expects argument of type 'long long int', but argument 2 has type 'time_t=
'
> {aka 'long int'} [-Werror=3Dformat=3D]
> +  302 |     printf(" Time running (seconds)        : %lld\n", time(NULL)
> - stats.first_message_time);
> +      |                                              ~~~^
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +      |                                                 |               =
 |
> +      |                                                 long long int
> time_t {aka long int}
> +      |                                              %ld
> +
> +src/lib/dlt_user.c:5109:60: error: format '%lld' expects argument of typ=
e
> 'long long int', but argument 4 has type '__off_t' {aka 'long int'}
> [-Werror=3Dformat=3D]
> + 5109 |             dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\=
n",
> __func__,
> +      |                                                         ~~~^
> +      |                                                            |
> +      |                                                            long
> long int
> +      |                                                         %ld
> + 5110 |                      st.st_size);
> +      |                      ~~~~~~~~~~
> +      |                        |
> +      |                        __off_t {aka long int}
> +
> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
7
> ]
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
> +     if (n < 0 || (size_t)n >
> sizeof(daemon_local->flags.loggingFilename)) {
> +         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n"=
,
> +-                __func__, n, daemon_local->flags.loggingFilename);
> ++                __func__, (long int)n,
> daemon_local->flags.loggingFilename);
> +     }
> +     daemon_local->flags.enableLoggingFileLimit =3D false;
> +     daemon_local->flags.loggingFileSize =3D 250000;
> +@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()
> +     n =3D snprintf(tmp, DLT_PATH_MAX, "%s/dlt", dltFifoBaseDir);
> +     if (n < 0 || (size_t)n > DLT_PATH_MAX) {
> +         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n"=
,
> +-                __func__, n, tmp);
> ++                __func__, (long int)n, tmp);
> +     }
> +
> +     (void)unlink(tmp);
> +@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon *daemon,
> DltDaemonLocal *daemon_local,
> +         dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL,
> daemon,daemon_local,
> +                             msg.headerbuffer, sizeof(DltStorageHeader),
> +                             msg.headerbuffer + sizeof(DltStorageHeader)=
,
> +-                            (size_t)(msg.headersize -
> (int32_t)sizeof(DltStorageHeader)),
> +-                            msg.databuffer, (size_t)msg.datasize,
> verbose);
> ++                            (int)(msg.headersize -
> (int32_t)sizeof(DltStorageHeader)),
> ++                            msg.databuffer, (int)msg.datasize, verbose)=
;
> +
> +         free(msg.databuffer);
> +     }else {
> +diff --git a/src/daemon/dlt_daemon_client.c
> b/src/daemon/dlt_daemon_client.c
> +index 50d8f19..20a512b 100644
> +--- a/src/daemon/dlt_daemon_client.c
> ++++ b/src/daemon/dlt_daemon_client.c
> +@@ -551,8 +551,8 @@ int
> dlt_daemon_client_send_message_to_all_client(DltDaemon *daemon,
> +     return dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon,
> daemon_local,
> +                 daemon_local->msg.headerbuffer, sizeof(DltStorageHeader=
),
> +                 daemon_local->msg.headerbuffer +
> sizeof(DltStorageHeader),
> +-                (size_t)(daemon_local->msg.headersize -
> (int32_t)sizeof(DltStorageHeader)),
> +-                daemon_local->msg.databuffer,
> (size_t)daemon_local->msg.datasize, verbose);
> ++                (int)(daemon_local->msg.headersize -
> (int32_t)sizeof(DltStorageHeader)),
> ++                daemon_local->msg.databuffer,
> (int)daemon_local->msg.datasize, verbose);
> +
> + }
> +
> +@@ -771,8 +771,8 @@ int dlt_daemon_client_send_control_message(int sock,
> +     if ((ret =3D
> +              dlt_daemon_client_send(sock, daemon, daemon_local,
> msg->headerbuffer, sizeof(DltStorageHeader),
> +                                     msg->headerbuffer +
> sizeof(DltStorageHeader),
> +-                                    (size_t)(msg->headersize -
> (int32_t)sizeof(DltStorageHeader)),
> +-                                    msg->databuffer,
> (size_t)msg->datasize, verbose))) {
> ++                                    (int)(msg->headersize -
> (int32_t)sizeof(DltStorageHeader)),
> ++                                    msg->databuffer, (int)msg->datasize=
,
> verbose))) {
> +         dlt_log(LOG_DEBUG, "dlt_daemon_control_send_control_message: DL=
T
> message send to all failed!.\n");
> +         return ret;
> +     }
> +@@ -1919,7 +1919,7 @@ void dlt_daemon_control_get_log_info(int sock,
> +
> +     /* Allocate buffer for response message */
> +     resp.databuffer =3D (uint8_t *)malloc((size_t)resp.datasize);
> +-    resp.databuffersize =3D (size_t)resp.datasize;
> ++    resp.databuffersize =3D resp.datasize;
> +
> +     if (resp.databuffer =3D=3D 0) {
> +         dlt_daemon_control_service_response(sock,
> +@@ -2572,7 +2572,7 @@ int dlt_daemon_control_message_buffer_overflow(int
> sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -2633,7 +2633,7 @@ int
> dlt_daemon_control_message_buffer_overflow_v2(int sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -2686,7 +2686,7 @@ void dlt_daemon_control_service_response(int sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -2732,7 +2732,7 @@ void dlt_daemon_control_service_response_v2(int
> sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -2779,7 +2779,7 @@ int
> dlt_daemon_control_message_unregister_context(int sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -2842,7 +2842,7 @@ int
> dlt_daemon_control_message_unregister_context_v2(int sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -2909,7 +2909,7 @@ int dlt_daemon_control_message_connection_info(int
> sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -2962,7 +2962,7 @@ int
> dlt_daemon_control_message_connection_info_v2(int sock,
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -3010,7 +3010,7 @@ int dlt_daemon_control_message_timezone(int sock,
> DltDaemon *daemon, DltDaemonLo
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -3072,7 +3072,7 @@ int dlt_daemon_control_message_timezone_v2(int
> sock, DltDaemon *daemon, DltDaemo
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +@@ -3127,7 +3127,7 @@ int dlt_daemon_control_message_marker(int sock,
> DltDaemon *daemon, DltDaemonLoca
> +
> +     if (msg.databuffer =3D=3D 0) {
> +         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
> +-        msg.databuffersize =3D (size_t)msg.datasize;
> ++        msg.databuffersize =3D msg.datasize;
> +     }
> +
> +     if (msg.databuffer =3D=3D 0)
> +diff --git a/src/daemon/dlt_daemon_common.c
> b/src/daemon/dlt_daemon_common.c
> +index 2f08c6a..65b264a 100644
> +--- a/src/daemon/dlt_daemon_common.c
> ++++ b/src/daemon/dlt_daemon_common.c
> +@@ -2782,7 +2782,7 @@ int dlt_daemon_user_send_log_state(DltDaemon
> *daemon, DltDaemonApplication *app,
> +     if (dlt_user_set_userheader(&userheader, DLT_USER_MESSAGE_LOG_STATE=
)
> < DLT_RETURN_OK)
> +         return -1;
> +
> +-    logstate.log_state =3D daemon->connectionState;
> ++    logstate.log_state =3D (int8_t)daemon->connectionState;
> +
> +     /* log to FIFO */
> +     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
> +@@ -2811,7 +2811,7 @@ int dlt_daemon_user_send_log_state_v2(DltDaemon
> *daemon, DltDaemonApplication *a
> +     if (dlt_user_set_userheader_v2(&userheader,
> DLT_USER_MESSAGE_LOG_STATE) < DLT_RETURN_OK)
> +         return -1;
> +
> +-    logstate.log_state =3D daemon->connectionState;
> ++    logstate.log_state =3D (int8_t)daemon->connectionState;
> +
> +     /* log to FIFO */
> +     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
> +diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
> +index 6d0098d..e432e26 100644
> +--- a/src/lib/dlt_user.c
> ++++ b/src/lib/dlt_user.c
> +@@ -5106,8 +5106,8 @@ DltReturnValue dlt_user_log_send_log(DltContextDat=
a
> *log, const int mtype, int *
> +                 return DLT_RETURN_ERROR;
> +             }
> +
> +-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n",
> __func__,
> +-                     st.st_size);
> ++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n",
> __func__,
> ++                     (long long int)st.st_size);
> +             /* Check filesize */
> +             /* Return error if the file size has reached to maximum */
> +             unsigned int msg_size =3D (unsigned int)st.st_size + (unsig=
ned
> int)msg.headersize +
> +@@ -5115,8 +5115,8 @@ DltReturnValue dlt_user_log_send_log(DltContextDat=
a
> *log, const int mtype, int *
> +             if (msg_size > dlt_user.filesize_max) {
> +                 dlt_user_file_reach_max =3D true;
> +                 dlt_vlog(LOG_ERR,
> +-                         "%s: File size (%ld bytes) reached to defined
> maximum size (%d bytes)\n",
> +-                         __func__, st.st_size, dlt_user.filesize_max);
> ++                         "%s: File size (%lld bytes) reached to defined
> maximum size (%d bytes)\n",
> ++                         __func__, (long long int)st.st_size,
> dlt_user.filesize_max);
> +                 dlt_mutex_unlock();
> +                 return DLT_RETURN_FILESZERR;
> +             }
> +@@ -5612,21 +5612,21 @@ DltReturnValue
> dlt_user_log_send_log_v2(DltContextData *log, const int mtype, Dl
> +                 return DLT_RETURN_ERROR;
> +             }
> +
> +-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n",
> __func__,
> +-                     st.st_size);
> ++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n",
> __func__,
> ++                     (long long int)st.st_size);
> +             /* Check filesize */
> +             /* Return error if the file size has reached to maximum */
> +             unsigned int msg_size =3D 0;
> +             if (st.st_size < 0 || st.st_size > UINT_MAX) {
> +-                dlt_vlog(LOG_ERR, "%s: File size (%ld bytes) is invalid
> or too large for unsigned int\n", __func__, st.st_size);
> ++                dlt_vlog(LOG_ERR, "%s: File size (%lld bytes) is invali=
d
> or too large for unsigned int\n", __func__, (long long int)st.st_size);
> +                 return DLT_RETURN_FILESZERR;
> +             }
> +             msg_size =3D (unsigned int)st.st_size + (unsigned int)
> msg.headersizev2 + (unsigned int) log->size;
> +             if (msg_size > dlt_user.filesize_max) {
> +                 dlt_user_file_reach_max =3D true;
> +                 dlt_vlog(LOG_ERR,
> +-                         "%s: File size (%ld bytes) reached to defined
> maximum size (%d bytes)\n",
> +-                         __func__, st.st_size, dlt_user.filesize_max);
> ++                         "%s: File size (%lld bytes) reached to defined
> maximum size (%d bytes)\n",
> ++                         __func__, (long long int)st.st_size,
> dlt_user.filesize_max);
> +                 return DLT_RETURN_FILESZERR;
> +             }
> +             else {
> +diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
> +index 6ad354b..aa0aaaa 100644
> +--- a/src/shared/dlt_common.c
> ++++ b/src/shared/dlt_common.c
> +@@ -1220,7 +1220,7 @@ DltReturnValue
> dlt_message_header_flags_v2(DltMessageV2 *msg, char *text, size_t
> +             for (int i =3D 0; i<5; ++i){
> +                 tt =3D (tt << 8) | msg->headerextrav2.seconds[i];
> +             }
> +-            snprintf(text + strlen(text), textlength - strlen(text),
> "%ld.%.9u ", tt, msg->headerextrav2.nanoseconds);
> ++            snprintf(text + strlen(text), textlength - strlen(text),
> "%lld.%.9u ", (long long int)tt, msg->headerextrav2.nanoseconds);
> +         }
> +         else
> +             snprintf(text + strlen(text), textlength - strlen(text),
> "---------- ");
> +diff --git a/src/shared/dlt_multiple_files.c
> b/src/shared/dlt_multiple_files.c
> +index c4019e5..65529ff 100644
> +--- a/src/shared/dlt_multiple_files.c
> ++++ b/src/shared/dlt_multiple_files.c
> +@@ -257,7 +257,7 @@ ssize_t multiple_files_buffer_get_total_size(const
> MultipleFilesRingBuffer *file
> +             if (((unsigned int)res < sizeof(filename)) && (res > 0)) {
> +                 errno =3D 0;
> +                 if (0 =3D=3D stat(filename, &status))
> +-                    size +=3D status.st_size;
> ++                    size +=3D (ssize_t)status.st_size;
> +                 else
> +                     fprintf(stderr, "file %s cannot be stat-ed,
> error=3D%s\n", filename, strerror(errno));
> +             }
> +diff --git a/src/tests/dlt-test-multi-process-client-v2.c
> b/src/tests/dlt-test-multi-process-client-v2.c
> +index 2bb1158..ec99720 100644
> +--- a/src/tests/dlt-test-multi-process-client-v2.c
> ++++ b/src/tests/dlt-test-multi-process-client-v2.c
> +@@ -299,10 +299,10 @@ void print_stats(s_statistics stats, s_parameters
> params)
> +     printf(" Messages received             : %d\n",
> stats.messages_received);
> +     printf(" Broken messages received      : %d\n",
> stats.broken_messages_received);
> +     printf(" Bytes received                : %d\n",
> stats.bytes_received);
> +-    printf(" Time running (seconds)        : %ld\n", time(NULL) -
> stats.first_message_time);
> +-    printf(" Throughput (msgs/sec)/(B/sec) : %ld/%ld\n",
> +-           stats.messages_received / ((time(NULL) -
> stats.first_message_time) + 1),
> +-           (stats.bytes_received) / ((time(NULL) -
> stats.first_message_time) + 1));
> ++    printf(" Time running (seconds)        : %lld\n", (long long
> int)(time(NULL) - stats.first_message_time));
> ++    printf(" Throughput (msgs/sec)/(B/sec) : %lld/%lld\n",
> ++           (long long int)(stats.messages_received / ((time(NULL) -
> stats.first_message_time) + 1)),
> ++           (long long int)((stats.bytes_received) / ((time(NULL) -
> stats.first_message_time) + 1)));
> +
> +     if (params.messages_left =3D=3D 0) {
> +         if (stats.broken_messages_received =3D=3D 0)
> +diff --git a/src/tests/dlt-test-multi-process-v2.c
> b/src/tests/dlt-test-multi-process-v2.c
> +index 44a8622..1d3a54a 100644
> +--- a/src/tests/dlt-test-multi-process-v2.c
> ++++ b/src/tests/dlt-test-multi-process-v2.c
> +@@ -393,7 +393,7 @@ void *do_logging(void *arg)
> +
> +         sleep_time =3D mksleep_time(data->params.delay,
> data->params.delay_fudge);
> +         ts.tv_sec =3D sleep_time / 1000000000;
> +-        ts.tv_nsec =3D sleep_time % 1000000000;
> ++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
> +         nanosleep(&ts, NULL);
> +     }
> +
> +diff --git a/src/tests/dlt-test-multi-process.c
> b/src/tests/dlt-test-multi-process.c
> +index 016c8b4..00fb11c 100644
> +--- a/src/tests/dlt-test-multi-process.c
> ++++ b/src/tests/dlt-test-multi-process.c
> +@@ -370,7 +370,7 @@ void *do_logging(void *arg)
> +
> +         sleep_time =3D mksleep_time(data->params.delay,
> data->params.delay_fudge);
> +         ts.tv_sec =3D sleep_time / 1000000000;
> +-        ts.tv_nsec =3D sleep_time % 1000000000;
> ++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
> +         nanosleep(&ts, NULL);
> +     }
> +
> +--
> +2.34.1
> +
> diff --git
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure=
-related-to-gzlog.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure=
-related-to-gzlog.patch
> new file mode 100644
> index 0000000000..f9692d9f4d
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure=
-related-to-gzlog.patch
> @@ -0,0 +1,69 @@
> +From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 12 Mar 2026 19:37:11 +0800
> +Subject: [PATCH] Fix compile failure related to gzlog
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* In commit [1], gzlog is changed from gzFile to gzFile*, this cause
> +  failure:
> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21: error:
> passing argument 1 of =E2=80=98gzclose=E2=80=99 from incompatible pointer=
 type
> [-Werror=3Dincompatible-pointer-types]
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
> +  FILE*, according to code "config->gzlog =3D gzdopen(config->fd, mode)"=
,
> +  seems we don't need to use fileno, just use config->fd is ok.
> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.c:1133=
:48:
> error: passing argument 1 of =E2=80=98fileno=E2=80=99 from incompatible p=
ointer type
> [-Werror=3Dincompatible-pointer-types]
> + 1133 |                         if (fsync(fileno(config->gzlog)) !=3D 0)=
 {
> +      |                                          ~~~~~~^~~~~~~
> +      |                                                |
> +      |                                                gzFile {aka struc=
t
> gzFile_s *}
> +compilation terminated due to -Wfatal-errors.
> +
> +[1]
> https://github.com/COVESA/dlt-daemon/commit/543087ba98c103dc576edadeccf61=
4c9dab1b9b3
> +
> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
6
> ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/offlinelogstorage/dlt_offline_logstorage.h          | 2 +-
> + src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
> b/src/offlinelogstorage/dlt_offline_logstorage.h
> +index fe38687..09ea5ce 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
> +@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig
> +     FILE *log;                      /* current open log file */
> +     int fd;                         /* The file descriptor for the
> active log file */
> + #ifdef DLT_LOGSTORAGE_USE_GZIP
> +-    gzFile *gzlog;                  /* current open gz log file */
> ++    gzFile gzlog;                   /* current open gz log file */
> + #endif
> +     void *cache;                    /* log data cache */
> +     unsigned int specific_size;     /* cache size used for specific_siz=
e
> sync strategy */
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +index f17fbb2..ff09c9e 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +@@ -1130,7 +1130,7 @@ int
> dlt_logstorage_prepare_on_msg(DltLogStorageFilterConfig *config,
> +                     (config->sync =3D=3D DLT_LOGSTORAGE_SYNC_UNSET)) {
> + #ifdef DLT_LOGSTORAGE_USE_GZIP
> +                     if (config->gzip_compression =3D=3D
> DLT_LOGSTORAGE_GZIP_ON) {
> +-                        if (fsync(fileno(config->gzlog)) !=3D 0) {
> ++                        if (fsync(config->fd) !=3D 0) {
> +                             if (errno !=3D ENOSYS) {
> +                                 dlt_vlog(LOG_ERR, "%s: failed to sync
> gzip log file\n", __func__);
> +                             }
> +--
> +2.34.1
> +
> diff --git
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-=
failure.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-=
failure.patch
> new file mode 100644
> index 0000000000..403d1089e2
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-=
failure.patch
> @@ -0,0 +1,174 @@
> +From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 12 Mar 2026 20:06:34 +0800
> +Subject: [PATCH] Fix kinds of build failure
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fix kinds of build failures caused by -Werror=3Dsign-conversion,
> +-Werror=3Dcast-qual, -Werror=3Dconversion etc.
> +Eg:
> +src/offlinelogstorage/dlt_offline_logstorage.h:129:49: error: unsigned
> conversion from =E2=80=98int=E2=80=99 to =E2=80=98unsigned int=E2=80=99 c=
hanges value from =E2=80=98-1=E2=80=99 to
> =E2=80=984294967295=E2=80=99 [-Werror=3Dsign-conversion]
> +  129 | #define DLT_LOGSTORAGE_GZIP_ERROR               -1 /* error case
> */
> +      |                                                 ^
> +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36: note=
:
> in expansion of macro =E2=80=98DLT_LOGSTORAGE_GZIP_ERROR=E2=80=99
> + 1303 |         config->gzip_compression =3D DLT_LOGSTORAGE_GZIP_ERROR;
> +
> +      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16: error:
> conversion from =E2=80=98z_size_t=E2=80=99 {aka =E2=80=98long unsigned in=
t=E2=80=99} to =E2=80=98int=E2=80=99 may change
> value [-Werror=3Dconversion]
> +  851 |         return gzfwrite(ptr, size, nmemb, config->gzlog);
> +      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +src/console/dlt-control-common.c:922:25: error: cast discards 'const'
> qualifier from pointer target type [-Werror=3Dcast-qual]
> +  922 |     json_object_to_file((char*)filename, json_filter_obj);
> +      |
> +
> +Use explicit type conversion to make the build can pass
> +
> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
6
> ]
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
> +diff --git a/src/console/dlt-control-common.c
> b/src/console/dlt-control-common.c
> +index 2aeea280..4f9e95b4 100644
> +--- a/src/console/dlt-control-common.c
> ++++ b/src/console/dlt-control-common.c
> +@@ -919,7 +919,7 @@ DltReturnValue dlt_json_filter_save(DltFilter
> *filter, const char *filename, int
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
> +                         if ((longval =3D=3D MULTICAST_CONNECTION_DISABL=
ED)
> +                             || (longval =3D=3D
> MULTICAST_CONNECTION_ENABLED)) {
> +-                            daemon_local->UDPConnectionSetup =3D longva=
l;
> ++                            daemon_local->UDPConnectionSetup =3D
> (int)longval;
> +                             printf("Option: %s=3D%s\n", token, value);
> +                         }
> +                         else {
> +@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
> +                     }
> +                     else if (strcmp(token, "UDPMulticastIPPort") =3D=3D=
 0)
> +                     {
> +-                        daemon_local->UDPMulticastIPPort =3D strtol(val=
ue,
> NULL, 10);
> ++                        daemon_local->UDPMulticastIPPort =3D
> (int)strtol(value, NULL, 10);
> +                     }
> + #endif
> +                     else if (strcmp(token, "BindAddress") =3D=3D 0)
> +diff --git a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
> b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
> +index 4c40cda8..b3408773 100644
> +--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
> ++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
> +@@ -66,7 +66,7 @@ void dlt_daemon_udp_setmulticast_addr(DltDaemonLocal
> *daemon_local)
> +     struct sockaddr_in clientaddr;
> +     clientaddr.sin_family =3D AF_INET;
> +     inet_pton(AF_INET, daemon_local->UDPMulticastIPAddress,
> &clientaddr.sin_addr);
> +-    clientaddr.sin_port =3D htons(daemon_local->UDPMulticastIPPort);
> ++    clientaddr.sin_port =3D
> htons((uint16_t)daemon_local->UDPMulticastIPPort);
> +     memcpy(&g_udpmulticast_addr.clientaddr, &clientaddr, sizeof(struct
> sockaddr_in));
> +     g_udpmulticast_addr.clientaddr_size =3D
> sizeof(g_udpmulticast_addr.clientaddr);
> +     g_udpmulticast_addr.isvalidflag =3D ADDRESS_VALID;
> +@@ -224,17 +224,17 @@ void
> dlt_daemon_udp_clientmsg_send(DltDaemonClientSockInfo *clientinfo,
> +
> +     if ((clientinfo->isvalidflag =3D=3D ADDRESS_VALID) &&
> +         (size1 > 0) && (size2 > 0)) {
> +-        void *data =3D (void *)calloc(size1 + size2, sizeof(char));
> ++        void *data =3D (void *)calloc((size_t)(size1 + size2),
> sizeof(char));
> +
> +         if (data =3D=3D NULL) {
> +             dlt_vlog(LOG_ERR, "%s: calloc failure\n", __func__);
> +             return;
> +         }
> +
> +-        memcpy(data, data1, size1);
> +-        memcpy(data + size1, data2, size2);
> ++        memcpy(data, data1, (size_t)size1);
> ++        memcpy((int*)data + size1, data2, (size_t)size2);
> +
> +-        if (sendto(g_udp_sock_fd, data, size1 + size2, 0, (struct
> sockaddr *)&clientinfo->clientaddr,
> ++        if (sendto(g_udp_sock_fd, data, (size_t)(size1 + size2), 0,
> (struct sockaddr *)&clientinfo->clientaddr,
> +                    clientinfo->clientaddr_size) < 0)
> +             dlt_vlog(LOG_ERR, "%s: Send UDP Packet Data failed\n",
> __func__);
> +
> +diff --git a/src/examples/dlt-example-multicast-clientmsg-view.c
> b/src/examples/dlt-example-multicast-clientmsg-view.c
> +index c00537e5..f8920453 100644
> +--- a/src/examples/dlt-example-multicast-clientmsg-view.c
> ++++ b/src/examples/dlt-example-multicast-clientmsg-view.c
> +@@ -74,9 +74,9 @@ int dlt_receiver_receive_socket_udp(struct
> clientinfostruct *clientinfo, DltRece
> +     /* wait for data from socket */
> +     unsigned int addrlen =3D sizeof(clientinfo->addr);
> +
> +-    if ((receiver->bytesRcvd =3D recvfrom(clientinfo->fd,
> ++    if ((receiver->bytesRcvd =3D (int32_t)recvfrom(clientinfo->fd,
> +                                         receiver->buf +
> receiver->lastBytesRcvd,
> +-                                        receiver->buffersize -
> receiver->lastBytesRcvd,
> ++                                        (size_t)(receiver->buffersize -
> receiver->lastBytesRcvd),
> +                                         0,
> +                                         (struct sockaddr
> *)&(clientinfo->addr), &addrlen))
> +         <=3D 0) {
> +@@ -177,11 +177,11 @@ int main()
> +         dlt_receiver_receive_socket_udp(&clientinfo,
> &(clientinfo.receiver));
> +
> +         while (dlt_message_read(&msg, (unsigned char
> *)(clientinfo.receiver.buf),
> +-                                clientinfo.receiver.bytesRcvd, 0, 0) =
=3D=3D
> DLT_MESSAGE_ERROR_OK) {
> ++                                (unsigned
> int)clientinfo.receiver.bytesRcvd, 0, 0) =3D=3D DLT_MESSAGE_ERROR_OK) {
> +             dlt_receive_message_callback_udp(&msg);
> +
> +             if (dlt_receiver_remove(&(clientinfo.receiver),
> +-                                    msg.headersize + msg.datasize -
> sizeof(DltStorageHeader))
> ++                                    msg.headersize + msg.datasize -
> ((int32_t)(sizeof(DltStorageHeader))))
> +                 =3D=3D DLT_RETURN_ERROR) {
> +                 /* Return value ignored */
> +                 dlt_message_free(&msg, 0);
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
> b/src/offlinelogstorage/dlt_offline_logstorage.h
> +index 09ea5ce4..cfb70f33 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
> +@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig
> +     int overwrite;                  /* Overwrite strategy */
> +     int skip;                       /* Flag to skip file logging if
> DISCARD_NEW */
> +     char *ecuid;                    /* ECU identifier */
> +-    unsigned int gzip_compression;  /* Toggle if log files should be
> gzip compressed */
> ++    int gzip_compression;           /* Toggle if log files should be
> gzip compressed */
> +     /* callback function for filter configurations */
> +     int (*dlt_logstorage_prepare)(DltLogStorageFilterConfig *config,
> +                                   DltLogStorageUserConfig *file_config,
> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +index ff09c9eb..ae8f4442 100644
> +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
> +@@ -848,10 +848,10 @@ DLT_STATIC int dlt_logstorage_write_to_log(void
> *ptr, size_t size, size_t nmemb,
> + {
> + #ifdef DLT_LOGSTORAGE_USE_GZIP
> +     if (config->gzip_compression =3D=3D DLT_LOGSTORAGE_GZIP_ON) {
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
> diff --git
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-w=
hen-systemd-is-enabled.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-w=
hen-systemd-is-enabled.patch
> new file mode 100644
> index 0000000000..d19a23cd9c
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-w=
hen-systemd-is-enabled.patch
> @@ -0,0 +1,423 @@
> +From 28322f951bb8510ddb4cf767426a67c81ce826ab Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 17 Mar 2026 13:04:11 +0800
> +Subject: [PATCH] fix build failure when systemd is enabled
> +
> +Fix build failures when -DWITH_SYSTEMD=3DON, -DWITH_SYSTEMD_WATCHDOG=3DO=
N,
> +-DWITH_SYSTEMD_JOURNAL=3DON:
> +Eg:
> +src/system/dlt-system-syslog.c:91:39: error: conversion from 'int' to
> '__uint16_t' {aka 'short unsigned int'} may change value
> [-Werror=3Dconversion]
> +   91 |     syslog_addr.sin6_port =3D htons(opts.Port);
> +      |                                   ~~~~^~~~~
> +
> +src/system/dlt-system-logfile.c:74:21: error: conversion from 'size_t'
> {aka 'long unsigned int'} to 'int' may change value [-Werror=3Dconversion=
]
> +   74 |             bytes =3D fread(buffer, 1, sizeof(buffer) - 1, pFile=
);
> +      |                     ^~~~~
> +
> +src/daemon/dlt-daemon.c:5513:14: error: unused variable 'curr_time'
> [-Werror=3Dunused-variable]
> + 5513 |     uint32_t curr_time =3D 0U;
> +      |              ^~~~~~~~~
> +
> +src/system/dlt-system-syslog.c:120:22: error: conversion from 'ssize_t'
> {aka 'long int'} to 'int' may change value [-Werror=3Dconversion]
> +  120 |     int bytes_read =3D recvfrom(sock, recv_data, RECV_BUF_SZ, 0,
> +      |                      ^~~~~~~~
> +
> +src/system/dlt-system-logfile.c:76:23: error: comparison of unsigned
> expression in '>=3D 0' is always true [-Werror=3Dtype-limits]
> +   76 |             if (bytes >=3D 0)
> +      |                       ^~
> +
> + src/system/dlt-system-filetransfer.c:727:56: error:
> '__builtin___snprintf_chk' output may be truncated before the last format
> cha    racter [-Werror=3Dformat-truncation=3D]
> + 10   727 |                         snprintf(tosend, length, "%s/%s",
> opts->Directory[j], ie->name);
> +
> +src/system/dlt-system-filetransfer.c:153: error: declaration of 'len'
> shadows a previous local [-Werror=3Dshadow]
> +
> +Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
8
> ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/daemon/dlt-daemon.c                  |  8 +----
> + src/daemon/dlt_daemon_client.c           |  2 +-
> + src/system/dlt-system-filetransfer.c     | 43 +++++++++++++-----------
> + src/system/dlt-system-journal.c          |  2 +-
> + src/system/dlt-system-logfile.c          |  4 +--
> + src/system/dlt-system-process-handling.c |  2 +-
> + src/system/dlt-system-processes.c        |  2 +-
> + src/system/dlt-system-syslog.c           |  6 ++--
> + src/system/dlt-system-watchdog.c         |  8 ++---
> + systemd/3rdparty/sd-daemon.c             |  5 +--
> + 10 files changed, 40 insertions(+), 42 deletions(-)
> +
> +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
> +index ef42f89..8c318a4 100644
> +--- a/src/daemon/dlt-daemon.c
> ++++ b/src/daemon/dlt-daemon.c
> +@@ -1620,7 +1620,7 @@ int main(int argc, char *argv[])
> +             watchdogTimeoutSeconds =3D 30;
> +         }
> +
> +-        daemon.watchdog_trigger_interval =3D watchdogTimeoutSeconds;
> ++        daemon.watchdog_trigger_interval =3D (unsigned
> int)watchdogTimeoutSeconds;
> +         daemon.watchdog_last_trigger_time =3D 0U;
> +         create_timer_fd(&daemon_local,
> +                         watchdogTimeoutSeconds,
> +@@ -5509,9 +5509,6 @@ int dlt_daemon_send_ringbuffer_to_client(DltDaemon
> *daemon, DltDaemonLocal *daem
> +     int ret;
> +     static uint8_t data[DLT_DAEMON_RCVBUFSIZE];
> +     int length;
> +-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE
> +-    uint32_t curr_time =3D 0U;
> +-#endif
> +
> +     PRINT_FUNCTION_VERBOSE(verbose);
> +
> +@@ -5554,9 +5551,6 @@ int
> dlt_daemon_send_ringbuffer_to_client_v2(DltDaemon *daemon, DltDaemonLocal=
 *d
> +     int ret;
> +     static uint8_t data[DLT_DAEMON_RCVBUFSIZE];
> +     int length;
> +-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE
> +-    uint32_t curr_time =3D 0U;
> +-#endif
> +
> +     PRINT_FUNCTION_VERBOSE(verbose);
> +
> +diff --git a/src/daemon/dlt_daemon_client.c
> b/src/daemon/dlt_daemon_client.c
> +index 20a512b..681bf1e 100644
> +--- a/src/daemon/dlt_daemon_client.c
> ++++ b/src/daemon/dlt_daemon_client.c
> +@@ -4690,7 +4690,7 @@ int dlt_daemon_process_systemd_timer(DltDaemon
> *daemon,
> +
> +     if ((daemon_local =3D=3D NULL) || (daemon =3D=3D NULL) || (receiver=
 =3D=3D
> NULL)) {
> +         dlt_vlog(LOG_ERR, "%s: invalid parameters", __func__);
> +-        return res;
> ++        return (int)res;
> +     }
> +
> +     res =3D read(receiver->fd, &expir, sizeof(expir));
> +diff --git a/src/system/dlt-system-filetransfer.c
> b/src/system/dlt-system-filetransfer.c
> +index c082f22..6024a3e 100644
> +--- a/src/system/dlt-system-filetransfer.c
> ++++ b/src/system/dlt-system-filetransfer.c
> +@@ -105,14 +105,14 @@ char *unique_name(char *src)
> +             DLT_STRING("dlt-system-filetransfer, creating unique
> temporary file name."));
> +     time_t t =3D time(NULL);
> +     int ok;
> +-    uint32_t l =3D getFileSerialNumber(src, &ok) ^ t;
> ++    uint32_t l =3D (uint32_t)(getFileSerialNumber(src, &ok) ^ t);
> +
> +     if (!ok)
> +         return (char *)NULL;
> +
> +     char *basename_f =3D basename(src);
> +     /* Length of ULONG_MAX + 1 */
> +-    int len =3D 11 + strlen(basename_f);
> ++    size_t len =3D 11 + strlen(basename_f);
> +
> +     if (len > NAME_MAX) {
> +         DLT_LOG(dltsystem, DLT_LOG_WARN,
> +@@ -155,7 +155,7 @@ void send_dumped_file(FiletransferOptions const
> *opts, char *dst_tosend)
> +             while ((total - used) < (total / 2)) {
> +                 struct timespec t;
> +                 t.tv_sec =3D 0;
> +-                t.tv_nsec =3D 1000000ul * opts->TimeoutBetweenLogs;
> ++                t.tv_nsec =3D (long int)(1000000ul * (unsigned
> long)opts->TimeoutBetweenLogs);
> +                 nanosleep(&t, NULL);
> +                 dlt_user_log_resend_buffer();
> +                 dlt_user_check_buffer(&total, &used);
> +@@ -220,7 +220,7 @@ int compress_file_to(char *src, char *dst, int level=
)
> +     MALLOC_ASSERT(buf);
> +
> +     while (!feof(src_file)) {
> +-        int read =3D fread(buf, 1, Z_CHUNK_SZ, src_file);
> ++        size_t read =3D fread(buf, 1, Z_CHUNK_SZ, src_file);
> +
> +         if (ferror(src_file)) {
> +             free(buf);
> +@@ -230,7 +230,7 @@ int compress_file_to(char *src, char *dst, int level=
)
> +             return -1;
> +         }
> +
> +-        gzwrite(dst_file, buf, read);
> ++        gzwrite(dst_file, buf, (unsigned int)read);
> +     }
> +
> +     if (remove(src) < 0)
> +@@ -290,7 +290,7 @@ int send_one(char *src, FiletransferOptions const
> *opts, int which)
> +         char *dst_tocompress;/*file which is going to be compressed, th=
e
> compressed one is named dst_tosend */
> +
> +
> +-        int len =3D strlen(fdir) + strlen(SUBDIR_COMPRESS) + strlen(rn)=
 +
> 3;/*the filename in .tocompress +2 for 2*"/", +1 for \0 */
> ++        size_t len =3D strlen(fdir) + strlen(SUBDIR_COMPRESS) + strlen(=
rn)
> + 3;/*the filename in .tocompress +2 for 2*"/", +1 for \0 */
> +         dst_tocompress =3D malloc(len);
> +         MALLOC_ASSERT(dst_tocompress);
> +
> +@@ -328,7 +328,7 @@ int send_one(char *src, FiletransferOptions const
> *opts, int which)
> +         /*move it directly into "tosend" */
> +         DLT_LOG(dltsystem, DLT_LOG_DEBUG,
> +                 DLT_STRING("dlt-system-filetransfer, Moving file to tmp
> directory."));
> +-        int len =3D strlen(fdir) + strlen(SUBDIR_TOSEND) + strlen(rn) +=
 3;
> ++        size_t len =3D strlen(fdir) + strlen(SUBDIR_TOSEND) + strlen(rn=
) +
> 3;
> +         dst_tosend =3D malloc(len);/*the resulting filename in .tosend =
+2
> for 2*"/", +1 for \0 */
> +
> +         snprintf(dst_tosend, len, "%s/%s/%s", fdir, SUBDIR_TOSEND, rn);
> +@@ -379,7 +379,7 @@ int flush_dir_send(FiletransferOptions const *opts,
> const char *compress_dir, co
> +             DLT_LOG(dltsystem, DLT_LOG_DEBUG,
> +                     DLT_STRING("dlt-system-filetransfer, old compressed
> file found in send directory:"),
> +                     DLT_STRING(dp->d_name));
> +-            int len =3D strlen(send_dir) + strlen(dp->d_name) + 2;
> ++            size_t len =3D strlen(send_dir) + strlen(dp->d_name) + 2;
> +             fn =3D malloc(len);
> +             MALLOC_ASSERT(fn);
> +             snprintf(fn, len, "%s/%s", send_dir, dp->d_name);
> +@@ -394,10 +394,10 @@ int flush_dir_send(FiletransferOptions const *opts=
,
> const char *compress_dir, co
> +                 strncpy(tmp, dp->d_name, strlen(dp->d_name) -
> strlen(COMPRESS_EXTENSION));
> +                 tmp[strlen(dp->d_name) - strlen(COMPRESS_EXTENSION)] =
=3D
> '\0';
> +
> +-                int len =3D strlen(tmp) + strlen(compress_dir) + 1 + 1;=
/*2
> sizes + 1*"/" + \0 */
> +-                char *path_uncompressed =3D malloc(len);
> ++                size_t length =3D strlen(tmp) + strlen(compress_dir) + =
1 +
> 1;/*2 sizes + 1*"/" + \0 */
> ++                char *path_uncompressed =3D malloc(length);
> +                 MALLOC_ASSERT(path_uncompressed);
> +-                snprintf(path_uncompressed, len, "%s/%s", compress_dir,
> tmp);
> ++                snprintf(path_uncompressed, length, "%s/%s",
> compress_dir, tmp);
> +
> +                 struct stat sb;
> +
> +@@ -475,7 +475,7 @@ int flush_dir_compress(FiletransferOptions const
> *opts, int which, const char *c
> +
> +
> +             /*compress file into to_send dir */
> +-            int len =3D strlen(compress_dir) + strlen(dp->d_name) + 2;
> ++            size_t len =3D strlen(compress_dir) + strlen(dp->d_name) + =
2;
> +             char *cd_filename =3D malloc(len);
> +             MALLOC_ASSERT(cd_filename);
> +             snprintf(cd_filename, len, "%s/%s", compress_dir,
> dp->d_name);
> +@@ -526,7 +526,7 @@ int flush_dir_original(FiletransferOptions const
> *opts, int which)
> +
> +             DLT_LOG(dltsystem, DLT_LOG_DEBUG,
> +                     DLT_STRING("dlt-system-filetransfer, old file found
> in directory."));
> +-            int len =3D strlen(sdir) + strlen(dp->d_name) + 2;
> ++            size_t len =3D strlen(sdir) + strlen(dp->d_name) + 2;
> +             char *fn =3D malloc(len);
> +             MALLOC_ASSERT(fn);
> +             snprintf(fn, len, "%s/%s", sdir, dp->d_name);
> +@@ -564,7 +564,7 @@ int flush_dir(FiletransferOptions const *opts, int
> which)
> +
> +     char *compress_dir;
> +     char *send_dir;
> +-    int len =3D strlen(opts->Directory[which]) + strlen(SUBDIR_COMPRESS=
) +
> 2;
> ++    size_t len =3D strlen(opts->Directory[which]) +
> strlen(SUBDIR_COMPRESS) + 2;
> +     compress_dir =3D malloc (len);
> +     MALLOC_ASSERT(compress_dir);
> +     snprintf(compress_dir, len, "%s/%s", opts->Directory[which],
> SUBDIR_COMPRESS);
> +@@ -625,7 +625,7 @@ int init_filetransfer_dirs(DltSystemConfiguration
> *config)
> +         /*create subdirectories for processing the files */
> +
> +         char *subdirpath;
> +-        int len =3D strlen(opts->Directory[i]) + strlen(SUBDIR_COMPRESS=
) +
> 2;
> ++        size_t len =3D strlen(opts->Directory[i]) +
> strlen(SUBDIR_COMPRESS) + 2;
> +         subdirpath =3D malloc (len);
> +         MALLOC_ASSERT(subdirpath);
> +         snprintf(subdirpath, len, "%s/%s", opts->Directory[i],
> SUBDIR_COMPRESS);
> +@@ -699,7 +699,7 @@ int process_files(FiletransferOptions const *opts)
> +
> +     unsigned int i =3D 0;
> +
> +-    while (i < (len - INOTIFY_SZ)) {
> ++    while (i < ((long unsigned int)len - INOTIFY_SZ)) {
> +         struct inotify_event *ie =3D (struct inotify_event *)&buf[i];
> +
> +         if (ie->len > 0) {
> +@@ -712,26 +712,29 @@ int process_files(FiletransferOptions const *opts)
> +                                 DLT_LOG_DEBUG,
> +                                 DLT_STRING("dlt-system-filetransfer,
> found new file."),
> +                                 DLT_STRING(ie->name));
> +-                        int length =3D strlen(opts->Directory[j]) +
> ie->len + 1;
> ++                        size_t length =3D strlen(opts->Directory[j]) +
> strlen(ie->name) + 2;
> +
> +                         if (length > PATH_MAX) {
> +                             DLT_LOG(filetransferContext,
> +                                     DLT_LOG_ERROR,
> +                                     DLT_STRING(
> +                                         "dlt-system-filetransfer: Very
> long path for file transfer. Cancelling transfer! Length is: "),
> +-                                    DLT_INT(length));
> ++                                    DLT_INT((int)length));
> +                             return -1;
> +                         }
> +
> +                         char *tosend =3D malloc(length);
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-truncation=3D"
> +                         snprintf(tosend, length, "%s/%s",
> opts->Directory[j], ie->name);
> ++#pragma GCC diagnostic pop
> +                         send_one(tosend, opts, j);
> +                         free(tosend);
> +                     }
> +             }
> +         }
> +
> +-        i +=3D INOTIFY_SZ + ie->len;
> ++        i +=3D (unsigned int)INOTIFY_SZ + ie->len;
> +     }
> +
> + #endif
> +@@ -741,4 +744,4 @@ int process_files(FiletransferOptions const *opts)
> + void filetransfer_fd_handler(DltSystemConfiguration *config)
> + {
> +     process_files(&(config->Filetransfer));
> +-}
> +\ No newline at end of file
> ++}
> +diff --git a/src/system/dlt-system-journal.c
> b/src/system/dlt-system-journal.c
> +index 366555b..9a55c3f 100644
> +--- a/src/system/dlt-system-journal.c
> ++++ b/src/system/dlt-system-journal.c
> +@@ -393,7 +393,7 @@ void register_journal_fd(sd_journal **j, struct
> pollfd *pollfd, int i,  DltSyste
> +             DLT_STRING(strerror(pollfd[i].fd)));
> +         j_tmp =3D NULL;
> +     }
> +-    pollfd[i].events =3D sd_journal_get_events(j_tmp);
> ++    pollfd[i].events =3D (short)sd_journal_get_events(j_tmp);
> +     if(pollfd[i].events < 0) {
> +         DLT_LOG(dltsystem, DLT_LOG_ERROR, DLT_STRING("Error while
> getting journal events: "),
> +             DLT_STRING(strerror(pollfd[i].events)));
> +diff --git a/src/system/dlt-system-logfile.c
> b/src/system/dlt-system-logfile.c
> +index 941a3be..d31441c 100644
> +--- a/src/system/dlt-system-logfile.c
> ++++ b/src/system/dlt-system-logfile.c
> +@@ -64,7 +64,7 @@ void send_file(LogFileOptions const *fileopt, int n)
> +     FILE *pFile;
> +     DltContext context =3D logfileContext[n];
> +     char buffer[1024];
> +-    int bytes;
> ++    size_t bytes;
> +     int seq =3D 1;
> +
> +     pFile =3D fopen((*fileopt).Filename[n], "r");
> +@@ -73,7 +73,7 @@ void send_file(LogFileOptions const *fileopt, int n)
> +         while (!feof(pFile)) {
> +             bytes =3D fread(buffer, 1, sizeof(buffer) - 1, pFile);
> +
> +-            if (bytes >=3D 0)
> ++            if (bytes =3D=3D (sizeof(buffer) - 1))
> +                 buffer[bytes] =3D 0;
> +             else
> +                 buffer[0] =3D 0;
> +diff --git a/src/system/dlt-system-process-handling.c
> b/src/system/dlt-system-process-handling.c
> +index 3e092d4..708e9e3 100644
> +--- a/src/system/dlt-system-process-handling.c
> ++++ b/src/system/dlt-system-process-handling.c
> +@@ -201,7 +201,7 @@ int register_timer_fd(struct pollfd *pollfd, int
> fdcnt)
> + void timer_fd_handler(int fd, DltSystemConfiguration *config)
> + {
> +     uint64_t timersElapsed =3D 0ULL;
> +-    int r =3D read(fd, &timersElapsed, 8U);    // only needed to reset =
fd
> event
> ++    int r =3D (int)read(fd, &timersElapsed, 8U);    // only needed to
> reset fd event
> +     if (r < 0)
> +         DLT_LOG(dltsystem, DLT_LOG_ERROR, DLT_STRING("Error while
> reading timer fd: "),
> +             DLT_STRING(strerror(r)));
> +diff --git a/src/system/dlt-system-processes.c
> b/src/system/dlt-system-processes.c
> +index c35596c..b17b8ee 100644
> +--- a/src/system/dlt-system-processes.c
> ++++ b/src/system/dlt-system-processes.c
> +@@ -72,7 +72,7 @@ void send_process(LogProcessOptions const *popts, int =
n)
> +     struct dirent *dp;
> +     char filename[PATH_MAX];
> +     char buffer[1024];
> +-    int bytes;
> ++    size_t bytes;
> +     int found =3D 0;
> +
> +     /* go through all process files in directory */
> +diff --git a/src/system/dlt-system-syslog.c
> b/src/system/dlt-system-syslog.c
> +index 59e9d3f..d6b1b8a 100644
> +--- a/src/system/dlt-system-syslog.c
> ++++ b/src/system/dlt-system-syslog.c
> +@@ -88,7 +88,7 @@ int init_socket(SyslogOptions opts)
> + #ifdef DLT_USE_IPv6
> +     syslog_addr.sin6_family =3D AF_INET6;
> +     syslog_addr.sin6_addr =3D in6addr_any;
> +-    syslog_addr.sin6_port =3D htons(opts.Port);
> ++    syslog_addr.sin6_port =3D htons((uint16_t)opts.Port);
> + #else
> +     syslog_addr.sin_family =3D AF_INET;
> +     syslog_addr.sin_addr.s_addr =3D INADDR_ANY;
> +@@ -117,7 +117,7 @@ int read_socket(int sock)
> +     struct sockaddr_in client_addr;
> +     socklen_t addr_len =3D sizeof(struct sockaddr_in);
> +
> +-    int bytes_read =3D recvfrom(sock, recv_data, RECV_BUF_SZ, 0,
> ++    int bytes_read =3D (int)recvfrom(sock, recv_data, RECV_BUF_SZ, 0,
> +                               (struct sockaddr *)&client_addr,
> &addr_len);
> +
> +     if (bytes_read =3D=3D -1) {
> +@@ -157,4 +157,4 @@ int register_syslog_fd(struct pollfd *pollfd, int i,
> DltSystemConfiguration *con
> + void syslog_fd_handler(int syslogSock)
> + {
> +     read_socket(syslogSock);
> +-}
> +\ No newline at end of file
> ++}
> +diff --git a/src/system/dlt-system-watchdog.c
> b/src/system/dlt-system-watchdog.c
> +index 7ed1604..6334214 100644
> +--- a/src/system/dlt-system-watchdog.c
> ++++ b/src/system/dlt-system-watchdog.c
> +@@ -56,7 +56,7 @@ int calculate_period(struct itimerspec *itval)
> +     }
> +
> +     DLT_LOG(watchdogContext, DLT_LOG_DEBUG, DLT_STRING("watchdogusec:
> "), DLT_STRING(watchdogUSec));
> +-    watchdogTimeoutSeconds =3D atoi(watchdogUSec);
> ++    watchdogTimeoutSeconds =3D (unsigned int)atoi(watchdogUSec);
> +
> +     if (watchdogTimeoutSeconds <=3D 0) {
> +         snprintf(str, 512, "systemd watchdog timeout incorrect: %u\n",
> watchdogTimeoutSeconds);
> +@@ -78,9 +78,9 @@ int calculate_period(struct itimerspec *itval)
> +     sec =3D notifiyPeriodNSec / 1000000;
> +     ns =3D (notifiyPeriodNSec - (sec * 1000000)) * 1000;
> +     itval->it_interval.tv_sec =3D sec;
> +-    itval->it_interval.tv_nsec =3D ns;
> ++    itval->it_interval.tv_nsec =3D (long int)ns;
> +     itval->it_value.tv_sec =3D sec;
> +-    itval->it_value.tv_nsec =3D ns;
> ++    itval->it_value.tv_nsec =3D (long int)ns;
> +
> +     return 0;
> + }
> +@@ -114,7 +114,7 @@ void watchdog_fd_handler(int fd)
> + #endif
> + {
> +     uint64_t timersElapsed =3D 0ULL;
> +-    int r =3D read(fd, &timersElapsed, 8U);    // only needed to reset =
fd
> event
> ++    int r =3D (int)read(fd, &timersElapsed, 8U);    // only needed to
> reset fd event
> +     if(r < 0)
> +         DLT_LOG(watchdogContext, DLT_LOG_ERROR, DLT_STRING("Could not
> reset systemd watchdog. Exit with: "),
> +             DLT_STRING(strerror(r)));
> +diff --git a/systemd/3rdparty/sd-daemon.c b/systemd/3rdparty/sd-daemon.c
> +index de3f985..9fde8cc 100644
> +--- a/systemd/3rdparty/sd-daemon.c
> ++++ b/systemd/3rdparty/sd-daemon.c
> +@@ -46,6 +46,7 @@
> + #include <stdio.h>
> + #include <stddef.h>
> + #include <limits.h>
> ++#include <stdint.h>
> +
> + #if defined(__linux__)
> + #include <mqueue.h>
> +@@ -456,12 +457,12 @@ _sd_export_ int sd_notify(int unset_environment,
> const char *state) {
> +                 sockaddr.un.sun_path[0] =3D 0;
> +
> +         memset(&iovec, 0, sizeof(iovec));
> +-        iovec.iov_base =3D (char*) state;
> ++        iovec.iov_base =3D (void *)(uintptr_t)state;
> +         iovec.iov_len =3D strlen(state);
> +
> +         memset(&msghdr, 0, sizeof(msghdr));
> +         msghdr.msg_name =3D &sockaddr;
> +-        msghdr.msg_namelen =3D offsetof(struct sockaddr_un, sun_path) +
> strlen(e);
> ++        msghdr.msg_namelen =3D (socklen_t)(offsetof(struct sockaddr_un,
> sun_path) + strlen(e));
> +
> +         if (msghdr.msg_namelen > sizeof(struct sockaddr_un))
> +                 msghdr.msg_namelen =3D sizeof(struct sockaddr_un);
> +--
> +2.34.1
> +
> diff --git
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cm=
ake-4.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cm=
ake-4.patch
> deleted file mode 100644
> index ac5fec5684..0000000000
> ---
> a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cm=
ake-4.patch
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
> -|   Update the VERSION argument <min> value.  Or, use the <min>...<max>
> syntax
> -|   to tell CMake that the project requires at least <min> but has been
> updated
> -|   to work with policies introduced by <max> or earlier.
> -|
> -|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyw=
ay.
> -|
> -|
> -| -- Configuring incomplete, errors occurred!
> -
> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/75=
5
> ]
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
> - if(${CMAKE_VERSION} VERSION_GREATER "3.20" OR ${CMAKE_VERSION}
> VERSION_EQUAL "3.20")
> -     cmake_policy(SET CMP0115 OLD)
> -diff --git a/examples/example1/CMakeLists.txt
> b/examples/example1/CMakeLists.txt
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
> -diff --git a/examples/example2/CMakeLists.txt
> b/examples/example2/CMakeLists.txt
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
> -diff --git a/examples/example3/CMakeLists.txt
> b/examples/example3/CMakeLists.txt
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
> -diff --git a/examples/example4/CMakeLists.txt
> b/examples/example4/CMakeLists.txt
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
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> deleted file mode 100644
> index 3699b8c83a..0000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/54=
4
> ]
> -
> -From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001
> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> -Date: Thu, 28 Sep 2023 12:54:23 +0200
> -Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non
> amd64
> - and i386 arcs
> -
> ----
> - src/core_dump_handler/dlt_cdh.h         |  2 ++
> - src/core_dump_handler/dlt_cdh_cpuinfo.c | 33 +++++++++++++++++++++++++
> - src/core_dump_handler/dlt_cdh_crashid.c |  2 +-
> - 3 files changed, 36 insertions(+), 1 deletion(-)
> - create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c
> -
> -diff --git a/src/core_dump_handler/dlt_cdh.h
> b/src/core_dump_handler/dlt_cdh.h
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
> -diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c
> b/src/core_dump_handler/dlt_cdh_cpuinfo.c
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
> -+ * \copyright Copyright =C2=A9 2011-2015 BMW AG. \n
> -+ * License MPL-2.0: Mozilla Public License version 2.0
> http://mozilla.org/MPL/2.0/.
> -+ *
> -+ * \file dlt_cdh_cpuinfo.c
> -+ */
> -+
> -+#include "dlt_cdh_cpuinfo.h"
> -+
> -+void get_registers(prstatus_t *prstatus, cdh_registers_t *registers)
> -+{
> -+/*    struct user_regs_struct *ptr_reg =3D (struct user_regs_struct
> *)prstatus->pr_reg;
> -+
> -+    registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
> -+
> -+}
> -diff --git a/src/core_dump_handler/dlt_cdh_crashid.c
> b/src/core_dump_handler/dlt_cdh_crashid.c
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
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
> deleted file mode 100644
> index fd36480456..0000000000
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/56=
7
> ]
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
> -diff --git a/src/core_dump_handler/dlt_cdh.h
> b/src/core_dump_handler/dlt_cdh.h
> -index 8608c6c4..3dac480a 100644
> ---- a/src/core_dump_handler/dlt_cdh.h
> -+++ b/src/core_dump_handler/dlt_cdh.h
> -@@ -45,10 +45,17 @@
> - #define CORE_FILE_PATTERN           "%s/core.%d.%s.%d.gz"
> - #define CONTEXT_FILE_PATTERN        "%s/context.%d.%s.%d.txt"
> -
> -+#if ((__SIZEOF_POINTER) =3D=3D 4)
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
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
> similarity index 90%
> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
> index 82edde6c9d..7f402b0e29 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
> @@ -17,12 +17,12 @@ DEPENDS =3D "zlib gzip-native json-c"
>  SRC_URI =3D "git://
> github.com/COVESA/${BPN}.git;protocol=3Dhttps;branch=3Dmaster
> <http://github.com/COVESA/$%7BBPN%7D.git;protocol=3Dhttps;branch=3Dmaster=
> \
>             file://0002-Don-t-execute-processes-as-a-specific-user.patch =
\
>             file://0004-Modify-systemd-config-directory.patch \
> -           file://544.patch \
> -           file://567.patch \
> -
>  file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch=
 \
> -           file://0003-allow-build-with-cmake-4.patch \
> +           file://0001-Fix-compile-failure-related-to-gzlog.patch \
> +           file://0001-Fix-kinds-of-build-failure.patch \
> +           file://0001-Fix-build-failures.patch \
> +           file://0001-fix-build-failure-when-systemd-is-enabled.patch \
>             "
> -SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
> +SRCREV =3D "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
>
>
>  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '
> systemd systemd-watchdog systemd-journal ', '', d)} \
> @@ -71,4 +71,5 @@ FILES:${PN}-doc +=3D "${datadir}/dlt-filetransfer"
>
>  do_install:append() {
>      rm -f ${D}${bindir}/dlt-test-*
> +    sed -i -e 's:${RECIPE_SYSROOT}::g'
> ${D}/usr/lib/pkgconfig/automotive-dlt.pc
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125309):
> https://lists.openembedded.org/g/openembedded-devel/message/125309
> Mute This Topic: https://lists.openembedded.org/mt/118361368/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ccad17064d453bf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to build see -=C2=A0<a href=3D"https://autobuilder.y=
octoproject.org/valkyrie/api/v2/logs/5867436/raw_inline">https://autobuilde=
r.yoctoproject.org/valkyrie/api/v2/logs/5867436/raw_inline</a></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Mar 17, 2026 at 2:31=E2=80=AFAM Changqing Li via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;<a href=
=3D"http://changqing.li">changqing.li</a>=3D<a href=3D"mailto:windriver.com=
@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Changes:<br>
<a href=3D"https://github.com/COVESA/dlt-daemon/releases" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/COVESA/dlt-daemon/releases</a><br>
<br>
Remove patches already in 3.0.0:<br>
544.patch<br>
567.patch<br>
0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch<br>
0003-allow-build-with-cmake-4.patch<br>
<br>
Add patches to fix build failures<br>
0001-Fix-compile-failure-related-to-gzlog.patch<br>
0001-Fix-kinds-of-build-failure.patch<br>
0001-Fix-build-failures.patch<br>
0001-fix-build-failure-when-systemd-is-enabled.patch<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0...e-DLT_WatchdogSec-can-be-set-by-user.patch |=C2=A0 40 --<br>
=C2=A0.../dlt-daemon/0001-Fix-build-failures.patch=C2=A0 | 360 ++++++++++++=
+++<br>
=C2=A0...Fix-compile-failure-related-to-gzlog.patch |=C2=A0 69 +++<br>
=C2=A0.../0001-Fix-kinds-of-build-failure.patch=C2=A0 =C2=A0 =C2=A0| 174 ++=
+++++<br>
=C2=A0...uild-failure-when-systemd-is-enabled.patch | 423 +++++++++++++++++=
+<br>
=C2=A0.../0003-allow-build-with-cmake-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 99 ----<br>
=C2=A0.../dlt-daemon/dlt-daemon/544.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 80 ----<br>
=C2=A0.../dlt-daemon/dlt-daemon/567.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 36 --<br>
=C2=A0...-<a href=3D"http://daemon_2.18.10.bb" rel=3D"noreferrer" target=3D=
"_blank">daemon_2.18.10.bb</a> =3D&gt; <a href=3D"http://dlt-daemon_3.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_3.0.0.bb</a>} |=C2=A0 11=
 +-<br>
=C2=A09 files changed, 1032 insertions(+), 260 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/000=
1-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/000=
1-Fix-build-failures.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/000=
1-Fix-compile-failure-related-to-gzlog.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/000=
1-Fix-kinds-of-build-failure.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/000=
1-fix-build-failure-when-systemd-is-enabled.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/000=
3-allow-build-with-cmake-4.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544=
.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567=
.patch<br>
=C2=A0rename meta-oe/recipes-extended/dlt-daemon/{<a href=3D"http://dlt-dae=
mon_2.18.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb<=
/a> =3D&gt; <a href=3D"http://dlt-daemon_3.0.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">dlt-daemon_3.0.0.bb</a>} (90%)<br>
<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists=
-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch b/meta-oe/recipes-extend=
ed/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-se=
t-by-user.patch<br>
deleted file mode 100644<br>
index 335872c40f..0000000000<br>
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-ma=
ke-DLT_WatchdogSec-can-be-set-by-user.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17 00:00:00 2001<br>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Fri, 13 Dec 2024 16:37:24 +0800<br>
-Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can be set by user<b=
r>
-<br>
-In my test env, WatchdogSec default value 2 is not enough, manually<br>
-changed to 3 is ok. This makes dlt.service/dlt-system.service start<br>
-failed during boot time. So, make DLT_WatchdogSec can be set by user, so<b=
r>
-user can set them to proper value at build time, then service can start<br=
>
-successfully in boot time.<br>
-<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/COVESA/dlt-daemon=
/pull/720/commits/bc03f142507da92add8ba325fdf8187d47a7d719" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/COVESA/dlt-daemon/pull/720/commits=
/bc03f142507da92add8ba325fdf8187d47a7d719</a>]<br>
-<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- systemd/CMakeLists.txt | 8 ++++++--<br>
- 1 file changed, 6 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/systemd/CMakeLists.txt b/systemd/CMakeLists.txt<br>
-index 16cbe86b5..659378d16 100644<br>
---- a/systemd/CMakeLists.txt<br>
-+++ b/systemd/CMakeLists.txt<br>
-@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)<br>
-=C2=A0 =C2=A0 =C2=A0set(SYSTEMD_CONFIGURATIONS_FILES_DIR ${SYSTEMD_UNITDIR=
} )<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if(WITH_SYSTEMD_WATCHDOG)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 set( DLT_WatchdogSec 2 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(NOT DEFINED DLT_WatchdogSec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set(DLT_WatchdogSec 2 CACHE STR=
ING &quot;Watchdog timeout in seconds&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message( STATUS &quot;The systemd watchd=
og is enabled - timeout is set to ${DLT_WatchdogSec} seconds&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0else(WITH_SYSTEMD_WATCHDOG)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 set( DLT_WatchdogSec 0 )<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(NOT DEFINED DLT_WatchdogSec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set(DLT_WatchdogSec 0 CAC=
HE STRING &quot;Watchdog timeout in seconds&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message( STATUS &quot;The systemd watchd=
og is disabled&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0endif(WITH_SYSTEMD_WATCHDOG)<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-=
failures.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-bu=
ild-failures.patch<br>
new file mode 100644<br>
index 0000000000..6cfa3a5482<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failure=
s.patch<br>
@@ -0,0 +1,360 @@<br>
+From 4813b72cfe82062db41dd1d8cfa7069634d78d9e Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Mon, 16 Mar 2026 13:28:40 +0800<br>
+Subject: [PATCH] Fix build failures<br>
+<br>
+Fix the following similar build failures, some of the build failure<br>
+reproduced with arm64/riscv64, some of the build reproduced with 32bit<br>
+x86/arm.<br>
+<br>
+dlt_daemon_common.c:2785:26: error: conversion to &#39;int8_t&#39; {aka &#=
39;signed char&#39;} from &#39;char&#39; may change the sign of the result =
[-Werror=3Dsign-conversion]<br>
+<br>
+src/tests/dlt-test-multi-process-client-v2.c:302:49: error: format &#39;%l=
ld&#39; expects argument of type &#39;long long int&#39;, but argument 2 ha=
s type &#39;time_t&#39; {aka &#39;long int&#39;} [-Werror=3Dformat=3D]<br>
+=C2=A0 302 |=C2=A0 =C2=A0 =C2=A0printf(&quot; Time running (seconds)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 : %lld\n&quot;, time(NULL) - stats.first_message_time=
);<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~^=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long long int=C2=A0 =C2=A0 =
time_t {aka long int}<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %ld<br>
+<br>
+src/lib/dlt_user.c:5109:60: error: format &#39;%lld&#39; expects argument =
of type &#39;long long int&#39;, but argument 4 has type &#39;__off_t&#39; =
{aka &#39;long int&#39;} [-Werror=3Dformat=3D]<br>
+ 5109 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_DEBUG,=
 &quot;%s: Current file size=3D[%lld]\n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0~~~^<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 long long int<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0%ld<br>
+ 5110 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 st.st_size);<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __off_t {aka long int}<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/COVESA/dlt-daemo=
n/pull/827" rel=3D"noreferrer" target=3D"_blank">https://github.com/COVESA/=
dlt-daemon/pull/827</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ src/daemon/dlt-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++---<br>
+ src/daemon/dlt_daemon_client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 32 ++++++++++----------<br>
+ src/daemon/dlt_daemon_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 +--<br>
+ src/lib/dlt_user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++------<br>
+ src/shared/dlt_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ src/shared/dlt_multiple_files.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
+ src/tests/dlt-test-multi-process-client-v2.c |=C2=A0 8 ++---<br>
+ src/tests/dlt-test-multi-process-v2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
+ src/tests/dlt-test-multi-process.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
+ 9 files changed, 39 insertions(+), 39 deletions(-)<br>
+<br>
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c<br>
+index 523bf33..2ae5bc9 100644<br>
+--- a/src/daemon/dlt-daemon.c<br>
++++ b/src/daemon/dlt-daemon.c<br>
+@@ -457,7 +457,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)<b=
r>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (n &lt; 0 || (size_t)n &gt; sizeof(daemon_local-&gt=
;flags.loggingFilename)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_WARNING, &quot;%s: snprintf=
 truncation/error(%ld) %s\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, n, daem=
on_local-&gt;flags.loggingFilename);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (long i=
nt)n, daemon_local-&gt;flags.loggingFilename);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0daemon_local-&gt;flags.enableLoggingFileLimit =3D fals=
e;<br>
+=C2=A0 =C2=A0 =C2=A0daemon_local-&gt;flags.loggingFileSize =3D 250000;<br>
+@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()<br>
+=C2=A0 =C2=A0 =C2=A0n =3D snprintf(tmp, DLT_PATH_MAX, &quot;%s/dlt&quot;, =
dltFifoBaseDir);<br>
+=C2=A0 =C2=A0 =C2=A0if (n &lt; 0 || (size_t)n &gt; DLT_PATH_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_WARNING, &quot;%s: snprintf=
 truncation/error(%ld) %s\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, n, tmp)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (long i=
nt)n, tmp);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0(void)unlink(tmp);<br>
+@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon *daemon, DltDa=
emonLocal *daemon_local,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_daemon_client_send(DLT_DAEMON_SEND_T=
O_ALL, daemon,daemon_local,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.headerbuffer, sizeof(DltStorageHeader),<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.headerbuffer + sizeof(DltStorageHeader),=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (size_t)(msg.headersize - (int32_t)sizeof(DltStora=
geHeader)),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffer, (size_t)msg.datasize, verbose);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (int)(msg.headersize - (int32_t)sizeof(DltStorageH=
eader)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffer, (int)msg.datasize, verbose);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(msg.databuffer);<br>
+=C2=A0 =C2=A0 =C2=A0}else {<br>
+diff --git a/src/daemon/dlt_daemon_client.c b/src/daemon/dlt_daemon_client=
.c<br>
+index 50d8f19..20a512b 100644<br>
+--- a/src/daemon/dlt_daemon_client.c<br>
++++ b/src/daemon/dlt_daemon_client.c<br>
+@@ -551,8 +551,8 @@ int dlt_daemon_client_send_message_to_all_client(DltDa=
emon *daemon,<br>
+=C2=A0 =C2=A0 =C2=A0return dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, =
daemon, daemon_local,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daemon_local=
-&gt;msg.headerbuffer, sizeof(DltStorageHeader),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daemon_local=
-&gt;msg.headerbuffer + sizeof(DltStorageHeader),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (size_t)(daemon_l=
ocal-&gt;msg.headersize - (int32_t)sizeof(DltStorageHeader)),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon_local-&gt;=
msg.databuffer, (size_t)daemon_local-&gt;msg.datasize, verbose);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)(daemon_loca=
l-&gt;msg.headersize - (int32_t)sizeof(DltStorageHeader)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon_local-&gt;=
msg.databuffer, (int)daemon_local-&gt;msg.datasize, verbose);<br>
+ <br>
+ }<br>
+ <br>
+@@ -771,8 +771,8 @@ int dlt_daemon_client_send_control_message(int sock,<b=
r>
+=C2=A0 =C2=A0 =C2=A0if ((ret =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_daemon_client_send(so=
ck, daemon, daemon_local, msg-&gt;headerbuffer, sizeof(DltStorageHeader),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg-&gt;headerbu=
ffer + sizeof(DltStorageHeader),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (size_t)(msg-&gt;heade=
rsize - (int32_t)sizeof(DltStorageHeader)),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;databuffer, (s=
ize_t)msg-&gt;datasize, verbose))) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)(msg-&gt;headersi=
ze - (int32_t)sizeof(DltStorageHeader)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;databuffer, (i=
nt)msg-&gt;datasize, verbose))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_log(LOG_DEBUG, &quot;dlt_daemon_cont=
rol_send_control_message: DLT message send to all failed!.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1919,7 +1919,7 @@ void dlt_daemon_control_get_log_info(int sock,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* Allocate buffer for response message */<br>
+=C2=A0 =C2=A0 =C2=A0resp.databuffer =3D (uint8_t *)malloc((size_t)resp.dat=
asize);<br>
+-=C2=A0 =C2=A0 resp.databuffersize =3D (size_t)resp.datasize;<br>
++=C2=A0 =C2=A0 resp.databuffersize =3D resp.datasize;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (resp.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_daemon_control_service_response(sock=
,<br>
+@@ -2572,7 +2572,7 @@ int dlt_daemon_control_message_buffer_overflow(int s=
ock,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -2633,7 +2633,7 @@ int dlt_daemon_control_message_buffer_overflow_v2(in=
t sock,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -2686,7 +2686,7 @@ void dlt_daemon_control_service_response(int sock,<b=
r>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -2732,7 +2732,7 @@ void dlt_daemon_control_service_response_v2(int sock=
,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -2779,7 +2779,7 @@ int dlt_daemon_control_message_unregister_context(in=
t sock,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -2842,7 +2842,7 @@ int dlt_daemon_control_message_unregister_context_v2=
(int sock,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -2909,7 +2909,7 @@ int dlt_daemon_control_message_connection_info(int s=
ock,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -2962,7 +2962,7 @@ int dlt_daemon_control_message_connection_info_v2(in=
t sock,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -3010,7 +3010,7 @@ int dlt_daemon_control_message_timezone(int sock, Dl=
tDaemon *daemon, DltDaemonLo<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -3072,7 +3072,7 @@ int dlt_daemon_control_message_timezone_v2(int sock,=
 DltDaemon *daemon, DltDaemo<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+@@ -3127,7 +3127,7 @@ int dlt_daemon_control_message_marker(int sock, DltD=
aemon *daemon, DltDaemonLoca<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)malloc((si=
ze_t)msg.datasize);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.datasize;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)<br>
+diff --git a/src/daemon/dlt_daemon_common.c b/src/daemon/dlt_daemon_common=
.c<br>
+index 2f08c6a..65b264a 100644<br>
+--- a/src/daemon/dlt_daemon_common.c<br>
++++ b/src/daemon/dlt_daemon_common.c<br>
+@@ -2782,7 +2782,7 @@ int dlt_daemon_user_send_log_state(DltDaemon *daemon=
, DltDaemonApplication *app,<br>
+=C2=A0 =C2=A0 =C2=A0if (dlt_user_set_userheader(&amp;userheader, DLT_USER_=
MESSAGE_LOG_STATE) &lt; DLT_RETURN_OK)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+ <br>
+-=C2=A0 =C2=A0 logstate.log_state =3D daemon-&gt;connectionState;<br>
++=C2=A0 =C2=A0 logstate.log_state =3D (int8_t)daemon-&gt;connectionState;<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* log to FIFO */<br>
+=C2=A0 =C2=A0 =C2=A0ret =3D dlt_user_log_out2_with_timeout(app-&gt;user_ha=
ndle,<br>
+@@ -2811,7 +2811,7 @@ int dlt_daemon_user_send_log_state_v2(DltDaemon *dae=
mon, DltDaemonApplication *a<br>
+=C2=A0 =C2=A0 =C2=A0if (dlt_user_set_userheader_v2(&amp;userheader, DLT_US=
ER_MESSAGE_LOG_STATE) &lt; DLT_RETURN_OK)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+ <br>
+-=C2=A0 =C2=A0 logstate.log_state =3D daemon-&gt;connectionState;<br>
++=C2=A0 =C2=A0 logstate.log_state =3D (int8_t)daemon-&gt;connectionState;<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* log to FIFO */<br>
+=C2=A0 =C2=A0 =C2=A0ret =3D dlt_user_log_out2_with_timeout(app-&gt;user_ha=
ndle,<br>
+diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c<br>
+index 6d0098d..e432e26 100644<br>
+--- a/src/lib/dlt_user.c<br>
++++ b/src/lib/dlt_user.c<br>
+@@ -5106,8 +5106,8 @@ DltReturnValue dlt_user_log_send_log(DltContextData =
*log, const int mtype, int *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DLT_R=
ETURN_ERROR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, &quot;%s: C=
urrent file size=3D[%ld]\n&quot;, __func__,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0st.st_size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, &quot;%s: C=
urrent file size=3D[%lld]\n&quot;, __func__,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(long long int)st.st_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check filesize */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Return error if the fil=
e size has reached to maximum */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int msg_size =3D =
(unsigned int)st.st_size + (unsigned int)msg.headersize +<br>
+@@ -5115,8 +5115,8 @@ DltReturnValue dlt_user_log_send_log(DltContextData =
*log, const int mtype, int *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg_size &gt; dlt_user=
.filesize_max) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_user_fil=
e_reach_max =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG=
_ERR,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s: File size (%ld bytes) reached to defined maximum=
 size (%d bytes)\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, st.st_size, dlt_user.filesize_max);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s: File size (%lld bytes) reached to defined maximu=
m size (%d bytes)\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, (long long int)st.st_size, dlt_user.filesize_max=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_mutex_un=
lock();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DLT_R=
ETURN_FILESZERR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -5612,21 +5612,21 @@ DltReturnValue dlt_user_log_send_log_v2(DltContext=
Data *log, const int mtype, Dl<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DLT_R=
ETURN_ERROR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, &quot;%s: C=
urrent file size=3D[%ld]\n&quot;, __func__,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0st.st_size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, &quot;%s: C=
urrent file size=3D[%lld]\n&quot;, __func__,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(long long int)st.st_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check filesize */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Return error if the fil=
e size has reached to maximum */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int msg_size =3D =
0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st.st_size &lt; 0 || s=
t.st_size &gt; UINT_MAX) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_ERR,=
 &quot;%s: File size (%ld bytes) is invalid or too large for unsigned int\n=
&quot;, __func__, st.st_size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_ERR,=
 &quot;%s: File size (%lld bytes) is invalid or too large for unsigned int\=
n&quot;, __func__, (long long int)st.st_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DLT_R=
ETURN_FILESZERR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg_size =3D (unsigned int=
)st.st_size + (unsigned int) msg.headersizev2 + (unsigned int) log-&gt;size=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg_size &gt; dlt_user=
.filesize_max) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_user_fil=
e_reach_max =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG=
_ERR,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s: File size (%ld bytes) reached to defined maximum=
 size (%d bytes)\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, st.st_size, dlt_user.filesize_max);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s: File size (%lld bytes) reached to defined maximu=
m size (%d bytes)\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__func__, (long long int)st.st_size, dlt_user.filesize_max=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DLT_R=
ETURN_FILESZERR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c<br>
+index 6ad354b..aa0aaaa 100644<br>
+--- a/src/shared/dlt_common.c<br>
++++ b/src/shared/dlt_common.c<br>
+@@ -1220,7 +1220,7 @@ DltReturnValue dlt_message_header_flags_v2(DltMessag=
eV2 *msg, char *text, size_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i&lt;5; =
++i){<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tt =3D (tt &=
lt;&lt; 8) | msg-&gt;headerextrav2.seconds[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(text + strlen(text), t=
extlength - strlen(text), &quot;%ld.%.9u &quot;, tt, msg-&gt;headerextrav2.=
nanoseconds);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(text + strlen(text), t=
extlength - strlen(text), &quot;%lld.%.9u &quot;, (long long int)tt, msg-&g=
t;headerextrav2.nanoseconds);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(text + strlen(tex=
t), textlength - strlen(text), &quot;---------- &quot;);<br>
+diff --git a/src/shared/dlt_multiple_files.c b/src/shared/dlt_multiple_fil=
es.c<br>
+index c4019e5..65529ff 100644<br>
+--- a/src/shared/dlt_multiple_files.c<br>
++++ b/src/shared/dlt_multiple_files.c<br>
+@@ -257,7 +257,7 @@ ssize_t multiple_files_buffer_get_total_size(const Mul=
tipleFilesRingBuffer *file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (((unsigned int)res &lt=
; sizeof(filename)) &amp;&amp; (res &gt; 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D 0;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (0 =3D=3D=
 stat(filename, &amp;status))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siz=
e +=3D status.st_size;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siz=
e +=3D (ssize_t)status.st_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fprintf(stderr, &quot;file %s cannot be stat-ed, error=3D%s\n&quot;, fil=
ename, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/src/tests/dlt-test-multi-process-client-v2.c b/src/tests/dlt-=
test-multi-process-client-v2.c<br>
+index 2bb1158..ec99720 100644<br>
+--- a/src/tests/dlt-test-multi-process-client-v2.c<br>
++++ b/src/tests/dlt-test-multi-process-client-v2.c<br>
+@@ -299,10 +299,10 @@ void print_stats(s_statistics stats, s_parameters pa=
rams)<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot; Messages received=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: %d\n&quot;, stats.messages_received);<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot; Broken messages received=C2=A0 =C2=A0 =
=C2=A0 : %d\n&quot;, stats.broken_messages_received);<br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot; Bytes received=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : %d\n&quot;, stats.bytes_received);<br>
+-=C2=A0 =C2=A0 printf(&quot; Time running (seconds)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 : %ld\n&quot;, time(NULL) - stats.first_message_time);<br>
+-=C2=A0 =C2=A0 printf(&quot; Throughput (msgs/sec)/(B/sec) : %ld/%ld\n&quo=
t;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats.messages_received / ((time=
(NULL) - stats.first_message_time) + 1),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(stats.bytes_received) / ((time(=
NULL) - stats.first_message_time) + 1));<br>
++=C2=A0 =C2=A0 printf(&quot; Time running (seconds)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 : %lld\n&quot;, (long long int)(time(NULL) - stats.first_message_tim=
e));<br>
++=C2=A0 =C2=A0 printf(&quot; Throughput (msgs/sec)/(B/sec) : %lld/%lld\n&q=
uot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long int)(stats.messages_r=
eceived / ((time(NULL) - stats.first_message_time) + 1)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long int)((stats.bytes_rec=
eived) / ((time(NULL) - stats.first_message_time) + 1)));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (params.messages_left =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (stats.broken_messages_received =3D=
=3D 0)<br>
+diff --git a/src/tests/dlt-test-multi-process-v2.c b/src/tests/dlt-test-mu=
lti-process-v2.c<br>
+index 44a8622..1d3a54a 100644<br>
+--- a/src/tests/dlt-test-multi-process-v2.c<br>
++++ b/src/tests/dlt-test-multi-process-v2.c<br>
+@@ -393,7 +393,7 @@ void *do_logging(void *arg)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep_time =3D mksleep_time(data-&gt;par=
ams.delay, data-&gt;params.delay_fudge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts.tv_sec =3D sleep_time / 1000000000;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D sleep_time % 1000000000;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D (long int)(sleep_time % 100000=
0000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nanosleep(&amp;ts, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+diff --git a/src/tests/dlt-test-multi-process.c b/src/tests/dlt-test-multi=
-process.c<br>
+index 016c8b4..00fb11c 100644<br>
+--- a/src/tests/dlt-test-multi-process.c<br>
++++ b/src/tests/dlt-test-multi-process.c<br>
+@@ -370,7 +370,7 @@ void *do_logging(void *arg)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep_time =3D mksleep_time(data-&gt;par=
ams.delay, data-&gt;params.delay_fudge);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts.tv_sec =3D sleep_time / 1000000000;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D sleep_time % 1000000000;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D (long int)(sleep_time % 100000=
0000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nanosleep(&amp;ts, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compil=
e-failure-related-to-gzlog.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-=
daemon/0001-Fix-compile-failure-related-to-gzlog.patch<br>
new file mode 100644<br>
index 0000000000..f9692d9f4d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failu=
re-related-to-gzlog.patch<br>
@@ -0,0 +1,69 @@<br>
+From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Thu, 12 Mar 2026 19:37:11 +0800<br>
+Subject: [PATCH] Fix compile failure related to gzlog<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* In commit [1], gzlog is changed from gzFile to gzFile*, this cause<br>
+=C2=A0 failure:<br>
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21: error: p=
assing argument 1 of =E2=80=98gzclose=E2=80=99 from incompatible pointer ty=
pe [-Werror=3Dincompatible-pointer-types]<br>
+=C2=A0 =C2=A088 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzclose(data-&gt;gzlog)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~~~~^~~~~~~<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct gzFile_s **<br>
+compilation terminated due to -Wfatal-errors.<br>
+<br>
+so change gzlog back to gzFile, so that all the gzxxx function can work<br=
>
+well.<br>
+<br>
+* Change to gzFile causes the following failure, since fileno need<br>
+=C2=A0 FILE*, according to code &quot;config-&gt;gzlog =3D gzdopen(config-=
&gt;fd, mode)&quot;,<br>
+=C2=A0 seems we don&#39;t need to use fileno, just use config-&gt;fd is ok=
.<br>
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.c:1133:4=
8: error: passing argument 1 of =E2=80=98fileno=E2=80=99 from incompatible =
pointer type [-Werror=3Dincompatible-pointer-types]<br>
+ 1133 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (fsync(fileno(config-&gt;gzlog)) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ~~~~~~^~~~~~~<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gzFile {aka struct gzFile_s *}<br=
>
+compilation terminated due to -Wfatal-errors.<br>
+<br>
+[1] <a href=3D"https://github.com/COVESA/dlt-daemon/commit/543087ba98c103d=
c576edadeccf614c9dab1b9b3" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/COVESA/dlt-daemon/commit/543087ba98c103dc576edadeccf614c9dab1b9b3</=
a><br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/COVESA/dlt-daemo=
n/pull/826" rel=3D"noreferrer" target=3D"_blank">https://github.com/COVESA/=
dlt-daemon/pull/826</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ src/offlinelogstorage/dlt_offline_logstorage.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
+ src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinel=
ogstorage/dlt_offline_logstorage.h<br>
+index fe38687..09ea5ce 100644<br>
+--- a/src/offlinelogstorage/dlt_offline_logstorage.h<br>
++++ b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
+@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig<br>
+=C2=A0 =C2=A0 =C2=A0FILE *log;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* current open log file */<br>
+=C2=A0 =C2=A0 =C2=A0int fd;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The file descriptor for the=
 active log file */<br>
+ #ifdef DLT_LOGSTORAGE_USE_GZIP<br>
+-=C2=A0 =C2=A0 gzFile *gzlog;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* current open gz log file */<br>
++=C2=A0 =C2=A0 gzFile gzlog;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* current open gz log file */<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0void *cache;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* log data cache */<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int specific_size;=C2=A0 =C2=A0 =C2=A0/* cach=
e size used for specific_size sync strategy */<br>
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/src=
/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
+index f17fbb2..ff09c9e 100644<br>
+--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
+@@ -1130,7 +1130,7 @@ int dlt_logstorage_prepare_on_msg(DltLogStorageFilte=
rConfig *config,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(config-&gt;sync =3D=3D DLT_LOGSTORAGE_SYNC_UNSET)) {<br>
+ #ifdef DLT_LOGSTORAGE_USE_GZIP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (config-&gt;gzip_compression =3D=3D DLT_LOGSTORAGE_GZIP_ON) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (fsync(fileno(config-&gt;gzlog)) !=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (fsync(config-&gt;fd) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno !=3D ENOSYS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, &quot;%s: fa=
iled to sync gzip log file\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-=
of-build-failure.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/000=
1-Fix-kinds-of-build-failure.patch<br>
new file mode 100644<br>
index 0000000000..403d1089e2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-buil=
d-failure.patch<br>
@@ -0,0 +1,174 @@<br>
+From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Thu, 12 Mar 2026 20:06:34 +0800<br>
+Subject: [PATCH] Fix kinds of build failure<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Fix kinds of build failures caused by -Werror=3Dsign-conversion,<br>
+-Werror=3Dcast-qual, -Werror=3Dconversion etc.<br>
+Eg:<br>
+src/offlinelogstorage/dlt_offline_logstorage.h:129:49: error: unsigned con=
version from =E2=80=98int=E2=80=99 to =E2=80=98unsigned int=E2=80=99 change=
s value from =E2=80=98-1=E2=80=99 to =E2=80=984294967295=E2=80=99 [-Werror=
=3Dsign-conversion]<br>
+=C2=A0 129 | #define DLT_LOGSTORAGE_GZIP_ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-1 /* error case */<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36: note: =
in expansion of macro =E2=80=98DLT_LOGSTORAGE_GZIP_ERROR=E2=80=99<br>
+ 1303 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config-&gt;gzip_compression =3D D=
LT_LOGSTORAGE_GZIP_ERROR;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
~~~~~~~~~~~~~~~~~~~~~~~~<br>
+<br>
+src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16: error: con=
version from =E2=80=98z_size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=
=80=99} to =E2=80=98int=E2=80=99 may change value [-Werror=3Dconversion]<br=
>
+=C2=A0 851 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gzfwrite(ptr, size, n=
memb, config-&gt;gzlog);<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
+<br>
+src/console/dlt-control-common.c:922:25: error: cast discards &#39;const&#=
39; qualifier from pointer target type [-Werror=3Dcast-qual]<br>
+=C2=A0 922 |=C2=A0 =C2=A0 =C2=A0json_object_to_file((char*)filename, json_=
filter_obj);<br>
+=C2=A0 =C2=A0 =C2=A0 |<br>
+<br>
+Use explicit type conversion to make the build can pass<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/COVESA/dlt-daemo=
n/pull/826" rel=3D"noreferrer" target=3D"_blank">https://github.com/COVESA/=
dlt-daemon/pull/826</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ src/console/dlt-control-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ src/daemon/dlt-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++=
--<br>
+ src/daemon/udp_connection/dlt_daemon_udp_socket.c=C2=A0 =C2=A0 =C2=A0 | 1=
0 +++++-----<br>
+ src/examples/dlt-example-multicast-clientmsg-view.c=C2=A0 =C2=A0 |=C2=A0 =
8 ++++----<br>
+ src/offlinelogstorage/dlt_offline_logstorage.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
+ .../dlt_offline_logstorage_behavior.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
+ 6 files changed, 15 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-co=
mmon.c<br>
+index 2aeea280..4f9e95b4 100644<br>
+--- a/src/console/dlt-control-common.c<br>
++++ b/src/console/dlt-control-common.c<br>
+@@ -919,7 +919,7 @@ DltReturnValue dlt_json_filter_save(DltFilter *filter,=
 const char *filename, int<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0printf(&quot;Saving current filter into &#39;%s&#39;\n=
&quot;, filename);<br>
+-=C2=A0 =C2=A0 json_object_to_file((char*)filename, json_filter_obj);<br>
++=C2=A0 =C2=A0 json_object_to_file(filename, json_filter_obj);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return DLT_RETURN_OK;<br>
+ }<br>
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c<br>
+index 97af1cd9..94024eb4 100644<br>
+--- a/src/daemon/dlt-daemon.c<br>
++++ b/src/daemon/dlt-daemon.c<br>
+@@ -867,7 +867,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)<b=
r>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if ((longval =3D=3D MULTICAST_CONNECTION_DISABLED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (longval =3D=3D MULTICAST_CONNECTION_ENAB=
LED)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 daemon_local-&gt;UDPConnectionSetup =3D longval;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 daemon_local-&gt;UDPConnectionSetup =3D (int)longv=
al;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Option: %s=3D%s\n&quot;, token,=
 value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0else {<br>
+@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else if (strcmp(token, &quot;UDPMulticastIPPort&quot;) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 daemon_local-&gt;UDPMulticastIPPort =3D strtol(value, NULL, 10);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 daemon_local-&gt;UDPMulticastIPPort =3D (int)strtol(value, NULL,=
 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else if (strcmp(token, &quot;BindAddress&quot;) =3D=3D 0)<br>
+diff --git a/src/daemon/udp_connection/dlt_daemon_udp_socket.c b/src/daemo=
n/udp_connection/dlt_daemon_udp_socket.c<br>
+index 4c40cda8..b3408773 100644<br>
+--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c<br>
++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c<br>
+@@ -66,7 +66,7 @@ void dlt_daemon_udp_setmulticast_addr(DltDaemonLocal *da=
emon_local)<br>
+=C2=A0 =C2=A0 =C2=A0struct sockaddr_in clientaddr;<br>
+=C2=A0 =C2=A0 =C2=A0clientaddr.sin_family =3D AF_INET;<br>
+=C2=A0 =C2=A0 =C2=A0inet_pton(AF_INET, daemon_local-&gt;UDPMulticastIPAddr=
ess, &amp;clientaddr.sin_addr);<br>
+-=C2=A0 =C2=A0 clientaddr.sin_port =3D htons(daemon_local-&gt;UDPMulticast=
IPPort);<br>
++=C2=A0 =C2=A0 clientaddr.sin_port =3D htons((uint16_t)daemon_local-&gt;UD=
PMulticastIPPort);<br>
+=C2=A0 =C2=A0 =C2=A0memcpy(&amp;g_udpmulticast_addr.clientaddr, &amp;clien=
taddr, sizeof(struct sockaddr_in));<br>
+=C2=A0 =C2=A0 =C2=A0g_udpmulticast_addr.clientaddr_size =3D sizeof(g_udpmu=
lticast_addr.clientaddr);<br>
+=C2=A0 =C2=A0 =C2=A0g_udpmulticast_addr.isvalidflag =3D ADDRESS_VALID;<br>
+@@ -224,17 +224,17 @@ void dlt_daemon_udp_clientmsg_send(DltDaemonClientSo=
ckInfo *clientinfo,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if ((clientinfo-&gt;isvalidflag =3D=3D ADDRESS_VALID) =
&amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(size1 &gt; 0) &amp;&amp; (size2 &gt; 0)=
) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data =3D (void *)calloc(size1 + size2, =
sizeof(char));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data =3D (void *)calloc((size_t)(size1 =
+ size2), sizeof(char));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, &quot;%s=
: calloc failure\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(data, data1, size1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(data + size1, data2, size2);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(data, data1, (size_t)size1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy((int*)data + size1, data2, (size_t)siz=
e2);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sendto(g_udp_sock_fd, data, size1 + size2=
, 0, (struct sockaddr *)&amp;clientinfo-&gt;clientaddr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sendto(g_udp_sock_fd, data, (size_t)(size=
1 + size2), 0, (struct sockaddr *)&amp;clientinfo-&gt;clientaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clie=
ntinfo-&gt;clientaddr_size) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, &quot;%s=
: Send UDP Packet Data failed\n&quot;, __func__);<br>
+ <br>
+diff --git a/src/examples/dlt-example-multicast-clientmsg-view.c b/src/exa=
mples/dlt-example-multicast-clientmsg-view.c<br>
+index c00537e5..f8920453 100644<br>
+--- a/src/examples/dlt-example-multicast-clientmsg-view.c<br>
++++ b/src/examples/dlt-example-multicast-clientmsg-view.c<br>
+@@ -74,9 +74,9 @@ int dlt_receiver_receive_socket_udp(struct clientinfostr=
uct *clientinfo, DltRece<br>
+=C2=A0 =C2=A0 =C2=A0/* wait for data from socket */<br>
+=C2=A0 =C2=A0 =C2=A0unsigned int addrlen =3D sizeof(clientinfo-&gt;addr);<=
br>
+ <br>
+-=C2=A0 =C2=A0 if ((receiver-&gt;bytesRcvd =3D recvfrom(clientinfo-&gt;fd,=
<br>
++=C2=A0 =C2=A0 if ((receiver-&gt;bytesRcvd =3D (int32_t)recvfrom(clientinf=
o-&gt;fd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
ceiver-&gt;buf + receiver-&gt;lastBytesRcvd,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 receiver=
-&gt;buffersize - receiver-&gt;lastBytesRcvd,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (size_t)=
(receiver-&gt;buffersize - receiver-&gt;lastBytesRcvd),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s=
truct sockaddr *)&amp;(clientinfo-&gt;addr), &amp;addrlen))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;=3D 0) {<br>
+@@ -177,11 +177,11 @@ int main()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_receiver_receive_socket_udp(&amp;cli=
entinfo, &amp;(clientinfo.receiver));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (dlt_message_read(&amp;msg, (unsig=
ned char *)(clientinfo.receiver.buf),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clientinfo.receiver.bytesRcvd, 0, 0)=
 =3D=3D DLT_MESSAGE_ERROR_OK) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned int)clientinfo.receiver.by=
tesRcvd, 0, 0) =3D=3D DLT_MESSAGE_ERROR_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_receive_message_callba=
ck_udp(&amp;msg);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dlt_receiver_remove(&a=
mp;(clientinfo.receiver),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.headersize + msg.d=
atasize - sizeof(DltStorageHeader))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.headersize + msg.d=
atasize - ((int32_t)(sizeof(DltStorageHeader))))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D DLT_R=
ETURN_ERROR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Return va=
lue ignored */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_message_=
free(&amp;msg, 0);<br>
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinel=
ogstorage/dlt_offline_logstorage.h<br>
+index 09ea5ce4..cfb70f33 100644<br>
+--- a/src/offlinelogstorage/dlt_offline_logstorage.h<br>
++++ b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
+@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig<br>
+=C2=A0 =C2=A0 =C2=A0int overwrite;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Overwrite strategy */<br>
+=C2=A0 =C2=A0 =C2=A0int skip;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Flag to skip file logging if DISCA=
RD_NEW */<br>
+=C2=A0 =C2=A0 =C2=A0char *ecuid;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ECU identifier */<br>
+-=C2=A0 =C2=A0 unsigned int gzip_compression;=C2=A0 /* Toggle if log files=
 should be gzip compressed */<br>
++=C2=A0 =C2=A0 int gzip_compression;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Toggle if log files should be gzip compressed */<br>
+=C2=A0 =C2=A0 =C2=A0/* callback function for filter configurations */<br>
+=C2=A0 =C2=A0 =C2=A0int (*dlt_logstorage_prepare)(DltLogStorageFilterConfi=
g *config,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DltLogStorageUserConfig=
 *file_config,<br>
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/src=
/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
+index ff09c9eb..ae8f4442 100644<br>
+--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
+@@ -848,10 +848,10 @@ DLT_STATIC int dlt_logstorage_write_to_log(void *ptr=
, size_t size, size_t nmemb,<br>
+ {<br>
+ #ifdef DLT_LOGSTORAGE_USE_GZIP<br>
+=C2=A0 =C2=A0 =C2=A0if (config-&gt;gzip_compression =3D=3D DLT_LOGSTORAGE_=
GZIP_ON) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gzfwrite(ptr, size, nmemb, config-&gt;=
gzlog);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)gzfwrite(ptr, size, nmemb, config=
-&gt;gzlog);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fwrite(ptr, size, nmemb, config-&gt;lo=
g);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)fwrite(ptr, size, nmemb, config-&=
gt;log);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0return (int)fwrite(ptr, size, nmemb, config-&gt;log);<=
br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-=
failure-when-systemd-is-enabled.patch b/meta-oe/recipes-extended/dlt-daemon=
/dlt-daemon/0001-fix-build-failure-when-systemd-is-enabled.patch<br>
new file mode 100644<br>
index 0000000000..d19a23cd9c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure=
-when-systemd-is-enabled.patch<br>
@@ -0,0 +1,423 @@<br>
+From 28322f951bb8510ddb4cf767426a67c81ce826ab Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Tue, 17 Mar 2026 13:04:11 +0800<br>
+Subject: [PATCH] fix build failure when systemd is enabled<br>
+<br>
+Fix build failures when -DWITH_SYSTEMD=3DON, -DWITH_SYSTEMD_WATCHDOG=3DON,=
<br>
+-DWITH_SYSTEMD_JOURNAL=3DON:<br>
+Eg:<br>
+src/system/dlt-system-syslog.c:91:39: error: conversion from &#39;int&#39;=
 to &#39;__uint16_t&#39; {aka &#39;short unsigned int&#39;} may change valu=
e [-Werror=3Dconversion]<br>
+=C2=A0 =C2=A091 |=C2=A0 =C2=A0 =C2=A0syslog_addr.sin6_port =3D htons(opts.=
Port);<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~=
~~^~~~~<br>
+<br>
+src/system/dlt-system-logfile.c:74:21: error: conversion from &#39;size_t&=
#39; {aka &#39;long unsigned int&#39;} to &#39;int&#39; may change value [-=
Werror=3Dconversion]<br>
+=C2=A0 =C2=A074 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes =3D=
 fread(buffer, 1, sizeof(buffer) - 1, pFile);<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
+<br>
+src/daemon/dlt-daemon.c:5513:14: error: unused variable &#39;curr_time&#39=
; [-Werror=3Dunused-variable]<br>
+ 5513 |=C2=A0 =C2=A0 =C2=A0uint32_t curr_time =3D 0U;<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~=
~~~~~~<br>
+<br>
+src/system/dlt-system-syslog.c:120:22: error: conversion from &#39;ssize_t=
&#39; {aka &#39;long int&#39;} to &#39;int&#39; may change value [-Werror=
=3Dconversion]<br>
+=C2=A0 120 |=C2=A0 =C2=A0 =C2=A0int bytes_read =3D recvfrom(sock, recv_dat=
a, RECV_BUF_SZ, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>
+<br>
+src/system/dlt-system-logfile.c:76:23: error: comparison of unsigned expre=
ssion in &#39;&gt;=3D 0&#39; is always true [-Werror=3Dtype-limits]<br>
+=C2=A0 =C2=A076 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bytes=
 &gt;=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>
+<br>
+ src/system/dlt-system-filetransfer.c:727:56: error: &#39;__builtin___snpr=
intf_chk&#39; output may be truncated before the last format cha=C2=A0 =C2=
=A0 racter [-Werror=3Dformat-truncation=3D]<br>
+ 10=C2=A0 =C2=A0727 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(tosend, length, &quot;%s/%s&=
quot;, opts-&gt;Directory[j], ie-&gt;name);<br>
+<br>
+src/system/dlt-system-filetransfer.c:153: error: declaration of &#39;len&#=
39; shadows a previous local [-Werror=3Dshadow]<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/COVESA/dlt-daemo=
n/pull/828" rel=3D"noreferrer" target=3D"_blank">https://github.com/COVESA/=
dlt-daemon/pull/828</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ src/daemon/dlt-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 +----<br>
+ src/daemon/dlt_daemon_client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
+ src/system/dlt-system-filetransfer.c=C2=A0 =C2=A0 =C2=A0| 43 ++++++++++++=
+-----------<br>
+ src/system/dlt-system-journal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 +-<br>
+ src/system/dlt-system-logfile.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 4 +--<br>
+ src/system/dlt-system-process-handling.c |=C2=A0 2 +-<br>
+ src/system/dlt-system-processes.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-=
<br>
+ src/system/dlt-system-syslog.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 ++--<br>
+ src/system/dlt-system-watchdog.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 8 ++---<br>
+ systemd/3rdparty/sd-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 +--<br>
+ 10 files changed, 40 insertions(+), 42 deletions(-)<br>
+<br>
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c<br>
+index ef42f89..8c318a4 100644<br>
+--- a/src/daemon/dlt-daemon.c<br>
++++ b/src/daemon/dlt-daemon.c<br>
+@@ -1620,7 +1620,7 @@ int main(int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0watchdogTimeoutSeconds =3D=
 30;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon.watchdog_trigger_interval =3D watchdog=
TimeoutSeconds;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon.watchdog_trigger_interval =3D (unsigne=
d int)watchdogTimeoutSeconds;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daemon.watchdog_last_trigger_time =3D 0U=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_timer_fd(&amp;daemon_local,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0watchdogTimeoutSeconds,<br>
+@@ -5509,9 +5509,6 @@ int dlt_daemon_send_ringbuffer_to_client(DltDaemon *=
daemon, DltDaemonLocal *daem<br>
+=C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0static uint8_t data[DLT_DAEMON_RCVBUFSIZE];<br>
+=C2=A0 =C2=A0 =C2=A0int length;<br>
+-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE<br>
+-=C2=A0 =C2=A0 uint32_t curr_time =3D 0U;<br>
+-#endif<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0PRINT_FUNCTION_VERBOSE(verbose);<br>
+ <br>
+@@ -5554,9 +5551,6 @@ int dlt_daemon_send_ringbuffer_to_client_v2(DltDaemo=
n *daemon, DltDaemonLocal *d<br>
+=C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0static uint8_t data[DLT_DAEMON_RCVBUFSIZE];<br>
+=C2=A0 =C2=A0 =C2=A0int length;<br>
+-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE<br>
+-=C2=A0 =C2=A0 uint32_t curr_time =3D 0U;<br>
+-#endif<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0PRINT_FUNCTION_VERBOSE(verbose);<br>
+ <br>
+diff --git a/src/daemon/dlt_daemon_client.c b/src/daemon/dlt_daemon_client=
.c<br>
+index 20a512b..681bf1e 100644<br>
+--- a/src/daemon/dlt_daemon_client.c<br>
++++ b/src/daemon/dlt_daemon_client.c<br>
+@@ -4690,7 +4690,7 @@ int dlt_daemon_process_systemd_timer(DltDaemon *daem=
on,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if ((daemon_local =3D=3D NULL) || (daemon =3D=3D NULL)=
 || (receiver =3D=3D NULL)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, &quot;%s: invalid para=
meters&quot;, __func__);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)res;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0res =3D read(receiver-&gt;fd, &amp;expir, sizeof(expir=
));<br>
+diff --git a/src/system/dlt-system-filetransfer.c b/src/system/dlt-system-=
filetransfer.c<br>
+index c082f22..6024a3e 100644<br>
+--- a/src/system/dlt-system-filetransfer.c<br>
++++ b/src/system/dlt-system-filetransfer.c<br>
+@@ -105,14 +105,14 @@ char *unique_name(char *src)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(&quot;dlt-syste=
m-filetransfer, creating unique temporary file name.&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0time_t t =3D time(NULL);<br>
+=C2=A0 =C2=A0 =C2=A0int ok;<br>
+-=C2=A0 =C2=A0 uint32_t l =3D getFileSerialNumber(src, &amp;ok) ^ t;<br>
++=C2=A0 =C2=A0 uint32_t l =3D (uint32_t)(getFileSerialNumber(src, &amp;ok)=
 ^ t);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (!ok)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (char *)NULL;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0char *basename_f =3D basename(src);<br>
+=C2=A0 =C2=A0 =C2=A0/* Length of ULONG_MAX + 1 */<br>
+-=C2=A0 =C2=A0 int len =3D 11 + strlen(basename_f);<br>
++=C2=A0 =C2=A0 size_t len =3D 11 + strlen(basename_f);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (len &gt; NAME_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_WARN,<br>
+@@ -155,7 +155,7 @@ void send_dumped_file(FiletransferOptions const *opts,=
 char *dst_tosend)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ((total - used) &lt;=
 (total / 2)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct times=
pec t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.tv_sec =3D=
 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.tv_nsec =3D 100=
0000ul * opts-&gt;TimeoutBetweenLogs;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.tv_nsec =3D (lo=
ng int)(1000000ul * (unsigned long)opts-&gt;TimeoutBetweenLogs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nanosleep(&a=
mp;t, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_user_log=
_resend_buffer();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_user_che=
ck_buffer(&amp;total, &amp;used);<br>
+@@ -220,7 +220,7 @@ int compress_file_to(char *src, char *dst, int level)<=
br>
+=C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(buf);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0while (!feof(src_file)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int read =3D fread(buf, 1, Z_CHUNK_SZ, src_fi=
le);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t read =3D fread(buf, 1, Z_CHUNK_SZ, src=
_file);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ferror(src_file)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);<br>
+@@ -230,7 +230,7 @@ int compress_file_to(char *src, char *dst, int level)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gzwrite(dst_file, buf, read);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 gzwrite(dst_file, buf, (unsigned int)read);<b=
r>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (remove(src) &lt; 0)<br>
+@@ -290,7 +290,7 @@ int send_one(char *src, FiletransferOptions const *opt=
s, int which)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *dst_tocompress;/*file which is goi=
ng to be compressed, the compressed one is named dst_tosend */<br>
+ <br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(fdir) + strlen(SUBDIR_COMP=
RESS) + strlen(rn) + 3;/*the filename in .tocompress +2 for 2*&quot;/&quot;=
, +1 for \0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(fdir) + strlen(SUBDIR_C=
OMPRESS) + strlen(rn) + 3;/*the filename in .tocompress +2 for 2*&quot;/&qu=
ot;, +1 for \0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_tocompress =3D malloc(len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(dst_tocompress);<br>
+ <br>
+@@ -328,7 +328,7 @@ int send_one(char *src, FiletransferOptions const *opt=
s, int which)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*move it directly into &quot;tosend&quo=
t; */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_DEBUG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(&=
quot;dlt-system-filetransfer, Moving file to tmp directory.&quot;));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(fdir) + strlen(SUBDIR_TOSE=
ND) + strlen(rn) + 3;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(fdir) + strlen(SUBDIR_T=
OSEND) + strlen(rn) + 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_tosend =3D malloc(len);/*the resulti=
ng filename in .tosend +2 for 2*&quot;/&quot;, +1 for \0 */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dst_tosend, len, &quot;%s/%s/%s=
&quot;, fdir, SUBDIR_TOSEND, rn);<br>
+@@ -379,7 +379,7 @@ int flush_dir_send(FiletransferOptions const *opts, co=
nst char *compress_dir, co<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG=
_DEBUG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DLT_STRING(&quot;dlt-system-filetransfer, old compressed file found in s=
end directory:&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DLT_STRING(dp-&gt;d_name));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(send_dir) + =
strlen(dp-&gt;d_name) + 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(send_dir)=
 + strlen(dp-&gt;d_name) + 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D malloc(len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(fn, len, &quot;%s=
/%s&quot;, send_dir, dp-&gt;d_name);<br>
+@@ -394,10 +394,10 @@ int flush_dir_send(FiletransferOptions const *opts, =
const char *compress_dir, co<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(tmp,=
 dp-&gt;d_name, strlen(dp-&gt;d_name) - strlen(COMPRESS_EXTENSION));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp[strlen(d=
p-&gt;d_name) - strlen(COMPRESS_EXTENSION)] =3D &#39;\0&#39;;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strle=
n(tmp) + strlen(compress_dir) + 1 + 1;/*2 sizes + 1*&quot;/&quot; + \0 */<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path_uncomp=
ressed =3D malloc(len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t length =3D=
 strlen(tmp) + strlen(compress_dir) + 1 + 1;/*2 sizes + 1*&quot;/&quot; + \=
0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *path_uncomp=
ressed =3D malloc(length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSER=
T(path_uncompressed);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(path_unc=
ompressed, len, &quot;%s/%s&quot;, compress_dir, tmp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(path_unc=
ompressed, length, &quot;%s/%s&quot;, compress_dir, tmp);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat =
sb;<br>
+ <br>
+@@ -475,7 +475,7 @@ int flush_dir_compress(FiletransferOptions const *opts=
, int which, const char *c<br>
+ <br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*compress file into to_se=
nd dir */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(compress_dir=
) + strlen(dp-&gt;d_name) + 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(compress_=
dir) + strlen(dp-&gt;d_name) + 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *cd_filename =3D mall=
oc(len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(cd_filename)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(cd_filename, len,=
 &quot;%s/%s&quot;, compress_dir, dp-&gt;d_name);<br>
+@@ -526,7 +526,7 @@ int flush_dir_original(FiletransferOptions const *opts=
, int which)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG=
_DEBUG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DLT_STRING(&quot;dlt-system-filetransfer, old file found in directory.&q=
uot;));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(sdir) + strl=
en(dp-&gt;d_name) + 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(sdir) + s=
trlen(dp-&gt;d_name) + 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *fn =3D malloc(len);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(fn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(fn, len, &quot;%s=
/%s&quot;, sdir, dp-&gt;d_name);<br>
+@@ -564,7 +564,7 @@ int flush_dir(FiletransferOptions const *opts, int whi=
ch)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0char *compress_dir;<br>
+=C2=A0 =C2=A0 =C2=A0char *send_dir;<br>
+-=C2=A0 =C2=A0 int len =3D strlen(opts-&gt;Directory[which]) + strlen(SUBD=
IR_COMPRESS) + 2;<br>
++=C2=A0 =C2=A0 size_t len =3D strlen(opts-&gt;Directory[which]) + strlen(S=
UBDIR_COMPRESS) + 2;<br>
+=C2=A0 =C2=A0 =C2=A0compress_dir =3D malloc (len);<br>
+=C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(compress_dir);<br>
+=C2=A0 =C2=A0 =C2=A0snprintf(compress_dir, len, &quot;%s/%s&quot;, opts-&g=
t;Directory[which], SUBDIR_COMPRESS);<br>
+@@ -625,7 +625,7 @@ int init_filetransfer_dirs(DltSystemConfiguration *con=
fig)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*create subdirectories for processing t=
he files */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *subdirpath;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(opts-&gt;Directory[i]) + s=
trlen(SUBDIR_COMPRESS) + 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(opts-&gt;Directory[i]) =
+ strlen(SUBDIR_COMPRESS) + 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subdirpath =3D malloc (len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(subdirpath);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(subdirpath, len, &quot;%s/%s&qu=
ot;, opts-&gt;Directory[i], SUBDIR_COMPRESS);<br>
+@@ -699,7 +699,7 @@ int process_files(FiletransferOptions const *opts)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0;<br>
+ <br>
+-=C2=A0 =C2=A0 while (i &lt; (len - INOTIFY_SZ)) {<br>
++=C2=A0 =C2=A0 while (i &lt; ((long unsigned int)len - INOTIFY_SZ)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct inotify_event *ie =3D (struct ino=
tify_event *)&amp;buf[i];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ie-&gt;len &gt; 0) {<br>
+@@ -712,26 +712,29 @@ int process_files(FiletransferOptions const *opts)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG_DEBUG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(&quot;dlt-system-fi=
letransfer, found new file.&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(ie-&gt;name));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int length =3D strlen(opts-&gt;Directory[j]) + ie-&gt;len + 1;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size_t length =3D strlen(opts-&gt;Directory[j]) + strlen(ie-&gt;=
name) + 2;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (length &gt; PATH_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(filetransferContext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;dlt-system-filetransfer: Very long path for file transfer. Cancelling t=
ransfer! Length is: &quot;),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DLT_INT(length));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DLT_INT((int)length));=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char *tosend =3D malloc(length);<br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wformat-truncation=3D&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0snprintf(tosend, length, &quot;%s/%s&quot;, opts-&gt;Direc=
tory[j], ie-&gt;name);<br>
++#pragma GCC diagnostic pop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0send_one(tosend, opts, j);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0free(tosend);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D INOTIFY_SZ + ie-&gt;len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D (unsigned int)INOTIFY_SZ + ie-&gt;len;=
<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+ #endif<br>
+@@ -741,4 +744,4 @@ int process_files(FiletransferOptions const *opts)<br>
+ void filetransfer_fd_handler(DltSystemConfiguration *config)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0process_files(&amp;(config-&gt;Filetransfer));<br>
+-}<br>
+\ No newline at end of file<br>
++}<br>
+diff --git a/src/system/dlt-system-journal.c b/src/system/dlt-system-journ=
al.c<br>
+index 366555b..9a55c3f 100644<br>
+--- a/src/system/dlt-system-journal.c<br>
++++ b/src/system/dlt-system-journal.c<br>
+@@ -393,7 +393,7 @@ void register_journal_fd(sd_journal **j, struct pollfd=
 *pollfd, int i,=C2=A0 DltSyste<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerror(pollfd=
[i].fd)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j_tmp =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 pollfd[i].events =3D sd_journal_get_events(j_tmp);<br>
++=C2=A0 =C2=A0 pollfd[i].events =3D (short)sd_journal_get_events(j_tmp);<b=
r>
+=C2=A0 =C2=A0 =C2=A0if(pollfd[i].events &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_ERROR, DLT_ST=
RING(&quot;Error while getting journal events: &quot;), <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerror(pollfd=
[i].events)));<br>
+diff --git a/src/system/dlt-system-logfile.c b/src/system/dlt-system-logfi=
le.c<br>
+index 941a3be..d31441c 100644<br>
+--- a/src/system/dlt-system-logfile.c<br>
++++ b/src/system/dlt-system-logfile.c<br>
+@@ -64,7 +64,7 @@ void send_file(LogFileOptions const *fileopt, int n)<br>
+=C2=A0 =C2=A0 =C2=A0FILE *pFile;<br>
+=C2=A0 =C2=A0 =C2=A0DltContext context =3D logfileContext[n];<br>
+=C2=A0 =C2=A0 =C2=A0char buffer[1024];<br>
+-=C2=A0 =C2=A0 int bytes;<br>
++=C2=A0 =C2=A0 size_t bytes;<br>
+=C2=A0 =C2=A0 =C2=A0int seq =3D 1;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0pFile =3D fopen((*fileopt).Filename[n], &quot;r&quot;)=
;<br>
+@@ -73,7 +73,7 @@ void send_file(LogFileOptions const *fileopt, int n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (!feof(pFile)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes =3D fread(buffer, 1,=
 sizeof(buffer) - 1, pFile);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes &gt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes =3D=3D (sizeof(buffer=
) - 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffer[bytes=
] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffer[0] =
=3D 0;<br>
+diff --git a/src/system/dlt-system-process-handling.c b/src/system/dlt-sys=
tem-process-handling.c<br>
+index 3e092d4..708e9e3 100644<br>
+--- a/src/system/dlt-system-process-handling.c<br>
++++ b/src/system/dlt-system-process-handling.c<br>
+@@ -201,7 +201,7 @@ int register_timer_fd(struct pollfd *pollfd, int fdcnt=
)<br>
+ void timer_fd_handler(int fd, DltSystemConfiguration *config)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0uint64_t timersElapsed =3D 0ULL;<br>
+-=C2=A0 =C2=A0 int r =3D read(fd, &amp;timersElapsed, 8U);=C2=A0 =C2=A0 //=
 only needed to reset fd event<br>
++=C2=A0 =C2=A0 int r =3D (int)read(fd, &amp;timersElapsed, 8U);=C2=A0 =C2=
=A0 // only needed to reset fd event<br>
+=C2=A0 =C2=A0 =C2=A0if (r &lt; 0) <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_ERROR, DLT_ST=
RING(&quot;Error while reading timer fd: &quot;), <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerror(r)));<=
br>
+diff --git a/src/system/dlt-system-processes.c b/src/system/dlt-system-pro=
cesses.c<br>
+index c35596c..b17b8ee 100644<br>
+--- a/src/system/dlt-system-processes.c<br>
++++ b/src/system/dlt-system-processes.c<br>
+@@ -72,7 +72,7 @@ void send_process(LogProcessOptions const *popts, int n)=
<br>
+=C2=A0 =C2=A0 =C2=A0struct dirent *dp;<br>
+=C2=A0 =C2=A0 =C2=A0char filename[PATH_MAX];<br>
+=C2=A0 =C2=A0 =C2=A0char buffer[1024];<br>
+-=C2=A0 =C2=A0 int bytes;<br>
++=C2=A0 =C2=A0 size_t bytes;<br>
+=C2=A0 =C2=A0 =C2=A0int found =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* go through all process files in directory */<br>
+diff --git a/src/system/dlt-system-syslog.c b/src/system/dlt-system-syslog=
.c<br>
+index 59e9d3f..d6b1b8a 100644<br>
+--- a/src/system/dlt-system-syslog.c<br>
++++ b/src/system/dlt-system-syslog.c<br>
+@@ -88,7 +88,7 @@ int init_socket(SyslogOptions opts)<br>
+ #ifdef DLT_USE_IPv6<br>
+=C2=A0 =C2=A0 =C2=A0syslog_addr.sin6_family =3D AF_INET6;<br>
+=C2=A0 =C2=A0 =C2=A0syslog_addr.sin6_addr =3D in6addr_any;<br>
+-=C2=A0 =C2=A0 syslog_addr.sin6_port =3D htons(opts.Port);<br>
++=C2=A0 =C2=A0 syslog_addr.sin6_port =3D htons((uint16_t)opts.Port);<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0syslog_addr.sin_family =3D AF_INET;<br>
+=C2=A0 =C2=A0 =C2=A0syslog_addr.sin_addr.s_addr =3D INADDR_ANY;<br>
+@@ -117,7 +117,7 @@ int read_socket(int sock)<br>
+=C2=A0 =C2=A0 =C2=A0struct sockaddr_in client_addr;<br>
+=C2=A0 =C2=A0 =C2=A0socklen_t addr_len =3D sizeof(struct sockaddr_in);<br>
+ <br>
+-=C2=A0 =C2=A0 int bytes_read =3D recvfrom(sock, recv_data, RECV_BUF_SZ, 0=
,<br>
++=C2=A0 =C2=A0 int bytes_read =3D (int)recvfrom(sock, recv_data, RECV_BUF_=
SZ, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct sockaddr *)&amp;client_addr, =
&amp;addr_len);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (bytes_read =3D=3D -1) {<br>
+@@ -157,4 +157,4 @@ int register_syslog_fd(struct pollfd *pollfd, int i, D=
ltSystemConfiguration *con<br>
+ void syslog_fd_handler(int syslogSock)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0read_socket(syslogSock);<br>
+-}<br>
+\ No newline at end of file<br>
++}<br>
+diff --git a/src/system/dlt-system-watchdog.c b/src/system/dlt-system-watc=
hdog.c<br>
+index 7ed1604..6334214 100644<br>
+--- a/src/system/dlt-system-watchdog.c<br>
++++ b/src/system/dlt-system-watchdog.c<br>
+@@ -56,7 +56,7 @@ int calculate_period(struct itimerspec *itval)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0DLT_LOG(watchdogContext, DLT_LOG_DEBUG, DLT_STRING(&qu=
ot;watchdogusec: &quot;), DLT_STRING(watchdogUSec));<br>
+-=C2=A0 =C2=A0 watchdogTimeoutSeconds =3D atoi(watchdogUSec);<br>
++=C2=A0 =C2=A0 watchdogTimeoutSeconds =3D (unsigned int)atoi(watchdogUSec)=
;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (watchdogTimeoutSeconds &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(str, 512, &quot;systemd watchdo=
g timeout incorrect: %u\n&quot;, watchdogTimeoutSeconds);<br>
+@@ -78,9 +78,9 @@ int calculate_period(struct itimerspec *itval)<br>
+=C2=A0 =C2=A0 =C2=A0sec =3D notifiyPeriodNSec / 1000000;<br>
+=C2=A0 =C2=A0 =C2=A0ns =3D (notifiyPeriodNSec - (sec * 1000000)) * 1000;<b=
r>
+=C2=A0 =C2=A0 =C2=A0itval-&gt;it_interval.tv_sec =3D sec;<br>
+-=C2=A0 =C2=A0 itval-&gt;it_interval.tv_nsec =3D ns;<br>
++=C2=A0 =C2=A0 itval-&gt;it_interval.tv_nsec =3D (long int)ns;<br>
+=C2=A0 =C2=A0 =C2=A0itval-&gt;it_value.tv_sec =3D sec;<br>
+-=C2=A0 =C2=A0 itval-&gt;it_value.tv_nsec =3D ns;<br>
++=C2=A0 =C2=A0 itval-&gt;it_value.tv_nsec =3D (long int)ns;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+@@ -114,7 +114,7 @@ void watchdog_fd_handler(int fd)<br>
+ #endif<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0uint64_t timersElapsed =3D 0ULL;<br>
+-=C2=A0 =C2=A0 int r =3D read(fd, &amp;timersElapsed, 8U);=C2=A0 =C2=A0 //=
 only needed to reset fd event<br>
++=C2=A0 =C2=A0 int r =3D (int)read(fd, &amp;timersElapsed, 8U);=C2=A0 =C2=
=A0 // only needed to reset fd event<br>
+=C2=A0 =C2=A0 =C2=A0if(r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(watchdogContext, DLT_LOG_ERROR, =
DLT_STRING(&quot;Could not reset systemd watchdog. Exit with: &quot;), <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerror(r)));<=
br>
+diff --git a/systemd/3rdparty/sd-daemon.c b/systemd/3rdparty/sd-daemon.c<b=
r>
+index de3f985..9fde8cc 100644<br>
+--- a/systemd/3rdparty/sd-daemon.c<br>
++++ b/systemd/3rdparty/sd-daemon.c<br>
+@@ -46,6 +46,7 @@<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;stddef.h&gt;<br>
+ #include &lt;limits.h&gt;<br>
++#include &lt;stdint.h&gt;<br>
+ <br>
+ #if defined(__linux__)<br>
+ #include &lt;mqueue.h&gt;<br>
+@@ -456,12 +457,12 @@ _sd_export_ int sd_notify(int unset_environment, con=
st char *state) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sockaddr.un.=
sun_path[0] =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;iovec, 0, sizeof(iovec));<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 iovec.iov_base =3D (char*) state;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 iovec.iov_base =3D (void *)(uintptr_t)state;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iovec.iov_len =3D strlen(state);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;msghdr, 0, sizeof(msghdr));<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msghdr.msg_name =3D &amp;sockaddr;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msghdr.msg_namelen =3D offsetof(struct sockad=
dr_un, sun_path) + strlen(e);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msghdr.msg_namelen =3D (socklen_t)(offsetof(s=
truct sockaddr_un, sun_path) + strlen(e));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msghdr.msg_namelen &gt; sizeof(struc=
t sockaddr_un))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msghdr.msg_n=
amelen =3D sizeof(struct sockaddr_un);<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-buil=
d-with-cmake-4.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-=
allow-build-with-cmake-4.patch<br>
deleted file mode 100644<br>
index ac5fec5684..0000000000<br>
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-=
cmake-4.patch<br>
+++ /dev/null<br>
@@ -1,99 +0,0 @@<br>
-From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17 00:00:00 2001<br>
-From: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" target=3D"_b=
lank">alperyasinak1@gmail.com</a>&gt;<br>
-Date: Wed, 9 Jul 2025 18:18:33 +0300<br>
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+<b=
r>
- compatibility<br>
-<br>
-Fix:<br>
-<br>
-| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):<br>
-|=C2=A0 =C2=A0Compatibility with CMake &lt; 3.5 has been removed from CMak=
e.<br>
-|<br>
-|=C2=A0 =C2=A0Update the VERSION argument &lt;min&gt; value.=C2=A0 Or, use=
 the &lt;min&gt;...&lt;max&gt; syntax<br>
-|=C2=A0 =C2=A0to tell CMake that the project requires at least &lt;min&gt;=
 but has been updated<br>
-|=C2=A0 =C2=A0to work with policies introduced by &lt;max&gt; or earlier.<=
br>
-|<br>
-|=C2=A0 =C2=A0Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configur=
ing anyway.<br>
-|<br>
-|<br>
-| -- Configuring incomplete, errors occurred!<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/COVESA/dlt-daemo=
n/pull/755" rel=3D"noreferrer" target=3D"_blank">https://github.com/COVESA/=
dlt-daemon/pull/755</a>]<br>
-<br>
-Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" tar=
get=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
----<br>
- CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
- examples/example1/CMakeLists.txt | 2 +-<br>
- examples/example2/CMakeLists.txt | 2 +-<br>
- examples/example3/CMakeLists.txt | 2 +-<br>
- examples/example4/CMakeLists.txt | 2 +-<br>
- 5 files changed, 5 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 94185b8..2a0f619 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -14,7 +14,7 @@<br>
- #######<br>
- <br>
- # Set minimum Cmake version and setup policy behavior<br>
--cmake_minimum_required(VERSION 3.3)<br>
-+cmake_minimum_required(VERSION 3.5)<br>
- <br>
- if(${CMAKE_VERSION} VERSION_GREATER &quot;3.20&quot; OR ${CMAKE_VERSION} =
VERSION_EQUAL &quot;3.20&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0cmake_policy(SET CMP0115 OLD)<br>
-diff --git a/examples/example1/CMakeLists.txt b/examples/example1/CMakeLis=
ts.txt<br>
-index 60644a1..44cd053 100644<br>
---- a/examples/example1/CMakeLists.txt<br>
-+++ b/examples/example1/CMakeLists.txt<br>
-@@ -17,7 +17,7 @@<br>
- # DLT example implementation<br>
- #<br>
- <br>
--cmake_minimum_required( VERSION 2.6 )<br>
-+cmake_minimum_required( VERSION 3.5 )<br>
- project( automotive-dlt-example1 )<br>
- <br>
- #<br>
-diff --git a/examples/example2/CMakeLists.txt b/examples/example2/CMakeLis=
ts.txt<br>
-index 66a4f24..a8efbcf 100644<br>
---- a/examples/example2/CMakeLists.txt<br>
-+++ b/examples/example2/CMakeLists.txt<br>
-@@ -17,7 +17,7 @@<br>
- # DLT example implementation<br>
- #<br>
- <br>
--cmake_minimum_required( VERSION 2.6 )<br>
-+cmake_minimum_required( VERSION 3.5 )<br>
- project( automotive-dlt-example2 )<br>
- <br>
- #<br>
-diff --git a/examples/example3/CMakeLists.txt b/examples/example3/CMakeLis=
ts.txt<br>
-index 45b7467..4d4958d 100644<br>
---- a/examples/example3/CMakeLists.txt<br>
-+++ b/examples/example3/CMakeLists.txt<br>
-@@ -17,7 +17,7 @@<br>
- # DLT example implementation<br>
- #<br>
- <br>
--cmake_minimum_required( VERSION 2.6 )<br>
-+cmake_minimum_required( VERSION 3.5 )<br>
- project( automotive-dlt-example3 )<br>
- <br>
- #<br>
-diff --git a/examples/example4/CMakeLists.txt b/examples/example4/CMakeLis=
ts.txt<br>
-index 53a4fad..161c333 100644<br>
---- a/examples/example4/CMakeLists.txt<br>
-+++ b/examples/example4/CMakeLists.txt<br>
-@@ -17,7 +17,7 @@<br>
- # DLT example implementation<br>
- #<br>
- <br>
--cmake_minimum_required( VERSION 2.6 )<br>
-+cmake_minimum_required( VERSION 3.5 )<br>
- project( automotive-dlt-example4 )<br>
- <br>
- #<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br>
deleted file mode 100644<br>
index 3699b8c83a..0000000000<br>
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br>
+++ /dev/null<br>
@@ -1,80 +0,0 @@<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/COVESA/dlt-daemo=
n/pull/544" rel=3D"noreferrer" target=3D"_blank">https://github.com/COVESA/=
dlt-daemon/pull/544</a>]<br>
-<br>
-From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001<br>
-From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfranco@yah=
oo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt;<br>
-Date: Thu, 28 Sep 2023 12:54:23 +0200<br>
-Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non amd6=
4<br>
- and i386 arcs<br>
-<br>
----<br>
- src/core_dump_handler/dlt_cdh.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 ++<br>
- src/core_dump_handler/dlt_cdh_cpuinfo.c | 33 +++++++++++++++++++++++++<br=
>
- src/core_dump_handler/dlt_cdh_crashid.c |=C2=A0 2 +-<br>
- 3 files changed, 36 insertions(+), 1 deletion(-)<br>
- create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c<br>
-<br>
-diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt_c=
dh.h<br>
-index d572ecf3..8608c6c4 100644<br>
---- a/src/core_dump_handler/dlt_cdh.h<br>
-+++ b/src/core_dump_handler/dlt_cdh.h<br>
-@@ -55,6 +55,8 @@ typedef struct<br>
-=C2=A0 =C2=A0 =C2=A0uint64_t pc;<br>
-=C2=A0 =C2=A0 =C2=A0uint64_t ip;<br>
-=C2=A0 =C2=A0 =C2=A0uint64_t lr;<br>
-+=C2=A0 =C2=A0 uint64_t sp;<br>
-+=C2=A0 =C2=A0 uint64_t fp;<br>
- <br>
- } cdh_registers_t;<br>
- <br>
-diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_handl=
er/dlt_cdh_cpuinfo.c<br>
-new file mode 100644<br>
-index 00000000..03509fda<br>
---- /dev/null<br>
-+++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c<br>
-@@ -0,0 +1,33 @@<br>
-+/*<br>
-+ * SPDX license identifier: MPL-2.0<br>
-+ *<br>
-+ * Copyright (C) 2011-2015, BMW AG<br>
-+ *<br>
-+ * This file is part of COVESA Project DLT - Diagnostic Log and Trace.<br=
>
-+ *<br>
-+ * This Source Code Form is subject to the terms of the<br>
-+ * Mozilla Public License (MPL), v. 2.0.<br>
-+ * If a copy of the MPL was not distributed with this file,<br>
-+ * You can obtain one at <a href=3D"http://mozilla.org/MPL/2.0/" rel=3D"n=
oreferrer" target=3D"_blank">http://mozilla.org/MPL/2.0/</a>.<br>
-+ *<br>
-+ * For further information see <a href=3D"http://www.covesa.org/" rel=3D"=
noreferrer" target=3D"_blank">http://www.covesa.org/</a>.<br>
-+ */<br>
-+<br>
-+/*!<br>
-+ * \author Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofborg@debi=
an.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
-+ *<br>
-+ * \copyright Copyright =C2=A9 2011-2015 BMW AG. \n<br>
-+ * License MPL-2.0: Mozilla Public License version 2.0 <a href=3D"http://=
mozilla.org/MPL/2.0/" rel=3D"noreferrer" target=3D"_blank">http://mozilla.o=
rg/MPL/2.0/</a>.<br>
-+ *<br>
-+ * \file dlt_cdh_cpuinfo.c<br>
-+ */<br>
-+<br>
-+#include &quot;dlt_cdh_cpuinfo.h&quot;<br>
-+<br>
-+void get_registers(prstatus_t *prstatus, cdh_registers_t *registers)<br>
-+{<br>
-+/*=C2=A0 =C2=A0 struct user_regs_struct *ptr_reg =3D (struct user_regs_st=
ruct *)prstatus-&gt;pr_reg;<br>
-+<br>
-+=C2=A0 =C2=A0 registers-&gt;pc =3D ptr_reg-&gt;pc;*/ /* [REG_PROC_COUNTER=
]; */<br>
-+<br>
-+}<br>
-diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_handl=
er/dlt_cdh_crashid.c<br>
-index bca44e0e..8dd98d70 100644<br>
---- a/src/core_dump_handler/dlt_cdh_crashid.c<br>
-+++ b/src/core_dump_handler/dlt_cdh_crashid.c<br>
-@@ -30,7 +30,7 @@<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;string.h&gt;<br>
- #include &lt;errno.h&gt;<br>
--#include &lt;asm/prctl.h&gt;<br>
-+#include &lt;sys/prctl.h&gt;<br>
- #include &lt;inttypes.h&gt;<br>
- <br>
- #include &quot;dlt_cdh.h&quot;<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch<br>
deleted file mode 100644<br>
index fd36480456..0000000000<br>
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/COVESA/dlt-daemo=
n/pull/567" rel=3D"noreferrer" target=3D"_blank">https://github.com/COVESA/=
dlt-daemon/pull/567</a>]<br>
-<br>
-From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17 00:00:00 2001<br>
-From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnagianfranco@yah=
oo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&gt;<br>
-Date: Mon, 13 Nov 2023 12:37:23 +0100<br>
-Subject: [PATCH] dlt_cdh:<br>
-<br>
-Make sure on 64 bit we read an ELF64 structure.<br>
-Otherwise we get a read error, and the context file is missing some good<b=
r>
-to know information<br>
----<br>
- src/core_dump_handler/dlt_cdh.h | 7 +++++++<br>
- 1 file changed, 7 insertions(+)<br>
-<br>
-diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt_c=
dh.h<br>
-index 8608c6c4..3dac480a 100644<br>
---- a/src/core_dump_handler/dlt_cdh.h<br>
-+++ b/src/core_dump_handler/dlt_cdh.h<br>
-@@ -45,10 +45,17 @@<br>
- #define CORE_FILE_PATTERN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%=
s/core.%d.%s.%d.gz&quot;<br>
- #define CONTEXT_FILE_PATTERN=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s/context.=
%d.%s.%d.txt&quot;<br>
- <br>
-+#if ((__SIZEOF_POINTER) =3D=3D 4)<br>
- #define ELF_Ehdr=C2=A0 =C2=A0 Elf32_Ehdr<br>
- #define ELF_Phdr=C2=A0 =C2=A0 Elf32_Phdr<br>
- #define ELF_Shdr=C2=A0 =C2=A0 Elf32_Shdr<br>
- #define ELF_Nhdr=C2=A0 =C2=A0 Elf32_Nhdr<br>
-+#else<br>
-+#define ELF_Ehdr=C2=A0 =C2=A0 Elf64_Ehdr<br>
-+#define ELF_Phdr=C2=A0 =C2=A0 Elf64_Phdr<br>
-+#define ELF_Shdr=C2=A0 =C2=A0 Elf64_Shdr<br>
-+#define ELF_Nhdr=C2=A0 =C2=A0 Elf64_Nhdr<br>
-+#endif<br>
- <br>
- typedef struct<br>
- {<br>
diff --git a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daem=
on_2.18.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</=
a> b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_3.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_3.0.0.bb</a><br>
similarity index 90%<br>
rename from meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemo=
n_2.18.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a=
><br>
rename to meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_=
3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_3.0.0.bb</a><br>
index 82edde6c9d..7f402b0e29 100644<br>
--- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_2.18=
.10.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_2.18.10.bb</a><br>
+++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"http://dlt-daemon_3.0.=
0.bb" rel=3D"noreferrer" target=3D"_blank">dlt-daemon_3.0.0.bb</a><br>
@@ -17,12 +17,12 @@ DEPENDS =3D &quot;zlib gzip-native json-c&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/COVESA/$%7BBPN%7=
D.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank=
">github.com/COVESA/${BPN}.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Don-t-execute-process=
es-as-a-specific-user.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Modify-systemd-config=
-directory.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://544.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://567.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CMakeLists-txt-make-D=
LT_WatchdogSec-can-be-set-by-user.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-allow-build-with-cmak=
e-4.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-compile-failure-r=
elated-to-gzlog.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-kinds-of-build-fa=
ilure.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-failures.pa=
tch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fix-build-failure-whe=
n-systemd-is-enabled.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;0f2d4cfffada6f8448a2cb27995b38eb4271044f&quot;<br>
+SRCREV =3D &quot;f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320&quot;<br>
<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;systemd&#39;, &#39; systemd systemd-watchdog systemd-journal &#39;=
, &#39;&#39;, d)} \<br>
@@ -71,4 +71,5 @@ FILES:${PN}-doc +=3D &quot;${datadir}/dlt-filetransfer&qu=
ot;<br>
<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/dlt-test-*<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s:${RECIPE_SYSROOT}::g&#39; ${D}/usr/lib/pkgc=
onfig/automotive-dlt.pc<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125309): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125309" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125309</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118361368/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118361368/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ccad17064d453bf4--

