Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93215C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 09:02:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.47884.1703149370143113354
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 01:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LU1nH+cZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50bdec453c8so664159e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703149368; x=1703754168; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP1ivNc3UyBUegaDZnFnKcfcMOC8noFMhuw62CM0cJ8=;
        b=LU1nH+cZsNK3H4trEYpt2uCpRpn3+36RSr+Duy8mWIvTW3SBRvpfuFb/3NxN7uU38U
         +cy5sY0Mf3fDuxOo0aEp+ZbAtPwwRCnznt4X/97gZ4GGoqJhHaHgitoShzIeFk7kdoJX
         cn6kqstUi6MljU9VkELgviIBLH3aAp3FJkMz4NsyLtgpHBr1iryOVKv1ZusjREMmfi/z
         ppTZpGhCgHeQj0TdlD0QwZvqPwat/jxoUWi4YWj9be6JvbH7eugy8Wl5SkNHmOkknG2Z
         IpUUlQrhYihjSOAEymXhNvZBhffjtQUTfG8PrRasbXtqGw5C0Kbi+ZdBA6bg01dlkE/9
         jMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149368; x=1703754168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP1ivNc3UyBUegaDZnFnKcfcMOC8noFMhuw62CM0cJ8=;
        b=Dy7LxdxnnIMLSJlq42xEPzWP0kZXlurMntn6TCYCoUVKnn26eYobp0UXY+zQplp5q0
         um1TWnTBumHvygGuPrejCueEz9LwBL44RlmRs3S7PawjD2+853jtkwUL99eSBay/0ASH
         b8DXv3N3TbQvv7zxhTJEB3/lIWKX9m8HQfLjI/VEuIVP0hDBINDnJqRlx17EUGr7xuiR
         8RjGIpz/sHaQoZUKuX7hRzfNP5xkHyXMnPxRFe88hbJTfBmo/EGTq/crseheEsbZqjOq
         GAcblHwBWcQfeJ0ASpO10S3Ovv+B/X+15uEO+2o9Mnr47Q2ZPyVJUIJ0MEvLkehALQTI
         3xug==
X-Gm-Message-State: AOJu0YyA/DqrIb6CiWao+VX+sVDijNH1hSVSPAXtj5eGXRAtmFF/PlmV
	ONEXIjuUoEdHtgWJ1JMvhOo5Xd+v25ogGNsEprQ=
X-Google-Smtp-Source: AGHT+IHn7Q7dMPK6TRBGoFwjYTMsVNai0cceWQ5ud0ORCRsukptTPwt7cOE5igTYcMcWf8x8Y5KjFpvnISDJbL8pMmY=
X-Received: by 2002:a05:6512:33c8:b0:50b:e08a:4d00 with SMTP id
 d8-20020a05651233c800b0050be08a4d00mr13126557lfg.84.1703149367875; Thu, 21
 Dec 2023 01:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20231220205518.6966-1-alex.kiernan@gmail.com> <731f340b-e2a7-4597-97c2-dde6123e7f8a@gmail.com>
In-Reply-To: <731f340b-e2a7-4597-97c2-dde6123e7f8a@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 21 Dec 2023 09:02:36 +0000
Message-ID: <CAO5Uq5TJtSdGF0bUP0LAi+GrVGimXS890OQcts3MRhjQvzO-0A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] c-ares: Move to tarballs, add ptest and
 static support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 09:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107702

On Thu, Dec 21, 2023 at 12:35=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On 12/20/23 12:55 PM, Alex Kiernan wrote:
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > Changes in v2:
> > - Use relative path to arestest
> >
> >   .../recipes-support/c-ares/c-ares/run-ptest   |  7 +++++++
> >   .../recipes-support/c-ares/c-ares_1.24.0.bb   | 19 ++++++++++++++----=
-
> >   2 files changed, 21 insertions(+), 5 deletions(-)
> >   create mode 100644 meta-oe/recipes-support/c-ares/c-ares/run-ptest
> >
> > diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/=
recipes-support/c-ares/c-ares/run-ptest
> > new file mode 100644
> > index 000000000000..15971dec058c
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
> > @@ -0,0 +1,7 @@
> > +#!/bin/sh
> > +
> > +if ./arestest; then
> > +     echo "PASS: c-ares"
> > +else
> > +     echo "FAIL: c-ares"
> > +fi
>
> I wonder if it could be added to regular runs with ptest images and
> therefore added to PTESTS_FAST_META_OE ( if it runs with in 30s ) or
> PTESTS_SLOW_META_OE in meta-oe/conf/include/ptest-packagelists-meta-oe.in=
c
>

Probably PTESTS_SLOW_META_OE - it's about a minute (I suspect mostly
because there are timeout tests in there). Also the "live" tests fail
if you just do it inside a default runqemu because we have no default
resolv.conf there.

That said it'd be nice to get this tested - I'll have a look at it
(possibly a nice Christmas project!)

> > diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb b/meta-oe/=
recipes-support/c-ares/c-ares_1.24.0.bb
> > index 2171002aa95e..3b3b2b83febc 100644
> > --- a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
> > +++ b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
> > @@ -5,14 +5,23 @@ SECTION =3D "libs"
> >   LICENSE =3D "MIT"
> >   LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfdbc58a6da11a9f68aa73c4=
53818decc"
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
> > +     install -d ${D}${PTEST_PATH}
> > +     install -m 0755 ${B}/bin/arestest ${D}${PTEST_PATH}
> > +     install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
> > +}
> >
> >   PACKAGE_BEFORE_PN =3D "${PN}-utils"
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107672): https://lists.openembedded.org/g/openembed=
ded-devel/message/107672
> > Mute This Topic: https://lists.openembedded.org/mt/103288852/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

