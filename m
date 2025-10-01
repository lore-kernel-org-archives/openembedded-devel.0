Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0812BCCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 23:53:49 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.738.1759362822106144642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 16:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0YtKSWs;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-43f494764a2so286010b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759362821; x=1759967621; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zUQvs0e3z3XJMjVBatF6FR7b/+Kc0RaVtdSheRJNLc=;
        b=Z0YtKSWsAgykBDWzpj2QBrNdLm+/YN7cMdVPGpc2OUtEtJHVQhxnDotI0WHqmraEe0
         IpQseYbyWwv4t1BXJRqrEcjwF3zuTojmWUkmSJBX4TzJ/jbxyfFzdrT29wekNsiPHsCD
         9yDdb7nmlLITsaIPYDZqVMX8T+1joPwZCQPfeyGA+sawBzmQw2YjLsItMxX9nQpQmJC2
         Yq1Npec8CKJk/Hgb42iRqDzyUV1oT+ImPiAVTE5kr6OXUEJdh4bR/8Sx20awr4rEQeRE
         K0dAMvFv3bC1uBP5zjILOiEjfh0RbaThzixs7+uk6gGgBRVVUSsmZtWsMhFfmyQUWZl5
         kDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759362821; x=1759967621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zUQvs0e3z3XJMjVBatF6FR7b/+Kc0RaVtdSheRJNLc=;
        b=E5hoSFfOKeq8RvU2HjLJiGH11RcXzb8DGDKxMOSD901XVECQ3bGWVDFX1SV8b16H4o
         m0MeFtqlyxPbLWMBK3dppJZiVPlYWkl6yk3vYLKWF/eZg5yoAHls2sGkwnvFj/tksE43
         X3ty9tmQZlArTD8qywqCES4u/wWsgbc9CAKXVdARxOyfQ3wBrGrPZRu1F+kxaME8hemy
         pvXM9m7RwWPQayLYhjxWh1HENNaG4dKy2Y9F5ICsbMjebQjhhKb/k5dkbbybt8r/tuSz
         hmmfP9cjSqodHmR9/bKNeHdPVSMEIplxvY2ir9SIALpLIauGUOJdZQienYW3FKdBqHya
         bsKA==
X-Gm-Message-State: AOJu0YwJBGFKluP6KgZwiBbSo6dALoK+btfhjxF/j1NHR6LwpVkLCV8s
	epXdP9Qu65y1n35amr05V9oR6kq0fFj79oZCHtl2CwhZL9xkEMqxIoCVfOZn5nmlj64ggsYymEm
	runl/BOAe5LQ0vrT0v7ohcs+zUYtVZbo=
X-Gm-Gg: ASbGncsyOhzp3RJQTUfJ+bcqzQx8OQyKOUb+CQz/ZSbGINUKfdtT8B0VUMHPiDHV2BC
	zbLqNQHkd7d+pt6U3SK5Q+pfAa6S5WQ3lx+sSjmDfFvr7zizaSAyT70xTKltUuow3/3rqNpRNTD
	qAGJkyq1BD972WzZNufkrBH1SDjbZRUhfXelZUIXN/GK0bsVNFZPfXEvCBSF3he9W2TBjdVqcue
	JvHevLiY0yAS/ZcIk3DffhSyJ1kvkAlBg==
X-Google-Smtp-Source: AGHT+IESMdzw87/SydJYuQiHlilsFERwQQnS//lS3VGZqOBDsFoipk8uIUeXUUdxTj88aZ/Y99B01rZVznMu1u8TKiU=
X-Received: by 2002:a05:6808:1a1d:b0:43b:2829:e643 with SMTP id
 5614622812f47-43fa41b5611mr2809032b6e.25.1759362821337; Wed, 01 Oct 2025
 16:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
 <20250930091841.1693131-11-ankur.tyagi85@gmail.com> <88b381ac-b03a-4cab-be24-56bf4ad190a9@gmail.com>
In-Reply-To: <88b381ac-b03a-4cab-be24-56bf4ad190a9@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 2 Oct 2025 12:53:30 +1300
X-Gm-Features: AS18NWD9sxroPVdNz6u-84lVQB7okRMUhWeVDqSb18SQ9BRsRyIAXq1NKtssjis
Message-ID: <CADySD0FaQqSJzYQYW+fm=XFeP5pxuAj5xLOzO2giwCgfLZMTxg@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 10/22] freeglut: changed SRC_URI
 to github + added UPSTREAM_CHECK
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Jan Vermaete <jan.vermaete@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 23:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120147

On Wed, Oct 1, 2025 at 9:34=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> If the SRC_URI is not dead, I would just leave this as it is in Walnascar=
.

SRC_URI still works, we can drop this patch then.

>
> On 9/30/25 11:18, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Jan Vermaete <jan.vermaete@gmail.com>
> >
> > - added HOMEPAGE
> > - downloads are now from github
> >   "Stable releases are available on our releases page on github, where =
you can find more information about each release. All releases are also mir=
rored on the old downloads page on sourceforge."
> >   @see: https://freeglut.sourceforge.net/
> > - fixed 'devtool check-upgrade-status'
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 6afcc7939e74023b06fc8655f4120647e4907f8c)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta=
-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> > index 2cd00b0349..b3a103054f 100644
> > --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> > +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> > @@ -1,9 +1,10 @@
> >  DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative t=
o the OpenGL \
> >                 Utility Toolkit (GLUT) library"
> > +HOMEPAGE =3D "https://freeglut.sourceforge.net"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e7=
8adfb"
> >
> > -SRC_URI =3D "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV=
}/${BPN}-${PV}.tar.gz"
> > +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}=
/${BPN}-${PV}.tar.gz"
> >  SRC_URI[sha256sum] =3D "3c0bcb915d9b180a97edaebd011b7a1de54583a838644d=
cd42bb0ea0c6f3eaec"
> >
> >  inherit cmake features_check pkgconfig
> > @@ -24,6 +25,9 @@ PROVIDES +=3D "mesa-glut"
> >
> >  DEPENDS =3D "virtual/libgl libxi"
> >
> > +UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
> > +UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
> > +
> >  do_install:append() {
> >      # Remove buildpaths
> >      sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeG=
LUTTargets.cmake
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120062): https://lists.openembedded.org/g/openembed=
ded-devel/message/120062
> > Mute This Topic: https://lists.openembedded.org/mt/115510966/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

