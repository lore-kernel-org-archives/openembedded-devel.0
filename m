Received: from mailout10.rmx.de (mailout10.rmx.de [94.199.88.75])
 by mx.groups.io with SMTP id smtpd.web10.1524.1591684379132730791
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 23:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.75, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout10.rmx.de (Postfix) with ESMTPS id 49h0fv3Qtzz320W
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 08:32:55 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49h0fr4gM6z2xbF
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 08:32:52 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Tue, 9 Jun 2020 08:32:35 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.29) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 9 Jun
 2020 08:32:35 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 1/4] graphviz: Extend for nativesdk
Date: Tue, 9 Jun 2020 08:32:09 +0200
Message-ID: <20200609063212.3788-2-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609063212.3788-1-ceggers@arri.de>
References: <20200609063212.3788-1-ceggers@arri.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.29]
X-OriginalArrivalTime: 09 Jun 2020 06:32:35.0370 (UTC) FILETIME=[C33538A0:01D63E27]
X-RMX-ID: 20200609-083252-49h0fr4gM6z2xbF-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The "dot" tool is often used together with doxygen which is already
available for nativesdk.

Cross compiling graphviz for nativesdk looks quite similar as building
for target. At installation time of the SDK, "dot -c" must be called in
order to create <SDK sysroot>/usr/lib/graphviz/config6.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../graphviz/graphviz/graphviz-setup.sh       |  6 +++++
 .../graphviz/graphviz_2.40.1.bb               | 24 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/graphviz-s=
etup.sh

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh=
 b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh
new file mode 100644
index 000000000..df0be9e3e
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/graphviz-setup.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+echo "Setting up graphviz..."
+
+# Create /usr/lib/graphviz/config6
+$OECORE_NATIVE_SYSROOT/usr/bin/dot -c
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-=
oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index 12ecb9909..aa5c0c820 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -16,6 +16,7 @@ DEPENDS =3D " \
     freetype \
 "
 DEPENDS_append_class-target =3D " ${BPN}-native"
+DEPENDS_append_class-nativesdk =3D " ${BPN}-native"
=20
 inherit autotools-brokensep pkgconfig gettext
=20
@@ -33,6 +34,10 @@ SRC_URI_append_class-target =3D "\
            file://0001-Use-native-mkdefs.patch \
            file://0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled=
.patch \
 "
+SRC_URI_append_class-nativesdk =3D "\
+           file://0001-Use-native-mkdefs.patch \
+           file://graphviz-setup.sh \
+"
 SRC_URI[md5sum] =3D "2acf30ca8e6cc8b001b0334db65fd072"
 SRC_URI[sha256sum] =3D "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042=
b5dcf648a2c1c62a"
=20
@@ -47,7 +52,17 @@ EXTRA_OECONF_class-target =3D "\
                 --disable-r \
                 --disable-sharp \
                 "
+EXTRA_OECONF_class-nativesdk =3D "\
+                --with-expatincludedir=3D${STAGING_INCDIR} \=20
+                --with-expatlibdir=3D${STAGING_LIBDIR} \
+                --without-included-ltdl \
+                --disable-java \
+                --disable-tcl \
+                --disable-r \
+                --disable-sharp \
+                "
 CFLAGS_append_class-target =3D " -D_typ_ssize_t=3D1 -D_long_double=3D1"
+CFLAGS_append_class-nativesdk =3D " -D_typ_ssize_t=3D1 -D_long_double=3D=
1"
 do_configure_prepend() {
     cd ${S}
     # create version.m4 and ignore libtoolize errors
@@ -59,6 +74,13 @@ do_install_append_class-native() {
     install -m755 ${B}/lib/gvpr/mkdefs ${D}${bindir}
 }
=20
+do_install_append_class-nativesdk() {
+    # graphviz-setup.sh must be executed at SDK installation
+    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
+    install -m 0755 ${WORKDIR}/graphviz-setup.sh ${D}${SDKPATHNATIVE}/po=
st-relocate-setup.d
+}
+FILES_${PN}_class-nativesdk +=3D "${SDKPATHNATIVE}"
+
 PACKAGES =3D+ "${PN}-python ${PN}-perl ${PN}-demo"
=20
 FILES_${PN}-python +=3D "${libdir}/python*/site-packages/ ${libdir}/grap=
hviz/python/"
@@ -74,4 +96,4 @@ INSANE_SKIP_${PN}-python =3D "dev-so"
=20
 FILES_SOLIBSDEV_append =3D " ${libdir}/graphviz/lib*${SOLIBSDEV}"
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler

