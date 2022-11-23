Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B0AC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 17:03:54 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.1954.1669223029977904222
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 09:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lx18i3G3;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id l127so19667464oia.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 09:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KsF0eBeCsIsmmvKhabasYJm0As68IS7FkbReSpyKNC4=;
        b=lx18i3G3Hp2i/FlRxvAXFbEm3K9gvCeBUBgXcOp7M9/vRqn+gG3yjra4A8Uk6erhTP
         GE4gFK0GsdzR7gEXr6M76XN/HPpEOYBDcKA7RuIAjE3JEDR6LNoJfhzSbnaKOAh8IT9P
         viEdMqsuGpyBQK4FTvd9/oqnOASB3ETX9efnS7Ursfls0jSTrxRmPxmlyuh96q2f3Tkf
         X3KO5ca5IKpPQDLoUuMCE0AvT05azLVlKeRRSdFSiHuJsdiY64EYCNp/M4kTXeFSvIbF
         TiYHNJ6qeznFPb19A3aAIjWtCARqUNPbBM0mpHKmvIAgcgSHa34iL0nX1gwVA/WdrHMA
         l6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsF0eBeCsIsmmvKhabasYJm0As68IS7FkbReSpyKNC4=;
        b=dEsa2V+wMI5xOSLcAebMoQU70kajciXlcIvPGq6o057P/xUOE9WjKQaLLxpwKi/3d4
         qkDJgFHV2UXQz9OfrenZYbW6p73BtmxI1VseT6IgWG1Hd/040DviLdrqux2K3EC1umNl
         /H6zRtTJ8VwsGh/G5zEBdt8mIFAe3ZmT2AVSwnOupPEYiJhGuaUaWc4pNS9Ro62As1LM
         ehkuK1DSUr8fBcxTwzP3P9WA/H6fXDSTK5zFC2NsoIJtjthvKUXsiusFQv56z+8Z3cGu
         TeGum7Kbal6rdK+C8j3dDw3sQvX/bmKccoyCQKC8TcdJFJMJkKF9+kIikAuftmaDkEYr
         I7qA==
X-Gm-Message-State: ANoB5pmar727EwXXkpv1eJu9lWKz8YYyiEnEFL9M5LLmt4BGdBrtoUn6
	5bpvJGGc/+X22eOKeTCMOrnMaXH5Ph5MEGumtKs=
X-Google-Smtp-Source: AA0mqf4Jd0TA6WyZOkNJWlQymIXKostB/gOzyvpdbzUfqahKwKp+ZxKKMUkStE3c7dEUo97k5y+Xt4n/rxZ/7YXbN2w=
X-Received: by 2002:a54:4491:0:b0:359:d852:616d with SMTP id
 v17-20020a544491000000b00359d852616dmr5819162oiv.55.1669223029047; Wed, 23
 Nov 2022 09:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122160039.3693939-1-olani@axis.com>
In-Reply-To: <20221122160039.3693939-1-olani@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Nov 2022 09:03:23 -0800
Message-ID: <CAMKF1sor=Bc0BpP+W4wGU7DqSBEc9T-XYgGLwb2Ap8mhgeE59Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] kbd: DEPEND on bison-native and don't build tests
To: Ola x Nilsson <olani@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 17:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99703

please send this patch to oe-core mailing list as thats where the
patch belongs to

On Tue, Nov 22, 2022 at 8:00 AM Ola x Nilsson <olani@axis.com> wrote:
>
> bison-native is required if any .y-file is changed.
>
> Add --disable-tests to EXTRA_OECONF as the tests are not usable in
> ptest - they can only run in-situ - and fails when building with
> -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64.
>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/recipes-core/kbd/kbd_2.5.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
> index aa3ab6e121..75b3c2765a 100644
> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  inherit autotools gettext pkgconfig
>
> -DEPENDS += "flex-native"
> +DEPENDS += "bison-native flex-native"
>
>  RREPLACES:${PN} = "console-tools"
>  RPROVIDES:${PN} = "console-tools"
> @@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>
>  SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
>
> +EXTRA_OECONF = "--disable-tests"
>  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>                    "
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99688): https://lists.openembedded.org/g/openembedded-devel/message/99688
> Mute This Topic: https://lists.openembedded.org/mt/95199342/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

