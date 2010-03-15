Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrIue-0003qx-EI for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 23:37:35 +0100
Received: from f053034098.adsl.alicedsl.de ([78.53.34.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrIrk-000591-Ix for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 22:34:28 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 23:34:27 +0100
Message-ID: <1268692467.16974.49.camel@mattotaupa>
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
Subject: [PATCH 1/2] ffmpeg: Convert recipe to use INC_PR.
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
X-List-Received-Date: Mon, 15 Mar 2010 22:37:35 -0000
X-Groupsio-MsgNum: 17694
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-24HB7Bgf/QrzJlkRcdMt"

--=-24HB7Bgf/QrzJlkRcdMt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/ffmpeg/ffmpeg.inc           |    2 ++
 recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb |    2 +-
 recipes/ffmpeg/ffmpeg_0.5.bb        |    2 +-
 recipes/ffmpeg/ffmpeg_git.bb        |    2 +-
 recipes/ffmpeg/ffmpeg_svn.bb        |    2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
index cdb3f7e..3ec06bc 100644
--- a/recipes/ffmpeg/ffmpeg.inc
+++ b/recipes/ffmpeg/ffmpeg.inc
@@ -10,6 +10,8 @@ ARM_INSTRUCTION_SET =3D "arm"
 DEPENDS =3D "zlib libogg libvorbis libtheora faac faad2 ${@base_conditiona=
l('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
 RSUGGESTS =3D "mplayer"
=20
+INC_PR =3D "r9"
+
 inherit autotools pkgconfig
=20
 LEAD_SONAME =3D "libavcodec.so"
diff --git a/recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb b/recipes/ffmpeg/ffmpeg_0.=
4.9-pre1.bb
index 6e347b1..54991f5 100644
--- a/recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb
+++ b/recipes/ffmpeg/ffmpeg_0.4.9-pre1.bb
@@ -1,6 +1,6 @@
 require ffmpeg.inc
=20
-PR =3D "r9"
+PR =3D "${INC_PR}.0"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/ffmpeg/ffmpeg-${PV}.tar.gz \
            file://configure.patch;patch=3D0 \
diff --git a/recipes/ffmpeg/ffmpeg_0.5.bb b/recipes/ffmpeg/ffmpeg_0.5.bb
index b80fa88..e39e41e 100644
--- a/recipes/ffmpeg/ffmpeg_0.5.bb
+++ b/recipes/ffmpeg/ffmpeg_0.5.bb
@@ -3,7 +3,7 @@ require ffmpeg.inc
 DEPENDS +=3D "schroedinger libgsm"
=20
 PE =3D "1"
-PR =3D "r5"
+PR =3D "${INC_PR}.0"
=20
 DEFAULT_PREFERENCE =3D "1"
=20
diff --git a/recipes/ffmpeg/ffmpeg_git.bb b/recipes/ffmpeg/ffmpeg_git.bb
index 1cfc3e2..fc9bdf2 100644
--- a/recipes/ffmpeg/ffmpeg_git.bb
+++ b/recipes/ffmpeg/ffmpeg_git.bb
@@ -4,7 +4,7 @@ DEPENDS +=3D "schroedinger libgsm"
=20
 PE =3D "1"
 PV =3D "0.5.0+${PR}+gitr${SRCREV}"=20
-PR =3D "r0"
+PR =3D "${INC_PR}.0"
=20
 DEFAULT_PREFERENCE =3D "-1"
=20
diff --git a/recipes/ffmpeg/ffmpeg_svn.bb b/recipes/ffmpeg/ffmpeg_svn.bb
index ec30821..620783c 100644
--- a/recipes/ffmpeg/ffmpeg_svn.bb
+++ b/recipes/ffmpeg/ffmpeg_svn.bb
@@ -6,7 +6,7 @@ SRCREV =3D "22521"
=20
 PE =3D "1"
 PV =3D "0.5.0+${PR}+svnr${SRCPV}"
-PR =3D "r0"
+PR =3D "${INC_PR}.0"
=20
 DEFAULT_PREFERENCE =3D "-1"
 DEFAULT_PREFERENCE_angstrom =3D "1"
--=20
1.7.0

--=-24HB7Bgf/QrzJlkRcdMt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuetfMACgkQPX1aK2wOHVidxgCeMYttlhh/gQQHH6CUwQhpFeJL
7lgAmwYe0YJufmstE5Xo/IUyt4rCOZk+
=WQ1J
-----END PGP SIGNATURE-----

--=-24HB7Bgf/QrzJlkRcdMt--
