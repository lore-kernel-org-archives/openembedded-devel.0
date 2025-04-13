Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28D1C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 18:11:36 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.33372.1744567891432278611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 11:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MeqG4qzP;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db2c2c609so38574701fa.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 11:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744567889; x=1745172689; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDIP9Qq0qxVK9TEiDl76Vquqqo3ZiCt2/hoQPvwzZmI=;
        b=MeqG4qzPgSO8seir5ltk6/mYuEeCi4O7u4ykeNW1FDuVRYu0lL7iag/6XmB146JRHJ
         e7ydZbQML3CJapSMFhEa0NI4+ePkWFJCXd01pRCUfhCkXF+su2SqZh/eZURdU6JIw/lk
         Wa4rkV8fpwVd2E07OVGCuWJi3buOheYm74z7AgFCpo6X0E6v4J67l1s+ZPhusWX8xDJE
         m+4ahprPwwYfYhyT5N/gnW8Pn1urO95rZJrdfcruuejT9EBEB/HcaXkpfgz8k52ZvX5S
         P/bnsvWRZ7IZfrEL2oiyY7xUMRz91U7She8qRdNMqj2UUKI/0bxAcwdxjRdsXh5dpntR
         tspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744567889; x=1745172689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDIP9Qq0qxVK9TEiDl76Vquqqo3ZiCt2/hoQPvwzZmI=;
        b=DPf3dBq2yPVn3uXBpOgu8pbEV4vr/oA/8+12aUUSRVqxWXXvVgT87J7Xsh4PK2u8OP
         uhdpllCOYXSrO/uw5ptoClRcWH/KOV4+ukHrnkpLc7usTSxFF3LWfz7qa9LQeV/qO10f
         1fAvoEW3vahXQqOE9S90dmzfO5FNu/GpR8uElZmgsuNGOrmP3CQy0ea8ip8tRnl8u/Jm
         LqLmfT6y6ce2VnMO6iFMedaRVnTjPHQzNmTE6BFXKGxn171RBciyLXDoMG63ox8+SGe3
         HzyUuHZvV4jFhcwlSUn6aODBDOQjE7CyaN2WbGf9+nS6YZ9hYwNB1oXNyxUZrTf6r4hz
         qCHA==
X-Forwarded-Encrypted: i=1; AJvYcCVCfsuCWB9ITZF25TB1jm4MaoTDmGVVIfEzRxMyqA9OTYJbPtsQD0zINcy/Z0lhRpoFELH62lPwHzGn2DJVQ52lClE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YybKYxXcCyLmjU3gYG6S3u8dh3QR6maEAEuBYbbdD1AevXOerCj
	0PkO/8qqSJbhwnRwxBgKXoT2euHxAPHopryztmBPkYBaxOQSOwax4EUObYXU/s0r2CSX0DzwjTu
	NJZeW+MvXeOXahC3aJvus/yi9p5A=
X-Gm-Gg: ASbGncu9FjgUMYb4DQ6D+g6Dypyr+iAg0gMYojXxbiWYw5LefyKwET2BQYf3t03Qptq
	krNpKpvsXYhE6cN//VRkGjP8mB/qlC1cS4dwqoMkAekFz/rlhP/3MDVHCUrDA0IFZWVWcdZlb9V
	FzakmF5BeShGOkGkzlOFvyAjSV
X-Google-Smtp-Source: AGHT+IEzXL42UKw16KESZQtFP3xiweeCXqCTAKGQR7V46dUNr/irebUjVdznrp9bttTq6a8QmWy2v0fjox40tL+YbLI=
X-Received: by 2002:a05:651c:3137:b0:30d:624d:c064 with SMTP id
 38308e7fff4ca-310499f5d60mr29759251fa.10.1744567889296; Sun, 13 Apr 2025
 11:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250413175339.523216-1-akuster808@gmail.com> <1835F330D3E24DB0.25079@lists.openembedded.org>
In-Reply-To: <1835F330D3E24DB0.25079@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 13 Apr 2025 20:11:17 +0200
X-Gm-Features: ATxdqUHuSsDju0ATP7ME5oMpBWA1S3I-UUkRgRWqKyLk0NbMxad5J0MwJzoqXBY
Message-ID: <CA+chaQeXRyOiTiSv9SA4am=rkxKSq9y_O5ZRQoS_fDoz8y32=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][warnascar][PATCH] meta-openemnedded: Add myself as
 warnascar maintainer
To: martin.jansa@gmail.com
Cc: akuster808@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 18:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116836

Not just subject, the branch/release name is incorrect everywhere.

On Sun, Apr 13, 2025 at 8:10=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> 2 typos in subject.
>
> On Sun, Apr 13, 2025 at 7:53=E2=80=AFPM Armin Kuster via
> lists.openembedded.org <akuster808=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  README.md                   |  2 +-
> >  meta-filesystems/README.md  | 10 +++++-----
> >  meta-gnome/README.md        | 10 +++++-----
> >  meta-initramfs/README.md    |  8 ++++----
> >  meta-multimedia/README.md   | 10 +++++-----
> >  meta-networking/MAINTAINERS | 11 +++--------
> >  meta-networking/README.md   |  8 ++++----
> >  meta-oe/README.md           |  8 ++++----
> >  meta-perl/README.md         | 11 +++++------
> >  meta-python/README.md       | 12 +++++-------
> >  meta-webserver/README.md    | 11 +++++++----
> >  meta-xfce/README.md         | 11 +++++------
> >  12 files changed, 53 insertions(+), 59 deletions(-)
> >
> > diff --git a/README.md b/README.md
> > index 7318f09cdb..82f2e9699a 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -1,6 +1,6 @@
> >  Collection of layers for the OE-core universe
> >
> > -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> > +Main layer maintainer: Armin Kuster <akuster808@gmail.com>
> >
> >  This repository is a collection of layers to suppliment OE-Core
> >  with additional packages, Each layer have designated maintainer
> > diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
> > index 78a4429ce2..b073700018 100644
> > --- a/meta-filesystems/README.md
> > +++ b/meta-filesystems/README.md
> > @@ -11,26 +11,26 @@ This layer depends on:
> >
> >    URI: git://git.openembedded.org/openembedded-core
> >    layers: meta
> > -  branch: master
> > +  branch: warnascar
> >
> >    URI: git://git.openembedded.org/meta-openembedded
> >    layers: meta-oe
> > -  branch: master
> > +  branch: warnascar
> >
> >  Patches
> >  =3D=3D=3D=3D=3D=3D=3D
> >
> >  Please submit any patches against the filesystems layer to the
> >  OpenEmbedded development mailing list (openembedded-devel@lists.openem=
bedded.org)
> > -with '[meta-filesystems]' in the subject.
> > +with '[meta-filesystems][warnascar]' in the subject.
> >
> > -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> > +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> >
> >  When sending single patches, please use something like:
> >
> >     git send-email -1 -M \
> >          --to openembedded-devel@lists.openembedded.org \
> > -        --subject-prefix=3D'meta-filesystems][PATCH'
> > +        --subject-prefix=3D'meta-filesystems][warnascar][PATCH'
> >
> >
> >  Table of Contents
> > diff --git a/meta-gnome/README.md b/meta-gnome/README.md
> > index fbb0d72476..2a4b630a53 100644
> > --- a/meta-gnome/README.md
> > +++ b/meta-gnome/README.md
> > @@ -3,14 +3,14 @@ Dependencies
> >  This layer depends on:
> >
> >  URI: git://git.openembedded.org/openembedded-core
> > -branch: master
> > +branch: warnascar
> >
> >  URI: git://git.openembedded.org/meta-openembedded
> > -branch: master
> > +branch: warnascar
> >
> > -Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-gnome]' in the subject'
> > +Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-gnome][warnascar]' in the subject'
> >
> >  When sending single patches, please using something like:
> > -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-gnome][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-gnome][warnascar][PATCH'
> >
> > -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> > diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
> > index 119293a741..685e64413f 100644
> > --- a/meta-initramfs/README.md
> > +++ b/meta-initramfs/README.md
> > @@ -12,19 +12,19 @@ Dependencies
> >  This layer depends on:
> >
> >  URI: git://git.openembedded.org/meta-openembedded
> > -branch: master
> > +branch: warnascar
> >
> >
> >  Maintenance
> >  -----------
> >
> >  Send patches / pull requests to openembedded-devel@lists.openembedded.=
org
> > -with '[meta-initramfs]' in the subject.
> > +with '[meta-initramfs][warnascar]' in the subject.
> >
> >  When sending single patches, please using something like:
> > -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-initramfs][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-initramfs][warnascar][PATCH'
> >
> > -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> > +Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
> >
> >
> >  License
> > diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
> > index 235c34331b..150979b836 100644
> > --- a/meta-multimedia/README.md
> > +++ b/meta-multimedia/README.md
> > @@ -1,17 +1,17 @@
> >  This layer depends on:
> >
> >  URI: git://git.openembedded.org/openembedded-core
> > -branch: master
> > +branch: warnascar
> >
> >  URI: git://git.openembedded.org/meta-openembedded
> >  layers: meta-oe
> > -branch: master
> > +branch: warnascar
> >
> > -Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-multimedia]' in the subject
> > +Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-multimedia][warnascar]' in the subject
> >
> >  When sending single patches, please use something like:
> > -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-multimedia][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-multimedia][warnascar][PATCH'
> >
> >  You are encouraged to fork the mirror on github https://github.com/ope=
nembedded/meta-openembedded to share your patches, this is preferred for pa=
tch sets consisting of more than one patch. Other services like GitLab, rep=
o.or.cz or self hosted setups are of course accepted as well, 'git fetch <r=
emote>' works the same on all of them. We recommend github because it is fr=
ee, easy to use, has been proven to be reliable and has a really good web G=
UI.
> >
> > -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> > diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> > index dc549d7582..3641f21449 100644
> > --- a/meta-networking/MAINTAINERS
> > +++ b/meta-networking/MAINTAINERS
> > @@ -2,13 +2,13 @@ This file contains a list of maintainers for the meta=
-networking layer.
> >
> >  Please submit any patches against meta-networking to the OpenEmbedded
> >  development mailing list (openembedded-devel@lists.openembedded.org) w=
ith
> > -'[meta-networking]' in the subject.
> > +'[meta-networking][warnascar]' in the subject.
> >
> >  When sending single patches, please use something like:
> >
> >     git send-email -1 -M \
> >          --to openembedded-devel@lists.openembedded.org \
> > -        --subject-prefix=3D'meta-networking][PATCH'
> > +        --subject-prefix=3D'meta-networking][warnascar][PATCH'
> >
> >  You may also contact the maintainers directly.
> >
> > @@ -26,14 +26,9 @@ Please keep this list in alphabetical order.
> >  Maintainers List (try to look for most precise areas first)
> >
> >  COMMON
> > -M:      Khem Raj <raj.khem@gmail.com>
> > -M:      "Joe MacDonald (backup)" <joe@deserted.net>
> > +M:      Armin Kuster <akuster808@gmail.com>
> >  L:      openembedded-devel@lists.openembedded.org
> >  Q:      https://patchwork.openembedded.org/project/oe/
> >  S:      Maintained
> >  F:      conf
> >  F:      recipes-*
> > -
> > -OPENTHREAD
> > -M:      Stefan Schmidt <stefan@datenfreihafen.org>
> > -F:      recipes-connectivity/openthread/
> > diff --git a/meta-networking/README.md b/meta-networking/README.md
> > index ab2640618f..ef7933e319 100644
> > --- a/meta-networking/README.md
> > +++ b/meta-networking/README.md
> > @@ -18,21 +18,21 @@ Dependencies
> >  This layer depends on:
> >
> >  URI: git://git.openembedded.org/openembedded-core
> > -branch: master
> > +branch: Scarthgap
> >
> >  For some recipes, the meta-oe layer is required:
> >
> >  URI: git://git.openembedded.org/meta-openembedded
> >  subdirectory: meta-oe
> > -branch: master
> > +branch: Scarthgap
> >
> >  URI: git://git.openembedded.org/meta-openembedded
> >  subdirectory: meta-python
> > -branch: master
> > +branch: Scarthgap
> >
> >  Maintenance
> >  -----------
> > -Layer maintainers: Khem Raj <raj.khem@gmail.com>
> > +Stable Layer maintainer: Armin Kuster <akuster808@gmail.com>
> >
> >
> >  Please see the MAINTAINERS file for information on contacting the
> > diff --git a/meta-oe/README.md b/meta-oe/README.md
> > index c7c14a4507..add5c2fb3f 100644
> > --- a/meta-oe/README.md
> > +++ b/meta-oe/README.md
> > @@ -4,7 +4,7 @@ meta-oe
> >  This layer depends on:
> >
> >  URI: git://github.com/openembedded/openembedded-core.git
> > -branch: master
> > +branch: warnascar
> >
> >  luajit recipe requires host compiler to be able to generate 32bit code=
 when target is 32bit
> >  e.g. arm, so ensure that $CC -m32 is functional on build host, if buil=
ding this recipe, needed
> > @@ -16,10 +16,10 @@ pacman -S lib32-gcc-libs lib32-glibc
> >  Ubuntu
> >  sudo apt-get install gcc-multilib linux-libc-dev:i386
> >
> > -Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-oe]' in the subject'
> > +Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-oe][warnascar]' in the subject'
> >
> >  When sending single patches, please use something like:
> > -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org -=
-subject-prefix=3D"meta-oe][PATCH"'
> > +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org -=
-subject-prefix=3D"meta-oe][warnascar][PATCH"'
> >
> >  You are encouraged to fork the mirror on GitHub https://github.com/ope=
nembedded/meta-openembedded
> >  to share your patches, this is preferred for patch sets consisting of =
more than one patch.
> > @@ -33,4 +33,4 @@ Other services like GitLab, repo.or.cz or self-hosted=
 setups are of course accep
> >  'git fetch <remote>' works the same on all of them. We recommend GitHu=
b because it is free, easy
> >  to use, has been proven to be reliable and has a really good web GUI.
> >
> > -layer maintainer: Khem Raj <raj.khem@gmail.com>
> > +layer maintainer: Armin Kuster <akuster808@gmail.com>
> > diff --git a/meta-perl/README.md b/meta-perl/README.md
> > index 13014b0ff3..f6089dad48 100644
> > --- a/meta-perl/README.md
> > +++ b/meta-perl/README.md
> > @@ -52,7 +52,7 @@ Dependencies
> >  This layer depends on:
> >
> >    URI: git://git.openembedded.org/openembedded-core
> > -  branch: master
> > +  branch: warnascar
> >
> >  Adding the meta-perl layer to your build
> >  ---------------------------------------
> > @@ -73,14 +73,13 @@ Maintenance
> >  -----------
> >
> >  Send patches / pull requests to openembedded-devel@lists.openembedded.=
org with
> > -'[meta-perl]' in the subject.
> > +'[meta-perl][warnascar]' in the subject.
> >
> >  When sending single patches, please using something like:
> > -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-perl][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-perl][warnascar][PATCH'
> >
> > -Layer maintainers:
> > -    Hongxu Jia <hongxu.jia@windriver.com>
> > -    Tim "moto-timo" Orling <ticotimo@gmail.com>
> > +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> > +
> >
> >  License
> >  -------
> > diff --git a/meta-python/README.md b/meta-python/README.md
> > index 36c193957c..c91a97c942 100644
> > --- a/meta-python/README.md
> > +++ b/meta-python/README.md
> > @@ -13,11 +13,11 @@ The meta-python layer depends on:
> >
> >         URI: git://git.openembedded.org/openembedded-core
> >         layers: meta
> > -       branch: master
> > +       branch: warnascar
> >
> >         URI: git://git.openembedded.org/meta-openembedded
> >         layers: meta-oe
> > -       branch: master
> > +       branch: warnascar
> >
> >  Contributing
> >  -------------------------
> > @@ -28,14 +28,12 @@ comments and patch review. It is subscriber only, s=
o please register
> >  before posting.
> >
> >  Send pull requests to openembedded-devel@lists.openembedded.org with
> > -'[meta-python]' in the subject.
> > +'[meta-python][warnascar]' in the subject.
> >
> >  When sending single patches, please use something like:
> > -git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org =
--subject-prefix=3D'meta-python][PATCH'
> > +git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org =
--subject-prefix=3D'meta-python][warnascar][PATCH'
> >
> >  Maintenance
> >  -------------------------
> >
> > -Layer maintainers:
> > -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> > -        Derek Straka <derek@asterius.io>
> > +Layer maintainers: Armin Kuster <akuster808@gmail.com>
> > diff --git a/meta-webserver/README.md b/meta-webserver/README.md
> > index d1b743887c..33cd85622b 100644
> > --- a/meta-webserver/README.md
> > +++ b/meta-webserver/README.md
> > @@ -13,13 +13,13 @@ This layer depends on:
> >
> >  URI: git://git.openembedded.org/openembedded-core
> >  subdirectory: meta
> > -branch: master
> > +branch: warnascar
> >
> >  For some recipes, the meta-oe layer is required:
> >
> >  URI: git://git.openembedded.org/meta-openembedded
> >  subdirectory: meta-oe
> > -branch: master
> > +branch: warnascar
> >
> >
> >
> > @@ -50,9 +50,12 @@ Maintenance
> >  -----------
> >
> >  Send patches / pull requests to openembedded-devel@lists.openembedded.=
org
> > -with '[meta-webserver]' in the subject.
> > +with '[meta-webserver][warnascar]' in the subject.
> >
> > -Layer maintainer: Derek Straka <derek@asterius.io>
> > +When sending single patches, please using something like:
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-webserver][warnascar][PATCH'
> > +
> > +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> >
> >
> >  License
> > diff --git a/meta-xfce/README.md b/meta-xfce/README.md
> > index 3d6158628f..a0592d21d6 100644
> > --- a/meta-xfce/README.md
> > +++ b/meta-xfce/README.md
> > @@ -1,10 +1,10 @@
> >  This layer depends on:
> >
> >  URI: git://git.openembedded.org/openembedded-core
> > -branch: master
> > +branch: warnascar
> >
> >  URI: git://git.openembedded.org/meta-openembedded
> > -branch: master
> > +branch: warnascar
> >
> >  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this r=
epository.
> >
> > @@ -13,10 +13,9 @@ this to local.conf:
> >
> >  BBMASK =3D "meta-xfce/recipes-multimedia"
> >
> > -Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-xfce]' in the subject'
> > +Send pull requests to openembedded-devel@lists.openembedded.org with '=
[meta-xfce][warnascar]' in the subject'
> >
> >  When sending single patches, please using something like:
> > -git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-xfce][PATCH'
> > +git send-email -M -1 --to openembedded-devel@lists.openembedded.org --=
subject-prefix=3D'meta-xfce][warnascar][PATCH'
> >
> > -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> > -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > +Layer maintainer: Armin Kuster <akuster808@gmail.com>
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116835): https://lists.openembedded.org/g/openembedde=
d-devel/message/116835
> Mute This Topic: https://lists.openembedded.org/mt/112244712/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

