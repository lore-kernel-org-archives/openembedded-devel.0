Received: from [93.188.72.201] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1N691o-0007Ue-Nc
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 21:33:59 +0100
Received: from dizzy-6.localnet ([::ffff:82.192.226.27])
	(AUTH: PLAIN david.lanzendoerfer@o2s.ch, TLS: TLSv1/SSLv3, 256bits,
	AES256-SHA) by koffein with esmtp; Thu, 05 Nov 2009 22:19:16 +0000
	id 000000000002C096.000000004AF34F64.00007DEC
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: mickey@vanille-media.de,
  openembedded-devel@lists.openembedded.org
Date: Thu, 5 Nov 2009 23:16:19 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; x86_64; ; )
References: <200910262125.58992.david.lanzendoerfer@o2s.ch>
	<1257451262.4676.6.camel@andromeda>
In-Reply-To: <1257451262.4676.6.camel@andromeda>
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
Mime-Version: 1.0
Message-Id: <200911052316.23264.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.188.72.201
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] MokoTouch
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
X-List-Received-Date: Thu, 05 Nov 2009 20:34:00 -0000
X-Groupsio-MsgNum: 13913
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="=_koffein-32374-1257460456-0001-2"

--=_koffein-32374-1257460456-0001-2
Content-Type: multipart/mixed;
  boundary="Boundary-01=_z608KkNNxzOeAL9"
Content-Transfer-Encoding: 7bit

--Boundary-01=_z608KkNNxzOeAL9
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> Dear David,
Hi Mickey

> let me encourage you to submit an updated patchset that takes into
> account the reviewer's comments.
Here is the corrected patch, which will bring the bitbake recipes for=20
MokoTouch into OE.
I hope this will be somehow usefull for some of you.

> Cheers,
dito :)

> :M:
leviathan

--Boundary-01=_z608KkNNxzOeAL9
Content-Type: text/x-patch;
  charset="ISO-8859-1";
  name="add-mokotouch.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="add-mokotouch.patch"

commit dff8d20ceb4c304ba3140deefb80310ee92219b1
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Thu Nov 5 23:11:19 2009 +0100

    Added MokoTouch recipes (http://th30z.netsons.org/mokotouch/)

diff --git a/recipes/mokotouch/mokotouch-apps-customtableview_2.bb b/recipe=
s/mokotouch/mokotouch-apps-customtableview_2.bb
new file mode 100644
index 0000000..da9ff61
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-customtableview_2.bb
@@ -0,0 +1,24 @@
+require mokotouch.inc
+
+DEPENDS =3D "mokotouch-coreservices-mokotouch"
+
+do_configure(){
+cd ${S}/MokoTouch/Apps/CustomTableView
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+${OE_QMAKE_QMAKE} CustomTableView.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/Apps/CustomTableView
+oe_runmake
+}
+
+do_install(){
+install -d "${D}/${libdir}"
+install "${S}/MokoTouch/Apps/CustomTableView/BUILD/App/libCustomTableView.=
so.1.0.0" "${D}/${libdir}/libCustomTableView.so.1.0.0"
+install "${S}/MokoTouch/Apps/CustomTableView/BUILD/App/libCustomTableView.=
so.1.0.0" "${D}/${libdir}/libCustomTableView.so.1.0"
+install "${S}/MokoTouch/Apps/CustomTableView/BUILD/App/libCustomTableView.=
so.1.0.0" "${D}/${libdir}/libCustomTableView.so.1"
+install "${S}/MokoTouch/Apps/CustomTableView/BUILD/App/libCustomTableView.=
so.1.0.0" "${D}/${libdir}/libCustomTableView.so"
+}
+
diff --git a/recipes/mokotouch/mokotouch-apps-helloworld_2.bb b/recipes/mok=
otouch/mokotouch-apps-helloworld_2.bb
new file mode 100644
index 0000000..0d42682
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-helloworld_2.bb
@@ -0,0 +1,24 @@
+require mokotouch.inc
+
+DEPENDS =3D "mokotouch-coreservices-mokotouch"
+
+do_configure(){
+cd ${S}/MokoTouch/Apps/HelloWorld
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+${OE_QMAKE_QMAKE} HelloWorld.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/Apps/HelloWorld
+oe_runmake
+}
+
+do_install(){
+install -d "${D}/${libdir}"
+install "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0" =
"${D}/${libdir}/libHelloWorld.so.1.0.0"
+install "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0" =
"${D}/${libdir}/libHelloWorld.so.1.0"
+install "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0" =
"${D}/${libdir}/libHelloWorld.so.1"
+install "${S}/MokoTouch/Apps/HelloWorld/BUILD/App/libHelloWorld.so.1.0.0" =
"${D}/${libdir}/libHelloWorld.so"
+}
+
diff --git a/recipes/mokotouch/mokotouch-apps-homescreen_2.bb b/recipes/mok=
otouch/mokotouch-apps-homescreen_2.bb
new file mode 100644
index 0000000..b58f278
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-homescreen_2.bb
@@ -0,0 +1,23 @@
+require mokotouch.inc
+
+DEPENDS =3D "mokotouch-coreservices-mokotouch"
+
+do_configure(){
+cd ${S}/MokoTouch/Apps/Homescreen
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+${OE_QMAKE_QMAKE} Homescreen.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/Apps/Homescreen
+oe_runmake
+}
+
+do_install(){
+install -d "${D}/${libdir}"
+install "${S}/MokoTouch/Apps/Homescreen/BUILD/App/libHomescreen.so.1.0.0" =
"${D}/${libdir}/libHomescreen.so.1.0.0"
+install "${S}/MokoTouch/Apps/Homescreen/BUILD/App/libHomescreen.so.1.0.0" =
"${D}/${libdir}/libHomescreen.so.1.0"
+install "${S}/MokoTouch/Apps/Homescreen/BUILD/App/libHomescreen.so.1.0.0" =
"${D}/${libdir}/libHomescreen.so.1"
+install "${S}/MokoTouch/Apps/Homescreen/BUILD/App/libHomescreen.so.1.0.0" =
"${D}/${libdir}/libHomescreen.so"
+}
diff --git a/recipes/mokotouch/mokotouch-apps-testkeyboard_2.bb b/recipes/m=
okotouch/mokotouch-apps-testkeyboard_2.bb
new file mode 100644
index 0000000..6b6fb25
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-testkeyboard_2.bb
@@ -0,0 +1,24 @@
+require mokotouch.inc
+
+DEPENDS =3D "mokotouch-coreservices-mokotouch"
+
+do_configure(){
+cd ${S}/MokoTouch/Apps/TestKeyboard
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+${OE_QMAKE_QMAKE} TestKeyboard.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/Apps/TestKeyboard
+oe_runmake
+}
+
+do_install(){
+install -d "${D}/${libdir}"
+install "${S}/MokoTouch/Apps/TestKeyboard/BUILD/App/libTestKeyboard.so.1.0=
.0" "${D}/${libdir}/libTestKeyboard.so.1.0.0"
+install "${S}/MokoTouch/Apps/TestKeyboard/BUILD/App/libTestKeyboard.so.1.0=
.0" "${D}/${libdir}/libTestKeyboard.so.1.0"
+install "${S}/MokoTouch/Apps/TestKeyboard/BUILD/App/libTestKeyboard.so.1.0=
.0" "${D}/${libdir}/libTestKeyboard.so.1"
+install "${S}/MokoTouch/Apps/TestKeyboard/BUILD/App/libTestKeyboard.so.1.0=
.0" "${D}/${libdir}/libTestKeyboard.so"
+}
+
diff --git a/recipes/mokotouch/mokotouch-apps-testtableview_2.bb b/recipes/=
mokotouch/mokotouch-apps-testtableview_2.bb
new file mode 100644
index 0000000..247b051
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-testtableview_2.bb
@@ -0,0 +1,24 @@
+require mokotouch.inc
+
+DEPENDS =3D "mokotouch-coreservices-mokotouch"
+
+do_configure(){
+cd ${S}/MokoTouch/Apps/TestTableView
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+${OE_QMAKE_QMAKE} TestTableView.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/Apps/TestTableView
+oe_runmake
+}
+
+do_install(){
+install -d "${D}/${libdir}"
+install "${S}/MokoTouch/Apps/TestTableView/BUILD/App/libTestTableView.so.1=
.0.0" "${D}/${libdir}/libTestTableView.so.1.0.0"
+install "${S}/MokoTouch/Apps/TestTableView/BUILD/App/libTestTableView.so.1=
.0.0" "${D}/${libdir}/libTestTableView.so.1.0"
+install "${S}/MokoTouch/Apps/TestTableView/BUILD/App/libTestTableView.so.1=
.0.0" "${D}/${libdir}/libTestTableView.so.1"
+install "${S}/MokoTouch/Apps/TestTableView/BUILD/App/libTestTableView.so.1=
.0.0" "${D}/${libdir}/libTestTableView.so"
+}
+
diff --git a/recipes/mokotouch/mokotouch-apps-webmobile_2.bb b/recipes/moko=
touch/mokotouch-apps-webmobile_2.bb
new file mode 100644
index 0000000..ec1b8f2
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-apps-webmobile_2.bb
@@ -0,0 +1,24 @@
+require mokotouch.inc
+
+DEPENDS =3D "mokotouch-coreservices-mokotouch"
+
+do_configure(){
+cd ${S}/MokoTouch/Apps/WebMobile
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+${OE_QMAKE_QMAKE} WebMobile.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/Apps/WebMobile
+oe_runmake
+}
+
+do_install(){
+install -d "${D}/${libdir}"
+install "${S}/MokoTouch/Apps/WebMobile/BUILD/App/libWebMobile.so.1.0.0" "$=
{D}/${libdir}/libWebMobile.so.1.0.0"
+install "${S}/MokoTouch/Apps/WebMobile/BUILD/App/libWebMobile.so.1.0.0" "$=
{D}/${libdir}/libWebMobile.so.1.0"
+install "${S}/MokoTouch/Apps/WebMobile/BUILD/App/libWebMobile.so.1.0.0" "$=
{D}/${libdir}/libWebMobile.so.1"
+install "${S}/MokoTouch/Apps/WebMobile/BUILD/App/libWebMobile.so.1.0.0" "$=
{D}/${libdir}/libWebMobile.so"
+}
+
diff --git a/recipes/mokotouch/mokotouch-coreservices-mokotouch_2.bb b/reci=
pes/mokotouch/mokotouch-coreservices-mokotouch_2.bb
new file mode 100644
index 0000000..4796d25
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-coreservices-mokotouch_2.bb
@@ -0,0 +1,25 @@
+require mokotouch.inc
+
+DEPENDS =3D "mokotouch-frameworks-uikit"
+
+do_configure(){
+cd ${S}/MokoTouch/CoreServices/MokoTouch
+rm UIKit.framework
+ln -s "${S}/MokoTouch/Frameworks/UIKit/" UIKit.framework
+${OE_QMAKE_QMAKE} MokoTouch.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/CoreServices/MokoTouch
+oe_runmake
+}
+
+do_install(){
+install -d ${D}/${sysconfdir}
+install -d ${D}/${bindir}
+
+install qte.env ${D}/${sysconfdir}/mokotouch.env
+install "${S}/MokoTouch/CoreServices/MokoTouch/BUILD/Service/MokoTouch" "$=
{D}/${bindir}/MokoTouch"
+}
+
+FILES_${PN} =3D "${bindir}/MokoTouch ${sysconfdir}/mokotouch.env"
diff --git a/recipes/mokotouch/mokotouch-frameworks-uikit_2.bb b/recipes/mo=
kotouch/mokotouch-frameworks-uikit_2.bb
new file mode 100644
index 0000000..cbb3908
--- /dev/null
+++ b/recipes/mokotouch/mokotouch-frameworks-uikit_2.bb
@@ -0,0 +1,26 @@
+require mokotouch.inc
+
+do_configure(){
+cd ${S}/MokoTouch/Frameworks/UIKit/
+${OE_QMAKE_QMAKE} UIKit.pro
+}
+
+do_compile(){
+cd ${S}/MokoTouch/Frameworks/UIKit/
+oe_runmake
+}
+
+do_install(){
+install -d "${D}/${libdir}"
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
D}/${libdir}/libUIKit.so.1.0.0"
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
D}/${libdir}/libUIKit.so.1.0"
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
D}/${libdir}/libUIKit.so.1"
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
D}/${libdir}/libUIKit.so"
+}
+
+do_stage() {
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
STAGING_LIBDIR}/libUIKit.so.1.0.0"
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
STAGING_LIBDIR}/libUIKit.so.1.0"
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
STAGING_LIBDIR}/libUIKit.so.1"
+install "${S}/MokoTouch/Frameworks/UIKit/BUILD/libs/libUIKit.so.1.0.0" "${=
STAGING_LIBDIR}/libUIKit.so"
+}
diff --git a/recipes/mokotouch/mokotouch.inc b/recipes/mokotouch/mokotouch.=
inc
new file mode 100644
index 0000000..95cb176
--- /dev/null
+++ b/recipes/mokotouch/mokotouch.inc
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "MokoTouch a finger friendly QT4-based iphone like GUI for=
 OpenMoko"
+HOMEPAGE =3D "http://th30z.netsons.org/mokotouch/"
+SECTION =3D "openmoko/applications"
+LICENSE =3D "GPL"
+DEPENDS =3D "gstreamer qt4-x11-free"
+
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

--Boundary-01=_z608KkNNxzOeAL9--

--=_koffein-32374-1257460456-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrzTrcACgkQAeZw77btGjqO2QCcDOlDolX5G4VN+OcHlg2J8Flm
O7cAoLGOUlY+3Y4skZH0OYOQooTxkg0j
=CumX
-----END PGP SIGNATURE-----

--=_koffein-32374-1257460456-0001-2--
