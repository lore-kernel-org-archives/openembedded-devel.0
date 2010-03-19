Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nse9J-0001Hy-Uw for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 16:30:14 +0100
Received: from g229060216.adsl.alicedsl.de ([92.229.60.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nse6M-0001ap-TD for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 15:27:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268784521.3893.15.camel@mattotaupa>
References: <1268757942.4111.25.camel@mattotaupa>
	<1268784521.3893.15.camel@mattotaupa>
Date: Fri, 19 Mar 2010 16:27:05 +0100
Message-ID: <1269012425.6119.5.camel@mattotaupa>
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
Subject: [PATCH v2] libvalhalla: Add recipe for libvalhalla 1.0.1.
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
X-List-Received-Date: Fri, 19 Mar 2010 15:30:14 -0000
X-Groupsio-MsgNum: 17871
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Lukijy+1Z+Ydr6hmXw1s"

--=-Lukijy+1Z+Ydr6hmXw1s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. `--enable-pic` is needed for non-x86 architectures.
2. Put test programs in separate package `${PN}-bin`. Manual pages are in `=
${PN}-doc` though.
3. Build tested with GCC 4.4.3 and Binutils 2.20.1 for `MACHINE =3D "beagle=
board"`.
4. Depend on `libnfo` since it is recommended on upstream=E2=80=99s Web sit=
e.

`do_configure()` is based on the recipe of `ushare`.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/libvalhalla/libvalhalla.inc      |   30 ++++++++++++++++++++++++++=
++++
 recipes/libvalhalla/libvalhalla_1.0.1.bb |    5 +++++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libvalhalla/libvalhalla.inc
 create mode 100644 recipes/libvalhalla/libvalhalla_1.0.1.bb

diff --git a/recipes/libvalhalla/libvalhalla.inc b/recipes/libvalhalla/libv=
alhalla.inc
new file mode 100644
index 0000000..03b7cfd
--- /dev/null
+++ b/recipes/libvalhalla/libvalhalla.inc
@@ -0,0 +1,30 @@
+DESCRIPTION =3D "libvalhalla is a library written in C. It is a media scan=
ner, that stores various information in an SQLite database and relies on FF=
mpeg (libavformat and libavutil) and libcurl. It features many Internet gra=
bbers that allows automatic download of covers, lyrics, informations on med=
ia files, tags retrival in video and music files and so on."
+HOMEPAGE =3D "http://libvalhalla.geexbox.org/"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "LGPLv2.1"
+DEPENDS =3D "sqlite3 curl ffmpeg libnfo"
+
+INC_PR =3D "r0"
+
+SRC_URI =3D "http://libvalhalla.geexbox.org/releases/${P}.tar.bz2;name=3D$=
{PN}"
+
+inherit autotools pkgconfig
+
+# the configure script is hand-crafted, it rejects some of the usual
+# configure arguments
+do_configure() {
+	${S}/configure \
+			--prefix=3D${prefix} \
+			--disable-strip \
+		--with-lavf-inc=3D${STAGING_INCDIR} \
+		--with-lavf-lib=3D${STAGING_LIBDIR} \
+		--with-lavc-inc=3D${STAGING_INCDIR} \
+		--with-lavc-lib=3D${STAGING_LIBDIR} \
+		--cross-compile \
+		--enable-pic \
+                --enable-doc
+}
+
+PACKAGES =3D+ "${PN}-bin"
+
+FILES_${PN}-bin =3D "${bindir}/*"
diff --git a/recipes/libvalhalla/libvalhalla_1.0.1.bb b/recipes/libvalhalla=
/libvalhalla_1.0.1.bb
new file mode 100644
index 0000000..9fe1f5e
--- /dev/null
+++ b/recipes/libvalhalla/libvalhalla_1.0.1.bb
@@ -0,0 +1,5 @@
+require libvalhalla.inc
+PR =3D "${INC_PR}.0"
+
+SRC_URI[libvalhalla.md5sum] =3D "75d4a3383887c4c341eeba9ebe60d626"
+SRC_URI[libvalhalla.sha256sum] =3D "df78015e118c784e3ff3e8562bc96d287ac119=
97d3b9e45e2d8b67568b0600d3"
--=20
1.7.0

--=-Lukijy+1Z+Ydr6hmXw1s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkujl8kACgkQPX1aK2wOHVhGLwCeKcYoFJoaLF27EyULrHApXDRv
2gkAmN0ULLi4iFKdvVWg0H/acEUNEJw=
=T8mD
-----END PGP SIGNATURE-----

--=-Lukijy+1Z+Ydr6hmXw1s--
