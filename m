Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78E1C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 15:49:50 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.23566.1683128982963249301
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 08:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KPKnPcT+;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6a5dd070aa1so2129841a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683128982; x=1685720982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYDhAWVrgWE84u07bq+4Q9tauY/YIprLc7koUf7uwQ4=;
        b=KPKnPcT+udzMy7RgEPFrSSCmnhz6Gifz7BGEIkHUykuXqF2Sxf5iSgh3FrOou3/RZg
         xTKjaNS/judjyNbXNr1xwQyamZ1EWUg/XHMOUgbdZGqw2s1+iuO/4hid+57YZ4OVY2F6
         rQr6GuSSlHznGdq0fkeyUBpAygdhPbqGbXn4PZpUZiq6zTZnR8BwJ6OqmV4oLZLf2Ju9
         Hh8g6GUrwsbAOLO2hgnKyoUiajq8m1Adqr7UZx1zOz4Mg0LhVQOGrSKUoSiXDqoIZXR6
         lLrj23EDLnmBFt1NGHRPPqenFuF4EK6lcBfAC3eGGQqcIhggsLEJGxfQuVMtnEeUkk24
         /EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683128982; x=1685720982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYDhAWVrgWE84u07bq+4Q9tauY/YIprLc7koUf7uwQ4=;
        b=Rp/E+OHKsWrFoEJVX6EUoqfyWf8iFBmWlu7qtxpxh7JtPKAzKCJpvyNnJzxYqA0FRe
         W9qaBgP9Qfx9o4ojL52jz+J0jjOXb5k9TitYpozDyZTklbFrghcR/JgmCh0ghJ7K27JC
         4LN485eGc+L9RhPVbBuOlLzKX2CLQbftOY/aQXduPh43Ty0XNfxXv/QrqvKzBZ0S/kKY
         9lsJl8firOoiIaLJtMpcr95rqL8T27UoyYLEGla1zLevTDHqrGfwzXV0V1N82WTNsbmf
         6bP51gfe/3ZY5Fr6Oms5jbvRuY8d6XSa2L7roBq71a5VOezEYSQRKpnjywTEthKWCi/P
         KIoQ==
X-Gm-Message-State: AC+VfDyCMwmjqrOKlmm2+k0eXRG+fRstNBg2v7NsM0atyloIqcvR8rBn
	/9hV44edNV5XqTTOO8Ndv/WbTM97nx3aO/OOTLI=
X-Google-Smtp-Source: ACHHUZ4AfUMpDcp8vL55HdZXYStBxnc4J/HlAMkc9CIlV2y1QJ9cbpdWGeykM4lJt/mLFBwlUQcEUuwItD2M2q6POK0=
X-Received: by 2002:a05:6808:1a17:b0:390:6235:1e77 with SMTP id
 bk23-20020a0568081a1700b0039062351e77mr327442oib.21.1683128982116; Wed, 03
 May 2023 08:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <175B62BB4F7F5F02.4923@lists.openembedded.org> <20230503144741.3909244-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230503144741.3909244-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 May 2023 08:49:16 -0700
Message-ID: <CAMKF1srbxCjf8AabLn0T2WnWdyv-PeyOJcCP_PDQBTyZb94WHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] glfw: respect DISTRO_FEATURES when enabling
 x11 in default PACKAGECONFIG and return it to REQUIRED_DISTRO_FEATURES
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 15:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102290

Thanks Martin for clearing that up.

On Wed, May 3, 2023 at 7:47=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.com=
> wrote:
>
> x11 was recently removed from REQUIRED_DISTRO_FEATURES but it
> should still respect x11 in DISTRO_FEATURES, now this causes:
>
> ERROR: Nothing PROVIDES 'libxi' (but meta-oe/recipes-core/glfw/glfw_3.3.b=
b DEPENDS on or otherwise requires it)
> libxi was skipped: missing required distro feature 'x11' (not in DISTRO_F=
EATURES)
> ERROR: Nothing PROVIDES 'libxinerama' (but meta-oe/recipes-core/glfw/glfw=
_3.3.bb DEPENDS on or otherwise requires it)
> libxinerama was skipped: missing required distro feature 'x11' (not in DI=
STRO_FEATURES)
> ERROR: Nothing PROVIDES 'libxrandr' (but meta-oe/recipes-core/glfw/glfw_3=
.3.bb DEPENDS on or otherwise requires it)
> libxrandr was skipped: missing required distro feature 'x11' (not in DIST=
RO_FEATURES)
> ERROR: Nothing PROVIDES 'libglu' (but meta-oe/recipes-core/glfw/glfw_3.3.=
bb DEPENDS on or otherwise requires it)
> libglu was skipped: missing required distro feature 'x11' (not in DISTRO_=
FEATURES)
> ERROR: Nothing PROVIDES 'libxcursor' (but meta-oe/recipes-core/glfw/glfw_=
3.3.bb DEPENDS on or otherwise requires it)
> libxcursor was skipped: missing required distro feature 'x11' (not in DIS=
TRO_FEATURES)
>
> when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.
>
> REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and ANY_OF_DISTRO_FEATU=
RES by "wayland",
> but the default PACKAGECONFIG doesn't match with that.
>
> Also move libglu to x11 PACKAGECONFIG, because that also has x11
> in REQUIRED_DISTRO_FEATURES.
>
> Return x11 to REQUIRED_DISTRO_FEATURES because even with this change
> it still fails to build without x11 in DISTRO_FEATURES, so until
> wayland support is resolved it does require x11 to build, otherwise fails=
 with:
>
> glfw/3.3+gitAUTOINC+781fbbadb0-r0/recipe-sysroot-native/usr/share/cmake-3=
.25/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
> |   Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-core/glfw/glfw_3.3.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core=
/glfw/glfw_3.3.bb
> index 5b0d61241e..f4d983a6e0 100644
> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> @@ -20,17 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLFW_B=
UILD_DOCS=3DOFF"
>
>  CFLAGS +=3D "-fPIC"
>
> -DEPENDS =3D "libpng libglu zlib"
> -REQUIRED_DISTRO_FEATURES =3D "opengl"
> +DEPENDS =3D "libpng zlib"
> +REQUIRED_DISTRO_FEATURES =3D "opengl x11"
>  ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>
>  # upstream considers x11 and wayland backends mutually exclusive and wil=
l
>  # prioritize wayland if it is enabled, but wayland has dependencies that=
 cannot
>  # be satisfied by this layer so it is disabled by default
>
> -PACKAGECONFIG ??=3D "x11"
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>
>  PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland wayland-nat=
ive wayland-protocols extra-cmake-modules libxkbcommon"
> -PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor libglu"
>
>  COMPATIBLE_HOST:libc-musl =3D "null"
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102288): https://lists.openembedded.org/g/openembedde=
d-devel/message/102288
> Mute This Topic: https://lists.openembedded.org/mt/98663243/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

