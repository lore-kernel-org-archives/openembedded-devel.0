Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D55C25B78
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 15:39:04 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.19118.1715701140158579215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 08:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OY5E4v8E;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c9963a2205so2875970b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715701139; x=1716305939; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/S6c3WsbMEJdb6VpdrmrqjSco+CDXGVuZhdfTE1odY=;
        b=OY5E4v8EuA8q6M2YsFBqRrrbQLJr0EEThuWWf9poxmZdghXtEJNXp5Z/mg/KTjOUcr
         FzAP+baSoEH3kqIcBsAk/AXo5Qq5aSczLrJadKErJdto0FQURxhdxwjrHpAThlBIkh1m
         RybLC6ZPPiUj8+yLC2WGKNBoA/LmhyMdn4i0flU17DUDz3J7IhW3e22nJbTJISxc1BsU
         47Q6/1zPsIdrGVH1Ogb+U8pZr3lvYBqt+5cB+FuFwDnRXUd/tZFVP+y5//X7ntaXM0k8
         MOKcibpZhIriXq+Fy13c5GAZBOOmBb+YWEqwYetNJxhVtGaRpu/T/hPrFDyeGjaiTuBP
         9xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715701139; x=1716305939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/S6c3WsbMEJdb6VpdrmrqjSco+CDXGVuZhdfTE1odY=;
        b=LhVm+Z2lZzuHdDlhXL9moYgG0spEMXPOzR0/Qi6eZdkhDSfQ8ejpJJ73IgY9h+vQcC
         DRQtZBZ98Dv1Wf6itxN8j75XFAAZsasZ6zumRoVLHBWcxusR59eQunXMWCaR0w3g0b5y
         rQoC5o7W5e+id4vcV3qmsJpbs6F95GO8yzriYtzyyVpOhFa6p+/av0Tsb0XNSZ/nlD2e
         B8XY3uiwsSDojZoDoVZZaem0tC/HF6PkYtVRyhcDR/iBhdFoIqPm+rbFmL9A9vWe6c0f
         8zKHpbi4Utoi0KpdU+R0440XZJRkBs9mOZbLkVdZ2gZ7PQrKItkulC69YqHzTmFpM5Fr
         NpAw==
X-Gm-Message-State: AOJu0YymSdwcqWvJGkLRWJDDz6Oll0+3YbklcMqOMdO/sh/TYAfDT+dB
	kcJOPJhLwrVTTRyfBVUUIg67nadbXvi0EBKGYJP3b/GOgyfpORcLDGglicP2yYIkux5zA8Bd8Rv
	25SH9ny8SkXXOC+lnnJZ4qtn1jqaI+AEd
X-Google-Smtp-Source: AGHT+IF7kmY9/SrbnlGfQxQGAVRaNyqPBXt6zUHvz/iuWL3FA4lyRkSX+t0vGmIqj86UQiPg6y8TydBb61iPQO+/nXs=
X-Received: by 2002:a05:6870:61d6:b0:229:fd96:1e6f with SMTP id
 586e51a60fabf-24172bb1a3cmr16536168fac.24.1715701139329; Tue, 14 May 2024
 08:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240509192537.1639358-1-raj.khem@gmail.com> <CA+chaQc2R1MGecp6CMXwDT_28gzgzfcG+wJb_pXNOPM99R_ofQ@mail.gmail.com>
 <CAMKF1sqQqawoTZj8bRtkurXGk5fFNjmca+9BYsQfmNw7KKGZzg@mail.gmail.com> <CA+chaQcctpGP0pTaOTfKpQ-tDCBkubUCLaxGrJM51TLmUWD-KQ@mail.gmail.com>
In-Reply-To: <CA+chaQcctpGP0pTaOTfKpQ-tDCBkubUCLaxGrJM51TLmUWD-KQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 May 2024 08:38:33 -0700
Message-ID: <CAMKF1sqXbOitXQSa5LOQ7jXDYs37pjxNBL9wsVUcBhFLEPvoxg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] freerdp: Upgrade to 2.11.7
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 15:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110396

On Tue, May 14, 2024 at 8:24=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> I've seen it with qemux86-64 and raspberrypi4-64 last night, both in
> DISTRO without x11 in DISTRO_FEATURES.
>
> freerdp3_3.5.1 doesn't seem to have this issue, version 2 was fixed last =
week:
> https://github.com/FreeRDP/FreeRDP/commit/4f411197dc9d2076f00748b1178a60b=
2423030bf
>
> will send a backport.
>

Superb, thanks for tracking it down.

> On Tue, May 14, 2024 at 5:17=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Mon, May 13, 2024 at 11:39=E2=80=AFPM Martin Jansa <martin.jansa@gma=
il.com> wrote:
> > >
> > > On Thu, May 9, 2024 at 9:25=E2=80=AFPM Khem Raj via lists.openembedde=
d.org
> > > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > Partially backport a fix to build with gcc-14
> > >
> > > It fixes it only partially, right?
> > >
> > > I'm stills seeing:
> > >
> > > freerdp/2.11.7/git/libfreerdp/core/info.c:88:39: error: initializatio=
n
> > > of 'const WCHAR *' {aka 'const short unsigned int *'} from
> > > incompatible pointer type 'BYTE *' {aka 'unsigned char *'}
> > > [-Wincompatible-pointer-types]
> > >    88 |                 const WCHAR* domain =3D Stream_Pointer(s);
> > >       |                                       ^~~~~~~~~~~~~~
> > >
> >
> > Interesting, I did not encounter this, perhaps different machines maybe=
 ?
> >
> > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  .../0001-Fixed-compilation-warnings.patch     | 27 +++++++++++++++=
++++
> > > >  .../{freerdp_2.11.2.bb =3D> freerdp_2.11.7.bb}  |  3 ++-
> > > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > > >  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fi=
xed-compilation-warnings.patch
> > > >  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb =3D> fre=
erdp_2.11.7.bb} (97%)
> > > >
> > > > diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-com=
pilation-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixe=
d-compilation-warnings.patch
> > > > new file mode 100644
> > > > index 0000000000..7fae2703f8
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilatio=
n-warnings.patch
> > > > @@ -0,0 +1,27 @@
> > > > +From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 =
2001
> > > > +From: akallabeth <akallabeth@posteo.net>
> > > > +Date: Mon, 4 Jul 2022 14:34:46 +0200
> > > > +Subject: [PATCH] Fixed compilation warnings
> > > > +
> > > > +Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/comm=
it/2da280b8a1748052b70b3f5a1ef0d8e932c33adc]
> > > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > +---
> > > > + client/X11/xf_graphics.c | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> > > > +index 5aa1fd48b..fe81e0ed9 100644
> > > > +--- a/client/X11/xf_graphics.c
> > > > ++++ b/client/X11/xf_graphics.c
> > > > +@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context=
, rdpPointer* pointer)
> > > > +
> > > > + #endif
> > > > + fail:
> > > > +-      WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
> > > > ++      WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
> > > > +       return rc;
> > > > + }
> > > > +
> > > > +--
> > > > +2.45.0
> > > > +
> > > > diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb b/me=
ta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > > similarity index 97%
> > > > rename from meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> > > > rename to meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > > index 3319488051..43c38bf9c9 100644
> > > > --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> > > > +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> > > > @@ -13,9 +13,10 @@ inherit pkgconfig cmake gitpkgv
> > > >  PE =3D "1"
> > > >  PKGV =3D "${GITPKGVTAG}"
> > > >
> > > > -SRCREV =3D "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
> > > > +SRCREV =3D "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
> > > >  SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-=
2.0;protocol=3Dhttps \
> > > >             file://winpr-makecert-Build-with-install-RPATH.patch \
> > > > +           file://0001-Fixed-compilation-warnings.patch \
> > > >             file://0001-Fix-const-qualifier-error.patch \
> > > >             file://0002-Do-not-install-tools-a-CMake-targets.patch =
\
> > > >             "
> > > > --
> > > > 2.45.0
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#110294): https://lists.openembedded.org/g/opene=
mbedded-devel/message/110294
> > > > Mute This Topic: https://lists.openembedded.org/mt/106007932/361715=
6
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [martin.jansa@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

