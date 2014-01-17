Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 921E76AF54
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 18:31:33 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so2267609eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bLudIUs2v2OWGZYdTCKQVMYNelGcRbUpeT+T8ngSvkI=;
	b=XyB1RuFHzbpPaA+QoogaaXmfl2UJ1hchN0RW4ATGxHLtZeSIEoUS5wQ0syVyqWscQr
	jkPxIwUi/b1Op2f1UKK2LOD8Plcw3zvaAXQAdxpsnkbar3d713WIyPW316mzLaxEQhgc
	gp8aSV8GqFqCRwlFxwIGxwEDW8CWLkb4XzUV/Ahwhuuzv9H6VRQp1MkJNMYLKRh7gspA
	IKQAkyFz4KvAgU2frP7fyvGEWZxy2vRQNs84FsMd5kr6vtHRqUOPd6PvoX7pyj7XNw3a
	UTbbrJrL1oso6WhzEMgoPn20KxNcAdmRd5yCbxrBpV8iM323bIp2IMWKmMJHUHt4rd0P
	KO0A==
X-Received: by 10.15.44.4 with SMTP id y4mr4079150eev.71.1389983494177;
	Fri, 17 Jan 2014 10:31:34 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	l41sm29012883eep.17.2014.01.17.10.31.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 10:31:33 -0800 (PST)
Date: Fri, 17 Jan 2014 19:31:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20140117183157.GQ3742@jama>
References: <CALbNGRSrtzRFCy6Aru5Jr+iYXpwq=OxxSHk-6HtCWw=Q9bxErA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSrtzRFCy6Aru5Jr+iYXpwq=OxxSHk-6HtCWw=Q9bxErA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5: dependency loop for egl-library build by qmake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2014 18:31:34 -0000
X-Groupsio-MsgNum: 47808
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="soWJpSPh+l8Y6Fy7"
Content-Disposition: inline

--soWJpSPh+l8Y6Fy7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2014 at 07:00:07PM +0100, Andreas M=FCller wrote:
> Hi,
>=20
> Found a libegl which is build by qmake. This turns into a dependency loop:
>=20
> * qtbase ships mkspec and depends on egl (if enabled by packageconfig)
> * the driver needs mkspec to build
>=20
> I see two possible way to get out:
>=20
> 1. in qmake5.bbclass set 'OE_QMAKE_PLATFORM ?=3D "linux-oe-g++"' Hereby
> the driver can ship and select a copy of linux-oe-g++ with a different
> name. Disadvantage: in case something is changed on mkspec the copy
> needs alignment.

Does it need whole mkspecs or just some smaller portion from it?

> 2. Split out mkspec into a recipe. qmake5.bbclass can then depend on
> that recipe. Disadvantage: in case linux-oe-g++ finds it's way to
> mainline this won't work no more.

I don't expect linux-oe-g++ ever going to upstream, I was talking about
it with qt devs and they either didn't understand why we need it or
didn't like it (as it's "too generic" spec unlike other upstream specs)

Splitting it to separate recipe and reusing it from sysroot instead of
build dir seems like another change which we'll never upstream.

What about providing enough of target-agnostic mkspecs in qtbase-native
and build libegl just with qtbase-native?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--soWJpSPh+l8Y6Fy7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLZdx0ACgkQN1Ujt2V2gBzATQCdG7jWd3K9x6v2XV3B+jxo2i9S
QfQAoJSuror6XhyqxlMtVNeYXi3ZbOYM
=YEYI
-----END PGP SIGNATURE-----

--soWJpSPh+l8Y6Fy7--
