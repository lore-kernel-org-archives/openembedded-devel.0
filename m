Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60D64731A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:03:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBNA3exf011995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 02:03:40 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Dec 2015 02:03:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Dec 2015 18:03:49 +0800
Message-ID: <cce86f9c366e5655dec588eda81d260582bf8b5d.1450864063.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450864063.git.jackie.huang@windriver.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/2] Revert "meta-java: rely on well known bootstrap-path"
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
X-List-Received-Date: Wed, 23 Dec 2015 10:03:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This reverts commit 04d5d0bf414c05ca59618d77f17ff9898aa1c566.

Detail reason is in the following commit.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 classes/java-bootstrap-components.bbclass               | 7 -------
 classes/java-library.bbclass                            | 3 +--
 recipes-core/ant/ant-native_1.8.1.bb                    | 2 +-
 recipes-core/antlr/antlr_2.7.7.bb                       | 2 +-
 recipes-core/cacao/cacao_1.6.1.bb                       | 4 +---
 recipes-core/classpath/classpath.inc                    | 4 ++--
 recipes-core/classpathx/gnujaf_1.1.1.bb                 | 2 +-
 recipes-core/classpathx/gnumail_1.1.2.bb                | 2 +-
 recipes-core/classpathx/inetlib_1.1.1.bb                | 2 +-
 recipes-core/cup/cup_0.10k.bb                           | 2 +-
 recipes-core/ecj/ecj-bootstrap-native.bb                | 2 +-
 recipes-core/ecj/libecj-bootstrap.inc                   | 2 +-
 recipes-core/icedtea/icedtea7-native.inc                | 2 +-
 recipes-core/jacl/jacl_1.4.1.bb                         | 2 +-
 recipes-core/jakarta-commons/commons-logging_1.1.1.bb   | 2 --
 recipes-core/jakarta-commons/commons-net_1.4.1.bb       | 2 --
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
 recipes-core/junit/junit4_4.3.1.bb                      | 4 +++-
 recipes-core/junit/junit_3.8.2.bb                       | 2 +-
 recipes-core/rhino/rhino_1.7r4.bb                       | 2 +-
 recipes-core/servlet-api/servlet2.3_4.1.37.bb           | 4 +++-
 recipes-core/servlet-api/servlet2.4_5.5.26.bb           | 2 ++
 recipes-core/xalan-j/xalan-j_2.7.1.bb                   | 2 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb                | 6 +++---
 recipes-core/xml-commons/jaxp1.3_1.4.01.bb              | 4 +++-
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 6 +++---
 recipes-core/xml-commons/xpp2_2.1.10.bb                 | 2 ++
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb              | 2 ++
 39 files changed, 51 insertions(+), 53 deletions(-)
 delete mode 100644 classes/java-bootstrap-components.bbclass

diff --git a/classes/java-bootstrap-components.bbclass b/classes/java-bootstrap-components.bbclass
deleted file mode 100644
index 0c62b5b..0000000
--- a/classes/java-bootstrap-components.bbclass
+++ /dev/null
@@ -1,7 +0,0 @@
-# This is to be used by recipes which rely on java-library.bbclass
-# infrastructure and their a *-native recipe are parts of the bootstrap
-# process
-#
-
-DEPENDS_prepend_class-native = " ecj-bootstrap-native "
-DEPENDS_prepend_class-target = " virtual/javac-native "
diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index a192f14..144cd2f 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -35,8 +35,7 @@ def java_package_name(d):
 
 JPN ?= "${@java_package_name(d)}"
 
-DEPENDS_prepend = " fastjar-native "
-DEPENDS_prepend_class-target = " virtual/javac-native "
+DEPENDS_prepend = "virtual/javac-native fastjar-native "
 
 PACKAGES += "${JPN}"
 
diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
index 6cdbc80..35b45d6 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://archive.apache.org/dist/ant/source/apache-ant-${PV}-src.tar.gz
 
 S = "${WORKDIR}/apache-ant-${PV}"
 
-inherit java-library java-native java-bootstrap-components
+inherit java-library java-native
 
 DEPENDS = " \
 	jsch-native bsf-native xalan-j-native xerces-j-native \
diff --git a/recipes-core/antlr/antlr_2.7.7.bb b/recipes-core/antlr/antlr_2.7.7.bb
index cff9535..9d9d2d4 100644
--- a/recipes-core/antlr/antlr_2.7.7.bb
+++ b/recipes-core/antlr/antlr_2.7.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=361934e706423915b4d9f413ad37fb65"
 SRC_URI = "http://www.antlr2.org/download/${BP}.tar.gz"
 SRC_URI_append_class-native = " file://runantlr"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 do_configure_class-native() {
     sed -i -e"s|@JAR_FILE@|${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar|" ${WORKDIR}/runantlr
diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 03ce0cc..ce1ffc2 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -7,9 +7,7 @@ SECTION  = "interpreters"
 DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native bdwgc-native"
 #PROVIDES_class-native = "virtual/java-native"
 
-DEPENDS_append_class-target = " virtual/javac-native "
-
-DEPENDS = "zlib libtool classpath bdwgc"
+DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
 RPROVIDES_${PN} = "java2-runtime"
 
 SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.xz \
diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index c56c0c3..1bdfd78 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -7,9 +7,9 @@ LICENSE = "Classpath"
 
 PBN = "classpath"
 
-inherit autotools java gettext java-bootstrap-components
+inherit autotools java gettext
 
-DEPENDS = " fastjar-native zip-native gmp antlr-native gtk+ gconf libxtst file"
+DEPENDS = "virtual/javac-native fastjar-native zip-native gmp antlr-native gtk+ gconf libxtst file"
 
 RPROVIDES_${PN} = ""
 
diff --git a/recipes-core/classpathx/gnujaf_1.1.1.bb b/recipes-core/classpathx/gnujaf_1.1.1.bb
index 5520ef7..0bd8b57 100644
--- a/recipes-core/classpathx/gnujaf_1.1.1.bb
+++ b/recipes-core/classpathx/gnujaf_1.1.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/classpathx/activation-${PV}.tar.gz \
            file://MimeType-symbols-fix.patch \
           "
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 S = "${WORKDIR}/activation-${PV}"
 
diff --git a/recipes-core/classpathx/gnumail_1.1.2.bb b/recipes-core/classpathx/gnumail_1.1.2.bb
index b498c2b..f5033c5 100644
--- a/recipes-core/classpathx/gnumail_1.1.2.bb
+++ b/recipes-core/classpathx/gnumail_1.1.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/classpathx/mail-${PV}.tar.gz \
            file://fix_makefile_race_condition.patch \
           "
 
-inherit java-library java-bootstrap-components autotools
+inherit java-library autotools
 
 S = "${WORKDIR}/mail-${PV}"
 
diff --git a/recipes-core/classpathx/inetlib_1.1.1.bb b/recipes-core/classpathx/inetlib_1.1.1.bb
index 3b3f299..f078e33 100644
--- a/recipes-core/classpathx/inetlib_1.1.1.bb
+++ b/recipes-core/classpathx/inetlib_1.1.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/classpath/${BP}.tar.gz \
            file://datadir_java.patch \
           "
 
-inherit java-library java-bootstrap-components autotools
+inherit java-library autotools
 
 JPN = "libgnuinet-java"
 
diff --git a/recipes-core/cup/cup_0.10k.bb b/recipes-core/cup/cup_0.10k.bb
index f2f254e..2a957f9 100644
--- a/recipes-core/cup/cup_0.10k.bb
+++ b/recipes-core/cup/cup_0.10k.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=2c9db91c00f38e52cfc8e67bafaa7c
 RDEPENDS_${PN} = "java2-runtime"
 RDEPENDS_${PN}_virtclass-native = ""
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 SRC_URI = "http://www.cs.princeton.edu/~appel/modern/java/CUP/java_${BPN}_v10k.tar.gz \
 	   file://cup \
diff --git a/recipes-core/ecj/ecj-bootstrap-native.bb b/recipes-core/ecj/ecj-bootstrap-native.bb
index 28414c2..94ce6aa 100644
--- a/recipes-core/ecj/ecj-bootstrap-native.bb
+++ b/recipes-core/ecj/ecj-bootstrap-native.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
                    "
 PR = "r1"
 
-DEPENDS = "libecj-bootstrap-native cacao-native"
+DEPENDS = "libecj-bootstrap-native virtual/java-native"
 
 SRC_URI = "file://ecj.in"
 
diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
index a634a31..020b8d3 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.eclipse.org/"
 LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/EPL-1.0;md5=57f8d5e2b3e98ac6e088986c12bf94e6"
 
-DEPENDS = "fastjar-native jikes-initial-native cacao-initial-native"
+DEPENDS = "fastjar-native jikes-initial-native virtual/java-initial-native"
 
 INC_PR = "r5"
 
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 279700b..43385e9 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://icedtea.classpath.org"
 LICENSE  = "GPL-2.0-with-classpath-exception"
 INC_PR = "r1"
 
-DEPENDS = "fastjar-native cacao-native classpath-native \
+DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
            rhino-native ant-native libxslt-native attr-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
diff --git a/recipes-core/jacl/jacl_1.4.1.bb b/recipes-core/jacl/jacl_1.4.1.bb
index f9808ca..b413719 100644
--- a/recipes-core/jacl/jacl_1.4.1.bb
+++ b/recipes-core/jacl/jacl_1.4.1.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://sourceforge.net/projects/tcljava"
 
 SRC_URI = "http://downloads.sourceforge.net/tcljava/jacl${PV}.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 S = "${WORKDIR}/jacl${PV}"
 
diff --git a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
index 8b1efe0..b3b508a 100644
--- a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
+++ b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
@@ -1,7 +1,5 @@
 require jakarta-commons.inc
 
-inherit java-bootstrap-components
-
 PR = "${INC_PR}.1"
 
 DESCRIPTION = "Java Internet protocol suite library"
diff --git a/recipes-core/jakarta-commons/commons-net_1.4.1.bb b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
index 7c03b82..275ebb9 100644
--- a/recipes-core/jakarta-commons/commons-net_1.4.1.bb
+++ b/recipes-core/jakarta-commons/commons-net_1.4.1.bb
@@ -1,7 +1,5 @@
 require jakarta-commons.inc
 
-inherit java-bootstrap-components
-
 PR = "${INC_PR}.1"
 
 DESCRIPTION = "Java Internet protocol suite library"
diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
index 2e2bb59..081cfe7 100644
--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
 	   http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	  "
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jakarta-libs/bsf_2.4.0.bb b/recipes-core/jakarta-libs/bsf_2.4.0.bb
index e23503c..0213004 100644
--- a/recipes-core/jakarta-libs/bsf_2.4.0.bb
+++ b/recipes-core/jakarta-libs/bsf_2.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1e01b26bacfc2232046c90a330332b3"
 
 SRC_URI = "http://archive.apache.org/dist/jakarta/bsf/source/bsf-src-${PV}.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 DEPENDS = "jacl commons-logging rhino xalan-j bcel"
 DEPENDS_virtclass-native = "jacl-native commons-logging-native rhino-native xalan-j-native bcel-native"
diff --git a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
index 50ef4a2..b4ccd2c 100644
--- a/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
+++ b/recipes-core/jakarta-libs/log4j1.2_1.2.17.bb
@@ -7,7 +7,7 @@ PR = "r2"
 
 SRC_URI = "http://archive.apache.org/dist/logging/log4j/${PV}/log4j-${PV}.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 DEPENDS = "gnumail gnujaf"
 DEPENDS_virtclass-native = "gnumail-native gnujaf-native"
diff --git a/recipes-core/jakarta-libs/logkit_1.2.2.bb b/recipes-core/jakarta-libs/logkit_1.2.2.bb
index 24fdfac..c3b612b 100644
--- a/recipes-core/jakarta-libs/logkit_1.2.2.bb
+++ b/recipes-core/jakarta-libs/logkit_1.2.2.bb
@@ -6,7 +6,7 @@ PR = "r1"
 
 SRC_URI = "http://archive.apache.org/dist/avalon/logkit/source/${BP}-src.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 S = "${WORKDIR}/${BP}-dev"
 
diff --git a/recipes-core/jakarta-libs/oro_2.0.8.bb b/recipes-core/jakarta-libs/oro_2.0.8.bb
index 308eb55..0a7fba3 100644
--- a/recipes-core/jakarta-libs/oro_2.0.8.bb
+++ b/recipes-core/jakarta-libs/oro_2.0.8.bb
@@ -6,7 +6,7 @@ PR = "r1"
 
 SRC_URI = "http://archive.apache.org/dist/jakarta/oro/source/jakarta-${BP}.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 S = "${WORKDIR}/jakarta-${BP}"
 
diff --git a/recipes-core/jakarta-libs/poi_3.0.bb b/recipes-core/jakarta-libs/poi_3.0.bb
index 55279c1..f9178f2 100644
--- a/recipes-core/jakarta-libs/poi_3.0.bb
+++ b/recipes-core/jakarta-libs/poi_3.0.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/${BPN}-3.0-rc4"
 
 inherit java-library
 
-DEPENDS = "commons-collections3 commons-logging commons-lang commons-beanutils log4j1.2 xalan-j"
+DEPENDS = "fastjar-native commons-collections3 commons-logging commons-lang commons-beanutils log4j1.2 xalan-j"
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jakarta-libs/regexp_1.5.bb b/recipes-core/jakarta-libs/regexp_1.5.bb
index d482e4a..ce6150c 100644
--- a/recipes-core/jakarta-libs/regexp_1.5.bb
+++ b/recipes-core/jakarta-libs/regexp_1.5.bb
@@ -6,7 +6,7 @@ PR = "r1"
 
 SRC_URI = "http://archive.apache.org/dist/jakarta/regexp/source/jakarta-${BP}.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 S = "${WORKDIR}/jakarta-${BP}"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 6480225..5893cbc 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS = "zlib classpath libffi"
+DEPENDS = "zlib classpath virtual/javac-native libffi"
 DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial-native libffi-native"
 
 RDEPENDS_${PN} = "classpath"
@@ -21,7 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
           "
 
 
-inherit java autotools update-alternatives pkgconfig java-bootstrap-components
+inherit java autotools update-alternatives pkgconfig
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes-core/jcraft/jsch_0.1.40.bb b/recipes-core/jcraft/jsch_0.1.40.bb
index d22eb0a..337a8eb 100644
--- a/recipes-core/jcraft/jsch_0.1.40.bb
+++ b/recipes-core/jcraft/jsch_0.1.40.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=55e3b6a0987ccd0c34530f3df2d206ae"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/jsch/jsch-${PV}.zip"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 DEPENDS = "jzlib"
 DEPENDS_virtclass-native = "jzlib-native"
diff --git a/recipes-core/jcraft/jzlib_1.0.7.bb b/recipes-core/jcraft/jzlib_1.0.7.bb
index 79fc4d4..b6f3f64 100644
--- a/recipes-core/jcraft/jzlib_1.0.7.bb
+++ b/recipes-core/jcraft/jzlib_1.0.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.jcraft.com/jzlib"
 
 SRC_URI = "http://www.jcraft.com/jzlib/jzlib-${PV}.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend/jdepend_2.9.1.bb
index 8f41c00..9f74f44 100644
--- a/recipes-core/jdepend/jdepend_2.9.1.bb
+++ b/recipes-core/jdepend/jdepend_2.9.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://clarkware.com/software/JDepend.html"
 
 SRC_URI = "http://www.clarkware.com/software/jdepend-${PV}.zip"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/jlex/jlex_1.2.6.bb b/recipes-core/jlex/jlex_1.2.6.bb
index 9290fa5..4dbe63e 100644
--- a/recipes-core/jlex/jlex_1.2.6.bb
+++ b/recipes-core/jlex/jlex_1.2.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 RDEPENDS_${PN} = "java2-runtime"
 RDEPENDS_${PN}_virtclass-native = ""
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 SRC_URI = "http://www.cs.princeton.edu/~appel/modern/java/JLex/Archive/${PV}/Main.java \
            file://jlex \
diff --git a/recipes-core/junit/junit4_4.3.1.bb b/recipes-core/junit/junit4_4.3.1.bb
index 8d9dd31..1cb8674 100644
--- a/recipes-core/junit/junit4_4.3.1.bb
+++ b/recipes-core/junit/junit4_4.3.1.bb
@@ -8,7 +8,9 @@ SRC_URI = "http://downloads.sourceforge.net/junit/junit-${PV}-src.jar"
 
 S = "${WORKDIR}"
 
-inherit java-library java-bootstrap-components
+inherit java-library
+
+DEPENDS = "fastjar-native"
 
 do_compile() {
   mkdir -p build
diff --git a/recipes-core/junit/junit_3.8.2.bb b/recipes-core/junit/junit_3.8.2.bb
index 54ce9fe..bae022d 100644
--- a/recipes-core/junit/junit_3.8.2.bb
+++ b/recipes-core/junit/junit_3.8.2.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/junit${PV}"
 
 DEPENDS += "unzip-native"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 do_unpackpost() {
 	mkdir -p src
diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
index 76c3057..7898d23 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e2372bdbf22c99279ae4599a13cc458"
 
 BBCLASSEXTEND = "native"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 SRC_URI = "\
 	https://github.com/downloads/mozilla/rhino/rhino1_7R4.zip \
diff --git a/recipes-core/servlet-api/servlet2.3_4.1.37.bb b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
index f5f6d4a..fbda5c8 100644
--- a/recipes-core/servlet-api/servlet2.3_4.1.37.bb
+++ b/recipes-core/servlet-api/servlet2.3_4.1.37.bb
@@ -6,10 +6,12 @@ PR = "r1"
 
 SRC_URI = "http://archive.apache.org/dist/tomcat/tomcat-4/v${PV}/src/apache-tomcat-${PV}-src.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 S = "${WORKDIR}/apache-tomcat-${PV}-src/servletapi"
 
+DEPENDS = "fastjar-native"
+
 # Value of implementation.revision in build.xml
 IMPL_REVISION = "1"
 
diff --git a/recipes-core/servlet-api/servlet2.4_5.5.26.bb b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
index 7d0feb3..b34b23d 100644
--- a/recipes-core/servlet-api/servlet2.4_5.5.26.bb
+++ b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
@@ -9,6 +9,8 @@ S = "${WORKDIR}/apache-tomcat-${PV}-src/servletapi/jsr154"
 
 inherit java-library
 
+DEPENDS = "fastjar-native"
+
 # Value of implementation.revision in build.xml
 IMPL_REVISION = "1"
 
diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 16f5396..317b3c9 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 
 S = "${WORKDIR}/${BPN}_2_7_1"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 JPN = "libxalan2-java"
 
diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index 4130457..f9e497e 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -16,12 +16,12 @@ SRC_URI = "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz"
 
 S = "${WORKDIR}/xerces-2_11_0"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 JPN = "libxerces2-java"
 
-DEPENDS = "jaxp1.3 xml-commons-resolver1.1"
-DEPENDS_virtclass-native = "jaxp1.3-native xml-commons-resolver1.1-native"
+DEPENDS = "fastjar-native jaxp1.3 xml-commons-resolver1.1"
+DEPENDS_virtclass-native = "fastjar-native jaxp1.3-native xml-commons-resolver1.1-native"
 
 RDEPENDS_${PN} = "libjaxp1.3-java libxml-commons-resolver1.1-java"
 RDEPENDS_${PN}_virtclass-native = ""
diff --git a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
index 765b766..a6eeb57 100644
--- a/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
+++ b/recipes-core/xml-commons/jaxp1.3_1.4.01.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "http://archive.apache.org/dist/xml/commons/source/xml-commons-external-${PV}-src.tar.gz;subdir=${BPN}-${PV}"
 
-inherit java-library java-bootstrap-components
+inherit java-library
+
+DEPENDS = "fastjar-native"
 
 JARFILENAME = "jaxp-1.3.jar"
 ALTJARFILENAMES = "xml-apis.jar"
diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index ca1f2f2..5853895 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.resolver.txt;md5=d229da563da18fe5d58cd95a6467
 
 SRC_URI = "http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.tar.gz"
 
-inherit java-library java-bootstrap-components
+inherit java-library
 
 S = "${WORKDIR}/xml-commons-resolver-${PV}"
 
-DEPENDS = "jaxp1.3"
-DEPENDS_virtclass-native = "jaxp1.3-native"
+DEPENDS = "fastjar-native jaxp1.3"
+DEPENDS_virtclass-native = "fastjar-native jaxp1.3-native"
 
 do_unpackpost() {
   find src -exec \
diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb b/recipes-core/xml-commons/xpp2_2.1.10.bb
index 402d38d..d3baca4 100644
--- a/recipes-core/xml-commons/xpp2_2.1.10.bb
+++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
@@ -9,6 +9,8 @@ S = "${WORKDIR}/PullParser${PV}"
 
 inherit java-library
 
+DEPENDS = "fastjar-native virtual/javac-native"
+
 do_compile() {
     if [ -d build-oe ]; then
         rm -rf build-oe
diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index a472a0d..bedb8a9 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://www.extreme.indiana.edu/dist/java-repository/xpp3/distribution
 
 inherit java-library
 
+DEPENDS = "fastjar-native virtual/javac-native"
+
 PACKAGES = "libxpp3-xpath-java ${JPN}"
 
 do_compile() {
-- 
1.9.1


