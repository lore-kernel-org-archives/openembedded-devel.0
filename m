Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P8JWa-0007tG-JL for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 23:15:14 +0200
Received: from g225141089.adsl.alicedsl.de ([92.225.141.89]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P8JW3-0000DD-L7 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:14:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CBDE483.3030002@opendreambox.org>
References: <1287506184-13086-1-git-send-email-obi@opendreambox.org>
	<1287507624-29362-1-git-send-email-obi@opendreambox.org>
	<AANLkTikVU2M3gEC_Zd4PTPys_Er4x+uU0txYw5BftQVJ@mail.gmail.com>
	<4CBDE483.3030002@opendreambox.org>
Date: Tue, 19 Oct 2010 23:14:37 +0200
Message-ID: <1287522877.24515.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gedit_2.30.0: Set `LICENSE` to GPLv2+ for real.
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
X-List-Received-Date: Tue, 19 Oct 2010 21:15:17 -0000
X-Groupsio-MsgNum: 25160
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LtdaTiS9+l00t4XYcbRY"

--=-LtdaTiS9+l00t4XYcbRY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Tue, 19 Oct 2010 23:07:12 +0200

Set

In commit 860f29 [1] `LICENSE` was just set to `GPLv2` instead of `GPLv2+` =
in contrary to the commit message and the intention.

Thanks for Andreas Oberritter to spotting this [2].

[1] http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=3Dmaster&i=
d=3D860f2947b54a29becb4686261026c205bf3b9358
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/02=
5823.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gnome/gedit_2.30.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0.bb
index 1d0ce78..1a01303 100644
--- a/recipes/gnome/gedit_2.30.0.bb
+++ b/recipes/gnome/gedit_2.30.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "GNOME editor"
 SECTION =3D "x11/gnome"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPLv2+"
=20
 DEPENDS =3D "enchant gconf gnome-common gnome-doc-utils-native glib-2.0 gt=
k+ gtksourceview2 iso-codes"
 RDEPENDS_${PN} +=3D " gtksourceview2"
--=20
1.7.2.3


--=-LtdaTiS9+l00t4XYcbRY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky+CjcACgkQPX1aK2wOHVh/5wCfQOTr1crigNMvdhxKqnuEpfYY
X8MAoIXzk1HNlEiIdeIEumrpTH4xGq1X
=H+2d
-----END PGP SIGNATURE-----

--=-LtdaTiS9+l00t4XYcbRY--
