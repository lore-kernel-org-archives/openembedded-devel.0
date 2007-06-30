Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <oe@hentges.net>) id 1I4fUf-0001FK-NF
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jun 2007 18:08:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 17A533081EF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2007 18:03:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 3QbEVeViWNb4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2007 18:03:33 +0200 (CEST)
Received: from [192.168.5.2] (xdsl-87-78-51-146.netcologne.de [87.78.51.146])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 5F48B3081E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2007 18:03:33 +0200 (CEST)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1I3xL2-0002Jv-8j@linuxtogo.org>
References: <E1I3xL2-0002Jv-8j@linuxtogo.org>
Date: Sat, 30 Jun 2007 18:03:32 +0200
Message-Id: <1183219412.6678.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.2 
Subject: Re: [oe-commits] org.oe.dev linux-rp-2.6.21: add sharpsl-rc patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jun 2007 16:08:17 -0000
X-Groupsio-MsgNum: 2348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-nBdV5oP4bnzwECvK0BUZ"

--=-nBdV5oP4bnzwECvK0BUZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 28.06.2007, 18:59 +0200 schrieb justinp commit:
> linux-rp-2.6.21: add sharpsl-rc patch
>=20
> Author: justinp@openembedded.org
> Branch: org.openembedded.dev
> Revision: c80492670adbda2d61a72a0c64c1a2a873d10b51
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=3Dc80492670adbd=
a2d61a72a0c64c1a2a873d10b51
> Files:
> 1
> packages/linux/linux-rp_2.6.21.bb
> Diffs:
>=20
> #
> # mt diff -rd85165b6d72282ba94622c1c0d0c9c3e4a6be821 -rc80492670adbda2d61=
a72a0c64c1a2a873d10b51
> #
> #=20
> #=20
> # patch "packages/linux/linux-rp_2.6.21.bb"
> #  from [791613c9350e496eb591d9d3114c81a1e6b2c20c]
> #    to [0611fe14d6ba36f9557f2f7c5814c1be6fbd7f84]
> #=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- packages/linux/linux-rp_2.6.21.bb	791613c9350e496eb591d9d3114c81a1e6b=
2c20c
> +++ packages/linux/linux-rp_2.6.21.bb	0611fe14d6ba36f9557f2f7c5814c1be6fb=
d7f84
> @@ -1,6 +1,6 @@ require linux-rp.inc
>  require linux-rp.inc
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  # Handy URLs
>  # git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git;p=
rotocol=3Dgit;tag=3Def7d1b244fa6c94fb76d5f787b8629df64ea4046
> @@ -51,6 +51,7 @@ SRC_URI =3D "http://www.kernel.org/pub/lin
>             file://connectplus-remove-ide-HACK.patch;patch=3D1;status=3Dh=
ack \
>             file://squashfs3.0-2.6.15.patch;patch=3D1;status=3Dexternal \
>             file://vesafb-tng-1.0-rc2-2.6.20-rc2.patch;patch=3D1;status=
=3Dexternal \
> +           file://sharpsl-rc-r1.patch;patch=3D1 \
>             file://defconfig-c7x0 \
>             file://defconfig-hx2000 \
>             file://defconfig-collie \
>=20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

You forgot to attach the actual patch ;)
--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-nBdV5oP4bnzwECvK0BUZ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGhn7UPXyoPq8wMNkRAn9TAJ9KN0qa4bB/2GJX545U5Gvz1OWtUACggKUg
dPVVDY/HY9Hw7bfPtonxpVg=
=okMx
-----END PGP SIGNATURE-----

--=-nBdV5oP4bnzwECvK0BUZ--
