Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS5DQ-0006qD-7D for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 09:56:39 +0100
Received: from g225142234.adsl.alicedsl.de ([92.225.142.234]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NS5BT-0000St-0r for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 08:54:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262678000.5798.9.camel@dejunliu-desktop>
References: <1262678000.5798.9.camel@dejunliu-desktop>
Date: Tue, 05 Jan 2010 09:54:28 +0100
Message-ID: <1262681668.3209.2.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x11-image can't start up
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
X-List-Received-Date: Tue, 05 Jan 2010 08:56:39 -0000
X-Groupsio-MsgNum: 15399
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5+gYWDxbKvM1hgXsf3Ba"

--=-5+gYWDxbKvM1hgXsf3Ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Steven,


Am Dienstag, den 05.01.2010, 04:53 -0300 schrieb Dejun.Liu:
>=20
> I have build angstrom x11-image and test it with Qemu,
>=20
> But Qemu failed to start up.
>=20
> i dig the reason find that system have no more inodes to use.
>=20
> df -i result:
> -------------------
> filesystem		inodes		used	Available	use%=09
> /dev/root		11040		11040	 0		100%
> ............
> /dev/sda		11040		11040		0	100%
> ..............
>=20
> -------------------
>=20
> so does anyone know how to fix it in OE?

did OE create the filesystem or did you? What filesystem is it?

If you did create it and depending on your filesystem, I think you have
to recreate the filesystem with more inodes.


Thanks,

Paul

--=-5+gYWDxbKvM1hgXsf3Ba
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktC/j0ACgkQPX1aK2wOHViC0wCeN0teGwwF7jwgJAkoxhVHxKnU
2G4AmgKKYrf0qmHC/NK6dW9ta1cChzVB
=g2Wk
-----END PGP SIGNATURE-----

--=-5+gYWDxbKvM1hgXsf3Ba--
