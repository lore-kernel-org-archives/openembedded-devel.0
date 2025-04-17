Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41690C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 05:05:25 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.1821.1744866315650048371
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 22:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bGVPcZlt;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso3358261fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 22:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744866313; x=1745471113; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jDXn6ep9Fs4/AiIETe1mqBVFkhKtW63aFvW5Oik2TBo=;
        b=bGVPcZltXt4le1aPg2IlZAzVS9kKOJztTZZs5PGlQ4aqVFvfIB9x6f3JopkdU4GW9/
         u0AAe6m9+aitKXmzg1Ca2aoeGCekTRy44gbZVU/1GOtnaVBIYpnQw5bK3d7v4iJFLn07
         fIkzoIlOw6jbtB9k0YU3oRI4A8qSLWwdjR4WVAQrjmo2qzfNkwkDXnwUYrpz+fio55WL
         6qJZCHG0zWmb2USfZABcrNiOriHikdTzxsWg3xXJPRzn3SDyvYJzMclOANVFNCDPqfER
         WpYiktHxinVAQXeMVFar9RHKrTK+g3ht4L6FQYcO24shwxD8Qp0FUcYpQpp+WYk5AIul
         NXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744866313; x=1745471113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDXn6ep9Fs4/AiIETe1mqBVFkhKtW63aFvW5Oik2TBo=;
        b=hi9seN02KyjahNWBmahUiauNxUxjqOyy8UxZbyiPV1db4anaiphHwUvMmKNsBchkqV
         Ky51Sespjuow+piW4zNNJRAKymOF5aII3IKZERDFcrif7u5dAgAirVJkxgmPuVG2mSjJ
         pQnwV5w/QRruueEdwEe9C5hQELZUAt1Cv9GmNJ7ivVvtose8wMpvJ/qYZY9C+i9l1I6D
         IPf6cREK2RanrCHho9Jwxd6wNEeE/miYsqEfW/sus8jOBKl/wI6EbO8gSOBnzkx0jRHL
         g1/uQnV3pfE1u+XGu3NEKVsPZzMBgijSG+8S1Cn9sTt8EmQiUSMsFK4+ntqL/xQTJLjI
         7jkQ==
X-Gm-Message-State: AOJu0YzxrUPDmz9aonQ+5ZALsNaXXayzC2GQJPn9ceFivu7a0TFw7uVa
	RzUIo2JFj/7eGFEJcI6t57uSeTN1EeqkxTJA4t911LNm+ZXGsoZbq0OX5UqgvFCZrpLajGOFUwY
	Q9HWEne2QdlLWlres3Bf0Mrnmf00=
X-Gm-Gg: ASbGncvE5L28BbmdV1b3wCQlniQP80VQQQQaY4Rja6bO6z+qcusIO4Hi9Do4MbPxUrL
	tAnLKPJdnmEFaSM+ZYHMs/o3C4Xs8UQ54LIuRzyrojgMW93n28OIJtF1stB0sbrXBdwgIwWs/WX
	2QXoG5sg9SVAnLIBLiuO7J5Bid1KV4Ss6poFguZ5KpzdmnT2YLst/+K6o=
X-Google-Smtp-Source: AGHT+IFa8lHY3JvaNSCteCt0zqzOebjzcESo2a24bS8VgCjydINBneO7KenVcrXqILd1EHvwUBU+gvQiaN3UP6u6vqU=
X-Received: by 2002:a05:651c:12c1:b0:30b:ed5a:6f3c with SMTP id
 38308e7fff4ca-3107f6bcf91mr14000071fa.10.1744866313006; Wed, 16 Apr 2025
 22:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250417010511.592579-1-akuster808@gmail.com>
In-Reply-To: <20250417010511.592579-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Apr 2025 07:05:01 +0200
X-Gm-Features: ATxdqUGOlZBwQGy_NIABYlNrrEQFEqk0Fbz_ngnQyTno9QDrlN0fX43gJqrDHtU
Message-ID: <CA+chaQdk24dJdXGAbE5znWnhVkmk+=YuLEfqmSBQX_6V3_EyaQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v2][walnascar][PATCH] meta-openemnedded: Add
 myself as walnascar maintainer
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c4833a0632f25832"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 05:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116917

--000000000000c4833a0632f25832
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

there is still a typo in the subject, "embedded"

On Thu, 17 Apr 2025, 03:05 Armin Kuster via lists.openembedded.org,
<akuster808=3Dgmail.com@lists.openembedded.org> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> ---
> V2]
> Fix branch name typos
> ---
>  README.md                   |  2 +-
>  meta-filesystems/README.md  | 10 +++++-----
>  meta-gnome/README.md        | 10 +++++-----
>  meta-initramfs/README.md    |  8 ++++----
>  meta-multimedia/README.md   | 10 +++++-----
>  meta-networking/MAINTAINERS | 11 +++--------
>  meta-networking/README.md   |  8 ++++----
>  meta-oe/README.md           |  8 ++++----
>  meta-perl/README.md         | 11 +++++------
>  meta-python/README.md       | 12 +++++-------
>  meta-webserver/README.md    | 11 +++++++----
>  meta-xfce/README.md         | 11 +++++------
>  12 files changed, 53 insertions(+), 59 deletions(-)
>
> diff --git a/README.md b/README.md
> index 7318f09cdb..82f2e9699a 100644
> --- a/README.md
> +++ b/README.md
> @@ -1,6 +1,6 @@
>  Collection of layers for the OE-core universe
>
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Main layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>  This repository is a collection of layers to suppliment OE-Core
>  with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
> index 78a4429ce2..e31b29c493 100644
> --- a/meta-filesystems/README.md
> +++ b/meta-filesystems/README.md
> @@ -11,26 +11,26 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: walnascar
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: walnascar
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (
> openembedded-devel@lists.openembedded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][walnascar]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-filesystems][PATCH'
> +        --subject-prefix=3D'meta-filesystems][walnascar][PATCH'
>
>
>  Table of Contents
> diff --git a/meta-gnome/README.md b/meta-gnome/README.md
> index fbb0d72476..eacf40e94b 100644
> --- a/meta-gnome/README.md
> +++ b/meta-gnome/README.md
> @@ -3,14 +3,14 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: walnascar
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: walnascar
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-gnome][walnascar]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-gnome][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-gnome][walnascar][PATCH'
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
> index 119293a741..cfde7a3ae9 100644
> --- a/meta-initramfs/README.md
> +++ b/meta-initramfs/README.md
> @@ -12,19 +12,19 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: walnascar
>
>
>  Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][walnascar]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-initramfs][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-initramfs][walnascar][PATCH'
>
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
> index 235c34331b..b8e98d15c8 100644
> --- a/meta-multimedia/README.md
> +++ b/meta-multimedia/README.md
> @@ -1,17 +1,17 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: walnascar
>
>  URI: git://git.openembedded.org/meta-openembedded
>  layers: meta-oe
> -branch: master
> +branch: walnascar
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia]' in the subject
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia][walnascar]' in the subject
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-multimedia][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-multimedia][walnascar][PATCH'
>
>  You are encouraged to fork the mirror on github
> https://github.com/openembedded/meta-openembedded to share your patches,
> this is preferred for patch sets consisting of more than one patch. Other
> services like GitLab, repo.or.cz or self hosted setups are of course
> accepted as well, 'git fetch <remote>' works the same on all of them. We
> recommend github because it is free, easy to use, has been proven to be
> reliable and has a really good web GUI.
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index dc549d7582..41c37b58d0 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,13 +2,13 @@ This file contains a list of maintainers for the
> meta-networking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][walnascar]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-networking][PATCH'
> +        --subject-prefix=3D'meta-networking][walnascar][PATCH'
>
>  You may also contact the maintainers directly.
>
> @@ -26,14 +26,9 @@ Please keep this list in alphabetical order.
>  Maintainers List (try to look for most precise areas first)
>
>  COMMON
> -M:      Khem Raj <raj.khem@gmail.com>
> -M:      "Joe MacDonald (backup)" <joe@deserted.net>
> +M:      Armin Kuster <akuster808@gmail.com>
>  L:      openembedded-devel@lists.openembedded.org
>  Q:      https://patchwork.openembedded.org/project/oe/
>  S:      Maintained
>  F:      conf
>  F:      recipes-*
> -
> -OPENTHREAD
> -M:      Stefan Schmidt <stefan@datenfreihafen.org>
> -F:      recipes-connectivity/openthread/
> diff --git a/meta-networking/README.md b/meta-networking/README.md
> index ab2640618f..ef7933e319 100644
> --- a/meta-networking/README.md
> +++ b/meta-networking/README.md
> @@ -18,21 +18,21 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: Scarthgap
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: Scarthgap
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-python
> -branch: master
> +branch: Scarthgap
>
>  Maintenance
>  -----------
> -Layer maintainers: Khem Raj <raj.khem@gmail.com>
> +Stable Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  Please see the MAINTAINERS file for information on contacting the
> diff --git a/meta-oe/README.md b/meta-oe/README.md
> index c7c14a4507..6bb7e06119 100644
> --- a/meta-oe/README.md
> +++ b/meta-oe/README.md
> @@ -4,7 +4,7 @@ meta-oe
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: walnascar
>
>  luajit recipe requires host compiler to be able to generate 32bit code
> when target is 32bit
>  e.g. arm, so ensure that $CC -m32 is functional on build host, if
> building this recipe, needed
> @@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
>  Ubuntu
>  sudo apt-get install gcc-multilib linux-libc-dev:i386
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe][walnascar]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-oe][PATCH"'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D"meta-oe][walnascar][PATCH"'
>
>  You are encouraged to fork the mirror on GitHub
> https://github.com/openembedded/meta-openembedded
>  to share your patches, this is preferred for patch sets consisting of
> more than one patch.
> @@ -33,4 +33,4 @@ Other services like GitLab, repo.or.cz or self-hosted
> setups are of course accep
>  'git fetch <remote>' works the same on all of them. We recommend GitHub
> because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
>
> -layer maintainer: Khem Raj <raj.khem@gmail.com>
> +layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-perl/README.md b/meta-perl/README.md
> index 13014b0ff3..80e5c84bb7 100644
> --- a/meta-perl/README.md
> +++ b/meta-perl/README.md
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: walnascar
>
>  Adding the meta-perl layer to your build
>  ---------------------------------------
> @@ -73,14 +73,13 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> with
> -'[meta-perl]' in the subject.
> +'[meta-perl][walnascar]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-perl][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-perl][walnascar][PATCH'
>
> -Layer maintainers:
> -    Hongxu Jia <hongxu.jia@windriver.com>
> -    Tim "moto-timo" Orling <ticotimo@gmail.com>
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> +
>
>  License
>  -------
> diff --git a/meta-python/README.md b/meta-python/README.md
> index 36c193957c..bf1ad0874d 100644
> --- a/meta-python/README.md
> +++ b/meta-python/README.md
> @@ -13,11 +13,11 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: walnascar
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: walnascar
>
>  Contributing
>  -------------------------
> @@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so
> please register
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][walnascar]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-python][PATCH'
> +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-python][walnascar][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> index d1b743887c..3c7fd7f827 100644
> --- a/meta-webserver/README.md
> +++ b/meta-webserver/README.md
> @@ -13,13 +13,13 @@ This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
>  subdirectory: meta
> -branch: master
> +branch: walnascar
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: walnascar
>
>
>
> @@ -50,9 +50,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][walnascar]' in the subject.
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +When sending single patches, please using something like:
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-webserver][walnascar][PATCH'
> +
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README.md b/meta-xfce/README.md
> index 3d6158628f..fb577a48fb 100644
> --- a/meta-xfce/README.md
> +++ b/meta-xfce/README.md
> @@ -1,10 +1,10 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: walnascar
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: walnascar
>
>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this
> repository.
>
> @@ -13,10 +13,9 @@ this to local.conf:
>
>  BBMASK =3D "meta-xfce/recipes-multimedia"
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-xfce][walnascar]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-xfce][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3D'meta-xfce][walnascar][PATCH'
>
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116915):
> https://lists.openembedded.org/g/openembedded-devel/message/116915
> Mute This Topic: https://lists.openembedded.org/mt/112306341/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c4833a0632f25832
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">there is still a typo in the subject, &quot;embedded&quot;</=
p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 17 Apr 2025, 03:05 Armin Kuster via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a>, &lt;akuster808=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by=
: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
<br>
---<br>
V2]<br>
Fix branch name typos<br>
---<br>
=C2=A0README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta-filesystems/README.md=C2=A0 | 10 +++++-----<br>
=C2=A0meta-gnome/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
=C2=A0meta-initramfs/README.md=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0meta-multimedia/README.md=C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A0meta-networking/MAINTAINERS | 11 +++--------<br>
=C2=A0meta-networking/README.md=C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0meta-oe/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +=
+++----<br>
=C2=A0meta-perl/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------=
<br>
=C2=A0meta-python/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++-------<br>
=C2=A0meta-webserver/README.md=C2=A0 =C2=A0 | 11 +++++++----<br>
=C2=A0meta-xfce/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++------=
<br>
=C2=A012 files changed, 53 insertions(+), 59 deletions(-)<br>
<br>
diff --git a/README.md b/README.md<br>
index 7318f09cdb..82f2e9699a 100644<br>
--- a/README.md<br>
+++ b/README.md<br>
@@ -1,6 +1,6 @@<br>
=C2=A0Collection of layers for the OE-core universe<br>
<br>
-Main layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
+Main layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
<br>
=C2=A0This repository is a collection of layers to suppliment OE-Core<br>
=C2=A0with additional packages, Each layer have designated maintainer<br>
diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md<br>
index 78a4429ce2..e31b29c493 100644<br>
--- a/meta-filesystems/README.md<br>
+++ b/meta-filesystems/README.md<br>
@@ -11,26 +11,26 @@ This layer depends on:<br>
<br>
=C2=A0 =C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org=
/openembedded-core</a><br>
=C2=A0 =C2=A0layers: meta<br>
-=C2=A0 branch: master<br>
+=C2=A0 branch: walnascar<br>
<br>
=C2=A0 =C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openemb=
edded" rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org=
/meta-openembedded</a><br>
=C2=A0 =C2=A0layers: meta-oe<br>
-=C2=A0 branch: master<br>
+=C2=A0 branch: walnascar<br>
<br>
=C2=A0Patches<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0Please submit any patches against the filesystems layer to the<br>
=C2=A0OpenEmbedded development mailing list (<a href=3D"mailto:openembedded=
-devel@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openemb=
edded-devel@lists.openembedded.org</a>)<br>
-with &#39;[meta-filesystems]&#39; in the subject.<br>
+with &#39;[meta-filesystems][walnascar]&#39; in the subject.<br>
<br>
-Layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
+Layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
<br>
=C2=A0 =C2=A0 git send-email -1 -M \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--to <a href=3D"mailto:openembedded-devel=
@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-=
devel@lists.openembedded.org</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-filesystems][PATC=
H&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-filesystems][waln=
ascar][PATCH&#39;<br>
<br>
<br>
=C2=A0Table of Contents<br>
diff --git a/meta-gnome/README.md b/meta-gnome/README.md<br>
index fbb0d72476..eacf40e94b 100644<br>
--- a/meta-gnome/README.md<br>
+++ b/meta-gnome/README.md<br>
@@ -3,14 +3,14 @@ Dependencies<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/openem=
bedded-core</a><br>
-branch: master<br>
+branch: walnascar<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a><br>
-branch: master<br>
+branch: walnascar<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-gnome]&#39; in the subject&#39;<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-gnome][walnascar]&#39; in the subject&#39;=
<br>
<br>
=C2=A0When sending single patches, please using something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-gnome][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-gnome][walnascar][PATCH&#=
39;<br>
<br>
-Layer maintainer: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">schnitzeltony@gmail.com</a>=
&gt;<br>
+Layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md<br>
index 119293a741..cfde7a3ae9 100644<br>
--- a/meta-initramfs/README.md<br>
+++ b/meta-initramfs/README.md<br>
@@ -12,19 +12,19 @@ Dependencies<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a><br>
-branch: master<br>
+branch: walnascar<br>
<br>
<br>
=C2=A0Maintenance<br>
=C2=A0-----------<br>
<br>
=C2=A0Send patches / pull requests to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-d=
evel@lists.openembedded.org</a><br>
-with &#39;[meta-initramfs]&#39; in the subject.<br>
+with &#39;[meta-initramfs][walnascar]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please using something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-initramfs][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-initramfs][walnascar][PAT=
CH&#39;<br>
<br>
-Interm layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
+Interm layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<b=
r>
<br>
<br>
=C2=A0License<br>
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md<br>
index 235c34331b..b8e98d15c8 100644<br>
--- a/meta-multimedia/README.md<br>
+++ b/meta-multimedia/README.md<br>
@@ -1,17 +1,17 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/openem=
bedded-core</a><br>
-branch: master<br>
+branch: walnascar<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a><br>
=C2=A0layers: meta-oe<br>
-branch: master<br>
+branch: walnascar<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-multimedia]&#39; in the subject<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-multimedia][walnascar]&#39; in the subject=
<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-multimedia][PATCH&#39;<br=
>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-multimedia][walnascar][PA=
TCH&#39;<br>
<br>
=C2=A0You are encouraged to fork the mirror on github <a href=3D"https://gi=
thub.com/openembedded/meta-openembedded" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://github.com/openembedded/meta-openembedded</a> to shar=
e your patches, this is preferred for patch sets consisting of more than on=
e patch. Other services like GitLab, <a href=3D"http://repo.or.cz" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">repo.or.cz</a> or self hosted setup=
s are of course accepted as well, &#39;git fetch &lt;remote&gt;&#39; works =
the same on all of them. We recommend github because it is free, easy to us=
e, has been proven to be reliable and has a really good web GUI.<br>
<br>
-Layer maintainer: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">schnitzeltony@gmail.com</a>=
&gt;<br>
+Layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS<br>
index dc549d7582..41c37b58d0 100644<br>
--- a/meta-networking/MAINTAINERS<br>
+++ b/meta-networking/MAINTAINERS<br>
@@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-net=
working layer.<br>
<br>
=C2=A0Please submit any patches against meta-networking to the OpenEmbedded=
<br>
=C2=A0development mailing list (<a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@l=
ists.openembedded.org</a>) with<br>
-&#39;[meta-networking]&#39; in the subject.<br>
+&#39;[meta-networking][walnascar]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
<br>
=C2=A0 =C2=A0 git send-email -1 -M \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--to <a href=3D"mailto:openembedded-devel=
@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-=
devel@lists.openembedded.org</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-networking][PATCH=
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 --subject-prefix=3D&#39;meta-networking][walna=
scar][PATCH&#39;<br>
<br>
=C2=A0You may also contact the maintainers directly.<br>
<br>
@@ -26,14 +26,9 @@ Please keep this list in alphabetical order.<br>
=C2=A0Maintainers List (try to look for most precise areas first)<br>
<br>
=C2=A0COMMON<br>
-M:=C2=A0 =C2=A0 =C2=A0 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
-M:=C2=A0 =C2=A0 =C2=A0 &quot;Joe MacDonald (backup)&quot; &lt;<a href=3D"m=
ailto:joe@deserted.net" target=3D"_blank" rel=3D"noreferrer">joe@deserted.n=
et</a>&gt;<br>
+M:=C2=A0 =C2=A0 =C2=A0 Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@list=
s.openembedded.org</a><br>
=C2=A0Q:=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://patchwork.openembedded.org/=
project/oe/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchw=
ork.openembedded.org/project/oe/</a><br>
=C2=A0S:=C2=A0 =C2=A0 =C2=A0 Maintained<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0 conf<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0 recipes-*<br>
-<br>
-OPENTHREAD<br>
-M:=C2=A0 =C2=A0 =C2=A0 Stefan Schmidt &lt;<a href=3D"mailto:stefan@datenfr=
eihafen.org" target=3D"_blank" rel=3D"noreferrer">stefan@datenfreihafen.org=
</a>&gt;<br>
-F:=C2=A0 =C2=A0 =C2=A0 recipes-connectivity/openthread/<br>
diff --git a/meta-networking/README.md b/meta-networking/README.md<br>
index ab2640618f..ef7933e319 100644<br>
--- a/meta-networking/README.md<br>
+++ b/meta-networking/README.md<br>
@@ -18,21 +18,21 @@ Dependencies<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/openem=
bedded-core</a><br>
-branch: master<br>
+branch: Scarthgap<br>
<br>
=C2=A0For some recipes, the meta-oe layer is required:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a><br>
=C2=A0subdirectory: meta-oe<br>
-branch: master<br>
+branch: Scarthgap<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a><br>
=C2=A0subdirectory: meta-python<br>
-branch: master<br>
+branch: Scarthgap<br>
<br>
=C2=A0Maintenance<br>
=C2=A0-----------<br>
-Layer maintainers: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
+Stable Layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<b=
r>
<br>
<br>
=C2=A0Please see the MAINTAINERS file for information on contacting the<br>
diff --git a/meta-oe/README.md b/meta-oe/README.md<br>
index c7c14a4507..6bb7e06119 100644<br>
--- a/meta-oe/README.md<br>
+++ b/meta-oe/README.md<br>
@@ -4,7 +4,7 @@ meta-oe<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://github.com/openembedded/openembedded-cor=
e.git" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/openembed=
ded/openembedded-core.git</a><br>
-branch: master<br>
+branch: walnascar <br>
<br>
=C2=A0luajit recipe requires host compiler to be able to generate 32bit cod=
e when target is 32bit<br>
=C2=A0e.g. arm, so ensure that $CC -m32 is functional on build host, if bui=
lding this recipe, needed<br>
@@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc<br>
=C2=A0Ubuntu<br>
=C2=A0sudo apt-get install gcc-multilib linux-libc-dev:i386<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-oe]&#39; in the subject&#39;<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-oe][walnascar]&#39; in the subject&#39;<br=
>
<br>
=C2=A0When sending single patches, please use something like:<br>
-&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@l=
ists.openembedded.org</a> --subject-prefix=3D&quot;meta-oe][PATCH&quot;&#39=
;<br>
+&#39;git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.=
openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@l=
ists.openembedded.org</a> --subject-prefix=3D&quot;meta-oe][walnascar][PATC=
H&quot;&#39;<br>
<br>
=C2=A0You are encouraged to fork the mirror on GitHub <a href=3D"https://gi=
thub.com/openembedded/meta-openembedded" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://github.com/openembedded/meta-openembedded</a><br>
=C2=A0to share your patches, this is preferred for patch sets consisting of=
 more than one patch.<br>
@@ -33,4 +33,4 @@ Other services like GitLab, <a href=3D"http://repo.or.cz"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">repo.or.cz</a> or self-hos=
ted setups are of course accep<br>
=C2=A0&#39;git fetch &lt;remote&gt;&#39; works the same on all of them. We =
recommend GitHub because it is free, easy<br>
=C2=A0to use, has been proven to be reliable and has a really good web GUI.=
<br>
<br>
-layer maintainer: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
+layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
diff --git a/meta-perl/README.md b/meta-perl/README.md<br>
index 13014b0ff3..80e5c84bb7 100644<br>
--- a/meta-perl/README.md<br>
+++ b/meta-perl/README.md<br>
@@ -52,7 +52,7 @@ Dependencies<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0 =C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org=
/openembedded-core</a><br>
-=C2=A0 branch: master<br>
+=C2=A0 branch: walnascar <br>
<br>
=C2=A0Adding the meta-perl layer to your build<br>
=C2=A0---------------------------------------<br>
@@ -73,14 +73,13 @@ Maintenance<br>
=C2=A0-----------<br>
<br>
=C2=A0Send patches / pull requests to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-d=
evel@lists.openembedded.org</a> with<br>
-&#39;[meta-perl]&#39; in the subject.<br>
+&#39;[meta-perl][walnascar]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please using something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-perl][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-perl][walnascar][PATCH&#3=
9;<br>
<br>
-Layer maintainers:<br>
-=C2=A0 =C2=A0 Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank" rel=3D"noreferrer">hongxu.jia@windriver.com</a>&gt;<br>
-=C2=A0 =C2=A0 Tim &quot;moto-timo&quot; Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank" rel=3D"noreferrer">ticotimo@gmail.com</a>&=
gt;<br>
+Layer maintainers: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
+=C2=A0 =C2=A0 <br>
<br>
=C2=A0License<br>
=C2=A0-------<br>
diff --git a/meta-python/README.md b/meta-python/README.md<br>
index 36c193957c..bf1ad0874d 100644<br>
--- a/meta-python/README.md<br>
+++ b/meta-python/README.md<br>
@@ -13,11 +13,11 @@ The meta-python layer depends on:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 URI: git://<a href=3D"http://git.openembedded.o=
rg/openembedded-core" rel=3D"noreferrer noreferrer" target=3D"_blank">git.o=
penembedded.org/openembedded-core</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 layers: meta<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: walnascar<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 URI: git://<a href=3D"http://git.openembedded.o=
rg/meta-openembedded" rel=3D"noreferrer noreferrer" target=3D"_blank">git.o=
penembedded.org/meta-openembedded</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 layers: meta-oe<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: master<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0branch: walnascar<br>
<br>
=C2=A0Contributing<br>
=C2=A0-------------------------<br>
@@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so pl=
ease register<br>
=C2=A0before posting.<br>
<br>
=C2=A0Send pull requests to <a href=3D"mailto:openembedded-devel@lists.open=
embedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists=
.openembedded.org</a> with<br>
-&#39;[meta-python]&#39; in the subject.<br>
+&#39;[meta-python][walnascar]&#39; in the subject.<br>
<br>
=C2=A0When sending single patches, please use something like:<br>
-git send-email -M -1 --to=3D<a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@list=
s.openembedded.org</a> --subject-prefix=3D&#39;meta-python][PATCH&#39;<br>
+git send-email -M -1 --to=3D<a href=3D"mailto:openembedded-devel@lists.ope=
nembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@list=
s.openembedded.org</a> --subject-prefix=3D&#39;meta-python][walnascar][PATC=
H&#39;<br>
<br>
=C2=A0Maintenance<br>
=C2=A0-------------------------<br>
<br>
-Layer maintainers:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Tim &quot;moto-timo&quot; Orling &lt;<a href=
=3D"mailto:TicoTimo@gmail.com" target=3D"_blank" rel=3D"noreferrer">TicoTim=
o@gmail.com</a>&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Derek Straka &lt;<a href=3D"mailto:derek@aster=
ius.io" target=3D"_blank" rel=3D"noreferrer">derek@asterius.io</a>&gt;<br>
+Layer maintainers: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
diff --git a/meta-webserver/README.md b/meta-webserver/README.md<br>
index d1b743887c..3c7fd7f827 100644<br>
--- a/meta-webserver/README.md<br>
+++ b/meta-webserver/README.md<br>
@@ -13,13 +13,13 @@ This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/openem=
bedded-core</a><br>
=C2=A0subdirectory: meta<br>
-branch: master<br>
+branch: walnascar<br>
<br>
=C2=A0For some recipes, the meta-oe layer is required:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a><br>
=C2=A0subdirectory: meta-oe<br>
-branch: master<br>
+branch: walnascar<br>
<br>
<br>
<br>
@@ -50,9 +50,12 @@ Maintenance<br>
=C2=A0-----------<br>
<br>
=C2=A0Send patches / pull requests to <a href=3D"mailto:openembedded-devel@=
lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-d=
evel@lists.openembedded.org</a><br>
-with &#39;[meta-webserver]&#39; in the subject.<br>
+with &#39;[meta-webserver][walnascar]&#39; in the subject.<br>
<br>
-Layer maintainer: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" ta=
rget=3D"_blank" rel=3D"noreferrer">derek@asterius.io</a>&gt;<br>
+When sending single patches, please using something like:<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-webserver][walnascar][PAT=
CH&#39;<br>
+<br>
+Layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
<br>
<br>
=C2=A0License<br>
diff --git a/meta-xfce/README.md b/meta-xfce/README.md<br>
index 3d6158628f..fb577a48fb 100644<br>
--- a/meta-xfce/README.md<br>
+++ b/meta-xfce/README.md<br>
@@ -1,10 +1,10 @@<br>
=C2=A0This layer depends on:<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/openembedded-core" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/openem=
bedded-core</a><br>
-branch: master<br>
+branch: walnascar<br>
<br>
=C2=A0URI: git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/meta-o=
penembedded</a><br>
-branch: master<br>
+branch: walnascar<br>
<br>
=C2=A0meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this =
repository.<br>
<br>
@@ -13,10 +13,9 @@ this to local.conf:<br>
<br>
=C2=A0BBMASK =3D &quot;meta-xfce/recipes-multimedia&quot;<br>
<br>
-Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-xfce]&#39; in the subject&#39;<br>
+Send pull requests to <a href=3D"mailto:openembedded-devel@lists.openembed=
ded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.open=
embedded.org</a> with &#39;[meta-xfce][walnascar]&#39; in the subject&#39;<=
br>
<br>
=C2=A0When sending single patches, please using something like:<br>
-git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-xfce][PATCH&#39;<br>
+git send-email -M -1 --to <a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.=
openembedded.org</a> --subject-prefix=3D&#39;meta-xfce][walnascar][PATCH&#3=
9;<br>
<br>
-Layer maintainer: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" t=
arget=3D"_blank" rel=3D"noreferrer">kai.kang@windriver.com</a>&gt;<br>
-Layer maintainer: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">schnitzeltony@gmail.com</a>=
&gt;<br>
+Layer maintainer: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#116915): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116915" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/116915</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112306341/361=
7156" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/112306341/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c4833a0632f25832--

