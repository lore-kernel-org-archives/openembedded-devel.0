Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLcth-0004jZ-Jh for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 17:06:21 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLcsO-0007Wr-Qj for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 15:05:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110513222652.GA3231@mail.familie-heinold.de>
References: <1305062085.9982.62.camel@mattotaupa>
	<1305133911.2421.29.camel@phil-desktop> <20110511202510.GG7657@mx.loc>
	<1305324915.7858.11.camel@mattotaupa>
	<20110513222652.GA3231@mail.familie-heinold.de>
Date: Sun, 15 May 2011 17:03:30 +0200
Message-ID: <1305471810.5838.518.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [solved] new uClibc srcrev fails with `unwind-resume.c:31:19: error: expected ')' before 'struct'`
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
X-List-Received-Date: Sun, 15 May 2011 15:06:21 -0000
X-Groupsio-MsgNum: 32054
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0E3DsKhCsCPI+lGQTTF8"

--=-0E3DsKhCsCPI+lGQTTF8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,


Am Samstag, den 14.05.2011, 00:26 +0200 schrieb Henning Heinold:

> first,
>=20
> Khem and I discovered it too and Khem had a fix for it and I think he wil=
l
> push it soon into uclibc-gi tree.

thank you. Commit 71d63ed7 [1] indeed fixed it.

[=E2=80=A6]

> second you wont be able to compile systemd, after working around as much =
as possible
> there are to many CPU_ functions missing in uclibc.

Thank you for the information. I will probably try it anyway to get the
error message so I can post it somewhere in case anybody else searches
for this on the Web. Maybe someone steps up and enhances uClibc.


Thanks,

Paul


[1] http://git.uclibc.org/uClibc/commit/?id=3D71d63ed75648da9b0b71afabb9c60=
aaad792c55c

--=-0E3DsKhCsCPI+lGQTTF8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3P60IACgkQPX1aK2wOHVhi8wCcC9ebUVEm3KEWZpPOg/kAv73u
ppYAn2sxk6zA6lMVqAaVESt4cRa4/xPN
=lvS2
-----END PGP SIGNATURE-----

--=-0E3DsKhCsCPI+lGQTTF8--
