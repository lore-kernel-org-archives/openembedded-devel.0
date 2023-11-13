Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FC0C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 22:03:55 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.4519.1699913027454187625
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 14:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPnVzlMO;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1efa01323b4so3105578fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699913026; x=1700517826; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brSg8Ec7VhN0ptlek5yODhMWurlJxRTuEus/IReWUuI=;
        b=VPnVzlMO24A83KaOhYxfNV/ri5G9W6ICKb2IRD452fBLVpGg0Q7Lwcn2kDE0B0aECC
         YUaZ71bfM7roXbDn8O2jYcCsi0wqP2UCTUTyEFHNf/CXV0jayWxu0AuOkHSy+MCkBtne
         baVslvFYS53aRxp5pB9WpGreHC+tm8dOtY/c4qbVZXDEZAeIFaAXHuuvFnCHK7jD8kYh
         cGo4ADZHuZ8dWy/O3/z6ST1ltkPxOXgpNuiHeTTUpk3FVJj3kjhSBwemM8qqMW04oC2h
         XCfM6FpqLO5IZPW2awj1Arixrwm52/0aM4SUlaYhzcmG+UgjBtXFAj9SYiCk1IMI5hJX
         caxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913026; x=1700517826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brSg8Ec7VhN0ptlek5yODhMWurlJxRTuEus/IReWUuI=;
        b=ej7cMiL09/Q+63GNbU1jlhd0FMxIx7Rqm7BF7sgrbUO8hgtnCrWRNOGeGtacVDL+CA
         V2kqgBx0h1AsuPfNKfjiB4l9xDBCkX0NXKmNpzL1RJbjODDKpkvgnOycU1Ohblc9bo2i
         Sz3+E8Zh0wL4LKLn7HK3bJO/+cNOvM5Sd4UvoaRPsoyRQ2x9Zs4YLMduk1A+8wSa5OPI
         j6aGl7MqAPDVhzk8G8jG4YSFXoyQAt6Gk+8eNxMKgyFc4EHGhu2OTqGlkzQywNK1gnhp
         F7r/ykLx7pORxvsn4yQSoF5NM0S4tgzZo8Gtnj6ALnoYlWLe+JBMSMO6R283QoVuyhp7
         9Peg==
X-Gm-Message-State: AOJu0YyiZ1eCzldjjI5yWMVv9PO/lK8M12Yo7vQNCOvVCzKmBexmMFU7
	PnGtLcW4Dp3m9+BugTCQImU4VuSj7fi8OXvbtcE=
X-Google-Smtp-Source: AGHT+IHYHxBB4xcs8F4lCt667HpldKFonJmhlNBDQlq98qt824vp4JKS/dyDfE3r4xi3TZFPQ2yXvIaSRbdFer0fH10=
X-Received: by 2002:a05:6871:203:b0:1e9:af65:5612 with SMTP id
 t3-20020a056871020300b001e9af655612mr9851343oad.42.1699913026572; Mon, 13 Nov
 2023 14:03:46 -0800 (PST)
MIME-Version: 1.0
References: <20231113200954.736200-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231113200954.736200-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Nov 2023 14:03:20 -0800
Message-ID: <CAMKF1sqbkK0nj8+mMYEiZU8Fjg=kVFvSGQ+VfPgn_wsR9CH-8w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gnome-themes-extra: tell gnomebase to use
 autotools build system
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 22:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106683

Already fixed with
https://git.openembedded.org/meta-openembedded/commit/?id=3D84f88138586a64d=
a397e0d940f39e039823b0306

On Mon, Nov 13, 2023 at 12:09=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@gmail=
.com> wrote:
>
> gnome-menus source does not provide meson.build, so switch it back to
> using autotools.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.b=
b b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
> index 227422d90c41..453839358a58 100644
> --- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
> +++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
> @@ -6,6 +6,8 @@ SECTION =3D "x11/gnome"
>  LICENSE =3D "LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
>
> +GNOMEBASEBUILDCLASS =3D "autotools"
> +
>  inherit gnomebase gettext gtk-icon-cache upstream-version-is-even featur=
es_check
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106681): https://lists.openembedded.org/g/openembedde=
d-devel/message/106681
> Mute This Topic: https://lists.openembedded.org/mt/102569873/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

