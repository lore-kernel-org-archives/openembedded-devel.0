Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SILnj-000050-8b
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 17:19:11 +0200
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id C85CD4B00F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 17:09:49 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Apr 2012 17:09:48 +0200
Message-Id: <1334243388-17414-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [meta-oe] qwt: add 6.0.1 version
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
X-List-Received-Date: Thu, 12 Apr 2012 15:19:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- only the qwt-e version is compile and run tested ATM

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-qt/qwt/files/qwt6.patch |   86 +++++++++++++++++++++++++=
++++++
 meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb   |    8 ---
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb   |    8 +++
 meta-oe/recipes-qt/qwt/qwt.inc          |   10 ++--
 meta-oe/recipes-qt/qwt/qwt_5.2.1.bb     |    8 ---
 meta-oe/recipes-qt/qwt/qwt_6.0.1.bb     |    8 +++
 6 files changed, 108 insertions(+), 20 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qwt/files/qwt6.patch
 delete mode 100644 meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb
 create mode 100644 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
 delete mode 100644 meta-oe/recipes-qt/qwt/qwt_5.2.1.bb
 create mode 100644 meta-oe/recipes-qt/qwt/qwt_6.0.1.bb

diff --git a/meta-oe/recipes-qt/qwt/files/qwt6.patch b/meta-oe/recipes-qt=
/qwt/files/qwt6.patch
new file mode 100644
index 0000000..4fb1a9b
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/files/qwt6.patch
@@ -0,0 +1,86 @@
+- add support for SUFFIX_STR
+---
+diff --git a/examples/examples.pri b/examples/examples.pri
+index a6911c8..854ce89 100644
+--- a/examples/examples.pri
++++ b/examples/examples.pri
+@@ -13,9 +13,17 @@ include( $${QWT_ROOT}/qwtbuild.pri )
+=20
+ TEMPLATE     =3D app
+=20
++SUFFIX_STR =3D
++CONFIG(debug, debug|release) {
++    SUFFIX_STR =3D $${DEBUG_SUFFIX}
++}
++else {
++    SUFFIX_STR =3D $${RELEASE_SUFFIX}
++}
++
+ INCLUDEPATH +=3D $${QWT_ROOT}/src
+ DEPENDPATH  +=3D $${QWT_ROOT}/src
+-DESTDIR      =3D $${QWT_ROOT}/examples/bin
++DESTDIR      =3D $${QWT_ROOT}/examples/bin$${SUFFIX_STR}
+=20
+ QMAKE_RPATHDIR *=3D $${QWT_ROOT}/lib
+=20
+diff --git a/qwtconfig.pri b/qwtconfig.pri
+index b0d2110..be119b7 100644
+--- a/qwtconfig.pri
++++ b/qwtconfig.pri
+@@ -30,6 +30,13 @@ QWT_INSTALL_DOCS      =3D $${QWT_INSTALL_PREFIX}/doc
+ QWT_INSTALL_HEADERS   =3D $${QWT_INSTALL_PREFIX}/include
+ QWT_INSTALL_LIBS      =3D $${QWT_INSTALL_PREFIX}/lib
+=20
++DEBUG_SUFFIX        =3D=20
++RELEASE_SUFFIX      =3D=20
++
++win32 {
++    DEBUG_SUFFIX      =3D d
++}
++
+ ######################################################################
+ # Designer plugin
+ ######################################################################
+diff --git a/src/src.pro b/src/src.pro
+index beb7125..ebf8ea6 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -13,8 +13,16 @@ QWT_ROOT =3D $${PWD}/..
+ include( $${QWT_ROOT}/qwtconfig.pri )
+ include( $${QWT_ROOT}/qwtbuild.pri )
+=20
++SUFFIX_STR =3D
++CONFIG(debug, debug|release) {
++    SUFFIX_STR =3D $${DEBUG_SUFFIX}
++}
++else {
++    SUFFIX_STR =3D $${RELEASE_SUFFIX}
++}
++
+ TEMPLATE          =3D lib
+-TARGET            =3D $$qtLibraryTarget(qwt)
++TARGET            =3D $$qtLibraryTarget(qwt)$${SUFFIX_STR}
+=20
+ DESTDIR           =3D $${QWT_ROOT}/lib
+=20
+diff --git a/textengines/mathml/mathml.pro b/textengines/mathml/mathml.p=
ro
+index b0ed9f9..403828b 100644
+--- a/textengines/mathml/mathml.pro
++++ b/textengines/mathml/mathml.pro
+@@ -12,7 +12,15 @@ message(Beside the Qwt license you also have to take =
care of its license. )
+=20
+ include( $${PWD}/../textengines.pri )
+=20
+-TARGET    =3D $$qtLibraryTarget(qwtmathml)
++SUFFIX_STR =3D
++CONFIG(debug, debug|release) {
++    SUFFIX_STR =3D $${DEBUG_SUFFIX}
++}
++else {
++    SUFFIX_STR =3D $${RELEASE_SUFFIX}
++}
++
++TARGET    =3D $$qtLibraryTarget(qwtmathml$${SUFFIX_STR})
+ QT       +=3D xml
+=20
+ HEADERS =3D \
diff --git a/meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb b/meta-oe/recipes-qt/q=
wt/qwt-e_5.2.1.bb
deleted file mode 100644
index 2f55061..0000000
--- a/meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit qt4e
-
-require qwt.inc
-
-SRC_URI[qwt.md5sum] =3D "4a595b8db0ec3856b117836c1d60cb27"
-SRC_URI[qwt.sha256sum] =3D "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fb=
e88524eb698e11ac569f"
-
-RPROVIDES_${PN}-dev =3D "libqwt-dev"
\ No newline at end of file
diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb b/meta-oe/recipes-qt/q=
wt/qwt-e_6.0.1.bb
new file mode 100644
index 0000000..7f0e43b
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
@@ -0,0 +1,8 @@
+inherit qt4e
+
+require qwt.inc
+
+SRC_URI[qwt.md5sum] =3D "ace68558eab873e2da7e641179c4ef0c"
+SRC_URI[qwt.sha256sum] =3D "3fe19dd5962d705632fc2ef616b009299de6cf1e7025=
38296924dbfdc8003cb2"
+
+RPROVIDES_${PN}-dev =3D "libqwt-dev"
diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.=
inc
index 7112336..a299ac8 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -5,15 +5,17 @@ SECTION =3D "libs"
 LICENSE =3D "QWTv1.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddac2743472b0462ff3cfb4af42051=
c88"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=3Dqwt"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=3Dqwt \
+	file://qwt6.patch \
+	"
=20
 S =3D "${WORKDIR}/qwt-${PV}"
=20
 do_configure_prepend() {
 	sed -i -e 's:RELEASE_SUFFIX      =3D :RELEASE_SUFFIX      =3D ${QT_LIBI=
NFIX}:' *.pri
-	sed -i -e s:lqwt:lqwt${QT_LIBINFIX}:g -e s:/usr/local/qwt-$\${QwtVersio=
n}:${prefix}:g *.prf
-	sed -e 's/#CONFIG     +=3D QwtExamples/CONFIG     +=3D QwtExamples/g' -=
i qwtconfig.pri
-	sed -i -e s:/usr/local/qwt-${PV}:${D}${prefix}:g ${S}/*.pri
+	sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' *.prf
+	sed -e 's/# QWT_CONFIG     +=3D QwtExamples/QWT_CONFIG     +=3D QwtExam=
ples/g' -i qwtconfig.pri
+	sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*.pri
 }
=20
 do_install() {
diff --git a/meta-oe/recipes-qt/qwt/qwt_5.2.1.bb b/meta-oe/recipes-qt/qwt=
/qwt_5.2.1.bb
deleted file mode 100644
index ea7b3d7..0000000
--- a/meta-oe/recipes-qt/qwt/qwt_5.2.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit qt4x11
-
-require qwt.inc
-
-SRC_URI[qwt.md5sum] =3D "4a595b8db0ec3856b117836c1d60cb27"
-SRC_URI[qwt.sha256sum] =3D "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fb=
e88524eb698e11ac569f"
-
-RPROVIDES_${PN}-dev =3D "libqwt-dev"
diff --git a/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb b/meta-oe/recipes-qt/qwt=
/qwt_6.0.1.bb
new file mode 100644
index 0000000..e7eb7b7
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb
@@ -0,0 +1,8 @@
+inherit qt4x11
+
+require qwt.inc
+
+SRC_URI[qwt.md5sum] =3D "ace68558eab873e2da7e641179c4ef0c"
+SRC_URI[qwt.sha256sum] =3D "3fe19dd5962d705632fc2ef616b009299de6cf1e7025=
38296924dbfdc8003cb2"
+
+RPROVIDES_${PN}-dev =3D "libqwt-dev"
--=20
1.7.7.6



