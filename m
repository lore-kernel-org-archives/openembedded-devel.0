Return-Path: <changhyeok.bae@lge.com>
Received: from lgemrelse7q.lge.com (LGEMRELSE7Q.lge.com [156.147.1.151])
	by mail.openembedded.org (Postfix) with ESMTP id 53C6065E2F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 06:42:35 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.151 with ESMTP; 27 Apr 2014 15:42:34 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Apr 2014 15:42:39 +0900
Message-Id: <1398580959-8408-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] Change the url to variable for savannah in SRC_URI
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
X-List-Received-Date: Sun, 27 Apr 2014 06:42:37 -0000

* The variables (SAVANNAH_GNU_MIRROR)
  are defined in oe-core/meta/conf/bitbake.conf.
* MIRRORS in quagga and libunwind is removed.
  because the MIRRORS of savannah is globally defined
  in oe-core/meta/classes/mirrors.bbclass

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 .../fluidsynth/fluidsynth_1.1.1.bb                 |    2 +-
 .../recipes-protocols/quagga/quagga.inc            |    4 +---
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb        |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb        |    2 +-
 .../recipes-support/hddtemp/hddtemp_0.3-beta15.bb  |    2 +-
 meta-oe/recipes-support/libunwind/libunwind.inc    |    4 +---
 meta-oe/recipes-support/lzip/lzip_1.14.bb          |    2 +-
 7 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
index c497d98..ac6b867 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
 
 DEPENDS = "alsa-lib ncurses glib-2.0"
 
-SRC_URI = "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/fluid/${P}.tar.gz"
 SRC_URI[md5sum] = "0db3da78028d255026230809c6e21b44"
 SRC_URI[sha256sum] = "55638cb04f39f4df76c081e22ca7feeea58ddd20ebf779a7db2d38b1ff374cd6"
 
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 60baab8..5eeb18b 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -23,7 +23,7 @@ RDEPENDS_${PN} += "iproute2"
 QUAGGASUBDIR = ""
 # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
 # versions and leave it empty for recent versions.
-SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name=quagga-${PV} \
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name=quagga-${PV} \
            file://fix-for-lib-inpath.patch \
            file://quagga-0.99.17-libcap.patch \
            file://quagga-fix-CVE-2013-6051.patch \
@@ -38,8 +38,6 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
            file://quagga-Avoid-duplicate-connected-address.patch \
 "
 
-MIRRORS += "http://download.savannah.gnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n"
-
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 6e5000b..33bc611 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa01bff138cc98a62b8840a157951c88"
 # flex with provide /usr/include/FlexLexer.h
 DEPENDS = "flex-native bison-native flex"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV}.tar.gz \
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/fbi-improved/${BPN}-${PV}.tar.gz \
            file://cross_cc.patch"
 SRC_URI[md5sum] = "d7362dde5541c2b6439c35c6e2bd5046"
 SRC_URI[sha256sum] = "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1ea9f686"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index 97f3354..c82aadc 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -9,7 +9,7 @@ EXTRANATIVEPATH += "chrpath-native"
 
 PR = "r14"
 
-SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/${PN}/${P}.tar.gz \
     file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
     file://0004-SConstruct-remove-rpath.patch \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index 9da2ee0..ea24c42 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2+"
 
 PR = "r1"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
            file://hddtemp-no-nls-support.patch \
            file://hddtemp_0.3-beta15-52.diff \
            file://hddtemp-0.3-beta15-autodetect-717479.patch \
diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
index a70ec2e..c523891 100644
--- a/meta-oe/recipes-support/libunwind/libunwind.inc
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -3,9 +3,7 @@ HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
-
-MIRRORS += "http://download.savannah.nongnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n"
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-support/lzip/lzip_1.14.bb b/meta-oe/recipes-support/lzip/lzip_1.14.bb
index 3d8c090..5a7f3fc 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.14.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.14.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-SRC_URI = "http://download.savannah.gnu.org/releases/lzip/lzip-${PV}.tar.gz"
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
 
 # Only the latest version is available in .tar.gz format from savannah.gnu.org,
 # FreeBSD distfiles is known to have version 1.13.
-- 
1.7.9.5


