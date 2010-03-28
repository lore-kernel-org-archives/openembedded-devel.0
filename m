Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nvtqr-0004XB-RL for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 16:52:34 +0200
Received: from f053035077.adsl.alicedsl.de ([78.53.35.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nvtnm-0006DH-Lk for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 14:49:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Mar 2010 16:49:21 +0200
Message-ID: <1269787761.8018.21.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libsvdrp: Add libsvdrp hg.
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
X-List-Received-Date: Sun, 28 Mar 2010 14:52:34 -0000
X-Groupsio-MsgNum: 18191
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-nYI4G7Iu7eeCchtZCaEB"

--=-nYI4G7Iu7eeCchtZCaEB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. Build tested with GCC 4.4.3 and Binutils 2.20.1 for `MACHINE =3D "beagle=
board"`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I am not sure if `${PN}` can be used in `HOMEPAGE`.
---
 recipes/libsvdrp/libsvdrp.inc   |   14 ++++++++++++++
 recipes/libsvdrp/libsvdrp_hg.bb |    9 +++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libsvdrp/libsvdrp.inc
 create mode 100644 recipes/libsvdrp/libsvdrp_hg.bb

diff --git a/recipes/libsvdrp/libsvdrp.inc b/recipes/libsvdrp/libsvdrp.inc
new file mode 100644
index 0000000..f0442c2
--- /dev/null
+++ b/recipes/libsvdrp/libsvdrp.inc
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "libsvdrp is an interface library to allow C programs to i=
nteract with a running VDR, using the SVDRP protocol."
+HOMEPAGE =3D "http://hg.geexbox.org/${PN}"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "LGPLv2.1"
+
+INC_PR =3D "r0"
+
+SRC_URI =3D "http://${PN}.geexbox.org/releases/${P}.tar.bz2;name=3D${PN}"
+
+inherit autotools pkgconfig
+
+PACKAGES =3D+ "${PN}-bin"
+
+FILES_${PN}-bin =3D "${bindir}/*"
diff --git a/recipes/libsvdrp/libsvdrp_hg.bb b/recipes/libsvdrp/libsvdrp_hg=
.bb
new file mode 100644
index 0000000..5b2fb04
--- /dev/null
+++ b/recipes/libsvdrp/libsvdrp_hg.bb
@@ -0,0 +1,9 @@
+require libsvdrp.inc
+PV =3D "0.0.1+hg"
+PR =3D "${INC_PR}.0"
+
+SRCREV =3D "0b191f7b2cb8"
+
+SRC_URI =3D "hg://hg.geexbox.org;module=3D${PN};rev=3D${SRCREV}"
+
+S =3D "${WORKDIR}/${PN}"
--=20
1.7.0.3

--=-nYI4G7Iu7eeCchtZCaEB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuvbHEACgkQPX1aK2wOHVh5uQCbBw6nmkIvZgLoFSRyFeq72Rh0
ed4An2+q1VxCRCIBteAUvq82CJKG0FHZ
=C+me
-----END PGP SIGNATURE-----

--=-nYI4G7Iu7eeCchtZCaEB--
