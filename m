Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 18F4860232
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 16:25:56 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so3641205wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jan 2015 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QHELqMBxqcDOBu4VmoGfZth/eUNBF07dqhc+C/cVg6A=;
	b=jlgc9fj5oQhMDQY99mdjntISuR3xB/j4exLmekuLli2S1j5NAv8Ajqm8vfBc1Bx5ep
	yJjdyOgX/oWHhHP+G/NQfkM27G/2LRvnX7atP4Hy5qDn5HKNAVWhGGEP21DOUVEotTwR
	wbrkHmqR1luUoqFY8Q2kGa9cXoFBSSzBAEKd2mext/OIfFKjt0eRYztt/wSGvs5/dWai
	dr/nDEe+ZYMSCvEzNWDQZYNlc7aEgkiz4DFwWwL274QhnKvSSTOIulzNKp5Im7gWvYEf
	EeKaHj2FDnNAcRO+va/RdwyG5B1/d5Ad3vrm5h+A2F3fRBFJCnBTUB6I5Ri7YDPKxfpR
	7qMQ==
X-Received: by 10.180.73.101 with SMTP id k5mr26837255wiv.43.1420475156413;
	Mon, 05 Jan 2015 08:25:56 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e18sm75988460wjz.27.2015.01.05.08.25.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 08:25:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 17:25:56 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150105162556.GL2484@jama>
References: <alpine.LFD.2.11.1501050948080.16705@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1501050948080.16705@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: missing trailing spaces in some "_prepend" expressions in oe-core
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
X-List-Received-Date: Mon, 05 Jan 2015 16:26:02 -0000
X-Groupsio-MsgNum: 53660
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4oQnj4jcM03NhqPN"
Content-Disposition: inline

--4oQnj4jcM03NhqPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2015 at 09:58:01AM -0500, Robert P. J. Day wrote:
>=20
>   after running across a variable "_prepend" assignment that had no
> trailing space, i did a quick grep through oe-core and ran across the
> following, which would all seem to need that trailing space:
>=20
> $ grep -rn "DEPENDS_prepend.*[^ ]\"$" *
> meta/classes/qt4e.bbclass:2:DEPENDS_prepend =3D "${QT4EDEPENDS}"
> meta/classes/cpan_build.bbclass:27:DEPENDS_prepend =3D "${@cpan_build_dep=
_prepend(d)}"
> meta/classes/autotools.bbclass:24:DEPENDS_prepend =3D "${@autotools_dep_p=
repend(d)}"
> meta/classes/qt4x11.bbclass:2:DEPENDS_prepend =3D "${QT4DEPENDS}"
> $

e.g. QT4EDEPENDS QT4DEPENDS both end with space, so it's not causing any
problem, but having the trailing space together with prepend is good.

Only exception I can think of is when you really don't want to introduce
extra space when the variable used in prepend/append is set to empty,
but that's not an issue for DEPENDS (but important e.x. for tune .inc files)

> and
>=20
> $ grep -rn "SRC_URI_prepend.*[^ ]\"$" *
> meta/recipes-devtools/qemu/qemu_git.bb:10:SRC_URI_prepend =3D "git://git.=
qemu.org/qemu.git"
> meta/recipes-devtools/qemu/qemu_2.2.0.bb:10:SRC_URI_prepend =3D "http://w=
iki.qemu-project.org/download/${BP}.tar.bz2"
> $
>=20
>   there may be more, i just left it at that, not sure if there's
> something magic about those examples or whether they really should
> have the space added, so i'll leave it with someone else to tweak.
>=20
> rday
>=20
> p.s. is there any difference between appending or prepending to the
> list of build-time dependencies in "DEPENDS"? most extensions to
> "DEPENDS" i've seen use "_append", but occasionally, i see "_prepend".
> does it matter?

I don't think so, the order of DEPENDS is irrelevant.

This e-mail belongs more into oe-core ML.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4oQnj4jcM03NhqPN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSquxQACgkQN1Ujt2V2gBzWMwCgkCJjz68xJpXww56IxItoDOx/
Tj0AoJzdlGdxAbrKOCLalkWr3pkOa81j
=lTDU
-----END PGP SIGNATURE-----

--4oQnj4jcM03NhqPN--
