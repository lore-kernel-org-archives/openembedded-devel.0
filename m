Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5333ED74954
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 01:32:09 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.4776.1730251921640480848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 18:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jhm65Gbh;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5eb70a779baso3229694eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 18:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730251921; x=1730856721; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KRpqZ3PGjgrvUEPZHjLUp82otCXRO+3ySXJ30l8hVA=;
        b=jhm65GbhH5/Hfhhzyxs+noOWEsJ45TD2txboB5YCYy9vG70PBm92kZ/a8ZgONrO6Yq
         EMoJgK9Wn/XltmG+JwcASD7MrnljQ3NN/mfNXNI21uiPRPD7R2NPM+UKkT98lSP/Wdk3
         iMWN2eRlwn1C1paz0f95ztGdgVNRZvvY/yY1TqN4OltRY0HSCRppIZMfJNbxFlFixI3+
         UopIcKCVI/WyjAppWKLzH70KKL54csa+vFZNSmS+LMgCAZiTIQWtRVJdUrnxCsINwbgd
         QtxEJIA0ary4P62Ekthx2J6ATKjuAVcxImhHZMnbO73zjYNSy5yan6Kj2+IWnsP0mWBJ
         P4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730251921; x=1730856721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KRpqZ3PGjgrvUEPZHjLUp82otCXRO+3ySXJ30l8hVA=;
        b=a4/GfvqM1QC7b6zRzFnZkgmx1ujHU3OxaNZdvhF0+orRn2LoFwLHWrKSLSmiCeS8eE
         mQ4WBK7yo5w1Ppfopu9ondB12xt11DIM0kfNAX5ld+f4Gu3d8WKXmvMWiIkjcoClrf1/
         vV3WHElMegmDP7ZBajejtburWey6xhP+w1GsVIQdinamP3o5Th8KyfkC//5KkcdRbKQn
         ra9l03SStVD/fgihXYLyv/m+SJ3lEqgtCbdBMMhS7ua4tMFwneBoZ2rv6cYXMlBB1nGg
         MsqNqaedyUQ/roBKAi7PcUvsl/ld5ll9mlrUeqSCmABJyLvKuu0xYer4tAg5uxzud+jw
         UBNw==
X-Forwarded-Encrypted: i=1; AJvYcCVPG39PHechjToNznMTEhPrBubEduFQhU+qXyx+sCNU8NiG9MpiYjDi9RTEAX/sZ3Tx21sPAWBwpN94P2/NfDRoSQ0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxoh9qaGYiTdr9PXPKgweyA6LpkHF7SVG2h1FcAPgu80Le2FfGJ
	5vmmsxYtAqR/jSEePSycArqRshcR6/gGJYTkuZ2bJVB5W0oOJ0w5MNjBnymxnjZBEK5TTDU4GMK
	Qao61TY/RZC/AO8+HWACmxu0OtMY=
X-Google-Smtp-Source: AGHT+IHeFMxpMLbX2a/UYhKDIndZYFXb+yIw/Qf2F1Ca2fLo6nlhemSTiy2jioCeQR6Sg0Ak9p6fq1sO751kEj/gt2w=
X-Received: by 2002:a05:6820:2208:b0:5ec:1edf:7f35 with SMTP id
 006d021491bc7-5ec5eb2f5f4mr1518629eaf.2.1730251920840; Tue, 29 Oct 2024
 18:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241028112450.2793248-1-max.oss.09@gmail.com> <CAMRc=MdUQ59LmOZAJd=E7qjFiT9UGq2vx4zsHgR3cx7-kNhd=g@mail.gmail.com>
In-Reply-To: <CAMRc=MdUQ59LmOZAJd=E7qjFiT9UGq2vx4zsHgR3cx7-kNhd=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2024 18:31:34 -0700
Message-ID: <CAMKF1srnqVmyuX+PTVAJUWXyN5QZJjc_6JqWy+SNHBpo+LC-tA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod_2.2: depend on glib-2.0
To: brgl@bgdev.pl
Cc: max.oss.09@gmail.com, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 01:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113338

Bart,

On Mon, Oct 28, 2024 at 12:21=E2=80=AFPM Bartosz Golaszewski via
lists.openembedded.org <brgl=3Dbgdev.pl@lists.openembedded.org> wrote:
>
> On Mon, Oct 28, 2024 at 12:26=E2=80=AFPM Max Krummenacher via
> lists.openembedded.org <max.oss.09=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > In my setup a build fails with
> >
> > | checking for gobject-introspection... configure: error: gobject-intro=
spection-1.0 is not installed
> > | NOTE: The following config.log files may provide further information.
> > | NOTE: /var/home/krm/build/oe-core_master/build/tmp/work/cortexa55-tdx=
-linux/libgpiod/2.2/build/config.log
> > | ERROR: configure failed
> >
> > From config.log this seems to be related to glib-2.0 not found:
> >
> > | configure:22484: $PKG_CONFIG --exists --print-errors "gobject-introsp=
ection-1.0"
> > | Package glib-2.0 was not found in the pkg-config search path.
> > | Perhaps you should add the directory containing `glib-2.0.pc'
> > | to the PKG_CONFIG_PATH environment variable
> > | Package 'glib-2.0', required by 'gobject-introspection-1.0', not foun=
d
> > | configure:22487: $? =3D 1
> > | configure:22491: error: gobject-introspection-1.0 is not installed
> >
> > Note that glib-2.0.pc is present in recipes-sysroot-native but not
> > in recipes-sysroot.
> >
> > Adding glib-2.0 to depends allows successful build of libgpiod 2.
> >
> > Fixes: 117d09ce43c7 ("libgpiod: update to v2.2")
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > I'm unsure if that is the correct fix.
> > I would have expected that if gobject-introspection-1.0.pc depends
> > on glib-2.0 to be present, then the inherit of gobject-introspection
> > would have done the needful.
> > However I'm not really familiar with gobject-introspection in the
> > first place.
> >
> > Max
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe=
/recipes-support/libgpiod/libgpiod_2.2.bb
> > index b55da72f7b7f..3d9758e27af7 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
> > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D " \
> >      file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1e=
9a20f \
> >  "
> >
> > +DEPENDS +=3D "glib-2.0"
> > +
>
> Pulling in the entire GLib for everything in this recipe is definitely
> a wrong answer. I'm travelling and have limited time right now but I
> will take a look on Thursday or Friday. I did test disabling
> introspection though so I'm surprised to see this.
>

There is a problem with this when --enable-introspection is used
without ptests being in distro features
the reason it works with ptests on is that it enables 'test'
packageconfig which brings in glib-2.0 dependency
however if we build without 'ptest' DISTRO_FEATURE it will fail to
configure like below

   configure:22490: checking for gobject-introspection
   configure:22499: $PKG_CONFIG --exists --print-errors
"gobject-introspection-1.0"
   Package glib-2.0 was not found in the pkg-config search path.
   Perhaps you should add the directory containing `glib-2.0.pc'
   to the PKG_CONFIG_PATH environment variable
   Package 'glib-2.0', required by 'gobject-introspection-1.0', not found
   configure:22502: $? =3D 1
   configure:22506: error: gobject-introspection-1.0 is not installed

The check inconfigure,ac is using GOBJECT_INTROSPECTION_CHECK macro
which is expanding to this
check I guess.

It seems that glib-2.0 is a hard dep for gobject-introspection so it
might be better to add it in bbclass itself.

> Bart
>
> >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> >
> >  SRC_URI +=3D "file://gpio-manager.init"
> > --
> > 2.42.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113265): https://lists.openembedded.org/g/openembedde=
d-devel/message/113265
> Mute This Topic: https://lists.openembedded.org/mt/109255084/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

