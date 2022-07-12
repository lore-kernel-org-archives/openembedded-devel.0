Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29522C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 08:05:08 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.6677.1657613105608576887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c2BPAp6B;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id m10so798519qvu.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=laZ61hZ44+XQ8HOAUagtLWdLMO/3v1IOIcTL2DJ304U=;
        b=c2BPAp6BaAp6vVZUGwteVu0YfrDBFoG/HZWZt+Snio2sQat2V36R7Gxj3AMww+vFlU
         ypiGeLS9VnrNgOhveSZyW9EnllE5OdibH7XTtKcoTY902ICdQ55+19XlDNXBpT/QgCf/
         9e2KfE7wi/Sis9OmsgllQ8X3UAEDONRyOQfcg55HFtVIw6w0n790Ok/fvYxBVNp2hXNV
         iWhrYT47vB+mkDLlFwgDnlUptR3/+tZR1AuEoaTJeBnYj7RMAiw00TmsmF0iKcQTCMBm
         BSXSVoI/l0RHYU0AKlFKV2n/SkJ+89LyD0mU67eE6AOl1b1iV/wpop7jRRiFhUg2T/rC
         Co1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=laZ61hZ44+XQ8HOAUagtLWdLMO/3v1IOIcTL2DJ304U=;
        b=GCaDAkDNf2Q68ED6VLgrT4JSie4ZKA+6h+xoFyq6jTN7qmU8Ql4OlE0oBjyLeIyJ3f
         Ks2EBr1eQfAZuNV22NuQiqqarw/WiPMpSYJIwspeN7dmciL/fyviRF2mvNz2eCkyReKU
         qtnDFvnQ/Sl9oJ2WucHOa3Q/w2xLRzEUMp9vktzhVf1V2A5Q+yuXkfe2LolOoPYGbWJi
         m6zGwg19hmpuZ5k4WQTdjPiW1R7YAYYnAO2UvgunY0oevPABH28W7kCgT4wwT8QPtbuM
         nomxzzDuxbJ1mTRRxuhSsHJSXFa28bPBMHbD1xmJ2ztZE5FkfD3JJuMlZ1SdoSxAs7AJ
         D2Ow==
X-Gm-Message-State: AJIora96BUvEerj4Xer6JE0ci6FdmYLqGzc9iaHgL1g/laT/4Bwvi7J8
	BREVo4Xqc+KYsMm8H6xknUh3ltw6gi9I/xnqasc=
X-Google-Smtp-Source: 
 AGRyM1vBAJHcDvvyJ+gaAXrE8oCkDJDij46aIkdWIenpGnMgdsdawJO8lMPm4rwwuYlEDs0SerTBdvRiUAi1JOhTc/A=
X-Received: by 2002:ad4:5bea:0:b0:473:301:3859 with SMTP id
 k10-20020ad45bea000000b0047303013859mr16169257qvc.16.1657613104594; Tue, 12
 Jul 2022 01:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
 <1657529116-24181-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1657529116-24181-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2022 09:04:38 +0100
Message-ID: 
 <CAMKF1sokmjDiwFTPYqhg72=64DnwCRpYTh-y0W3n=POTAtRqUA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libraw: upgrade 0.20.2 -> 0.21
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Jul 2022 08:05:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97813

gegl is failing with this version of libraw

https://errors.yoctoproject.org/Errors/Details/660094/

I think you need to fix gegl with something like this

https://discuss.pixls.us/t/preliminary-libraw-support-call-for-testing/27676/3

On Mon, Jul 11, 2022 at 9:49 AM wangmy <wangmy@fujitsu.com> wrote:
>
> License-Update: Copyright year updated to 2021.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libraw/{libraw_0.20.2.bb => libraw_0.21.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libraw/{libraw_0.20.2.bb => libraw_0.21.bb} (63%)
>
> diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.bb
> similarity index 63%
> rename from meta-oe/recipes-support/libraw/libraw_0.20.2.bb
> rename to meta-oe/recipes-support/libraw/libraw_0.21.bb
> index 1940864a2..997f7ad44 100644
> --- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
> +++ b/meta-oe/recipes-support/libraw/libraw_0.21.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "raw image decoder"
>  LICENSE = "LGPL-2.1-only | CDDL-1.0"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=74c9dffdc42805f9c0de2f97df6031fc"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
>
>  SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https"
> -SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
> +SRCREV = "9b946d94bd65d744538926c2b12957864e187b9b"
>  S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97807): https://lists.openembedded.org/g/openembedded-devel/message/97807
> Mute This Topic: https://lists.openembedded.org/mt/92305778/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

