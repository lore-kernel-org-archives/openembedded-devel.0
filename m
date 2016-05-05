Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 379F8731F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 19:18:28 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id g17so43560022wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QWGYF7ZlYC4hhyFglHUyEV5mWNnwIxBoiVp2avXwWBI=;
	b=xQo2eWXmwpiHf21ZL1AFNTU0YOmPoKr1bIR3ytybpL2/3u4/QQyhHiexD7K7232KhR
	AlXMmnTW/N5wH5x7JXLGGtLSqTmuoxnD772Zd3DdSKG8l/5dawZlhvt1RSfu/vOr+s3k
	n3iBWpSjWHyAjZFSPkxj2kMEkl/sj4D7cNQ4uuMMKRzhv+BUKbd7qdo/M/eOfrpjjgOz
	7X9v5APrEIgVhxWX+0KXXgcSqoUr733FpfVeJPRzv0fTNwnTTOq6/Kj7nNeJs0M0b9F7
	TnqfyKVyqyeMxom/Hlo6EZ5XrW1hBzJEkyRrRP4/YSx7OOVQKkZ23pSxEkUUXpkL6/LA
	p1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QWGYF7ZlYC4hhyFglHUyEV5mWNnwIxBoiVp2avXwWBI=;
	b=dcy/wFwaVm8ESqXtdWiUxKKc5gNrQAtZoGjp4sINb51igAGJrMIWyQ1FCjYX7ZTjK4
	AfQScu4wdCZylHxqSGU8RYMCs7+S4F3uXDIz89MfXiZ9jtWnU4vTFVwo3fi60B0bPxWc
	yH7ROu0SA0ieYR7ta9dUM5PKqR5/PlmZNYInmVH6W1PkVixOnSLLBCb/l7NivsjYeSmL
	IS4r8MRMxD0d7xiiZ5Qu8PYxp2k1Amt4//OaVT3h+VCAyPxY00+2os+Qc1Fw57BDvs1F
	2J5GbSwPmWXsyB29/i2Gjq6Rtmk50IqH5N3XsQO436VbpyRsFuQy4f4HkkecnYL/emIC
	OpyA==
X-Gm-Message-State: AOPr4FWU5lmd0Be8EDQ0Kd1hfoARW4jgTz37g6/pIPThB566O06WmuQa1FTiO/6HaiJD2Q==
X-Received: by 10.28.157.202 with SMTP id g193mr5507465wme.46.1462475908721;
	Thu, 05 May 2016 12:18:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	f11sm4612566wmf.22.2016.05.05.12.18.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 12:18:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 May 2016 21:19:51 +0200
To: Derek Straka <derek@asterius.io>
Message-ID: <20160505191951.GD23370@jama>
References: <1461947081-15513-1-git-send-email-derek@asterius.io>
	<CA+chaQf7vGXOz61725sEOAG4EBKGmS=KxYq3ZPZS7WfjAPYeXw@mail.gmail.com>
	<CADNbA1rCRsrU=H8nKKJ0J7Ek-V=HD1fnDW4t8jT4=_3SZgXP0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADNbA1rCRsrU=H8nKKJ0J7Ek-V=HD1fnDW4t8jT4=_3SZgXP0w@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] giflib: update to version 5.1.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2016 19:18:29 -0000
X-Groupsio-MsgNum: 61348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline

--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 08:54:21AM -0400, Derek Straka wrote:
> Yes.  I'll submit a patch for leptonica -> 1.73 to be compatible with
> giflib 5.1.x

That unblocked another issue:

| ../../../tracker-0.14.2/src/tracker-extract/tracker-extract-gif.c: In
function 'tracker_extract_get_metadata':
|
=2E./../../tracker-0.14.2/src/tracker-extract/tracker-extract-gif.c:620:17:
error: too few arguments to function 'DGifOpenFileHandle'
|   if ((gifFile =3D DGifOpenFileHandle (fd)) =3D=3D NULL) {
|                  ^

Whole log:
http://errors.yoctoproject.org/Errors/Details/61673/

Can you please take a look at it?

Breaking giflib API is not fun :/ even when done with good intentions:
http://esr.ibiblio.org/?p=3D5754

> On Tue, May 3, 2016 at 3:38 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > Can you check leptonica, seems to be broken by this upgrade:
> >
> > http://errors.yoctoproject.org/Errors/Details/61476/
> >
> > On Fri, Apr 29, 2016 at 6:24 PM, Derek Straka <derek@asterius.io> wrote:
> >
> >>   - Remove EXTRA_OECONF to disable X11 support since direct X11 window
> >> rendering has been retired
> >> Signed-off-by: Derek Straka <derek@asterius.io>
> >> ---
> >>  .../recipes-devtools/giflib/{giflib_4.1.6.bb =3D> giflib_5.1.4.bb}   =
| 7
> >> ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>  rename meta-oe/recipes-devtools/giflib/{giflib_4.1.6.bb =3D>
> >> giflib_5.1.4.bb} (67%)
> >>
> >> diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> >> b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> >> similarity index 67%
> >> rename from meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> >> rename to meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> >> index e59d0e5..21fa352 100644
> >> --- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
> >> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
> >> @@ -2,14 +2,11 @@ SUMMARY =3D "shared library for GIF images"
> >>  SECTION =3D "libs"
> >>  LICENSE =3D "MIT"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae11c61b04b2917be39b11f78d=
71519a"
> >> -PR =3D "r3"
> >>
> >>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
> >>
> >>  inherit autotools
> >>
> >> -EXTRA_OECONF =3D "--disable-x11"
> >> -
> >>  PACKAGES +=3D "${PN}-utils"
> >>  FILES_${PN} =3D "${libdir}/libgif.so.*"
> >>  FILES_${PN}-utils =3D "${bindir}"
> >> @@ -18,5 +15,5 @@ BBCLASSEXTEND =3D "native"
> >>
> >>  RDEPENDS_${PN}-utils =3D "perl"
> >>
> >> -SRC_URI[md5sum] =3D "7125644155ae6ad33dbc9fc15a14735f"
> >> -SRC_URI[sha256sum] =3D
> >> "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
> >> +SRC_URI[md5sum] =3D "2c171ced93c0e83bb09e6ccad8e3ba2b"
> >> +SRC_URI[sha256sum] =3D
> >> "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcrnNYACgkQN1Ujt2V2gByHSQCcDYoHv5Zg1U7sBXC5aYPnA+hO
Hr4AmgK2DoTTXKIO9fBaiH4yKnRQawn+
=5gOp
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
