Return-Path: <prvs=73859fb85=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id D6A0D75894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 09:37:36 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: As4PAOM5M1asEApK/2dsb2JhbABehA5vBqp5iwmFB4YJFwqFeIICAQEBAQEBgQuFBwEtKIEWDgWINQi4bwGLSAEBCAIhhneMPwxCgTEFh0WFVokohR2KKYcPkwqCdRyBV3EBhHaBBwEBAQ
X-IPAS-Result: As4PAOM5M1asEApK/2dsb2JhbABehA5vBqp5iwmFB4YJFwqFeIICAQEBAQEBgQuFBwEtKIEWDgWINQi4bwGLSAEBCAIhhneMPwxCgTEFh0WFVokohR2KKYcPkwqCdRyBV3EBhHaBBwEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Oct 2015 10:36:28 +0100
Message-ID: <1446197789-5739-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Subject: [meta-java][PATCH 1/2] openjdk-7: remove openjdk-7-release-*.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 09:37:37 -0000
Content-Type: text/plain

Due to the fact we will always support only one OpenJDK 7 version the
openjdk-7-release-*.inc is not needed. Therefore remove this file and
split it content to openjdk-7_*.bb and openjdk-7-common.inc.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc        | 34 +++++++++++++
 recipes-core/openjdk/openjdk-7-release-91b01.inc | 65 ------------------------
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb    | 33 +++++++++++-
 3 files changed, 66 insertions(+), 66 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-7-release-91b01.inc

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index db47af4..059e1c8 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -308,6 +308,40 @@ RDEPENDS_${JDKPN}-jdk = "${JDKPN}-jre"
 
 FILES_${JDKPN}-doc = "${JDK_HOME}/man"
 
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+# Force arm mode for now
+ARM_INSTRUCTION_SET_armv4t = "ARM"
+
+ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+
+ICEDTEA_PREFIX = "icedtea7-forest-2.6"
+ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
+
+OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
+
+HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
+#HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+HOTSPOT_URI = "http://icedtea.classpath.org/hg/icedtea7-forest/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+
+CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+
+JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+
+JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+
+JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
+JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+
+LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+
 require openjdk-postinst.inc
 
 ALTERNATIVE_PRIORITY = "50"
diff --git a/recipes-core/openjdk/openjdk-7-release-91b01.inc b/recipes-core/openjdk/openjdk-7-release-91b01.inc
deleted file mode 100644
index 19e640f..0000000
--- a/recipes-core/openjdk/openjdk-7-release-91b01.inc
+++ /dev/null
@@ -1,65 +0,0 @@
-require openjdk-7-common.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
-
-# Name of the directory containing the compiled output
-BUILD_DIR = "openjdk.build"
-BUILD_DIR_ECJ = "openjdk.build-ecj"
-
-# Force arm mode for now
-ARM_INSTRUCTION_SET_armv4t = "ARM"
-
-ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
-
-ICEDTEA_PREFIX = "icedtea7-forest-2.6"
-ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
-
-OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
-OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
-
-HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
-#HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
-HOTSPOT_URI = "http://icedtea.classpath.org/hg/icedtea7-forest/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
-
-CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
-CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
-
-JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
-JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
-
-JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
-JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
-
-JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
-JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
-
-LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
-LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
-
-# Split up patches to allow overriding them separately
-OEPATCHES = "\
-	file://build-hacks.patch \
-	file://fix_hotspot_crosscompile.patch \
-	"
-
-ICEDTEAPATCHES = "\
-	file://icedtea-zero-hotspotfix.patch;apply=no \
-	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
-	file://icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch;apply=no \
-	file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
-	file://icedtea-crosscompile-fix.patch;apply=no \
-	file://icedtea-xawt-crosscompile-fix.patch;apply=no \
-	"
-
-DISTRIBUTION_PATCHES = "\
-	patches/icedtea-zero-hotspotfix.patch \
-	patches/icedtea-jdk-nio-use-host-cc.patch \
-	patches/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch \
-	patches/icedtea-jdk-rmi-crosscompile.patch \
-	patches/icedtea-crosscompile-fix.patch \
-	patches/icedtea-xawt-crosscompile-fix.patch \
-	"
-
-export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
index df91e4d..92613a2 100644
--- a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -1,4 +1,8 @@
-require openjdk-7-release-91b01.inc
+require openjdk-7-common.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
 
 inherit distro_features_check
 
@@ -37,3 +41,30 @@ SRC_URI[openjdk.sha256sum] = "c1e6924bddff0ddec318364c60f4e0843c1186a0aa9911ce6c
 HOTSPOT_CHANGESET = "3f1b4a1fe4a2"
 SRC_URI[hotspot.md5sum] = "106b2ec0a8798fbe07f3d838568bd0d8"
 SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055aff9795dd36a85"
+
+###############################################################################
+# PATCHES - split up to allow overriding them separately
+OEPATCHES = "\
+	file://build-hacks.patch \
+	file://fix_hotspot_crosscompile.patch \
+	"
+
+ICEDTEAPATCHES = "\
+	file://icedtea-zero-hotspotfix.patch;apply=no \
+	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
+	file://icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch;apply=no \
+	file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
+	file://icedtea-crosscompile-fix.patch;apply=no \
+	file://icedtea-xawt-crosscompile-fix.patch;apply=no \
+	"
+
+DISTRIBUTION_PATCHES = "\
+	patches/icedtea-zero-hotspotfix.patch \
+	patches/icedtea-jdk-nio-use-host-cc.patch \
+	patches/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch \
+	patches/icedtea-jdk-rmi-crosscompile.patch \
+	patches/icedtea-crosscompile-fix.patch \
+	patches/icedtea-xawt-crosscompile-fix.patch \
+	"
+
+export DISTRIBUTION_PATCHES
-- 
2.1.4


