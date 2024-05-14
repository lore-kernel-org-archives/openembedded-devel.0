Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927B1C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:24:24 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.18707.1715700262748289278
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 08:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+7jNVU4;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51f3761c96aso6875826e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715700261; x=1716305061; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9AkzjgPVPzEjLuVWdpe089wRz8NrYSwL0Vx5TBmJIE=;
        b=J+7jNVU4+JVhja3xfiYDEwX/iKdRQaca8XOtXmDqgDWJ/BC0MkE9/UzeGG/3EbPlxZ
         9eTG1SfNkkJ7OUFu+pNOK5/RVbach1w5gpmyNrn219XXw/doytX3Z8p9edDop2Hj+yDe
         Plf1LE5zDgQ2ZMGCCZeVipqRjCxLPE97X20xyYcrPvmeZpdnrYRwiGnO84dY4q2hr7Zw
         OQoMSpORb4phZvNTuLRsoAwKSwutdH0DP8SOmemp70o++DQFCy7i+lWyJd+7M9++WUn/
         FV6a4ndS5tY6Ak7FM+trRxQ8k4NO/BEf8FWSxJKziMl5SXYd99Gea8NzA+DRa+cUCUnj
         XwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715700261; x=1716305061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9AkzjgPVPzEjLuVWdpe089wRz8NrYSwL0Vx5TBmJIE=;
        b=Ji4toPDENqtNAWFkAznNAOQNYr5uSj5082RpxZX1k4J4t7tf5yiAgKhtE64sIbb94Z
         PP7Kbae0SyJt41lP8P4X5wC5lHlRMtmVe9fObC/m4U/lfOSayM/IFSwuEPsHf90VY/7z
         ul2c2+90RUOBUVkpK7OUh7hWeo7pXCUWniyKyK7VVNw0/2rkxUQF5z0oSjUQ+HRZTkET
         m190w4b/VmYnoOzPprqJyB9j3BIh5pxY43eHe8ZQU7yc3tnCuVzQcmCcbgCPBqaE4y7/
         wfxlLpJjBsSomsucISW9SyL/C5IdHg/2lmLJmSx09/Nuq1ydO92k6yzANSkmiOwWFzbM
         K+yQ==
X-Gm-Message-State: AOJu0YxXWAxrGIbhC3xv1FKCB+LM1I/A3xyf9zUKQaVN8S9g5LVEdaKf
	xLPC6sqXKoNfnI7z6We9oRpREQOLqImcMdIe0PUuz2JZMAI3TlxJ2BEKiveF8uSPvR4a8cJPMt4
	oJdeUjAEfNp57rkSb5m5i5uAiv6A=
X-Google-Smtp-Source: AGHT+IGTlhC4JNJfgQBzFTBzDoq7ec4lkEKlZ2jcowAjnanV56a+YWWdGgHVkxFkC5yPsVz49mNY+g1LbUJ8EZsN3PQ=
X-Received: by 2002:ac2:5e69:0:b0:520:ed4e:2203 with SMTP id
 2adb3069b0e04-5220fc6e674mr11467678e87.8.1715700260476; Tue, 14 May 2024
 08:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240509192537.1639358-1-raj.khem@gmail.com> <CA+chaQc2R1MGecp6CMXwDT_28gzgzfcG+wJb_pXNOPM99R_ofQ@mail.gmail.com>
 <CAMKF1sqQqawoTZj8bRtkurXGk5fFNjmca+9BYsQfmNw7KKGZzg@mail.gmail.com>
In-Reply-To: <CAMKF1sqQqawoTZj8bRtkurXGk5fFNjmca+9BYsQfmNw7KKGZzg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 May 2024 17:24:07 +0200
Message-ID: <CA+chaQcctpGP0pTaOTfKpQ-tDCBkubUCLaxGrJM51TLmUWD-KQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] freerdp: Upgrade to 2.11.7
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 15:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110394

I've seen it with qemux86-64 and raspberrypi4-64 last night, both in
DISTRO without x11 in DISTRO_FEATURES.

freerdp3_3.5.1 doesn't seem to have this issue, version 2 was fixed last we=
ek:
https://github.com/FreeRDP/FreeRDP/commit/4f411197dc9d2076f00748b1178a60b24=
23030bf

will send a backport.

On Tue, May 14, 2024 at 5:17=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, May 13, 2024 at 11:39=E2=80=AFPM Martin Jansa <martin.jansa@gmail=
.com> wrote:
> >
> > On Thu, May 9, 2024 at 9:25=E2=80=AFPM Khem Raj via lists.openembedded.=
org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > Partially backport a fix to build with gcc-14
> >
> > It fixes it only partially, right?
> >
> > I'm stills seeing:
> >
> > freerdp/2.11.7/git/libfreerdp/core/info.c:88:39: error: initialization
> > of 'const WCHAR *' {aka 'const short unsigned int *'} from
> > incompatible pointer type 'BYTE *' {aka 'unsigned char *'}
> > [-Wincompatible-pointer-types]
> >    88 |                 const WCHAR* domain =3D Stream_Pointer(s);
> >       |                                       ^~~~~~~~~~~~~~
> >
>
> Interesting, I did not encounter this, perhaps different machines maybe ?
>
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../0001-Fixed-compilation-warnings.patch     | 27 +++++++++++++++++=
++
> > >  .../{freerdp_2.11.2.bb =3D> freerdp_2.11.7.bb}  |  3 ++-
> > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixe=
d-compilation-warnings.patch
> > >  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb =3D> freer=
dp_2.11.7.bb} (97%)
> > >
> > > diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compi=
lation-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-=
compilation-warnings.patch
> > > new file mode 100644
> > > index 0000000000..7fae2703f8
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-=
warnings.patch
> > > @@ -0,0 +1,27 @@
> > > +From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 20=
01
> > > +From: akallabeth <akallabeth@posteo.net>
> > > +Date: Mon, 4 Jul 2022 14:34:46 +0200
> > > +Subject: [PATCH] Fixed compilation warnings
> > > +
> > > +Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit=
/2da280b8a1748052b70b3f5a1ef0d8e932c33adc]
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + client/X11/xf_graphics.c | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> > > +index 5aa1fd48b..fe81e0ed9 100644
> > > +--- a/client/X11/xf_graphics.c
> > > ++++ b/client/X11/xf_graphics.c
> > > +@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, =
rdpPointer* pointer)
> > > +
> > > + #endif
> > > + fail:
> > > +-      WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
> > > ++      WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
> > > +       return rc;
> > > + }
> > > +
> > > +--
> > > +2.45.0
> > > +
> > > diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb b/meta=
-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > similarity index 97%
> > > rename from meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> > > rename to meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > index 3319488051..43c38bf9c9 100644
> > > --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> > > +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > @@ -13,9 +13,10 @@ inherit pkgconfig cmake gitpkgv
> > >  PE =3D "1"
> > >  PKGV =3D "${GITPKGVTAG}"
> > >
> > > -SRCREV =3D "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
> > > +SRCREV =3D "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
> > >  SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.=
0;protocol=3Dhttps \
> > >             file://winpr-makecert-Build-with-install-RPATH.patch \
> > > +           file://0001-Fixed-compilation-warnings.patch \
> > >             file://0001-Fix-const-qualifier-error.patch \
> > >             file://0002-Do-not-install-tools-a-CMake-targets.patch \
> > >             "
> > > --
> > > 2.45.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#110294): https://lists.openembedded.org/g/openemb=
edded-devel/message/110294
> > > Mute This Topic: https://lists.openembedded.org/mt/106007932/3617156
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

