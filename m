Return-Path: <wolf@blazingangles.com>
Received: from home.blazingangles.com (3e6b36a2.rev.stofanet.dk
	[62.107.54.162])
	by mail.openembedded.org (Postfix) with ESMTP id D00BC6D98E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 20:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by home.blazingangles.com (Postfix) with ESMTP id 8F52B202BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 21:07:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at blazingangles.com
Received: from home.blazingangles.com ([127.0.0.1])
	by localhost (home.blazingangles.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id KxIwM507Zfx7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 21:07:39 +0100 (CET)
Received: from server (localhost6 [IPv6:::1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by home.blazingangles.com (Postfix) with ESMTPS id C8DE020073
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 21:07:39 +0100 (CET)
Received: from wolf.home.blazingangles.com (wolf.home.blazingangles.com
	[2001:470:28:20f::103]) by webmail.blazingangles.com (Horde Framework)
	with HTTP; Sun, 24 Nov 2013 21:07:39 +0100
Date: Sun, 24 Nov 2013 21:07:39 +0100
Message-ID: <20131124210739.Horde.aOiwheD3X90dXR-wQmCqJw4@webmail.blazingangles.com>
From: Ole Wolf <wolf@blazingangles.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.1.6)
Accept-Language: da,en,de,no,nb,nn,sv
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Unpacking nested git repos in recipe?
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
X-List-Received-Date: Sun, 24 Nov 2013 20:07:49 -0000
X-Groupsio-MsgNum: 47249
Content-Type: multipart/signed; boundary="=_I3hTkrdjOv8eBhoW21TVvg2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--=_I3hTkrdjOv8eBhoW21TVvg2
Content-Type: multipart/mixed; boundary="=_3jsNeAD97GhQVPINT4d3tg1"

--=_3jsNeAD97GhQVPINT4d3tg1
Content-Type: multipart/alternative; boundary="=_EnDv03miNJz0UINKcCh-rQ2"

--=_EnDv03miNJz0UINKcCh-rQ2
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
Content-Description: Plaintext Message
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I want to create a recipe that includes two git repositories. Fetching them
works as I'd expect when I specify their sources as follows:

SRC_URI =3D " \
=C2=A0 =C2=A0 git://github.com/boostorg/boost.git;name=3Dboost \
=C2=A0 =C2=A0 git://github.com/boostorg/build.git;name=3Dbuild \
"
SRCREV_boost =3D "42d94a72ccbc64e2f4652a69c2d292b1028da087"
SRCREV_build =3D "c2574b2d5a481f88864d1e75ce775f41cbc03bad"

However, I can't figure out how to unpack them properly. The first
repository, "boost," is to be unpacked into the default ".../git" director=
y
whereas the other repository, "build," is to be unpacked into a
subdirectory of "boost." I had hoped that the git fetching might provide a
"subdir" modifier, but it seems that's not supported.

So, somehow I need to be able to state that "boost" must be unpacked first=
,
followed by "build," which is to be unpacked into ".../git/tools/build."

Is this possible without resorting to a custom do_unpack function?

--=_EnDv03miNJz0UINKcCh-rQ2--

--=_3jsNeAD97GhQVPINT4d3tg1
Content-Type: application/pgp-keys
Content-Description: PGP Public Key

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.11 (GNU/Linux)

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
=imeX
-----END PGP PUBLIC KEY BLOCK-----

--=_3jsNeAD97GhQVPINT4d3tg1--

--=_I3hTkrdjOv8eBhoW21TVvg2
Content-Type: application/pgp-signature
Content-Description: PGP Digital Signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iEYEABECAAYFAlKSXIsACgkQzxilSvlp81AmogCfb6Wk4W4LU/67k2J4gjzmZHFT
E1QAniYIuxjzCCUFazSty1npLgX6nvuv
=lE9n
-----END PGP SIGNATURE-----

--=_I3hTkrdjOv8eBhoW21TVvg2--
