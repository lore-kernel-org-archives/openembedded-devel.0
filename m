Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBUYJ-0006UF-5Q for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 18:10:23 +0200
Received: from f053034068.adsl.alicedsl.de ([78.53.34.68]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBUWV-0003Q5-8j for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 16:08:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 18:08:04 +0200
Message-ID: <1303056484.23572.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] schroedinger: remove version 0.2.0.0
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
X-List-Received-Date: Sun, 17 Apr 2011 16:10:23 -0000
X-Groupsio-MsgNum: 31240
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Lodpjx4HHmlX3H0rdme+"

--=-Lodpjx4HHmlX3H0rdme+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 17 Apr 2011 17:58:48 +0200

This version was released on 2006-05-22 and the current version is 1.0.10, =
where 1.0.9 is currently packaged in OE.

Additionally this version fails to compile with for example the following e=
rror using `angstrom-2010.x`.

	[=E2=80=A6]
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompi=
le arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interw
	ork -mno-thumb --sysroot=3D/oe/build-angstrom-next/angstrom-dev/sysroots/a=
rmv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -
	Wall -I.. -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-=
linux-gnueabi/usr/include/liboil-0.3   -fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -O2 -ggdb2 -MT libschroedinger_0.1_la-schrobu=
ffer.lo -MD -MP -MF .deps/libschroedinger_0.1_la-schrobuffer.Tpo -c -o libs=
chroedinger_0.1_la-schrobuffer.lo `test -f 'schrobuffer.c' || echo './'`sch=
robuffer.c
	schroframe.c:350:1: error: expected declaration specifiers or '...' before=
 '*' token
	schroframe.c:350:1: error: '_oil_type_add_s16' declared as function return=
ing a function
	schroframe.c:350:1: error: '_oil_type_add_s16' redeclared as different kin=
d of symbol
	/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include/liboil-0.3/liboil/liboilfuncs.h:70:16: note: previous declara=
tion of '_oil_type_add_s16' was here
	schroframe.c: In function '_oil_type_add_s16':
	schroframe.c:354:13: error: 'n' undeclared (first use in this function)
	schroframe.c:354:13: note: each undeclared identifier is reported only onc=
e for each function it appears in
	schroframe.c:355:5: error: 'd_n' undeclared (first use in this function)
	schroframe.c:355:14: error: 's1_n' undeclared (first use in this function)
	schroframe.c:355:24: error: 's2_n' undeclared (first use in this function)
	schroframe.c:357:1: warning: no return statement in function returning non=
-void
	schroframe.c: At top level:
	schroframe.c:360:1: error: expected declaration specifiers or '...' before=
 '*' token
	schroframe.c:360:1: error: '_oil_type_add_s16_u8' declared as function ret=
urning a function
	schroframe.c:360:1: error: '_oil_type_add_s16_u8' redeclared as different =
kind of symbol
	/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include/liboil-0.3/liboil/liboilfuncs.h:73:16: note: previous declara=
tion of '_oil_type_add_s16_u8' was here
	[=E2=80=A6]

No distribution is pinning this version.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/schroedinger/schroedinger_0.2.0.0.bb |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)
 delete mode 100644 recipes/schroedinger/schroedinger_0.2.0.0.bb

diff --git a/recipes/schroedinger/schroedinger_0.2.0.0.bb b/recipes/schroed=
inger/schroedinger_0.2.0.0.bb
deleted file mode 100644
index ba61d2a..0000000
--- a/recipes/schroedinger/schroedinger_0.2.0.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-HOMEPAGE =3D "http://schrodinger.sourceforge.net/"
-LICENSE =3D "MPL GPL LGPL MIT"
-DEPENDS =3D "liboil gstreamer gst-plugins-base"
-
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/schrodinger/${P}.tar.gz"
-
-inherit autotools pkgconfig
-
-FILES_${PN} +=3D "${libdir}/gstreamer-0.10/libgstschro.so"
-
-
-SRC_URI[md5sum] =3D "45f8d0efd9b76579a005e4ffe7f96ac3"
-SRC_URI[sha256sum] =3D "0b01f9fb9c869ecb6e066993d59e34789f82d445438480ac0e=
2dc30f29d047a0"
--=20
1.7.4.4

--=-Lodpjx4HHmlX3H0rdme+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2rEGQACgkQPX1aK2wOHVit1wCfZiZei8l/vyuc+yVZCZY4fq4Z
ChMAnioponXdhM8wZMVM2GSLDUOVKtXg
=TsIX
-----END PGP SIGNATURE-----

--=-Lodpjx4HHmlX3H0rdme+--
