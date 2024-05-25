Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054ECC25B79
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 07:04:35 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.6996.1716620672225965389
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 May 2024 00:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kcn1HcX3;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e95a7545bdso18953321fa.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716620670; x=1717225470; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOfnw8HWn0WpaeuEpjwbOca/g6grjrXUjV8fE2UO1nw=;
        b=kcn1HcX3g0Q/cCe7IC+pX47BAew4aMd8gJVYZg3lLpRKbeLq/vh7W9yR/yv7zxCHm6
         4anfKwwYW2UW6J3LcGaiNP5ghfP8VbGW5GsoNwZtz3aPRa1E+BL4lLclVSxvt3t3q/T8
         QHJ7+anKaMolQ2axTG7UqFY8cJyFq/+trwWYGZnRnWW9vcqunR0kGMpTi94eDI39EZZf
         sdiFAx7jIZp0j2UK8YCUSwrQRUYiNNdPlXxLifyDsNNAC+7v+lP+sqvcmooItyHf5jrs
         oXKhOZaivsSS7umSP+/9zKuw2FHKYwHEdQWA7w8dj3TmyjL6EwbnIrltYj0tyAivs3i2
         FW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716620670; x=1717225470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOfnw8HWn0WpaeuEpjwbOca/g6grjrXUjV8fE2UO1nw=;
        b=WQ28o436hpZKC/vKG/Ja2YXK0tKXyXYXsnhMOZ3sSieGwSuiHbDF2mvLqNWZengsQi
         wYyGE1EG+hbScuBR8sYWtou/2wFH/PjebBQ+8PpTXsYsjTrCZ1DxFL6fcoiKzhUvyJiv
         YSrxHnJFpprJ34oLBGUfbs46WGLf4bH6xC9Y8rSDRZuu498u0K2rXTsea+zk92J6Tl7K
         sUF0/KIkKCM5MG936zXvgNhpbLNh3Wg3DMiUXrGd8lFjTS4Uhn2aWnnHUIfjd+rFYS+5
         XHPe5FGG/dY9GdqfdStUfTxfAkyD/O7y+EYPrbyifsM99THIgNQ4bWTWNdE56D4QbCU1
         ZMsQ==
X-Gm-Message-State: AOJu0YxuL8AHUr9ElVC4enKxYeZwUlBhswAY8S/YmYwx2x/IIKO/cIlg
	TO4WaV/dZ1CBtgYa97kbKwa+J7AxGQyB1npi0is8RHikKLmo19Vu904UAx6OJfKBTaEvGbT+HoZ
	vdOggBCnhI3GR/amKUl6SpW4XXQYq7bp1
X-Google-Smtp-Source: AGHT+IETiWTgq07+k9S60YsIaVXmEuO7oiu7YZwcaId2TArI7CQgkNwOTYrOh3v4tKtWTIjjf+cYgG6kTBNz+HVx6o8=
X-Received: by 2002:a2e:97c3:0:b0:2d9:f00c:d2d5 with SMTP id
 38308e7fff4ca-2e95b27b08amr23165561fa.46.1716620669913; Sat, 25 May 2024
 00:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240525065825.1073928-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240525065825.1073928-1-dmitry.baryshkov@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 25 May 2024 09:04:10 +0200
Message-ID: <CA+chaQdyShHF+8=8zD2n83HGcMJZe8UN+eu2ZZyALb=-=HoV6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] layers: stop declaring compatibility with scarthgap
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 07:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110529

Small typo in styheed

On Sat, May 25, 2024 at 8:58=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> With the UNPACKDIR changes in place the layers are no longer compatible
> with the scarthgap release. Drop it from LAYERSERIES_COMPAT and limit
> compatibility to styheed only.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta-filesystems/conf/layer.conf | 2 +-
>  meta-gnome/conf/layer.conf       | 2 +-
>  meta-initramfs/conf/layer.conf   | 2 +-
>  meta-multimedia/conf/layer.conf  | 2 +-
>  meta-networking/conf/layer.conf  | 2 +-
>  meta-oe/conf/layer.conf          | 2 +-
>  meta-perl/conf/layer.conf        | 2 +-
>  meta-python/conf/layer.conf      | 2 +-
>  meta-webserver/conf/layer.conf   | 2 +-
>  meta-xfce/conf/layer.conf        | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/lay=
er.conf
> index 2e220bfe2468..52ca5a4c0b36 100644
> --- a/meta-filesystems/conf/layer.conf
> +++ b/meta-filesystems/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer =3D "1"
>
>  LAYERDEPENDS_filesystems-layer =3D "core openembedded-layer networking-l=
ayer"
>
> -LAYERSERIES_COMPAT_filesystems-layer =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_filesystems-layer =3D "styhead"
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index 89659592ee6b..f831de78c433 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer =3D "1"
>
>  LAYERDEPENDS_gnome-layer =3D "core openembedded-layer networking-layer m=
eta-python"
>
> -LAYERSERIES_COMPAT_gnome-layer =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_gnome-layer =3D "styhead"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
>    faenza-icon-theme->gdk-pixbuf \
> diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.c=
onf
> index 93ae527d4214..c844085b09bf 100644
> --- a/meta-initramfs/conf/layer.conf
> +++ b/meta-initramfs/conf/layer.conf
> @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-initramfs =3D "5"
>  LAYERDEPENDS_meta-initramfs =3D "core"
>
> -LAYERSERIES_COMPAT_meta-initramfs =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_meta-initramfs =3D "styhead"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
>    dracut->virtual/kernel \
> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer=
.conf
> index b7866cbe8cd6..0442a57a968a 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer =3D "1"
>
>  LAYERDEPENDS_multimedia-layer =3D "core openembedded-layer meta-python"
>
> -LAYERSERIES_COMPAT_multimedia-layer =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_multimedia-layer =3D "styhead"
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
.conf
> index 0e09d8f2ad9f..a9ba4abadeed 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -15,7 +15,7 @@ LAYERVERSION_networking-layer =3D "1"
>
>  LAYERDEPENDS_networking-layer =3D "core meta-python openembedded-layer"
>
> -LAYERSERIES_COMPAT_networking-layer =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_networking-layer =3D "styhead"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index d8f0f5339aed..77855dc659e8 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -44,7 +44,7 @@ LAYERVERSION_openembedded-layer =3D "1"
>
>  LAYERDEPENDS_openembedded-layer =3D "core"
>
> -LAYERSERIES_COMPAT_openembedded-layer =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_openembedded-layer =3D "styhead"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> index e20c8471e051..fb1fe88453c6 100644
> --- a/meta-perl/conf/layer.conf
> +++ b/meta-perl/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer =3D "1"
>
>  LAYERDEPENDS_perl-layer =3D "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_perl-layer =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_perl-layer =3D "styhead"
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index 998f492a49cb..aaf620a433ee 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python =3D "1"
>
>  LAYERDEPENDS_meta-python =3D "core (>=3D 12) openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_meta-python =3D "styhead"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.c=
onf
> index 717bfda471d9..08e9df505b60 100644
> --- a/meta-webserver/conf/layer.conf
> +++ b/meta-webserver/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_webserver =3D "1"
>
>  LAYERDEPENDS_webserver =3D "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_webserver =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_webserver =3D "styhead"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 0c7990e8e094..f131eb270406 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer +=3D "multimedia-layer"
>  LAYERDEPENDS_xfce-layer +=3D "meta-python"
>  LAYERDEPENDS_xfce-layer +=3D "networking-layer"
>
> -LAYERSERIES_COMPAT_xfce-layer =3D "scarthgap styhead"
> +LAYERSERIES_COMPAT_xfce-layer =3D "styhead"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D "\
>    openzone->gdk-pixbuf \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110528): https://lists.openembedded.org/g/openembedde=
d-devel/message/110528
> Mute This Topic: https://lists.openembedded.org/mt/106295310/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

