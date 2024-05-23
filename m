Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D337C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:49:40 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.12293.1716454173221029743
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 01:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HddSsrWs;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e564cad1f1so82565611fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 01:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716454171; x=1717058971; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tlrJ/b1EH3t7oX9tt9urHlpO3u8C9RIf3m5BS7V9rI=;
        b=HddSsrWs5hmj6IJW8PBiKkzIa7SqnloM0kdehFlRbMuvxeND2jmyRU9NND/vuybQpZ
         HgEcH2ForHJbc206/74YkEGow6xNv6hN8HnUQ1T5LxsV9C0Nv4HP/x4+dzZ2Gy5EyfxN
         DCiIrocYGsIQiUgrjBWhtK//URzVp/MPL5jvOzI1nDupVo0aV3VgznxyuGinrQdcGMnQ
         0hBM8in4XaF5zVoIsOJFN7GldY9sVZanqvKSt8GtZ/2PojDtuwE3LOdv3GkSYBMJVaC5
         GEOxQzBO8eOrVEwcbHkDQ5v5TYI4pjXGPipLX+N/uCplxZvWsPnpIpfl9L/Xxos7KeGu
         GE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716454171; x=1717058971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tlrJ/b1EH3t7oX9tt9urHlpO3u8C9RIf3m5BS7V9rI=;
        b=QTD2ybGYE+vwYf9FGdnQYJx3njX2FMRl7HIGqv8iNCvAurMzLV/COcR+e/j+Rfqckp
         Gk+VPEVSaN8oznsjL6ZpQcQ2Y1OvbT8ldcW41PQdxUdCeAW9orZNe29CEjTFjVsfuHMs
         FLFJ1rVTiBiWuJJ/5KLBWtjAedSAPLf/zdgk0fT2Agji8SWlOMPJ5Y8R3iNci308qwXN
         bNTOsyu7yPAGrCO4xApf7ef5jxARajX5PDYziUTJV7USHDAwcLgthnnB/daALEAVSGoa
         b9LBbrIAmd4hmk0DJ49QHHtnikeFVRQ4OyQjqwl1Q2C+f1mjoUVNJ99qinI9vQQTEN9U
         2Q+g==
X-Gm-Message-State: AOJu0YzkxmCZu/MY5PvwBfgyBjhLXD5c/YL/PUiBBMxHAF2BFZVp5gTA
	40wA2LmK7Ae+xIfpOlRvDH+9D/Qwf3ddWVXGK2J6YsfXOrrxkTZHN1BYlW/aA5/zSSKuf1T/Iac
	zkeMOQHGLDgDsa5UuObVTZRHepXI=
X-Google-Smtp-Source: AGHT+IHN8OSpOfX2Ku0bHmWaVBsVb3KTN8hBuMk4sq3sQQGdVHGafeNVetAb7MfaJSTyx5RrhYgogWsetiFcYvWRGcM=
X-Received: by 2002:ac2:46e9:0:b0:51f:52d9:d552 with SMTP id
 2adb3069b0e04-526bf642e1cmr2445998e87.45.1716454170989; Thu, 23 May 2024
 01:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240523083122.17258-1-alexandre.truong@smile.fr>
In-Reply-To: <20240523083122.17258-1-alexandre.truong@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 May 2024 10:49:14 +0200
Message-ID: <CA+chaQfgnV83v4Eh1NkPDbxkUXTv7DnZtSrceD8ZAD7ikQrhag@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] source-han-sans-*-fonts: rename
 downloaded files in SRC_URI
To: alexandre.truong@smile.fr
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 08:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110501

Thanks looks better, it can be simplified further, see:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/ma=
ster&id=3D80fdbf37b3252ed263091fafe6a156655f1a89fb

Please review and if you agree with it, I'll test it and send it for
master-next.

Notice that there is inconsistent use of UNPACKDIR in these recipes
(from master-next) so this will allow us to clean it up a bit in
single .inc file.

On Thu, May 23, 2024 at 10:31=E2=80=AFAM Alexandre Truong via
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
> following their package name and version.
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
> index 391d46557..db4ff4269 100644
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
04R/SourceHanSansCN.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip \
>      file://44-source-han-sans-cn.conf \
>  "
>  SRC_URI[sha256sum] =3D "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c07034=
7a2b2b200a1db4d6"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.00=
4.bb
> index f940478a8..7ece51128 100644
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
04R/SourceHanSansJP.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip \
>      file://44-source-han-sans-jp.conf \
>  "
>  SRC_URI[sha256sum] =3D "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c=
644cf9802750c17e"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.00=
4.bb
> index f536d1b61..0cbe438ef 100644
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
04R/SourceHanSansKR.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip \
>      file://44-source-han-sans-kr.conf \
>  "
>  SRC_URI[sha256sum] =3D "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79=
f076f10a6a8f4bfe"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.00=
4.bb
> index 0a4aff5e3..3b4eeb271 100644
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
04R/SourceHanSansTW.zip;subdir=3D${BP};downloadfilename=3D${BP}.zip \
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
> View/Reply Online (#110500): https://lists.openembedded.org/g/openembedde=
d-devel/message/110500
> Mute This Topic: https://lists.openembedded.org/mt/106258987/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

