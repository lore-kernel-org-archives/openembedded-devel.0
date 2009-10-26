Received: from [82.192.226.27] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1N2W9g-0002Qe-7U
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 21:27:07 +0100
Received: from lilith.localnet ([::ffff:192.168.2.131])
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by koffein with esmtp; Mon, 26 Oct 2009 19:58:44 +0100
	id 0000000000013E09.000000004AE5F164.00005DCD
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2009 21:25:48 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.30-1-686; KDE/4.3.2; i686; ; )
Mime-Version: 1.0
Message-Id: <200910262125.58992.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 82.192.226.27
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] MokoTouch
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
X-List-Received-Date: Mon, 26 Oct 2009 20:27:07 -0000
X-Groupsio-MsgNum: 13653
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="=_koffein-24015-1256583525-0001-2"

--=_koffein-24015-1256583525-0001-2
Content-Type: multipart/mixed;
  boundary="Boundary-01=_NXg5KOXGjwBSq3M"
Content-Transfer-Encoding: 7bit

--Boundary-01=_NXg5KOXGjwBSq3M
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi folks
I'd like to have mokotouch-recipes added to OE.

greatings
	leviathan
=2D-=20
David Lanzend=F6rfer
OpenSourceSupport GmbH
Junior system engineer and supporter

--Boundary-01=_NXg5KOXGjwBSq3M
Content-Type: text/x-patch;
  charset="UTF-8";
  name="add-mokotouch.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="add-mokotouch.patch"

commit ca215a1df93741a136a482c9f0af5bdad06bbd7a
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Mon Oct 26 19:36:17 2009 +0100

    Added mokotouch recipes

diff --git a/recipes/mokotouch/mokotouch-apps-customtableview_2.bb b/recipe=
s/mokotouch/mokotouch-apps-customtableview_2.bb
new file mode 100644
index 0000000..e380af7
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-customtableview_2.bb
@@ -0,0 +1,41 @@
+require mokotouch.inc
+
+DEPENDS +=3D "mokotouch-coreservices-mokotouch"
+RDEPENDS +=3D "mokotouch-coreservices-mokotouch"
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/Apps/CustomTableView
+${OE_QMAKE_QMAKE} CustomTableView.pro
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/Apps
+mkdir ${D}/usr/local/MokoTouch/Apps/CustomTableView.app
+cp "${S}/MokoTouch/Apps/CustomTableView/BUILD/App/libCustomTableView.so.1.=
0.0" "${D}/usr/local/MokoTouch/Apps/CustomTableView.app"
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/Apps/CustomTableView.app/libCustomTa=
bleView.so.1.0.0"
+
+PACKAGES =3D "${PN}"
+
+pkg_postinst(){
+#!/bin/sh
+ln -fs /usr/local/MokoTouch/Apps/CustomTableView.app/libCustomTableView.so=
.1.0.0 /usr/lib/libCustomTableView.so.1.0.0
+ln -fs /usr/local/MokoTouch/Apps/CustomTableView.app/libCustomTableView.so=
.1.0.0 /usr/lib/libCustomTableView.so.1.0
+ln -fs /usr/local/MokoTouch/Apps/CustomTableView.app/libCustomTableView.so=
.1.0.0 /usr/lib/libCustomTableView.so.1
+ln -fs /usr/local/MokoTouch/Apps/CustomTableView.app/libCustomTableView.so=
.1.0.0 /usr/lib/libCustomTableView.so
+}
diff --git a/recipes/mokotouch/mokotouch-apps-helloworld_2.bb b/recipes/mok=
otouch/mokotouch-apps-helloworld_2.bb
new file mode 100644
index 0000000..f4d1fa8
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-helloworld_2.bb
@@ -0,0 +1,41 @@
+require mokotouch.inc
+
+DEPENDS +=3D "mokotouch-coreservices-mokotouch"
+RDEPENDS +=3D "mokotouch-coreservices-mokotouch"
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/Apps/HelloWorld
+${OE_QMAKE_QMAKE} HelloWorld.pro
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/Apps
+mkdir ${D}/usr/local/MokoTouch/Apps/HelloWorld.app
+cp ${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0 ${D}/us=
r/local/MokoTouch/Apps/HelloWorld.app/
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/Apps/HelloWorld.app/libHelloWorld.so=
.1.0.0"
+
+PACKAGES =3D "${PN}"
+
+pkg_postinst(){
+#!/bin/sh
+ln -sf /usr/local/MokoTouch/Apps/HelloWorld.app/libHelloWorld.so.1.0.0 /us=
r/lib/libHelloWorld.so.1.0.0
+ln -sf /usr/local/MokoTouch/Apps/HelloWorld.app/libHelloWorld.so.1.0.0 /us=
r/lib/libHelloWorld.so.1.0
+ln -sf /usr/local/MokoTouch/Apps/HelloWorld.app/libHelloWorld.so.1.0.0 /us=
r/lib/libHelloWorld.so.1
+ln -sf /usr/local/MokoTouch/Apps/HelloWorld.app/libHelloWorld.so.1.0.0 /us=
r/lib/libHelloWorld.so
+}
diff --git a/recipes/mokotouch/mokotouch-apps-homescreen_2.bb b/recipes/mok=
otouch/mokotouch-apps-homescreen_2.bb
new file mode 100644
index 0000000..b134c2c
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-homescreen_2.bb
@@ -0,0 +1,41 @@
+require mokotouch.inc
+
+DEPENDS +=3D "mokotouch-coreservices-mokotouch"
+RDEPENDS +=3D "mokotouch-coreservices-mokotouch"
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/Apps/Homescreen
+${OE_QMAKE_QMAKE} Homescreen.pro
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/Apps
+mkdir ${D}/usr/local/MokoTouch/Apps/Homescreen.app
+cp ${S}/MokoTouch/Apps/Homescreen/BUILD/App/libHomescreen.so.1.0.0 ${D}/us=
r/local/MokoTouch/Apps/Homescreen.app/
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/Apps/Homescreen.app/libHomescreen.so=
.1.0.0"
+
+PACKAGES =3D "${PN}"
+
+pkg_postinst(){
+#!/bin/sh
+ln -sf /usr/local/MokoTouch/Apps/Homescreen.app/libHomescreen.so.1.0.0 /us=
r/lib/libHomescreen.so.1.0.0
+ln -sf /usr/local/MokoTouch/Apps/Homescreen.app/libHomescreen.so.1.0.0 /us=
r/lib/libHomescreen.so.1.0
+ln -sf /usr/local/MokoTouch/Apps/Homescreen.app/libHomescreen.so.1.0.0 /us=
r/lib/libHomescreen.so.1
+ln -sf /usr/local/MokoTouch/Apps/Homescreen.app/libHomescreen.so.1.0.0 /us=
r/lib/libHomescreen.so
+}
diff --git a/recipes/mokotouch/mokotouch-apps-testkeyboard_2.bb b/recipes/m=
okotouch/mokotouch-apps-testkeyboard_2.bb
new file mode 100644
index 0000000..0c39c57
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-testkeyboard_2.bb
@@ -0,0 +1,41 @@
+require mokotouch.inc
+
+DEPENDS +=3D "mokotouch-coreservices-mokotouch"
+RDEPENDS +=3D "mokotouch-coreservices-mokotouch"
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/Apps/TestKeyboard
+${OE_QMAKE_QMAKE} TestKeyboard.pro
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/Apps
+mkdir ${D}/usr/local/MokoTouch/Apps/TestKeyboard.app
+cp ${S}/MokoTouch/Apps/TestKeyboard/BUILD/App/libTestKeyboard.so.1.0.0 ${D=
}/usr/local/MokoTouch/Apps/TestKeyboard.app/
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/Apps/TestKeyboard.app/libTestKeyboar=
d.so.1.0.0"
+
+PACKAGES =3D "${PN}"
+
+pkg_postinst(){
+#!/bin/sh
+ln -sf /usr/local/MokoTouch/Apps/TestKeyboard.app/libTestKeyboard.so.1.0.0=
 /usr/lib/libTestKeyboard.so.1.0.0
+ln -sf /usr/local/MokoTouch/Apps/TestKeyboard.app/libTestKeyboard.so.1.0.0=
 /usr/lib/libTestKeyboard.so.1.0
+ln -sf /usr/local/MokoTouch/Apps/TestKeyboard.app/libTestKeyboard.so.1.0.0=
 /usr/lib/libTestKeyboard.so.1
+ln -sf /usr/local/MokoTouch/Apps/TestKeyboard.app/libTestKeyboard.so.1.0.0=
 /usr/lib/libTestKeyboard.so
+}
diff --git a/recipes/mokotouch/mokotouch-apps-testtableview_2.bb b/recipes/=
mokotouch/mokotouch-apps-testtableview_2.bb
new file mode 100644
index 0000000..829476c
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-testtableview_2.bb
@@ -0,0 +1,41 @@
+require mokotouch.inc
+
+DEPENDS +=3D "mokotouch-coreservices-mokotouch"
+RDEPENDS +=3D "mokotouch-coreservices-mokotouch"
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/Apps/TestTableView
+${OE_QMAKE_QMAKE} TestTableView.pro
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/Apps
+mkdir ${D}/usr/local/MokoTouch/Apps/TestTableView.app
+cp ${S}/MokoTouch/Apps/TestTableView/BUILD/App/libTestTableView.so.1.0.0 $=
{D}/usr/local/MokoTouch/Apps/TestTableView.app/
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/Apps/TestTableView.app/libTestTableV=
iew.so.1.0.0"
+
+PACKAGES =3D "${PN}"
+
+pkg_postinst(){
+#!/bin/sh
+ln -sf /usr/local/MokoTouch/Apps/TestTableView.app/libTestTableView.so.1.0=
.0 /usr/lib/libTestTableView.so.1.0.0
+ln -sf /usr/local/MokoTouch/Apps/TestTableView.app/libTestTableView.so.1.0=
.0 /usr/lib/libTestTableView.so.1.0
+ln -sf /usr/local/MokoTouch/Apps/TestTableView.app/libTestTableView.so.1.0=
.0 /usr/lib/libTestTableView.so.1
+ln -sf /usr/local/MokoTouch/Apps/TestTableView.app/libTestTableView.so.1.0=
.0 /usr/lib/libTestTableView.so
+}
diff --git a/recipes/mokotouch/mokotouch-apps-webmobile_2.bb b/recipes/moko=
touch/mokotouch-apps-webmobile_2.bb
new file mode 100644
index 0000000..d81c2b1
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-webmobile_2.bb
@@ -0,0 +1,41 @@
+require mokotouch.inc
+
+DEPENDS +=3D "mokotouch-coreservices-mokotouch"
+RDEPENDS +=3D "mokotouch-coreservices-mokotouch"
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/Apps/WebMobile
+${OE_QMAKE_QMAKE} WebMobile.pro
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/Apps
+mkdir ${D}/usr/local/MokoTouch/Apps/WebMobile.app
+cp ${S}/MokoTouch/Apps/WebMobile/BUILD/App/libWebMobile.so.1.0.0 ${D}/usr/=
local/MokoTouch/Apps/WebMobile.app/
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/Apps/WebMobile.app/libWebMobile.so.1=
.0.0"
+
+PACKAGES =3D "${PN}"
+
+pkg_postinst(){
+#!/bin/sh
+ln -sf /usr/local/MokoTouch/Apps/WebMobile.app/libWebMobile.so.1.0.0 /usr/=
lib/libWebMobile.so.1.0.0
+ln -sf /usr/local/MokoTouch/Apps/WebMobile.app/libWebMobile.so.1.0.0 /usr/=
lib/libWebMobile.so.1.0
+ln -sf /usr/local/MokoTouch/Apps/WebMobile.app/libWebMobile.so.1.0.0 /usr/=
lib/libWebMobile.so.1
+ln -sf /usr/local/MokoTouch/Apps/WebMobile.app/libWebMobile.so.1.0.0 /usr/=
lib/libWebMobile.so
+}
diff --git a/recipes/mokotouch/mokotouch-coreservices-mokotouch_2.bb b/reci=
pes/mokotouch/mokotouch-coreservices-mokotouch_2.bb
new file mode 100644
index 0000000..8594cc2
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-coreservices-mokotouch_2.bb
@@ -0,0 +1,34 @@
+require mokotouch.inc
+
+DEPENDS +=3D "mokotouch-frameworks-uikit"
+RDEPENDS +=3D "mokotouch-frameworks-uikit"
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/CoreServices/MokoTouch
+${OE_QMAKE_QMAKE} MokoTouch.pro
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/bin/
+
+cp qte.env ${D}/usr/local/MokoTouch/
+cp ${S}/MokoTouch/CoreServices/MokoTouch/BUILD/Service/MokoTouch ${D}/usr/=
local/MokoTouch/bin/
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/qte.env /usr/local/MokoTouch/bin/Mok=
oTouch"
+
+PACKAGES =3D "${PN}"
diff --git a/recipes/mokotouch/mokotouch-frameworks-uikit_2.bb b/recipes/mo=
kotouch/mokotouch-frameworks-uikit_2.bb
new file mode 100644
index 0000000..787c26e
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-frameworks-uikit_2.bb
@@ -0,0 +1,41 @@
+require mokotouch.inc
+
+PV =3D "2"
+PR =3D "r1"
+
+do_configure(){
+echo "Do nothing"
+}
+
+do_compile(){
+echo "Using qmake in location: ${OE_QMAKE_QMAKE}"
+cd ${S}/MokoTouch/Frameworks/UIKit/
+${OE_QMAKE_QMAKE} UIKit.pro
+make
+}
+
+do_install(){
+mkdir ${D}/usr
+mkdir ${D}/usr/local
+mkdir ${D}/usr/local/MokoTouch
+mkdir ${D}/usr/local/MokoTouch/Frameworks
+cp -R "${S}/MokoTouch/Frameworks/UIKit/UIKit" "${D}/usr/local/MokoTouch/Fr=
ameworks/"
+cp "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${D}/us=
r/local/MokoTouch/Frameworks/"
+}
+
+do_stage() {
+cp "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" ${STAGIN=
G_LIBDIR}
+ln -fs ${STAGING_LIBDIR}/libUIKit.so.1.0.0 ${STAGING_LIBDIR}/libUIKit.so.1=
.0
+ln -fs ${STAGING_LIBDIR}/libUIKit.so.1.0.0 ${STAGING_LIBDIR}/libUIKit.so.1
+ln -fs ${STAGING_LIBDIR}/libUIKit.so.1.0.0 ${STAGING_LIBDIR}/libUIKit.so
+}
+
+pkg_postinst_${PN}(){
+#!/bin/sh
+ln -fs /usr/local/MokoTouch/Frameworks/UIKit.framework/libUIKit.so.1.0.0 /=
usr/lib/libUIKit.so.1.0.0=20
+ln -fs /usr/local/MokoTouch/Frameworks/UIKit.framework/libUIKit.so.1.0.0 /=
usr/lib/libUIKit.so.1.0=20
+ln -fs /usr/local/MokoTouch/Frameworks/UIKit.framework/libUIKit.so.1.0.0 /=
usr/lib/libUIKit.so.1
+ln -fs /usr/local/MokoTouch/Frameworks/UIKit.framework/libUIKit.so.1.0.0 /=
usr/lib/libUIKit.so
+}
+
+FILES_${PN} =3D "/usr/local/MokoTouch/Frameworks/libUIKit.so.1.0.0 /usr/lo=
cal/MokoTouch/Frameworks/UIKit/*"
diff --git a/recipes/mokotouch/mokotouch.inc b/recipes/mokotouch/mokotouch.=
inc
new file mode 100644
index 0000000..cfc13e0
--- /dev/null
+++ b/recipes/mokotouch/mokotouch.inc
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "MokoTouch a finger friendly QT4-based iphone like GUI for=
 OpenMoko"
+HOMEPAGE =3D "http://th30z.netsons.org/mokotouch/"
+SECTION =3D "openmoko/applications"
+LICENSE =3D "GPL"
+DEPENDS =3D "gstreamer qt4-x11-free"
+RDEPENDS =3D "gstreamer qt4-x11-free"
+
+PV =3D "2"
+PR =3D "r1"
+
+SRC_URI =3D "http://th30z.netsons.org/mokotouch/data/mokotouch-2-aug-2009.=
tar.bz2"
+
+S =3D "${WORKDIR}/MokoTouch-Project"
+D =3D "${WORKDIR}/image"
+
+EXTRA_QMAKEVARS_POST +=3D "INCLUDEPATH+=3D${OE_QMAKE_INCDIR_QT}/Qt"
+
+inherit autotools qt4x11 distutils-base pkgconfig lib_package

--Boundary-01=_NXg5KOXGjwBSq3M--

--=_koffein-24015-1256583525-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkrmBc0ACgkQAeZw77btGjqW3QCcCtSwndxu782+0fsQoMeiIT7k
7DMAn01SCbzQvAKy+VKreXcpr6jQHlpQ
=mkSM
-----END PGP SIGNATURE-----

--=_koffein-24015-1256583525-0001-2--
