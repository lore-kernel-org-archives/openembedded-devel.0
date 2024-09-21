Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FBCCF9C69
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 15:32:05 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.11682.1726932714973142585
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 08:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MUDOWVf/;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5e1c63c9822so1703993eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726932714; x=1727537514; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3/iXaNsifatS0sno+ZdleKdZ0mgOZisOraIneIwiRQ=;
        b=MUDOWVf/SVR0gcFBVWkItalnHLaWEeJ2QbzBnKAyg2jQpE0bzMlC92J23UtLkOJJTV
         x8nB2lzblo9eYDEKzAXg7+q/fNRWNYhYSTnttGaGa3Skf5EKGx4u9ouGdgfOaE4Mn3h0
         j7GUPcZWcjc4Nc9/tyUvcXHnZ3iAa83a+wBCXb6tR8XenuqKkqCIu8W3O2uPxD+m9KfG
         KnBONGS/5rpjeaMQTyFG/7bP7OL0de6rs//4gvsLh8Yz6mIhLNYzEjRixPS7ogwgp4iV
         axD+X3HtzdQ0pfSYuWTNkcmvJ2h9zqkyLHAbZRrA3mb/aN2HQzsMcf0RmDEap6y0vHwp
         KiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726932714; x=1727537514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3/iXaNsifatS0sno+ZdleKdZ0mgOZisOraIneIwiRQ=;
        b=U+UMtIUczJT0WVZe7MG2Zooa+Vpo4tjQAlekFA2G0GdNj6l2a2oq5eg+PpmzJlGmU5
         VfA2LbmI+GEme4VnTQmmjn2HRf4qRIGoXlzm1B0jW+ozfAbjEVkKixWNxCk+oy/Tgnab
         73wz2QumN/hkYKtg5scZn9Lu7d0l+Uy5TNmRINceISiwGSRiM/Rb/YFUO42PpDzpGgW4
         hitEHgiDtxM9b2oAMGroJPolgLfBVSqel2eTgd51+d2l110WiJyY5MBkdNAO7YSl8RPO
         PGVWZ/AVN0No3Om9RX320zsVj/PTZP1d67XSqd9WbCdIqYwgxzjad7PTI7Nc02wmGX76
         IqCA==
X-Gm-Message-State: AOJu0YwJlpAMuRtXoYcgqxmHEkP9SECkWc59uaG3C4s96iRYHr480/WX
	vHEZKFLNLyXLWpQAzUf4wKdpM8Lftqo/TharTy31c9Rc+knHXdzQwGpKMm+OpWBt+GakD3vysaI
	Cxt8Gb7w6Vip2yBMvPZg/FI4KP2cUIi9h5i4=
X-Google-Smtp-Source: AGHT+IGL8ZpMiQuE1rNemud/WL8Y5Sqy678GJk+7fK9igO/xvo3Eznx1HyC72Nph21HLaY6T50tgbAX4JDCnLZRMx6w=
X-Received: by 2002:a05:6820:981:b0:5e1:de07:9f54 with SMTP id
 006d021491bc7-5e58d01e03dmr3446362eaf.0.1726932714200; Sat, 21 Sep 2024
 08:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240920150822.1131707-1-f_l_k@t-online.de> <20240920150822.1131707-11-f_l_k@t-online.de>
In-Reply-To: <20240920150822.1131707-11-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Sep 2024 11:31:28 -0400
Message-ID: <CAMKF1sqKh1fJ8-QEPsonhRrHX2Xgu06wD-DHyDc9=tk7qcWdLA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 11/23] gnome-terminal: update 3.50.1 -> 3.54.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 15:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112430

couple of failures on musl builds

https://errors.yoctoproject.org/Errors/Build/191963/

On Fri, Sep 20, 2024 at 11:08=E2=80=AFAM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-terminal_3.50.1.bb =3D> gnome-terminal_3.54.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.50.1.bb=
 =3D> gnome-terminal_3.54.0.bb} (95%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> similarity index 95%
> rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1=
.bb
> rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.b=
b
> index 3bbfe9ece..ec8cbecca 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
> @@ -24,7 +24,7 @@ SRC_URI =3D " \
>         file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
>         file://0001-meson-add-option-to-set-dbus_interfacedir.patch \
>  "
> -SRCREV =3D "5ac3b8e4bd6fa02651b3c23cedb0a7e1cd769655"
> +SRCREV =3D "965cb9307713c618253918633416fcad86bcc5d2"
>  S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ?=3D ""
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112414): https://lists.openembedded.org/g/openembedde=
d-devel/message/112414
> Mute This Topic: https://lists.openembedded.org/mt/108560569/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

