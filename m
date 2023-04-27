Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D541C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:54:14 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.26342.1682614444679986427
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 09:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aCP+gckz;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-38e3228d120so5240841b6e.3
        for <Openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682614444; x=1685206444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20TMLcF0JOTR9kmkFLWuw7V+tDgGV7NkTyB4Ar33Qak=;
        b=aCP+gckzWx9EZSdbNo8b9Ru3BHxwMtDthdTahAeaD34UlxEkM8t2ZGw6+2EraATbQr
         VFQKuPTozDZHNXBAzV9Mud9+lDkaSfrcfCJt2Xyy37Ocy0QAEogq0qpthpAaugIjcqqz
         ot60Vf7vvUPhJXFfalFZ3RyGDy3mmxcKfWnU74evH46+OJsT0cpwvxCd0VTM2Fe50uGN
         fkk9ORg4KRKw7Dx0e19Mjt+Uz92Mo1E40UKxC92J+UNLk4+p4NtIPOXAYO4C4wmBuag/
         GWgWLn59M6f7T84Pq1z6B/8vTBJe3RBILavt28q61SI/3hjoK3iqwp8TgclgSikcM2PY
         iesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682614444; x=1685206444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20TMLcF0JOTR9kmkFLWuw7V+tDgGV7NkTyB4Ar33Qak=;
        b=RaHBz/Rtknfy1G2iG2jVxLTKdebabSfVyYx1vzhorDJdSQE5igdV28fPLf45K0D0T0
         8CKAGa+S0/hulxxiGSsJC8sf89Tw4KAPzBf1AUIB/hwbDry66mKApPOCQmhlkhp49W2G
         yaT06l6yDCOWP380I3MOutau3FOSKXw02ctp/+FVRXkqTwbJzURD3DWUcUAhAEJhZBSh
         JF/adOyopkg9ZJgTZHXWYKsAC5ebeuO8CrZXfPw5zGpSmOnQunPZuNOBeQWnQGedpebp
         Ec1AgsBmQ32FKFt84q7CsWpzKYhjl9LpqdsVEe/CvGc6E1BnZqjS+QYENYMeJm1Zwi8g
         8hpA==
X-Gm-Message-State: AC+VfDyYcnfV/NY40ydGT/J8rKQj2sz4bQku6NluWszZ4q4y84SRui2i
	AQC1zlBG1eB2Wtcwn3in8511P24x7SsSyTZktQY=
X-Google-Smtp-Source: ACHHUZ7UOneaoXp25vTjHB380Wbg9h9tAE4ulkWcfgWTDeljwKCexInvr+io/V4SP2/pT3KXg7txQ5UQM9pCAauv+nc=
X-Received: by 2002:a54:489a:0:b0:38b:7184:f330 with SMTP id
 r26-20020a54489a000000b0038b7184f330mr1121862oic.38.1682614443672; Thu, 27
 Apr 2023 09:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230427164723.863197-1-rs@ti.com>
In-Reply-To: <20230427164723.863197-1-rs@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 09:53:37 -0700
Message-ID: <CAMKF1so-36v9=sJqy+-AN1Y-qSVCgLNTeueci9=Hyy3RSWM9Fw@mail.gmail.com>
Subject: Re: [meta-oe][kirkstone][PATCHv2] glfw: add packageconfig and wayland dependencies
To: rs@ti.com
Cc: afd@ti.com, akuster808@gmail.com, detheridge@ti.com, reatmon@ti.com, 
	denis@denix.org, Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 16:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102217

On Thu, Apr 27, 2023 at 9:47=E2=80=AFAM <rs@ti.com> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> GLFW has the ability to use a wayland backend. This patch adds a config
> for it, but does not enable it by default because it has a dependency on
> extra-cmake-modules which is provided (most commonly) by meta-qt5-extra.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core=
/glfw/glfw_3.3.bb
> index b31bba6b6b..5b0d61241e 100644
> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLFW_BU=
ILD_DOCS=3DOFF"
>
>  CFLAGS +=3D "-fPIC"
>
> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> +DEPENDS =3D "libpng libglu zlib"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> +
> +# upstream considers x11 and wayland backends mutually exclusive and wil=
l
> +# prioritize wayland if it is enabled, but wayland has dependencies that=
 cannot
> +# be satisfied by this layer so it is disabled by default
> +
> +PACKAGECONFIG ??=3D "x11"
> +
> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland wayland-nat=
ive wayland-protocols extra-cmake-modules libxkbcommon"

I wonder if extra-cmake-modules recipe is common enough to live in meta-oe

> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
>
>  COMPATIBLE_HOST:libc-musl =3D "null"
> --
> 2.40.0
>

