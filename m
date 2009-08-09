Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MaDFH-0001MV-SK
	for openembedded-devel@openembedded.org; Sun, 09 Aug 2009 20:35:52 +0200
Received: (qmail 8091 invoked by uid 813007); 9 Aug 2009 18:19:45 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 9 Aug 2009 18:19:45 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 9 Aug 2009 20:19:41 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc5-00256-g8e6bcae; KDE/4.3.0; x86_64; ;
	)
References: <19c1b8a90908090213x1aea00dfj343f2314282a9129@mail.gmail.com>
In-Reply-To: <19c1b8a90908090213x1aea00dfj343f2314282a9129@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908092019.45974.marcin@juszkiewicz.com.pl>
Subject: Re: Initialize PACKAGE_EXTRA_ARCHS if not done in tune files.
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
X-List-Received-Date: Sun, 09 Aug 2009 18:35:52 -0000
X-Groupsio-MsgNum: 12272
Content-Type: multipart/signed; boundary="nextPart7942521.1WpKKk8jlX";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart7942521.1WpKKk8jlX
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 9 sierpnia 2009 o 11:13:33 Khem Raj napisa=C5=82(a):
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -107,6 +107,7 @@ EXEEXT =3D "${HOST_EXEEXT}"
>
>  BASE_PACKAGE_ARCH =3D "${HOST_ARCH}"
>  PACKAGE_ARCH =3D "${BASE_PACKAGE_ARCH}"
> +PACKAGE_EXTRA_ARCHS ?=3D ""
>  MACHINE_ARCH =3D "${@[bb.data.getVar('HOST_ARCH', d, 1),
> bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d,
> 1))]}"
>  PACKAGE_ARCHS =3D "all any noarch ${TARGET_ARCH}
> ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart7942521.1WpKKk8jlX
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkp/Ez4ACgkQeQ6MlGH/2qvqQwCfWY5nb7HL9ON/CyUgqqvT1Guk
DmwAnAqWH3iV3bcMh9CRmZmeGZGmk6rk
=qG2U
-----END PGP SIGNATURE-----

--nextPart7942521.1WpKKk8jlX--
