Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.166.1613067732961989854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 10:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NB/lPxgl;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d3so4834772qtr.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 10:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EgpYYO9mnBCIfItAARz6lboz7FuBSag8PwbxGmFi4lg=;
        b=NB/lPxglvHIZ02Wmkg1W6xWmL8gFAqNBlWAGy7sFZ1+nhPa9J9DsTAaZmrdeNlNVkG
         mgyrFS3cOK+que/OslmNENeKdqER256nJv0f4xRaPQBY2vW4tPgs8tWZzWguKVBIdOiD
         vtBLLqapuOAmsgwhdmDJQLE34/pIW+WhqEw9o2T9ik+w+t1xV1n+DqhxDqHpbUS9n5GV
         5XKkZ3CXel19x60P+rL7xfeI69ettTFu9sRsfra4uksvosDEb5Byxn2nskEZ7DlOQa+d
         8481MuXMWHLMhcCQZ0+RTO/q6Tp9dn4iVys9ZXLv5uYvdjYMkZRPzjxXRylEuUTuA7LW
         T08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EgpYYO9mnBCIfItAARz6lboz7FuBSag8PwbxGmFi4lg=;
        b=WjLaELyCI0vIUtW5gI1xkIL02YkoYIdziH6yQTWPCr2V2tvePvKcL1q4yN1u5ODgtO
         QZmjTb/u9U3hCxbMNE363zBeLt5YHAAwM+95VUOA297P370O9oNKNkPz12MF0jLSdMW+
         /OSXIxodSmpmdFE0fmgY4fChcdrPsUbtdYZuzQmw/rZ0meUgtXz7yy1uzOBAjkFGG+4S
         Zh1EIChCfsTjXtxjnRzUGGbdi+xFvDQKtQaVtJL1nWMPbfw/wIqDH/LC8hSkO4OoL5n6
         E9Aeerr3HbUEbpLUhdtxXI37UgoLI0rit/VlULbaSa+L0DGGYvq47AKHzY2oA5cCEtYs
         FtDA==
X-Gm-Message-State: AOAM531TBod1qDqFSE5MGgfotJBukHBR2vHyYpE02Ji0CYjSB2h7vHbN
	ZKj2SzJr1lOJM1mSv3NbyrmLlBc5Cd1igfGGq5Y=
X-Google-Smtp-Source: ABdhPJwgNf0zSHy3v54CB0o4glz/WILz74ael+DjP1gbAxdY6q7TqnNWogxIufXKNX+JpBmeiPWtqWp5Nee/NX7xjgU=
X-Received: by 2002:ac8:4b49:: with SMTP id e9mr8635787qts.80.1613067732033;
 Thu, 11 Feb 2021 10:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20210210205538.690009-1-schnitzeltony@gmail.com> <20210210205538.690009-10-schnitzeltony@gmail.com>
In-Reply-To: <20210210205538.690009-10-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Feb 2021 10:21:45 -0800
Message-ID: <CAMKF1spfx3ecwpsXT2QxeZEidy2svTwMmUQ2+g0Lb0G2245doA@mail.gmail.com>
Subject: Re: [oe] [PATCH 10/13] cairomm4: initial add 1.16.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this fails with clang https://errors.yoctoproject.org/Errors/Details/570344=
/
it seems to be finding libboost_unit_test_framework.a on build host,
which is not expected
I wonder if you can reproduce this error when you install boost on
your build host.

On Wed, Feb 10, 2021 at 12:56 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-graphics/cairo/cairomm4_1.16.0.bb    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/cairo/cairomm4_1.16.0.bb
>
> diff --git a/meta-oe/recipes-graphics/cairo/cairomm4_1.16.0.bb b/meta-oe=
/recipes-graphics/cairo/cairomm4_1.16.0.bb
> new file mode 100644
> index 000000000..561962da4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/cairo/cairomm4_1.16.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "C++ bindings for Cairo graphics library"
> +
> +LICENSE =3D "LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f=
54d9"
> +
> +inherit meson
> +
> +BPN =3D "cairomm"
> +
> +DEPENDS =3D "cairo libsigc++-3"
> +
> +SRC_URI =3D "https://www.cairographics.org/releases/${BPN}-${PV}.tar.xz=
"
> +SRC_URI[sha256sum] =3D "7e881492c5f9f546688c31160deb742c166fc4c68b6b8eb=
9920c00a0f0f144f9"
> +
> +FILES_${PN}-dev +=3D "${libdir}/cairomm-*/"
> +
> --
> 2.26.2
>
>
>=20
>
