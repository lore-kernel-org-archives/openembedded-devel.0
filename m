Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD8FFA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:18:58 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.11886.1666369136445430028
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mw817ls7;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id y72so3757975oia.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIlxOBBBhXA3x8ZdrjZ1B2Sem31n7Ny7eZD4zZNaz8E=;
        b=Mw817ls73L7/9KHpVYKRpLUChBCqgaNHtKEuucDGrWYSCIiFJEGkYBEoXXDk5e0NYW
         JeKzi384kTtYV2pJohD/yeE17nWBBKvGEc+Yropkd8Y9yUOe5zIHpbltJaomUdmQtItO
         uqhz7/zvwNBXfUicV5gJ092mq1LwFCsvPd2rfn05nrD0DHfB0Q5mV7ADQkBQ3NEeIiEh
         V5oakul9O6HTC304OvZ4hTlYSasK5OUCcAeB2lmlzESHHNCBd5NHsyc/pPPd/CXv1RaN
         FeRsKOAvZjorWdU9sI0ALGk69gO+EDOhEeL2x5r5c3s1bY8LHv8TmCMxoZgbF3fGc/fp
         1J0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIlxOBBBhXA3x8ZdrjZ1B2Sem31n7Ny7eZD4zZNaz8E=;
        b=Acpsj4t1PIfrkIuO298VTsnsg9inwzEydEMT1TeSqgRNFzLowCLLhdUB2sjChzCy8P
         G+d2namxKfh41bWIcFMm8lRuIPpLZcabXMbBU2AxxKZHBkohwXSpVC3aMAPJXKMppZ2f
         wVRwgQCrsj+2M+qmenAIQoLl1PxS3uu/SNjBZ9CacKwigpNr7m7X70h89JA+u/y7kdAk
         UOnlsoQnU7ykO0ortkKDG0d15EPwk3eRom/eQ7X5Vu85p6LW8LlvLwptrGQCRri8PGeG
         mgTcfDPVyle78uthBMSa36FIT4T+eQpwueXCnPqHIwdb3nhJ07SbOumGTuvAhGpsnUZw
         PkfQ==
X-Gm-Message-State: ACrzQf2rTHyaVjy6j6s6nZY7aHxVmWcxQHmrE7Y9gXP5EmjBgPPFIDqW
	qRfMoawMW6v0LqKkUta1eRKXq3EHj6KZsALiJucOMJLn
X-Google-Smtp-Source: AMsMyM46Vb6C8NJYdnmtyBUcfkLfW4P1wpZDYxN/vt0OqEDoCdq3TZqOU2WPudN+d1G2kv5EFbm+qL5ipRY/ICQYk6g=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr28991427oae.262.1666369124679; Fri, 21
 Oct 2022 09:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221021122340.20290-1-akuster808@gmail.com>
In-Reply-To: <20221021122340.20290-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 09:18:18 -0700
Message-ID: <CAMKF1spi4o9wKJj5G69HPFzPdcpNNcHVMyHtKUhDOzL28eKcRw@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][langdale][PATCH] meta-openemnedded: Add
 myself as langdale maintainer
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 16:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99254

Thanks Armin, I plan to create the branch today

On Fri, Oct 21, 2022 at 5:23 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
> index 78a4429ce2..344bc441e1 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -11,26 +11,26 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: langdale
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: langdale
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.openembe=
dded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][langdale]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-filesystems][PATCH'
> +        --subject-prefix=3D'meta-filesystems][langdale][PATCH'
>
>
>  Table of Contents
> diff --git a/meta-gnome/README b/meta-gnome/README
> index fbb0d72476..2085c846e0 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -3,14 +3,14 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: langdale
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: langdale
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome][langdale]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-gnome][langdale][PATCH'
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 119293a741..af98c5e4e8 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,19 +12,19 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: langdale
>
>
>  Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][langdale]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-initramfs][langdale][PATCH'
>
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index 235c34331b..9f6df31ecc 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,17 +1,17 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: langdale
>
>  URI: git://git.openembedded.org/meta-openembedded
>  layers: meta-oe
> -branch: master
> +branch: langdale
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][langdale]' in the subject
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-multimedia][langdale][PATCH'
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
> index ce53ec471b..9b5441da85 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta-n=
etworking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][langdale]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3D'meta-networking][PATCH'
> +        --subject-prefix=3D'meta-networking][langdale][PATCH'
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
> index 34e11a96dd..46d60e2811 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -18,22 +18,21 @@ Dependencies
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: langdale
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: langdale
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-python
> -branch: master
> +branch: langdale
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
> index 676a2c8925..57a45f14da 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -4,7 +4,7 @@ meta-oe
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: langdale
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
eta-oe][langdale]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][PATCH"'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3D"meta-oe][langdale][PATCH"'
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
> index 13014b0ff3..01283226d5 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: langdale
>
>  Adding the meta-perl layer to your build
>  ---------------------------------------
> @@ -73,14 +73,13 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> -'[meta-perl]' in the subject.
> +'[meta-perl][langdale]' in the subject.
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-perl][langdale][PATCH'
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
> index 36c193957c..d188471e83 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -13,11 +13,11 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: langdale
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: langdale
>
>  Contributing
>  -------------------------
> @@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, so =
please register
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][langdale]' in the subject.
>
>  When sending single patches, please use something like:
> -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][PATCH'
> +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-python][langdale][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-webserver/README b/meta-webserver/README
> index d23f6cc65c..4a281b8089 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -13,13 +13,13 @@ This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
>  subdirectory: meta
> -branch: master
> +branch: langdale
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://git.openembedded.org/meta-openembedded
>  subdirectory: meta-oe
> -branch: master
> +branch: langdale
>
>
>
> @@ -50,9 +50,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][langdale]' in the subject.
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +When sending single patches, please using something like:
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-webserver][langdale][PATCH'
> +
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 3d6158628f..6eeb0e60e4 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,10 +1,10 @@
>  This layer depends on:
>
>  URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: langdale
>
>  URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: langdale
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
eta-xfce][langdale]' in the subject'
>
>  When sending single patches, please using something like:
> -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][PATCH'
> +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-xfce][langdale][PATCH'
>
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99252): https://lists.openembedded.org/g/openembedded=
-devel/message/99252
> Mute This Topic: https://lists.openembedded.org/mt/94474319/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

