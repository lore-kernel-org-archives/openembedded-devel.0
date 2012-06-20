Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShPwO-0004z8-9f
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2012 20:47:44 +0200
Received: by wgbdr1 with SMTP id dr1so7146806wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2012 11:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k40Q0RsfEFD+yeCnCBcaURzqK8xPv3tbm2dAwibe5V0=;
	b=uqy4TwjPNwv679XDDDy08ucsJXi23tED+iErcUuwp8Yz13ubgFSde2CZ+pjGb9ma6B
	3MExreehcLG+dd+ukn/yI6MGIG8skNNyRwc1AlQrKRqfyi2uXlkpnXp1ZZS5BpGLSh3D
	Js8hua9sKJTynRQaycywwXVxec3Kh6Ky8hkB6ciHm267QX6F9fgP1+OPxkLp1EcIvRNO
	Bl9ilWSsmiK/8r4xGOuyQK/1bsKl3umFkkPlxUEO/IeFRb248hoMJY16bhJoll2wLnx9
	B/Tvb7CIwncawqV6b1ARcQFNOCpHMq5lFtQIYxqxHSbL0bx7+7LdaiA/wXqcky+gDQii
	wX0Q==
Received: by 10.180.104.168 with SMTP id gf8mr13929401wib.12.1340217414339;
	Wed, 20 Jun 2012 11:36:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gc6sm40445102wib.0.2012.06.20.11.36.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 11:36:52 -0700 (PDT)
Date: Wed, 20 Jun 2012 20:36:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120620183655.GT3178@jama.jama.net>
References: <1339759019-3272-1-git-send-email-sbabic@denx.de>
	<jrsciv$ro6$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jrsciv$ro6$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH V2] Added recipe for libconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 18:47:44 -0000
X-Groupsio-MsgNum: 39313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4AfY4lbNVy6SI0IG"
Content-Disposition: inline

--4AfY4lbNVy6SI0IG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 01:35:59PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 15-06-12 13:16, Stefano Babic schreef:
> > libconfig can be used to parse a configuration file in a structured
> > language, but still compact and more suitable for embedded devices
> > compared to XML.
> >=20
> > Signed-off-by: Stefano Babic <sbabic@denx.de> ---
> >=20
> > - V1 was sent to oe-core, comments redirect it as right place to meta-o=
e=20
> > - Drop PR to use the default value
> >=20
> > .../recipes-support/libconfig/libconfig_1.4.8.bb   |   13 +++++++++++++=
 1
> > file changed, 13 insertions(+) create mode 100644
> > meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
> >=20
> > diff --git a/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb
> > b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb new file mode
> > 100644 index 0000000..ffde91f --- /dev/null +++
> > b/meta-oe/recipes-support/libconfig/libconfig_1.4.8.bb @@ -0,0 +1,13 @@=
=20
> > +SUMMARY =3D "C/C++ Configuration File Library" +DESCRIPTION =3D "proce=
ssing
> > of structured configuration files" +SECTION =3D "libs" +LICENSE =3D
> > "LGPLv2.1" +LIC_FILES_CHKSUM =3D
> > "file://COPYING.LIB;md5=3Dfad9b3332be894bab9bc501572864b29" + +SRC_URI =
=3D
> > "http://www.hyperrealm.com/libconfig/libconfig-1.4.8.tar.gz \
>=20
> s/1.4.8/${PV}/

s%libconfig/libconfig-1.4.8%${BPN}/${BP}%

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iQIcBAEBAgAGBQJP4bWfAAoJEHZqAkdh1vT6rDIP/jM0/A8zTYwcrcZs2OIc1WSC
> l0gWcViWtL0AliDzV82Dpck7Bdwv77aPqQBO3pQS7wQ9w7I/SNqYM1Whmt5Mq+2V
> tueA4PB/MuLT5Bh63uO7Ga6OnBVY1LWSAVAqreGIKHqYfOMMvFQ9aXs73wWy0kgd
> wAeqmH8hjt9XG20KGm42FBvGXiPe0bitwg3p8m7Ox8NQ5YbKfzr8JjpbePWjNTv1
> xCZgBbTgRI6SfIkJnZA63VmMpXZJkAppL63iRhpP7P9chivA3qNzUk7zMftIgzuf
> WaXQlAefAGK/QX6vso8TuPuENbXzJvrM8iVPnBkdHFxeWTB1mgvAXS4z4nV9qV4u
> GAcGq5Zxdbx2F3uspJMi2ulntPoPabpGpc7nG46K/V5tuYXwmcyyXCcP1RgSKmkW
> 2RgPrBNQahueYXtYo0EKUS50CwR8UW4gSxNM7xXtBMrn8oHi6Z5ewRoyNeLHRHEw
> MfpOykP0fr1PpwVdUQeVV9NXpumFPac54s3VcKrC1XHoW4X4mwiI8qWCdkb+JW1Z
> tgHKphARmfpPM7E4lOPyBF8DXfg5tUMsSFnVBTB6cHFa5FKBzpHbcCruc6Inrf8d
> jSpdJaFmkfG5j6BwKUjQ+CRcTlvXSrX3o6BzGxgJigPsMf11RufCP0R4mwj3NUhP
> QIiNT8fQLNdbZH/c92nq
> =3D1Xq9
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4AfY4lbNVy6SI0IG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/iGEcACgkQN1Ujt2V2gBzqDQCeKxsbG8D4rx8eUKgLPL7o/FEN
xg8AmgJdyRtglLgHwAAKVAU/VJRpm86m
=fy2F
-----END PGP SIGNATURE-----

--4AfY4lbNVy6SI0IG--
