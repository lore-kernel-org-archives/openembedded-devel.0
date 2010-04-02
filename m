Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nxj2v-0003es-1P for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 17:44:34 +0200
Received: from f053032126.adsl.alicedsl.de ([78.53.32.126]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nxizl-0004rD-KT for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 15:41:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Apr 2010 17:41:16 +0200
Message-ID: <1270222876.3873.17.camel@mattotaupa>
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
Subject: [PATCH] libplayer: Add `virtual/libx11` and `libxcb` to `DEPENDS`.
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
X-List-Received-Date: Fri, 02 Apr 2010 15:44:34 -0000
X-Groupsio-MsgNum: 18389
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qRQRaGDsVGgNETkhMgEs"

--=-qRQRaGDsVGgNETkhMgEs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Without those dependencies libplayer would not work with MPlayer and compla=
in.

    =C2=BBlibplayer is not compiled with X11 support=C2=AB [1]

[1] http://hg.geexbox.org/libplayer/file/4fb30e64db79/src/wrapper_mplayer.c=
#l2669

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/libplayer/libplayer.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libplayer/libplayer.inc b/recipes/libplayer/libplayer.=
inc
index a986a21..823e4b5 100644
--- a/recipes/libplayer/libplayer.inc
+++ b/recipes/libplayer/libplayer.inc
@@ -2,9 +2,9 @@ DESCRIPTION =3D "libplayer is a multimedia A/V abstraction =
layer API. Its goal is
 HOMEPAGE =3D "http://libplayer.geexbox.org/"
 SECTION =3D "libs/multimedia"
 LICENSE =3D "LGPLv2.1+"
-DEPENDS =3D "mplayer gstreamer"
+DEPENDS =3D "virtual/libx11 libxcb mplayer gstreamer"
=20
-INC_PR =3D "r0"
+INC_PR =3D "r1"
=20
 SRC_URI =3D "http://libplayer.geexbox.org/releases/${P}.tar.bz2;name=3D${P=
N}"
=20
--=20
1.7.0.3

--=-qRQRaGDsVGgNETkhMgEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku2EBwACgkQPX1aK2wOHVhz9wCdGVJ1m8j81ZWb0UOEUlJucK9e
ZroAnipvDqeZhxX3xXoaMIjgblFIl6RH
=faka
-----END PGP SIGNATURE-----

--=-qRQRaGDsVGgNETkhMgEs--
