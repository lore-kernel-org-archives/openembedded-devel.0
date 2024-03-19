Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13219C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 16:59:41 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.21326.1710867574591361394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 09:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mufiqdHN;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-21fed501addso3345911fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710867574; x=1711472374; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcPnv8bQAHm9lEfwAUr4P9VQ4cQ5oQlz3UTRuY4Do8Y=;
        b=mufiqdHNniWdvHKX+XSR9GWvlQHFa+ZDYWthO0BvAukA5CZn7eT9n4Ffq/BPevX9Og
         CvHgZf54m5C5g1EoKoF6IBlZTFhQXdvxK8mElrknioEDfcnW0x0GaOJd9AhNrUARXsE1
         uf5ztU+wn38HRftGS7fVq0I8xHtGWU1mjeBeoRnaM3tpaBJ1EqPYFwF2wsGsgkbHKxqL
         BTevKoxPdL4CaLQwMH9b+LzMiR6c+AYOe9BXuTjPvnBE6fxjZNoxwKt5ogyUSw7wXJzA
         bYQZc6ldESJyiFWMWx6rP3ryuXSisy8oRP8ac3wfsC9cgLbpgrjLT72SrPrxZ/E+z715
         4Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710867574; x=1711472374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcPnv8bQAHm9lEfwAUr4P9VQ4cQ5oQlz3UTRuY4Do8Y=;
        b=IKaFXNlr7jrjlIA65P1IiYOzUl2CsuT8MQoAsC0wZIuOALRHL3ir1ClNsghxlyLNDC
         zyIxENJU0QhQZxmFeo7c6fCHfU7yzGrWu3BeU3CUSm+GUMW7RV240G8k/eUMFfOAxnPo
         7ker/IUhnhPeIn46ZQB493hdQL4PSnEuGwaX9vFOP/YFykgyZ7o9+85jmLoEoL/ap/oz
         214H3K8X+rhYHdEfcMfbC4Vvj0e/1W6aG8oE6oOAouyL4MTfRS/WIhgM4q/sOvWf8dpU
         NwMeKJZZElr26znWwmg8CRWSxT+pBb0BrhYnpL+y0RcpixT6bjFeb8twAn5G7UKaaY10
         wKtw==
X-Gm-Message-State: AOJu0YzRQog0Ccf1L+wx/b3Pg3SwR+gw21cugA1U2r7+f/t8Wz0+bOPt
	QcDtXgQZV3UA7rOm2Pog7obzNkKj8maZS2+rCFGjssccW6+pZL9TWayoJRQY/ystt3sZ+3b3c9k
	LFDFEnrCdEq3PLfs5KfPR9I0bLts=
X-Google-Smtp-Source: AGHT+IGNpSqswow1dQhRpn8/uCqaBLpG4bmZJL4lmaRsGFjI4QH/5cvjvw0FIfA8TaliZAC3n+n+8FjuUw8XsyicS44=
X-Received: by 2002:a05:6870:8893:b0:21f:9f20:31b7 with SMTP id
 m19-20020a056870889300b0021f9f2031b7mr3418760oam.1.1710867573765; Tue, 19 Mar
 2024 09:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240319104318.873991-1-f_l_k@t-online.de>
In-Reply-To: <20240319104318.873991-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Mar 2024 09:59:08 -0700
Message-ID: <CAMKF1sr=13g3gP2O+o_eWe=JoYQ49m9J33SqpV17cbkwCsTCdw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-session: update 45.0 -> 46.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 16:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109479

Hi Markus

Subject seems to indicate that its upgrading 45.0 -> 46.0, however
patch is missing the file move/rename part.

On Tue, Mar 19, 2024 at 3:43=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - consolekit support was removed upstream
> - add PACKAGECONFIG for doc
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gnome-session/gnome-session_46.0.bb           | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
> index ad8912b2c..87117fd17 100644
> --- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
> @@ -4,29 +4,26 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
>
>  DEPENDS =3D " \
>      glib-2.0-native \
> -    libxslt-native \
> -    xmlto-native \
>      xtrans \
>      libice \
>      libsm \
>      virtual/libx11 \
> -    gtk+3 \
>      gnome-desktop \
> -    gsettings-desktop-schemas \
> +    gtk+3 \
>      json-glib \
> +    systemd \
>  "
>
> -
>  inherit gnomebase gettext gsettings upstream-version-is-even features_ch=
eck
>
> -REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
> +REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
>
>  SRC_URI[archive.sha256sum] =3D "c6e1624af6090bc4e1a191fe2268abfa7a8de078=
31ca7a57f217e679bf7b9a54"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', 'consolekit',d)}"
> +PACKAGECONFIG ??=3D ""
>
> -PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue, -Dconsolekit=3Dfalse=
, dbus-glib"
> -PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd_journal=3Dtrue, -=
Dsystemd=3Dfalse -Dsystemd_journal=3Dfalse, systemd"
> +PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
> +PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libxslt=
-native"
>
>  FILES:${PN} +=3D " \
>     ${datadir}/xdg-desktop-portal \
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109478): https://lists.openembedded.org/g/openembedde=
d-devel/message/109478
> Mute This Topic: https://lists.openembedded.org/mt/105021407/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

