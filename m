Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DDBC27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 07:09:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.21602.1719731369491487280
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 00:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R6KcbeHK;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so1933950e87.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719731368; x=1720336168; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDndODZLTmihHrOysVz6a+vbltMOO48VKttw1G25pRg=;
        b=R6KcbeHKrT7pvpA0mqOOj+qKlpscEDY87SjY4vQF0cVpApXleprO6aON+YPy6qkkb2
         GZAR9Xz9AdLpy7DzNOCbEQZbqeWPjYK6tOAXeoRiBEwrNHUIElKo7Fk7CXudZnMv8Tmi
         gFtuV/btPocgxLO29gPrlUgzHTJ/c5fQpsn2K0EBSTJsYS3SFp9PKxxsNQ/jHLT2dbxf
         cR41Q1iW/3GC4xL7G39puloXHTNbYP8u1UzUYwIw00rY3IsrJMiD2XA7sbgBqSsdML9A
         D5clS6CLY6ySGi2t5mOmuQQdlchUT8tFLOEIceHfm/OY00RvHLQn0dazcPRBoPyypBcy
         +6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719731368; x=1720336168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDndODZLTmihHrOysVz6a+vbltMOO48VKttw1G25pRg=;
        b=FkZ2fGOVKbOcafduUKOV1LPPGpFsAJiZwYcaUtyq/qQZit057RdsJf9PI6wqYzgaTB
         5bf9EfjS1wrKuUzOaPhKX94cGlqcDaoME6xhYRM8Z1zfuz1s5ARQc4Ta7SwZFn3g3KU6
         4C8qtj8C+/wwhxoAegvPjDN7mM6LRARYDwoVzrq9Gmioh++0FBizRA8SIYWOWWcmhcbb
         ldsd5mKhODdjZWc0v02CxLRd78NrGh8x0wcQ4BQI9D1gIOubAmxCYeTTOURQVD90cIQk
         2778+omwBPtuMpgHZ5Jj7Mhn37j2QNkd++36MgEy3wT7u406u1JI7oH8EqWUGFP4SMIU
         w0LQ==
X-Gm-Message-State: AOJu0Yz4bbllNHzfvQ+2/9twyzCPYlW2YskCH6UonXs9ZNSeab72wC4N
	Z/YIq7rMtFlh9gtIsyqwAvcZUusUTGbDLslEs80m9+b8Z2O/e4mK/1gAgr+5sL3Bb/9PKe/VU9d
	1qFe3ziHZGQoIxh9A6WrrqQaielo=
X-Google-Smtp-Source: AGHT+IHRQpRy4Sv+7KLz9mB8FMrKtTxfrB9htbCs1OBsOat4ggUwDhE/nm3dm4RpM6izOu+BJI/gGKcvFC8lB1bJVDg=
X-Received: by 2002:a05:6512:1107:b0:52e:8475:7c2a with SMTP id
 2adb3069b0e04-52e8475c155mr934575e87.15.1719731367279; Sun, 30 Jun 2024
 00:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240629060010.8833-1-f_l_k@t-online.de>
In-Reply-To: <20240629060010.8833-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 30 Jun 2024 09:09:15 +0200
Message-ID: <CA+chaQd=64U=MZXsr5BMwtcsF=AmhMCLPKVULvcoyOCi2UznVw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] flatpak: add PACKAGECONFIG for dconf
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 07:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111163

Is the runtime dependency added automatically in do_package? Or why
didn't you keep it as 4th param in PACKAGECONFIG?

On Sat, Jun 29, 2024 at 7:59=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Disable by default to avoid a requirement for meta-gnome
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
> index 8351e7d65..3c1de93c5 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> @@ -19,7 +19,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
>  DEPENDS =3D " \
>      appstream \
>      bison-native \
> -    dconf \
>      fuse3 \
>      gdk-pixbuf \
>      glib-2.0 \
> @@ -36,7 +35,6 @@ DEPENDS =3D " \
>
>  RDEPENDS:${PN} =3D " \
>      ca-certificates \
> -    dconf \
>      flatpak-xdg-utils \
>      fuse3-utils \
>  "
> @@ -49,6 +47,7 @@ GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
>  GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
>
>  PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
> +PACKAGECONFIG[dconf] =3D "-Ddconf=3Denabled,-Ddconf=3Ddisabled,dconf"
>  PACKAGECONFIG[docbook_docs] =3D "-Ddocbook_docs=3Denabled,-Ddocbook_docs=
=3Ddisabled,xmlto-native"
>  PACKAGECONFIG[man] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-native"
>  PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup-2.4"
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111157): https://lists.openembedded.org/g/openembedde=
d-devel/message/111157
> Mute This Topic: https://lists.openembedded.org/mt/106941795/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

