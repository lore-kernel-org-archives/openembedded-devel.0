Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3UiI-0005jM-54 for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 16:11:23 +0200
Received: from f053037105.adsl.alicedsl.de ([78.53.37.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P3Ui0-00069s-Az for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 14:11:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 06 Oct 2010 16:11:02 +0200
Message-ID: <1286374262.3792.8.camel@mattotaupa>
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
Subject: [PATCH] msmcommd_git: Add `libfsotransport` to `DEPENDS`.
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
X-List-Received-Date: Wed, 06 Oct 2010 14:11:23 -0000
X-Groupsio-MsgNum: 24431
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-K5R6jiEOPUv6BkKI2/nJ"

--=-K5R6jiEOPUv6BkKI2/nJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Wed, 6 Oct 2010 13:00:42 +0200

[=E2=80=A6]
| checking for DEPS... configure: error: Package requirements (glib-2.0 >=
=3D 2.120
|   gio-2.0 >=3D 2.12.0
|   gobject-2.0 >=3D 2.12.0
|   gthread-2.0 >=3D 2.12.0
|   gee-1.0 >=3D 0.5
|   dbus-1 >=3D 1.2.16
|   dbus-glib-1 >=3D 0.84
|   fsotransport-2.0 >=3D 0.9
|   fso-glib-1.0 >=3D 2010.07.28.1
|   msmcomm-1.0 >=3D 0.5.0
|   msmcommd-specs-1.0 >=3D 0.1.0) were not met:
|
| No package 'fsotransport-2.0' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables DEPS_CFLAGS
| and DEPS_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
| ERROR: Function do_configure failed
[=E2=80=A6]

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/freesmartphone/msmcommd_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/freesmartphone/msmcommd_git.bb b/recipes/freesmartphon=
e/msmcommd_git.bb
index e8f3887..6d1afaa 100644
--- a/recipes/freesmartphone/msmcommd_git.bb
+++ b/recipes/freesmartphone/msmcommd_git.bb
@@ -1,6 +1,6 @@
 require msmcomm.inc
=20
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
 PV =3D "0.5.0+gitr${SRCPV}"
=20
 DEPENDS =3D " \
@@ -9,6 +9,7 @@ DEPENDS =3D " \
  dbus \
  dbus-glib \
  libfso-glib \
+ libfsotransport \
  libgee \
  libmsmcomm \
  msmcommd-specs \
--=20
1.7.1

--=-K5R6jiEOPUv6BkKI2/nJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkysg3YACgkQPX1aK2wOHVjloQCfTZRAm/5JQCmpO0VGHXsO/oYs
wI0AnizbzXM1pOEHCXmrCmQ+Dn6iHHWL
=mWOi
-----END PGP SIGNATURE-----

--=-K5R6jiEOPUv6BkKI2/nJ--
