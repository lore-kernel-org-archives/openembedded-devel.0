Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyRnV-0002RC-29
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:27:05 +0200
Received: (qmail 6917 invoked from network); 27 Apr 2009 14:22:01 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 07:22:01 -0700
Date: Mon, 27 Apr 2009 07:22:01 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090427142200.GI18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090427141943.GG18788@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [RFC][PATCH] All distro conf files: Use PREFERRED_LIBC to pick or	set your libc.
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
X-List-Received-Date: Mon, 27 Apr 2009 14:27:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

All distro conf files: Use PREFERRED_LIBC to pick or set your libc.

---
 conf/distro/angstrom-2008.1.conf                   |    2 +-
 conf/distro/asusoe.conf                            |    1 +
 conf/distro/celinux-test.conf                      |    1 +
 conf/distro/chinook-compat.conf                    |    1 +
 conf/distro/foonas.conf                            |    5 +++--
 conf/distro/gmustix.conf                           |    1 +
 conf/distro/include/angstrom-2007-for-openmoko.inc |    2 +-
 conf/distro/include/angstrom.inc                   |   13 +++++++------
 conf/distro/include/kaeilos.inc                    |   12 ++++++------
 conf/distro/jlime-2009.1.conf                      |    1 +
 conf/distro/jlime-donkey.conf                      |    1 +
 conf/distro/jlime-henchman.conf                    |    1 +
 conf/distro/jlime-mongo.conf                       |    1 +
 conf/distro/jlime-shrek.conf                       |    1 +
 conf/distro/kaeilos.conf                           |    2 +-
 conf/distro/mamona.conf                            |    1 +
 conf/distro/minimal-uclibc.conf                    |    1 +
 conf/distro/nylon.conf                             |    1 +
 conf/distro/openmn.conf                            |    1 +
 conf/distro/openmoko.conf                          |    2 ++
 conf/distro/openprotium.conf                       |    1 +
 conf/distro/oplinux-uclibc.conf                    |    1 +
 conf/distro/oplinux.conf                           |    1 +
 conf/distro/slugos.conf                            |    1 +
 conf/distro/ucslugc.conf                           |    1 +
 conf/distro/unslung.conf                           |    1 +
 conf/distro/wrt54oe.conf                           |    1 +
 27 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 740ff31..ec48ee4 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -46,7 +46,7 @@ IMAGE_LINGUAS = '${@base_less_or_equal("ROOT_FLASH_SIZE", "16", "", "en-us", d)}
 
 
 # set feed path variables
-FEED_BASEPATH = "feeds/2008/${ANGSTROM_PKG_FORMAT}/${ANGSTROMLIBC}/"
+FEED_BASEPATH = "feeds/2008/${ANGSTROM_PKG_FORMAT}/${PREFERRED_LIBC}/"
 
 
 #The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
diff --git a/conf/distro/asusoe.conf b/conf/distro/asusoe.conf
index 35be6a4..18778ac 100644
--- a/conf/distro/asusoe.conf
+++ b/conf/distro/asusoe.conf
@@ -7,6 +7,7 @@ DISTRO_VERSION = "0.1-alpha"
 
 TARGET_OS = "linux-uclibc"
 TARGET_SYS = "${TARGET_ARCH}-uclibc"
+PREFERRED_LIBC = "uclibc"
 
 CROSS_DIR = "/opt/brcm/hndtools-mipsel-uclibc"
 
diff --git a/conf/distro/celinux-test.conf b/conf/distro/celinux-test.conf
index 0787ff2..7397792 100644
--- a/conf/distro/celinux-test.conf
+++ b/conf/distro/celinux-test.conf
@@ -49,6 +49,7 @@ PREFERRED_VERSION_gcc-cross = "3.4.4"
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
 PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
 
+PREFERRED_LIBC = "glibc"
 PREFERRED_VERSION_glibc = "2.3.5+cvs20050627"
 
 # glibc provides iconv and intl
diff --git a/conf/distro/chinook-compat.conf b/conf/distro/chinook-compat.conf
index d2ff51e..33819ee 100644
--- a/conf/distro/chinook-compat.conf
+++ b/conf/distro/chinook-compat.conf
@@ -21,6 +21,7 @@ DISTRO_TYPE = "debug"
 # Needed for e.g. libffi builds on armv6
 OVERRIDES .= ":${FEED_ARCH}"
 
+PREFERRED_LIBC = "glibc"
 require conf/distro/include/angstrom-glibc.inc
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -O1"
 
diff --git a/conf/distro/foonas.conf b/conf/distro/foonas.conf
index cc5bbbb..67c250f 100644
--- a/conf/distro/foonas.conf
+++ b/conf/distro/foonas.conf
@@ -6,8 +6,9 @@
 #@MAINTAINER: Øyvind Repvik <repvik@foonas.org>
 #@--------------------------------------------------------------------
 
-FOONAS_MODE ?= "glibc"
-ANGSTROMLIBC = ${FOONAS_MODE}
+PREFERRED_LIBC ?= "glibc"
+FOONAS_MODE ?= "${PRERRED_LIBC}"
+ANGSTROMLIBC = "${PREFERRED_LIBC}"
 require conf/distro/angstrom-2008.1.conf
 
 DISTRO_NAME = "foonas"
diff --git a/conf/distro/gmustix.conf b/conf/distro/gmustix.conf
index a47de7c..756176e 100644
--- a/conf/distro/gmustix.conf
+++ b/conf/distro/gmustix.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Gumstix distribution for GMU (George Mason University)
 
 INHERIT += "package_tar package_ipk"
+PREFERRED_LIBC = "uclibc"
 TARGET_OS = "linux-uclibc"
 TARGET_FPU = "soft"
 IMAGE_FSTYPES = "jffs2"
diff --git a/conf/distro/include/angstrom-2007-for-openmoko.inc b/conf/distro/include/angstrom-2007-for-openmoko.inc
index b931d34..0c3d265 100644
--- a/conf/distro/include/angstrom-2007-for-openmoko.inc
+++ b/conf/distro/include/angstrom-2007-for-openmoko.inc
@@ -28,7 +28,7 @@ DISTRO_TYPE ?= "debug"
 IMAGE_LINGUAS = '${@base_less_or_equal("ROOT_FLASH_SIZE", "16", "", "en-gb", d)}'
 
 # set feed path variables
-FEED_BASEPATH = "feeds/2007/${ANGSTROM_PKG_FORMAT}/${ANGSTROMLIBC}/"
+FEED_BASEPATH = "feeds/2007/${ANGSTROM_PKG_FORMAT}/${PREFERRED_LIBC}/"
 
 
 #The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 1f0fced..e18395a 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -18,11 +18,12 @@ SRC_DIST_LOCAL ?= "symlink"
 
 # Can be "glibc", "eglibc" or "uclibc"
 ANGSTROMLIBC ?= "glibc"
-PSTAGE_EXTRAPATH = "${ANGSTROMLIBC}"
+PREFERRED_LIBC ?= "${ANGSTROMLIBC}"
+PSTAGE_EXTRAPATH = "${PREFERRED_LIBC}"
 
-CACHE = "${TMPDIR}/cache/${ANGSTROMLIBC}/${MACHINE}"
-DEPLOY_DIR = "${TMPDIR}/deploy/${ANGSTROMLIBC}"
-require conf/distro/include/angstrom-${ANGSTROMLIBC}.inc
+CACHE = "${TMPDIR}/cache/${PREFERRED_LIBC}/${MACHINE}"
+DEPLOY_DIR = "${TMPDIR}/deploy/${PREFERRED_LIBC}"
+require conf/distro/include/angstrom-${PREFERRED_LIBC}.inc
 
 # ARM920T and up can use thumb mode to decrease binary size at the expense of speed
 # (the complete story is a bit more nuanced due to cache starvation)
@@ -144,7 +145,7 @@ PACKAGE_EXTRA_ARCHS_htcwallaby = "arm-oabi"
 
 
 #Name the generated images in a sane way
-IMAGE_NAME = "${DISTRO_NAME}-${IMAGE_BASENAME}-${ANGSTROMLIBC}-${ANGSTROM_PKG_FORMAT}-${DISTRO_VERSION}-${MACHINE}"
+IMAGE_NAME = "${DISTRO_NAME}-${IMAGE_BASENAME}-${PREFERRED_LIBC}-${ANGSTROM_PKG_FORMAT}-${DISTRO_VERSION}-${MACHINE}"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE}"
 
 # Angstrom *always* has some form of release config, so error out if someone thinks he knows better 
@@ -156,7 +157,7 @@ DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove thi
 # in their local.conf 
 
 #Name of the client
-TINDER_MACHINE  = "${MACHINE}-${ANGSTROMLIBC}-build-image"
+TINDER_MACHINE  = "${MACHINE}-${PREFERRED_LIBC}-build-image"
 
 # Which lof file to write to, which tree to report to
 TINDER_LOG        = "${TMPDIR}/tinder.log"
diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
index 6d5ceb8..18b1489 100644
--- a/conf/distro/include/kaeilos.inc
+++ b/conf/distro/include/kaeilos.inc
@@ -20,12 +20,12 @@ SRC_DIST_LOCAL ?= "symlink"
 INHERIT += "src_distribute_local"
 
 # Can be "glibc", "eglibc" or "uclibc"
-ANGSTROMLIBC ?= "glibc"
-PSTAGE_EXTRAPATH = "${ANGSTROMLIBC}"
+PREFERRED_LIBC ?= "glibc"
+PSTAGE_EXTRAPATH = "${PREFERRED_LIBC}"
 
-CACHE = "${TMPDIR}/cache/${ANGSTROMLIBC}/${MACHINE}"
-DEPLOY_DIR = "${TMPDIR}/deploy/${ANGSTROMLIBC}"
-require conf/distro/include/angstrom-${ANGSTROMLIBC}.inc
+CACHE = "${TMPDIR}/cache/${PREFERRED_LIBC}/${MACHINE}"
+DEPLOY_DIR = "${TMPDIR}/deploy/${PREFERRED_LIBC}"
+require conf/distro/include/angstrom-${PREFERRED_LIBC}.inc
 
 # ARM920T and up can use thumb mode to decrease binary size at the expense of speed
 # (the complete story is a bit more nuanced due to cache starvation)
@@ -283,7 +283,7 @@ PACKAGE_EXTRA_ARCHS_htcwallaby = "arm-oabi"
 
 
 #Name the generated images in a sane way
-IMAGE_NAME = "${DISTRO_NAME}-${IMAGE_BASENAME}-${ANGSTROMLIBC}-${ANGSTROM_PKG_FORMAT}-${DISTRO_VERSION}-${MACHINE}"
+IMAGE_NAME = "${DISTRO_NAME}-${IMAGE_BASENAME}-${PREFERRED_LIBC}-${ANGSTROM_PKG_FORMAT}-${DISTRO_VERSION}-${MACHINE}"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE}"
 
 # KaeilOS *always* has some form of release config, so error out if someone thinks he knows better 
diff --git a/conf/distro/jlime-2009.1.conf b/conf/distro/jlime-2009.1.conf
index a72988e..277da3c 100644
--- a/conf/distro/jlime-2009.1.conf
+++ b/conf/distro/jlime-2009.1.conf
@@ -69,6 +69,7 @@ TARGET_OS = "linux"
 TARGET_FPU_arm = "soft"
 TARGET_FPU_armeb = "soft"
 
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl = "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
diff --git a/conf/distro/jlime-donkey.conf b/conf/distro/jlime-donkey.conf
index dad1f1f..4ff7f9b 100644
--- a/conf/distro/jlime-donkey.conf
+++ b/conf/distro/jlime-donkey.conf
@@ -23,6 +23,7 @@ PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}g++:gcc-cross"
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDER_virtual/sh3-linux-libc-for-gcc = "glibc"
 PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
 
diff --git a/conf/distro/jlime-henchman.conf b/conf/distro/jlime-henchman.conf
index 5a99ef2..452d62e 100644
--- a/conf/distro/jlime-henchman.conf
+++ b/conf/distro/jlime-henchman.conf
@@ -68,6 +68,7 @@ TARGET_OS = "linux"
 TARGET_FPU_arm = "fixed"
 TARGET_FPU_armeb = "fixed"
 
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl = "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
diff --git a/conf/distro/jlime-mongo.conf b/conf/distro/jlime-mongo.conf
index 4e922ea..a262c5c 100644
--- a/conf/distro/jlime-mongo.conf
+++ b/conf/distro/jlime-mongo.conf
@@ -69,6 +69,7 @@ TARGET_OS = "linux"
 TARGET_FPU_arm = "soft"
 TARGET_FPU_armeb = "soft"
 
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl = "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
diff --git a/conf/distro/jlime-shrek.conf b/conf/distro/jlime-shrek.conf
index 7928387..610694f 100644
--- a/conf/distro/jlime-shrek.conf
+++ b/conf/distro/jlime-shrek.conf
@@ -15,6 +15,7 @@ PREFERRED_PROVIDERS  =  "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS  =  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
 PREFERRED_PROVIDER_virtual/kernel = "jlime-kernel-${TARGET_ARCH}"
 PREFERRED_PROVIDER_xserver        = "xserver-kdrive"
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 1cc165b..c584cfc 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -41,7 +41,7 @@ IMAGE_LINGUAS = '${@base_less_or_equal("ROOT_FLASH_SIZE", "16", "", "en-us", d)}
 
 
 # set feed path variables
-FEED_BASEPATH = "feeds/2008/${ANGSTROM_PKG_FORMAT}/${ANGSTROMLIBC}/"
+FEED_BASEPATH = "feeds/2008/${ANGSTROM_PKG_FORMAT}/${PREFERRED_LIBC}/"
 
 
 #The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
index 83e1026..564567d 100644
--- a/conf/distro/mamona.conf
+++ b/conf/distro/mamona.conf
@@ -53,6 +53,7 @@ PREFERRED_VERSION_binutils-cross-sdk ?= "2.18"
 
 # *libc
 TARGET_OS = "linux-gnueabi"
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl = "glibc"
 PREFERRED_PROVIDER_virtual/libc = "glibc"
diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index 62eb86a..82b2fc9 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -21,6 +21,7 @@ DISTRO_NAME = "minimal-uclibc"
 TARGET_OS = "linux-uclibc"
 TARGET_FPU_arm = "soft"
 TARGET_FPU_armeb = "soft"
+PREFERRED_LIBC = "uclibc"
 PREFERRED_PROVIDER_virtual/libc = "uclibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
index 3d1f057..54b55a3 100644
--- a/conf/distro/nylon.conf
+++ b/conf/distro/nylon.conf
@@ -16,6 +16,7 @@ TARGET_OS = "linux"
 INHERIT += "package_ipk debian nylon-mirrors"
 INHERIT += "linux-kernel-base"
 
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
diff --git a/conf/distro/openmn.conf b/conf/distro/openmn.conf
index 9de6c7d..b6fcf8a 100644
--- a/conf/distro/openmn.conf
+++ b/conf/distro/openmn.conf
@@ -13,6 +13,7 @@ TARGET_OS = "linux"
 INHERIT += "package_ipk"
 INHERIT += "debian"
 PACKAGE_EXTRA_ARCHS = "armv5te openmn"
+PREFERRED_LIBC = "glibc"
 
 FEED_URIS  = "mnci54##http://www.mn-solutions.de/feed/mnci54/base"
 
diff --git a/conf/distro/openmoko.conf b/conf/distro/openmoko.conf
index 3646108..0b49f92 100644
--- a/conf/distro/openmoko.conf
+++ b/conf/distro/openmoko.conf
@@ -18,6 +18,8 @@ DISTRO = "openmoko"
 
 OVERRIDES = "local:${MACHINE}:openmoko:angstrom:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
 
+PREFERRED_LIBC = "glibc"
+
 INHERIT += "packaged-staging"
 
 CVS_TARBALL_STASH += "http://downloads.openmoko.org/developer/sources/"
diff --git a/conf/distro/openprotium.conf b/conf/distro/openprotium.conf
index 633e3bc..b52a800 100644
--- a/conf/distro/openprotium.conf
+++ b/conf/distro/openprotium.conf
@@ -67,6 +67,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
 PREFERRED_PROVIDER_virtual/powerpc-linux-libc-for-gcc = "glibc"
 PREFERRED_PROVIDER_virtual/powerpc-linux-libc-initial = "glibc-initial"
 
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDER_virtual/libc     = "glibc"
 PREFERRED_PROVIDER_virtual/libiconv = "glibc"
 PREFERRED_PROVIDER_virtual/libintl  = "glibc"
diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc.conf
index 3a97c36..1032d1b 100644
--- a/conf/distro/oplinux-uclibc.conf
+++ b/conf/distro/oplinux-uclibc.conf
@@ -31,6 +31,7 @@ DISTRO_TYPE = "debug"
 TARGET_OS = "linux-uclibc"
 PREFERRED_PROVIDER_virtual/libiconv = "libiconv"
 PREFERRED_PROVIDER_virtual/libintl = "gettext"
+PREFERRED_LIBC = "uclibc"
 
 #
 # Kernel
diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
index bab726f..9d59549 100644
--- a/conf/distro/oplinux.conf
+++ b/conf/distro/oplinux.conf
@@ -46,6 +46,7 @@ PREFERRED_PROVIDER_esound 		?= "pulseaudio"
 
 
 # glibc:
+PREFERRED_LIBC ?= "glibc"
 PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
 PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
 PREFERRED_PROVIDER_virtual/libc ?= "glibc"
diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
index 3e816f7..f329179 100644
--- a/conf/distro/slugos.conf
+++ b/conf/distro/slugos.conf
@@ -18,6 +18,7 @@ IMAGE_INITSCRIPTS ?= "initscripts-slugos"
 require conf/distro/include/slugos.inc
 
 # glibc:
+PREFERRED_LIBC ?= "glibc"
 PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
 PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
 PREFERRED_PROVIDER_virtual/libc ?= "glibc"
diff --git a/conf/distro/ucslugc.conf b/conf/distro/ucslugc.conf
index e3fa016..14d3e99 100644
--- a/conf/distro/ucslugc.conf
+++ b/conf/distro/ucslugc.conf
@@ -8,6 +8,7 @@ TARGET_ARCH = "armeb"
 ARM_INSTRUCTION_SET = "thumb"
 THUMB_INTERWORK = "yes"
 TARGET_OS = "linux-uclibc"
+PREFERRED_LIBC = "uclibc"
 
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
 PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
diff --git a/conf/distro/unslung.conf b/conf/distro/unslung.conf
index 5cb1625..bf74509 100644
--- a/conf/distro/unslung.conf
+++ b/conf/distro/unslung.conf
@@ -51,6 +51,7 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}binutils:binutils-cross"
 PREFERRED_PROVIDERS += " virtual/libc:glibc"
 PREFERRED_PROVIDERS += " linux-libc-headers:linux-libc-headers"
 
+PREFERRED_LIBC = "glibc"
 PREFERRED_PROVIDER_libc6-unslung = "glibc"
 
 PREFERRED_VERSION_binutils ?= "2.15.94.0.1"
diff --git a/conf/distro/wrt54oe.conf b/conf/distro/wrt54oe.conf
index 4d18407..c9b6e2b 100644
--- a/conf/distro/wrt54oe.conf
+++ b/conf/distro/wrt54oe.conf
@@ -12,6 +12,7 @@
 INHERIT += "package_ipk debian"
 
 TARGET_OS = "linux-uclibc"
+PREFERRED_LIBC = "uclibc"
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
-- 
1.6.2.1.469.gdffc

-- 
Tom Rini


