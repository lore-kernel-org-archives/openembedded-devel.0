Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80DCC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 22:04:04 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.4525.1699913038814973817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 14:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Es5Q4ohN;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1f48ad1700aso2333448fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699913038; x=1700517838; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmEGzgYWSmQ6VlVwQ2AygZLPzap3vz7TPn3u0S2pzYo=;
        b=Es5Q4ohNtMIgp/n02Qh9nVeQ1F2tPdj+PuAcgyqHI0GQLbacNUuxRYIxboyjDd5VfL
         11h3eO2HLQnchv8mzO8M8JLWlB+fCxy9+/IoqzXcypF2vFVDCNm/koTLkPbbM8ETE8Ry
         ImxzrRI4svLF5VoY97vrNURfPIbRg/1nR4M2HREuGgNUbg9YMhACNvDh+2Oro2T4TdqR
         pGpvUMymsHmZUa4iHwp34J9t5Pk9losjsL5M3oLSy7Q16H3sAHplqgaEd03UYLinycpf
         mGK2k9Cce+fL97p5ScB7YmzRvUj7i2RJ6mxQOlAuRVyiAj0pVfOCR7bVZHZJABIEbpl5
         SLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913038; x=1700517838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmEGzgYWSmQ6VlVwQ2AygZLPzap3vz7TPn3u0S2pzYo=;
        b=SqdJyLGsnACeId0wL5cZOKU8AvO9dOTMExCcGRRksXGp0tfMGRosR5BEogEAMuQxt1
         ChSOPt+cA8t7r3XP6JCN7Q+0zgkd7dr4DayKYFZdKp1e7HoDdDZbI07uYc3aT8q4eouE
         9eLmWQMcJgacD81Ykzr0XgqLpnkRz4XGRjKqW38ukCsIN+DThnXgicOIltSbsgvO5Kuc
         6qDu6jl/CJ+z2MNwTjjGTgtoZSZDLb/2zll+I+gjbWrFfvkv6yVViYG0SZjzlFBU07uO
         sksDF669YH9rW3IBTNRzca6SEFsgDRTSR4SRkQ9SZ66UeMYvrdUXiKK8+NVGTK11SUpA
         UI5g==
X-Gm-Message-State: AOJu0YxtmF/4vUJMV1oKEzTBxjkBcD7V+r4wedpfk/piwyG4wq5MEt1R
	U52poCl6vJHAcHeZOXVfazytmeR1D2btGX6MuSIQP/eZxX7pPw==
X-Google-Smtp-Source: AGHT+IFkxolRwZmULUZLnuhSgo8jSrnC2ILGyedM1NFp/dvsxpfoacMCwzInGMn0j0qVTh7mC2mz9bBGVKwfPrKIeEw=
X-Received: by 2002:a05:6870:1712:b0:1e9:6a4e:6b56 with SMTP id
 h18-20020a056870171200b001e96a4e6b56mr458486oae.3.1699913038088; Mon, 13 Nov
 2023 14:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20231113201013.736234-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231113201013.736234-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Nov 2023 14:03:32 -0800
Message-ID: <CAMKF1sp2VL370_i+2R9bnXrcLmEyd2_Fpmz5nMURHNPTJ5CPeA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-menus: tell gnomebase to use
 autotools build system
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 22:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106684

already part of -
https://git.openembedded.org/meta-openembedded/commit/?id=3D84f88138586a64d=
a397e0d940f39e039823b0306

On Mon, Nov 13, 2023 at 12:10=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@gmail=
.com> wrote:
>
> gnome-menus source does not provide meson.build, so switch it back to
> using autotools.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb b=
/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
> index fa162510cb99..d5e5e8575ab1 100644
> --- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263 \
>
>  DEPENDS =3D "glib-2.0"
>
> +GNOMEBASEBUILDCLASS =3D "autotools"
> +
>  inherit gnomebase gettext pkgconfig gobject-introspection upstream-versi=
on-is-even
>
>  SRC_URI[archive.md5sum] =3D "a8fd71fcf31a87fc799d80396a526829"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106682): https://lists.openembedded.org/g/openembedde=
d-devel/message/106682
> Mute This Topic: https://lists.openembedded.org/mt/102569883/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

