Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFCEC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 20:43:13 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.31749.1703104991751957470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 12:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bTBrh3wA;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e39ac39bcso150537e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 12:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703104990; x=1703709790; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GG7jN3C+7NWncZ2amkNX0vQ368EWv/RjxflU1VKukM=;
        b=bTBrh3wAqjPsBIoVeKc5h0QoqBRRejfvldJFfTKuCyLWlWMSmRr8clTol2dtTY42zZ
         I9YqOMbzWXYPXKK8b5Eb3kKolgEUZnLRTODgTVD+oWPNSIa1p7YEQsbh+lG+MYS/vGpr
         YZTrvBLoXFzzgBWxnWKW3BSW1jlQezetw1jv2Ltnpkx/NzQ5dtpsD81WCnXQPscb2FGr
         YaTUZ7MAHjS8BNr57u0vF7SfOZcpm5f7/7AGNlZVLL9n6pywvfzSJJEzmxcFE0cXqVSe
         CJ9TRtdsK0fR25Nk9gr0wUPkPtwBvkjAMBn3D10zjrLMSk5IWQzsq1z02qyWRxaWN2TS
         fJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703104990; x=1703709790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GG7jN3C+7NWncZ2amkNX0vQ368EWv/RjxflU1VKukM=;
        b=DVLuMKKUl0ar/bT+zu+hzgwCo+gQoujehUq5UvbmE0TodyG7pFnPJTXZUHOaEd+/gs
         P5iRAjVQyGl7UxJ6bMeifC0X0oVrYMGFgMQL9sBCAV2deSczO/CYWBZLIH2pVGzKSUPG
         1eYyTj/THBaScgE+2EU3j7mXUOSoUykSYgjMzzByg5M34ESx+G914Zfz/+CHh5UkFItA
         9sbf5FSa4kMJNhCUZqxefHMBysoOkzW04gnPqPTMfPPU/8dOXhReVWrq5FGUhQwFWC1O
         lQGpvYYkDqRGzkxJGirYV8Q/Ht8nL3+ksMJsVDurxRFzc8/ZPXkgETjIkJjy2ZbgM5Rl
         WlWQ==
X-Gm-Message-State: AOJu0YzWNMEYukK/GO/yJknNYoUJfk5KSuE2S5Nbju2tnt1IPrEXss77
	zX4K8/QetFOeHeqIpb8EtIUnytzhTkn5wAZ7Ks4=
X-Google-Smtp-Source: AGHT+IGTMj0rvvJqDLKOO948Z9r2O3zDTjOeADhze8O8pKD5Mitt53UTLk+rJPWLZcrSiUzC+TFQXq3UYXmjplmgJ2U=
X-Received: by 2002:a05:6512:411:b0:50e:39e8:6b8f with SMTP id
 u17-20020a056512041100b0050e39e86b8fmr1235374lfk.112.1703104989532; Wed, 20
 Dec 2023 12:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20231220200805.27842-1-alex.kiernan@gmail.com> <CAMKF1sqoYgpj7oMrOiKMd4pUv3POMjoc4040cVYx4Ytj=DUnCg@mail.gmail.com>
In-Reply-To: <CAMKF1sqoYgpj7oMrOiKMd4pUv3POMjoc4040cVYx4Ytj=DUnCg@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 20 Dec 2023 20:42:58 +0000
Message-ID: <CAO5Uq5Tjt9_EnLya1n-iEKaYchN8atY6ZCc4BOwnBCK+=L=5eQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] c-ares: Move to tarballs, add ptest and
 static support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 20:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107670

On Wed, Dec 20, 2023 at 8:40=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Wed, Dec 20, 2023 at 12:08=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail=
.com> wrote:
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  .../recipes-support/c-ares/c-ares/run-ptest   |  7 +++++++
> >  .../recipes-support/c-ares/c-ares_1.24.0.bb   | 19 ++++++++++++++-----
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/run-ptest
> >
> > diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/=
recipes-support/c-ares/c-ares/run-ptest
> > new file mode 100644
> > index 000000000000..ec115a535217
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
> > @@ -0,0 +1,7 @@
> > +#!/bin/sh
> > +
> > +if /usr/lib/c-ares/ptest/arestest; then
>
> hardcoding /usr/lib might not work in all cases e.g. where baselib is
> lib64 e.g. perhaps on ppc64 or multilib x86_64
>

I stupidly copied it from another recipe... I even thought that at the
time and then completely forgot :|

> > +       echo "PASS: c-ares"
> > +else
> > +       echo "FAIL: c-ares"
> > +fi
> > diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb b/meta-oe/=
recipes-support/c-ares/c-ares_1.24.0.bb
> > index 2171002aa95e..3b3b2b83febc 100644
> > --- a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
> > +++ b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
> > @@ -5,14 +5,23 @@ SECTION =3D "libs"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfdbc58a6da11a9f68aa73c45=
3818decc"
> >
> > -SRC_URI =3D "git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=
=3Dhttps"
> > -SRCREV =3D "972f456f2808b4e4b1730c90ab506f6af5f4c725"
> > +SRC_URI =3D "https://c-ares.org/download/c-ares-1.24.0.tar.gz \
> > +           file://run-ptest"
> > +SRC_URI[sha256sum] =3D "c517de6d5ac9cd55a9b72c1541c3e25b84588421817b5f=
092850ac09a8df5103"
> >
> > -UPSTREAM_CHECK_GITTAGREGEX =3D "cares-(?P<pver>\d+_(\d_?)+)"
> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests'=
, '', d)}"
> > +PACKAGECONFIG[manpages] =3D ""
> > +PACKAGECONFIG[tests] =3D "-DCARES_BUILD_TESTS=3DON,-DCARES_BUILD_TESTS=
=3DOFF,googletest"
> >
> > -S =3D "${WORKDIR}/git"
> > +inherit cmake manpages pkgconfig ptest
> >
> > -inherit cmake pkgconfig
> > +EXTRA_OECMAKE =3D "-DCARES_STATIC=3D${@ 'ON' if d.getVar('DISABLE_STAT=
IC') =3D=3D '' else 'OFF' }"
> > +
> > +do_install_ptest () {
> > +       install -d ${D}${PTEST_PATH}
> > +       install -m 0755 ${B}/bin/arestest ${D}${PTEST_PATH}
> > +       install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
> > +}
> >
> >  PACKAGE_BEFORE_PN =3D "${PN}-utils"
> >
> > --
> > 2.39.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107667): https://lists.openembedded.org/g/openembed=
ded-devel/message/107667
> > Mute This Topic: https://lists.openembedded.org/mt/103288008/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

