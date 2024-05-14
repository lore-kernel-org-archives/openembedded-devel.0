Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93647C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:17:14 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.18502.1715699833382402157
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 08:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MtxerCeK;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-23f2996b634so3401920fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715699832; x=1716304632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8af32S/fMFQ2MwtPi+2BOHK4kwqhYTAKrXsaX2y3Rg=;
        b=MtxerCeKOzUEdyP3ZiJMOrDk4gH6ctzONaK1G+EmMfTDRD/g3pOISBlpTaYBL+HYqR
         W7Bn2yM+s0EDQYNkE54jiEMOT1ftgU8smT/gtiANmeRES2iV67h5s2uPMtaidtGJpmNZ
         uRvRzmh91JouZd1f8vc3deJ1yCXaPYCbDRplxqHzb0oQLG6XXb/Za2FfP0ICLA2Iheh/
         ivKU1W5zmFT/dwNC47Hq2TTHhHIJfwOmII1m/unT4cPIxe1AnapAIKkxz2BrQYyg95dZ
         GhvntLT1smLmFIwL+U9NxS3c8AhGP7iNWjqfJulcr7E9XCGKBflk46HYkiMpyQu9fNU/
         K+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715699832; x=1716304632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8af32S/fMFQ2MwtPi+2BOHK4kwqhYTAKrXsaX2y3Rg=;
        b=gOeg/4WMQ5nlt1kh27BX4kCYODsbrFJK8H0rEEuSbfwH8GBanmpLp9ddXAXs7uALiK
         gWos2OxnHNYDo9mv24lZtG6J6h95FaDKQePNrPiPeQi/vynj/387krDL9T97E3r7TSWW
         PwJXUSXvuWeYPbUmFOT7ptpoW3DYPypd781ipD8GEWRNn7TYcWPlyh9HS2JR+frVakaE
         TbqMLlidDqnBNR7LnhOGqaJKp2iDE2HY9PjYvPS+hkdFJ/PwKu+sHNAdVNh8sp5mSf0a
         5+PaFRDkSUr9fpFoaKp2w/S5L4/1oZqNwx+pwMAkR6KtNNVq3Vfhg5U/XKyKYCXjGttV
         Bw0Q==
X-Gm-Message-State: AOJu0Yyauy9UX68Q68kONRXBmf/eowOUA3O0wvsueoxSu9aEfWLdfbPd
	6WowZ32KRr3uwa7kYXodThackb8qVf02f4kj3oZWbm2oU6YJmLrPhpK1jslN2Vq/LPoW6tJHaBx
	tmuSgz/njPMWbPEDSr5BzWGMSjB4=
X-Google-Smtp-Source: AGHT+IEzfNKPeQYmJFW95SmZmiNOOcFVLzV7TVWfnevFBcgomtTej5ZMAE7ThIkuT1ug5Z7S1ZFIpe313TakLG26FCI=
X-Received: by 2002:a05:6870:10c7:b0:23b:27:b103 with SMTP id
 586e51a60fabf-24172bc07e1mr11905306fac.29.1715699832657; Tue, 14 May 2024
 08:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240509192537.1639358-1-raj.khem@gmail.com> <CA+chaQc2R1MGecp6CMXwDT_28gzgzfcG+wJb_pXNOPM99R_ofQ@mail.gmail.com>
In-Reply-To: <CA+chaQc2R1MGecp6CMXwDT_28gzgzfcG+wJb_pXNOPM99R_ofQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 May 2024 08:16:45 -0700
Message-ID: <CAMKF1sqQqawoTZj8bRtkurXGk5fFNjmca+9BYsQfmNw7KKGZzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] freerdp: Upgrade to 2.11.7
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 15:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110393

On Mon, May 13, 2024 at 11:39=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> On Thu, May 9, 2024 at 9:25=E2=80=AFPM Khem Raj via lists.openembedded.or=
g
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Partially backport a fix to build with gcc-14
>
> It fixes it only partially, right?
>
> I'm stills seeing:
>
> freerdp/2.11.7/git/libfreerdp/core/info.c:88:39: error: initialization
> of 'const WCHAR *' {aka 'const short unsigned int *'} from
> incompatible pointer type 'BYTE *' {aka 'unsigned char *'}
> [-Wincompatible-pointer-types]
>    88 |                 const WCHAR* domain =3D Stream_Pointer(s);
>       |                                       ^~~~~~~~~~~~~~
>

Interesting, I did not encounter this, perhaps different machines maybe ?

>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../0001-Fixed-compilation-warnings.patch     | 27 +++++++++++++++++++
> >  .../{freerdp_2.11.2.bb =3D> freerdp_2.11.7.bb}  |  3 ++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-=
compilation-warnings.patch
> >  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb =3D> freerdp=
_2.11.7.bb} (97%)
> >
> > diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compila=
tion-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-co=
mpilation-warnings.patch
> > new file mode 100644
> > index 0000000000..7fae2703f8
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-wa=
rnings.patch
> > @@ -0,0 +1,27 @@
> > +From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 2001
> > +From: akallabeth <akallabeth@posteo.net>
> > +Date: Mon, 4 Jul 2022 14:34:46 +0200
> > +Subject: [PATCH] Fixed compilation warnings
> > +
> > +Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2=
da280b8a1748052b70b3f5a1ef0d8e932c33adc]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + client/X11/xf_graphics.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> > +index 5aa1fd48b..fe81e0ed9 100644
> > +--- a/client/X11/xf_graphics.c
> > ++++ b/client/X11/xf_graphics.c
> > +@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rd=
pPointer* pointer)
> > +
> > + #endif
> > + fail:
> > +-      WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
> > ++      WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
> > +       return rc;
> > + }
> > +
> > +--
> > +2.45.0
> > +
> > diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb b/meta-o=
e/recipes-support/freerdp/freerdp_2.11.7.bb
> > similarity index 97%
> > rename from meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> > rename to meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > index 3319488051..43c38bf9c9 100644
> > --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> > +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > @@ -13,9 +13,10 @@ inherit pkgconfig cmake gitpkgv
> >  PE =3D "1"
> >  PKGV =3D "${GITPKGVTAG}"
> >
> > -SRCREV =3D "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
> > +SRCREV =3D "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
> >  SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;=
protocol=3Dhttps \
> >             file://winpr-makecert-Build-with-install-RPATH.patch \
> > +           file://0001-Fixed-compilation-warnings.patch \
> >             file://0001-Fix-const-qualifier-error.patch \
> >             file://0002-Do-not-install-tools-a-CMake-targets.patch \
> >             "
> > --
> > 2.45.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110294): https://lists.openembedded.org/g/openembed=
ded-devel/message/110294
> > Mute This Topic: https://lists.openembedded.org/mt/106007932/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

