Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5426FA3742
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 11:41:57 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.18327.1666611708957089756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Oct 2022 04:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q0KN9SUn;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a13so30214855edj.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nCxiia66Nqk/3QC89Ay5TNzUp343VRpN4+9qnIH0qwY=;
        b=Q0KN9SUnahP7QSU3lKYpZWu0jYcdtTq1+MyOStD0j60rsK/NLxNmKb8JYFJdm29yiY
         XhNPCbXdtgubSTTp2fTEByeNy6NpPJtAaAWpDWTcipvk0APr+bp/795dnH9VcyNGlW0u
         MLB4ZTiAtLlQ6vugtTaS6nh+LYOnHIa+7ylkZwNTDD8MC+G4/TT+W0uhvknPDxQGmEeV
         zLFar5h7vhMNfn/Xo4zUcbmGg9v13BHtGZRiyPDEEKoNcCz2+ZIoF/XpUF1pwPkT2pYi
         FLeghzKhFaeVruJ4qzhFiHFJuNMB71A+71hOsubHtqWEQ0ZZ/ZSalKyuBru8zKqiYd+H
         Wheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCxiia66Nqk/3QC89Ay5TNzUp343VRpN4+9qnIH0qwY=;
        b=a1BhfL6tVTabqBAB3k92+c018gMk601LV8X4eEuUGYcSyBj61xB3EkSZHgyhxj56NA
         Ua6ohUp17CGXXqIO6bdv2PnVJllnarzMK3OLOSzKtoG0bL9fqyCizt1UrveVNF9b0lGN
         FY1niy+RxMINHxBpBcZKt7qsMQgqq1tX51APw/1Xf451XtKTCYclpaUg5aicm4tOeGDW
         Z9G6mAry6F9FbfzlLddiZIdFnD+ZzW1IifP8Gn6kcIqzrrZBli9TRs4tQ/hLsMyJYqwu
         k76z8yWYBt1EmfvWxllBlAY4/HQRVGPzo5tXnYZ1yESe/3Oz21DFSKQdnFI791D7OCQF
         qTyQ==
X-Gm-Message-State: ACrzQf3b78Az6sGOoGARY3C+f5E+R1koSoiZz5W+ZrXPmY9DbzqW2PrN
	S5EygGUN86trtNYqPBPlXnzvvhWqbTVH8REJCLg=
X-Google-Smtp-Source: AMsMyM4+/W2Xzm4KEVqLyAfV5fV23ihhwtK6MYCqTyibsVwkY9+aKxfdZQc5ixd368l8PxWzzYlQIBzsxgRdSDD7Isw=
X-Received: by 2002:a50:ccc2:0:b0:460:4db2:5006 with SMTP id
 b2-20020a50ccc2000000b004604db25006mr21296415edj.369.1666611707205; Mon, 24
 Oct 2022 04:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221021165738.1803166-1-raj.khem@gmail.com>
In-Reply-To: <20221021165738.1803166-1-raj.khem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 24 Oct 2022 13:41:35 +0200
Message-ID: <CAJiuCce5syr+YSZQ7n0_0uZdFD0+=XzKmVGUJd-2Nny9ZqLR5A@mail.gmail.com>
Subject: Re: [oe] [PATCH] protobuf: Enable protoc binary in nativesdk
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 11:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99297

Hi Khem,

On Fri, 21 Oct 2022 at 18:57, Khem Raj <raj.khem@gmail.com> wrote:
>
> When it was disabled for target, it was enabled for native but not for
> nativesdk explicitly, lets do it here.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I sent something similar 3 weeks ago:
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg84850.html

Just to be sure, is my submission format okay?

BR,
Clement

> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> index 0bc9cbedc0..c8b9158e6c 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> @@ -26,6 +26,7 @@ inherit cmake pkgconfig ptest
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG:class-native ?= "compiler"
> +PACKAGECONFIG:class-nativesdk ?= "compiler"
>  PACKAGECONFIG[python] = ",,"
>  PACKAGECONFIG[compiler] = "-Dprotobuf_BUILD_PROTOC_BINARIES=ON,-Dprotobuf_BUILD_PROTOC_BINARIES=OFF"
>
> --
> 2.38.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99255): https://lists.openembedded.org/g/openembedded-devel/message/99255
> Mute This Topic: https://lists.openembedded.org/mt/94480264/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

