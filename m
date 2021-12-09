Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3457C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 03:22:30 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.6863.1639020149584417453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 19:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=DIbvtpvq;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.25, mailfrom: patrick@stwcx.xyz)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BF0395C02C6;
	Wed,  8 Dec 2021 22:22:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 08 Dec 2021 22:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=RPMBp1YQMKnADPYq7/Z/nNG+vDf
	hjVG6xBVT5IlP/kM=; b=DIbvtpvquTzLE3Ps1QUvMW2wDgpGdjl2D+D4xdnWREy
	vTxFQG1lARuS3zIQ3rZvkJoHlkJklA0M6El+5rBkyRtMBq0NIIQ7ZU0hl6f8iRWp
	jJD0Z7c7kVVsDXEARP98Na1uIcJEVzOwI0uY+vgdWy22mPW8GmbEmkYBW1/u5NA7
	COlxg6GhTen1vwDmUi1lFOoNiuB0wWXlTAZGg1UfR8do4sF6NuvNCfmadFle02OA
	grJF+TanaYHjP9uuxkSbThFK/n9vuQ/sWNTfa22tjOV71AaYVjN3yQF7JoG1Q/2e
	a13yK0sVQ2zLFCcsPMcJsviYmsrtrDtzy/NRrCJrDgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RPMBp1
	YQMKnADPYq7/Z/nNG+vDfhjVG6xBVT5IlP/kM=; b=NC7uhXay+EoosBPQDQSuLD
	jcCZu3xlEgy7gtO+xvyCjbvz2M17x8XS3at9Gs4WfIqcAnXe/YHgPK3pA5y5n+vd
	IgeEznn2Qt23iNJrU/2/G87k+s3oBzn1P6fxiwgJvqjpuS1AipatB3TrsOK9vMhn
	EcgYGIxCSN+5FSlS2fdq3nCyl/yg3k2vD3hIK5paZQjheH2eF80WAksCCazjWujI
	eOCsf/i573rgQrnMYFpxj6vv+fd15GYsOAcruLzihaVepQS5uKkG6v+l0JnXBy6V
	1LFeMo+zkq/DglHo6jafVtgI+5+EZvHWjC1YS9iIsKeT5xnX1x0+sGnXufduCXFg
	==
X-ME-Sender: <xms:dHaxYegueLuDEuT2T6S_jdvRNaEVen0yLzXMBdUqHsp5HBmuUve7CQ>
    <xme:dHaxYfCEJoKETyfKlGVYMsUU6If_vk_LRBHC_TgyU9c3NvsTlUu7CurztTI7QrTQi
    Zuh_J5QgJriUh6WsqY>
X-ME-Received: 
 <xmr:dHaxYWGSdqo2m6TGZPSoYH8Zikj51Ab4Ab03lxHpZA-AZvpm69jat5lcXoEFnt6xqJxtvOoEnytKDdkQ2_6gXkszgcxh1eEyXbxfsQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrjeelgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhtdettdevteeghefgteetfeegueeg
    gfejgfduieejgfevieekfeeiveeifeelhfenucffohhmrghinhepihhsohgtphhprdhorh
    hgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:dHaxYXTlTnB4XZOEae3EH5dGAlsb9akpxjJZPbO5AhAgXOi-a_iVlg>
    <xmx:dHaxYbyu8Q70WgacPPRBnjVuKa3NHKF7HVqKXErQ0Q0H4hivVQgoTw>
    <xmx:dHaxYV7qGh4rQI_ICjOYIubDDrsAOwIuajccF4WriWLkTX08A4RdYg>
    <xmx:dHaxYZY6hS0m2ZU_E0cARRQuUq1Gs1UBQZapDVmXeBynaHH26_PB2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Dec 2021 22:22:28 -0500 (EST)
Date: Wed, 8 Dec 2021 21:22:27 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] unifex: add recipe
Message-ID: <YbF2c/MQ487oJPDk@heinlein>
References: <20211208171543.1234000-1-patrick@stwcx.xyz>
 <CAMKF1spC7M4AO2eCey1G9MfyfLVELug3RaKjS5bOUKjxHAxXCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2xUb5qWRCFpXCazs"
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1spC7M4AO2eCey1G9MfyfLVELug3RaKjS5bOUKjxHAxXCg@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 03:22:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94257


--2xUb5qWRCFpXCazs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 11:27:35AM -0800, Khem Raj wrote:
> On Wed, Dec 8, 2021 at 9:15 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> >
> > libunifex is a library for enabling C++ "Unified Executors" in C++20,
> > based on current standards work being proposed for C++23 (P2300)[1].
> > This library provides C++20 support for async and co-routines.
> >
> > 1. https://isocpp.org/files/papers/P2300R3.html
> >
> > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > ---
> >  meta-oe/recipes-devtools/unifex/unifex_git.bb | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/unifex/unifex_git.bb
> >
> > diff --git a/meta-oe/recipes-devtools/unifex/unifex_git.bb b/meta-oe/re=
cipes-devtools/unifex/unifex_git.bb
> > new file mode 100644
> > index 000000000..09b8c2254
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/unifex/unifex_git.bb
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION =3D "C++ Unified Executors library"
> > +HOMEPAGE =3D "https://github.com/facebookexperimental/libunifex"
> > +SECTION =3D "libs"
> > +LICENSE =3D "Apache-2.0-with-LLVM-exception"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5b86506074cb3cdc493b4f9=
6b73b2909"
> > +
> > +SRC_URI =3D "git://github.com/facebookexperimental/libunifex.git;branc=
h=3Dmain"
>=20
> also set protocol=3Dhttps explicitly in SRC_URI
>=20

Ack.

> > +SRCREV =3D "9df21c58d34ce8a1cd3b15c3a7347495e29417a0"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake pkgconfig
> > +
> > +DEPENDS =3D ""
>=20
> Do we need to empty out DEPENDS ?
>=20

Ooops.  I started with the boost-url recipe and deleted 'boost', thinking t=
here
might be some dependency I'd need and I'd add it as I discovered it... and =
then
forgot to delete this when there weren't any.

> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
>=20
> move this below EXTRA_OECMAKE

Ack.

--=20
Patrick Williams

--2xUb5qWRCFpXCazs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGxdnEACgkQqwNHzC0A
wRkWiw/9EtWtHGhJAJ3v5HNKE7GUHiCZgnZeuNfor/UtPvuCDAEIAappLDd61I+R
TBC3psx7M+1sU7oxvWWjRSOKgj4yNhViqFOdQrmN4tJK8ORDIHc+7O3kjnqp/lDy
E5XQ3Dt1GabbCelljrDrOuQezIqhB999EBURaHSK5kRqNQWIuS4MLwkwx+imECDa
nFFDAthwFY9YEXkIGAkomJhFpCI7aEHK/6MDcF8Jb24Q5P2J8lSXmKgJZ6pZNXUE
93YBYnppc5g5V8VeuHK02cGNbpGxKCkMqYdsmNNMlF6faZmQOwIwDTzo6Tf/iwt/
BUtSwD3RB/IG153ShABlMnL08WdCspWS8qavX4XBghBHFnRw/YCGS6Cs1rZwPzRw
bJrEpynpXU5QOauRiTwkwjxljsRw7iXaLFVnDtNosmNmc313HoZEvnjhRmura4IP
WxfkjegMNIA54MFhYegdU4LJGjc+XnfOi79aPiQLYgUgXr8QpepKEVIINpOUttxv
47mwl4/MKGZ+i7pbs9LmeixK5Zwv0XqZzIma30yGA1PsPBjIw1S1tnHV2koclfcP
bEiX//jBp1Kxd9Y9SgVotaH0PvAe4gdql7f0GIhrnCeXqYW9iMrM47ufmeE3CdCE
+MSwkGcfYv47+91uBoOQRMcVURZNCU3lbc9q8p1IWPx/MVGrq5k=
=xwAk
-----END PGP SIGNATURE-----

--2xUb5qWRCFpXCazs--

