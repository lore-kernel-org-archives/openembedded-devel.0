Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092C4C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 21:46:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.8.1646343993208319416
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lm3NBhx+;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id b5so9838423wrr.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EgduqPm8JkwgZfXz2VuTXYVBl5m1667YZmb0CvWvQI4=;
        b=Lm3NBhx+tfsStd+PBAAmwmjwDqB4yfGFC9EhZP/sh3FrpqNZzyvFwDZjE8QEcQP/90
         Tu4Wa0i6UDoK/JfXSOkO3yuw/SShSVgNzbBHw0Yij7tswEFMdua/pIyUAvb6SNgDoirH
         iyAyDr81E8UOaKjeKDcb0XANv+38YIB3SSXjx4L4jBCf5Tansw4r2Z/4McxsDc3Kv3ni
         evC6nX27jX4Ty3Gv6/BDIDUqJgzzXZ7OgLo473NMOPsawaPP2WXHrwu9/yHrhE7zPUD7
         I0FTIheqR5VRYHuWj9T/95icTf+75/KrXddWdVmeb8yVXsbA9VBI3G91TKOSAF363ZeP
         9Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EgduqPm8JkwgZfXz2VuTXYVBl5m1667YZmb0CvWvQI4=;
        b=EEt2VN+l9irlfKLSKv1aOgzv14rbSqUYhK2S6eUjafVA/p6FkMXb63EtNMxtMtRuBo
         GPBpGrYRdEMpVUhN7nK3dsvCM13R/KIYTqui8Z+pI5QPCwnBDnW7QgMXClVaj8vaOGdU
         Ab2nfJZ4TpVnL1XvApvNGDqDsZW77uQ7mmRcYpLiLojR+M+XTM5CGVZ5czWBFAmeoUBT
         BqNstM1m8rUPDUsUKDp2NEfBF9D0N0uZJIuZAj1meFaCPyCtCtxTP+Vmswq1mYyGUEKZ
         6rv1lu3oxpfeUZGKQnDl1TyIaexzgGGcKlMuW2d1+ypKWdO2i7SKED1Hr+OPpexIXnLi
         iptg==
X-Gm-Message-State: AOAM532sxgUToPHZPSLxlUv0Y3Ltr4ea9TetT7R4aq77D83upaiw0IAq
	Yi2udMIh61Bpo/HPRxYRzeA=
X-Google-Smtp-Source: 
 ABdhPJylPryeFxuh2EmCQZiw55/n1BAvqHr33kxYheMLpksVS1Hr8ii6QsLgYR9GHk/BymRT87tiOQ==
X-Received: by 2002:a05:6000:16c8:b0:1ef:f880:79eb with SMTP id
 h8-20020a05600016c800b001eff88079ebmr13137033wrf.134.1646343991315;
        Thu, 03 Mar 2022 13:46:31 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c4f1000b0033383cdeea1sm3166491wmq.10.2022.03.03.13.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 13:46:30 -0800 (PST)
Message-ID: <60fa6b252def56b1726e5826122d334433817e89.camel@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] libqmi: switch to meson and git
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: raj.khem@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 03 Mar 2022 22:46:30 +0100
In-Reply-To: 
 <CAMKF1soJENEKfAGLmRexmtQ=X4-nJhWop+dR4YjU5K7P22WOrw@mail.gmail.com>
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
	 <20220303130618.1108977-3-adrian.freihofer@siemens.com>
	 <CAMKF1sqSPYC4bOn0ihnh2dpD4Heg5sBHT0WY7U5oz9PvZ_JX-A@mail.gmail.com>
	 <93e1fb5cb301dae3f56bb108bebf1862ba9d5329.camel@gmail.com>
	 <CAMKF1soJENEKfAGLmRexmtQ=X4-nJhWop+dR4YjU5K7P22WOrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 21:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95759

On Thu, 2022-03-03 at 13:15 -0800, Khem Raj via lists.openembedded.org
wrote:
> On Thu, Mar 3, 2022 at 12:59 PM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> > 
> > On Thu, 2022-03-03 at 11:00 -0800, Khem Raj wrote:
> > > On Thu, Mar 3, 2022 at 5:07 AM Adrian Freihofer
> > > <adrian.freihofer@gmail.com> wrote:
> > > > 
> > > > - Switching to meson and git because of the following statement from news file:
> > > >   "The next major release will likely be a meson-only one, and will therefore
> > > >    not be based on a source release tarball any more, but on specific git tags
> > > >    instead."
> > > > - Add PACKAGECONFIG for qrtr.
> > > > - Updateing deprecated licenses acc. to
> > > >   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmobile-broadband%2Flibqmi%2F%23license&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd5afc09%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=0ugE3JGPM6qGMhsljzUTU5dsSyH2I8hqqZnX8GHKnoM%3D&amp;reserved=0
> > > > 
> > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > > ---
> > > >  .../0001-build-use-python3-everywhere.patch   | 33 +++++++++++++++++++
> > > >  .../libqmi/libqmi_1.30.4.bb                   | 23 +++++++++----
> > > >  2 files changed, 50 insertions(+), 6 deletions(-)
> > > >  create mode 100644 meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> > > > 
> > > > diff --git a/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> > > > new file mode 100644
> > > > index 0000000000..e345d28031
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> > > > @@ -0,0 +1,33 @@
> > > > +From 189528e879e4099b44aae26a2af0cb16aaa96db6 Mon Sep 17 00:00:00 2001
> > > > +From: goapunk <goapunk@riseup.net>
> > > > +Date: Mon, 13 Sep 2021 13:45:41 +0200
> > > > +Subject: [PATCH] build: use python3 everywhere
> > > > +
> > > > +---
> > > > + build-aux/qmi-codegen/qmi-codegen                  | 2 +-
> > > > + examples/simple-tester-python/simple-tester-python | 2 +-
> > > > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/build-aux/qmi-codegen/qmi-codegen b/build-aux/qmi-codegen/qmi-codegen
> > > > +index 1fea7c1..1092c8e 100755
> > > > +--- a/build-aux/qmi-codegen/qmi-codegen
> > > > ++++ b/build-aux/qmi-codegen/qmi-codegen
> > > > +@@ -1,4 +1,4 @@
> > > > +-#!/usr/bin/env python
> > > > ++#!/usr/bin/env python3
> > > > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
> > > > + #
> > > > + # This program is free software; you can redistribute it and/or modify it under
> > > > +diff --git a/examples/simple-tester-python/simple-tester-python b/examples/simple-tester-python/simple-tester-python
> > > > +index af9065a..a35e505 100755
> > > > +--- a/examples/simple-tester-python/simple-tester-python
> > > > ++++ b/examples/simple-tester-python/simple-tester-python
> > > > +@@ -1,4 +1,4 @@
> > > > +-#!/usr/bin/env python
> > > > ++#!/usr/bin/env python3
> > > > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
> > > > + #
> > > > + # This program is free software; you can redistribute it and/or modify it under
> > > > +--
> > > > +2.34.1
> > > > +
> > > > diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > > index dee36d7b45..4807244a58 100644
> > > > --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > > +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > > > @@ -2,7 +2,7 @@ SUMMARY = "libqmi is a library for talking to WWAN devices by QMI protocol"
> > > >  DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and \
> > > >                 devices which speak the Qualcomm MSM Interface (QMI) protocol"
> > > >  HOMEPAGE = "https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.freedesktop.org%2Fwiki%2FSoftware%2Flibqmi&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd5afc09%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=dWHuppNvGtDzV%2Fu4MHiLiE1ddOXzyxxDJE5T%2FMV7C%2B8%3D&amp;reserved=0"
> > > > -LICENSE = "GPLv2 & LGPLv2.1"
> > > > +LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
> > > >  LIC_FILES_CHKSUM = " \
> > > >      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > > >      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
> > > > @@ -10,12 +10,23 @@ LIC_FILES_CHKSUM = " \
> > > > 
> > > >  DEPENDS = "glib-2.0 glib-2.0-native"
> > > > 
> > > > -inherit autotools pkgconfig bash-completion gobject-introspection
> > > > +inherit meson pkgconfig bash-completion gobject-introspection
> > > > 
> > > > -SRC_URI = "https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.freedesktop.org%2Fsoftware%2F%24&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd5afc09%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=A5%2Fk3gLTbBPWeP0WOVhjQvG1Nqj%2ByXCmY4mxMrbSOXo%3D&amp;reserved=0{BPN}/${BPN}-${PV}.tar.xz"
> > > > +SRCREV ?= "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
> > > 
> > > it this same SHA which is used for 1.30.4 release tarball ?
> > 
> > Yes the version did not change. See
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmobile-broadband%2Flibqmi%2F-%2Ftags%2F1.30.4&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7Cf7ebbe47af824ea9229808d9fd5afc09%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819389490459432%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=e%2B%2BhzTGb%2Fp1MSKqKTalkv3klm1zLq8o%2FuYBIfLBI1CE%3D&amp;reserved=0
> > 
> 
> so its for convenience to use git here then, perhaps for same reasons
> we discussed yesterday
> perhaps sticking to tarball is a better approach. ?

I try hard not to send the same error twice to a busy maintainer. ;-)

No, this time it is because the changelog file mentions that for the
next version there will be no tar available and only a git tag.
Currently the tar is still available, but there is no meson.build file
in the tar. This seems to be the way some freedesktop projects will go:
autotools and tar are replaced by git tags and meson.
I have also cited this in my commit messages.

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95758): https://lists.openembedded.org/g/openembedded-devel/message/95758
> Mute This Topic: https://lists.openembedded.org/mt/89524244/3616858
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [adrian.freihofer@siemens.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



