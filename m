Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD54FA3743
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:42:32 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.10747.1667230947523715653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BvFnnSYI;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso6974381otb.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YkBdiGy2nc7F/InJ9zdXVOQ4eTA3gSB/+x7eyxlsM6M=;
        b=BvFnnSYIaQJ0jBWollmGonvlnrT7L5uzGiht0ywtFXu3H2G0b5k1VCxyEirME9hxZ/
         /S+AjOdA+ro4NMRpUI0vSKCpunnV8XqN21tWWNNrPFc2rXSI3ohKPAC4hi35r+0AhAb/
         f4xlspIqxFPS7DfPrRVEkq/Yd1BeUrS/SHwfNzxBp8Bsvf82pAfONxr4d4iOvvhyH91y
         3W5mYctOI2fTOScVKrOsTpGjMwz8Jhr1nZnrehOUVFQXoteNKweBAfyC0i8jz0K7faXN
         TFBl/SZXx+SSwdtZ5+Mbcon0yUp9hmKrkNBfcy+BJhyK2YuzIDgUugrIm4W0SVzLp6Vk
         F2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkBdiGy2nc7F/InJ9zdXVOQ4eTA3gSB/+x7eyxlsM6M=;
        b=mPVTtvepmVIcUWM3qxq9dTLqwUqUHW229figB5LWw1BIcOLVYtcRCDhh5F8FQVt1k9
         RiuYeOZN8UCdDPgSMnjXII0Qwp3uwN2pYw0GOpyioPEHcMiqbWfguiVtfjw0dVB3liYZ
         DmrVtFVfpUizfDGCnbDry+zCuJfh9eN8XvdgdV0oCDsLw3FwpNRK08QlSl8/d2ROxUAJ
         y0WFOA4dbsA5IND3AIQCTsWFCBSYh8pmmtzxjOWKCYKUCuUn94R17WHZH+IpEAo9PtVd
         rGgLlkAwjUsMC54uSuDTW5kwqpwagIZPo3ajzgzWbCZP3V8UU9+HYXLwKHPbvm1no34p
         DfWQ==
X-Gm-Message-State: ACrzQf1k4FmWrqze+/+R8FQ8fCGVKw4HuahZaA2jaVpO/Op/jxJj6O05
	BGofoelUL7F1YmnAqGoxs3zePbT+x8usJ+iLHeI=
X-Google-Smtp-Source: AMsMyM7Rqe6X6+4Q+zcgj0np8aRRh31TFeIRp1trcICzxcmP/55qSRxESFoYmsVa6xZRyplEON2x6muI0I/kOSUjFGs=
X-Received: by 2002:a9d:6c84:0:b0:66c:4825:1c3e with SMTP id
 c4-20020a9d6c84000000b0066c48251c3emr4159661otr.55.1667230946601; Mon, 31 Oct
 2022 08:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221031153801.236081-1-psaavedra@igalia.com>
In-Reply-To: <20221031153801.236081-1-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Oct 2022 08:42:00 -0700
Message-ID: <CAMKF1spJKD_1GtAe0VpgNkPFDs=gQWH3Qj4iJnnyOmQvseJd-Q@mail.gmail.com>
Subject: Re: [oe] [master][PATCH] weston: update 10.0.2 -> 11.0.0
To: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99380

On Mon, Oct 31, 2022 at 8:38 AM Pablo Saavedra Rodi?o
<psaavedra@igalia.com> wrote:
>
> Highlights for this release:
>
> - Continued work on color management infrastructure:
>   In Weston 11, if you enable the tentative, experimental and WIP color
>   management option, Weston will not only blend in linear light, but
>   you can also set up a monitor ICC profile and Weston will do some
>   kind of color mapping from sRGB to that profile. Furthermore, you can
>   configure a monitor into HDR mode and deliver HDR characteristics from
>   weston.ini to the monitor, but Weston will *not* produce proper HDR
>   content yet, meaning the display is incorrect.
> - Various RDP improvements.
> - Performance improvements in the DRM backend.
> - Support for the wp_single_pixel_buffer_v1 protocol.
> - weston_buffer refactoring.
> - Groundwork for running multiple backends at the same time (e.g. KMS + RDP)
>   and for multi-GPU support in the DRM backend. This is not supported
>   yet, but may be in a future release.
>
> Breaking changes for users:
>
> - The cms-static and cms-colord plugins are now deprecated.
> - A number of features have been removed from desktop-shell: multiple
>   workspaces, zoom, exposay.
> - wl_shell support has been removed (superseded by xdg-shell).
> - The fbdev backend has been removed (superseded by KMS).
> - weston-launch and launcher-direct have been removed (superseded by libseat).
> - The weston-info and weston-gears clients have been removed (weston-info is
>   superseded by wayland-info).
> - The KMS max-bpc property is now set by default. If you experience black
>   screens with (faulty) monitors, try lowering it in weston.ini.
> - Weston will now abort when running out of memory. Weston is not suitable
>   for memory constrained environments.

Thanks for your contribution Pablo. This recipe belongs to
openembedded-core and that has its own mailing list for patches
called openembedded-core@lists.openembedded.org, so please resend it
to that ml.

> ---
>  .../wayland/{weston_10.0.2.bb => weston_11.0.0.bb}        | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>  rename meta/recipes-graphics/wayland/{weston_10.0.2.bb => weston_11.0.0.bb} (93%)
>
> diff --git a/meta/recipes-graphics/wayland/weston_10.0.2.bb b/meta/recipes-graphics/wayland/weston_11.0.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/wayland/weston_10.0.2.bb
> rename to meta/recipes-graphics/wayland/weston_11.0.0.bb
> index 786d12be61..ba4f4062d0 100644
> --- a/meta/recipes-graphics/wayland/weston_10.0.2.bb
> +++ b/meta/recipes-graphics/wayland/weston_11.0.0.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
>             file://systemd-notify.weston-start \
>             "
>
> -SRC_URI[sha256sum] = "89646ca0d9f8d413c2767e5c3828eaa3fa149c2a105b3729a6894fa7cf1549e7"
> +SRC_URI[sha256sum] = "a6138d4dc9554560ac304312df456019f4be025ec79130f05fb5f2e41c091e1d"
>
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>  UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> @@ -58,12 +58,8 @@ PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual
>  PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
>  # Headless Weston
>  PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
> -# Weston on framebuffer
> -PACKAGECONFIG[fbdev] = "-Ddeprecated-backend-fbdev=true,-Ddeprecated-backend-fbdev=false,udev mtdev"
>  # Weston on RDP
>  PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp"
> -# weston-launch
> -PACKAGECONFIG[launch] = "-Ddeprecated-weston-launch=true,-Ddeprecated-weston-launch=false,drm"
>  # VA-API desktop recorder
>  PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
>  # Weston with EGL support
> @@ -77,7 +73,7 @@ PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false
>  # Weston with Xwayland support (requires X11 and Wayland)
>  PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
>  # colord CMS support
> -PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,colord"
> +PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
>  # Clients support
>  PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
>  # Virtual remote output with GStreamer on DRM backend
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99379): https://lists.openembedded.org/g/openembedded-devel/message/99379
> Mute This Topic: https://lists.openembedded.org/mt/94688210/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

