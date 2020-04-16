Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.14055.1587063977528183584
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 12:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TOj2o6t+;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id g12so6136701wmh.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ggnSFZruUIVsUagnURNpvmLuyEDB0ZQYQTtm0UKtYgI=;
        b=TOj2o6t+LiFxMTRYOzzIrQEmn39qilPDhlDz2C63Idhun3Z6e5mqjG2KIRe2wjK2GH
         g3dTHFrTfyE5uQgbkhkDnf9yn+GvgsjVxDyaOwZuwvZuezP4u+yqLuVNsdd8sTQGeA1q
         wWg3kYGqCCuA/Rq0K92gCace9epmZYISQ3grUWC2T2211I0W5vXfJk3Dm/y+sEIjl81F
         fKUnpN464GW2+innmeCwdQy3vQIUEq7IzS7S3YjcfOrhzzK2ZpZqkhAB4jlqtBt8Weut
         NE+0KsrWvwQpeVjkseroc5hKQ3vVqtSvfqknL23+MZvGfTNslwuABaUbsi2g01CRVMrQ
         SZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ggnSFZruUIVsUagnURNpvmLuyEDB0ZQYQTtm0UKtYgI=;
        b=niZ+XDZZV8pBnC34o2z24Ay60AI8hI3H1cM9Zf4zOEQBozP8SnBuJV4zX0VpLjKB7Y
         vPGa1nV/n8kC8w4McRcCagfi6gJSA6H8V33e7Iyh/JTUKT3wWwvTgYm6Fje9oXSf3fx+
         QCvqx/7JvRFLzQlwzZknKgtvuwyEdq7HQHDg6u8SR9tERsomF8aNFtFeHqxj7lXMpnEu
         4kWK2kY40Bs4fROvhr7qBsX1EagQlWvqckM2rjUeSNgl8FdG+RlWNp8NV7Zvd9eUmrrB
         VbV1cH5uLJKItoN8IopL774q5mrwajTddDGjWXQpH1GtUNxCSutLIsfLq6mHc5I5d8DE
         E/ig==
X-Gm-Message-State: AGi0PubEwsDKs9/Dwy9GLh0iAVWKJ9bcyJIAajkFmsKqTQiFZCPTcL64
	giijcBFxkiFuuwLFJIqtcUk=
X-Google-Smtp-Source: APiQypJb19upgvz/BH5Kndj4SLzq8NkegFhHjQGIHrKD6piO6P/Cj37XUdBy6uEoRUOKNXKec6dSmQ==
X-Received: by 2002:a1c:4144:: with SMTP id o65mr6660678wma.78.1587063975832;
        Thu, 16 Apr 2020 12:06:15 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j11sm7302681wrr.62.2020.04.16.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 12:06:14 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Apr 2020 21:06:14 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: Gregory Vimont <gregory.vimont@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] opencv: 4.1.0 -> 4.1.1
Message-ID: <20200416190614.o7pwdhnjeeicaai6@jama>
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
 <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com>
X-Groupsio-MsgNum: 83969
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ywczxllckccrl2j2"
Content-Disposition: inline

--ywczxllckccrl2j2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 11:38:24AM -0700, Khem Raj wrote:
> This fails on mips/glibc
>=20
> https://errors.yoctoproject.org/Errors/Details/404685/
>=20
>=20
> On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont <gregory.vimont@gmail.com=
> wrote:
> >
> > Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
> > ---
> >  .../opencv/{opencv_4.1.0.bb =3D> opencv_4.1.1.bb}             | 6 +++=
---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb =3D> opencv_4.=
1.1.bb} (98%)
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/=
recipes-support/opencv/opencv_4.1.1.bb
> > similarity index 98%
> > rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> > rename to meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > index d781da600..5074eb2fa 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >
> >  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
> >
> > -SRCREV_opencv =3D "371bba8f54560b374fbcd47e7e02f015ac4969ad"
> > -SRCREV_contrib =3D "2c32791a9c500343568a21ea34bf2daeac2adae7"
> > +SRCREV_opencv =3D "ddbd10c0019f3ee5f43b7902d47e7fc4303a6574"
> > +SRCREV_contrib =3D "0915b7eaddba3c06d83e201c9a7595e73801f417"
> >  SRCREV_ipp =3D "32e315a5b106a7b89dbed51c28f8120a48b368b4"
> >  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
> >  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
> > @@ -51,7 +51,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=
=
=3Dopencv \
> >             file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-=
unit-g.patch \
> >             file://download.patch \
> >             "
> > -PV =3D "4.1.0"
> > +PV =3D "4.1.1"

Gregory,

was there a reason for 4.1.1 + backports instead of 4.2.0 version
released in December 2019?

Or 4.1.2 from Octobver 2019 if 4.2.x is breaking too many things.

Cheers,

> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.17.1
> >
> >=20

>=20


--ywczxllckccrl2j2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXpisTAAKCRA3VSO3ZXaA
HDgtAKC6F9dniz+9jXfR6KbvzCfFCyjX3QCgmYT9MxWEB8FtAAS/c5kvWAcz4o8=
=XKSX
-----END PGP SIGNATURE-----

--ywczxllckccrl2j2--
