Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554B4C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:11:16 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.7872.1645495875081956966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 18:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jMZIeXuT;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id f19so37193318qvb.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 18:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bHBu7jZtgKoq2chHigfqDK4m9vauliDTWc62NxaOEw=;
        b=jMZIeXuTkTk6S4M+58jGqMG4eGSLZ0rghS4VbfJYIC444afrGvX4jubXicdZM1ZWfL
         q0YOwG/tC2Ju/eQVEUbvQvNzqbH5VOnJ/Y7Glyc8wHytiZD5GgVVqnikNPs2ZoBYVvC5
         j42+po62JUGtpLwaH1+eiBVCL6pE9GSDPs1wCnLc8BTF9Rbx2MgykTWL4jg84k8GmiML
         TmAa685AjWLROFJMFq0tt4UjRiP9BUqZAlK2Nm0PXcF5HDhr0r5n/CcJIiJDAeonnYIX
         flkVjYie6mxt0Fu2SiayIQW40v3M5Frw9P69RW7qzh2dPT2Yhx3JcRWybCPkSJ+Fgck2
         zOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bHBu7jZtgKoq2chHigfqDK4m9vauliDTWc62NxaOEw=;
        b=izJpnrNmtw6u0fBCFL4knS/+QUrwXvZPFOClAZMqpuZqcFnzMuSpZG6Oif77/WugCM
         f7Pe1KMtNJwlTt9i2lpGLbWBjqtaDw8d7+FxTt5T0MUk0fBvNiyDTAUMshdN7tCOpL+1
         3HrTmoRnkGz6xUNPXqASPUSuSv6VKvX8iC0gHNRaUoIOF5Rd4nk8PCnC0zn99X+vn9vg
         d9kUw9+zIC1lDxetLcZQRHRas3KhFgcwYYeZLPVZb3rCCSiUTaJpYCE/aBwxxaZWFIQF
         6Amhri8Ftgz02sA0SYar1f5RI/0sP4uqgUoXAMu0mSswVSp20esE6U/S4HEZM7HilOcU
         jh9A==
X-Gm-Message-State: AOAM530GcrCAUyTG8EL5GGu1o6nbaFlb7UFnSxALLRekrgggNKonqZ6C
	mt/PR+9foErYjV3FmZdb2CZQ50b+BY7XnHIv41c=
X-Google-Smtp-Source: 
 ABdhPJxZ4ee9nBE+d5XHIQGzgNqTIVdfRDpYY5kKwHt0JIM18kitGedtL55KxYnSAvZT3LGrmx296Q34RggH0NpK5dI=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr7030285qtc.54.1645495874085; Mon, 21 Feb
 2022 18:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20220221182012.2513597-1-f_l_k@t-online.de>
In-Reply-To: <20220221182012.2513597-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Feb 2022 18:10:48 -0800
Message-ID: 
 <CAMKF1soMv7n5_0qXH9T4ZR=QEpGFAWdwdfGERbSMTpCW356FsQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] libxfce4util: inherit vala
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 02:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95430

I am seeing libxfce4ui is failing in install task I wonder if it is
related these changes

see
https://errors.yoctoproject.org/Errors/Details/633079/

On Mon, Feb 21, 2022 at 10:20 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> This fixes do_configure error:
>
> | libxfce4util/Makefile.am:159: error: ENABLE_VAPIGEN does not appear in AM_CONDITIONAL
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> index 1a0b7183e..9462b28ac 100644
> --- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> @@ -4,6 +4,6 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
>  DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
>
> -inherit xfce gtk-doc gobject-introspection
> +inherit xfce gtk-doc gobject-introspection vala
>
>  SRC_URI[sha256sum] = "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743f55abd87d8b55b83"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95423): https://lists.openembedded.org/g/openembedded-devel/message/95423
> Mute This Topic: https://lists.openembedded.org/mt/89300196/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

