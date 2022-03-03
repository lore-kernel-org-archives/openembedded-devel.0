Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F8DC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 21:15:44 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.16500.1646342143596796449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fffYZaF2;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id iv12so3687071qvb.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uVY2/vyLDUXYqocUHtyayt3VXD/moFeDXcw2m+hP9Yk=;
        b=fffYZaF2jNy9gr0DVM1VSj1npDNV/ETB0exnroExTkeckGMnirR6m6HkdzdgEbWeLt
         uoFYSZy6/klOvVtNr0f5vznX1NmmiyNNLjZUvp7nT2hJUce08AX5Nj3yUDCPwcP7KRaR
         bCS/NIfnej3nyiVLy756M38cSxiGexcOkAxsEmyuxKw3p8eMIOzlZaTJGMBh9GdSnZAW
         AHtXKqRBBgBli92KLzXJS3obrH873STGKcNCusEOpjOIowwa7wni/LzFEH05GmSrBQks
         NTfFUiCIhDRUdNuVYqmkNqBID5Ywf/P0ysCpA8tczeCppc1TtiosBKaNjh3EWnhETQRG
         KkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uVY2/vyLDUXYqocUHtyayt3VXD/moFeDXcw2m+hP9Yk=;
        b=mPfYgtHdJPzWWNb/z3CETRIwmz6ToAr7M+2sgFk8i6vOjFKbiy+s7S33e7t3D/+44Y
         rVc9uVhbPqRlgk90vtnyadmZC8vvLqo46+lNdoCFcIjMireVyJY7FePiY+1K2H+MET57
         EdnIkIcsL/wxf8gjr5EStA8wFi7SxBoSR70Yt4N2Wk6n5yXp9nCuOG/j0PYWDwPRNbwK
         lHSiJ5SKDukuUL8B8nchwykJacRBr8ms0lEPHj78Y1tXnohla+kLkien1RLTU5/SCdz3
         +ZXwBIFGXGsW+gQd79/bUc/4CA76eHEBScGIpHF28g24rptKvMqLFjXTGQ+JoPVy1mMs
         K/BQ==
X-Gm-Message-State: AOAM532/Z0l0i8FEgj7fB7CRtID3lg2ZmEhC1/w9WcWnfXo9xyBLDP+l
	+mXmakatLsPwcMdYgfc5JirZBvG3vH96Svznf0c=
X-Google-Smtp-Source: 
 ABdhPJzzV//bnz7eSwCN46M8IPo0wLQxNI/7hrgOm8ARF4A2fY6TIi7zA2QhmAo+OWisMxEEEzS3nG5cJgSmW0fOgOg=
X-Received: by 2002:ad4:596b:0:b0:434:ea08:d2ee with SMTP id
 eq11-20020ad4596b000000b00434ea08d2eemr11514453qvb.24.1646342142551; Thu, 03
 Mar 2022 13:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
 <20220303130618.1108977-3-adrian.freihofer@siemens.com>
 <CAMKF1sqSPYC4bOn0ihnh2dpD4Heg5sBHT0WY7U5oz9PvZ_JX-A@mail.gmail.com>
 <93e1fb5cb301dae3f56bb108bebf1862ba9d5329.camel@gmail.com>
In-Reply-To: <93e1fb5cb301dae3f56bb108bebf1862ba9d5329.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2022 13:15:16 -0800
Message-ID: 
 <CAMKF1soJENEKfAGLmRexmtQ=X4-nJhWop+dR4YjU5K7P22WOrw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] libqmi: switch to meson and git
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 21:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95758

On Thu, Mar 3, 2022 at 12:59 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> On Thu, 2022-03-03 at 11:00 -0800, Khem Raj wrote:
> > On Thu, Mar 3, 2022 at 5:07 AM Adrian Freihofer
> > <adrian.freihofer@gmail.com> wrote:
> > >
> > > - Switching to meson and git because of the following statement from =
news file:
> > >   "The next major release will likely be a meson-only one, and will t=
herefore
> > >    not be based on a source release tarball any more, but on specific=
 git tags
> > >    instead."
> > > - Add PACKAGECONFIG for qrtr.
> > > - Updateing deprecated licenses acc. to
> > >   https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgitlab.freedesktop.org%2Fmobile-broadband%2Flibqmi%2F%23license&amp;data=
=3D04%7C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481=
c0d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C3000&amp;sdata=3DqVoaU%2F9Y52BQ3Ot6DQ8otraIhn4PzeD6yvBfD1XoLwA%3=
D&amp;reserved=3D0
> > >
> > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > ---
> > >  .../0001-build-use-python3-everywhere.patch   | 33 +++++++++++++++++=
++
> > >  .../libqmi/libqmi_1.30.4.bb                   | 23 +++++++++----
> > >  2 files changed, 50 insertions(+), 6 deletions(-)
> > >  create mode 100644 meta-oe/recipes-connectivity/libqmi/files/0001-bu=
ild-use-python3-everywhere.patch
> > >
> > > diff --git a/meta-oe/recipes-connectivity/libqmi/files/0001-build-use=
-python3-everywhere.patch b/meta-oe/recipes-connectivity/libqmi/files/0001-=
build-use-python3-everywhere.patch
> > > new file mode 100644
> > > index 0000000000..e345d28031
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python=
3-everywhere.patch
> > > @@ -0,0 +1,33 @@
> > > +From 189528e879e4099b44aae26a2af0cb16aaa96db6 Mon Sep 17 00:00:00 20=
01
> > > +From: goapunk <goapunk@riseup.net>
> > > +Date: Mon, 13 Sep 2021 13:45:41 +0200
> > > +Subject: [PATCH] build: use python3 everywhere
> > > +
> > > +---
> > > + build-aux/qmi-codegen/qmi-codegen                  | 2 +-
> > > + examples/simple-tester-python/simple-tester-python | 2 +-
> > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/build-aux/qmi-codegen/qmi-codegen b/build-aux/qmi-codeg=
en/qmi-codegen
> > > +index 1fea7c1..1092c8e 100755
> > > +--- a/build-aux/qmi-codegen/qmi-codegen
> > > ++++ b/build-aux/qmi-codegen/qmi-codegen
> > > +@@ -1,4 +1,4 @@
> > > +-#!/usr/bin/env python
> > > ++#!/usr/bin/env python3
> > > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-of=
fset: 4 -*-
> > > + #
> > > + # This program is free software; you can redistribute it and/or mod=
ify it under
> > > +diff --git a/examples/simple-tester-python/simple-tester-python b/ex=
amples/simple-tester-python/simple-tester-python
> > > +index af9065a..a35e505 100755
> > > +--- a/examples/simple-tester-python/simple-tester-python
> > > ++++ b/examples/simple-tester-python/simple-tester-python
> > > +@@ -1,4 +1,4 @@
> > > +-#!/usr/bin/env python
> > > ++#!/usr/bin/env python3
> > > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-of=
fset: 4 -*-
> > > + #
> > > + # This program is free software; you can redistribute it and/or mod=
ify it under
> > > +--
> > > +2.34.1
> > > +
> > > diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/m=
eta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > index dee36d7b45..4807244a58 100644
> > > --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > @@ -2,7 +2,7 @@ SUMMARY =3D "libqmi is a library for talking to WWAN =
devices by QMI protocol"
> > >  DESCRIPTION =3D "libqmi is a glib-based library for talking to WWAN =
modems and \
> > >                 devices which speak the Qualcomm MSM Interface (QMI) =
protocol"
> > >  HOMEPAGE =3D "https://eur01.safelinks.protection.outlook.com/?url=3D=
http%3A%2F%2Fwww.freedesktop.org%2Fwiki%2FSoftware%2Flibqmi&amp;data=3D04%7=
C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C3=
8ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000&amp;sdata=3DrEwaleK%2FFa04uAEVgsUkUWRzuRW1SxXcPOwMhhxHgIo%3D&amp;r=
eserved=3D0"
> > > -LICENSE =3D "GPLv2 & LGPLv2.1"
> > > +LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
> > >  LIC_FILES_CHKSUM =3D " \
> > >      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > >      file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> > > @@ -10,12 +10,23 @@ LIC_FILES_CHKSUM =3D " \
> > >
> > >  DEPENDS =3D "glib-2.0 glib-2.0-native"
> > >
> > > -inherit autotools pkgconfig bash-completion gobject-introspection
> > > +inherit meson pkgconfig bash-completion gobject-introspection
> > >
> > > -SRC_URI =3D "https://eur01.safelinks.protection.outlook.com/?url=3Dh=
ttp%3A%2F%2Fwww.freedesktop.org%2Fsoftware%2F%24&amp;data=3D04%7C01%7Cadria=
n.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C38ae3bcd9579=
4fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&am=
p;sdata=3D7tcIiPzWRwpqXzrMU6zU5Cdja5IhY2v094wNjnGTmcY%3D&amp;reserved=3D0{B=
PN}/${BPN}-${PV}.tar.xz"
> > > +SRCREV ?=3D "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
> >
> > it this same SHA which is used for 1.30.4 release tarball ?
>
> Yes the version did not change. See
> https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/tags/1.30.4
>

so its for convenience to use git here then, perhaps for same reasons
we discussed yesterday
perhaps sticking to tarball is a better approach. ?

