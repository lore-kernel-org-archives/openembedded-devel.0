Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pec9i-0007DB-3s for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 00:37:06 +0100
Received: from f053033090.adsl.alicedsl.de ([78.53.33.90]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pec99-0007Qr-Hv for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 23:36:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295220721.13967.13.camel@mattotaupa>
References: <1295220721.13967.13.camel@mattotaupa>
Date: Mon, 17 Jan 2011 00:36:30 +0100
Message-ID: <1295220990.13967.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH 2/3] libomxil-bellagio: create and use recipe include file (INC file)
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
X-List-Received-Date: Sun, 16 Jan 2011 23:37:06 -0000
X-Groupsio-MsgNum: 28083
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rxdKGS9HTb9JQFB27j4r"

--=-rxdKGS9HTb9JQFB27j4r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sun, 16 Jan 2011 23:42:50 +0100

Create a recipe include file. The only difference now is, that the followin=
g version also include `PARALLEL_MAKE =3D ""`.

=E2=80=A2 0.9.0
=E2=80=A2 0.9.1

[1] http://wiki.openembedded.org/index.php/Styleguide#PR_variables_with_rec=
ipes_that_use_INC_files

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/openmax/libomxil-bellagio.inc        |   16 ++++++++++++++++
 recipes/openmax/libomxil-bellagio_0.9.0.bb   |   14 ++------------
 recipes/openmax/libomxil-bellagio_0.9.1.bb   |   14 ++------------
 recipes/openmax/libomxil-bellagio_0.9.2.1.bb |   17 +++--------------
 recipes/openmax/libomxil-bellagio_0.9.2.bb   |   16 ++--------------
 5 files changed, 25 insertions(+), 52 deletions(-)
 create mode 100644 recipes/openmax/libomxil-bellagio.inc

diff --git a/recipes/openmax/libomxil-bellagio.inc b/recipes/openmax/libomx=
il-bellagio.inc
new file mode 100644
index 0000000..8c3a82c
--- /dev/null
+++ b/recipes/openmax/libomxil-bellagio.inc
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "OpenMAX Integration Layer (IL) is a standard API to acces=
s Multimedia Components on mobile platforms. It has been defined by the Khr=
onos group."
+LICENSE =3D "LGPLv2"
+DEPENDS =3D "alsa-lib ffmpeg \
+           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
+
+INC_PR =3D "r7"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
+
+inherit autotools
+
+FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
+FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
+FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
+
+PARALLEL_MAKE =3D ""
diff --git a/recipes/openmax/libomxil-bellagio_0.9.0.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.0.bb
index aa78d6f..70a0583 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.0.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.0.bb
@@ -1,16 +1,6 @@
-DESCRIPTION =3D "OpenMAX Integration Layer (IL) is a standard API to acces=
s Multimedia Components on mobile platforms. It has been defined by the Khr=
onos group."
-LICENSE =3D "LGPLv2"
-DEPENDS =3D "alsa-lib ffmpeg \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
+require ${PN}.inc
=20
-PR =3D "r7"
+PR =3D "${INC_PR}.0"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] =3D "6d6b6a75bc8751a7421b5e739c53ef6e"
 SRC_URI[sha256sum] =3D "07128710a699b453dcd7b92e33f2aa8dcbbfe0a657d3304080=
3cdaf0997e442c"
-
-inherit autotools
-
-FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
-FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
-FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.1.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.1.bb
index 958ac26..e738a9d 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.1.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.1.bb
@@ -1,16 +1,6 @@
-DESCRIPTION =3D "OpenMAX Integration Layer (IL) is a standard API to acces=
s Multimedia Components on mobile platforms. It has been defined by the Khr=
onos group."
-LICENSE =3D "LGPLv2"
-DEPENDS =3D "alsa-lib ffmpeg \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
+require ${PN}.inc
=20
-PR =3D "r1"
+PR =3D "${INC_PR}.0"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] =3D "757371e21e4f3653ce4d12d3ba0be1e0"
 SRC_URI[sha256sum] =3D "9a0864cd442c43e5b69072dc0617b56252bc933fce26f6bfd6=
d47909287a353a"
-
-inherit autotools
-
-FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
-FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
-FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.1.bb b/recipes/openmax=
/libomxil-bellagio_0.9.2.1.bb
index 7f74b6f..f21c731 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.2.1.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.2.1.bb
@@ -1,17 +1,6 @@
-DESCRIPTION =3D "OpenMAX Integration Layer (IL) is a standard API to acces=
s Multimedia Components on mobile platforms. It has been defined by the Khr=
onos group."
-LICENSE =3D "LGPLv2"
-DEPENDS =3D "alsa-lib ffmpeg \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
+require ${PN}.inc
+
+PR =3D "${INC_PR}.0"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] =3D "323049db668ab260870fd7ecd2ec4156"
 SRC_URI[sha256sum] =3D "75cf8d3b5cac2764420ae2cc7846b9bb12a47d2ca04c96e582=
1309b0124ddc72"
-
-inherit autotools
-
-FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
-FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
-FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
-
-PARALLEL_MAKE =3D ""
-
diff --git a/recipes/openmax/libomxil-bellagio_0.9.2.bb b/recipes/openmax/l=
ibomxil-bellagio_0.9.2.bb
index ff30c10..98876ea 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.2.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.2.bb
@@ -1,18 +1,6 @@
-DESCRIPTION =3D "OpenMAX Integration Layer (IL) is a standard API to acces=
s Multimedia Components on mobile platforms. It has been defined by the Khr=
onos group."
-LICENSE =3D "LGPLv2"
-DEPENDS =3D "alsa-lib ffmpeg \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}=
"
+require ${PN}.inc
=20
-PR =3D "r1"
+PR =3D "${INC_PR}.0"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/omxil/${PN}-${PV}.tar.gz"
 SRC_URI[md5sum] =3D "42ab7383c4ca4093000ec7062289112b"
 SRC_URI[sha256sum] =3D "dc5d3cf256390d5419ea7dc3fc35761999a1da99fa4b645ac3=
e92a6a279c38fc"
-
-inherit autotools
-
-FILES_${PN} +=3D "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
-FILES_${PN}-dev +=3D "${libdir}/bellagio/*.a"
-FILES_${PN}-dbg +=3D "${libdir}/bellagio/.debug"
-
-PARALLEL_MAKE =3D ""
--=20
1.7.2.3

--=-rxdKGS9HTb9JQFB27j4r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0zgP4ACgkQPX1aK2wOHVhePACeNazWnv/kyPKVG/MrE3taS47N
2pwAn2ysE0XCM61szSCG5Gcc9lJ42pNY
=MCYF
-----END PGP SIGNATURE-----

--=-rxdKGS9HTb9JQFB27j4r--
