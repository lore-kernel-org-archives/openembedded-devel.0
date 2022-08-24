Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E8BC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 02:10:49 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web12.6511.1661307045335174212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aYerIg3m;
 spf=pass (domain: gmail.com, ip: 209.85.128.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-32a09b909f6so426274437b3.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aUSx4q50X/ybdqV9wn5eBAW+AjHSiWfU/RliYsuUMEo=;
        b=aYerIg3m3xn+LjMvJCaQABbW385chjhhGBFTsLJ9PZ8HSN5sVhrMZAKotGftp5Xv3V
         uFreqJTkEQDW9mHFsSMs2bshEU7oSsUp9w+F4TYMRLxZy74KglbrfB/9X0lsmBleuaKV
         qf25XZqCDBG7by7yu3ZE/qvEhqYmkRjuRxUMy83X6HlDwlnlkosLOsyam1pV5QcQeLM3
         LZbtcxIbKOTBaX586xrww3MbdwOMzcsRH1Z4ClDzgaEOPxPrzRRzXvFmvosXYDDB/SFD
         lhOjRGsmLzL5VA14taTIOTbAvghYTfmtmZGD/ECpJ5gNmC8y5c/tWl7CrhNFVH0jFxKt
         JrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aUSx4q50X/ybdqV9wn5eBAW+AjHSiWfU/RliYsuUMEo=;
        b=gNJB9mI/9ATCRKqr5hf3Y9NNiIqFVX0hVkETpLwKC76TI92lJyUSmGGiUqE2lWAKMF
         UYJXAvahQ9haKEcV1/sVVZkyrIW0rp2f9HPtYU1w1XFAo12tgmcQoiLwh+lpujhNDrd9
         jBN4KDTK/UGF0g7PCE2X78uD2N1tioYZx0BrCeQ5xl4uHfV4DOIojHZyQsVEhKmDxl+Q
         xJkrSR5DTqHIXBfnzCVCKY3IefsyII1DdGQXIqppyaiq2GMkZ5JPZtDag3+1RCgAwNTX
         og9IvxyWVUJQOPI75LKEnI9q1DP79LgMJCtRcIBqrrwT0ghW1Hj+mNKZlg1xZnadAUhy
         39xQ==
X-Gm-Message-State: ACgBeo0F/tpjP+8ssnn+REEfkwWTVTazG7r8ZdM2MtLXXatGml+kxVRy
	qrxqhLVB9zFOQRzBgqyYJIfVXmgS4OZF2q/FHpriMgUjqLVspw==
X-Google-Smtp-Source: 
 AA6agR6IITDulw+9ZdCH6gR/s5ha2FlSljaoMDMkdkLYbUWDv5zpT9dC+TBws93F2O8+Y8l453Ep/SILvMpMLzsL3E8=
X-Received: by 2002:a5b:107:0:b0:67c:4077:17f0 with SMTP id
 7-20020a5b0107000000b0067c407717f0mr24563272ybx.363.1661307043675; Tue, 23
 Aug 2022 19:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
 <1661243978-4657-2-git-send-email-wangmy@fujitsu.com>
 <CAMKF1spD_9M0icztJK3KK6wumon+4rH36OZhR_XMzO6AdkvJHQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spD_9M0icztJK3KK6wumon+4rH36OZhR_XMzO6AdkvJHQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Aug 2022 19:10:17 -0700
Message-ID: 
 <CAMKF1srd2RcJGez4=cMic2aufhDu0WAeD-QEe=aDqd5-2_mmYA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libbpf: upgrade 0.8.0 -> 1.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 02:10:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98415

https://errors.yoctoproject.org/Errors/Details/669388/

On Tue, Aug 23, 2022 at 7:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This does cause issues on musl
>
> https://errors.yoctoproject.org/Errors/Details/669389/
> https://errors.yoctoproject.org/Errors/Details/669389/
>
> On Tue, Aug 23, 2022 at 1:40 AM wangmy <wangmy@fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.0.bb}  | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.0.bb} (92%)
> >
> > diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
> > similarity index 92%
> > rename from meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
> > rename to meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
> > index 76fd862142..b6ec9f77bc 100644
> > --- a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
> > +++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
> >  DEPENDS = "zlib elfutils"
> >
> >  SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
> > -SRCREV = "86eb09863c1c0177e99c2c703092042d3cdba910"
> > +SRCREV = "a0325403afa8a3eca0d3a3e43f43784dc6b47511"
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#98382): https://lists.openembedded.org/g/openembedded-devel/message/98382
> > Mute This Topic: https://lists.openembedded.org/mt/93200193/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

