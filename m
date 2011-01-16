Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pec5N-00075n-20 for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 00:32:37 +0100
Received: from f053033090.adsl.alicedsl.de ([78.53.33.90]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pec4o-0007QM-8W for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 23:32:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 00:32:01 +0100
Message-ID: <1295220721.13967.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH 1/3] libomxil-bellagio: cosmetics: unify recipes
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
X-List-Received-Date: Sun, 16 Jan 2011 23:32:37 -0000
X-Groupsio-MsgNum: 28082
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-eAz/OTpNKZyuTunFBt5j"

--=-eAz/OTpNKZyuTunFBt5j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 16 Jan 2011 23:34:08 +0100

Just reorder the lines to be consistent throughout all recipes and to adher=
e to the style guide [1].

[1] http://wiki.openembedded.org/index.php/Styleguide

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/openmax/libomxil-bellagio_0.9.0.bb |    6 ++----
 recipes/openmax/libomxil-bellagio_0.9.1.bb |   10 ++++------
 recipes/openmax/libomxil-bellagio_0.9.2.bb |   10 ++++------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/recipes/openmax/libomxil-bellagio_0.9.0.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.0.bb
index 3be6dde..aa78d6f 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.0.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.0.bb
@@ -6,13 +6,11 @@ DEPENDS =3D "alsa-lib ffmpeg \
 PR =3D "r7"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "6d6b6a75bc8751a7421b5e739c53ef6e"
+SRC_URI[sha256sum] =3D "07128710a699b453dcd7b92e33f2aa8dcbbfe0a657d3304080=
3cdaf0997e442c"
=20
 inherit autotools
=20
 FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
 FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
 FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
-
-
-SRC_URI[md5sum] =3D "6d6b6a75bc8751a7421b5e739c53ef6e"
-SRC_URI[sha256sum] =3D "07128710a699b453dcd7b92e33f2aa8dcbbfe0a657d3304080=
3cdaf0997e442c"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.1.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.1.bb
index 942f963..958ac26 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.1.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.1.bb
@@ -3,16 +3,14 @@ LICENSE =3D "LGPLv2"
 DEPENDS =3D "alsa-lib ffmpeg \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
-
 PR =3D "r1"
=20
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "757371e21e4f3653ce4d12d3ba0be1e0"
+SRC_URI[sha256sum] =3D "9a0864cd442c43e5b69072dc0617b56252bc933fce26f6bfd6=
d47909287a353a"
+
 inherit autotools
=20
 FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
 FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
 FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
-
-
-SRC_URI[md5sum] =3D "757371e21e4f3653ce4d12d3ba0be1e0"
-SRC_URI[sha256sum] =3D "9a0864cd442c43e5b69072dc0617b56252bc933fce26f6bfd6=
d47909287a353a"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.2.bb
index a58b296..ff30c10 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.2.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.2.bb
@@ -3,10 +3,12 @@ LICENSE =3D "LGPLv2"
 DEPENDS =3D "alsa-lib ffmpeg \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
-
 PR =3D "r1"
=20
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] =3D "42ab7383c4ca4093000ec7062289112b"
+SRC_URI[sha256sum] =3D "dc5d3cf256390d5419ea7dc3fc35761999a1da99fa4b645ac3=
e92a6a279c38fc"
+
 inherit autotools
=20
 FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
@@ -14,7 +16,3 @@ FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
 FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
=20
 PARALLEL_MAKE =3D ""
-
-
-SRC_URI[md5sum] =3D "42ab7383c4ca4093000ec7062289112b"
-SRC_URI[sha256sum] =3D "dc5d3cf256390d5419ea7dc3fc35761999a1da99fa4b645ac3=
e92a6a279c38fc"
--=20
1.7.2.3

--=-eAz/OTpNKZyuTunFBt5j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0zf/EACgkQPX1aK2wOHVivewCeJszRJ0hyF/nbptsslQi0ZO5u
ypgAn0XJmUoBz5yVW/ZBdgxjmMiqkPqQ
=OReB
-----END PGP SIGNATURE-----

--=-eAz/OTpNKZyuTunFBt5j--
