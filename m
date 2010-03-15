Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrBkv-0001MM-F7 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 15:59:02 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrBi1-0007IX-P6 for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 14:55:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 15:55:56 +0100
Message-ID: <1268664956.16974.3.camel@mattotaupa>
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
Subject: [PATCH] liba52: Disable `-prefer-non-pic` to enable `-fPIC`.
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
X-List-Received-Date: Mon, 15 Mar 2010 14:59:03 -0000
X-Groupsio-MsgNum: 17675
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YEu1d6rJSVr8DWYIiwfu"

--=-YEu1d6rJSVr8DWYIiwfu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Using GCC 4.4.2 and Binutils 2.20 gives the following error.

    =E2=80=A6/bin/ld: .libs/imdct.o: relocation R_ARM_MOVW_ABS_NC against `=
a local symbol' can not be used when making a shared object; recompile with=
 -fPIC

Therefore enable `-fPIC` with this patch taken from Debian [1].

[1] http://patch-tracker.debian.org/patch/series/view/a52dec/0.7.4-13/01-en=
able-pic.diff

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/liba52/files/01-enable-pic.diff |   23 +++++++++++++++++++++++
 recipes/liba52/liba52_0.7.4.bb          |    5 +++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 recipes/liba52/files/01-enable-pic.diff

diff --git a/recipes/liba52/files/01-enable-pic.diff b/recipes/liba52/files=
/01-enable-pic.diff
new file mode 100644
index 0000000..ed1accd
--- /dev/null
+++ b/recipes/liba52/files/01-enable-pic.diff
@@ -0,0 +1,23 @@
+Description: Disabling -prefer-non-pic which enables -fPIC
+Bug-Debian: http://bugs.debian.org/401590
+Author: Daniel Baumann <daniel@debian.org>, Dmitrijs Ledkovs <dmitrij.ledk=
ov@gmail.com>
+
+
+---
+ liba52/configure.incl |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+
+Index: a52dec-deb/liba52/configure.incl
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a52dec-deb.orig/liba52/configure.incl	2009-12-05 02:52:12.000000000 +0=
000
++++ a52dec-deb/liba52/configure.incl	2009-12-05 03:23:45.000000000 +0000
+@@ -1,9 +1,6 @@
+ AC_SUBST([LIBA52_CFLAGS])
+ AC_SUBST([LIBA52_LIBS])
+=20
+-dnl avoid -fPIC when possible
+-LIBA52_CFLAGS=3D"$LIBA52_CFLAGS -prefer-non-pic"
+-
+ AC_ARG_ENABLE([double],
+     [  --enable-double         use double-precision samples])
+ if test x"$enable_double" =3D x"yes"; then
diff --git a/recipes/liba52/liba52_0.7.4.bb b/recipes/liba52/liba52_0.7.4.b=
b
index 743fa30..ea87cbe 100644
--- a/recipes/liba52/liba52_0.7.4.bb
+++ b/recipes/liba52/liba52_0.7.4.bb
@@ -2,11 +2,12 @@ DESCRIPTION =3D "Library for reading some sort of media f=
ormat."
 LICENSE =3D "GPL"
 SECTION =3D "libs"
 PRIORITY =3D "optional"
-PR =3D "r1"
+PR =3D "r2"
=20
 inherit autotools
=20
-SRC_URI =3D "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz"
+SRC_URI =3D "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
+           file://01-enable-pic.diff;patch=3D1"
 S =3D "${WORKDIR}/a52dec-${PV}"
=20
 EXTRA_OECONF =3D " --enable-shared "
--=20
1.7.0

--=-YEu1d6rJSVr8DWYIiwfu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkueSm8ACgkQPX1aK2wOHVha+wCbBJWcLeqGX8wMANHIfSG8As71
tpUAnidbR/gNpx4KGr+DVcaQKxMGuNd/
=M9Gc
-----END PGP SIGNATURE-----

--=-YEu1d6rJSVr8DWYIiwfu--
