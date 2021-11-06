Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17177C433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 01:20:28 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.14271.1636161627185722718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 18:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KxlyNSri;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id b15so19508690edd.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 18:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0jyhu01rIjC96lmrRblZkX/aYAs4hT9oQ9vjko6HveM=;
        b=KxlyNSrivpTDxlcu3RrM81IBW6+/jXhFTn0Huajp6Er058QWr8+xh+zkRxGw9n9JyZ
         4CUqwQeJ3le0/gXq2oeDzJLriyRFQ/hgxDA6+8X0J4MkwBqQHPQBQAC06hE7yQV2IwfS
         nWG0rTNrYKMLnuTqQ5+jR+XH9Q8kT3JAzC8mm9g8IuQ2Fe36qo6ZisXzZ2b7Jf0SjE5i
         zoCxxzEu7HwvGzzX4r/+/y+yM2c+xNWEPj/blKgMFtEdyfTqBsCGwDa7tH4qej7nHjNr
         +JSyDNUXKHeRSe75ghIGB1raD/aJSrRynUtaUEwv9QYUWPbJy0IPE6GT3kYJHyd9t7YO
         4g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0jyhu01rIjC96lmrRblZkX/aYAs4hT9oQ9vjko6HveM=;
        b=DxNhCIOFxojbdfw8fUEWrEM6K5cL758F+OhVJw1+FUFdKrF8PefJEvQgtCcx7mNhuz
         sK08Vr0F4ceSEZg48BYTjUpd8gi2aHVfkioVcrNvu4Rmeie3XvnHV67AZYdurVCzN/YF
         mHMVbzTNrmTbkXkbHS8Uf3F6k5Db155RJVc5pDTy6IvSxsO18B0v0BpYVLiWCHk5g28/
         ZNLs5+roCUhwPtFhaEwAoGg5CdjIp6KY1n4VhqGhQmFvhAVdZ6Q0HctWrZNS5oqPBpfe
         EZDHmEDiLU2V2QcBQDTU+Gg5DdTSAxx7dbBYXCooVRfhK9pDRgmQGZC1eknnRDR23ziD
         SzvQ==
X-Gm-Message-State: AOAM532TcAzYL6IqiKySncl7GPuhub7tYHhrBfNQtqKSApW30MURLUhQ
	WfMDIBUc1u3SqL0GVTuGDH02DCMvFU9woMpJcLvrr8jTZhI=
X-Google-Smtp-Source: 
 ABdhPJxIhiFCxlD2vu0A1HgLEiGE38d4ZCrTO+dDO5A158zq2Kth4t5j21G/+j6/Y/EJ3NTzR476iF7X0h+CjGKOzXE=
X-Received: by 2002:a05:6402:d0e:: with SMTP id
 eb14mr22598317edb.59.1636161625359;
 Fri, 05 Nov 2021 18:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211105202432.1769846-1-raj.khem@gmail.com>
In-Reply-To: <20211105202432.1769846-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Nov 2021 21:20:14 -0400
Message-ID: 
 <CADkTA4Ohu6WibgqHCHg5OL1VYS=MeKOW66vp3tHUExKEqLROfA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] mctp: Fix build with 5.15+ kernel
 headers
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 01:20:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93852

On Fri, Nov 5, 2021 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>

Looks good to me, and it fixed the build for me as well.

Bruce

> ---
>  .../0001-build-Adjust-for-kernel-mctp.h.patch | 84 +++++++++++++++++++
>  .../recipes-support/mctp/mctp_git.bb          |  8 +-
>  2 files changed, 90 insertions(+), 2 deletions(-)
>  create mode 100644 meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch
>
> diff --git a/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch b/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch
> new file mode 100644
> index 0000000000..83bf197703
> --- /dev/null
> +++ b/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch
> @@ -0,0 +1,84 @@
> +From 653eccc918ef993186c312694c288b2a5b39248e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 5 Nov 2021 13:14:55 -0700
> +Subject: [PATCH] build: Adjust for kernel mctp.h
> +
> +Starting 5.15 kernel has mctp.h as well and provides some of the
> +defintions, therefore move the ones we need to provide in this header
> +outside the conditional check so its always provided regardless of
> +header coming from kernel or not.
> +
> +Include linux/if_link.h so it can pre-define IFLA_MCTP_UNSPEC and other
> +defines and there is a check for conditionally providing them here but
> +kernel does not have such a check, so if linux/if_link.h is included
> +after this header then we end up with duplicate defines
> +
> +linux/if_link.h:1267:2: error: redefinition of enumerator 'IFLA_MCTP_UNSPEC'
> +        IFLA_MCTP_UNSPEC,
> +        ^
> +../git/src/mctp.h:74:2: note: previous definition is here
> +        IFLA_MCTP_UNSPEC,
> +        ^
> +
> +Upstream-Status: Submitted [https://github.com/CodeConstruct/mctp/pull/2]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/mctp.h | 21 +++++++++++----------
> + 1 file changed, 11 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/mctp.h b/src/mctp.h
> +index 4f73def..e602168 100644
> +--- a/src/mctp.h
> ++++ b/src/mctp.h
> +@@ -19,6 +19,7 @@
> + #if HAVE_LINUX_MCTP_H
> + #include <linux/mctp.h>
> + #endif
> ++#include <linux/if_link.h>
> +
> + #ifndef AF_MCTP
> + #define AF_MCTP 45
> +@@ -33,10 +34,6 @@
> +
> + #ifndef MCTP_NET_ANY
> +
> +-#ifndef MAX_ADDR_LEN
> +-#define MAX_ADDR_LEN 32
> +-#endif
> +-
> + typedef uint8_t                       mctp_eid_t;
> +
> + struct mctp_addr {
> +@@ -53,6 +50,16 @@ struct sockaddr_mctp {
> +       uint8_t                 __smctp_pad1;
> + };
> +
> ++#define MCTP_NET_ANY 0
> ++#define MCTP_ADDR_ANY 0xff
> ++#define MCTP_TAG_OWNER 0x08
> ++
> ++#endif /* MCTP_NET_ANY */
> ++
> ++#ifndef MAX_ADDR_LEN
> ++#define MAX_ADDR_LEN 32
> ++#endif
> ++
> + struct sockaddr_mctp_ext {
> +       struct sockaddr_mctp    smctp_base;
> +       int                     smctp_ifindex;
> +@@ -61,12 +68,6 @@ struct sockaddr_mctp_ext {
> +       unsigned char           smctp_haddr[MAX_ADDR_LEN];
> + };
> +
> +-#define MCTP_NET_ANY 0
> +-#define MCTP_ADDR_ANY 0xff
> +-#define MCTP_TAG_OWNER 0x08
> +-
> +-#endif /* MCTP_NET_ANY */
> +-
> + #ifndef IFLA_MCTP_MAX
> +
> + /* From if_link.h */
> +--
> +2.33.1
> +
> diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_git.bb
> index ebfa84d893..50d84d204d 100644
> --- a/meta-networking/recipes-support/mctp/mctp_git.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_git.bb
> @@ -5,9 +5,13 @@ LICENSE = "GPLv2"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
>
> -SRCREV = "a8658290b7914f67146a982671b09f2270ba1654"
> +PV = "0.1+git${SRCPV}"
>
> -SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
> +SRCREV = "072bafe725c50329f99cf9d3b2624e8799e8163a"
> +
> +SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https \
> +           file://0001-build-Adjust-for-kernel-mctp.h.patch \
> +          "
>
>  S = "${WORKDIR}/git"
>
> --
> 2.33.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

