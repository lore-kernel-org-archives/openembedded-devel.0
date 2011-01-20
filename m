Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pg3Um-0002oh-Vr for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 00:00:49 +0100
Received: from f053039178.adsl.alicedsl.de ([78.53.39.178]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pg3U9-0000uU-PR for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 23:00:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 00:00:08 +0100
Message-ID: <1295564408.23784.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH][RFC] libass: add 0.9.11
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
X-List-Received-Date: Thu, 20 Jan 2011 23:00:49 -0000
X-Groupsio-MsgNum: 28251
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0gN9U0dIZCyDvAmDqSqI"

--=-0gN9U0dIZCyDvAmDqSqI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 19 Jan 2011 16:15:30 +0100

The web site states the following [1].

	The following projects use libass:

	MPlayer
	VLC
	GStreamer (assrender plugin)
	Aegisub
	XBMC
	avidemux
	PunkGraphicsStream (BD subtitle encoder)

Build tested with 576df0d4 [2] with `angstrom-2008.1`, `angstrom-2010.x` an=
d `minimal` for `MACHINE =3D `beagleboard`.

[1] http://code.google.com/p/libass/
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D576df0d=
47658d195d7788ecaabdcb464a9b8f623

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
There are two issues left with this recipe.

1. There is a test program included [3], which I want to compile (`--enable=
-png`) and distribute (`${PN}-tests`). But unfortunately it is not compiled=
. `test/Makefile` is created but somehow it is not executed and `test` is n=
ot created. This is not a big deal right now since `${PN}-tests` is not cre=
ated since it is empty.
2. `inherit pkgconfig` makes no difference in the files put into `sysroots/=
`. And `sysroots/=E2=80=A6/arm=E2=80=A6/usr/lib/pkgconfig/libass.pc` does n=
ot have the the cross compile path in it besides using `inherit pkgconfig` =
or not.

[3] http://repo.or.cz/w/libass.git/tree/d8a0fe5984d9bc6d7827026215d21ada3dd=
a7b71:/test
---
 recipes/libass/libass.inc       |   22 ++++++++++++++++++++++
 recipes/libass/libass_0.9.11.bb |    5 +++++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libass/libass.inc
 create mode 100644 recipes/libass/libass_0.9.11.bb

diff --git a/recipes/libass/libass.inc b/recipes/libass/libass.inc
new file mode 100644
index 0000000..36b1080
--- /dev/null
+++ b/recipes/libass/libass.inc
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "libass is a portable subtitle renderer for the ASS/SSA (A=
dvanced Substation Alpha/Substation Alpha) subtitle format. It is mostly co=
mpatible with VSFilter."
+HOMEPAGE =3D "http://code.google.com/p/libass/"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "ISC"
+DEPENDS =3D "enca fontconfig freetype libpng"
+INC_PR =3D "r0"
+
+SRC_URI =3D "http://${PN}.googlecode.com/files/${P}.tar.bz2"
+
+inherit autotools pkgconfig
+
+OE_EXTRACONF =3D " \
+  --enable-enca \
+	--enable-fontconfig \
+	--enable-png \
+"
+
+PACKAGES =3D+ "${PN}-tests"
+
+FILES_${PN}-tests =3D " \
+	${libdir}/test/test
+"
diff --git a/recipes/libass/libass_0.9.11.bb b/recipes/libass/libass_0.9.11=
.bb
new file mode 100644
index 0000000..b94105f
--- /dev/null
+++ b/recipes/libass/libass_0.9.11.bb
@@ -0,0 +1,5 @@
+require ${PN}.inc
+PR =3D "${INC_PR}.0"
+
+SRC_URI[md5sum] =3D "f9042884397002ba40aa89dc7d34f59f"
+SRC_URI[sha256sum] =3D "ffd0a7ccf635c4795edb8f61015b47ff84ec9c5babf502dd2c=
c8223d4489745c"
--=20
1.7.2.3

--=-0gN9U0dIZCyDvAmDqSqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk04vnEACgkQPX1aK2wOHVgEGwCfajg1ABD4X0/aDug68uYk2PYj
znYAmwVahAMlyX2lI6yjxAEQaC5jtSpV
=g40C
-----END PGP SIGNATURE-----

--=-0gN9U0dIZCyDvAmDqSqI--
