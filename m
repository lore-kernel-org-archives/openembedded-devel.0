Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D146D3B9A9
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 05:30:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8295.1765344604675231926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 21:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=sBsegW6h;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.177, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a56a475e8so64102891fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 21:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1765344603; x=1765949403; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeL9f+d88/QcpKy09FnPHPp+02iTGYgM+/Bj9iwDn1o=;
        b=sBsegW6hBnieKausmefFBoeRaEdZRJnZxlUnA3lkHJcS/omdoNEUWzjvjhU6edM+jV
         KNMMuq8n3rI8T/NRZ7H6hXAg18K/5nU36sqcHLaeD5pagY+LremlPwr5ftZucgm0bL7G
         CSXF9vbVVwLBuZ2o8GIbwL5XFrhU3KW9YdmZgzAbtQ6pWCx5kGZLsd1q2k9UK18MAizO
         gP58ka0gXCAyWp+pSyrnSCjCsM153Eu4LcQPjmpOhd1oKCv8I83S5i0P9adsqZiv2h3i
         oDwJoEEQTmFhTJ1G3nxAd93YMfbKpPAtlaQdUBtcNQyc0qritxMcfSL3FH+Xny8rUdN+
         UjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765344603; x=1765949403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DeL9f+d88/QcpKy09FnPHPp+02iTGYgM+/Bj9iwDn1o=;
        b=QZNoTX6JCQ6ZmOvyoXn3IiKbcpZrz6bdAG4YQo4ZEDQXnnbrFPvZvRIiq8XfqkUKNR
         XbXgLW7FeIKMO39xOmZ36+xbGzWG9TVsT6VZ41FNUo9S+dJ1VqX5U81pE6bt7lqaDAca
         Nd5iBnJomOYhUOUBSxgjWDs//ldbjzKvupF7AIAXLoCHMkIljkN/ZfrFeLR3ayuh63Sv
         0rHL3CK3GIiHyWSpRz4uW6gwKRSnPM3bOM9U5qtDEUUxDH9VCYPAj3dwx3lCxmBOV+42
         nvZ8epj+u00RjsrxnCIMuYjSVJsdUR7bL8LfEuzR4pZIAoqqaAPhIFNa7SbPTXbc+n95
         Lr+w==
X-Gm-Message-State: AOJu0YwGx23mUoY9Az7994MIhS1rarDenoD/ivjxu6tmLG7wT/boRh9g
	PR7woByVWYIRyvFFCuG4la4rscDIQrRyKIHLqtYH44gjFbigkhmE1f4ucBOzvpf37yPV6ADZ8K4
	6otC/qWMjg4VLmQX84LN8ZJABmvMxC0jJy3fJ+lC1XQ==
X-Gm-Gg: AY/fxX4F7vB3p+e8jD+SYCXyxuOTWjcNxNp3p+M2glKtJcQyQwDj4BZR7zQ35GKMdCp
	tdW745J76A+K/5tAP4mZCGDvnz9YJbqjLWmg/BW+buTjUzs1mkBRSFcXODIVFsaQiDib7vrPJ/5
	3L/xRB8bFdb56XuuIsAf+vR/n2iz1KTMnXZ0+2UjJ88UfBfrbqoHaDrpq/yrNIw1EorTel3mKuq
	WnzUi+mG+kmMZb1xF04B4cvi9bnLhey6pWorWWKHcvZefFpluqlCSY4S+1Kq9GYU3rCF05e
X-Google-Smtp-Source: AGHT+IGaqv6nP25gQkVn0Pccgwk4SKHwaZsPjyeV5xxZz3I3FX7txsonIUejb8/MKE70uvXg3XgYyTnVWofturg0F2s=
X-Received: by 2002:a2e:be10:0:b0:37b:9a1d:dee8 with SMTP id
 38308e7fff4ca-37fb208771fmr3620211fa.15.1765344601910; Tue, 09 Dec 2025
 21:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com> <20251209130913.388053-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20251209130913.388053-2-pascal.weisser.ext@karlstorz.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Dec 2025 06:29:49 +0100
X-Gm-Features: AQt7F2q6Lxw1NQRXy_TxhYjxIfHV6zU_JUb0uxXk0YVXSjyu81bztAzHO8jmETU
Message-ID: <CAMRc=Md06nf6=N=Z7aKkObCQGA0HBvFZ+Qin3vEiuQ1CNZvBrQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/9] libgpiod: Add HOMEPAGE variable
To: Pascal.Weisser.ext@karlstorz.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122483

On Tue, Dec 9, 2025 at 2:09=E2=80=AFPM Weisser, Pascal.ext via
lists.openembedded.org
<Pascal.Weisser.ext=3Dkarlstorz.com@lists.openembedded.org> wrote:
>
> Add HOMEPAGE variable to libgpiod recipe.
>
> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/reci=
pes-support/libgpiod/libgpiod.inc
> index fb309c5644..202d09c002 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
> @@ -1,4 +1,5 @@
>  SUMMARY =3D "C library and tools for interacting with the linux GPIO cha=
racter device"
> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
>  RECIPE_MAINTAINER =3D "Bartosz Golaszewski <brgl@bgdev.pl>"
>

Maybe using the RTD website would be more helpful?

https://libgpiod.readthedocs.io/

Bart

