Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4192AC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 13:38:00 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.7586.1635946678979518856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 06:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e/jF/zr1;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id b11so2961925qvm.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1yJhE5VJ5MRiVQC4UzKbLinSnEu4ZvcjBnCSLbF4sbw=;
        b=e/jF/zr1X7zI6woDfuHp3MowGs63juWu1576Jp/nX1Vrs3JHIQSE/S/MQ7fxq6ApZX
         M3EwBZB/WiH1XAtGqzNYZ0Net12Goxp1PWc2O524iiX/ho8Gl5nfBo/38eMv894loArP
         XybU3PajUiOqLVQE9/5xFJbsuepcWECIBjpcs5J1IrNzNk2N3ynoD5Avgg69+dtsJ5kR
         kZRMPldPOZD/W5fGtE6bvLMphRx0/ahLkA5/p1g0tzjLDuo7ta0GZ7GKwJTXBOVd+MBy
         NgVmwDQeDz63ZxcWAV1OD0TBvvxsbcVpm33Mnwztd6msqvIKrCGFmPmAk7Lg9sL0/qWi
         Ufug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1yJhE5VJ5MRiVQC4UzKbLinSnEu4ZvcjBnCSLbF4sbw=;
        b=J6YR6fjx45qyNpND/Xp/glZ7wARzfbCU34R+OVcnP4LypiM2N0gh86O5GBMhjP3py6
         mEJeJivxEXtZiMhjOsGiHO0ct+aJkGLbv4qCztrkVi8u1noJnRypHDVlg0X6FXJfcxeC
         rSAjxUGAmMHGuCR9cFLATXLAivRsnmiRCkDFnq76eCNx7xIFtfJB2E48SI/MPoHR1vT+
         8MSGWbsMHw7KOyeOq4DLxm0GkeeYqDq7yRpWgeoNBnhRXWhEOL/XmNdGJGg5ALDtZVFU
         AlKWVeExnLd8z9cfm6NtL+zFCJ+jdDK4/UII6ywkfgl99d/N72z0+KZxmPf/VZU/wcMb
         0XLA==
X-Gm-Message-State: AOAM530j1v+3k1pBT+XLI8oBE9zwyoVTazC3/XrG47nG3obr9Fr828gk
	RGizxUh7xPn41+lvqqhZFXr9mtUaGr9jKLQUpt8=
X-Google-Smtp-Source: 
 ABdhPJwFzrKYzV8f2UWWGoFdTOgYuJ/yIc4OPhoD3tV3t9pWbvN4MMYR0/p4i6SUXF4aKAHJxyFkxNvqHb098Khf89s=
X-Received: by 2002:a05:6214:29ef:: with SMTP id
 jv15mr42292137qvb.64.1635946677938;
 Wed, 03 Nov 2021 06:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211103083808.237835-1-Martin.Jansa@gmail.com>
In-Reply-To: <20211103083808.237835-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2021 06:37:31 -0700
Message-ID: 
 <CAMKF1soCrEjULMa8CtADBjTUpeg0MRBeHGpMSU0+aTUKzDPanw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] python3-prctl: add protocol=https in
 SRC_URI
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 13:38:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93809

I had a similar patch as well.

On Wed, Nov 3, 2021 at 1:38 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> * the missing space before \ defeats
>   openembedded-core/scripts/contrib/convert-srcuri.py
>   adjusting this automatically.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> index b87a470b40..4686fb620c 100644
> --- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> @@ -13,7 +13,7 @@ B = "${S}"
>  SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"
>  PV = "1.8.1+git${SRCPV}"
>
> -SRC_URI = "git://github.com/seveas/python-prctl;branch=main\
> +SRC_URI = "git://github.com/seveas/python-prctl;branch=main;protocol=https \
>             file://0001-support-cross-complication.patch \
>  "
>  inherit setuptools3 python3native
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93799): https://lists.openembedded.org/g/openembedded-devel/message/93799
> Mute This Topic: https://lists.openembedded.org/mt/86786622/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

