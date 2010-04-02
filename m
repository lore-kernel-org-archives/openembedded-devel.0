Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nxj3a-0000YN-22 for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 17:45:19 +0200
Received: from f053032126.adsl.alicedsl.de ([78.53.32.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nxj0Q-0004uS-Pn for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 15:41:58 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Apr 2010 17:41:57 +0200
Message-ID: <1270222917.3873.18.camel@mattotaupa>
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
Subject: [PATCH] libplayer: Use `${PN}` instead of `libplayer`.
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
X-List-Received-Date: Fri, 02 Apr 2010 15:45:19 -0000
X-Groupsio-MsgNum: 18390
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XMbeX46l5zf6MxPPfCCN"

--=-XMbeX46l5zf6MxPPfCCN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/libplayer/libplayer.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libplayer/libplayer.inc b/recipes/libplayer/libplayer.=
inc
index 823e4b5..ea74aee 100644
--- a/recipes/libplayer/libplayer.inc
+++ b/recipes/libplayer/libplayer.inc
@@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libx11 libxcb mplayer gstreamer"
=20
 INC_PR =3D "r1"
=20
-SRC_URI =3D "http://libplayer.geexbox.org/releases/${P}.tar.bz2;name=3D${P=
N}"
+SRC_URI =3D "http://${PN}.geexbox.org/releases/${P}.tar.bz2;name=3D${PN}"
=20
 inherit autotools pkgconfig
=20
--=20
1.7.0.3

--=-XMbeX46l5zf6MxPPfCCN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku2EEUACgkQPX1aK2wOHVhlNwCfeZsn3VIAszs34HRIKzb5m3SO
wmEAn3OFEfxya+EAzk4jLSR3KZdrB0kC
=8Mw9
-----END PGP SIGNATURE-----

--=-XMbeX46l5zf6MxPPfCCN--
