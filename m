Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ6pm-0003Qy-4b for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 19:05:17 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ6nY-0005Kk-N3 for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 18:02:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 19:02:55 +0100
Message-ID: <1264356175.3663.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH v2] vdr: Put common information in separate file and require it in the recipe.
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
X-List-Received-Date: Sun, 24 Jan 2010 18:05:17 -0000
X-Groupsio-MsgNum: 16177
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qpKtBpRLfGuLcZElzqq9"

--=-qpKtBpRLfGuLcZElzqq9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=80=A2 Some information in a recipe apply to all versions of a program. =
Factor them out into an extra file and include/require this in each recipe =
as seen in a lot of other programs/packages/recipes in OE.

=E2=80=A2 VDR=E2=80=99s plugins often change and therefore put patches to t=
hem in version dependent folder.

This hopefully lessens the effort to add new versions.

v2: Run `git format-patch -M -C -C` to create patch.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../vdr/{files =3D> vdr-1.7.10}/linkerflags.patch    |    0
 recipes/vdr/vdr.inc                                |    8 ++++++++
 recipes/vdr/vdr_1.7.10.bb                          |   13 +++----------
 3 files changed, 11 insertions(+), 10 deletions(-)
 rename recipes/vdr/{files =3D> vdr-1.7.10}/linkerflags.patch (100%)
 create mode 100644 recipes/vdr/vdr.inc

diff --git a/recipes/vdr/files/linkerflags.patch b/recipes/vdr/vdr-1.7.10/l=
inkerflags.patch
similarity index 100%
rename from recipes/vdr/files/linkerflags.patch
rename to recipes/vdr/vdr-1.7.10/linkerflags.patch
diff --git a/recipes/vdr/vdr.inc b/recipes/vdr/vdr.inc
new file mode 100644
index 0000000..2e8cf40
--- /dev/null
+++ b/recipes/vdr/vdr.inc
@@ -0,0 +1,8 @@
+DESCRIPTION =3D "Video Disk Recorder (VDR) is a digital sat-receiver progr=
am using Linux and DVB technologies. It allows one to record MPEG2 streams,=
 as well as output the stream to TV. It is also possible to watch DVDs (har=
dware accelerated) with some comfort and use an IR remote control."
+AUTHOR =3D "Klaus Schmidinger"
+LICENSE =3D "GPLv2"
+HOMEPAGE =3D "http://www.tvdr.de"
+
+DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libintl"
+
+SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2"
diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.10.bb
index a8fa82c..69ca012 100644
--- a/recipes/vdr/vdr_1.7.10.bb
+++ b/recipes/vdr/vdr_1.7.10.bb
@@ -1,13 +1,7 @@
-DESCRIPTION =3D "Video Disk Recorder (VDR) is a digital sat-receiver progr=
am using Linux and DVB technologies. It allows one to record MPEG2 streams,=
 as well as output the stream to TV. It is also possible to watch DVDs (har=
dware accelerated) with some comfort and use an IR remote control."
-AUTHOR =3D "Klaus Schmidinger"
-LICENSE =3D "GPLv2"
-HOMEPAGE =3D "http://www.tvdr.de"
+require vdr.inc
 PR =3D "r2"
=20
-DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libintl"
-
-SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2 \
-           file://fixpaths.patch;patch=3D1 \
+SRC_URI +=3D " file://fixpaths.patch;patch=3D1 \
            file://cplusplus.patch;patch=3D1 \
            file://disable_plugin.patch;patch=3D1 \
            file://linkerflags.patch;patch=3D1 \
@@ -27,7 +21,7 @@ do_install () {
                  'VIDEODIR=3D/var/lib/vdr/video' \
                  'PLUGINLIBDIR=3D${PLUGINDIR}' \
                  'LOCDIR=3D${datadir}/locale' \
-                 install=20
+                 install
 }
=20
 PACKAGES_DYNAMIC +=3D "vdr-plugin-*"
@@ -39,4 +33,3 @@ python populate_packages_prepend () {
=20
 FILES_${PN} =3D "${bindir}/* /var/lib/vdr/conf/* ${sysconfdir}/*"
 FILES_${PN}-dbg +=3D "${PLUGINDIR}/.debug/*"
-
--=20
1.6.6


--=-qpKtBpRLfGuLcZElzqq9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktci0gACgkQPX1aK2wOHVhVZQCgjKpn9bmg3YQz1jOjzfgIVeSl
owIAn0DbJyAHoW5phdN+3enPRx5IiqG2
=nAPV
-----END PGP SIGNATURE-----

--=-qpKtBpRLfGuLcZElzqq9--
