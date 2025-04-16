Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1E2C369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 20:08:06 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.29467.1744834082279368170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 13:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QPwdGrnd;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-60297d7ab47so4107215eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744834081; x=1745438881; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sboskD82Y+HR9O1BFJ4LQlNIEDoRcR64lYwuqPPe54w=;
        b=QPwdGrndDwvzdseedtM9Zgzs4gRbvpZw3d8BXjVdc5wl1fLfcSTjau97C1WWY9gfq/
         bewRrk4AanLzp0AN8/1ubNq/uIp8a3nJIN8S68d0hm1U4OnrVz3n6ErJXFlTDzKfBNlv
         8bQWlbUamsOkH0155ZfgWm3mCPWN2gOdPUAsy7Sr5ROtQEArFKT1YmiloGocm5DqNJ09
         WR8BkPUcnaIJVzTKM4Ql5tv3PQQGuvow0m3AJowlD2b5hzt74ypAdXBMQkf+na1Fxcqs
         O3R/ODuQJQgOK2As4RrSyz+cTeHMeYCWWu2KZndGP5YHeQ3NsL8pPnvfgjL+ZIzO9/s4
         A0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834081; x=1745438881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sboskD82Y+HR9O1BFJ4LQlNIEDoRcR64lYwuqPPe54w=;
        b=k1SpnOGQwX0dqXHqiM6CbFQxSLxFaXXqprjQDJ730fDQni1xAUYyJuFPT/Fyg8PYCw
         Uw8ptRN2EFPdMCGdJqY2HU6Wa19DDGKGPDWgSGQR/UAEUke6xvZgh3JmQghUxnLAq57o
         vLNk7jiKY9QCB8SBOJ1dlA+3aJsZTSakYvsFilIuOwBQqX+gkT19Jq3GzH15nwzV3D1w
         T2DmFCiM4YW20dtmUuEll1eUkx9CDXpge7/8sgJyAR9IbbNvlfJQYF/svlNTqIAgwCvY
         UScQ5JdLNRoVMQHLclEn6y3oLWh/+StiKguKmVO3dnFrDagjPmfZwpqQSFvwhxl8nmxd
         c3hA==
X-Gm-Message-State: AOJu0Yzs7JwBy4YtlGOX1CAf2CsdATOmSLHVv81IPF27DCXLNnxV/2hG
	T4yb7RTJez2Ie+lqHz6N8txu6Q4euw5vHb5eY5LzlKKTdVgFpnPL+67kD2qjbaQsLQ84RqdsCDQ
	uPRc/kwFWwpscSe90XpfdNtR/0yQ=
X-Gm-Gg: ASbGncu6aWRFxvZkKmbIflnx7u96Nzf4Y9woRf2FK7z0PvhVxKEJc+9Eip9F7EEcDbp
	ZhUDUaIQRQnny/69GRz9mcC22X4+rWVFfEL4drq5LIv81tcRbjshOy61pjYhGNBbyXuWaC0ezgE
	gGBRYOXbP2bgIVKN0S2ByuFTkdRoovQPa7Qm6xtJlYZSxS7pnlQzA=
X-Google-Smtp-Source: AGHT+IERgfIhlixzPvEFb4/iM2yc2vqQONu3V06jm/30vqLAJnfIYsmgzvU1GK6HlC5GLqD4HLtvRdFPHB7rLExPf3I=
X-Received: by 2002:a05:6820:1898:b0:604:390:f290 with SMTP id
 006d021491bc7-604a92fab10mr2037927eaf.6.1744834081466; Wed, 16 Apr 2025
 13:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250416134410.712154-1-f_l_k@t-online.de> <20250416134410.712154-2-f_l_k@t-online.de>
In-Reply-To: <20250416134410.712154-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2025 13:07:35 -0700
X-Gm-Features: ATxdqUEFavNJ3FR20ueMU9Tf9amBiwS6UiK6Szqxp2JF0b6MMeQt1B_siR9wVGQ
Message-ID: <CAMKF1sogDhfLv2NecnApDTo1cK_d7yqa1yGPB77w3VvV6zZXYA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] flatpak: add requested user
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann CONGAL <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 20:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116913

On Wed, Apr 16, 2025 at 6:44=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This fixes:
> WARNING: gnome-image-1.0-r0 do_rootfs: User flatpak has never been define=
d
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.16.0.bb
> index 1f0e649eea..9b7d11e9a9 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
> @@ -12,7 +12,7 @@ SRCREV =3D "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check
> +inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
>
>  REQUIRED_DISTRO_FEATURES =3D "polkit"
>
> @@ -75,4 +75,7 @@ EXTRA_OEMESON =3D " \
>      -Dsystem_dbus_proxy=3Dxdg-dbus-proxy \
>  "
>
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --shell =
/bin/nologin flatpak"
> +

I wonder if we should update
meta-oe/files/static-passwd-meta-oe here as well

>  FILES:${PN} +=3D "${libdir} ${datadir}"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116909): https://lists.openembedded.org/g/openembedde=
d-devel/message/116909
> Mute This Topic: https://lists.openembedded.org/mt/112294934/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

