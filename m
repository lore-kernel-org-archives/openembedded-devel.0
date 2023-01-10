Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE276C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 06:23:23 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.97898.1673331793809760194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 22:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cleEfFQB;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-15085b8a2f7so11220893fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 22:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CzCR6TjBg8pKT5CkdeYIrCvaC36xUIRVK+a/Cmj9edc=;
        b=cleEfFQB8juiuzY1ES+hr50e1jcFrYX6LZvtEwcy8d+rrXpRrKNGZQ7us3h+cplrNg
         dkhOBhkWKQQUICsHL2PASPNThkMbCj4Arxcco2KKzkb962AAZGVVrRXfP1q9VnJGHi0X
         3UytRoY7SiOzvTRVpl080GO1sLC4zR/vY9Nxh7TYUUmdC+ZY61/HWNGTurZsaisiFNFj
         +cXA3lYeeQOvlR/csNIm6KM6//IQoqLmVEDHyFisLwsCCb7Hiwg8GG6V7JQpYjwH/yA4
         uX2PRPx3dLC5Jgv6vGy+ig1uTmd3Rw7JKv1XvLRbsbrNhM/vnuE7r4bmyzdGpHo8aWet
         66lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzCR6TjBg8pKT5CkdeYIrCvaC36xUIRVK+a/Cmj9edc=;
        b=P43nKGY8wQIgmgucb/Oc1nO7CiJaKM5grKRoxM8Svlse6Hp8b3577qtZTkPdv/Ftn+
         ouzbZVNuYU4m4Wewq+VBQrPKtT81OpM16bYd0ILyLH08F/o2zcaf6YRMJxWGmnUY0aik
         L9QJ66G22O+r00peTOGxdwgMWATQh6w0SLbJMSSrexQn0kxmY0B9fonhvOiy4XHfP8m5
         peyLCImtwTMo+FRyWqzDKXdUr7NsJsOVk6WlheLZ9RC1F6RHnZtDS8K2p8XW+WhXZ4WF
         H9RxoVwKeqVJX+TgR1r2YOBK4qQW57Jp+D+M5pT1nFrQQ+puNxtiZEn3GPooHko1Y8xO
         R0jw==
X-Gm-Message-State: AFqh2kqrKEf2mX4fCR1rvCgwHJzvDKo/mZyi3D4iH5vzQbYs4jqivu7q
	a1wn7baq/Ha9alU9Rr2LrVwqJkmGdVFmeEaZiQfXsYGeLrm8Ig==
X-Google-Smtp-Source: AMrXdXug7rYnKMBrJ/OGI3gIG1u1sLuGY8JJ3rZtIKQTEg5ruW/YglFktsAaj2nHeiWaHPqDh8UpqlRqXOe3axaFkVk=
X-Received: by 2002:a05:6871:4049:b0:150:ab7d:7012 with SMTP id
 ky9-20020a056871404900b00150ab7d7012mr1927483oab.55.1673331792928; Mon, 09
 Jan 2023 22:23:12 -0800 (PST)
MIME-Version: 1.0
References: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com> <1673329158-5189-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1673329158-5189-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2023 22:22:47 -0800
Message-ID: <CAMKF1sodXKUTOxjFxm_pGucfX933Z38XKmu5LZPN2VDXL=cv4g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] hidapi: upgrade 0.12.0 -> 0.13.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 06:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100509

On Mon, Jan 9, 2023 at 9:39 PM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/hidapi/hidapi_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> index 4aa58ec7f..812a07da3 100644
> --- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
> +++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
> @@ -12,6 +12,6 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
>  inherit autotools pkgconfig
>
>  SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
> -PV = "0.12.0"
> -SRCREV = "76108294092c023a4ece99eb3219559cea0d5066"
> +PV = "0.13.0"

Drop setting PV here instead rename the recipe hidapi_git.bb -> hidapi_0.13.0.bb

> +SRCREV = "c3a6150d8801f79a59034045275176e9738b13e4"
>  S = "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100501): https://lists.openembedded.org/g/openembedded-devel/message/100501
> Mute This Topic: https://lists.openembedded.org/mt/96171760/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

