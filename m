Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9FFC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 16:35:18 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.12758.1639672517716330551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 08:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYG65IE0;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id de30so23862944qkb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 08:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+EnyrjJwXa+MbDaqYZJislOZ+ZsftEvjOCOwquYApc=;
        b=UYG65IE0cSDDoqVo30oxqZoghQWjnZ3GUZFBsbxkKb2lWAIsgTFO2oryN+bnSzpjQk
         r8WSoQdJMRrcvCI6oqNMYB3MQNDnLk1JT5gMzSdQ1rQ4ay1EtbO3Hb6iQg6c2QiqNSPW
         YgDh5vqo0tzhU+fJ9eQ5avuRVf5LjWynuZrr8V/X5VDztVngLnGmAOgcsR5hzRb2UhGS
         Le9D2F1tDIOffNHOT6e0ytCask4WzuNMlyvTyfi+GZPRJYx6DJDGf9HIY9wrXZs6we15
         M2NHxuaxk/VJ6I8IkP91sK+XVlJN8ZxfWq+Tk2PiP3MfBlYesRJ1qPqUeMHInjJwJmAV
         itBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+EnyrjJwXa+MbDaqYZJislOZ+ZsftEvjOCOwquYApc=;
        b=TJTStYWhMnkFdHtW5jbmIiCvxjx6qbgp3/ASK5dsuuKoK1qAkXU0qIGzm7kqIEHUZe
         G2pLaJ5Gs31Vd4dXrGBZh64XLTiW9/cNHskxJ7igDTGYQggCgkhC+0MaRDGaBI7X6zmY
         Z7WYErdCeYcQDKVFwgenyWiVIiTPy6a04fxdFK5h9hSKRNeJGI/Tv0ryaHwe7nKQq9uB
         f36GELn/qiOsC7HsOPr4+2cmOl9nRDXoITvuYxC18oqiAbSqLfdUIE78KF0oPZ1EvQYg
         EgMacf48QHVUyQgc55kcctXlwPC+8iBlmktsep/GD9QDoUNMRVFxgzwvJT/iRKteOqaM
         vTZQ==
X-Gm-Message-State: AOAM5332WemQr2fykb9oh1y2EuJ0bX+a7wTtk6SNNPRn2cMs3wtwsLyP
	eFHWTA6Ct49Q0NVhiV2n9GMKlXPdpvzM+pIXqq8=
X-Google-Smtp-Source: 
 ABdhPJy4BMTyGYOUQ1ln+dVJc9FzAFXjgev4fRcQjZpp3VnWdyVlJTbapQHpWZ3VlYf5nTOFHGhZkd7YUm0Oy8/H7D8=
X-Received: by 2002:a37:747:: with SMTP id 68mr12620039qkh.227.1639672516675;
 Thu, 16 Dec 2021 08:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20211215191550.1964457-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211215191550.1964457-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Dec 2021 08:34:49 -0800
Message-ID: 
 <CAMKF1sqi=oVih2nJJchBPAx6=W8pZqNRagVYE5qDdHqkPVH3ZQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libkcapi: update to 1.3.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 16:35:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94404

it fails to build on musl/aarch64 see
https://errors.yoctoproject.org/Errors/Details/619382/

On Wed, Dec 15, 2021 at 11:15 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Dropped upstreamed patch.
>
> License-Update: copyright years updated.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...f-__NR_io_getevents-when-not-defined.patch | 36 -------------------
>  .../{libkcapi_1.2.1.bb => libkcapi_1.3.1.bb}  |  8 ++---
>  2 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
>  rename meta-oe/recipes-crypto/libkcapi/{libkcapi_1.2.1.bb => libkcapi_1.3.1.bb} (81%)
>
> diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
> deleted file mode 100644
> index 9d9f63e34..000000000
> --- a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 771dd6aa45dd0bbbb7d7c7a7b116e1b5666fbd7a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 15 Nov 2020 18:05:48 -0800
> -Subject: [PATCH] Disable use of __NR_io_getevents when not defined
> -
> -Architectures like riscv32 do not define this syscall, therefore return
> -ENOSYS on such architectures
> -
> -Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/100]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lib/internal.h | 12 ++++++++++++
> - 1 file changed, 12 insertions(+)
> -
> ---- a/lib/internal.h
> -+++ b/lib/internal.h
> -@@ -325,10 +325,17 @@ static inline int io_submit(aio_context_
> -     return syscall(__NR_io_submit, ctx, n, iocb);
> - }
> -
> --static inline int io_getevents(aio_context_t ctx, long min, long max,
> --            struct io_event *events, struct timespec *timeout)
> -+static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
> -+            __attribute__((unused)) long min,
> -+            __attribute__((unused)) long max,
> -+            __attribute__((unused)) struct io_event *events,
> -+            __attribute__((unused)) struct timespec *timeout)
> - {
> -+#ifdef __NR_io_getevents
> -     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
> -+#else
> -+    return -ENOSYS;
> -+#endif
> - }
> -
> - /************************************************************
> diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
> similarity index 81%
> rename from meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
> rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
> index cc71903a8..f10d68470 100644
> --- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
> +++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
> @@ -1,13 +1,11 @@
>  SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
>  HOMEPAGE = "http://www.chronox.de/libkcapi.html"
>  LICENSE = "BSD-3-Clause | GPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c78be93ed8d1637f2a3f4a83ff9d5f54"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=80c467906eb826339c7f09e61808ed23"
>
>  S = "${WORKDIR}/git"
> -SRCREV = "d41284525ec8960e9a828979cfe269012b7df8db"
> -SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
> -           file://0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch \
> -           "
> +SRCREV = "2936ecd060c299157ac880650ba2c9fd94d27bb1"
> +SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https"
>
>  inherit autotools
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94373): https://lists.openembedded.org/g/openembedded-devel/message/94373
> Mute This Topic: https://lists.openembedded.org/mt/87751272/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

