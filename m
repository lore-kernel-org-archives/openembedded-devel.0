Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE47C30659
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 07:24:34 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.11905.1719559464411057113
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 00:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPcny3x9;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdd893e5cso315538e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719559462; x=1720164262; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZMv1MPWIMgAvi/jepG3YwPBR1Ola8gTMVxvZdEfXA8=;
        b=EPcny3x9X//bo4R8QLN7C6ychEnZDChIdRW6BIYIOqcS1o1nMvWucvpNJctM4b7mXd
         pRo8XQqbxRVafshO2jeX5w67EMbqHtM/39FzMBLMi1lDsIElrQLt4E0i0mhb2dIiAjYn
         +WLeDgrkjz+qWydWJPH0qzQXT4HNaTrUdShCeYJOyhAXcN26LXdv9B6W1faLuIx5J0s0
         NlB9HZ4CAVPh82oQI3WHprQaW8Pd40KQ98A27bV1Qk3HbQbu4LTrHHLW5N4whfb418cZ
         Ks7f6bwilgTXRQT2YEdCSu68JFZY13B4QtwCdY5ZvaNYPoGyC4rni8KF6frqPb8yd4hS
         3UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719559462; x=1720164262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZMv1MPWIMgAvi/jepG3YwPBR1Ola8gTMVxvZdEfXA8=;
        b=oS1YV3kA1rP6RC33Pj0vNr6NUO/8cWQF9KwOT1cKAQyeYlG3XUM2gc0aV5NAraoE3X
         Hm2h5Uc+EUCvj3UGWYEmeMD64E1o1wFz/R1WnBj816yGp36leBQUwOSoocDykQ46A8rx
         IY+Z+CTNO6P3sWBG90dKqNXN+vp4G2amiBcPRnv9STiyy9gEdJT4PN5JBb9CtwwADzNf
         2gtxsNbFbt1eeiJrW89ARLob/u/gONyiSpymngBOoSBE6Q6jNY3+QEiRsDILVjrwqNpT
         z/cZrHudCXwMG7jLLcrgXH3VyGlop3agzncB4QPZ+gamspZiSjYN6sVKP2j+jl0Ng/oU
         iZiw==
X-Gm-Message-State: AOJu0YzeSzgaCHuLgXe66pUsrW5JKKe34KxOxMWNiaFu3ftWIKlN647g
	TKGBZxmkZTgRKVmYxCVBZgp81ertdcxnlHM2jRONBLoHIcm4NF4Q5mzxadJwPtFtH8779NMWHr0
	4ba8XhsJpEVrkdigkkuCba4FX4Nw=
X-Google-Smtp-Source: AGHT+IG6LCxMbjPHfO6x4P+ZgoY7lDnRI7f1G985sGtNN4X+0tk42dYtjfhqdDji9UsfaX/A0DGiBS/FZYzBoIeGE4c=
X-Received: by 2002:a05:6512:3c8e:b0:52c:8e00:486a with SMTP id
 2adb3069b0e04-52cf50fb30emr8756033e87.55.1719559462345; Fri, 28 Jun 2024
 00:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240521164945.333290-1-f_l_k@t-online.de>
In-Reply-To: <20240521164945.333290-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Jun 2024 09:24:10 +0200
Message-ID: <CA+chaQe4am_vJwBgT+zsWMFuxHMbD=zAXvrQOzVjKLuoaqXd7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] flatpak: add PACKAGECONFIG knob for malcontent
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 07:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111144

Hi,

is there some knob for dconf?

It's not caused by this change as dconf dependency was included in the
original flatpak recipe from you:
https://git.openembedded.org/meta-openembedded/commit/?id=3D841daa24d5d0730=
bfa1fdb0dc7898b29061face4
we've recently enabled polkit required by flatpak and now I'm seeing
unsatisfied dependency in world builds.

dconf is only available in meta-gnome while flatpak is in meta-oe and
meta-oe doesn't (and shouldn't) depend on meta-gnome.

Can flatpak and all recipes depending on it (quick grep shows
malcontent-ui, xdg-dbus-proxy, xdg-desktop-portal and pipewire in
meta-multimedia where the flatpak PACKAGECONFIG should be off by
default after the move) be moved to meta-gnome or to dynamic layer for
meta-gnome?

Regards,

On Tue, May 21, 2024 at 6:49=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.8.bb
> index fba7bc49a..8351e7d65 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> @@ -55,6 +55,7 @@ PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup=
-2.4"
>  PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth socat-nat=
ive"
>  PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
>  PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Denabled,-Dseccomp=3Ddisabled,lib=
seccomp"
> +PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Denabled,-Dmalcontent=3Ddis=
abled,malcontent"
>  PACKAGECONFIG[selinux] =3D "-Dselinux_module=3Denabled,-Dselinux_module=
=3Ddisabled,libselinux"
>  PACKAGECONFIG[wayland-security-context] =3D "-Dwayland_security_context=
=3Denabled,-Dwayland_security_context=3Ddisabled,wayland wayland-native way=
land-protocols"
>
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110448): https://lists.openembedded.org/g/openembedde=
d-devel/message/110448
> Mute This Topic: https://lists.openembedded.org/mt/106226893/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

