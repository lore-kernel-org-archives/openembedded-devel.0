Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1141C47DD9
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 03:11:45 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.7229.1711595495814328933
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 20:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8B6p0tI;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e695b7391dso243497a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 20:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711595495; x=1712200295; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KhRIQaZxHYh55qsSaJwWo6eHlR5Jq91BMt9xoxtQkM=;
        b=J8B6p0tI+rCSuLRlwplxKBAoil+5CpbwqT3tYLQZpu/KCnXnSTnTbijaEviQXKQnYW
         GtOY42pblcdhkn0II4OJtUHWkXMRtXHqWcWemek1+yAj8n/1csBSyeWB2CHY5+d6UaxY
         NesvUa03hPrjXqWhgPHI+YxRZ6KNZdCxbykSC2SBvMumPXq+i0YMSy/2ws9yIWDK6j5Q
         m0EQvvo5wf+r1D1j0iZVAx4wc6pkqeTyz4ILXFW+vmExK0NfHupcsxrGLCHv1/wJTAWh
         uziG6lZhWnfGiR6ETika1enoYhcMVD0VCdL4TdhayfxSUpycjp9RkGVXRdhLhYZ1gOzO
         Vs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711595495; x=1712200295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KhRIQaZxHYh55qsSaJwWo6eHlR5Jq91BMt9xoxtQkM=;
        b=Gn2IrQtuGq4O9uHd+3UTC5uQCGam07ZB/3PEI9pUYbZWZn61QIhmtscgwwURMPlPCv
         uDBeuvYPTol9XrX/d0uTtQqUbBc0BD5k3fd6ujK4W0lo66zvEwmhArsXnw174+eY3ihq
         9omVgoPoTncYv6pai68plUw9naRdyWP0cDOdpES56LsLhzLhvQROogcp/dWrAZ7FkFl/
         0FJc5+nk2tyX0gdX0Cc965HRNxdSiFWKpeOheV7d7p1LEdqmjjsfPaVCdDrPSuzR/o+Z
         3AE40yy1J/+GJN6/hAG37lC6VQvX1ahGfsr3Jeghzzn2M3YJdAIVVm6qzbW+PVKoSjyR
         6fOQ==
X-Gm-Message-State: AOJu0YwqZP2QNFfHl5S/zhUOBMCtwG3Y/m8pVEtJRDAB1R+SVtutIUt8
	0+wiXsnBfjR/DKmJ4jmBamFFjjIVOCJcIKnJa/SzicVfvTzOgM2ahkElauY8UIoGO4s6Q7Fdmo5
	V0fLNibzl73yekIUWlZk/1YYBL8k=
X-Google-Smtp-Source: AGHT+IEVUrs6v0nwRa6hqRwXD07B1WRRZdyWkhYZ3hqPtb3PB13YswTBn9hrpc7EgNOlKH5MxeIlwZ50V28mTpxvbuk=
X-Received: by 2002:a05:6870:17a3:b0:22a:6ce3:d57 with SMTP id
 r35-20020a05687017a300b0022a6ce30d57mr1606969oae.25.1711595494586; Wed, 27
 Mar 2024 20:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240304154540.747063-1-akuster808@gmail.com>
In-Reply-To: <20240304154540.747063-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Mar 2024 20:11:08 -0700
Message-ID: <CAMKF1sp_XwDQVaOwFuy5f5TMXaAwjjtS=druvtyyQJb-yLSdLA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] meta-openemnedded: Add myself as
 scarthgap maintainer
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 03:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109649

Thanks Armin for maintaining upcoming scarthgap release, its an LTS, I
have applied this patch to scarthgap branch now.
its currently in sync with master branch but I expect some
cherry-picks before the final release.

On Mon, Mar 4, 2024 at 7:45=E2=80=AFAM Armin Kuster <akuster808@gmail.com> =
wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
> index 78a4429ce2..bf48806035 100644
> --- a/meta-filesystems/README.md
> +++ b/meta-filesystems/README.md
> @@ -11,26 +11,26 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: scarthgap
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: scarthgap
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.openembe=
dded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][scarthgap]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-filesystems][PATCH'
> +        --subject-prefix=3D'meta-filesystems][scarthgap][PATCH'
>
>
>  Table of Contents
> diff --git a/meta-gnome/README.md b/meta-gnome/README.md
> index fbb0d72476..2125c36df3 100644
> --- a/meta-gnome/README.md
> +++ b/meta-gnome/README.md
> @@ -3,14 +3,14 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: scarthgap
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: scarthgap
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome][scarthgap]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][scarthgap][PATCH'
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
> index 119293a741..da7acfca62 100644
> --- a/meta-initramfs/README.md
> +++ b/meta-initramfs/README.md
> @@ -12,19 +12,19 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: scarthgap
>
>
>  Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][scarthgap]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][scarthgap][PATCH'
>
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
> index 235c34331b..66c139ac9c 100644
> --- a/meta-multimedia/README.md
> +++ b/meta-multimedia/README.md
> @@ -1,17 +1,17 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: scarthgap
>
>  URI: git://git.openembedded.org/meta-openembedded
>  layers: meta-oe
> -branch: master
> +branch: scarthgap
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][scarthgap]' in the subject
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][scarthgap][PATCH'
>
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-openembedded to share your patches, this is preferred for patc=
h sets consisting of more than one patch. Other services like GitLab, repo.=
or.cz or self hosted setups are of course accepted as well, 'git fetch <rem=
ote>' works the same on all of them. We recommend github because it is free=
, easy to use, has been proven to be reliable and has a really good web GUI=
.
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index dc549d7582..a424ab9cdd 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-n=
etworking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][scarthgap]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-networking][PATCH'
> +        --subject-prefix=3D'meta-networking][scarthgap][PATCH'
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
> index 676a2c8925..9bc68a86c7 100644
> --- a/meta-oe/README.md
> +++ b/meta-oe/README.md
> @@ -4,7 +4,7 @@ meta-oe
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: scarthgap
>
>  luajit recipe requires host compiler to be able to generate 32bit code w=
hen target is 32bit
>  e.g. arm, so ensure that $CC -m32 is functional on build host, if buildi=
ng this recipe, needed
> @@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
>  Ubuntu
>  sudo apt-get install gcc-multilib linux-libc-dev:i386
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][scarthgap]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][PATCH"'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][scarthgap][PATCH"'
>
>  You are encouraged to fork the mirror on GitHub https://github.com/opene=
mbedded/meta-openembedded
>  to share your patches, this is preferred for patch sets consisting of mo=
re than one patch.
> @@ -28,4 +28,4 @@ Other services like GitLab, repo.or.cz or self-hosted s=
etups are of course accep
>  'git fetch <remote>' works the same on all of them. We recommend GitHub =
because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
>
> -layer maintainer: Khem Raj <raj.khem@gmail.com>
> +layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-perl/README.md b/meta-perl/README.md
> index 13014b0ff3..4ad9915146 100644
> --- a/meta-perl/README.md
> +++ b/meta-perl/README.md
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: scarthgap
>
>  Adding the meta-perl layer to your build
>  ---------------------------------------
> @@ -73,14 +73,13 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> -'[meta-perl]' in the subject.
> +'[meta-perl][scarthgap]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][scarthgap][PATCH'
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
> index 36c193957c..b29ccf3453 100644
> --- a/meta-python/README.md
> +++ b/meta-python/README.md
> @@ -13,11 +13,11 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: scarthgap
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: scarthgap
>
>  Contributing
>  -------------------------
> @@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so =
please register
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][scarthgap]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][PATCH'
> +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][scarthgap][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> index d1b743887c..caa70acdef 100644
> --- a/meta-webserver/README.md
> +++ b/meta-webserver/README.md
> @@ -13,13 +13,13 @@ This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
>  subdirectory: meta
> -branch: master
> +branch: scarthgap
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: scarthgap
>
>
>
> @@ -50,9 +50,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][scarthgap]' in the subject.
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +When sending single patches, please using something like:
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-webserver][scarthgap][PATCH'
> +
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README.md b/meta-xfce/README.md
> index 3d6158628f..92c2e65584 100644
> --- a/meta-xfce/README.md
> +++ b/meta-xfce/README.md
> @@ -1,10 +1,10 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: scarthgap
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: scarthgap
>
>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this rep=
ository.
>
> @@ -13,10 +13,9 @@ this to local.conf:
>
>  BBMASK =3D "meta-xfce/recipes-multimedia"
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce][scarthgap]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][scarthgap][PATCH'
>
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109098): https://lists.openembedded.org/g/openembedde=
d-devel/message/109098
> Mute This Topic: https://lists.openembedded.org/mt/104724589/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

