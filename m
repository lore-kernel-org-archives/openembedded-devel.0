Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsdOY-0007be-JX for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 15:42:05 +0100
Received: from g229060216.adsl.alicedsl.de ([92.229.60.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsdLb-00074l-Br for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:38:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 15:38:46 +0100
Message-ID: <1269009526.6119.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libnfo: Add libnfo hg.
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
X-List-Received-Date: Fri, 19 Mar 2010 14:42:05 -0000
X-Groupsio-MsgNum: 17868
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pstLyBaBgO8OCjLUJbQh"

--=-pstLyBaBgO8OCjLUJbQh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. `--enable-pic` is needed for non-x86 architectures.
2. Put test programs in separate package `${PN}-bin`. Manual pages are in `=
${PN}-doc` though.
3. Build tested with GCC 4.4.3 and Binutils 2.20.1 for `MACHINE =3D "beagle=
board"`.
4. I did not use release 1.0.0 since `configure` in that version does not h=
ave the option `--enable-pic`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
I am not sure about setting the program version, since I do not know if the=
 next release is 1.0.1 or 1.1.0. Could this please be fixed when this is co=
mmitted.
---
 recipes/libnfo/libnfo.inc   |   26 ++++++++++++++++++++++++++
 recipes/libnfo/libnfo_hg.bb |    9 +++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libnfo/libnfo.inc
 create mode 100644 recipes/libnfo/libnfo_hg.bb

diff --git a/recipes/libnfo/libnfo.inc b/recipes/libnfo/libnfo.inc
new file mode 100644
index 0000000..6a1ff58
--- /dev/null
+++ b/recipes/libnfo/libnfo.inc
@@ -0,0 +1,26 @@
+DESCRIPTION =3D "GeeXboX libNFO is a small library aiming at parsing and w=
riting NFO files."
+HOMEPAGE =3D "http://libnfo.geexbox.org/"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "LGPLv2+"
+DEPENDS =3D "libxml2"
+
+INC_PR =3D "r0"
+
+SRC_URI =3D "http://libplayer.geexbox.org/releases/${PN}.tar.bz2;name=3D${=
PN}"
+
+inherit autotools pkgconfig
+
+# the configure script is hand-crafted, it rejects some of the usual
+# configure arguments
+do_configure() {
+	${S}/configure \
+			--prefix=3D${prefix} \
+		--disable-strip \
+		--cross-compile \
+		--enable-pic \
+		--enable-doc
+}
+
+PACKAGES =3D+ "${PN}-bin"
+
+FILES_${PN}-bin =3D "${bindir}/*"
diff --git a/recipes/libnfo/libnfo_hg.bb b/recipes/libnfo/libnfo_hg.bb
new file mode 100644
index 0000000..86c301e
--- /dev/null
+++ b/recipes/libnfo/libnfo_hg.bb
@@ -0,0 +1,9 @@
+require libnfo.inc
+PV =3D "1.0.0+1.1.0"
+PR =3D "${INC_PR}.0"
+
+SRCREV =3D "8f6237741f72"
+
+SRC_URI =3D "hg://hg.geexbox.org;module=3D${PN};rev=3D${SRCREV}"
+
+S =3D "${WORKDIR}/${PN}"
--=20
1.7.0

--=-pstLyBaBgO8OCjLUJbQh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkujjGkACgkQPX1aK2wOHVgiDwCdHB67of6pKvBWDWI3PUtq0Ojd
9ksAl0ezVz3Vgkbo4GXDRH9yu8Uf7+E=
=y2kG
-----END PGP SIGNATURE-----

--=-pstLyBaBgO8OCjLUJbQh--
