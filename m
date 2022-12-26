Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C7DC3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 22:36:03 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.145523.1672094154644074074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 14:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ojuG0IKp;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-144bd860fdbso13894482fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 14:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UzJZFW/VmrI+lEf3wMJ+4AtxisBCXlFL+im0T5DiCcc=;
        b=ojuG0IKpQJzfriIyYDJzNl9fu+E/rNdwygBuOGI7jsAgo1ys0xOQAsMuaFU8pp/LrY
         IFkaQVyDdfU3HnjChMgRMCqmHJcEfKWtgrcFKU3w8wrmFmKoFT9pWG1Sw5/bihxjCBUw
         Xcvikel0nUUkFCeik3PXyTQFGEsrq5P7X8AfRef3SkEk1cR2TxZdIqIIbbRZid557kdA
         aRX9Alpm5QpAzTJrmwvjDQ/OoZdf8pVL3HL9z6OOBBxUeZOsZ5UH6PTLrqswwVHqkIkC
         UvQv+A/lu8WCUFwdd+XMGPFtovZcrSjsn2bI26InxKhsLdouHZV26W7ZxIsivjL68/c2
         JiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzJZFW/VmrI+lEf3wMJ+4AtxisBCXlFL+im0T5DiCcc=;
        b=Fy/EdACCRae/u+5+njUX5Y1eZ7vS88UnJe+cXOFpFmGqOadAw8Jx37H1hTATX98yFM
         CH6WiRt4XT+m2+k5fMczuwThbugUg0SQ0xXcWyosBXAyz9sIToY6BMV5ia97doXMlKyb
         7phmhLb8zqQTrvmA0oSQ2L5U2/ZL1IK6uH16fdWsFBQrO9jHlhquRpkPNMIBmhvobG1K
         hvnX23yzOuY/Szv+ManMmhVMp1OXfJIj+/O9Irnj4VMp0r6m3iekaEk0Zc4ihMpxLCiO
         u/cvFiyTLKN0aJRQtJU4d2jFayeWVP3S+2eXA5EP5P1HJpgWSwlZN1j2yjGTqFgD7x6B
         46vQ==
X-Gm-Message-State: AFqh2kp5Y11KkVCGc0q2TpN/9T0FVsaN2axBc8pg1ux1i1AWvyuf1j7l
	Y8/0EBWWciCBT7J1p1XGA5+74FQZEoJobavpcU0=
X-Google-Smtp-Source: AMrXdXvAnh4/A/V3ri45AR/KS0OEgWucZ1SO3t/Wdl6gMNQgTT8haS1TUh+nHpuPEdfnXjrVXBt4G30ef+ng8+Viln4=
X-Received: by 2002:a05:6870:ee14:b0:14c:733d:3b1 with SMTP id
 ga20-20020a056870ee1400b0014c733d03b1mr1065804oab.55.1672094153788; Mon, 26
 Dec 2022 14:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20221225150006.3008502-1-f_l_k@t-online.de>
In-Reply-To: <20221225150006.3008502-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Dec 2022 14:35:27 -0800
Message-ID: <CAMKF1srCLxrB9FB=6SAjRX8ZQo=wTqYj55QEN4WieYmD953U5A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-desktop: update 42.0 -> 43
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 22:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100246

Evince and nautilus fails with this update.

https://errors.yoctoproject.org/Errors/Details/685561/
https://errors.yoctoproject.org/Errors/Details/685562/

On Sun, Dec 25, 2022 at 7:00 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ome-desktop_42.0.bb => gnome-desktop_43.bb} | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_42.0.bb => gnome-desktop_43.bb} (76%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
> similarity index 76%
> rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
> rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
> index 6eeaed0e1..ed61c2e1f 100644
> --- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
> @@ -16,21 +16,21 @@ REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
>
>  GIR_MESON_OPTION = ""
>
> -SRC_URI[archive.sha256sum] = "f3caa293a5e86f6ccad18f817273db1c67061e680d79d839aa8a7528e5bb26d6"
> -SRC_URI += " \
> -    file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
> -    file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \
> -"
> +SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch"
> +SRC_URI[archive.sha256sum] = "3d6e153317486157596aa3802f87676414c570738f450a94a041fe8835420a69"
>
>  DEPENDS += " \
> +    fontconfig \
> +    gdk-pixbuf \
> +    glib-2.0 \
>      gsettings-desktop-schemas \
> -    virtual/libx11 \
>      gtk+3 \
>      gtk4 \
> -    startup-notification \
> -    xkeyboard-config \
>      iso-codes \
> -    udev \
> +    xext \
> +    libxkbcommon \
> +    xkeyboard-config \
> +    xrandr \
>  "
>
>  GTKDOC_MESON_OPTION = "gtk_doc"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100229): https://lists.openembedded.org/g/openembedded-devel/message/100229
> Mute This Topic: https://lists.openembedded.org/mt/95876147/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

