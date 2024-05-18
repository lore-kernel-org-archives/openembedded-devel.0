Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E31BC25B77
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 20:22:43 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.26395.1716063760783856250
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 May 2024 13:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2RiUOB9;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e716e3030aso8576901fa.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 May 2024 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716063759; x=1716668559; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFMg3FZjf0/kh0J04zudSLjz1amvA8HvOg5LEtJFdSk=;
        b=I2RiUOB9S7dXU6jlUovrXpGNmEGi56HCD51003tenc1fnRaGGJ9JRZowsINaDmlbQU
         48fRBqLYkKksEpY7DJYDqto0c1Db45kJZgfTPwlNMkEqp96j/d8cPsLsapvp55ET47Yz
         ie19zhofqEdouax/ieGIQi5s4PLYTkYKgdnPivDzuvfrpckQunsB3nM0Xj22mJVYxSi3
         lsx9ODrB0lTwcxgKfTBJI9nM8WCXiZIcL8aN7wLJda1F6It57N9lvrprbdtyQtK+g55L
         y9CMy38l8ydqpxb2rqpOGhDP2fcfqlAfRpmbIZGlCPaJeoSryYercxeMaAvgvH0eOMNy
         cD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716063759; x=1716668559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFMg3FZjf0/kh0J04zudSLjz1amvA8HvOg5LEtJFdSk=;
        b=RdeyoQN70CNP+6MgoicFagGYfA6O5numpJj6AaIgKqwAgHGxIWR6mqlZPrl1PIUKB3
         T3R3tj2E43l6UeIj73edTjPGbUWkL+j7LXI1rjv1SAxcwGlp4NuBst1pKuj94VZoS76i
         XVRe5adSr0pKtX9Y+HEN1VXSlXxKBp1/LqGVkqNOj4mXvcC1x2RfUCuZYmhxvmg6PrsJ
         jYp1Qq3IWzf47RdGt5rwMpj3U7yaNRboylcnvhjUeI5YpKYBzPUaRJxbsmUahbrSheV/
         vsfKugZ9cgAKc9QV9YR4QIC40uYA1OIzw3NsbY1w+9NvafPP5VJb3n37AiKjMZVoKHU7
         ZUnA==
X-Gm-Message-State: AOJu0YwiyvGpt6pkmrHFVeYeqjH4XE3IDefPRyaelXnUYay7VDTbjGXs
	0SIPvmYAwW0aALbZKzVxKwXYFROLHEn46kQjD0ZRVzV4J2nmhCn4IN3JjHcgKfwjZsVMtcq10QG
	iqPFEk+mF0CIW1kXUxIcDKTpdSk0=
X-Google-Smtp-Source: AGHT+IHn45yuhD7692gUSArdNt1ii/kdZG7dmy/XuznDtQzLA6pg8ypU+MsdiPSqM6MDoovlehBaa0x6rJ5kt5P+tmc=
X-Received: by 2002:a05:651c:2114:b0:2df:76ab:4e69 with SMTP id
 38308e7fff4ca-2e5205ec99amr174980141fa.46.1716063758571; Sat, 18 May 2024
 13:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240517130700.16442-1-alexandre.truong@smile.fr>
In-Reply-To: <20240517130700.16442-1-alexandre.truong@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 18 May 2024 22:22:26 +0200
Message-ID: <CA+chaQdyBMUhKLbHYbYWRy=yB=Oh+ruarj+_i=azyyyvAB_e6A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] source-han-sans-*-fonts: fix SRC_URI
To: alexandre.truong@smile.fr
Cc: openembedded-devel@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 May 2024 20:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110434

On Fri, May 17, 2024 at 3:07=E2=80=AFPM Alexandre Truong via
lists.openembedded.org
<alexandre.truong=3Dsmile.fr@lists.openembedded.org> wrote:
>
> We get fetch errors from the SRC_URI provided. See errors at [0].
> svn protocol was used but it's deprecated.

For the record the svn protocol itself isn't deprecated in bitbake
fetcher, just github no longer provides a svn access as mentioned in:
https://git.openembedded.org/bitbake/commit/?h=3Dmaster&id=3Da735898abcf056=
f897c9350bb128a5637e6b4617

* github no longer provides support for subversion clients:
https://docs.github.com/en/enterprise-server@3.11/get-started/working-with-=
subversion-on-github/support-for-subversion-clients
it was shut down on 2024-01-08:
https://github.blog/2023-01-20-sunsetting-subversion-support/

> So, a http url will be passed instead.
>
> The sha256sum has also been changed since the previous one was
> for the 1.004 release's archive, while we are on 2.004.
>
> [0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/3=
53/steps/16/logs/errors
>
> Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb            | 7 ++-----
>  .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb            | 7 ++-----
>  .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb            | 7 ++-----
>  .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb            | 7 ++-----
>  4 files changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.00=
4.bb
> index b4a598527..391d46557 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.b=
b
> @@ -11,13 +11,10 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/relea=
se/SubsetOTF/CN;protocol=3Dhttp;rev=3D82 \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansCN.zip;subdir=3D${BP} \
>      file://44-source-han-sans-cn.conf \
>  "
> -SRC_URI[md5sum] =3D "d16abc21f6575bb08894efedbed484a2"
> -SRC_URI[sha256sum] =3D "0a0e1d8e52833bc352d454d8242da03b82c0efc41323fb66=
f7435e5b39734a4f"
> -
> -S =3D "${WORKDIR}/SourceHanSansCN"
> +SRC_URI[sha256sum] =3D "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c07034=
7a2b2b200a1db4d6"
>
>  do_install() {
>      install -d ${D}${sysconfdir}/fonts/conf.d/
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.00=
4.bb
> index 6a4509048..f940478a8 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.b=
b
> @@ -11,13 +11,10 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/relea=
se/SubsetOTF/JP;protocol=3Dhttp;rev=3D82 \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansJP.zip;subdir=3D${BP} \
>      file://44-source-han-sans-jp.conf \
>  "
> -SRC_URI[md5sum] =3D "908fbf97f3df04a6838708c093f1e900"
> -SRC_URI[sha256sum] =3D "dc6dbae3fba35f220bac88ba7130b826c7efe1282f472788=
fae3628b79be3f54"
> -
> -S =3D "${WORKDIR}/SourceHanSansJP"
> +SRC_URI[sha256sum] =3D "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c=
644cf9802750c17e"
>
>  do_install() {
>      install -d ${D}${sysconfdir}/fonts/conf.d/
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.00=
4.bb
> index 5ab5057d8..f536d1b61 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.b=
b
> @@ -11,13 +11,10 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/relea=
se/SubsetOTF/TW;protocol=3Dhttp;rev=3D82 \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansKR.zip;subdir=3D${BP} \
>      file://44-source-han-sans-kr.conf \
>  "
> -SRC_URI[md5sum] =3D "f8d1bd6c87d8575afdb25e2f46bd81d4"
> -SRC_URI[sha256sum] =3D "38fd15c80f9980492faaa1af39ff873d8a38e45027023fb1=
7d5b10d4b4b0e6af"
> -
> -S =3D "${WORKDIR}/SourceHanSansKR"
> +SRC_URI[sha256sum] =3D "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79=
f076f10a6a8f4bfe"
>
>  do_install() {
>      install -d ${D}${sysconfdir}/fonts/conf.d/
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_=
2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.00=
4.bb
> index a2b3fff07..0a4aff5e3 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.b=
b
> +++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.b=
b
> @@ -11,13 +11,10 @@ inherit allarch fontcache
>  #EXCLUDE_FROM_WORLD =3D "1"
>
>  SRC_URI =3D " \
> -    svn://github.com/adobe-fonts/source-han-sans;module=3Dbranches/relea=
se/SubsetOTF/TW;protocol=3Dhttp;rev=3D82 \
> +    https://github.com/adobe-fonts/source-han-sans/releases/download/2.0=
04R/SourceHanSansTW.zip;subdir=3D${BP} \
>      file://44-source-han-sans-tw.conf \
>  "
> -SRC_URI[md5sum] =3D "6533b71b31c19e548768f0fc963202f3"
> -SRC_URI[sha256sum] =3D "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25eb=
4bd4125b5af59fd0"
> -
> -S =3D "${WORKDIR}/SourceHanSansTW"
> +SRC_URI[sha256sum] =3D "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c=
8638e6ba170de806"
>
>  do_install() {
>      install -d ${D}${sysconfdir}/fonts/conf.d/
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110429): https://lists.openembedded.org/g/openembedde=
d-devel/message/110429
> Mute This Topic: https://lists.openembedded.org/mt/106153340/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

