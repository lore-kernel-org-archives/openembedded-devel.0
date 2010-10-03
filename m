Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2T4S-0008M0-8y for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 20:14:02 +0200
Received: from f053041250.adsl.alicedsl.de ([78.53.41.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P2T4D-0005bo-DR; Sun, 03 Oct 2010 18:13:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 03 Oct 2010 20:13:43 +0200
Message-ID: <1286129623.4310.33.camel@mattotaupa>
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
Subject: [PATCH] glib-2.0_2.24.1: fix `error: Could not find a glib-genmarshal in your PATH`
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
X-List-Received-Date: Sun, 03 Oct 2010 18:14:02 -0000
X-Groupsio-MsgNum: 24327
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-aoWXcwTf2MlnaYoH7cqW"

--=-aoWXcwTf2MlnaYoH7cqW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 3 Oct 2010 20:01:46 +0200

This commit partially reverts 1e4c8a [1].

Commit 1e4c8a removed `glib-2.0-native` from `DEPENDS`. Unfortunately `conf=
igure()` fails for me for minimal distributions with the following error. (=
It works for `angstrom-2008.1` though.)

    error: Could not find a glib-genmarshal in your PATH

Adding `glib-2.0-native` back to `DEPENDS` fixes the build error for me.

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1e4c8ab=
77532c76ad041ab3b50d3e18bfc352080

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
CC: Florian Boor <florian.boor@kernelconcepts.de>
---
Could someone please comment on this as the explanation in 1e4c8a to remove=
 the old style native dependency sounds quite sane.
---
 recipes/glib-2.0/glib-2.0_2.24.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/glib-2.0/glib-2.0_2.24.1.bb b/recipes/glib-2.0/glib-2.=
0_2.24.1.bb
index 3bc11de..15f0b1a 100644
--- a/recipes/glib-2.0/glib-2.0_2.24.1.bb
+++ b/recipes/glib-2.0/glib-2.0_2.24.1.bb
@@ -6,11 +6,11 @@ UNIX-like platforms, Windows, OS/2 and BeOS."
 LICENSE =3D "LGPL"
 SECTION =3D "libs"
 PRIORITY =3D "optional"
-DEPENDS =3D "gtk-doc zlib"
+DEPENDS =3D "glib-2.0-native gtk-doc zlib"
 DEPENDS_virtclass-native =3D "gettext-native gtk-doc-native \
                             pkgconfig-native"
=20
-PR =3D "r0"
+PR =3D "r1"
=20
 SRC_URI =3D "\
   http://ftp.gnome.org/pub/GNOME/sources/glib/2.24/glib-${PV}.tar.bz2;name=
=3Darchive \
--=20
1.7.1

--=-aoWXcwTf2MlnaYoH7cqW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyox9cACgkQPX1aK2wOHVjLAACdGADF7ytVvgqZUlRTR3ar2Br5
UBoAniCBtxErHkuIcXIq5svqEyOSHX96
=XWZE
-----END PGP SIGNATURE-----

--=-aoWXcwTf2MlnaYoH7cqW--
