Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBVSK-0003rY-27 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 19:08:16 +0200
Received: from f053034068.adsl.alicedsl.de ([78.53.34.68]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBVQW-0006e0-EA for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 17:06:24 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Apr 2011 19:05:57 +0200
Message-ID: <1303059957.23572.25.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] schroedinger: inherit class `pkgconfig`
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
X-List-Received-Date: Sun, 17 Apr 2011 17:08:16 -0000
X-Groupsio-MsgNum: 31243
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4IPUMUFPacXDdfa+Km5C"

--=-4IPUMUFPacXDdfa+Km5C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 17 Apr 2011 18:47:21 +0200

Schr=C3=B6dinger installs pkg-config files.

	$ ls angstrom-dev/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r1=
.0/schroedinger-1.0.9/*pc*
	angstrom-dev/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r1.0/sc=
hroedinger-1.0.9/depcomp
	angstrom-dev/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r1.0/sc=
hroedinger-1.0.9/schroedinger-1.0-uninstalled.pc
	angstrom-dev/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r1.0/sc=
hroedinger-1.0.9/schroedinger-uninstalled.pc
	angstrom-dev/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r1.0/sc=
hroedinger-1.0.9/schroedinger-uninstalled.pc.in
	angstrom-dev/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r1.0/sc=
hroedinger-1.0.9/schroedinger.pc
	angstrom-dev/work/armv7a-angstrom-linux-gnueabi/schroedinger-1.0.9-r1.0/sc=
hroedinger-1.0.9/schroedinger.pc.in

It looks like originally `AUTOTOOLS_STAGE_PKGCONFIG` was used for this task=
. This variable was not used anymore and stylistically removed in commit c9=
ca1ec7 [1], but it was forgotten to inherit `pkgconfig` again.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc9ca1ec=
7a97eda5518ef95a35efee76b943763a8

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Strangely the missing class inheritance did not cause any build errors for =
packages depending on `schroedinger`.
---
 recipes/schroedinger/schroedinger.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/schroedinger/schroedinger.inc b/recipes/schroedinger/s=
chroedinger.inc
index 386fc73..1e9877d 100644
--- a/recipes/schroedinger/schroedinger.inc
+++ b/recipes/schroedinger/schroedinger.inc
@@ -9,7 +9,7 @@ SRC_URI +=3D "file://configure.ac.patch"
=20
 EXTRA_OECONF +=3D "STAGING_DIR=3D${STAGING_DIR_NATIVE}"
=20
-inherit autotools
+inherit autotools pkgconfig
=20
 do_configure_append () {
         # Fix stupid libtool... handling.=20
--=20
1.7.4.4


--=-4IPUMUFPacXDdfa+Km5C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2rHfUACgkQPX1aK2wOHVjgzQCdHof/zu/5oCCfjwHmDfdpTN1+
1hYAn3pTO+y0LCK6M/wAM0oMr3CNAy0w
=ahXT
-----END PGP SIGNATURE-----

--=-4IPUMUFPacXDdfa+Km5C--
