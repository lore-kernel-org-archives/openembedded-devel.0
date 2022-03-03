Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C08C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 20:59:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.16437.1646341195456525885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X0Y+mafm;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id i66so3874981wma.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V/rHik9JwO7YoKYBuWZCwDEl/jG+K7Uo3cZoP58cT6E=;
        b=X0Y+mafmpOAAO2Ohu9KZMELjKxGqiEXlmEyVIIbUtvRShy66I5LPKZwfYmGDIJN4w3
         qfZa9SfSlvDXudrzlcZ/rDtFxGaUAli700wKSVDmRK6Hukd66aM3SsOm7vG9TK3MOSkD
         H4yQvpxjeHcWcT2usVnI4rKGVsA8V9Z4NVG2CCetoB8wsFAsHKTqiXJB22CWLgMvQcJB
         0GIj2QIOWpTuGzNPlP8EP5pUM/EPD+XqVsX02MwDTVC+maHfVeBUCBkAUOV8fYkM/07g
         rSyBZPrQ6F7duHDrk3pZgpq1A5hqvHcGizlsOimWdnmG1XbBc/QGR5/0ktnyjCpuZG2E
         Etbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V/rHik9JwO7YoKYBuWZCwDEl/jG+K7Uo3cZoP58cT6E=;
        b=BcVWoNUD2xA89xUuUTsW4abYo4eUgMvRQLx9oCE6iVrb97RhgPaDGe8lGIGsf9OkjS
         7DlbxO0CY0bYuaj3rNvNpiVXR1+S7I9k3ViTwyuZMCR4Lh67reh8uWiwca0vGSd2nsV3
         ZNfZ1y7r/PJumZh61Yj30Rb4iV00oe7YNIesk/aRazLvKLJzvOJo8vrjNjJUeWmIq+oY
         JuO4U6jen79mvZn46wB7SB1oNxhdb/qWrrrS1qT5k9IEaGI9IMAwp48VecAKpH8f1SPb
         91bJAz5ZD8ujaJTIwSISwDcvqjUXR99kvLqvqHaSbnTpkRG/Y+AQcO0bgBMPetaIPjHo
         gySQ==
X-Gm-Message-State: AOAM530gYMc0j2CqUYlV/AjhvlcT6k03v8qytnS7Qz6G5kUHB9Lz3sCv
	sUiH4zxD0lwktogG4RxQGcI=
X-Google-Smtp-Source: 
 ABdhPJx/83gBPGr79e5deEdXRFE8CWubUb4jThnZvV4iRC1AKYWd+4tddmDD7158SJ6Rx1WRUoM+Sg==
X-Received: by 2002:a05:600c:4ec6:b0:352:cc24:1754 with SMTP id
 g6-20020a05600c4ec600b00352cc241754mr5092729wmq.184.1646341193799;
        Thu, 03 Mar 2022 12:59:53 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 e20-20020adfa454000000b001f01a14dce8sm2765783wra.97.2022.03.03.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 12:59:53 -0800 (PST)
Message-ID: <93e1fb5cb301dae3f56bb108bebf1862ba9d5329.camel@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] libqmi: switch to meson and git
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 03 Mar 2022 21:59:52 +0100
In-Reply-To: 
 <CAMKF1sqSPYC4bOn0ihnh2dpD4Heg5sBHT0WY7U5oz9PvZ_JX-A@mail.gmail.com>
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
	 <20220303130618.1108977-3-adrian.freihofer@siemens.com>
	 <CAMKF1sqSPYC4bOn0ihnh2dpD4Heg5sBHT0WY7U5oz9PvZ_JX-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 20:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95757

On Thu, 2022-03-03 at 11:00 -0800, Khem Raj wrote:
> On Thu, Mar 3, 2022 at 5:07 AM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> > 
> > - Switching to meson and git because of the following statement from news file:
> >   "The next major release will likely be a meson-only one, and will therefore
> >    not be based on a source release tarball any more, but on specific git tags
> >    instead."
> > - Add PACKAGECONFIG for qrtr.
> > - Updateing deprecated licenses acc. to
> >   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmobile-broadband%2Flibqmi%2F%23license&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=qVoaU%2F9Y52BQ3Ot6DQ8otraIhn4PzeD6yvBfD1XoLwA%3D&amp;reserved=0
> > 
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> >  .../0001-build-use-python3-everywhere.patch   | 33 +++++++++++++++++++
> >  .../libqmi/libqmi_1.30.4.bb                   | 23 +++++++++----
> >  2 files changed, 50 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> > 
> > diff --git a/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> > new file mode 100644
> > index 0000000000..e345d28031
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/libqmi/files/0001-build-use-python3-everywhere.patch
> > @@ -0,0 +1,33 @@
> > +From 189528e879e4099b44aae26a2af0cb16aaa96db6 Mon Sep 17 00:00:00 2001
> > +From: goapunk <goapunk@riseup.net>
> > +Date: Mon, 13 Sep 2021 13:45:41 +0200
> > +Subject: [PATCH] build: use python3 everywhere
> > +
> > +---
> > + build-aux/qmi-codegen/qmi-codegen                  | 2 +-
> > + examples/simple-tester-python/simple-tester-python | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/build-aux/qmi-codegen/qmi-codegen b/build-aux/qmi-codegen/qmi-codegen
> > +index 1fea7c1..1092c8e 100755
> > +--- a/build-aux/qmi-codegen/qmi-codegen
> > ++++ b/build-aux/qmi-codegen/qmi-codegen
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
> > + #
> > + # This program is free software; you can redistribute it and/or modify it under
> > +diff --git a/examples/simple-tester-python/simple-tester-python b/examples/simple-tester-python/simple-tester-python
> > +index af9065a..a35e505 100755
> > +--- a/examples/simple-tester-python/simple-tester-python
> > ++++ b/examples/simple-tester-python/simple-tester-python
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > + # -*- Mode: python; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
> > + #
> > + # This program is free software; you can redistribute it and/or modify it under
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > index dee36d7b45..4807244a58 100644
> > --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
> > @@ -2,7 +2,7 @@ SUMMARY = "libqmi is a library for talking to WWAN devices by QMI protocol"
> >  DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and \
> >                 devices which speak the Qualcomm MSM Interface (QMI) protocol"
> >  HOMEPAGE = "https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.freedesktop.org%2Fwiki%2FSoftware%2Flibqmi&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=rEwaleK%2FFa04uAEVgsUkUWRzuRW1SxXcPOwMhhxHgIo%3D&amp;reserved=0"
> > -LICENSE = "GPLv2 & LGPLv2.1"
> > +LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM = " \
> >      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
> > @@ -10,12 +10,23 @@ LIC_FILES_CHKSUM = " \
> > 
> >  DEPENDS = "glib-2.0 glib-2.0-native"
> > 
> > -inherit autotools pkgconfig bash-completion gobject-introspection
> > +inherit meson pkgconfig bash-completion gobject-introspection
> > 
> > -SRC_URI = "https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.freedesktop.org%2Fsoftware%2F%24&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=7tcIiPzWRwpqXzrMU6zU5Cdja5IhY2v094wNjnGTmcY%3D&amp;reserved=0{BPN}/${BPN}-${PV}.tar.xz"
> > +SRCREV ?= "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
> 
> it this same SHA which is used for 1.30.4 release tarball ?

Yes the version did not change. See
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/tags/1.30.4

> 
> > +# patch 0001 is on main branch upstream
> > +SRC_URI = "\
> > +    git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-30 \
> > +    file://0001-build-use-python3-everywhere.patch \
> > +"
> > 
> > -SRC_URI[sha256sum] = "00d7da30a4f8d1185f37cba289cfaf1dfcd04a58f2f76d6acfdf5b85312d6ed6"
> > +S = "${WORKDIR}/git"
> > 
> >  PACKAGECONFIG ??= "udev mbim"
> > -PACKAGECONFIG[udev] = ",--without-udev,libgudev"
> > -PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
> > +PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,libgudev"
> > +PACKAGECONFIG[mbim] = "-Dmbim_qmux=true,-Dmbim_qmux=false,libmbim"
> > +PACKAGECONFIG[qrtr] = "-Dqrtr=true,-Dqrtr=false,libqrtr-glib"
> > +
> > +EXTRA_OEMESON = " \
> > +    -Dgtk_doc=false \
> > +    -Dman=false \
> > +"
> > --
> > 2.34.1
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95741): https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Fmessage%2F95741&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=7TfE%2FbW26C8V%2BDFIsxJuinFLENh1BaSrcQfOw778ApM%3D&amp;reserved=0
> > Mute This Topic: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fmt%2F89524244%2F1997914&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=kwITRUVYzLshwIGNz9DusIl44Tj9Y4yRsBQR1E7lN4U%3D&amp;reserved=0
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Funsub&amp;data=04%7C01%7Cadrian.freihofer%40siemens.com%7C1120c4a6299d42db9ce208d9fd481c0d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637819308411861783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=jd3zN78iGp9y7wMfEpNYhi0rENd680qRZar8CWHu1pM%3D&amp;reserved=0 [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 



