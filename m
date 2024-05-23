Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F42C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:58:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.10238.1716451093663784648
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 00:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=geicmOx8;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e3e18c24c1so78531381fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716451092; x=1717055892; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nhcGgLqbjd5jmUbRqXCi8PIRihMH0AKyTg9vc8rG/w=;
        b=geicmOx8d2QccNNpoGH5hgi8lByXNGHAAEr9j6qdmZwS93Un18A+c2GwulXP3jtYjZ
         UTF88D6svTLrDYNnCQYoDNh1EEtBpkWrXYBG9ucjstxJcJeILw1DhNeor1fOE0Cf/YOs
         xc0J/p4ZrjLZXOpz0dpTKcOqp7xfkfMTBjrsoxsB1+OZ/sn2tHv1Pe/C7kKg2yDPcEnB
         YdJsS2xWPs2inJ0c8fXPCQ7c6E7/Oai47LHhefRAS/LDGfbr482WGUy1QVGu2QAibncm
         L1kEndbLvocudgQ+oj8qo5nFRfWjAqFEL9NY+7h5vQP/o7+A9nS7aX3iVzBjY57cWhJ9
         0Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451092; x=1717055892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nhcGgLqbjd5jmUbRqXCi8PIRihMH0AKyTg9vc8rG/w=;
        b=BD2sTjqeGG47WKotvwW+pJQRHkZHGZutc4bO/Axg1Dz/SoCkAR8nBK6piN0XUjREFx
         X3HC16dC5RN+dV6DI98W+cE4+wAa0kRQheFi/gEO4unF1682QeRjuOKN29NVlUOAjx2t
         HWnIxzKcmM38pGnlXETeIWK+/B4fTULalWPJ3+au5pBx2NdRVUTMdUD8t67LevW599zd
         RHokpXmPaVP8Rr6KW7ilGCkKVyJYhNkQvyJ10tEy0UjC/TbIdw026XJEZJ7GVucrZW5M
         /z1q+LWmyqPUGLAoMbgG2r6DG3NhDFkwHU/2vaTUPRbmwN6XSHzpa9pnQUyTXWfot1zx
         i3ig==
X-Gm-Message-State: AOJu0YzevyB+W7ajsred1D6v+vapuIHSzW1yyknTvzaM3Jno9cRReBdm
	eCDK1nzJbMXhdtZ/vc1+VihmV7h/YlGjzgZgDNgmzHN54zScuZc8f8q9sHgHU7fKTNizRQlLU0y
	dWPrmkub6dbp8GXtiqgk1BUhp9yfH9A==
X-Google-Smtp-Source: AGHT+IFQy/vrBGUj6aThU28M2zZYB42pyYNNUbqxupOgmHgRTmRIZ5HLZVzoai3Qb6yfXU74L6zqKu+SkcEYnc3/aD8=
X-Received: by 2002:a2e:beaa:0:b0:2df:8387:ab70 with SMTP id
 38308e7fff4ca-2e9495d3fbamr32775101fa.14.1716451091559; Thu, 23 May 2024
 00:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240523075052.8854-1-alexandre.truong@smile.fr>
In-Reply-To: <20240523075052.8854-1-alexandre.truong@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 May 2024 09:57:55 +0200
Message-ID: <CA+chaQetbft86fKv-BLs5QVT4HsW9bXVCvYGSZUTGauSV_MO6g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] source-han-sans-*-fonts: rename downloaded
 files in SRC_URI
To: alexandre.truong@smile.fr
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 07:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110497

I think you can use ${BP} for downloafilename.

On Thu, May 23, 2024 at 9:51=E2=80=AFAM Alexandre Truong via
lists.openembedded.org
<alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
>
> In commit [0], we've switched away from SVN fetcher in SRC_URI.
> The archives downloaded are named SourceHanSans*.zip
> They are named this way regardless of the version 1.004 or 2.004.
> So when the new archives checksums are tested, the fetcher will
> look for the old archives with the same name in the DL_DIR.
> From [1], there are checksum failures due to given checksums not
> matching the ones in DL_DIR. Thus, downloaded archives are renamed
> by adding ${PV} in archive name.
>
> [0]: https://git.openembedded.org/meta-openembedded/commit/?id=3D36a1e36e=
1272ca50e5dba0c4cf25ee3ff8b8f1c9
> [1]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/3=
67/steps/16/logs/errors
>
> Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb                 | 2 +-
>  .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb                 | 2 +-
>  .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb                 | 2 +-
>  .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb                 | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.00=
4.bb
> index 391d46557..f6e1a4c6d 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.b=
b
> @@ -11,7 +11,7 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansCN.zip;subdir=3D${BP} \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansCN.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-c=
n-fonts-${PV}.zip \
>      file://44-source-han-sans-cn.conf \
>  "
>  SRC_URI[sha256sum] =3D "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c07034=
7a2b2b200a1db4d6"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.00=
4.bb
> index f940478a8..9e18921d6 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.b=
b
> @@ -11,7 +11,7 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansJP.zip;subdir=3D${BP} \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansJP.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-j=
p-fonts-${PV}.zip \
>      file://44-source-han-sans-jp.conf \
>  "
>  SRC_URI[sha256sum] =3D "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c=
644cf9802750c17e"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.00=
4.bb
> index f536d1b61..2b79cd762 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.b=
b
> @@ -11,7 +11,7 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansKR.zip;subdir=3D${BP} \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansKR.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-k=
r-fonts-${PV}.zip \
>      file://44-source-han-sans-kr.conf \
>  "
>  SRC_URI[sha256sum] =3D "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79=
f076f10a6a8f4bfe"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.00=
4.bb
> index 0a4aff5e3..303edf3b6 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.b=
b
> @@ -11,7 +11,7 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansTW.zip;subdir=3D${BP} \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansTW.zip;subdir=3D${BP};downloadfilename=3Dsource-han-sans-t=
w-fonts-${PV}.zip \
>      file://44-source-han-sans-tw.conf \
>  "
>  SRC_URI[sha256sum] =3D "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c=
8638e6ba170de806"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110496): https://lists.openembedded.org/g/openembedde=
d-devel/message/110496
> Mute This Topic: https://lists.openembedded.org/mt/106258754/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

