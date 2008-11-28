Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1L68HK-000899-Kv
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Nov 2008 19:41:22 +0100
Received: (qmail invoked by alias); 28 Nov 2008 18:38:11 -0000
Received: from e179036120.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.179.36.120]
	by mail.gmx.net (mp002) with SMTP; 28 Nov 2008 19:38:11 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/omjtBzoXo6uwYFDOePL0TRJp0B92zCvZ4OHeP4h
	lIOb+7NcFdRL+O
Message-ID: <49303ABA.4060401@gmx.net>
Date: Fri, 28 Nov 2008 19:38:50 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.68
Subject: can use x86_64 as an override
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
X-List-Received-Date: Fri, 28 Nov 2008 18:41:22 -0000
X-Groupsio-MsgNum: 6784
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigD3726BFB653AC2F70657F342"

--------------enigD3726BFB653AC2F70657F342
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
it seems to be impossible to use x86_64 as an override. I want to
do this:

DEPENDS =3D "zlib-native classpath-initial jikes-initial"
DEPENDS_x86_64 +=3D "libffi-native"

However when wvaluting this with "bitbake -i" libffi-native is not part
of the DEPENDS variable.

I guess it has something to do with the underscore in x86_64, right?

Perhaps we can fix this by sanitizing OVERRIDES by replacing all
underscores in its entries with a hyphen. At least for the above case
this would not be to bad.

Ideas?

Regards
Robert


--------------enigD3726BFB653AC2F70657F342
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkkwOroACgkQG9cfwmwwEto1XQCggbyX5osRiKKs3P7d+Z2r24zz
+qUAn1F1kLQfPopkxuOkzH/6K2P1gRZg
=xTIw
-----END PGP SIGNATURE-----

--------------enigD3726BFB653AC2F70657F342--
