Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Feb 2020 11:56:47 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8537E6143D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1582113408;
	bh=3G1q2gLIv9zsC6/soPZUSf+d13ZwNzWL/oiuMXBAgME=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=EJ6aewptTVMy8hPKQv2zWv1jpg3qNdWGv8igbZGBvV5GbLlgGp/MlVMuHlhM/1T00
	0NVKl2JDyRtvBud+/WrYbDy2CYb/pgqaZz+BP/+ttu2yqW5eqsTsslWOH/MxIT5oGI
	zLPMGCONej/WUrW3Hc2M/NkXKj5rUskJLOoQCOIU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([95.216.96.43]) by mail.gmx.com
	(mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
	1N4z6q-1jTrL31s4S-010rtb; Wed, 19 Feb 2020 12:51:45 +0100
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2020 12:51:26 +0100
Message-Id: <20200219115126.25036-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:g2Y4ANjExeTUIShjlEV+Ug0zHVl1LXO90WtJ4E1xkyoDd4UizNU
	BSnE/NS76zb4BjvPV8Rd38skNi+zyI8cIrbQ/xAaCvrUxY6ptOB1QXt+0gwUREAjOD1dXdL
	HQyW/oU8lKQplM9oWoevEgnmeWDdxw4+Jgdx9SSsSsalUOzQxBTPEj38PJ1PfWsd7SPek7z
	33o8fLk9a2bYO4aLyY9ng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EgU4l8GTSu4=:3Xt4Xjb9mmKX+iBDl7OhXv
	khOu1xBuPpPp2n3zeOau4OvAEpgKsmIupA8FtNIz21x3HJiKF5NbxUGkUxTX0JHu7A2U28vMm
	q6JQusBwDDnqkXDbtE42l9H6ZhMToqO/qqQmENgtDzP84as5jbAUZDmEVKEkrnmuBQzwTjsjM
	7Sbp+vdK+HUlqoh7iQUkhFPlACC9JkkuBAtt5KEre9O+hh2vY6fbyHu420+qOcNl3VNb7Osvs
	nfztOUgXVHAR7DEhapPGK5UphIESGlMfUGx3ripGXcRAx0eQFumTwGe1MhnBwIQ1h/znZqpVt
	VFij5M51/lD1++mI8mhBbbI7Xis0/m7N21CgGaCUiXlMEi2gf9WlMZrq3alnyVgoKqtV3FJBe
	oe8B1El91+1a1v7rdY43nmBcd5GV0lmmaZHVUsH3N5VaUNEOEddgFPRI8pqN0glw73GdjSdi3
	XEYyANgA2ii5V7I2j0vUvgU3t2YSSRemoLo7XGsfrMK5D5ozxk0ozDQ4feirvu4I5wX5hWwh/
	XbBpKGL1HwFJEm9H1WpLV2iR7K7W/1je8UApGSY7Nc7NC7E1jIykLAUw0CfRx8JswozZ0gAuO
	KsWp9PQbfMBiEsZ7WJqERrANPDxwU8FOHIv+Xm1johFOMkEarb2Us4ofEDXBGMQ/fdlkf8oYl
	HJh/d1ElXIOPAr7OKOOAlJOO2sHCIVCIRLrMILuQWl24peAtunpeYydRuloKTcQNZPSuI6YoC
	NJQiM6GwSFjnMdhbkg6svrIZISeIak4ZkIDXMKjL7rHYLC/L3as6/YEyjEpbzMIwBksls+7EX
	FRtfiepufBNbUFAU10j+ELzMG/abLDekHEP2Yp5k3+UOjSTe1IlcI1+874mbxQBHGLRLEQ5Zc
	TXCm+HWgQlEpbFstw9jD52sVSp7hN4QxhnI/69I5Cprokbkh3OXp4HqjI85TyhYqDE6YUrUDI
	uASAeraQy+C58JnY9EZXU3FPs9D01BeJR4ARbWQfD2iAKMYQx4ddBS8zntRt8YMwfFgmH41oS
	hLT4yDpqae7aCUVi5tR3OAI1BxWY31gUzjcIsz2VKqXb/NG8plwXykaJyq/WI+YitpN+BMezs
	OkigdsVrMQSFE5oRkp3f97mAXWCMPMMXLmjU+1KG544pYfLi9cin0UFZIWn+GAGB0O1DQ4VPl
	Z6/a/s954f76A7vPo1MifVGuyhC1+mNnc/TlkhxnJ2SN1ZGGBlOHeHXjqhKHF0SEqtcX8=
Subject: [meta-oe][PATCH] meta-oe: master: remmina - use PACKAGECONFIG for spice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2020 11:56:47 -0000
Content-Transfer-Encoding: quoted-printable

remmina depends on spice and spice-protocol but they are in meta-networkin=
g.
Use the PACKAGECONFIG flag to avoid hardcoding the dependency.

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
=2D--
 meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/re=
cipes-support/remmina/remmina_1.3.6.bb
index f9963ff65..f9860a11f 100644
=2D-- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -5,8 +5,6 @@ LICENSE =3D "GPLv2 & openssl"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddab7215512044d49037272ce1ac4ea=
8f file://LICENSE.OpenSSL;md5=3Dc1eb3cee0a4dea27503c531267a69769"
 DEPENDS +=3D "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui lib=
sodium libssh vte json-glib libsoup-2.4 libvncserver libsecret"

-DEPENDS_append_x86 =3D " spice spice-protocol"
-DEPENDS_append_x86-64 =3D " spice spice-protocol"

 DEPENDS_append_libc-musl =3D " libexecinfo"
 LDFLAGS_append_libc-musl =3D " -lexecinfo"
@@ -23,11 +21,7 @@ inherit cmake features_check mime-xdg
 # depends on avahi-ui with this restriction
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"

-EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWITH=
_TRANSLATIONS=3DOFF -DWITH_SPICE=3DOFF"
-
-EXTRA_OECMAKE_append_x86 =3D " -DWITH_SPICE=3DON"
-EXTRA_OECMAKE_append_x86-64 =3D " -DWITH_SPICE=3DON"
-
+EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWITH=
_TRANSLATIONS=3DOFF"

 do_install_append(){
     # We dont need the extra stuff form other desktop environments
@@ -36,6 +30,8 @@ do_install_append(){
     rm -rf ${D}/${datadir}/gnome-session
 }

+PACKAGECONFIG[spice] =3D "-DWITH_SPICE=3DON, -DWITH_SPICE=3DOFF, spice sp=
ice-protocol"
+
 RDEPENDS_${PN} =3D "bash"

 FILES_${PN}_append =3D " ${datadir}/icons/hicolor/*"
=2D-
2.11.0


