Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.7264.1622123461693331572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 06:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SQG8jWKk;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id o27so640492qkj.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l+gwIJ28t1HYKGXWZw4AnkhZ3LhXYDVuimphe9RBByU=;
        b=SQG8jWKk9+dRKiJogNJ9q/6oKxEDWT3pv0tshcdEVglxWsix/MKmcCCuCY/j9nslU1
         wFOXJnHyopseTVFM6ljk9IBzECy4fvlFws9SpOpYFFpi8jya1nJ/vUuvewD2dD7HKwKv
         aTjlAO8CcGqH52KXjlqbPQoCyI+bU7xxIN7TOLivmS+s3SSAwba/Vdp+/LKJ++UcmoX0
         V9wMnCzL3dFUDmImcdPWBnFALnsafXMErUQHbHsKZpRXZidGozM1wV8Xi025ruodEep9
         uELGGLu6tnMA0dHFTgoercwcndcqOj+Sw0eygzxA8na5DRE9FbBkj39H2E6arRnSwV+K
         zf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+gwIJ28t1HYKGXWZw4AnkhZ3LhXYDVuimphe9RBByU=;
        b=LDOfBAI+8o/oV6xJeLz5X1cGshcRb3owXfxxc40B6eg87BRSB6w4Mk9QcjCgLaGZFy
         JVBO0RCQEs3dPDS62W1LkC3vNLzkYPlypLCGfnusrQef29QSTj77OSsScwvO080FPEH5
         sy2ZWwi9v//Wp5pfMAmcSzmU/P2IbgnX3YjG63TF4JsYBKOg0wc6PhsKH2hLwuQYW0+E
         IbP25l+ITGJpq/G+cELlFaKXlMtf3Eg/KhW3RrG7HfHbFr1Er6RrpSgwcmXzxoXivNBX
         Y1MlCANMduc6vdp3dxYVlYI9cWoliByvkVOReK/ap96hYwkcLegnr18aYTUIkMybeg2C
         oJmg==
X-Gm-Message-State: AOAM530oCywH+/NJlR1JuXYMr+68zW6y3XfJJPit6OWi4Xex0v9R8QPB
	JqLfJ0eml33ZQi71yQeWCQuuyQvQHvW6L/ZU8aU=
X-Google-Smtp-Source: ABdhPJyQGukYQTEnOVF+9dp8XSET3vgkU6Bm7LWuvaU5Fg7WOJuPkq7OLg219ofH94IE3CK797dErqwvBegX00ExzKc=
X-Received: by 2002:a37:270d:: with SMTP id n13mr3558374qkn.146.1622123460737;
 Thu, 27 May 2021 06:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <1622078795-116508-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1622078795-116508-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 27 May 2021 06:50:34 -0700
Message-ID: <CAMKF1soW5PM7UXFhMFoUG+UdHgvW5ztaTWDXHVhVchf6hAHSRA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.5 -> 2.2.6
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Zheng



On Wed, May 26, 2021 at 6:26 PM zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:
>
> Because v2.2.6 commit can't be found on any branch, download it through tar package.
>

this is still 2.2.x branch so i wonder wgy commit is missing

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../gensio/{gensio_2.2.5.bb => gensio_2.2.6.bb}             | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.5.bb => gensio_2.2.6.bb} (80%)
>
> diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.6.bb
> similarity index 80%
> rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
> rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.6.bb
> index 271a668751..368861060d 100644
> --- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
> +++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.6.bb
> @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
>                      file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
>                      "
>
> -SRCREV = "ed307629e067a9ef55d79beec9c9f67b86efbaaf"
> +SRC_URI = "https://github.com/cminyard/gensio/archive/refs/tags/v${PV}.tar.gz"

we usually do not allow using github archives as they are regenerated at times
>
> -SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
> -
> -S = "${WORKDIR}/git"
> +SRC_URI[sha256sum] = "9102ca66cd71d24e07b98187dfd0d60059e6e79f1a200f377ec65b478e9e8444"
>
>  inherit autotools
>
> --
> 2.25.1
>
>
> 
>
