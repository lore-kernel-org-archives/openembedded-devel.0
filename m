Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmsL1-0000km-7T for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 21:03:11 +0200
Received: from f053039036.adsl.alicedsl.de ([78.53.39.36]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QmsI2-0003R4-Vw for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jul 2011 19:00:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2011 20:58:54 +0200
Message-ID: <1311965934.3882.87.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH 1/2] iceauth: cleanup
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
X-List-Received-Date: Fri, 29 Jul 2011 19:03:11 -0000
X-Groupsio-MsgNum: 33396
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ErLMa4oKKMOc19RFN8Qu"

--=-ErLMa4oKKMOc19RFN8Qu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Fri, 29 Jul 2011 20:23:54 +0200

1. Improve description: s/a tool/Tool/. Therefore bump `PR`.
2. Reorder according to the style guide [1].
3. Remove unneeded space when using `+=3D`.

Based on a patch for meta-oe from Andreas [2].

[1] http://wiki.openembedded.org/index.php/Styleguide
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/03416=
8.html

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/xorg-app/iceauth_1.0.4.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes/xorg-app/iceauth_1.0.4.bb b/recipes/xorg-app/iceauth_1=
.0.4.bb
index 6bb9999..e3b465f 100644
--- a/recipes/xorg-app/iceauth_1.0.4.bb
+++ b/recipes/xorg-app/iceauth_1.0.4.bb
@@ -1,8 +1,9 @@
-require xorg-app-common.inc
-DESCRIPTION =3D "a tool for manipulating ICE protocol authorization record=
s"
-DEPENDS +=3D " libice"
+DESCRIPTION =3D "Tool for manipulating ICE protocol authorization records"
+DEPENDS +=3D "libice"
 PE =3D "1"
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
+
+require xorg-app-common.inc
=20
 SRC_URI[archive.md5sum] =3D "bb2e4d2611047f7c5a1a82ec956a9de4"
 SRC_URI[archive.sha256sum] =3D "0ee6fd4554f0131b1ed526ee00b9cf643e7dc97eb7=
0fb51448848ef2f349938d"
--=20
1.7.5.4

--=-ErLMa4oKKMOc19RFN8Qu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4zAu4ACgkQPX1aK2wOHVgvwQCfdds0JQ5e+nugPxTVn0G4RoDs
3KkAoItCFfQmEeUQSQQS7gA5IpyvKSyU
=yIEo
-----END PGP SIGNATURE-----

--=-ErLMa4oKKMOc19RFN8Qu--
