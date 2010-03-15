Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrIg9-0003OU-PL for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 23:22:30 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrIdF-0003Dn-Jm for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 22:19:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B9EADFC.2060302@atmel.com>
References: <4B9EADFC.2060302@atmel.com>
Date: Mon, 15 Mar 2010 23:19:28 +0100
Message-ID: <1268691568.16974.48.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-mplayer fails to build due to no libstdc++.so.6 instaging (available in cross)
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
X-List-Received-Date: Mon, 15 Mar 2010 22:22:30 -0000
X-Groupsio-MsgNum: 17693
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-AkidvMXDQbXxHtNFA10E"

--=-AkidvMXDQbXxHtNFA10E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 15.03.2010, 23:00 +0100 schrieb Ulf Samuelsson:

[=E2=80=A6]

> If I move the "libstdc++.so[.6[.0.10]]"  files to the staging directory
> the build will complete, and gnome-mplayer runs on the target.
>=20
> I tried doing
> DEPENDS =3D "libstdc++"
> in "libmusicbrainz.inc"
> but get a "no buildable provider" error.
>=20
> I tried
> RDEPENDS =3D "libstdc++"
> and then libmusicbrainz completes, but again gnome-mplayer exists with
> the error above.
>=20
> How ensure that staging gets populated with libstdc++ if libmusicbrainz
> is used?

You cannot use package names in `DEPENDS`. You have to use the name of
the recipe or the recipes has to have `PROVIDES` set. I ask the same on
IRC today.

So you have to find the name of the recipe creating `libstdc++`.


Thanks,

Paul

--=-AkidvMXDQbXxHtNFA10E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkuesnAACgkQPX1aK2wOHVh20ACY0KQsSPYmm+Ynt/CPVLl+iONR
2wCfSjf1vhVjMvkiq5V8u+RjcXRCjeQ=
=XYd5
-----END PGP SIGNATURE-----

--=-AkidvMXDQbXxHtNFA10E--
