Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29629C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 17:28:55 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.27649.1736962125744413334
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 09:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJhJRWMf;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f4ce54feb8so3148584eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 09:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736962125; x=1737566925; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8wPhMXJcuXgMOmRsFR+WymdMbB71lDd2+EpXSMqDTw=;
        b=fJhJRWMfdShSE+iLK7Zf8YRUNqjaqUzdFIyWZodqn5AeW3B4av4IQB6dN8XlWlK4/N
         +NinM1/D4qr1PLyU9mLSIsllBlZDow37CtA7FjXkSNKF4TPnmfJTJjB71Gps1gHdhHXP
         xZYYGmmLLDFzb7bEppcxd+NhfyZ1Dq6C8oDDQhM1VGmmRd4wgK6i5oc4OfrhdFpoPiZb
         qc128SO9WeQoMHR2FWeLaAhJSd8AeDGDMkXXY9mgmoNY9jMNoMyblIDFltOSYUIkvuei
         8gxUFzPbFpdVEKzId/NstoApcD226qkJa7jX1eRkSsWwUlYF/0nxHTCBshjJUJjrR+aZ
         bzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962125; x=1737566925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8wPhMXJcuXgMOmRsFR+WymdMbB71lDd2+EpXSMqDTw=;
        b=MDiTi1NDrYT+Qa7kT2NSsV2jbi7CH6raUfrXE9yc5ib/WS3sAHm2ysdESR3jTQF3q8
         lH/Y7GUPl+t0H9mlRzTdiAKepIETQV+dBzaenKL5Zj4UTi8qIXukbriNg+oEAVcHyark
         Kognwt8LuBs/xRNnm86VmzWYPevqG+RBj0mdp9hpJPNNTgBXJXmIqixRDNqKbWcAggeT
         3fBAwbRgV0y8YX8XrCZePh3o92B4dQQjd2ttANgKhdFJ1pKRHTa4FUINRG0oU65TkKM8
         mCLMZqxAbZqPmciRw7VSHGBQiNdlzKrKDgHOUAX4TKRDsC9PdZwBSonYd3dENhyQKqPl
         JVKA==
X-Gm-Message-State: AOJu0YzgoPLwHGc09FM97HSVt4097ELEt/SuPn7lf+EcAVDL2YD8BFRJ
	J/gSDBCzTfX0gStCW36fN6gvsKnaxHWwIufrPvBMvQzsmJ6yYTVUcBs2UF0782NbBbYLzg+dluH
	hgn5sv3i09mWU5NdEwVeaAZm1bMw=
X-Gm-Gg: ASbGncvxTJnVWhjEaOEqYkaHOcoViNuAobf/q6MTkJqJW+sOrFJQYeUyOm9Y/0Qx0Gv
	VNE3OgepkGzxHYqHNVFS471lpdntNuS5t7JkA
X-Google-Smtp-Source: AGHT+IG4mb3yij0Xh8XJ6fwYlRb+0XJo4Me+DWrl7Mh00KLi2gNcpvEqVwsslREorKqIx1V9O7YSHCXUnciD85NfJKU=
X-Received: by 2002:a05:6871:530f:b0:297:28e3:db63 with SMTP id
 586e51a60fabf-2aa067196b9mr17327009fac.19.1736962124788; Wed, 15 Jan 2025
 09:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20250110212917.1601102-1-f_l_k@t-online.de>
In-Reply-To: <20250110212917.1601102-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jan 2025 09:28:18 -0800
X-Gm-Features: AbW1kvZGojfc-wPotCWn0JetUDf-1dtfkVLhC7Ho4qsXpsTV8AuZNTHCC_M_1cw
Message-ID: <CAMKF1sp7rVdZeK_p9XbO2sP+9ruQH0xU=KgDXRycqcu95WM9oQ@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCHv2] libde265: update 1.0.12 -> 1.0.15
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 17:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114898

fails to build for arm see

https://errors.yoctoproject.org/Errors/Details/840157/

On Fri, Jan 10, 2025 at 1:29=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - dont use autotools-brokensep
> - add PACKAGECONFIG for dec265
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libde265/{libde265_1.0.12.bb =3D> libde265_1.0.15.bb}  | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.12.bb =
=3D> libde265_1.0.15.bb} (72%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> similarity index 72%
> rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.b=
b
> rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> index 3c9f899491..818654bdb0 100644
> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
> @@ -9,13 +9,16 @@ LICENSE_FLAGS =3D "commercial"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D695b556799abb2435c97a113cdca5=
12f"
>
>  SRC_URI =3D "git://github.com/strukturag/libde265.git;branch=3Dmaster;pr=
otocol=3Dhttps"
> -SRCREV =3D "a267c84707ab264928fa9b86de2ee749c48c318c"
> +SRCREV =3D "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
>
>  S =3D "${WORKDIR}/git"
>
> -EXTRA_OECONF =3D "--disable-sherlock265 --disable-dec265"
> +EXTRA_OECONF =3D "--disable-sherlock265"
>
> -inherit autotools-brokensep pkgconfig
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG ?=3D "dec265"
> +PACKAGECONFIG[dec265] =3D "--enable-dec265,--disable-dec265,libsdl2"
>
>  PACKAGES =3D+ "${PN}-tools"
>  FILES:${PN}-tools =3D "${bindir}/*"
> --
> 2.47.1
>

