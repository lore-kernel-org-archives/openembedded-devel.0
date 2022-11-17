Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED7BC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 14:00:44 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.16214.1668693641653203872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 06:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U4P/BgUt;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id f7so2646735edc.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqFLk2j3h7+BFqPKpD1Eayajc1DtbP4rZQ4evYy0T6g=;
        b=U4P/BgUtp3fyPzq6dFnw/9nXzR77RyYhKQ3Pgys0wu8m0pUgJlGVLlVWgkdYKWhxrR
         INFT1tseT/Qiuigm0rWt8ACFmvL8vEuHJ7dCTWWzo7aFZ52mJp71Zq6Fx6pH5koyeGGX
         8Tnsk/CvZYpX5nuUjHqSqvDMl15qgakBQ/m4yKGupRPY1t+3BSBhiGTuvr4Omn592M5+
         1Uj4qSlISYcFTDHrPOvdAP+tKCI8ah+MYZtTykDFgdoMioDfZCUwdtX5P+mkxAr2IGwt
         3V1XsrJhR7zCqEI5OXcB41MIIPOgxuwLtPhrTIhtHLIwXNgjXUuXmbSjRxBP4UDdwe/A
         XvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqFLk2j3h7+BFqPKpD1Eayajc1DtbP4rZQ4evYy0T6g=;
        b=qM006facdvjp5QR0PW2S9BKN6gp2TWceRt05GIKDDk06glvf3Ye8Jt6HEOfN0DxDQl
         v1x3PuXN4NrIqdmUT4P760Ogn71Lh+wBo5jy3Bg0vTuTzvLDbsgA8fRqtN+Wy44fRIXh
         6j3iag+NnCpELHzF1JKXLaepB6hxUqX68AwFbA3nNQS3vgAYq4qDqOmfCNGS/CQLSxVi
         RZdoKjy9G1xgUvFmld6qMCIm1aiiz4FvVjNvFfhIoEK77FvxNplLub+LmBBO1kHI5SzW
         I7DP003kABMPn2Mgy46Je0pc61KQdploRpuh9r4SuRw2g/vNTl0GX7MgpfDkCwh9pgpU
         9pzA==
X-Gm-Message-State: ANoB5plfvBmDFlPctDrOOkh4wRnezK3jls5TCUAOotX4M0pE3BK73VPt
	/aQxZPUjK0oTtRf3r5rDPVQRmGTNEzmqc6bar50=
X-Google-Smtp-Source: AA0mqf4XI6tO5MMSJHfo538noTncuMOp0r39f1h40dhZ4D6QFHh4yOy8wB2Ur843uQXcsfqLoJM8daAQocoYQsP7mQY=
X-Received: by 2002:a05:6402:f11:b0:467:8813:cab5 with SMTP id
 i17-20020a0564020f1100b004678813cab5mr2230920eda.369.1668693639398; Thu, 17
 Nov 2022 06:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20221115094410.22736-1-peron.clem@gmail.com> <CAMKF1spy2D7ceKAPOSODVck=6Ph-92N-dtzRVF_6xL-D1LKtaA@mail.gmail.com>
In-Reply-To: <CAMKF1spy2D7ceKAPOSODVck=6Ph-92N-dtzRVF_6xL-D1LKtaA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 17 Nov 2022 15:00:27 +0100
Message-ID: <CAJiuCccZSi87tEiQADZW6nJ6tr1=-K+u0KiJVmLDQuRzHEuy6w@mail.gmail.com>
Subject: Re: [PATCH] navigation: bump proj to 9.1.0 library
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 14:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99607

Hi Khem,

On Tue, 15 Nov 2022 at 22:03, Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing build failures
> https://errors.yoctoproject.org/Errors/Details/677151/
> https://errors.yoctoproject.org/Errors/Details/677156/
>
> i think the cmake downloading under the nose in do_configure needs to
> be addressed.

Does an
EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"

Would be acceptable?

Thanks

>
> On Tue, Nov 15, 2022 at 1:44 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > Proj has moved to CMake build system.
> >
> > Update the recipe and make more PACKAGECONFIG available following
> > the ./contrib/oe-stylize.py output.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  .../proj/{proj_8.2.1.bb =3D> proj_9.1.0.bb}      | 18 ++++++++--------=
--
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> >  rename meta-oe/recipes-navigation/proj/{proj_8.2.1.bb =3D> proj_9.1.0.=
bb} (50%)
> >
> > diff --git a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb b/meta-oe/re=
cipes-navigation/proj/proj_9.1.0.bb
> > similarity index 50%
> > rename from meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> > rename to meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> > index 0c1104926..bc3523ec8 100644
> > --- a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> > +++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> > @@ -1,22 +1,20 @@
> >  SUMMARY =3D "PROJ.4 - Cartographic Projections library"
> >  HOMEPAGE =3D "http://trac.osgeo.org/proj/"
> >  SECTION =3D "libs"
> > -
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27445198ba1500f508fce2b183=
ce0ff"
> > +DEPENDS =3D "sqlite3 sqlite3-native"
> >
> >  SRC_URI =3D "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
> > +SRC_URI[sha256sum] =3D "81b2239b94cad0886222cde4f53cb49d34905aad2a1317=
244a0c30a553db2315"
> >
> > -SRC_URI[sha256sum] =3D "76ed3d0c3a348a6693dfae535e5658bbfd47f71cb7ff7e=
b96d9f12f7e068b1cf"
> > -
> > -DEPENDS =3D "sqlite3 sqlite3-native tiff"
> > -
> > -inherit autotools pkgconfig lib_package
> > -
> > -PACKAGECONFIG ?=3D "curl"
> > -
> > -PACKAGECONFIG[curl] =3D ",--without-curl,curl"
> > +inherit cmake lib_package
> >
> >  FILES:${PN} +=3D "${datadir}/proj"
> >
> >  BBCLASSEXTEND =3D "native"
> > +
> > +PACKAGECONFIG ?=3D "curl"
> > +PACKAGECONFIG[apps] =3D "-DBUILD_APPS=3DON, -DBUILD_APPS=3DOFF"
> > +PACKAGECONFIG[curl] =3D "-DENABLE_CURL=3DON,-DENABLE_CURL=3DOFF,curl"
> > +PACKAGECONFIG[tiff] =3D "-DENABLE_TIFF=3DON,-DENABLE_TIFF=3DOFF,tiff"
> > --
> > 2.34.1
> >

