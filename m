Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DDEC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 22:23:21 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.105556.1701987796558762366
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 14:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lkra0+gU;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1fb9a22b4a7so874977fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 14:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701987796; x=1702592596; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rF0qeQAxKzkJ4IqfiLK4i0z2hPchsP9l3ZrxTI6KlFk=;
        b=Lkra0+gUxkPt1a0wTvMQ9XHi0jjxT/GY0UA77ffXWbA3n0nKxhijBU9CkGNyaljkEs
         AG+TAJqgmqXQevg22K2rO5muBbQ3snOc0qo4nRW1zrtpN2Xb1rTinj02zWvvIEvuVqzq
         mSaXUaDSzKcSkdTjRX+2udfqkrgMZRnkuRUzYHKhKZo0lZB4GANx7xSSFbodT3LrF4aC
         J+Sw3ac3HFQvwf5ITIy6hBujTxh3oaqaohHQim+KHkYMyKeKXe62DJghXgiQE+CI1ucJ
         k2MLO0MakvNsXxFLBtLWkvQ3YrGqiCc4xHD7O34TLs79xUv4A+Ke1wed02h8iixLzCR1
         0BJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701987796; x=1702592596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF0qeQAxKzkJ4IqfiLK4i0z2hPchsP9l3ZrxTI6KlFk=;
        b=QcZJz6SVOQ8dtLtH4ooSpQLvPVHzhJUPN5TKGshZ/xVmmUUwEaQDw40FmUoQj2dxM9
         x0Bb8OFLaCqT3KYYHuj9MhSwoas78g+a+M0hUBtDMfHpfN+J/xBtXHvZbaxqPPCl8Gjp
         1sjllUPBzHIV4OzY/AJn8zEW5lxFt1+MvX/FTPlkWeAJWyLxjoSQJy9G9S9zqDn0FFT2
         SGQ4wdOeWB2oHxIG9ZViN14fLx03JGzM7Q+vM4E3nGOjUGK6NtaiwLe15ydkPrIa1Hm5
         hGdBBCFOVeY6OCW2qyBHlPw6qa3m3IolGsMErmT0pd7uOkZxns3CkqG/CdZ32deaE09Y
         baYA==
X-Gm-Message-State: AOJu0YzwVBo5hao55ve/vNdLjnpCpRLidFUiPRARDynhwI7UmMY1xXXo
	TBhGrNZOwKb43TO7ujSekGCll79nA8/5dIipueo=
X-Google-Smtp-Source: AGHT+IFHzi4jpPctTvu43raLLUo9lKfJkCq3/8dlaZKHj1qMtclq+4emDxr4U5sRX4UAsS9j/3a/yz+XoX2iBpFxi4s=
X-Received: by 2002:a05:6871:297:b0:1fa:25d8:46a8 with SMTP id
 i23-20020a056871029700b001fa25d846a8mr3675598oae.32.1701987795770; Thu, 07
 Dec 2023 14:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20231206131738.305706-1-alperyasinak1@gmail.com>
In-Reply-To: <20231206131738.305706-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2023 14:22:49 -0800
Message-ID: <CAMKF1so0r8VAwVimJQbp35D8Kg=FMx5wxEkAr-XdQ7Vg_inXcQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] xsetroot: upgrade 1.1.2 -> 1.1.3
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 22:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107291

this fails to build on AB also check the logs here
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3411/step=
s/15/logs/stdio

  | configure: error: Package requirements (xmuu x11 xbitmaps xcursor
xproto >=3D 7.0.25) were not met:
    |-
    | No package 'xmuu' found
    |-
    | Consider adjusting the PKG_CONFIG_PATH environment variable if you
    | installed software in a non-standard prefix.
    |-
    | Alternatively, you may set the environment variables XSETROOT_CFLAGS
    | and XSETROOT_LIBS to avoid the need to call pkg-config.

On Wed, Dec 6, 2023 at 5:17=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> w=
rote:
>
> Changelog:
>
> * gitlab CI: stop requiring Signed-off-by in commits
> * Handle -Wsign-compare warnings
> * Variable scope reductions as recommended by cppcheck
> * Build xz tarballs instead of bzip2
> * CI: add a basic build test
> * Update configure.ac bug URL for gitlab migration
> * Update README for gitlab migration
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  I accidentally used gz instead of xz, I sent v2 to fix it.
>
>  .../xorg-app/{xsetroot_1.1.2.bb =3D> xsetroot_1.1.3.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/xorg-app/{xsetroot_1.1.2.bb =3D> xsetroo=
t_1.1.3.bb} (72%)
>
> diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-o=
e/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
> similarity index 72%
> rename from meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
> rename to meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
> index a9a8acf05..6445c7751 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
> @@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6ea29dbee22324=
787c061f039e0529de"
>
>  DEPENDS +=3D "xbitmaps libxcursor"
>
> -SRC_URI[md5sum] =3D "5fe769c8777a6e873ed1305e4ce2c353"
> -SRC_URI[sha256sum] =3D "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387=
a1d9d05637ae417c"
> +SRC_URI_EXT =3D "xz"
> +SRC_URI[sha256sum] =3D "6081b45a9eb4426e045d259d1e144b32417fb635e5b96aa9=
0647365ac96638d1"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107249): https://lists.openembedded.org/g/openembedde=
d-devel/message/107249
> Mute This Topic: https://lists.openembedded.org/mt/103012095/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

