Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7329EC77B61
	for <webhook@archiver.kernel.org>; Sun,  9 Apr 2023 15:55:14 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.22354.1681055705174045716
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Apr 2023 08:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F5+kWwtL;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1842e278605so3614200fac.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Apr 2023 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681055704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9Sd9wSwM12Bc3YoyLScgdKBVNQEfVd0fRK22Xt+GVk=;
        b=F5+kWwtLkfc/DHlH+dWu5wYtdIlRhktgtaYFhaR3vKCkNb1hjBZYfYlQFa9FoWf2/3
         N89ly5nctheM/IqKxWhM/SUSlI8EAvneBhZOeHryXZGtIQtfF4cmrGPNf8DSM2NqYztI
         uQpKs9AzELS29MK4V743yGZtekip5KTlW94jpVLFKlb7KqPE6ZaQDs95oOwTHu//3rcm
         Lid81myQy1TqANd9+Fb7ou2EeoqTCuIDF45jDAE0fuMWLZ94wuSJ4zBifB+ZuNh/MxsI
         CJG4Ja7Y5y+Mm9u37mqGVnrea9+4GaMkXG+4WoOKqa8XTN3H9nP420Xd/jEDI/fdDHKa
         OFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681055704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9Sd9wSwM12Bc3YoyLScgdKBVNQEfVd0fRK22Xt+GVk=;
        b=k933gjN5nJ82iRL/3DXU/g95X2F+9IxmUnamXsetMEucF18Scleubg1ZRHpidVL/sR
         iYRKxi+RdSkOIjPZn0DQmeETX8Xc1XcYUkJZ8w/0D4GW+D4vU7hWY742kBS80icybr3/
         zo5hgeIFL4X5TexQ3FWAKR3jLaFZlNfXDT46SFclZxjIDxYsPN13LhBOA0bFn8NzRFGg
         NVJtfHjf4+Fv3LY24Bzvdmu1SBfAyg82EbWfM1aT7Gm4WbZCFJhLl2BJQiPpl8/72BO7
         YwlI/FiaPDgBOOTCxbIssbCdC4zllvgpmzupZfsgkpN2HbJbcNJCYFH5CqBxVHQRwFid
         6bBQ==
X-Gm-Message-State: AAQBX9f7bLZjhqMw/Qu4Poba7dOuKkjSlqkjrmVWmFdsHJtjdm2qrBP4
	xWGLohzROrc760M+Mxx3wCAj34w6JHKj4zY+vV4=
X-Google-Smtp-Source: AKy350aY+HvJL9oilyevE0EeiPF5vUQIuY44X3rt3RN9meVA0TbnaTeH3qQNCK2f5lHstkNuE4QKWTi4olITQRNoxIo=
X-Received: by 2002:a05:6871:726:b0:183:fc80:7361 with SMTP id
 f38-20020a056871072600b00183fc807361mr3753251oap.4.1681055704126; Sun, 09 Apr
 2023 08:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230409145326.3758691-1-akuster808@gmail.com>
In-Reply-To: <20230409145326.3758691-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Apr 2023 08:54:38 -0700
Message-ID: <CAMKF1so7OdN9W5FK45EEk9NU_LfpRCte=GEbOD0k2ptCWw2Bnw@mail.gmail.com>
Subject: Re: [meta-oe][mickledore][PATCH] meta-openemnedded: Add myself as
 mickledore maintainer
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Apr 2023 15:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101999

Thanks Armin for maintaining the upcoming release. mickledore release
has been branched
and this commit applied.

Thank you
-Khem
On Sun, Apr 9, 2023 at 7:53=E2=80=AFAM Armin Kuster <akuster808@gmail.com> =
wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  README                      |  2 +-
>  meta-filesystems/README     | 10 +++++-----
>  meta-gnome/README           | 10 +++++-----
>  meta-initramfs/README       |  8 ++++----
>  meta-multimedia/README      | 10 +++++-----
>  meta-networking/MAINTAINERS | 15 +++------------
>  meta-networking/README      |  9 ++++-----
>  meta-oe/README              |  8 ++++----
>  meta-perl/README            | 11 +++++------
>  meta-python/README          | 12 +++++-------
>  meta-webserver/README       | 11 +++++++----
>  meta-xfce/README            | 11 +++++------
>  12 files changed, 53 insertions(+), 64 deletions(-)
>
> diff --git a/README b/README
> index 7318f09cdb..82f2e9699a 100644
> --- a/README
> +++ b/README
> @@ -1,6 +1,6 @@
>  Collection of layers for the OE-core universe
>
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Main layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>  This repository is a collection of layers to suppliment OE-Core
>  with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index 78a4429ce2..4cee9dfa00 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -11,26 +11,26 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: mickledore
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: mickledore
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.openembe=
dded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][mickledore]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-filesystems][PATCH'
> +        --subject-prefix=3D'meta-filesystems][mickledore][PATCH'
>
>
>  Table of Contents
> diff --git a/meta-gnome/README b/meta-gnome/README
> index fbb0d72476..418f9ec7b4 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -3,14 +3,14 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: mickledore
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: mickledore
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome][mickledore]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][mickledore][PATCH'
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 119293a741..a2279865fe 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,19 +12,19 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: mickledore
>
>
>  Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][mickledore]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][mickledore][PATCH'
>
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index 235c34331b..28dbaf23c6 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,17 +1,17 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: mickledore
>
>  URI: git://git.openembedded.org/meta-openembedded
>  layers: meta-oe
> -branch: master
> +branch: mickledore
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][mickledore]' in the subject
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][mickledore][PATCH'
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
> index ce53ec471b..4fd0cc3ff6 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-n=
etworking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][mickledore]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-networking][PATCH'
> +        --subject-prefix=3D'meta-networking][mickledore][PATCH'
>
>  You may also contact the maintainers directly.
>
> @@ -26,18 +26,9 @@ Please keep this list in alphabetical order.
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
> -NETKIT
> -M:      Armin Kuster <akuster808@gmail.com>
> -F:      recipes-netkit
> -
> -OPENTHREAD
> -M:      Stefan Schmidt <stefan@datenfreihafen.org>
> -F:      recipes-connectivity/openthread/
> diff --git a/meta-networking/README b/meta-networking/README
> index 34e11a96dd..10884746a7 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -18,22 +18,21 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: mickledore
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: mickledore
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-python
> -branch: master
> +branch: mickledore
>
>  Maintenance
>  -----------
> -Layer maintainers: Khem Raj <raj.khem@gmail.com>
> -                   Armin Kuster <akuster808@gmail.com> (recipes-netkit)
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
>
>
>  Please see the MAINTAINERS file for information on contacting the
> diff --git a/meta-oe/README b/meta-oe/README
> index 676a2c8925..4826efe717 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -4,7 +4,7 @@ meta-oe
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: mickledore
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
eta-oe][mickledore]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][PATCH"'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][mickledore][PATCH"'
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
> diff --git a/meta-perl/README b/meta-perl/README
> index 13014b0ff3..16631503b7 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: mickledore
>
>  Adding the meta-perl layer to your build
>  ---------------------------------------
> @@ -73,14 +73,13 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> -'[meta-perl]' in the subject.
> +'[meta-perl][mickledore]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][mickledore][PATCH'
>
> -Layer maintainers:
> -    Hongxu Jia <hongxu.jia@windriver.com>
> -    Tim "moto-timo" Orling <ticotimo@gmail.com>
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> +
>
>  License
>  -------
> diff --git a/meta-python/README b/meta-python/README
> index 36c193957c..768c94a673 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -13,11 +13,11 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: mickledore
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: mickledore
>
>  Contributing
>  -------------------------
> @@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so =
please register
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][mickledore]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][PATCH'
> +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][mickledore][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-webserver/README b/meta-webserver/README
> index d23f6cc65c..27329fd35b 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -13,13 +13,13 @@ This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
>  subdirectory: meta
> -branch: master
> +branch: mickledore
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: mickledore
>
>
>
> @@ -50,9 +50,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][mickledore]' in the subject.
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +When sending single patches, please using something like:
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-webserver][mickledore][PATCH'
> +
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 3d6158628f..e4fc10b3b2 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,10 +1,10 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: mickledore
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: mickledore
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
eta-xfce][mickledore]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][mickledore][PATCH'
>
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> --
> 2.25.1
>

