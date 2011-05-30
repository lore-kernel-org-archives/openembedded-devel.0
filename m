Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QR7op-0001LT-Kx for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 21:08:03 +0200
Received: from f053035189.adsl.alicedsl.de ([78.53.35.189]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QR7mK-0003Pf-4w for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 19:05:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <09fa504b75a241d161f6263aa74393d19993b075.1306760475.git.ludovic.desroches@atmel.com>
References: <09fa504b75a241d161f6263aa74393d19993b075.1306760475.git.ludovic.desroches@atmel.com>
Date: Mon, 30 May 2011 21:04:55 +0200
Message-ID: <1306782295.4106.479.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH v3] tiobench: Add version 0.3.3 (initial recipe)
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
X-List-Received-Date: Mon, 30 May 2011 19:08:03 -0000
X-Groupsio-MsgNum: 32402
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-JKk8nk1EpKVr5J4bYPwv"

--=-JKk8nk1EpKVr5J4bYPwv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 30 May 2011 18:43:14 +0200

Build tested
=E2=80=A2 with task-base image with the tiobench package on atmel boards by=
 Ludovic Desroches and
=E2=80=A2 using `angstrom-2010.x` and `minimal{,-uclibc}` for `MACHINE =3D =
"beagleboard"` by Paul Menzel.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
v2 =E2=86=92 v3
=E2=80=A2 sort dependencies
=E2=80=A2 update `LICENSE`
=E2=80=A2 remove overrides, which are the defaults
=E2=80=A2 use ${PN} and ${P}
=E2=80=A2 rename directory for the patch

Ludovic, could you please test the updated patch and tell me if you send th=
e Makefile patch upstream.
---
 .../tiobench-0.3.3/tiobench-makefile.patch         |   47 ++++++++++++++++=
++++
 recipes/tiobench/tiobench_0.3.3.bb                 |   24 ++++++++++
 2 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tiobench/tiobench-0.3.3/tiobench-makefile.patch
 create mode 100644 recipes/tiobench/tiobench_0.3.3.bb

diff --git a/recipes/tiobench/tiobench-0.3.3/tiobench-makefile.patch b/reci=
pes/tiobench/tiobench-0.3.3/tiobench-makefile.patch
new file mode 100644
index 0000000..f924c1b
--- /dev/null
+++ b/recipes/tiobench/tiobench-0.3.3/tiobench-makefile.patch
@@ -0,0 +1,47 @@
+Author: Ludovic Desroches <ludovic.desroches@atmel.com>
+
+Adapt tiobench to OE
+Index: Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/Makefile	2011-05-26 07:48:46.341400974 +0200
++++ b/Makefile	2011-05-30 06:32:38.091401358 +0200
+@@ -1,8 +1,9 @@
+ # Makefile for tiotest
+=20
+-CC=3Dgcc
++CC?=3Dgcc
+ #CFLAGS=3D-O3 -fomit-frame-pointer -Wall
+ CFLAGS=3D-O2 -Wall
++LDFLAGS?=3D
+=20
+ #DEFINES=3D-DUSE_MMAP=20
+ #-DUSE_MADVISE
+@@ -14,16 +15,16 @@
+=20
+ #DEFINES=3D
+=20
+-LINK=3Dgcc
++LINK?=3D$(CC)
+ EXE=3Dtiotest
+ PROJECT=3Dtiobench
+ # do it once instead of each time referenced
+ VERSION=3D$(shell egrep "tiotest v[0-9]+.[0-9]+" tiotest.c | cut -d " " -=
f 7 | sed "s/v//g")
+ DISTNAME=3D$(PROJECT)-$(VERSION)
+ INSTALL=3Dinstall
+-PREFIX=3D/usr/local
++PREFIX?=3D/usr/local
+ BINDIR=3D$(PREFIX)/bin
+-DOCDIR=3D/usr/local/doc/$(DISTNAME)
++DOCDIR=3D$(PREFIX)/doc/$(DISTNAME)
+=20
+ all: $(EXE)
+=20
+@@ -34,7 +35,7 @@
+ 	$(CC) -c $(CFLAGS) $(DEFINES) tiotest.c -o tiotest.o
+=20
+ $(EXE): tiotest.o crc32.o
+-	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread
++	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread $(LDFLAGS)
+ 	@echo
+ 	@echo "./tiobench.pl --help for usage options"
+ 	@echo
diff --git a/recipes/tiobench/tiobench_0.3.3.bb b/recipes/tiobench/tiobench=
_0.3.3.bb
new file mode 100644
index 0000000..55894e3
--- /dev/null
+++ b/recipes/tiobench/tiobench_0.3.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "Threaded I/O tester"
+HOMEPAGE =3D "http://sourceforge.net/projects/tiobench/"
+LICENSE =3D "GPLv2"
+RDEPENDS =3D "\
+    perl \
+    perl-module-exporter-heavy \
+    perl-module-getopt-long \
+    perl-module-overload \
+    perl-module-strict \
+    "
+PR =3D "r0"
+
+SRC_URI =3D "\
+    http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${P}.tar=
.gz \
+    file://tiobench-makefile.patch \
+    "
+SRC_URI[md5sum] =3D "bf485bf820e693c79e6bd2a38702a128"
+SRC_URI[sha256sum] =3D "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0=
685b7ea9db2bcc"
+
+EXTRA_OEMAKE =3D "PREFIX=3D${D}"
+
+do_install() {
+    oe_runmake install
+}
--=20
1.7.5.3

--=-JKk8nk1EpKVr5J4bYPwv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3j6lcACgkQPX1aK2wOHViBpwCeMneA4F3r9QgApcSORr52RHOc
wx0AnjXCq91rKCYmt+qM2BJTPsE/BF96
=OWp9
-----END PGP SIGNATURE-----

--=-JKk8nk1EpKVr5J4bYPwv--
