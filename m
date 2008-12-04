Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1L8Jlx-0003q2-Hv
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 20:22:01 +0100
Received: (qmail invoked by alias); 04 Dec 2008 19:18:23 -0000
Received: from e178110213.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.110.213]
	by mail.gmx.net (mp041) with SMTP; 04 Dec 2008 20:18:23 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19KVbltKjxKJfeC69Emw8mqqNeEbz5IGIEyFBtRPx
	KWCz459oLLyFW+
Message-ID: <49382D2D.1030504@gmx.net>
Date: Thu, 04 Dec 2008 20:19:09 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.71
Subject: RFC: remove boost-jam-native 3.1.11
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
X-List-Received-Date: Thu, 04 Dec 2008 19:22:01 -0000
X-Groupsio-MsgNum: 6860
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig0CB01BA03DA357BB635D932F"

--------------enig0CB01BA03DA357BB635D932F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I would like to remove the boost-jam-native recipe for version 3.1.11
and instead rely on version 3.1.16 which we also have.

The reason is that you cannot build the newer boost version 1.34 and
1.36 with the older boost-jam while 1.33 can work with the newer as well.=


On a related note: I invested some time to get boost 1.34.1 being build
nicely including the bzip2 and gzip support. Now I see that in the 1.36
recipe those are disabled again. That is unfortunate because wesnoth
needs them.

Regards
Robert


--------------enig0CB01BA03DA357BB635D932F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkk4LS0ACgkQG9cfwmwwEtrDMQCfc9cE7UOy+6tGRCeA4cXciCN0
WOEAn1b/RbhQdeVFKXIS5ak+LHGqp/tB
=ispJ
-----END PGP SIGNATURE-----

--------------enig0CB01BA03DA357BB635D932F--
