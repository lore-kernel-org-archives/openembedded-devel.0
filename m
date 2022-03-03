Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36313C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 21:49:46 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.66.1646344182975027327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jZOBrrHW;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id p8so2234103qvg.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TpYRBvvdWtRB9aUfizZBlO4uc91731Z8P35hE7oA4hY=;
        b=jZOBrrHWeUajCAYBIOLYgZY1+5zvA/FnwKg+DCf1/gypQntbxRhzx+P8Tio5pCl6Kc
         3VkICm4J6MybU1FvLWVjow+UHcggd5KpV/kj//O81QVBEO8k0VAyheYwgQkL/yyeemmT
         xh5ted1888jQUy9ISRX5LMUqiQCP4JiQLQ3kfiECZeNTzR0vaL03DG3MfmT7T5CMkEHe
         uQTW6u+zGtZFMDoPjo9qyjtEaPPSre4fD2ok0rfPLP8L6ptWrllhMfSOUBkm4W/t33OH
         IM8NDrC+6QDGLZZrNbfK0fx86iAnZXbFbPD/XVKamNpFGS3f3TSybfvKpuT99qOs/qh8
         aHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TpYRBvvdWtRB9aUfizZBlO4uc91731Z8P35hE7oA4hY=;
        b=IDHNMc7wKdWVzeSGd3vRqjSfmg6av7P+yEcOt0SAUnDSIR0tx1Db7AnbqcFvPK6XGY
         qxtglp8p/UVdKR8bfglVGIMQDPLAKwWizEAiM+UT3cpSm8q/ydUk5HPub0QJn+bf+5yS
         5A9+grF3RV6qB6QiA704mT0HYKrQBeP3sFfH7aWs1ngxTP00csGZ9f1pT8SemjKu9Vk7
         0C9BEmYTyXypy1rE7CUxEQsrs2HEdK+U77V6DEEKgYqrDKzMXXOT2+PsZoUx0L1dfafa
         /xT2dQBvr+siMdUj9hiUUC0P0SxXPsbuGiwG7xFFHf0Fa1HfENVkjmETAKKjC8MlH0In
         L/FA==
X-Gm-Message-State: AOAM532PRy5Eahxqb5sy5YuUovrMKxGZdnEvdBAyLlbix9oj09g6aSRG
	L+x8MkHdBPMz6Q8Wtazdr7YSe4vjyUvPBBBB6eKXoW64Gd0=
X-Google-Smtp-Source: 
 ABdhPJw19W2B18RsWZIGgfGUK3dfvFIs/rJoeiKTu3W73Nr/cvYG0yA+b9EF7LbKV8Avwitip1V8NpLtQBymZbQnb/w=
X-Received: by 2002:ad4:574a:0:b0:42b:ef56:c2a4 with SMTP id
 q10-20020ad4574a000000b0042bef56c2a4mr25585587qvx.16.1646344181898; Thu, 03
 Mar 2022 13:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
 <20220303130618.1108977-3-adrian.freihofer@siemens.com>
 <CAMKF1sqSPYC4bOn0ihnh2dpD4Heg5sBHT0WY7U5oz9PvZ_JX-A@mail.gmail.com>
 <93e1fb5cb301dae3f56bb108bebf1862ba9d5329.camel@gmail.com>
 <CAMKF1soJENEKfAGLmRexmtQ=X4-nJhWop+dR4YjU5K7P22WOrw@mail.gmail.com>
 <60fa6b252def56b1726e5826122d334433817e89.camel@gmail.com>
In-Reply-To: <60fa6b252def56b1726e5826122d334433817e89.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2022 13:49:15 -0800
Message-ID: 
 <CAMKF1sqdsuq92L6cZ4dQZ6xt+yFYzho7pHMVp-BJ+kiwQFOsfw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] libqmi: switch to meson and git
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 21:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95760

On Thu, Mar 3, 2022 at 1:46 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> On Thu, 2022-03-03 at 13:15 -0800, Khem Raj via lists.openembedded.org
> wrote:
> > On Thu, Mar 3, 2022 at 12:59 PM Adrian Freihofer
> > <adrian.freihofer@gmail.com> wrote:
> > >
> > > On Thu, 2022-03-03 at 11:00 -0800, Khem Raj wrote:
> > > > On Thu, Mar 3, 2022 at 5:07 AM Adrian Freihofer
> > > > <adrian.freihofer@gmail.com> wrote:
> > > > >
> > > > > - Switching to meson and git because of the following statement f=
rom news file:
> > > > >   "The next major release will likely be a meson-only one, and wi=
ll therefore
> > > > >    not be based on a source release tarball any more, but on spec=
ific git tags
> > > > >    instead."
> > > > > - Add PACKAGECONFIG for qrtr.
> > > > > - Updateing deprecated licenses acc. to
> > > > >   https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgitlab.freedesktop.org%2Fmobile-broadband%2Flibqmi%2F%23license&amp;da=
ta=3D04%7C01%7Cadrian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd5=
afc09%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C3000&amp;sdata=3D0ugE3JGPM6qGMhsljzUTU5dsSyH2I8hqqZnX8GHKnoM%3=
D&amp;reserved=3D0
> > > > >
> > > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > > > ---
> > > > >  .../0001-build-use-python3-everywhere.patch   | 33 +++++++++++++=
++++++
> > > > >  .../libqmi/libqmi_1.30.4.bb                   | 23 +++++++++----
> > > > >  2 files changed, 50 insertions(+), 6 deletions(-)
> > > > >  create mode 100644 meta-oe/recipes-connectivity/libqmi/files/000=
1-build-use-python3-everywhere.patch
> > > > >
> > > > > diff --git a/meta-oe/recipes-connectivity/libqmi/files/0001-build=
-use-python3-everywhere.patch b/meta-oe/recipes-connectivity/libqmi/files/0=
001-build-use-python3-everywhere.patch
> > > > > new file mode 100644
> > > > > index 0000000000..e345d28031
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-py=
thon3-everywhere.patch
> > > > > @@ -0,0 +1,33 @@
> > > > > +From 189528e879e4099b44aae26a2af0cb16aaa96db6 Mon Sep 17 00:00:0=
0 2001
> > > > > +From: goapunk <goapunk@riseup.net>
> > > > > +Date: Mon, 13 Sep 2021 13:45:41 +0200
> > > > > +Subject: [PATCH] build: use python3 everywhere
> > > > > +
> > > > > +---
> > > > > + build-aux/qmi-codegen/qmi-codegen                  | 2 +-
> > > > > + examples/simple-tester-python/simple-tester-python | 2 +-
> > > > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > > > > +
> > > > > +diff --git a/build-aux/qmi-codegen/qmi-codegen b/build-aux/qmi-c=
odegen/qmi-codegen
> > > > > +index 1fea7c1..1092c8e 100755
> > > > > +--- a/build-aux/qmi-codegen/qmi-codegen
> > > > > ++++ b/build-aux/qmi-codegen/qmi-codegen
> > > > > +@@ -1,4 +1,4 @@
> > > > > +-#!/usr/bin/env python
> > > > > ++#!/usr/bin/env python3
> > > > > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basi=
c-offset: 4 -*-
> > > > > + #
> > > > > + # This program is free software; you can redistribute it and/or=
 modify it under
> > > > > +diff --git a/examples/simple-tester-python/simple-tester-python =
b/examples/simple-tester-python/simple-tester-python
> > > > > +index af9065a..a35e505 100755
> > > > > +--- a/examples/simple-tester-python/simple-tester-python
> > > > > ++++ b/examples/simple-tester-python/simple-tester-python
> > > > > +@@ -1,4 +1,4 @@
> > > > > +-#!/usr/bin/env python
> > > > > ++#!/usr/bin/env python3
> > > > > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basi=
c-offset: 4 -*-
> > > > > + #
> > > > > + # This program is free software; you can redistribute it and/or=
 modify it under
> > > > > +--
> > > > > +2.34.1
> > > > > +
> > > > > diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb=
 b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > > > index dee36d7b45..4807244a58 100644
> > > > > --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > > > +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > > > @@ -2,7 +2,7 @@ SUMMARY =3D "libqmi is a library for talking to W=
WAN devices by QMI protocol"
> > > > >  DESCRIPTION =3D "libqmi is a glib-based library for talking to W=
WAN modems and \
> > > > >                 devices which speak the Qualcomm MSM Interface (Q=
MI) protocol"
> > > > >  HOMEPAGE =3D "https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttp%3A%2F%2Fwww.freedesktop.org%2Fwiki%2FSoftware%2Flibqmi&amp;data=3D=
04%7C01%7Cadrian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd5afc09=
%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C3000&amp;sdata=3DdWHuppNvGtDzV%2Fu4MHiLiE1ddOXzyxxDJE5T%2FMV7C%2B8%=
3D&amp;reserved=3D0"
> > > > > -LICENSE =3D "GPLv2 & LGPLv2.1"
> > > > > +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
> > > > >  LIC_FILES_CHKSUM =3D " \
> > > > >      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > > > >      file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> > > > > @@ -10,12 +10,23 @@ LIC_FILES_CHKSUM =3D " \
> > > > >
> > > > >  DEPENDS =3D "glib-2.0 glib-2.0-native"
> > > > >
> > > > > -inherit autotools pkgconfig bash-completion gobject-introspectio=
n
> > > > > +inherit meson pkgconfig bash-completion gobject-introspection
> > > > >
> > > > > -SRC_URI =3D "https://eur01.safelinks.protection.outlook.com/?url=
=3Dhttp%3A%2F%2Fwww.freedesktop.org%2Fsoftware%2F%24&amp;data=3D04%7C01%7Ca=
drian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd5afc09%7C38ae3bcd=
95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300=
0&amp;sdata=3DA5%2Fk3gLTbBPWeP0WOVhjQvG1Nqj%2ByXCmY4mxMrbSOXo%3D&amp;reserv=
ed=3D0{BPN}/${BPN}-${PV}.tar.xz"
> > > > > +SRCREV ?=3D "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
> > > >
> > > > it this same SHA which is used for 1.30.4 release tarball ?
> > >
> > > Yes the version did not change. See
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
itlab.freedesktop.org%2Fmobile-broadband%2Flibqmi%2F-%2Ftags%2F1.30.4&amp;d=
ata=3D04%7C01%7Cadrian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd=
5afc09%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000&amp;sdata=3De%2B%2BhzTGb%2Fp1MSKqKTalkv3klm1zLq8o%2FuYBI=
fLBI1CE%3D&amp;reserved=3D0
> > >
> >
> > so its for convenience to use git here then, perhaps for same reasons
> > we discussed yesterday
> > perhaps sticking to tarball is a better approach. ?
>
> I try hard not to send the same error twice to a busy maintainer. ;-)
>
> No, this time it is because the changelog file mentions that for the
> next version there will be no tar available and only a git tag.
> Currently the tar is still available, but there is no meson.build file
> in the tar. This seems to be the way some freedesktop projects will go:
> autotools and tar are replaced by git tags and meson.
> I have also cited this in my commit messages.

thanks for the info. Makes sense

>
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95758): https://lists.openembedded.org/g/openembedd=
ed-devel/message/95758
> > Mute This Topic: https://lists.openembedded.org/mt/89524244/3616858
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[adrian.freihofer@siemens.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

