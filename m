Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB3AW-0008Cz-W5 for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 12:56:01 +0200
Received: from f053044057.adsl.alicedsl.de ([78.53.44.57]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB38i-0001EQ-0E for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 10:54:08 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302951049.8709.22.camel@mattotaupa>
References: <1302951049.8709.22.camel@mattotaupa>
Date: Sat, 16 Apr 2011 12:53:43 +0200
Message-ID: <1302951223.8709.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH 2/2] viking: add `curl` to `DEPENDS`
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
X-List-Received-Date: Sat, 16 Apr 2011 10:56:01 -0000
X-Groupsio-MsgNum: 31206
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-F8oMFwfVEz2gMjixubBZ"

--=-F8oMFwfVEz2gMjixubBZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 16 Apr 2011 12:39:23 +0200

Task configure fails with the following error.

	checking for gawk... (cached) gawk
	checking for curl-config... no
	checking whether libcurl is usable... no
	configure: error: libcurl is needed but not found

Adding `curl` to `DEPENDS` fixes this problem and was tested using the foll=
owing configuration.

	Build Configuration:
	BB_VERSION        =3D "1.12.0"
	METADATA_BRANCH   =3D "viking"
	METADATA_REVISION =3D "b78f877"
	TARGET_ARCH       =3D "arm"
	TARGET_OS         =3D "linux-gnueabi"
	MACHINE           =3D "beagleboard"
	DISTRO            =3D "minimal"
	DISTRO_VERSION    =3D "dev-snapshot-20110416"
	TARGET_FPU        =3D "hard"

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Stanislav Brabec <utx@penguin.cz>
---
 recipes/viking/viking_0.9.6.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/viking/viking_0.9.6.bb b/recipes/viking/viking_0.9.6.b=
b
index f24b859..13d9801 100644
--- a/recipes/viking/viking_0.9.6.bb
+++ b/recipes/viking/viking_0.9.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "program to manage GPS data"
 HOMEPAGE =3D "http://viking.sourceforge.net/"
 SECTION =3D "x11/applications"
-DEPENDS =3D "gpsd gtk+ intltool-native"
+DEPENDS =3D "curl gpsd gtk+ intltool-native"
 LICENSE =3D "GPLv2"
 PRIORITY =3D "optional"
 PR =3D "r1"
--=20
1.7.4.4

--=-F8oMFwfVEz2gMjixubBZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2pdTcACgkQPX1aK2wOHVhSYgCeMajtcM0PmV5Ww1tQMfi1G651
vQsAn02RnxouKXirFdtXLNAq79CI6zdq
=qxR9
-----END PGP SIGNATURE-----

--=-F8oMFwfVEz2gMjixubBZ--
