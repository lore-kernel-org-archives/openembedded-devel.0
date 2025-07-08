Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7876DC83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 07:33:22 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.13274.1751959998368395249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 00:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=mD7SF37F;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.47, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-557e20222c3so2612368e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751959996; x=1752564796; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGXyQNLz1vf1NeRl6FBkw/8shqnO80oPglUPFgMiQG0=;
        b=mD7SF37Ftx14Yx9UMQdhDFF7cm/EGHtJ8zFuBgf5R62FCu18rbCFf4O+v+ZDClzoF1
         XCyBM0fbtTVWxrZi4Pe3EfYRzQAjgVgnoNLvOzK++4nrGlIhlOE06mQK+0NBhud6cL85
         87Hx01pKcBSonASZOGsAtL1ZwLRX2AOCJy9b/j4j/Xzhr3uGwpXBSHc9JJWz3fJrEc7T
         26mpCcWvaZIPkljbFN9217oWIeyp7/ECZvxm2xGUIDy5OdxQWUwHhfXM7eaTRmdy6wDF
         vs3oqQcfEtIXSRFaADqU8Wc8ILCU/tErDh4Ms6a5A7eRKXzYHwDouPuUnkf8QsAfhk2p
         GRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751959996; x=1752564796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGXyQNLz1vf1NeRl6FBkw/8shqnO80oPglUPFgMiQG0=;
        b=NUaP3SqK7DPu0UdEfyR4N5xVOIW+eE0ktgeZ0LtOyHLoqWba4jfpgNJCKNmBN5C0C7
         oAPxIPpu4rAsNAK2RXdzNu/l1pqF75NdM27N0LWwyRI+BAtwYzktfo66eyWY3p88LIKg
         eHhZvKyaYnM/s8qHZNQ3zgcFd8Ht/jQVd2SIxZIrPpkPrJZw8SmfLhl1zVyzO+gui3xB
         THNwufKz4gFVlv28BFmJEZGj/yaWamQYBJ4B7ZpYPsCsasgo4oNR9Hwt47SjK1EWnibz
         SHaw7VDXGs4dZBptCHMogl6n6Ak+9x0prbgdw9LiCGTRfPqXxa3MFlHAK3uJSDa7Ow7W
         pRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/HykKrsRwNKEG65gcoGw2f9zbm6xb+pwQlosbrKy+nrm8o9GVh4uh7bdPG0UkyppTYYXgXLKvq/6uJRw0XkpWo3Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3WiyGbphjzcGZKfYydqFq/wxPpwp/UzCLe479gq5dNTOpg6Qj
	D1Ek7iPbIs6Es4cyb9zoxNeDTjdMXPXsKvYiVMsPkKct+dOgTFJcGUhGQmOjn77+XFfP3mQ6CuX
	HoPUeQGfTGZUlDaqpwO3Qp2i2dyHM8sQdrzzGnwL8wA==
X-Gm-Gg: ASbGncuRsgWGxF+DGVa1e4LQbcNH5gc5994jfm9BKeR3IwTgCUVxe+P8SNgdJ8xBo5i
	vhr8Bubue4JkvEbbbqNF+Im89fneYNb4ZsivPfuvQRnJRhCz9YxMzcldXGi2cSPf1IyIpAeogLc
	gH0taFArIGTVeaH0ex0kXsIHqHKh1JPvBT9tp417XQx4xh2kGmCqk5G4IE/oIe4MWJHvzfro5t2
	Zs=
X-Google-Smtp-Source: AGHT+IELEsWu46qJDVmYSjf4X+5wLY/M4TCwMJJ0NDYsJ0EgEbQ5fevIaz4SQeL49SbXfpibto6xI9EVCMwZE+62qdM=
X-Received: by 2002:a05:6512:234f:b0:553:aea0:6ee4 with SMTP id
 2adb3069b0e04-557f8321876mr776006e87.16.1751959996131; Tue, 08 Jul 2025
 00:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250625144522.189693-1-brgl@bgdev.pl>
In-Reply-To: <20250625144522.189693-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Jul 2025 09:33:05 +0200
X-Gm-Features: Ac12FXwG-H5k-whXgtSJDeqPYZMM_RDAOqtZgsWVWiIdKHYJemOZDtVNVCjjb18
Message-ID: <CAMRc=Md=exc9r+cRi+GXV_5DvJAEVXfnMk_0JmbtSCTdnbs12g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: update to v2.2.2
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 07:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118300

On Wed, Jun 25, 2025 at 4:45=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This is a bugfix release addressing issues in tools and core library. No
> API changes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../libgpiod/{libgpiod_2.2.1.bb =3D> libgpiod_2.2.2.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.1.bb =3D> libgpiod=
_2.2.2.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.2.2.bb
> similarity index 98%
> rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
> rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
> index 93c3e3b92d..09b0928dfa 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.2.bb
> @@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-2.x:"
>
>  SRC_URI +=3D "file://gpio-manager.init"
>
> -SRC_URI[sha256sum] =3D "0e948049c309b87c220fb24ee0d605d7cd5b72f22376e608=
470903fffa2d4b18"
> +SRC_URI[sha256sum] =3D "7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6=
d4bb1e4a56cfec0d"
>
>  # Enable all project features for ptest
>  PACKAGECONFIG[tests] =3D " \
> --
> 2.48.1
>

Hi!

Gentle ping, as this patch seems to have been lost on the list.

Bart

