Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F715C433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 01:18:58 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.14186.1636161537281377698
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 18:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aucovOMy;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id j21so38660026edt.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 18:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuN5r1d2YaPd8uZeR49ONEtZoMjxFZAcsvaYIDNRvLc=;
        b=aucovOMyAXVPVvO5AHvKKMNqtb4wsVqdZLVjoLLsIOGq3QY/WrnCaYtVMMsjwKkhm/
         Klfk0/lYorps5F+LV2KL+NKmz8H2zaVlh76NLRwG7rgDCINIqCGr8pUkUmQ0hCtMIvzG
         saeRcSPY3jkmE+/sU9XX/dlj3hRtZ72fQvHG8rrIjTR+12+4AUXIo8BpWAcUpyNpYjls
         PyRXhXRSPvxvSw6XVP16v1bibHyg1JgRcl6dNLXkUaLXOMNj3jwSHIr4TSK8th751MJs
         /vSod28oBYx6oce3y+TtAyyE3a2vSs/ohLDKfLniIbMNrPN4GTjhUk788jOUUley5Dn1
         EIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nuN5r1d2YaPd8uZeR49ONEtZoMjxFZAcsvaYIDNRvLc=;
        b=1kNJF4Bg6Zdn21DM+/p5db4fs1sAai57XG5Z2dvCDfhRPFN4nWO0fejM+YMkZfm8Ng
         KBBAfL45r99KzCl5/MqjuEpSmbawHmWD7ILpPFoRs31P9FoBei/85peL+LZPI7hbv469
         P8iCrewga37cK2yM+98fSayQRT5DvsXs9pMqSfLUjqM9gD+daiBWSper5Dblt7pauc9d
         +1EsHc6KvzL0H9qXm/r5dp9jAUxTdmFXCylaHEn7KNlV8drUMDvIsR0MYmk1n8vXtuGU
         7YImcRjgYX03VSfb+v7hC1+3P0o69fB1Ldm01npmmogaTvJAnxyolaUNSROi4nDZI5zi
         8yRA==
X-Gm-Message-State: AOAM531jpypSi107E2s8Dryr/P8NAmHm9KdIfKNP+BdzTKT1/zQGNap0
	8T3fLyL/lTQrEvGrGHJFkvKe3qp1k9yqivil1x4=
X-Google-Smtp-Source: 
 ABdhPJzRALzCn4CYBZHIVKpydHDUBvuf9qLYs+vla1vTJj/LiL+Run+l7VuIUUQZT4UGN4DhGXumrZ36+QUIr5tyuyc=
X-Received: by 2002:a17:906:48cd:: with SMTP id
 d13mr12192214ejt.35.1636161535383;
 Fri, 05 Nov 2021 18:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211105181720.1744827-1-raj.khem@gmail.com>
In-Reply-To: <20211105181720.1744827-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Nov 2021 21:18:44 -0400
Message-ID: 
 <CADkTA4NsZBs1RPkyU3TZVomEFFhXCakxtRNeFT1AWy-GrFPGFw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] sdbus-c++-libsystemd: Fix build with kernel
 5.15+
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 01:18:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93851

On Fri, Nov 5, 2021 at 2:17 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Backport a patch from upstream systemd
>

Acked! That's the same patch that I identified to fix the problem.

I was just being hit by a meson build error that I couldn't sort out.

But if this is building for you, all good!

Bruce

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...-linux-Sync-if_arp.h-with-Linux-5.14.patch | 29 +++++++++++++++++++
>  .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch
> new file mode 100644
> index 0000000000..a251e3e6c2
> --- /dev/null
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch
> @@ -0,0 +1,29 @@
> +From 4411a9a3ebff98b6fcf5967c75faa458d219df96 Mon Sep 17 00:00:00 2001
> +From: Chris Packham <chris.packham@alliedtelesis.co.nz>
> +Date: Fri, 10 Sep 2021 09:51:36 +1200
> +Subject: [PATCH] basic/linux: Sync if_arp.h with Linux 5.14
> +
> +ARPHRD_MCTP was added in 5.14. Sync if_arp.h to pick up the definition
> +
> +Fixes #20694
> +Upstream-Status: Backport [https://github.com/cpackham-atlnz/systemd/commit/67cd626399b0d02882ee00716c8bd31ba764c862]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/basic/linux/if_arp.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/basic/linux/if_arp.h b/src/basic/linux/if_arp.h
> +index c3cc5a9e5e..4783af9fe5 100644
> +--- a/src/basic/linux/if_arp.h
> ++++ b/src/basic/linux/if_arp.h
> +@@ -54,6 +54,7 @@
> + #define ARPHRD_X25    271             /* CCITT X.25                   */
> + #define ARPHRD_HWX25  272             /* Boards with X.25 in firmware */
> + #define ARPHRD_CAN    280             /* Controller Area Network      */
> ++#define ARPHRD_MCTP   290
> + #define ARPHRD_PPP    512
> + #define ARPHRD_CISCO  513             /* Cisco HDLC                   */
> + #define ARPHRD_HDLC   ARPHRD_CISCO
> +--
> +2.33.1
> +
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
> index a81b57526d..d50681d77b 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
> @@ -15,6 +15,7 @@ SRCBRANCH = "v243-stable"
>  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
>             file://static-libsystemd-pkgconfig.patch \
>             file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
> +           file://0001-basic-linux-Sync-if_arp.h-with-Linux-5.14.patch \
>             "
>
>  # patches needed by musl
> --
> 2.33.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

