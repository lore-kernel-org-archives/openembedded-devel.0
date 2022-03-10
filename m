Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12328C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 09:31:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.7518.1646904668843290115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 01:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=LHibQWf+;
 spf=pass (domain: burtonini.com, ip: 209.85.128.45,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f45.google.com with SMTP id l10so2885658wmb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 01:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XV4BKkNr2mJfxu0u0Xu6mqeq2CJlykAq39Yg+jgLN6U=;
        b=LHibQWf+Fltdmc2Ab1CKSv7gGmUxNrQRwL56DGcNW3b6LnSrsg82RFh866/uYq6r3r
         4rqS6EI2VLXGWt893Ec0uLFUCS5arRfw6ZeMVYslZ+tgGNyHRz4nNQ4TOCKqEeOyvuU1
         GCnNqlT9WmojrBQ5qSvtDo5r18Yylkm/Sa+9mtheIYtDEfdC+T/mizlsDtSVrVncJBSW
         tk/BgECLOtXkacmIlLCeypz9Rh3tdEpR5jJ0AJHYRdXzK+UTFIYF8A9jAd6N7cmikV9a
         Yq51v99+pKE4fNUDlzju3yG+l9PxK8BLUgyVn84PjxCpAZghGS4oP2mQAbeRhoC3Va37
         FnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XV4BKkNr2mJfxu0u0Xu6mqeq2CJlykAq39Yg+jgLN6U=;
        b=xYsgRPwyO1miIuZs8eZD8a731zAzJj531qCkpgJNroJ92xnRy2m8sLJA/mVfCNPVyR
         1a++zfw6y4V+KkOvwdTlsToLVbG5Tj/h4VZvJfkNLKeaYGaWOVfwUsEGGXEqpqDNV+Bq
         +9PbJtyH4YgoqhDR1/q8BTJbCl0aKvfITbj7d7DK2d3nqv47dbiWqupFv8MDl1GknUX1
         zYUq6fwMBIHqpVzlz//jdzQbU6rimXGockxAeM63S9LxWdd88pHOJVmLDnU7aZ7GDKrw
         GSWTCdOeS/miwVcOZDp6ceKAbXIIbd4HaamWU8kvHYuAa7/S3HqMiKTDepIouqlBDr+c
         7/lw==
X-Gm-Message-State: AOAM532JxnVdVUhyJUbmSaJWzJPqrtEkgLCAFg+qVKO83OlfXhigWAr8
	3CprlVZrxPRZLwtlaUNtNGCJtIrJV0WcqPT7AFTznQ==
X-Google-Smtp-Source: 
 ABdhPJySuDegDUi416lRXN7RJMDH//d037sWA43Ycyr68z7Wd5eTTw78AfwZkL3b5aW+yhLzZnf+nPQb5aUh3yUCI6k=
X-Received: by 2002:a1c:2b41:0:b0:380:e379:b8b0 with SMTP id
 r62-20020a1c2b41000000b00380e379b8b0mr2779383wmr.87.1646904666907; Thu, 10
 Mar 2022 01:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20220309190543.664728-1-raj.khem@gmail.com>
 <20220309190543.664728-2-raj.khem@gmail.com>
In-Reply-To: <20220309190543.664728-2-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Mar 2022 09:30:55 +0000
Message-ID: 
 <CAAnfSTsww2=Oov01mJR4JhvmVq9WC+Wz9=RFyUn3iZbR+Yq2bQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 2/2] catfish: Do not set PYPA_WHEEL
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 09:31:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95922

Ah, if those patches have landed I can send my patchbomb to meta-oe :)

Ross

On Wed, 9 Mar 2022 at 19:05, Khem Raj <raj.khem@gmail.com> wrote:
>
> OE-Core has addressed the pertaining issue which does not require
> setting this here anymore
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
> index 6aa5ae8c30..27a807be29 100644
> --- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
> +++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
> @@ -4,7 +4,6 @@ LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>
>  inherit xfce-app setuptools_build_meta gtk-icon-cache mime-xdg
> -PYPA_WHEEL = "${B}/dist/UNKNOWN-*-*.whl"
>
>  DEPENDS += "python3-distutils-extra-native"
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95911): https://lists.openembedded.org/g/openembedded-devel/message/95911
> Mute This Topic: https://lists.openembedded.org/mt/89669707/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

