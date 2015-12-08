Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6924C6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Dec 2015 13:51:52 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so181785674wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2015 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=pOrFzUWNAAJOm73h7Rp381LFiylsjuYECFA0Wvh6ySY=;
	b=f7pn/7nmMwTErw9eAXSD4luuyCoqz/Vgzi2bUx1bcc3U4zViz1nGxqybblSbVN6vnn
	QJhFy3NiR8CVhaypvvCtIcqzh8Ve6SM5Hc9ApNWbj5mORwp+rayG9iG2VILuu5E/vuu4
	bYhUr34O1uw/aPX6s1b7WulHr/HJlPNLVLkunmYmoVK5yvjZqkalC2MOU3Ig7A9BrA86
	dGYzpPJZXWWG3nuYnfWgnYBRwSTWdnxKosfYBqUGWT6sxkhnJ5ayO5rzEK5c/9J5/d/X
	GeOXfeUEUoHlMIQYBxN0qm1JS7u32aRMWZS9lEP1clf8pvx1mcX1m64T8zrIEAI2E4XJ
	P0eA==
X-Received: by 10.194.185.173 with SMTP id fd13mr3967530wjc.54.1449582713245; 
	Tue, 08 Dec 2015 05:51:53 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	z66sm21728091wmz.7.2015.12.08.05.51.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Dec 2015 05:51:52 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.5.2
Date: Tue, 8 Dec 2015 14:51:50 +0100
Message-Id: <21398B79-C7A2-4432-B35A-CD6E29F60784@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH v7 1/2] meta-java: rely on well known bootstrap-path
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
X-List-Received-Date: Tue, 08 Dec 2015 13:51:54 -0000
X-Groupsio-MsgNum: 58941
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A2F5E0F2-39E8-4177-A956-1B11006AA867";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_A2F5E0F2-39E8-4177-A956-1B11006AA867
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Instead of potential circular depending virtual/javac-native (even this
recipe provides such a useable java-native), rely on well known path
via cacao-native to build up to icedtea7-native in reliable manner.

virtual/javac-native should be used by parts not belonging to the =
bootstrap
phase.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 classes/java-bootstrap-components.bbclass               | 7 +++++++
 classes/java-library.bbclass                            | 3 ++-
 recipes-core/ant/ant-native_1.8.1.bb                    | 2 +-
 recipes-core/cacao/cacao_1.6.1.bb                       | 4 +++-
 recipes-core/classpath/classpath.inc                    | 4 ++--
 recipes-core/classpathx/gnujaf_1.1.1.bb                 | 2 +-
 recipes-core/classpathx/gnumail_1.1.2.bb                | 2 +-
 recipes-core/classpathx/inetlib_1.1.1.bb                | 2 +-
 recipes-core/ecj/ecj-bootstrap-native.bb                | 2 +-
 recipes-core/ecj/libecj-bootstrap.inc                   | 2 +-
 recipes-core/icedtea/icedtea7-native.inc                | 2 +-
 recipes-core/jacl/jacl_1.4.1.bb                         | 2 +-
 recipes-core/jakarta-commons/commons-logging_1.1.1.bb   | 2 ++
 recipes-core/jakarta-commons/commons-net_1.4.1.bb       | 2 ++
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb   | 2 +-
 recipes-core/jakarta-libs/bsf_2.4.0.bb                  | 2 +-
 recipes-core/jakarta-libs/log4j1.2_1.2.17.bb            | 2 +-
 recipes-core/jakarta-libs/logkit_1.2.2.bb               | 2 +-
 recipes-core/jakarta-libs/oro_2.0.8.bb                  | 2 +-
 recipes-core/jakarta-libs/poi_3.0.bb                    | 2 +-
 recipes-core/jakarta-libs/regexp_1.5.bb                 | 2 +-
 recipes-core/jamvm/jamvm.inc                            | 4 ++--
 recipes-core/jcraft/jsch_0.1.40.bb                      | 2 +-
 recipes-core/jcraft/jzlib_1.0.7.bb                      | 2 +-
 recipes-core/jdepend/jdepend_2.9.1.bb                   | 2 +-
 recipes-core/jlex/jlex_1.2.6.bb                         | 2 +-
 recipes-core/junit/junit4_4.3.1.bb                      | 4 +---
 recipes-core/junit/junit_3.8.2.bb                       | 2 +-
 recipes-core/rhino/rhino_1.7r4.bb                       | 2 +-
 recipes-core/servlet-api/servlet2.3_4.1.37.bb           | 4 +---
 recipes-core/servlet-api/servlet2.4_5.5.26.bb           | 2 --
 recipes-core/xalan-j/xalan-j_2.7.1.bb                   | 2 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb                | 6 +++---
 recipes-core/xml-commons/jaxp1.3_1.4.01.bb              | 4 +---
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 6 +++---
 recipes-core/xml-commons/xpp2_2.1.10.bb                 | 2 --
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb              | 2 --
 37 files changed, 51 insertions(+), 49 deletions(-)
 create mode 100644 classes/java-bootstrap-components.bbclass

diff --git a/classes/java-bootstrap-components.bbclass =
b/classes/java-bootstrap-components.bbclass
new file mode 100644
index 0000000..76e6b25
--- /dev/null
+++ b/classes/java-bootstrap-components.bbclass
@@ -0,0 +1,7 @@
+# This is to be used by recipes which rely on java-library.bbclass
+# infrastructure and their a *-native recipe are parts of the bootstrap
+# process
+#
+
+DEPENDS_prepend_class-native =3D " ecj-bootstrap-native "
+DEPENDS_prepend_class-target =3D " virtual/javac-native "
diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index 144cd2f..a192f14 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -35,7 +35,8 @@ def java_package_name(d):

 JPN ?=3D "${@java_package_name(d)}"

-DEPENDS_prepend =3D "virtual/javac-native fastjar-native "
+DEPENDS_prepend =3D " fastjar-native "
+DEPENDS_prepend_class-target =3D " virtual/javac-native "

 PACKAGES +=3D "${JPN}"

diff --git a/recipes-core/ant/ant-native_1.8.1.bb =
b/recipes-core/ant/ant-native_1.8.1.bb
index 35b45d6..6cdbc80 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -11,7 +11,7 @@ SRC_URI =3D =
"http://archive.apache.org/dist/ant/source/apache-ant-${PV}-src.tar.gz

 S =3D "${WORKDIR}/apache-ant-${PV}"

-inherit java-library java-native
+inherit java-library java-native java-bootstrap-components

 DEPENDS =3D " \
 	jsch-native bsf-native xalan-j-native xerces-j-native \
diff --git a/recipes-core/cacao/cacao_1.6.1.bb =
b/recipes-core/cacao/cacao_1.6.1.bb
index 8e212af..a8c1f19 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -7,7 +7,9 @@ SECTION  =3D "interpreters"
 DEPENDS_class-native =3D "zlib-native libtool-native ecj-initial-native =
fastjar-native classpath-native bdwgc-native"
 PROVIDES_class-native =3D "virtual/java-native"

-DEPENDS =3D "zlib libtool classpath virtual/javac-native bdwgc"
+DEPENDS_class-target =3D " virtual/javac-native "
+
+DEPENDS =3D "zlib libtool classpath bdwgc"
 RPROVIDES_${PN} =3D "java2-runtime"

 SRC_URI =3D =
"http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV=
}.tar.xz \
diff --git a/recipes-core/classpath/classpath.inc =
b/recipes-core/classpath/classpath.inc
index 1bdfd78..c56c0c3 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -7,9 +7,9 @@ LICENSE =3D "Classpath"

 PBN =3D "classpath"

-inherit autotools java gettext
+inherit autotools java gettext java-bootstrap-components

-DEPENDS =3D "virtual/javac-native fastjar-native zip-native gmp =
antlr-native gtk+ gconf libxtst file"
+DEPENDS =3D " fastjar-native zip-native gmp antlr-native gtk+ gconf =
libxtst file"

 RPROVIDES_${PN} =3D ""

diff --git a/recipes-core/classpathx/gnujaf_1.1.1.bb =
b/recipes-core/classpathx/gnujaf_1.1.1.bb
index 0bd8b57..5520ef7 100644
--- a/recipes-core/classpathx/gnujaf_1.1.1.bb
+++ b/recipes-core/classpathx/gnujaf_1.1.1.bb
@@ -10,7 +10,7 @@ SRC_URI =3D =
"http://ftp.gnu.org/gnu/classpathx/activation-${PV}.tar.gz \
            file://MimeType-symbols-fix.patch \
           "

-inherit java-library
+inherit java-library java-bootstrap-components

 S =3D "${WORKDIR}/activation-${PV}"

diff --git a/recipes-core/classpathx/gnumail_1.1.2.bb =
b/recipes-core/classpathx/gnumail_1.1.2.bb
index 5e81a45..41417c0 100644
--- a/recipes-core/classpathx/gnumail_1.1.2.bb
+++ b/recipes-core/classpathx/gnumail_1.1.2.bb
@@ -8,7 +8,7 @@ SRC_URI =3D =
"http://ftp.gnu.org/gnu/classpathx/mail-${PV}.tar.gz \
            file://datadir_java.patch \
           "

-inherit java-library autotools
+inherit java-library java-bootstrap-components autotools

 S =3D "${WORKDIR}/mail-${PV}"

diff --git a/recipes-core/classpathx/inetlib_1.1.1.bb =
b/recipes-core/classpathx/inetlib_1.1.1.bb
index f078e33..3b3f299 100644
--- a/recipes-core/classpathx/inetlib_1.1.1.bb
+++ b/recipes-core/classpathx/inetlib_1.1.1.bb
@@ -9,7 +9,7 @@ SRC_URI =3D =
"http://ftp.gnu.org/gnu/classpath/${BP}.tar.gz \
            file://datadir_java.patch \
           "

-inherit java-library autotools
+inherit java-library java-bootstrap-components autotools

 JPN =3D "libgnuinet-java"

diff --git a/recipes-core/ecj/ecj-bootstrap-native.bb =
b/recipes-core/ecj/ecj-bootstrap-native.bb
index e159c9d..a4a1c17 100644
--- a/recipes-core/ecj/ecj-bootstrap-native.bb
+++ b/recipes-core/ecj/ecj-bootstrap-native.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d
                    "
 PR =3D "r1"

-DEPENDS =3D "libecj-bootstrap-native virtual/java-native"
+DEPENDS =3D "libecj-bootstrap-native cacao-native"

 PROVIDES =3D "virtual/javac-native"

diff --git a/recipes-core/ecj/libecj-bootstrap.inc =
b/recipes-core/ecj/libecj-bootstrap.inc
index 020b8d3..a634a31 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.eclipse.org/"
 LICENSE =3D "EPL-1.0"
 LIC_FILES_CHKSUM =3D =
"file://${COMMON_LICENSE_DIR}/EPL-1.0;md5=3D57f8d5e2b3e98ac6e088986c12bf94=
e6"

-DEPENDS =3D "fastjar-native jikes-initial-native =
virtual/java-initial-native"
+DEPENDS =3D "fastjar-native jikes-initial-native cacao-initial-native"

 INC_PR =3D "r5"

diff --git a/recipes-core/icedtea/icedtea7-native.inc =
b/recipes-core/icedtea/icedtea7-native.inc
index 43385e9..279700b 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://icedtea.classpath.org"
 LICENSE  =3D "GPL-2.0-with-classpath-exception"
 INC_PR =3D "r1"

-DEPENDS =3D "virtual/javac-native virtual/java-native classpath-native =
\
+DEPENDS =3D "fastjar-native cacao-native classpath-native \
            rhino-native ant-native libxslt-native attr-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
diff --git a/recipes-core/jacl/jacl_1.4.1.bb =
b/recipes-core/jacl/jacl_1.4.1.bb
index b413719..f9808ca 100644
--- a/recipes-core/jacl/jacl_1.4.1.bb
+++ b/recipes-core/jacl/jacl_1.4.1.bb
@@ -10,7 +10,7 @@ HOMEPAGE =3D "http://sourceforge.net/projects/tcljava"

 SRC_URI =3D "http://downloads.sourceforge.net/tcljava/jacl${PV}.tar.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 S =3D "${WORKDIR}/jacl${PV}"

diff --git a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb =
b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
index b3b508a..8b1efe0 100644
--- a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
+++ b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
@@ -1,5 +1,7 @@
 require jakarta-commons.inc

+inherit java-bootstrap-components
+
 PR =3D "${INC_PR}.1"

 DESCRIPTION =3D "Java Internet protocol suite library"
diff --git a/recipes-core/jakarta-commons/commons-net_1.4.1.bb =
b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
index 275ebb9..7c03b82 100644
--- a/recipes-core/jakarta-commons/commons-net_1.4.1.bb
+++ b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
@@ -1,5 +1,7 @@
 require jakarta-commons.inc

+inherit java-bootstrap-components
+
 PR =3D "${INC_PR}.1"

 DESCRIPTION =3D "Java Internet protocol suite library"
diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb =
b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
index 081cfe7..2e2bb59 100644
--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
@@ -9,7 +9,7 @@ SRC_URI =3D " \
 	   =
http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.g=
z;name=3Dlogkit \
 	  "

-inherit java-library
+inherit java-library java-bootstrap-components

 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jakarta-libs/bsf_2.4.0.bb =
b/recipes-core/jakarta-libs/bsf_2.4.0.bb
index 0213004..e23503c 100644
--- a/recipes-core/jakarta-libs/bsf_2.4.0.bb
+++ b/recipes-core/jakarta-libs/bsf_2.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3Db1e01b26bacfc2232046c90a330332b3"

 SRC_URI =3D =
"http://archive.apache.org/dist/jakarta/bsf/source/bsf-src-${PV}.tar.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 DEPENDS =3D "jacl commons-logging rhino xalan-j bcel"
 DEPENDS_virtclass-native =3D "jacl-native commons-logging-native =
rhino-native xalan-j-native bcel-native"
diff --git a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb =
b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
index b4ccd2c..50ef4a2 100644
--- a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
+++ b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
@@ -7,7 +7,7 @@ PR =3D "r2"

 SRC_URI =3D =
"http://archive.apache.org/dist/logging/log4j/${PV}/log4j-${PV}.tar.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 DEPENDS =3D "gnumail gnujaf"
 DEPENDS_virtclass-native =3D "gnumail-native gnujaf-native"
diff --git a/recipes-core/jakarta-libs/logkit_1.2.2.bb =
b/recipes-core/jakarta-libs/logkit_1.2.2.bb
index c3b612b..24fdfac 100644
--- a/recipes-core/jakarta-libs/logkit_1.2.2.bb
+++ b/recipes-core/jakarta-libs/logkit_1.2.2.bb
@@ -6,7 +6,7 @@ PR =3D "r1"

 SRC_URI =3D =
"http://archive.apache.org/dist/avalon/logkit/source/${BP}-src.tar.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 S =3D "${WORKDIR}/${BP}-dev"

diff --git a/recipes-core/jakarta-libs/oro_2.0.8.bb =
b/recipes-core/jakarta-libs/oro_2.0.8.bb
index 0a7fba3..308eb55 100644
--- a/recipes-core/jakarta-libs/oro_2.0.8.bb
+++ b/recipes-core/jakarta-libs/oro_2.0.8.bb
@@ -6,7 +6,7 @@ PR =3D "r1"

 SRC_URI =3D =
"http://archive.apache.org/dist/jakarta/oro/source/jakarta-${BP}.tar.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 S =3D "${WORKDIR}/jakarta-${BP}"

diff --git a/recipes-core/jakarta-libs/poi_3.0.bb =
b/recipes-core/jakarta-libs/poi_3.0.bb
index f9178f2..55279c1 100644
--- a/recipes-core/jakarta-libs/poi_3.0.bb
+++ b/recipes-core/jakarta-libs/poi_3.0.bb
@@ -9,7 +9,7 @@ S =3D "${WORKDIR}/${BPN}-3.0-rc4"

 inherit java-library

-DEPENDS =3D "fastjar-native commons-collections3 commons-logging =
commons-lang commons-beanutils log4j1.2 xalan-j"
+DEPENDS =3D "commons-collections3 commons-logging commons-lang =
commons-beanutils log4j1.2 xalan-j"

 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jakarta-libs/regexp_1.5.bb =
b/recipes-core/jakarta-libs/regexp_1.5.bb
index ce6150c..d482e4a 100644
--- a/recipes-core/jakarta-libs/regexp_1.5.bb
+++ b/recipes-core/jakarta-libs/regexp_1.5.bb
@@ -6,7 +6,7 @@ PR =3D "r1"

 SRC_URI =3D =
"http://archive.apache.org/dist/jakarta/regexp/source/jakarta-${BP}.tar.gz=
"

-inherit java-library
+inherit java-library java-bootstrap-components

 S =3D "${WORKDIR}/jakarta-${BP}"

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 5893cbc..6480225 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://jamvm.sourceforge.net/"
 LICENSE =3D "GPL-2.0"
 LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3"

-DEPENDS =3D "zlib classpath virtual/javac-native libffi"
+DEPENDS =3D "zlib classpath libffi"
 DEPENDS_virtclass-native =3D "zlib-native classpath-native =
ecj-initial-native libffi-native"

 RDEPENDS_${PN} =3D "classpath"
@@ -21,7 +21,7 @@ SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
           "


-inherit java autotools update-alternatives pkgconfig
+inherit java autotools update-alternatives pkgconfig =
java-bootstrap-components

 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET =3D "arm"
diff --git a/recipes-core/jcraft/jsch_0.1.40.bb =
b/recipes-core/jcraft/jsch_0.1.40.bb
index 337a8eb..d22eb0a 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3D55e3b6a0987ccd0c34530f3df2d206ae"

 SRC_URI =3D "${SOURCEFORGE_MIRROR}/jsch/jsch-${PV}.zip"

-inherit java-library
+inherit java-library java-bootstrap-components

 DEPENDS =3D "jzlib"
 DEPENDS_virtclass-native =3D "jzlib-native"
diff --git a/recipes-core/jcraft/jzlib_1.0.7.bb =
b/recipes-core/jcraft/jzlib_1.0.7.bb
index b6f3f64..79fc4d4 100644
--- a/recipes-core/jcraft/jzlib_1.0.7.bb
+++ b/recipes-core/jcraft/jzlib_1.0.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE =3D "http://www.jcraft.com/jzlib"

 SRC_URI =3D "http://www.jcraft.com/jzlib/jzlib-${PV}.tar.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb =
b/recipes-core/jdepend/jdepend_2.9.1.bb
index 9f74f44..8f41c00 100644
--- a/recipes-core/jdepend/jdepend_2.9.1.bb
+++ b/recipes-core/jdepend/jdepend_2.9.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D =
"http://clarkware.com/software/JDepend.html"

 SRC_URI =3D "http://www.clarkware.com/software/jdepend-${PV}.zip"

-inherit java-library
+inherit java-library java-bootstrap-components

 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jlex/jlex_1.2.6.bb =
b/recipes-core/jlex/jlex_1.2.6.bb
index 4dbe63e..9290fa5 100644
--- a/recipes-core/jlex/jlex_1.2.6.bb
+++ b/recipes-core/jlex/jlex_1.2.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d
 RDEPENDS_${PN} =3D "java2-runtime"
 RDEPENDS_${PN}_virtclass-native =3D ""

-inherit java-library
+inherit java-library java-bootstrap-components

 SRC_URI =3D =
"http://www.cs.princeton.edu/~appel/modern/java/JLex/Archive/${PV}/Main.ja=
va \
            file://jlex \
diff --git a/recipes-core/junit/junit4_4.3.1.bb =
b/recipes-core/junit/junit4_4.3.1.bb
index 1cb8674..8d9dd31 100644
--- a/recipes-core/junit/junit4_4.3.1.bb
+++ b/recipes-core/junit/junit4_4.3.1.bb
@@ -8,9 +8,7 @@ SRC_URI =3D =
"http://downloads.sourceforge.net/junit/junit-${PV}-src.jar"

 S =3D "${WORKDIR}"

-inherit java-library
-
-DEPENDS =3D "fastjar-native"
+inherit java-library java-bootstrap-components

 do_compile() {
   mkdir -p build
diff --git a/recipes-core/junit/junit_3.8.2.bb =
b/recipes-core/junit/junit_3.8.2.bb
index bae022d..54ce9fe 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -11,7 +11,7 @@ S =3D "${WORKDIR}/junit${PV}"

 DEPENDS +=3D "unzip-native"

-inherit java-library
+inherit java-library java-bootstrap-components

 do_unpackpost() {
 	mkdir -p src
diff --git a/recipes-core/rhino/rhino_1.7r4.bb =
b/recipes-core/rhino/rhino_1.7r4.bb
index 7898d23..76c3057 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.txt;md5=3D8e2372bdbf22c99279ae4599a13cc458"

 BBCLASSEXTEND =3D "native"

-inherit java-library
+inherit java-library java-bootstrap-components

 SRC_URI =3D "\
 	https://github.com/downloads/mozilla/rhino/rhino1_7R4.zip \
diff --git a/recipes-core/servlet-api/servlet2.3_4.1.37.bb =
b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
index fbda5c8..f5f6d4a 100644
--- a/recipes-core/servlet-api/servlet2.3_4.1.37.bb
+++ b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
@@ -6,12 +6,10 @@ PR =3D "r1"

 SRC_URI =3D =
"http://archive.apache.org/dist/tomcat/tomcat-4/v${PV}/src/apache-tomcat-$=
{PV}-src.tar.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 S =3D "${WORKDIR}/apache-tomcat-${PV}-src/servletapi"

-DEPENDS =3D "fastjar-native"
-
 # Value of implementation.revision in build.xml
 IMPL_REVISION =3D "1"

diff --git a/recipes-core/servlet-api/servlet2.4_5.5.26.bb =
b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
index b34b23d..7d0feb3 100644
--- a/recipes-core/servlet-api/servlet2.4_5.5.26.bb
+++ b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
@@ -9,8 +9,6 @@ S =3D =
"${WORKDIR}/apache-tomcat-${PV}-src/servletapi/jsr154"

 inherit java-library

-DEPENDS =3D "fastjar-native"
-
 # Value of implementation.revision in build.xml
 IMPL_REVISION =3D "1"

diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb =
b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 317b3c9..16f5396 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "\

 S =3D "${WORKDIR}/${BPN}_2_7_1"

-inherit java-library
+inherit java-library java-bootstrap-components

 JPN =3D "libxalan2-java"

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb =
b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index f9e497e..4130457 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -16,12 +16,12 @@ SRC_URI =3D =
"http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz"

 S =3D "${WORKDIR}/xerces-2_11_0"

-inherit java-library
+inherit java-library java-bootstrap-components

 JPN =3D "libxerces2-java"

-DEPENDS =3D "fastjar-native jaxp1.3 xml-commons-resolver1.1"
-DEPENDS_virtclass-native =3D "fastjar-native jaxp1.3-native =
xml-commons-resolver1.1-native"
+DEPENDS =3D "jaxp1.3 xml-commons-resolver1.1"
+DEPENDS_virtclass-native =3D "jaxp1.3-native =
xml-commons-resolver1.1-native"

 RDEPENDS_${PN} =3D "libjaxp1.3-java libxml-commons-resolver1.1-java"
 RDEPENDS_${PN}_virtclass-native =3D ""
diff --git a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb =
b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
index a6eeb57..765b766 100644
--- a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
+++ b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
@@ -11,9 +11,7 @@ LIC_FILES_CHKSUM =3D " \

 SRC_URI =3D =
"http://archive.apache.org/dist/xml/commons/source/xml-commons-external-${=
PV}-src.tar.gz;subdir=3D${BPN}-${PV}"

-inherit java-library
-
-DEPENDS =3D "fastjar-native"
+inherit java-library java-bootstrap-components

 JARFILENAME =3D "jaxp-1.3.jar"
 ALTJARFILENAMES =3D "xml-apis.jar"
diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb =
b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 5853895..ca1f2f2 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE.resolver.txt;md5=3Dd229da563da18fe5d58cd95a6467

 SRC_URI =3D =
"http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.tar=
.gz"

-inherit java-library
+inherit java-library java-bootstrap-components

 S =3D "${WORKDIR}/xml-commons-resolver-${PV}"

-DEPENDS =3D "fastjar-native jaxp1.3"
-DEPENDS_virtclass-native =3D "fastjar-native jaxp1.3-native"
+DEPENDS =3D "jaxp1.3"
+DEPENDS_virtclass-native =3D "jaxp1.3-native"

 do_unpackpost() {
   find src -exec \
diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb =
b/recipes-core/xml-commons/xpp2_2.1.10.bb
index d3baca4..402d38d 100644
--- a/recipes-core/xml-commons/xpp2_2.1.10.bb
+++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
@@ -9,8 +9,6 @@ S =3D "${WORKDIR}/PullParser${PV}"

 inherit java-library

-DEPENDS =3D "fastjar-native virtual/javac-native"
-
 do_compile() {
     if [ -d build-oe ]; then
         rm -rf build-oe
diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb =
b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index bedb8a9..a472a0d 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -8,8 +8,6 @@ SRC_URI =3D =
"http://www.extreme.indiana.edu/dist/java-repository/xpp3/distribution

 inherit java-library

-DEPENDS =3D "fastjar-native virtual/javac-native"
-
 PACKAGES =3D "libxpp3-xpath-java ${JPN}"

 do_compile() {
--
1.9.1


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_A2F5E0F2-39E8-4177-A956-1B11006AA867
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWZuB2AAoJEESZlq7c5Qqd1DkQAJyJoTWEki09rWG8PK/D4+09
2Re5IqxfJFz0+ydR1yZwWAIuUHJbc+Rtp9iy20vnpwMV/Qus61bo0u1CFHrGymwP
PZBCDavAD3zU0vZS3TGY/2mSOuFY4bvLQ8AjLdUvdFZeiQrbiD71uaybGkWJyi3S
Pq38Pid/PutgLhzd6u+7A4mFWJ4eC6WfWipq7wqBkz/hkqsmDio4F3gSW6Iniq2L
JHR8svfXtMzv0ElHKCQez9zICM8OcjvuSCJ6JJThqHPpjkOE7FzflZSCUnhjbrAb
CBRCTuYoV1TpBzjd+VKFRMOLLUKUnlAGCGl12rjzH+HuwxITsIEYOPs3ex/2pH/I
Prv9LiN4BsGZ82b6of3T3xwLHmVLM48UQ5qOrsSym69Sx8AvIA+faWOWSk+TJVqZ
Wy2+MhXVXhS6H9DQbV2pySx+wA3gCKt53o1pfJ0Uhexi00yEGadsNNtb9jYbV5+H
ue3v07uedDacA9qSKI3sboJWl1xKXOYGJ37Pfenm35VAIfymee65NJrtKOjl/CsN
Gq9ESgEOoku1LFwQLoLFXdODtyWU+fDEXyB1Pkh0RzegaJnLb4/pj39B/TTje9K4
tBfxGuo88WsXw89lgaf573oDhYmrftb1SjfqvKon3bLQHARKmiT9kvanEwL/mrW+
/0gtCdMGkTFkTeyDKuh2
=VAsx
-----END PGP SIGNATURE-----

--Apple-Mail=_A2F5E0F2-39E8-4177-A956-1B11006AA867--
