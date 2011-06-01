Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRkFg-0002qb-Ox for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 14:10:20 +0200
Received: from f053043077.adsl.alicedsl.de ([78.53.43.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QRkDD-0007rB-2i; Wed, 01 Jun 2011 12:07:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 01 Jun 2011 14:07:10 +0200
Message-ID: <1306930030.4315.63.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] lynx: fix checksums
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
X-List-Received-Date: Wed, 01 Jun 2011 12:10:20 -0000
X-Groupsio-MsgNum: 32446
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-G4HW/jwbBlNPrx92mT+E"

--=-G4HW/jwbBlNPrx92mT+E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 1 Jun 2011 13:41:59 +0200

This is a fixup for commit 06d31dc0 [1]

	commit 06d31dc06beb85a28ca3c2c2c0c2787267a24ff5
	Author: Stanislav Brabec <utx@penguin.cz>
	Date:   Tue May 31 22:28:20 2011 +0000

		  lynx: New recipe, version 2.8.7.

		  Signed-off-by: Stanislav Brabec <utx@penguin.cz>

	 recipes/lynx/lynx_2.8.7.bb |   40 +++++++++++++++++++++++++++++++++++++++=
+
	 1 files changed, 40 insertions(+), 0 deletions(-)

where task fetch failed with the following error message.

	ERROR: The checksums for "/oe/downloads/lynx2.8.7.tar.bz2" did not match.
		MD5: expected "cb936aef812e4e463ab86cbbe14d4db9", got "493af4c77ef6761e3f=
0157cd1be033a0"
		SHA256: expected "301bda96ad3cd5032805e8d5315a42061a11e472e3d3a7baee3a287=
9517ef627", got "40ec9774deb4a7acf69e1bcfb5e272a3857ccc17e20d923255d64cb5db=
e55dad"

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D06d31dc=
06beb85a28ca3c2c2c0c2787267a24ff5

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Stanislav Brabec <utx@penguin.cz>
---
Dear Stanislav,


I did not push this patch, because I find it strange that the checksums
are incorrect when you did not copy it. Do you have an idea what might
have gone wrong?


Thanks,

Paul
---
 recipes/lynx/lynx_2.8.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/lynx/lynx_2.8.7.bb b/recipes/lynx/lynx_2.8.7.bb
index 77434d1..1d63e89 100644
--- a/recipes/lynx/lynx_2.8.7.bb
+++ b/recipes/lynx/lynx_2.8.7.bb
@@ -37,5 +37,5 @@ do_configure() {
 	ac_cv_path_INSTALL=3D${bindir}/install
 }
=20
-SRC_URI[md5sum] =3D "cb936aef812e4e463ab86cbbe14d4db9"
-SRC_URI[sha256sum] =3D "301bda96ad3cd5032805e8d5315a42061a11e472e3d3a7baee=
3a2879517ef627"
+SRC_URI[md5sum] =3D "493af4c77ef6761e3f0157cd1be033a0"
+SRC_URI[sha256sum] =3D "40ec9774deb4a7acf69e1bcfb5e272a3857ccc17e20d923255=
d64cb5dbe55dad"
--=20
1.7.5.3

--=-G4HW/jwbBlNPrx92mT+E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3mK24ACgkQPX1aK2wOHVgbMQCfWv27pIyYqvmrN1BXErrWrxJR
plUAn2UM964NxJuGgUkWwmR9mbgRjjsj
=O9Jf
-----END PGP SIGNATURE-----

--=-G4HW/jwbBlNPrx92mT+E--
