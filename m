Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6mU7-0004XP-UZ for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:46:20 +0200
Received: from f053038067.adsl.alicedsl.de ([78.53.38.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6mTg-0005cx-42 for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 15:45:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Oct 2010 17:45:51 +0200
Message-ID: <1287157551.4233.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cacao-native-0.99.3: fix `install: cannot stat `src/cacaoh/.libs/cacaoh': No such file or directory`
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
X-List-Received-Date: Fri, 15 Oct 2010 15:46:20 -0000
X-Groupsio-MsgNum: 24907
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bdosG+JR0XxyV/dRoAiu"

--=-bdosG+JR0XxyV/dRoAiu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 15 Oct 2010 14:09:42 +0200

Task of `do_install` of `cacao-native-0.99.3` fails with the following erro=
r.

	NOTE: Task failed: ('function do_install failed', '/oe/build-angstrom-next=
/angstrom-dev/work/i686-linux/cacaoh-native-0.99.3-r2.1/temp/log.do_install=
.26664')
	ERROR: Logfile of failure stored in: /oe/build-angstrom-next/angstrom-dev/=
work/i686-linux/cacaoh-native-0.99.3-r2.1/temp/log.do_install.26664
	Log data follows:
	| install: cannot stat `src/cacaoh/.libs/cacaoh': No such file or director=
y
	| ERROR: Function do_install failed
	NOTE: package cacaoh-native-0.99.3-r2.1: task do_install: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/cacao/cacaoh-native_0.99.3.bb do_=
install failed
	ERROR: Task 2260 (/oe/openembedded/recipes/cacao/cacaoh-native_0.99.3.bb, =
do_install) failed with 256

In the work directory there are the following files.

	=E2=80=A6/work/=E2=80=A6/cacao-0.99.3-r11/cacao-0.99.3$ find . -name *caca=
oh*
	./src/cacaoh
	./src/cacaoh/cacaoh.c
	./m4/cacaoh.m4

Build tested with `angstrom-2010.x` for `MACHINE =3D "beagleboard"`, which =
failed before.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Again I am puzzled why this has not been surfaced for anyone else.
---
 recipes/cacao/cacaoh-native.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/cacao/cacaoh-native.inc b/recipes/cacao/cacaoh-native.=
inc
index 2b3709f..d745107 100644
--- a/recipes/cacao/cacaoh-native.inc
+++ b/recipes/cacao/cacaoh-native.inc
@@ -24,7 +24,7 @@ do_compile() {
=20
 do_install() {
   install -d ${D}${bindir}/cacaoh-${PV}
-  install -m 0755 src/cacaoh/.libs/cacaoh ${D}${bindir}/cacaoh-${PV}
+  install -m 0755 src/cacaoh/cacaoh ${D}${bindir}/cacaoh-${PV}
 }
=20
 NATIVE_INSTALL_WORKS =3D "1"
--=20
1.7.1


--=-bdosG+JR0XxyV/dRoAiu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky4dy8ACgkQPX1aK2wOHViRdACeNsNjBJrfoY0l+TcknwHZVf64
f3AAn2ysKCZGx2fDUiXdH4m7EknbFmqR
=MD/W
-----END PGP SIGNATURE-----

--=-bdosG+JR0XxyV/dRoAiu--
