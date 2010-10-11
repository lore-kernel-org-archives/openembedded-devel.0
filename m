Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5ReQ-0003Vo-1G for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 01:19:28 +0200
Received: from f053041204.adsl.alicedsl.de ([78.53.41.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5Re2-0001vK-6s for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 23:19:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 01:19:00 +0200
Message-ID: <1286839141.3900.50.camel@mattotaupa>
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
Subject: [PATCH 3/4] gedit: add `enchant` to `DEPENDS`
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
X-List-Received-Date: Mon, 11 Oct 2010 23:19:28 -0000
X-Groupsio-MsgNum: 24709
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qjyyUSiHG8dDm1vvM8DG"

--=-qjyyUSiHG8dDm1vvM8DG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Andreas Mueller <schnitzeltony@gmx.de>
Date: Mon, 11 Oct 2010 22:01:58 +0200

	checking for ENCHANT... no
	configure: error: Enchant library not found or too old. Use --disable-spel=
l to build without spell plugin.
	ERROR: Function do_configure failed

I build tested this with `minimal-eglibc` for `MACHINE =3D "beagleboard"` a=
nd it fixes task `do_configure`.

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gnome/gedit_2.30.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0.bb
index e426d18..c00a05f 100644
--- a/recipes/gnome/gedit_2.30.0.bb
+++ b/recipes/gnome/gedit_2.30.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "GNOME editor"
 SECTION =3D "x11/gnome"
 LICENSE =3D "GPLv2"
=20
-DEPENDS =3D "gconf gnome-common glib-2.0 gtk+ gtksourceview2 iso-codes"
+DEPENDS =3D "enchant gconf gnome-common glib-2.0 gtk+ gtksourceview2 iso-c=
odes"
 RDEPENDS_${PN} +=3D " gtksourceview2"
 PR =3D "r2"
=20
--=20
1.7.1


--=-qjyyUSiHG8dDm1vvM8DG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyzm2QACgkQPX1aK2wOHVimDwCeOwHYIW98meQW+jLvfwo9zInR
b0oAn306XyS9pNdNwm8wqkk57QMBm4oW
=BUnj
-----END PGP SIGNATURE-----

--=-qjyyUSiHG8dDm1vvM8DG--
