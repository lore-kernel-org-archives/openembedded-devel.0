Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LCq8V-0005SL-9k
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Dec 2008 07:43:59 +0100
Received: (qmail invoked by alias); 17 Dec 2008 06:39:27 -0000
Received: from e179038145.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.179.38.145]
	by mail.gmx.net (mp071) with SMTP; 17 Dec 2008 07:39:27 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX198u6IjShJ8v34GUkxZX/DjjDUb7oAwO+cAB9HAp8
	hi2YzZKXaQmjdA
Message-ID: <49489ED8.4090903@gmx.net>
Date: Wed, 17 Dec 2008 07:40:24 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: glibc recipes and LD_LIBRARY_PATH
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
X-List-Received-Date: Wed, 17 Dec 2008 06:44:00 -0000
X-Groupsio-MsgNum: 7007
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigA50EC3EE8B336E8AF9FE0151"

--------------enigA50EC3EE8B336E8AF9FE0151
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
apparently the glibc build system does not like it when LD_LIBRARY_PATH
is set. Unfortunately on Debian for amd64 this variable points to

":/emul/ia32-linux/usr/lib"

all times. Does anything speak against adding:

LD_LIBRARY_PATH[unexport] =3D "1"

to the recipes?

Regards
Robert


--------------enigA50EC3EE8B336E8AF9FE0151
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAklIntoACgkQG9cfwmwwEtqGDwCfRssHjjUDSVLWHicjYkTO6kib
WrEAnj5nIYhs4aMqF0qTVCFvP8tbx3Hp
=wnhn
-----END PGP SIGNATURE-----

--------------enigA50EC3EE8B336E8AF9FE0151--
