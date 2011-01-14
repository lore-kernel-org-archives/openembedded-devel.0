Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pdfgd-0004dY-MT for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 10:11:11 +0100
Received: from f053042123.adsl.alicedsl.de ([78.53.42.123]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pdfg7-0005Uo-Ud for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 09:10:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jan 2011 10:10:38 +0100
Message-ID: <1294996238.3578.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
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
X-List-Received-Date: Fri, 14 Jan 2011 09:11:11 -0000
X-Groupsio-MsgNum: 28039
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iFeBS+jthRjKZ9FCmZuc"

--=-iFeBS+jthRjKZ9FCmZuc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=46rom b2e249702a0f6b5e36a4b095f5a4c495aa5ec14f Mon Sep 17 00:00:00 2001
From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Fri, 14 Jan 2011 09:48:08 +0100
Subject: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`

Since commit d729d14d [1] task `configure` for `python_2.6.5` and `python_2=
.7.1` fails with the following error message when compiling with `angstrom_=
2008.1` for `MACHINE =3D "beagleboard"`.

	checking for major... yes
	checking for getaddrinfo... yes
	checking getaddrinfo bug... buggy
	Fatal: You must get working getaddrinfo() function.
		     or you can specify "--disable-ipv6".
	ERROR: Function do_configure failed

Disable IPv6 for now in Python unconditionally until a better solution is f=
ound. This patch is build tested with `angstrom_2008.1` for `MACHINE =3D "b=
eagleboard"`.

(OpenWRT seems to have had the same issue [2].)

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dd729d14=
d9bff474f41c0853086d89cf6b50f41ff
[2] https://dev.openwrt.org/changeset/17077

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/python/python.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python.inc b/recipes/python/python.inc
index c325b91..09d2392 100644
--- a/recipes/python/python.inc
+++ b/recipes/python/python.inc
@@ -20,4 +20,5 @@ EXTRA_OECONF =3D "\
   --with-signal-module \
   --with-wctype-functions \
   --enable-shared \
+  --disable-ipv6 \
 "
--=20
1.7.2.3

--=-iFeBS+jthRjKZ9FCmZuc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0wEvsACgkQPX1aK2wOHVgBvgCfaS0nrS3alTGvb+O6M1j7EC9i
VqgAniDiQNYZru9RGNP87rVjlRIsg6p+
=QaXW
-----END PGP SIGNATURE-----

--=-iFeBS+jthRjKZ9FCmZuc--
