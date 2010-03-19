Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsdRo-0001Gk-Qo for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 15:45:18 +0100
Received: from g229060216.adsl.alicedsl.de ([92.229.60.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NsdOr-0004DP-Ke for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 14:42:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 15:42:08 +0100
Message-ID: <1269009728.6119.2.camel@mattotaupa>
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
Subject: [PATCH] libplayer: Add libplayer hg.
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
X-List-Received-Date: Fri, 19 Mar 2010 14:45:18 -0000
X-Groupsio-MsgNum: 17869
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+KrHvrOfB9H6ZoDJUXP8"

--=-+KrHvrOfB9H6ZoDJUXP8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. `--enable-pic` is needed for non-x86 architectures.
2. Put test programs in separate package `${PN}-bin`. Manual pages are in `=
${PN}-doc` though.
3. Build tested with GCC 4.4.3 and Binutils 2.20.1 for `MACHINE =3D "beagle=
board"`.
4. Depend on `mplayer` and `gstreamer`. Dependencies for vlc- or xine-wrapp=
ers can be added if needed.
5. I did not use release 1.0.0 since `configure` in that version does not h=
ave the option `--enable-pic`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/libplayer/libplayer.inc   |   26 ++++++++++++++++++++++++++
 recipes/libplayer/libplayer_hg.bb |    9 +++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libplayer/libplayer.inc
 create mode 100644 recipes/libplayer/libplayer_hg.bb

diff --git a/recipes/libplayer/libplayer.inc b/recipes/libplayer/libplayer.=
inc
new file mode 100644
index 0000000..a986a21
--- /dev/null
+++ b/recipes/libplayer/libplayer.inc
@@ -0,0 +1,26 @@
+DESCRIPTION =3D "libplayer is a multimedia A/V abstraction layer API. Its =
goal is to interact with Enna Media Center."
+HOMEPAGE =3D "http://libplayer.geexbox.org/"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "LGPLv2.1+"
+DEPENDS =3D "mplayer gstreamer"
+
+INC_PR =3D "r0"
+
+SRC_URI =3D "http://libplayer.geexbox.org/releases/${P}.tar.bz2;name=3D${P=
N}"
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
diff --git a/recipes/libplayer/libplayer_hg.bb b/recipes/libplayer/libplaye=
r_hg.bb
new file mode 100644
index 0000000..a8ce5dc
--- /dev/null
+++ b/recipes/libplayer/libplayer_hg.bb
@@ -0,0 +1,9 @@
+require libplayer.inc
+PV =3D "1.0.0+1.1.0"
+PR =3D "${INC_PR}.0"
+
+SRCREV =3D "a628f49d952a"
+
+SRC_URI =3D "hg://hg.geexbox.org;module=3D${PN};rev=3D${SRCREV}"
+
+S =3D "${WORKDIR}/${PN}"
--=20
1.7.0

--=-+KrHvrOfB9H6ZoDJUXP8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkujjUAACgkQPX1aK2wOHVh0tgCdFn7NJnEs3ITZtdOtOZNP1t4t
4OsAn1efooHvgwlq5RB+Rt7q/CXpGkiu
=Dm9N
-----END PGP SIGNATURE-----

--=-+KrHvrOfB9H6ZoDJUXP8--
