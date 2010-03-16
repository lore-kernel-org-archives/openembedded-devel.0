Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrZwj-0003rM-G1 for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 17:48:50 +0100
Received: from f053036046.adsl.alicedsl.de ([78.53.36.46]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NrZtn-000249-Qr for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 16:45:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 17:45:42 +0100
Message-ID: <1268757942.4111.25.camel@mattotaupa>
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
Subject: [PATCH] libvalhalla: Add recipe for libvalhalla 1.0.1.
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
X-List-Received-Date: Tue, 16 Mar 2010 16:48:51 -0000
X-Groupsio-MsgNum: 17743
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-nZV2oSPny6p6AiFx6f4l"

--=-nZV2oSPny6p6AiFx6f4l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. `--enable-pic` is needed, otherwise it does not work for non-x86 archite=
ctures, which is only detected with Binutils >=3D 2.20.
2. Build tested with GCC 4.4.2 and Binutils 2.20.1 and the following in `lo=
cal.conf`.

        DISTRO =3D "angstrom-2008.1"
       =20
        MACHINE =3D "beagleboard"
        BUILD_ARCH =3D "i686"
        BUILD_OS =3D "linux"

3. I tried to run this on the BeagleBoard and `libvalhalla-test` returns an=
 error code. I still have to verify if it is a build problem or some config=
uration problem.

        # libvalhalla-test -v=20
        [libvalhalla] [database.c:1089] Info: Database version : 1
        Default suffixes: flac,m4a,mp3,ogg,wav,wma
                          avi,mkv,mov,mpg,wmv
                          bmp,gif,jpeg,jpg,png,tga,tif,tiff
        Run: parser=3D2 loop=3D1 wait=3D0 priority=3D19 commit-int=3D128
        Grabbers available:
          ffmpeg
          local
          tmdb
          amazon
          lastfm
          lyricwiki
          tvdb
          tvrage
          imdb
          allocine
        Error code: -1
        root@beagleboard:~# libvalhalla-test -v -g local
        [libvalhalla] [database.c:1089] Info: Database version : 1
        Default suffixes: flac,m4a,mp3,ogg,wav,wma
                          avi,mkv,mov,mpg,wmv
                          bmp,gif,jpeg,jpg,png,tga,tif,tiff
        Run: parser=3D2 loop=3D1 wait=3D0 priority=3D19 commit-int=3D128
        Grabbers available:
          local
        Error code: -1

4. -doc, -dev, -static and =E2=80=9Cnormal=E2=80=9D packages are created au=
tomatically. Although I could not find the manual page of `libvalhalla-test=
` included.
5. Maybe a seperate package should be created for `libvalhalla-test`. It is=
 78K big.

        # ls -alh /usr/bin/libvalhalla-test
        -rwxr-xr-x 1 root root 78K Mar 16 13:48 /usr/bin/libvalhalla-test

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
Could someone else please test this and if the above mentioned issues can b=
e corrected later on, please check it in. If someone has a quick fix for th=
e above issues and can fix them that would also be awesome.

Thanks!
---
 recipes/libvalhalla/libvalhalla.inc      |   24 ++++++++++++++++++++++++
 recipes/libvalhalla/libvalhalla_1.0.1.bb |    5 +++++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libvalhalla/libvalhalla.inc
 create mode 100644 recipes/libvalhalla/libvalhalla_1.0.1.bb

diff --git a/recipes/libvalhalla/libvalhalla.inc b/recipes/libvalhalla/libv=
alhalla.inc
new file mode 100644
index 0000000..2ff1e4c
--- /dev/null
+++ b/recipes/libvalhalla/libvalhalla.inc
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "libvalhalla is a library written in C. It is a media scan=
ner, that stores various information in an SQLite database and relies on FF=
mpeg (libavformat and libavutil) and libcurl. It features many Internet gra=
bbers that allows automatic download of covers, lyrics, informations on med=
ia files, tags retrival in video and music files and so on."
+HOMEPAGE =3D "http://libvalhalla.geexbox.org/"
+LICENSE =3D "LGPLv2.1"
+DEPENDS =3D "ffmpeg"
+
+INC_PR =3D "r0"
+
+SRC_URI =3D "http://libvalhalla.geexbox.org/releases/${P}.tar.bz2;name=3Dl=
ibvalhalla"
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
+		--enable-pic
+}
diff --git a/recipes/libvalhalla/libvalhalla_1.0.1.bb b/recipes/libvalhalla=
/libvalhalla_1.0.1.bb
new file mode 100644
index 0000000..cbb1330
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

--=-nZV2oSPny6p6AiFx6f4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuftbAACgkQPX1aK2wOHVhUlwCeNVBvyXkMuWPESDDCuUZyPldO
4NAAn2+BmJTVbSAMZGGKwgIei4R/BmJg
=Jea/
-----END PGP SIGNATURE-----

--=-nZV2oSPny6p6AiFx6f4l--
