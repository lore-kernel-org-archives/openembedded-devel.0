Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028D6C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 18:10:27 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.33306.1744567821231888929
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 11:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g++D46e+;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-31062172698so5281461fa.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744567819; x=1745172619; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVO0dbUR5nLe7HKHGEu4WtNhM/cXQSriHF4WSwo2lig=;
        b=g++D46e+onx+GoMzGtxz9nOm8gInHwvNkSBuJCmMV9SX8ReLCYCZKHFpsYiR714hFg
         JWjdJpoWy4t98RzO1ewFdUZmqru0ngz7n9+EaNGM4Hu1RglRAxqVw1tVTsIKDI8bnRqw
         +4mMFbebVaUtvYFeHTsQqWknyhV3gOLzHGC5xdyuMLua+uUS8fg+JNwfobrtd53IIWGR
         vp2PSqrRHXNklBZOcBYnvqG4corjM7SQBB70sj2rqL4Ktpf58u9lYJ6VYyfbQ/hWP6yP
         4R86Mi7EtbFE/SZU4hESZOugUVVWBiwGo/qUgavNKmOwPQ84VDx1KxtNJX+2rXkYOrUm
         ed5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744567819; x=1745172619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVO0dbUR5nLe7HKHGEu4WtNhM/cXQSriHF4WSwo2lig=;
        b=nzbrH4NQzR9VH3ESTr5sPffKJuaE+DgqswJX/8Wz/X22F2fp6RDQJBOJ4A2scHud7j
         /30JKSWq8YGsIW2d587N9mEx31QrHBQW4G4HgQNGG7chE4UxMkAhrK+3NXMamHqttKSy
         1ko8txE+YX0Pgd9fcZldbKCTUYbTgd0tbZAdRSx+Kf/jl4dK2WqAPp/TVlsg257S3Fnp
         voGLXF5iwQw6i8oVHSu2F4CrGXjMHb+ao/wr9IRoT8MzsEPTzHDl2NjPKR8cPSTjzG9t
         L3dmUCMxGHLstKnQeIZ1UigPsMAG0EvOatENZEOqtTfiGQRyb3tpZkE4VTmxVBV12nxT
         0r6g==
X-Gm-Message-State: AOJu0Ywl3PfH9OfCQ2RZtxmwb59kdNpc0ZsyN/D6zo2pq1xj7uRlzHlX
	RQZSBjcv5cR+sl0K4soJlbYaB1v1eynYQWbTXZwyDKX7kJXdpKH15jFVpGvdImqhiWH7ZSK4apM
	JSfZJzxIDeFkFU0BirvMAdH8iAlA=
X-Gm-Gg: ASbGncvwM4+z7ixi4VOqp3fZRfzb18dgS+WXqb8+fDlwwuZqiLiHTjM4i2cPb9Yzwxs
	DZzp56+qynVvTMdWPWec6Y+m9Aeq0k5b19kKuvbCQkTdXPBfj5ImTXj84+mYNfugblPR2cwJPrs
	MDPeNtoBTHUs+QLRJxzfu9dQRJ
X-Google-Smtp-Source: AGHT+IHH2tNnl4Nl7kllPWHtv0nZLa9MlVJjuiiuidQTHXHURXmyYcSI1UT3Naj5FkDNwoJnGa199WgR0Dh8RFQW8bs=
X-Received: by 2002:a05:651c:985:b0:30d:e104:b67e with SMTP id
 38308e7fff4ca-31049acac64mr22600921fa.41.1744567818770; Sun, 13 Apr 2025
 11:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250413175339.523216-1-akuster808@gmail.com>
In-Reply-To: <20250413175339.523216-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 13 Apr 2025 20:10:07 +0200
X-Gm-Features: ATxdqUGfKTS02J5kgeam48S37LxKtOtYBcuL9LOt9tPgnf4TFz-myjQxCjwaOwk
Message-ID: <CA+chaQcv_PTdYFxYn+x9=Lr6X7+PK0Y5Oih5xtds5Vrqy+_4Kw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][warnascar][PATCH] meta-openemnedded: Add myself as
 warnascar maintainer
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 18:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116835

2 typos in subject.

On Sun, Apr 13, 2025 at 7:53=E2=80=AFPM Armin Kuster via
lists.openembedded.org <akuster808=3Dgmail.com@lists.openembedded.org>
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
> index 78a4429ce2..b073700018 100644
> --- a/meta-filesystems/README.md
> +++ b/meta-filesystems/README.md
> @@ -11,26 +11,26 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: warnascar
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: warnascar
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.openembe=
dded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][warnascar]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-filesystems][PATCH'
> +        --subject-prefix=3D'meta-filesystems][warnascar][PATCH'
>
>
>  Table of Contents
> diff --git a/meta-gnome/README.md b/meta-gnome/README.md
> index fbb0d72476..2a4b630a53 100644
> --- a/meta-gnome/README.md
> +++ b/meta-gnome/README.md
> @@ -3,14 +3,14 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: warnascar
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: warnascar
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome][warnascar]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][warnascar][PATCH'
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
> index 119293a741..685e64413f 100644
> --- a/meta-initramfs/README.md
> +++ b/meta-initramfs/README.md
> @@ -12,19 +12,19 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: warnascar
>
>
>  Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][warnascar]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][warnascar][PATCH'
>
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
> index 235c34331b..150979b836 100644
> --- a/meta-multimedia/README.md
> +++ b/meta-multimedia/README.md
> @@ -1,17 +1,17 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: warnascar
>
>  URI: git://git.openembedded.org/meta-openembedded
>  layers: meta-oe
> -branch: master
> +branch: warnascar
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][warnascar]' in the subject
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][warnascar][PATCH'
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
> index dc549d7582..3641f21449 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-n=
etworking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][warnascar]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-networking][PATCH'
> +        --subject-prefix=3D'meta-networking][warnascar][PATCH'
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
> index c7c14a4507..add5c2fb3f 100644
> --- a/meta-oe/README.md
> +++ b/meta-oe/README.md
> @@ -4,7 +4,7 @@ meta-oe
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: warnascar
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
eta-oe][warnascar]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][PATCH"'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][warnascar][PATCH"'
>
>  You are encouraged to fork the mirror on GitHub https://github.com/opene=
mbedded/meta-openembedded
>  to share your patches, this is preferred for patch sets consisting of mo=
re than one patch.
> @@ -33,4 +33,4 @@ Other services like GitLab, repo.or.cz or self-hosted s=
etups are of course accep
>  'git fetch <remote>' works the same on all of them. We recommend GitHub =
because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
>
> -layer maintainer: Khem Raj <raj.khem@gmail.com>
> +layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-perl/README.md b/meta-perl/README.md
> index 13014b0ff3..f6089dad48 100644
> --- a/meta-perl/README.md
> +++ b/meta-perl/README.md
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: warnascar
>
>  Adding the meta-perl layer to your build
>  ---------------------------------------
> @@ -73,14 +73,13 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> -'[meta-perl]' in the subject.
> +'[meta-perl][warnascar]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][warnascar][PATCH'
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
> index 36c193957c..c91a97c942 100644
> --- a/meta-python/README.md
> +++ b/meta-python/README.md
> @@ -13,11 +13,11 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: warnascar
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: warnascar
>
>  Contributing
>  -------------------------
> @@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so =
please register
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][warnascar]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][PATCH'
> +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][warnascar][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> index d1b743887c..33cd85622b 100644
> --- a/meta-webserver/README.md
> +++ b/meta-webserver/README.md
> @@ -13,13 +13,13 @@ This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
>  subdirectory: meta
> -branch: master
> +branch: warnascar
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: warnascar
>
>
>
> @@ -50,9 +50,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][warnascar]' in the subject.
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +When sending single patches, please using something like:
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-webserver][warnascar][PATCH'
> +
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README.md b/meta-xfce/README.md
> index 3d6158628f..a0592d21d6 100644
> --- a/meta-xfce/README.md
> +++ b/meta-xfce/README.md
> @@ -1,10 +1,10 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: warnascar
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: warnascar
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
eta-xfce][warnascar]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][warnascar][PATCH'
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
> View/Reply Online (#116834): https://lists.openembedded.org/g/openembedde=
d-devel/message/116834
> Mute This Topic: https://lists.openembedded.org/mt/112244712/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

