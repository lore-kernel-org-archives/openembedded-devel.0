Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF431C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:20:30 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.2751.1645582829579860262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MHZ8it1O;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id z66so2679315qke.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BNZrxPmp3EEMIiQKTmvGdsbWgnuqxfBPgCepC27Hb1k=;
        b=MHZ8it1Om22vdutsbOpnIHr7iMpcMU7vvtFPHzM1Dc3Posi9crMB+peTQUdJQh1Z3O
         1IHKFGemSZTWusdZMrI0GkQ6elQKSq6xqa4SdYiyTGudByqs8koA1nG4zKJ67JdU5rz9
         ogAzYYoj49fiyIkXz40b4sD0tP/M3933eRmfGrkI9Tv9kiZ557KGe85TXkA20+6hbDph
         qWxxclzc+MSfi6ixdtegXxrQG44u/YMleGiNaD9cxEp4dDxdjN9hz+KsBuFDlhzc4LGj
         lqtpwkozUyHJP95NbuBAlFMU0ftQ+LPZqTTikCn3rfx17SRNV7NJB7WRofqa6INjQ2E3
         HluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BNZrxPmp3EEMIiQKTmvGdsbWgnuqxfBPgCepC27Hb1k=;
        b=3f3OJc4W9DDJ8Y9bRCFg1ERs8g8kyO0sSPFDnPy0Ch1ODdBI6IAuXHjUV8JJaFyJ07
         kvdO/2DQvwgy3ZuHWjwmCwuz9XkJJlIsoBI1DwUW5kuhsHIUsMLgCcGrSXlWMRHR+VWT
         4Bo4HuWGptdUvBJL0Vb4sH6iqhCjm82Ry9qWx25qTu7zFbTYZD97yw82QdL5Vt9ZNRFe
         2o38+osrpdi8fwZD/DHHTMmDpCAfwl9klq3MMNAOBDBhDnMK5yicZuctdZ3Fo3fUxg3O
         P82LP0kDZ2wB+lyE4KThprFihZDKX3iDhTgBsnKijrsalfQxI7buh/XD2NOqb8h8PXuO
         oNUQ==
X-Gm-Message-State: AOAM533v1e3IEW8+hiDtvPkPwHnVrSC7Ievc9+dr1ugy7d3Tbp7ox22r
	G9nUM+35moaIazoXjQX2+5+8lEFGZ5iWW+3iLa0=
X-Google-Smtp-Source: 
 ABdhPJzvN9k/Sc1LY6HU+gIaHQORtpehH6dktNSUVb4Og5kuXDw0zxBK6/SS0RgmVOQPY53WHha7F49v/FfxrMqL6HY=
X-Received: by 2002:a05:620a:1593:b0:60a:b223:893a with SMTP id
 d19-20020a05620a159300b0060ab223893amr17309550qkk.72.1645582828559; Tue, 22
 Feb 2022 18:20:28 -0800 (PST)
MIME-Version: 1.0
References: <20220223021448.2395926-1-tim.orling@konsulko.com>
In-Reply-To: <20220223021448.2395926-1-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Feb 2022 18:20:02 -0800
Message-ID: 
 <CAMKF1sr2v7FrBsMfJsSf7bUZ94X6hBvv8pGg8_ZmXqueDLrfTA@mail.gmail.com>
Subject: Re: [oe] [PATCH] all layers: LAYERSERIES_COMPAT => kirkstone
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:20:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95460

please update to latest master it has been fixed yesterday with
https://git.openembedded.org/meta-openembedded/commit/?id=d9ec74d4c29fa3020d95a2ec0ada2e9a4f5767b6

On Tue, Feb 22, 2022 at 6:15 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> Upstream oe-core is now testing for 'kirkstone' compatibility which
> breaks any CI for meta-openembedded layers,
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
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
> diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
> index 6a9357d2a9..b5f59d9bac 100644
> --- a/meta-filesystems/conf/layer.conf
> +++ b/meta-filesystems/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
>
>  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_filesystems-layer = "honister"
> +LAYERSERIES_COMPAT_filesystems-layer = "kirkstone"
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index d2ee3e0692..3f6b4f7b76 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
>
>  LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
>
> -LAYERSERIES_COMPAT_gnome-layer = "honister"
> +LAYERSERIES_COMPAT_gnome-layer = "kirkstone"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
>    faenza-icon-theme->gdk-pixbuf \
> diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
> index 11dd43178e..33e61d333f 100644
> --- a/meta-initramfs/conf/layer.conf
> +++ b/meta-initramfs/conf/layer.conf
> @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-initramfs = "8"
>  LAYERDEPENDS_meta-initramfs = "core"
>
> -LAYERSERIES_COMPAT_meta-initramfs = "honister"
> +LAYERSERIES_COMPAT_meta-initramfs = "kirkstone"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    dracut->virtual/kernel \
> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
> index 56c3569d00..1fe9c80330 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
>
>  LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
>
> -LAYERSERIES_COMPAT_multimedia-layer = "honister"
> +LAYERSERIES_COMPAT_multimedia-layer = "kirkstone"
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
> index 67fcda3d99..3f9699ad18 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
>  LAYERDEPENDS_networking-layer += "openembedded-layer"
>  LAYERDEPENDS_networking-layer += "meta-python"
>
> -LAYERSERIES_COMPAT_networking-layer = "honister"
> +LAYERSERIES_COMPAT_networking-layer = "kirkstone"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index d25db911ce..93f3dc5807 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
>
>  LAYERDEPENDS_openembedded-layer = "core"
>
> -LAYERSERIES_COMPAT_openembedded-layer = "honister"
> +LAYERSERIES_COMPAT_openembedded-layer = "kirkstone"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> index 6a2dd7ff95..4f075e9a92 100644
> --- a/meta-perl/conf/layer.conf
> +++ b/meta-perl/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
>
>  LAYERDEPENDS_perl-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_perl-layer = "honister"
> +LAYERSERIES_COMPAT_perl-layer = "kirkstone"
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index ffad953f93..98f734152f 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
>
>  LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python = "honister"
> +LAYERSERIES_COMPAT_meta-python = "kirkstone"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
> index 46d5a872a1..312c39b3b3 100644
> --- a/meta-webserver/conf/layer.conf
> +++ b/meta-webserver/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
>
>  LAYERDEPENDS_webserver = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_webserver = "honister"
> +LAYERSERIES_COMPAT_webserver = "kirkstone"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 81e7dc5ad3..be58708679 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
>  LAYERDEPENDS_xfce-layer += "meta-python"
>  LAYERDEPENDS_xfce-layer += "networking-layer"
>
> -LAYERSERIES_COMPAT_xfce-layer = "honister"
> +LAYERSERIES_COMPAT_xfce-layer = "kirkstone"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
>    openzone->gdk-pixbuf \
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95459): https://lists.openembedded.org/g/openembedded-devel/message/95459
> Mute This Topic: https://lists.openembedded.org/mt/89332953/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

