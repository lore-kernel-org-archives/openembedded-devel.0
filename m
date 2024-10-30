Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70029D6B6DB
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 21:03:01 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.26402.1730322173457305763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 14:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jq/V9km2;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so2126681fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730322172; x=1730926972; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27mvQNBUzkOP+TX0NBuIX+CsbjJxZvhX8Bl9UXsEigQ=;
        b=jq/V9km2P6paUaygvse+53+3bE1HxzEZcGN+KmVesMgQQYOdF4P+cwn6oCoRdwcb2o
         njZQiaLxI3ln0J2o+47i2r+57nDdLfOEQuCngagXthcGUbBkapAnmsrm8feWy8JWRVCA
         aCI7UwXwXeKSCNxO3AL925z7gWKqWKSA5ZLYqXsol9bn3e0tBiEsYetA8Dik9DgrSMuQ
         DCjHUuyPQBi+XveHt42y49Gq5wWqLhrSB4HQnqOYjioZdPGIDP+p99zXbRlfuz0FaxvS
         TiDF1wXZn22vw6S2SlxCv/6vVSEK+QiteegCZ3n/fqKABim9acR7PqiqFCDEEOXrh8fS
         UHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322172; x=1730926972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27mvQNBUzkOP+TX0NBuIX+CsbjJxZvhX8Bl9UXsEigQ=;
        b=uuPpSBN4E4B77iiQIcXccZ/w5NtXgElWYowAfjEIyjGm1x/zkIcvOaCNy12ZAQWu/j
         vrI1jrztMZJKSI8e2Y9TCylSy3mmEwMCba3ZzBkwiHUkypEoXrQAcD1m/zinr1RaJiNy
         88y/Jrx+7MwX18QE5GsWMCJQWIINCvrTup70y/ZvyXcfmSvmA5NC/l1arfxp350k658n
         0FWQTJ32kW0xNn5heAXjr3HmuuAE3amIp+mpthD9oJVznxiHlapdD1gRZQZNtmX+T0IL
         09MR9ox6AXyWKUp04xYfvp3TNOwy6Wf+QlhNDSOvmxWg7G5rhWcGmXZTsESZGcXLV+PF
         OXCA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Pqn6fE0NLtrF4BHLc2TVr1dGoULOmV/IjeKD9OxvRG0AxJ7y7G+jxwFfdvO2WKc+eX8JOuFMD3NjtLW6XgnSZjc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxkWQWctI/Qfkg3vmYeQtz8/meam2Zy9LYDAWqPxn1an1z3nMOZ
	lkCkULUpQpS0PQTEFdovz/MlTDabHB6h6Cugv4ij6ZhHUaM+bwuB6uJQ+9ps7cMi0PnzRpKHSG7
	dEKguNf0SOIqe6vNUNxd/nTDEo2k=
X-Google-Smtp-Source: AGHT+IHBJq7xWnZwCKgSW2Txu9o0VMiLCvhxrxsCmBMgHpGr9P+UPrH+5ZRRC3tPPf6wZ/kz6ZnI/DhXGNNO7qZKMFY=
X-Received: by 2002:a05:651c:b20:b0:2fa:d4c1:3b71 with SMTP id
 38308e7fff4ca-2fcbdfc6bbcmr84140041fa.19.1730322171271; Wed, 30 Oct 2024
 14:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241030205334.10278-1-brgl@bgdev.pl>
In-Reply-To: <20241030205334.10278-1-brgl@bgdev.pl>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Oct 2024 22:02:37 +0100
Message-ID: <CA+chaQcHWBW-Fkzyi6e2hYiJzQx-cXqaLUJ7d6Jvo_aiZG9Hrg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: selectively enable GObject introspection
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Max Krummenacher <max.oss.09@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 21:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113355

Please use BPN in:
FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"

I could send another separate fix, but then it would conflict with
this one, so probably better if you send v2 with it.

On Wed, Oct 30, 2024 at 9:54=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The oe-core bbclass for GObject introspection sets GI_DATA_ENABLED if
> the relevant distro feature is enabled. That means that it's up to the
> inheriting recipe to disable it if needed.
>
> For libgpiod: we only want to enable it if any of the GLib based
> packages is being generated (GLib bindings, D-Bus daemon or ptest).
>
> This also effectively reverts commit 78a332939f8b (libgpiod_2.2: depend
> on glib-2.0) which indiscriminately pulls in GLib for all packages
> generated by this recipe which feels like shooting a fly with a cannon.
>
> Fixes: 9626e8a2c8f2 ("libgpiod: update to v2.2")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.2.bb
> index 3d9758e27a..25f3734a16 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> @@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1e9a=
20f \
>  "
>
> -DEPENDS +=3D "glib-2.0"
> -
>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
>
>  SRC_URI +=3D "file://gpio-manager.init"
> @@ -61,6 +59,10 @@ python __anonymous() {
>          d.setVar("SYSTEMD_SERVICE:{}-manager".format(pn), "gpio-manager.=
service")
>      else:
>          d.appendVar("EXTRA_OECONF", " --disable-systemd")
> +
> +    # Disable gobject introspection set by the bbclass if we don't want =
it.
> +    if not any(cfg in ["glib", "dbus", "ptest"] for cfg in packageconfig=
):
> +        d.setVar("GI_DATA_ENABLED", "False")
>  }
>
>  UPDATERCPN =3D "${PN}-manager"
> --
> 2.45.2
>

