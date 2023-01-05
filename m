Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4371EC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:43:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.16033.1672933415740800209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ul9DHaEO;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id z26so55547206lfu.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LyoaFiYkWlgUB0PsPkIkY6WKQpaKG/OqlihiA5fqgIU=;
        b=Ul9DHaEO76Cd6zgIQxOQS5ztarN3Wgc1jc9raOCbbegTKTXpFRKt2PWQy2QZrRd+oG
         wxPb8En/d1ooD2Sv2VeFTs2Lrngb/P33bDDD1qEkysBlJQRYkpGuksuNO9Z1Feuc4bWt
         m9XbeEn5AkgnwJ+/iEUxPSeUNzj68rxxsUb+R/KDeTe6MBOo+u00l65pmJgci1HT3DK6
         N7rRenO1JUMxUp6MlsQhnuFLsMX9i5VGMCYknRGXHNJ67PhYND+y/rexnL5P4Rk9QOEi
         vFu9Xn/Hgt8XuVUT1ap8MqRULOo9kekKmX/uV6FarOSC6NosrbWRtIt2n3zRH5xXT96K
         mFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyoaFiYkWlgUB0PsPkIkY6WKQpaKG/OqlihiA5fqgIU=;
        b=0s0ztbe5ZzhifBH2AKnfn+8jiqeoc7fJQRa3jYxtLeBND+MBPmUgmfARzfFQvY4LJ9
         OVz0B/dMA9XD2JRWm3NOBLRncMxOOC5F439OSk4Lg5NUSEs8V/+9MBwT/me920bbBCT3
         nwhCW+utrQ+RS0ga7ZRwVj/049IPu6PGatg0x492L3UEpXdQHCW0e+3UEhZabYMuBWNJ
         K8g28YFWcwXG3x4WILEnQd1mm0csHeDndUdbQLtLubnaaZrgV4YoyZWTiPV73cqZX08Z
         S3cvUNPG99ICUf1LvZ9F8I1bwZJiTNnNtWSdx/gjxGUuAtycwauAIwD0FZRkxlsqe8/v
         +x9g==
X-Gm-Message-State: AFqh2kpnE1DpvONnM1MB3czyDDEQagA4XVpWTfPMtfuIRDeAS4uIze5b
	CdHTrJVe/e+4LAZSl6mZG5P0dER9UW9uuWY/yi8=
X-Google-Smtp-Source: AMrXdXvRIC9jpZlAn9LIoylZ2M93b/grHWlCS/6cT0+8mCSLqTD9RVh6K49/edTBiCVuwIjdRQJlPRB3LWQW/pQQZo4=
X-Received: by 2002:a05:6512:261f:b0:4ca:fd2a:d984 with SMTP id
 bt31-20020a056512261f00b004cafd2ad984mr1799146lfb.445.1672933413696; Thu, 05
 Jan 2023 07:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20230105153531.932402-1-f_l_k@t-online.de>
In-Reply-To: <20230105153531.932402-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Jan 2023 16:43:22 +0100
Message-ID: <CANNYZj97X95U7uaWAa4v9k3aVGSbYz=0WLU79_U7GiU3BcGCWw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome:terminal add missing inherit meson
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 15:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100417

Presence of '  GNOMEBASEBUILDCLASS = "meson"' indicates that the
recipe should be inheriting gnomebase class rather. Did it get
erroneously dropped at some point?

Alex

On Thu, 5 Jan 2023 at 16:36, Markus Volk <f_l_k@t-online.de> wrote:
>
> When testing Gnome recipes at runtime, I noticed that inherit meson was missing
> and gnome-terminal was not compiled. Fix this
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
> index 69af11c91..d9afeec46 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
>
>  GNOMEBASEBUILDCLASS = "meson"
>
> -inherit gsettings gnome-help gettext itstool upstream-version-is-even
> +inherit pkgconfig meson gsettings gnome-help gettext itstool upstream-version-is-even
>
>  DEPENDS = " \
>      glib-2.0 \
> @@ -30,8 +30,8 @@ PACKAGECONFIG[nautilus] = "-Dnautilus_extension=true,-Dnautilus_extension=false,
>  PACKAGECONFIG[search_provider] = "-Dsearch_provider=true,-Dsearch_provider=false,,gnome-shell"
>
>  FILES:${PN} += " \
> -    ${datadir}/metainfo \
> -    ${datadir}/dbus-1 \
> +    ${datadir} \
> +    ${libdir}/nautilus/extensions-4 \
>      ${systemd_user_unitdir} \
>  "
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100416): https://lists.openembedded.org/g/openembedded-devel/message/100416
> Mute This Topic: https://lists.openembedded.org/mt/96074078/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

