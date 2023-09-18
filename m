Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D31ACD13DE
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 22:39:59 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.5203.1695076791418182713
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 15:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LCoKOzEu;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5738cb00eebso3296439eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 15:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695076790; x=1695681590; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPJX9ebzbpwJKhTdBXf7B+WGJDdkX/pR+l2J3W5LTEE=;
        b=LCoKOzEuljNskmLasDRWRb/ccDye/J6qjK0S6boZqHtCg76sRk1S1uA4pkxZiPFYsR
         6LQ4/HmB+ZmkRyJwzG2VvwCFazeRcrymHQgFIdV1kirDcGcWmAYECnm1t6gag2kUbMRN
         /DaHuuH+JFmjt5+mHu320M3hRwUP3NL/QnqyCTJGa1NHQZlsnedbTDzFMqZTSQao+ZIR
         ZxJ+4lcBUf+f8Gv07DuFsOuOgBfS88+to++8rqBd3OWr8P+B/JAsVPWHGVcVk+7YGtEO
         /btsib3ws8S6JdsIf42/2mx89H45Yz4LivLwh+7wg573baYkK8OGikyOO//zMM88A2OR
         NTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695076790; x=1695681590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPJX9ebzbpwJKhTdBXf7B+WGJDdkX/pR+l2J3W5LTEE=;
        b=aCSt7QWQhr5YU7puhjE/DmutPcEpJ5ozfWJTh4SY2VddbVcMzPBuoRMIr+flX7C81P
         O3dFOQsP0HFinYAoQ7kXbi1NrkKDIXG7Tx8iwLnJX4TK6LpYHpoqtvMlvitt5x6kaR0m
         rx6da95MHHOhZwO8+Hra9d+pRPC7RE8Ihqb19sA0s5vyeiYr8GMUTteJwL3DZrsup7qH
         RCnBo+Smc0oAGWFKBPYHmfhH8vrrqmVTTkNvZvy1c+y7TDxXvSs6E/dNLEbBYUTCUA82
         pp23cI6mzwTyobTflFwCdmuIEYVvCa6mWRNmwbkm4+cm+nyuYGpJ0KpL1x010sLoLMwc
         amrg==
X-Gm-Message-State: AOJu0YzIkCgce9F819z7QH4zKL1vKh08VqH6mQq4JqLl4dJkAmkBXcTT
	MYZYSAN6DWCKrqx+JdUf4PO5VAWSx2iIKa1Txw4=
X-Google-Smtp-Source: AGHT+IEhPI30Wq9puwoBogNxJjqEYP+lFg0XpchPHl8KZ9xuHJSLuNd5sx96IsoPu8oaWbkQG95dgVYFXV+z9KZ9xQg=
X-Received: by 2002:a05:6870:a119:b0:1b7:2edd:df6d with SMTP id
 m25-20020a056870a11900b001b72edddf6dmr11925793oae.10.1695076790581; Mon, 18
 Sep 2023 15:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230918215156.1920452-1-f_l_k@t-online.de> <20230918215156.1920452-2-f_l_k@t-online.de>
In-Reply-To: <20230918215156.1920452-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Sep 2023 15:39:24 -0700
Message-ID: <CAMKF1sq3nYBUov1xMxmHRKwEDhApx-gbWvxHV9YFXtV2GJPROQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 02/18] gnome-settings-daemon: upgrade
 44.1 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 22:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104946

On Mon, Sep 18, 2023 at 2:52=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-settings-daemon_44.1.bb =3D> gnome-settings-daemon_45.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_44.1.bb =3D> gnome-settings-daemon_45.0.bb} (89%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_44.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-set=
tings-daemon_45.0.bb
> similarity index 89%
> rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_44.1.bb
> rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_45.0.bb
> index 104f4a667..26a7c2ff1 100644
> --- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_44.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_45.0.bb
> @@ -25,7 +25,7 @@ DEPENDS =3D " \
>  REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
>  GIR_MESON_OPTION =3D ""
>
> -SRC_URI[archive.sha256sum] =3D "12653b72d81f151300a47d700ac9410ac1bcce38=
e83f1bdd19cded2932943989"
> +SRC_URI[archive.sha256sum] =3D "bb4dc46950e2a90f38f23225848856d2a7b1b718=
c89d0285ce197b7016bb1dc8"
>
>  PACKAGECONFIG ??=3D " \
>      cups nm \
> @@ -42,5 +42,5 @@ PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=
=3Dfalse,wayland"
>
>  FILES:${PN} +=3D " \
>      ${systemd_user_unitdir} \
> -    /usr/lib/gnome-settings-daemon-44/libgsd.so \
> +    /usr/lib/gnome-settings-daemon-45/libgsd.so \

Like some other gnome recipes maybe we can define gnome_verdir
function and use it here

  def gnome_verdir(v):
  =E2=94=82   return oe.utils.trim_version(v, 1)

then make it

 ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so

>  "
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104929): https://lists.openembedded.org/g/openembedde=
d-devel/message/104929
> Mute This Topic: https://lists.openembedded.org/mt/101444160/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

