Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035EDC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 04:42:10 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.9169.1645504928953849038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 20:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LMVNFv/y;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id p7so38054409qvk.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 20:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GUdK5K7lExuxL1CBQqMVAmwBUl8ERITo+mm6dQrFGi0=;
        b=LMVNFv/y//U/BOSsrPaqLy+AGJRtWYOKhJUIy46ZRTPP5MYcg3R0IcXgzoPl1G2UmM
         AwgqGLQOF9A2lIgF5bmaAXWdrHJWJe0mQJfcjUqu9sPw6EnMj4F/GC1iairldUgbx1Gm
         nuzqXKgawp3IEj4hRds8s101lZHGqLrxyA4dnKgtbnHy9QNDvWe7RGl1ye5vcAaV0b3x
         Et2FKooQIYAOOrU0n2F/qwJfalUbOnZh86Z54p52eCcOI+Q3BV0zv36D5jbJubQNZwr4
         eIxQau8L9P5SWh+Oh5pWjO6jn9Clztxpx8Y3++tm4NyIcPVYwMwgOi7d90yOTnlAR7KN
         u/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GUdK5K7lExuxL1CBQqMVAmwBUl8ERITo+mm6dQrFGi0=;
        b=B611twlW64/cv3dmObbIUKdPnU2GA8jR6aBMu0be9luWwGpfawxntiYSx5HqQv0Ay9
         A3QQN368JHKZ9c7b5hhjZVrM1cB/MkOgN+imQ3qywXZtCPFf4Ak4GGMXHPNGIAH29b7P
         ORUiMGF/mwmBqOQF5Cxh+R14G04kjwBQUrka44tXMP4Lgn9KFkPIyNILNDAPKzp0jPQX
         gt8IUuSm82OwYhJ107v7U/xWIjTWx7jPo6VMz8b7TlWBrCpBi08LlPzuoRqGOPueHqsz
         XMxsLdZ6MRi70f0/xhSaYRyyk7664tAqWltk9S+FouRv+OkGbkWEx93Zg/CVRCYtNpEH
         zs0A==
X-Gm-Message-State: AOAM5329xbyvbUxLaSYyz+rMmuT+Or7oedVgrlJSYNn8vG6JEtY8is3F
	YhplWjVbyZNKNQRjZ5IAGcdwDXDGW7vNTBkWao16Ud2hzQE=
X-Google-Smtp-Source: 
 ABdhPJzaMMTXvxgmp68xqcc7Rx/wdMFJtp4I82DOqIy+crzOiGHRhOZA/OIM+LQYt3VIl9xbkf883EVOU+FcnujVeNQ=
X-Received: by 2002:a05:622a:104c:b0:2de:377e:25d9 with SMTP id
 f12-20020a05622a104c00b002de377e25d9mr4837277qte.229.1645504927863; Mon, 21
 Feb 2022 20:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20220222025048.2826709-1-denis@denix.org>
In-Reply-To: <20220222025048.2826709-1-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Feb 2022 20:41:42 -0800
Message-ID: 
 <CAMKF1sredNtG1mj2SNvrfuiLVs_H5d0x1HMyeooQJq-ArAaSOg@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/4] layer.conf: update compatibility from honister
 to kirkstone
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 04:42:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95436

I had patches in master-next to address these for few days now, they
are already in master, please send anything thats missing as a rebase.

On Mon, Feb 21, 2022 at 6:50 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta-filesystems/conf/layer.conf | 2 +-
>  meta-gnome/conf/layer.conf       | 2 +-
>  meta-networking/conf/layer.conf  | 2 +-
>  meta-oe/conf/layer.conf          | 2 +-
>  meta-python/conf/layer.conf      | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
> index 6a9357d2a..b5f59d9ba 100644
> --- a/meta-filesystems/conf/layer.conf
> +++ b/meta-filesystems/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
>
>  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_filesystems-layer = "honister"
> +LAYERSERIES_COMPAT_filesystems-layer = "kirkstone"
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index d2ee3e069..3f6b4f7b7 100644
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
> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
> index 67fcda3d9..3f9699ad1 100644
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
> index d25db911c..93f3dc580 100644
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
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index ffad953f9..98f734152 100644
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
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95434): https://lists.openembedded.org/g/openembedded-devel/message/95434
> Mute This Topic: https://lists.openembedded.org/mt/89309603/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

