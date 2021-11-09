Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E8DC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 10:51:49 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.10396.1636455108196950351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=clxH7qUT;
 spf=pass (domain: gmail.com, ip: 209.85.219.175,
 mailfrom: marek.belisko@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id u60so35994838ybi.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Th1xSSLYa+y97U1+ILwZUPwrUKl84HNma5d0cBRJvXY=;
        b=clxH7qUTDoppkMoSI2FUUZ7V2iiQRD77LvAODQrs2/f4jt+YbMm7tIUkrhKTKeSkGX
         TQKue3om09Ndj9eQkWtHd0TQ+krmLpkUUjDzffKtW8f+dksikHpslcLQGOnuTA8cJ0UG
         3wAVlHg890kna9YoVAtbGuVIlE+ATI1Pqh8FvltcOAIf80FOo8QgRMDTuKVJrwKIAiim
         zGG0VRH6YkULhBgYCakHHT842Pyk7HDL2HOaHdxkCt76OR7pDXVcrsZUK+9PO3fcDwu+
         d9etTb5XU7tS9Sw+ZGUKDMcecbnIMWnsGn9/4zbX22by7GqQh0hHUsSiF68FNhg9bPLD
         AHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Th1xSSLYa+y97U1+ILwZUPwrUKl84HNma5d0cBRJvXY=;
        b=LRq8b7kaMOeTdrUqvNt8Ie+bi7/xZMcsH1jaW10QORkn8xXWv0D+wVDbTKKlIkuFvm
         zYEs7j09D0/1yMVDAQlebP5G+GcYrH+yTxCSeUbm0oz9sRAVGB9sHX/Dd62xat22nq+5
         bJazveLkvgKm0tPkJwMPIhFIOLhhslJfAqPFyq5jKFcFHyL9gqAZyIHaHQfYPS4mkdIO
         etrZZhMmjhcHAD0a+pYPO/55gu2geY7wptQO6RpRR3/xK3CEeC41xy5bo36WFBG9k+p3
         OThfCJqn/+5SEdS+iqYLUfNuFff+HDm5uNASQHEM1C1lej4YWg7A64uQY4fyhhtVHbgv
         Q7qg==
X-Gm-Message-State: AOAM531h/vKDMGT5aVx+ayQESM84w7J3YPHFaauxtp4MYWUsMLPvQyxO
	UA36RaYwUtzGJZuh7nWmRCvZE7QdWDUzy9lpsrw=
X-Google-Smtp-Source: 
 ABdhPJwk4+2YAxs0l7kfObs8N1Vcuvv8GpdmLrqB27qQg8/My8CP9cRgw0fxctf7wfj1TMVPhiN9O01/8hZH7a1DI5U=
X-Received: by 2002:a25:f827:: with SMTP id u39mr7140637ybd.511.1636455107306;
 Tue, 09 Nov 2021 02:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20211109102757.16992-1-alexanderhaas.expleo@gmail.com>
In-Reply-To: <20211109102757.16992-1-alexanderhaas.expleo@gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 9 Nov 2021 11:51:36 +0100
Message-ID: 
 <CAAfyv36e+dKcAc0ZgZewh1z1dFb1hAr2v=jA=Xm+GZizXCBMeQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH] python3-fasteners: fix
 RDEPENDS
To: Alexander Haas <alexanderhaas.expleo@gmail.com>
Cc: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 10:51:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93882

Hi Alexander,

On Tue, Nov 9, 2021 at 11:28 AM Alexander Haas
<alexanderhaas.expleo@gmail.com> wrote:
>
> this fixes the parsing error for python3-fasteners_0.16.3 that resulted
> from a colon after RDEPENDS
Please see this thread from yesterday:
https://lists.openembedded.org/g/openembedded-core/topic/broken_dunfell/86902854?p=,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,86902854,previd=1636453802825824235,nextid=1636376307838664951&previd=1636453802825824235&nextid=1636376307838664951

Long story short your poky is not up to date with I assume dunfell poky release
>
> Signed-off-by: Alexander Haas <alexanderhaas.expleo@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> index 1ba2c6f20..7ebaa4590 100644
> --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> @@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
>
>  inherit pypi setuptools3
>
> -RDEPENDS:${PN} += "\
> +RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-logging \
>      ${PYTHON_PN}-fcntl \
>  "
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93880): https://lists.openembedded.org/g/openembedded-devel/message/93880
> Mute This Topic: https://lists.openembedded.org/mt/86928245/900721
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [marek.belisko@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

BR,

marek

