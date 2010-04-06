Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nz7k2-00016T-4a for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 14:18:51 +0200
Received: from g225080234.adsl.alicedsl.de ([92.225.80.234]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nz7gp-0006AK-5l for openembedded-devel@lists.openembedded.org;
	Tue, 06 Apr 2010 12:15:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 06 Apr 2010 14:15:27 +0200
Message-ID: <1270556127.6073.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xf86-input-evdev: Add evdev 2.4.0 [1].
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
X-List-Received-Date: Tue, 06 Apr 2010 12:18:51 -0000
X-Groupsio-MsgNum: 18433
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-49bEmzULgD8Pekbx42eO"

--=-49bEmzULgD8Pekbx42eO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[1] http://lists.freedesktop.org/archives/xorg/2010-April/049851.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I do not know if setting `PE` [1] is still needed and has to be carried on =
to be used. But all *evdev* recipes have it and probably cannot be reset.

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/0184=
29.html
---
 recipes/xorg-driver/xf86-input-evdev_2.4.0.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-driver/xf86-input-evdev_2.4.0.bb

diff --git a/recipes/xorg-driver/xf86-input-evdev_2.4.0.bb b/recipes/xorg-d=
river/xf86-input-evdev_2.4.0.bb
new file mode 100644
index 0000000..f71f00c
--- /dev/null
+++ b/recipes/xorg-driver/xf86-input-evdev_2.4.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+
+DESCRIPTION =3D "X.Org X server -- evdev input driver"
+PE =3D "1"
+SRC_URI[archive.md5sum] =3D "1dbf4d57d99682ba466c7855ed555f19"
+SRC_URI[archive.sha256sum] =3D "8ef48ab7140a70880fa1e6d43b249cdb3e31f1d3c2=
9ca6d39b459672ba16806a"
--=20
1.7.0.4

--=-49bEmzULgD8Pekbx42eO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku7JdkACgkQPX1aK2wOHVggpQCfVzQrxOkq9KVeCd3/4AhVkqUF
3sEAmwRoaR+VBt0DHyq3NJcMRUSazQh3
=Hvq/
-----END PGP SIGNATURE-----

--=-49bEmzULgD8Pekbx42eO--
