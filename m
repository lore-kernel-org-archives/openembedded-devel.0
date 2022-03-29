Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5670C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 15:18:51 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.8009.1648567130323246085
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 08:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O5XlrZLU;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id k125so14310569qkf.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rkrUB6y6uJSboOFofq9Ye1ECXKTSwDFD8lK1Glo5WbA=;
        b=O5XlrZLUOOox/GxupoIx6Ryc0ChMtUp8J7WnLO+AyKUJfC14ivItJX/5lg7Hh/X3EE
         sliFNT0b0ukxVCKxoxg93hGD0hUzdNy71LX2m3q73+91a8HYu69nXymG5XijO4eH4157
         E8P/BvPILkG/SC2CXPrToV2OWN78ykf9eDV12kpnieVui/AJIlBS71zxNw3CQ0wYk0yJ
         HjJG8XTlVwykKkj46O8pujFzTxX23k2puyN5BiKTe01yZZhVoODvtCXrE/i5ncvk6T0p
         j7tH04M8zbn9qo8tJVZPgJeDxqRAOSNasqGSXuvPO+KROJtYg3nn4fUaEPyBgG5rnp+C
         UYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rkrUB6y6uJSboOFofq9Ye1ECXKTSwDFD8lK1Glo5WbA=;
        b=b3H8kNFFD+NMuE6KdQU3Z7BazrIgPVgXS6RBeSPVocRuMtKUGX4Im0dSiAwthtoICZ
         AaHDv4bvMV2sTgYvHPFIiwp0MxdlGsn4ySHQGtMc+77rqZ5QBHLF8DCCFgUud9+T5nA+
         2YY1k8GZB7Z++4v6YrTrtsJMY4hEjGAo+yA/3HiBYSpkC2mRuUGZZ3Uxi3psc9Jrj9KW
         7+UzvhPt55xahBfP3JgK2BvIQXVshtoqpvynCa9ySmuUozC1T7Ou2/wfjfH9EW6SL9MO
         z5O5rSv9Jc/Uip/Be/aKhFIndt5hpBHayyvOlcV9BmFK/jg4wbTvChHshtPOOpW+ok9H
         l7cg==
X-Gm-Message-State: AOAM532xYEjDOEITlCWoKsSeOS697pDTz2fA1XNm7LBkn6Od7DC1xiLW
	hBXAcfL4I89mS2Gi/UWgYr/5I+8Yt/SdGrSXLz4=
X-Google-Smtp-Source: 
 ABdhPJyh54UxLGWjQsfje7v0M2iOJKwMX8+DpOjUK212M6ZkYSqGIL9Mxk3wNAPVTKgp+V6OpEWf937BdcBXB49dEss=
X-Received: by 2002:a05:620a:460e:b0:680:9d1c:2493 with SMTP id
 br14-20020a05620a460e00b006809d1c2493mr20376908qkb.227.1648567129317; Tue, 29
 Mar 2022 08:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220329024856.27349-1-potin.lai@quantatw.com>
 <20220329024856.27349-3-potin.lai@quantatw.com>
In-Reply-To: <20220329024856.27349-3-potin.lai@quantatw.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Mar 2022 08:18:23 -0700
Message-ID: 
 <CAMKF1sorUgWdWj6iqNDtHip1OSx1JPSVKbGWD4TqHrc4aUzP6w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libirecovery: add recipe
To: Potin Lai <potin.lai@quantatw.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 15:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96261

this fails for mips with

undefined reference to `bswap64'

https://errors.yoctoproject.org/Errors/Details/653670/

On Mon, Mar 28, 2022 at 7:49 PM Potin Lai <potin.lai@quantatw.com> wrote:
>
> libirecovery is a cross-platform library which implements communication
> to iBoot/iBSS found on Apple's iOS devices via USB.
>
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  .../libirecovery/libirecovery_git.bb              | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
> new file mode 100644
> index 000000000..30c633caf
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "The libirecovery library allows communication with iBoot/iBSS of iOS devices via USB"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6 \
> +"
> +
> +HOMEPAGE = "http://www.libimobiledevice.org/"
> +
> +DEPENDS = "libimobiledevice-glue libusb1"
> +
> +SRCREV = "e19094594552b7bed60418ffe6f46f455e6bb78f"
> +SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +inherit autotools pkgconfig
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96249): https://lists.openembedded.org/g/openembedded-devel/message/96249
> Mute This Topic: https://lists.openembedded.org/mt/90101059/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

