Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93110CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 14:47:50 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.21722.1695480462428035348
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 07:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwmc6w2/;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1dcead29b3eso470997fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695480461; x=1696085261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZqTx7pXXmsLPekdK5fPiGRj2IaIWrEbBpXLjPccA2g=;
        b=kwmc6w2/f53QHuXfLPJ/RBjAtj6tCpv1nLg3uWPvI2OjRxitg/u7NL01glTEBhBt7A
         rWEHzj5xXQmVXosMGZIpTUMqkdS5779GXuvhuzQ6hNREyaxTAKRiFV7Ursad6LtAvB7B
         RINUnqnP/L9ja/HcuruPxHz+cRdKErZUeeE2Bh6Q8YrmE+IU8y7aZ6jK/rtrflQiXJZP
         wDmFuaQlujmRv+me0zBYa8Y1rPAmwl0tMg956Q37lLxPEEagB7CTfKnR8KxGWDU1+8PI
         rTaUsdtUwsh5MTKdU/CSWm8qfecs32wlbH9/ARigUNJvy3GEXRD8pInhTlh6FJMre8EY
         YxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695480462; x=1696085262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZqTx7pXXmsLPekdK5fPiGRj2IaIWrEbBpXLjPccA2g=;
        b=HYshuPSNpjNMQFYFmYpOX7x84Cig/divumsoVF302jbV4WESa/H6DjlX3zHrq1A0CC
         2RYD7SyJMI1G1ifBxPpFf6WFsB4AsczEDXqnM9olJ67qmrBwjxHA68ChMXdmD7plEk3t
         QhbRQZsVyggTRtYkzLv7b9FxmLXIR8F8TeWy6ccvNw+X3+jRYVHqeRFlmg1sFEeqBRRV
         Wnf+oPpAkUqvSAQ4T6dgCnJbuwDqMoKNL4G/Ik185GOr6fHIJfjrQ8HSCXo/3M5a0s4r
         Bq79HCL7/UfnFn69T5cvLwE5oeJxBqQil+s1DTXUxWK95zl7lvtK322LqT+o1K9ftiGz
         yIcw==
X-Gm-Message-State: AOJu0YwrtlRuvuPsDxnnuW62o66W9h/fPbvBjLBYWD793ejr/URsycFL
	UJV+a2D5N9rT/DYRhgdpIxv1nBPmF7yejSWD6cjpzwsDs8ghjw==
X-Google-Smtp-Source: AGHT+IFDllzuPDP6I3Hm1nJALDXanSphk8Hqp/y2sG4HJ7ycS8z+M+3DLVjctTqzINMFa+IVxK+uxJi9gFxY4eA6ev0=
X-Received: by 2002:a05:6870:5ba9:b0:1dc:777b:64a with SMTP id
 em41-20020a0568705ba900b001dc777b064amr2621382oab.17.1695480461677; Sat, 23
 Sep 2023 07:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230923012830.3338338-1-f_l_k@t-online.de>
In-Reply-To: <20230923012830.3338338-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Sep 2023 07:47:15 -0700
Message-ID: <CAMKF1sps05_=v1Rt509W8=1JzoRCgx9gemat1QBT5QQFHqghsQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] tepl: Upgrade 6.4.0 -> 6.8.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 14:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105091

conflicting providers for same file I guess

https://errors.yoctoproject.org/Errors/Details/738110/

On Fri, Sep 22, 2023 at 6:28=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-gnome/tepl/{tepl_6.4.0.bb =3D> tepl_6.8.0.bb}     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-gnome/recipes-gnome/tepl/{tepl_6.4.0.bb =3D> tepl_6.8.0.bb} =
(88%)
>
> diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb b/meta-gnome/rec=
ipes-gnome/tepl/tepl_6.8.0.bb
> similarity index 88%
> rename from meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb
> rename to meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> index 1eecfff4b..6c9c36f3e 100644
> --- a/meta-gnome/recipes-gnome/tepl/tepl_6.4.0.bb
> +++ b/meta-gnome/recipes-gnome/tepl/tepl_6.8.0.bb
> @@ -6,8 +6,8 @@ DEPENDS =3D " \
>      gsettings-desktop-schemas \
>      glib-2.0 \
>      gtk+3 \
> -    gtksourceview4 \
> -    amtk \
> +    libgedit-amtk \
> +    libgedit-gtksourceview \
>      libxml2 \
>      uchardet \
>      gtk-doc-native \
> @@ -21,7 +21,7 @@ inherit meson gobject-introspection gettext features_ch=
eck pkgconfig
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>  SRC_URI =3D "git://gitlab.gnome.org/swilmet/tepl;protocol=3Dhttps;branch=
=3Dmain"
> -SRCREV =3D "d1e9cc2e4a0738f68d9002f13724b7239f075844"
> +SRCREV =3D "16ab2567257a053bd957699f89080fafd0999035"
>  S =3D "${WORKDIR}/git"
>
>  # gobject-introspection is mandatory and cannot be configured
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105087): https://lists.openembedded.org/g/openembedde=
d-devel/message/105087
> Mute This Topic: https://lists.openembedded.org/mt/101533595/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

