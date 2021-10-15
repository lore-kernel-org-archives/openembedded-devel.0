Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EE9C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 12:59:46 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.8912.1634302784836613925
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 05:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CWiw+BHo;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id r15so8365433qkp.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzdUWeBLR1mGRGJApcHipq+LXYf9zVZqwQzaxSBMSCk=;
        b=CWiw+BHocbyWJ64uKjfzna80G8O1edQBRBjxEMFxp3Cw62bDrW+ZRm99tCdxAaWmyH
         lE/EsLNuBy5Bt+Rac+CqDv7sNtAExI9HFS/431B0u4mYJEI3Ff+H34hfIJ9wJSyBvtqW
         zvQ+8SRwr7E+c+z082nB95APHpCyGLegnvuBS5YFivCiuzPxI3oxvKT+MNiOQ0EVZrNE
         v78P0P0S98Up1rVT2SKUGJrrMhuPhAhslS4M6VXHrVNFJRSEq7mLIB7tNgAchSUiVwIL
         pFDI8YiNNoyUrVaqxou9gKEfZHZ/oyg53usr99d0on1c6Ox8OvLpjXOb0ow9cO0knBHP
         qxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzdUWeBLR1mGRGJApcHipq+LXYf9zVZqwQzaxSBMSCk=;
        b=TaBDnLMJ0xS4SR013CZzX31/gUmoS7cFbm8Gr+nto/pBHf5DRltOyF1DdV5D0WM800
         MciiEKMOfMVTnvZazqst8vyi9fQP/tWqr50ONEbaJ6JsvZrbiKGbuyUV4ujsHGW6TKnH
         1y0Ez7xmcVlLAMwqlwGWNS50wWPkGV3JGTOHoBOk7p3cjwUnIJSTZ8gSqzWyeWubxT3q
         f7BTL9czz/Lh5bEUj2BY7TqXaqKVUF5p5AFcyific/Fl8lu6mrJlUXl1ALKms4TSEK1v
         Svw/kbEr/RVPTc/EICm8L94O79JvM+RcthkxSQQVdj8Eio2OUsQ8r2YeNr7UrKZUuSuQ
         67jQ==
X-Gm-Message-State: AOAM533zpptzus+di81iL5bQEVpQPMzXWgeKCEAP+ELK5dNad/WGD5GV
	UslBO758/NCMKreI/Bka6JG0rV7jA+o7oPqMcUg=
X-Google-Smtp-Source: 
 ABdhPJzwY2lh79Hq3HW9Ryv1gFUxYD26/Bnj+4AA/J/zH+J5oUAoSlW7RsH6kEID6LFFmz/w6AGp6X42lomH4p7PIyg=
X-Received: by 2002:a37:9ec7:: with SMTP id
 h190mr9624075qke.105.1634302783930;
 Fri, 15 Oct 2021 05:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211014133214.2548068-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211014133214.2548068-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Oct 2021 05:59:17 -0700
Message-ID: 
 <CAMKF1sp0oja8JmGhKPJQq2cZir-KhCx2UjaMGXU5hf4ve4bFaw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iwd: update to 1.18
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 12:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93324

fails on musl

https://errors.yoctoproject.org/Errors/Details/612213/

On Thu, Oct 14, 2021 at 6:32 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Changelog:
> - Add support for Access Point FILS IP Address Assignment IE.
> - Add support for P2P GO-side 4-way handshake IP allocation.
> - Add support for forcing SAE group 19 if BSS requires it.
> - Fix issue with handling faulty SAE duplicate commits.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta-oe/recipes-connectivity/iwd/{iwd_1.17.bb => iwd_1.18.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.17.bb => iwd_1.18.bb} (94%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
> similarity index 94%
> rename from meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
> index 00d94f36e..8d58a7a84 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.17.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.18.bb
> @@ -8,7 +8,7 @@ DEPENDS = "ell"
>  SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
>             file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
>            "
> -SRC_URI[sha256sum] = "6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7"
> +SRC_URI[sha256sum] = "0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55"
>
>  inherit autotools manpages pkgconfig python3native systemd
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93295): https://lists.openembedded.org/g/openembedded-devel/message/93295
> Mute This Topic: https://lists.openembedded.org/mt/86312421/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

