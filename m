Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyRp4-0002dh-N9
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:28:43 +0200
Received: (qmail 6927 invoked from network); 27 Apr 2009 14:23:38 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 07:23:38 -0700
Date: Mon, 27 Apr 2009 07:23:38 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090427142337.GK18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090427142200.GI18788@smtp.west.cox.net>
	<20090427142307.GJ18788@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090427142307.GJ18788@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [RFC][PATCH] All distros: Bring in	conf/distro/include/${PREFERRED_LIBC}.inc
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
X-List-Received-Date: Mon, 27 Apr 2009 14:28:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

 All distros: Bring in conf/distro/include/${PREFERRED_LIBC}.inc

---
 conf/distro/asusoe.conf                            |    1 +
 conf/distro/celinux-test.conf                      |    6 +-----
 conf/distro/chinook-compat.conf                    |    6 ------
 conf/distro/gmustix.conf                           |    2 +-
 conf/distro/include/angstrom-2007-for-openmoko.inc |    1 -
 conf/distro/include/angstrom-eglibc.inc            |   13 +------------
 conf/distro/include/angstrom-glibc.inc             |   16 ++--------------
 conf/distro/include/angstrom-uclibc.inc            |    9 +--------
 conf/distro/include/angstrom-uclinux-uclibc.inc    |    5 +----
 conf/distro/include/sane-toolchain-eglibc.inc      |   20 --------------------
 conf/distro/include/sane-toolchain-glibc.inc       |   17 ++---------------
 conf/distro/include/sane-toolchain-uclibc.inc      |    8 --------
 .../include/sane-toolchain-uclinux-uclibc.inc      |    4 ----
 conf/distro/include/sane-toolchain.inc             |    1 +
 conf/distro/include/slugos.inc                     |    7 -------
 conf/distro/include/uclibc.inc                     |    2 ++
 conf/distro/jlime-2009.1.conf                      |    8 ++------
 conf/distro/jlime-donkey.conf                      |    3 +--
 conf/distro/jlime-henchman.conf                    |    8 ++------
 conf/distro/jlime-mongo.conf                       |    8 ++------
 conf/distro/jlime-shrek.conf                       |    2 +-
 conf/distro/mamona.conf                            |   12 +-----------
 conf/distro/minimal-uclibc.conf                    |    8 ++++----
 conf/distro/nylon.conf                             |    2 +-
 conf/distro/openmn.conf                            |    1 +
 conf/distro/openmoko.conf                          |    1 +
 conf/distro/openprotium.conf                       |    8 +-------
 conf/distro/oplinux-uclibc.conf                    |    3 +--
 conf/distro/oplinux.conf                           |   16 +---------------
 conf/distro/slugos.conf                            |    5 +----
 conf/distro/ucslugc.conf                           |    1 +
 conf/distro/unslung.conf                           |    4 +---
 conf/distro/wrt54oe.conf                           |    2 +-
 33 files changed, 36 insertions(+), 174 deletions(-)

diff --git a/conf/distro/asusoe.conf b/conf/distro/asusoe.conf
index 18778ac..67505b8 100644
--- a/conf/distro/asusoe.conf
+++ b/conf/distro/asusoe.conf
@@ -8,6 +8,7 @@ DISTRO_VERSION = "0.1-alpha"
 TARGET_OS = "linux-uclibc"
 TARGET_SYS = "${TARGET_ARCH}-uclibc"
 PREFERRED_LIBC = "uclibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 CROSS_DIR = "/opt/brcm/hndtools-mipsel-uclibc"
 
diff --git a/conf/distro/celinux-test.conf b/conf/distro/celinux-test.conf
index 7397792..903eb00 100644
--- a/conf/distro/celinux-test.conf
+++ b/conf/distro/celinux-test.conf
@@ -39,7 +39,6 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-inte
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}binutils:binutils-cross"
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
 
 PREFERRED_VERSION_binutils = "2.16"
 PREFERRED_VERSION_binutils-cross = "2.16"
@@ -50,12 +49,9 @@ PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
 PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
 
 PREFERRED_LIBC = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 PREFERRED_VERSION_glibc = "2.3.5+cvs20050627"
 
-# glibc provides iconv and intl
-PREFERRED_PROVIDER_virtual/libiconv = "glibc"
-PREFERRED_PROVIDER_virtual/libintl = "glibc"
-
 #
 # omap5912osk settings
 #
diff --git a/conf/distro/chinook-compat.conf b/conf/distro/chinook-compat.conf
index 33819ee..f236e8c 100644
--- a/conf/distro/chinook-compat.conf
+++ b/conf/distro/chinook-compat.conf
@@ -50,12 +50,6 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-inte
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 
-PREFERRED_PROVIDER_virtual/libc = "glibc"
-
-# NPTL stuff
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-libc-for-gcc = "glibc"
-
 PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-binutils = "binutils-cross"
 PREFERRED_PROVIDER_linux-libc-header = "linux-libc-headers"
 PREFERRED_PROVIDER_virtual/libx11 = "libx11"
diff --git a/conf/distro/gmustix.conf b/conf/distro/gmustix.conf
index 756176e..e67b8aa 100644
--- a/conf/distro/gmustix.conf
+++ b/conf/distro/gmustix.conf
@@ -4,6 +4,7 @@
 
 INHERIT += "package_tar package_ipk"
 PREFERRED_LIBC = "uclibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 TARGET_OS = "linux-uclibc"
 TARGET_FPU = "soft"
 IMAGE_FSTYPES = "jffs2"
@@ -12,7 +13,6 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
 
 PREFERRED_PROVIDER_classpath = "classpath-minimal"
 
diff --git a/conf/distro/include/angstrom-2007-for-openmoko.inc b/conf/distro/include/angstrom-2007-for-openmoko.inc
index 0c3d265..04f5f63 100644
--- a/conf/distro/include/angstrom-2007-for-openmoko.inc
+++ b/conf/distro/include/angstrom-2007-for-openmoko.inc
@@ -137,7 +137,6 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
 #Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc"
 PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc"
 PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc"
 PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
index c0d87a4..655cf9d 100644
--- a/conf/distro/include/angstrom-eglibc.inc
+++ b/conf/distro/include/angstrom-eglibc.inc
@@ -1,16 +1,5 @@
 # eglibc:
-PREFERRED_PROVIDER_virtual/libiconv = "eglibc"
-PREFERRED_PROVIDER_virtual/libintl = "eglibc"
-PREFERRED_PROVIDER_virtual/libc = "eglibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "eglibc-initial"
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "eglibc"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc    = "eglibc"
-PREFERRED_PROVIDER_virtual/armeb${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc  = "eglibc"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-libc-for-gcc            = "eglibc"
-PREFERRED_PROVIDER_virtual/powerpc${TARGET_VENDOR}-linux-libc-for-gcc        = "eglibc"
-PREFERRED_PROVIDER_virtual/mipsel${TARGET_VENDOR}-linux-libc-for-gcc         = "eglibc"
-PREFERRED_PROVIDER_virtual/sparc${TARGET_VENDOR}-linux-libc-for-gcc          = "eglibc"
+require conf/distro/include/eglibc.inc
 
 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
diff --git a/conf/distro/include/angstrom-glibc.inc b/conf/distro/include/angstrom-glibc.inc
index b14f880..5df77d8 100644
--- a/conf/distro/include/angstrom-glibc.inc
+++ b/conf/distro/include/angstrom-glibc.inc
@@ -1,19 +1,7 @@
 # glibc:
-PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
-PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
-PREFERRED_PROVIDER_virtual/libc ?= "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "glibc-initial"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
-
-#Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc"
+require conf/distro/include/glibc.inc
 
+PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
 
 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
diff --git a/conf/distro/include/angstrom-uclibc.inc b/conf/distro/include/angstrom-uclibc.inc
index 86a9afd..3079e0d 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -1,12 +1,5 @@
 # uclibc:
-#fix some iconv issues, needs to be adjusted when doing uclibc builds
-PREFERRED_PROVIDER_virtual/libc = "uclibc"
-PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
-PREFERRED_PROVIDER_virtual/libintl_avr32 = "proxy-libintl"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc    = "uclibc-initial"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-gcc  = "uclibc-initial"
+require conf/distro/include/uclibc.inc
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
diff --git a/conf/distro/include/angstrom-uclinux-uclibc.inc b/conf/distro/include/angstrom-uclinux-uclibc.inc
index 68ad145..c3f908c 100644
--- a/conf/distro/include/angstrom-uclinux-uclibc.inc
+++ b/conf/distro/include/angstrom-uclinux-uclibc.inc
@@ -1,8 +1,5 @@
 # uclibc:
-#fix some iconv issues, needs to be adjusted when doing uclibc builds
-PREFERRED_PROVIDER_virtual/libc = "uclibc"
-PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+require conf/distro/include/uclibc.inc
 
 USE_NLS ?= "no"
 USE_NLS_glib-2.0 = "yes"
diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index e780349..1b0d493 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -1,26 +1,6 @@
 # Originally brought to you by the Angstrom Distribution
 
 # eglibc:
-PREFERRED_PROVIDER_virtual/libiconv = "eglibc"
-PREFERRED_PROVIDER_virtual/libintl = "eglibc"
-PREFERRED_PROVIDER_virtual/libc = "eglibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "eglibc-initial"
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "eglibc"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc    = "eglibc"
-PREFERRED_PROVIDER_virtual/armeb${TARGET_VENDOR}-linux-gnueabi-libc-for-gcc  = "eglibc"
-PREFERRED_PROVIDER_virtual/arm${TARGET_VENDOR}-linux-libc-for-gcc            = "eglibc"
-PREFERRED_PROVIDER_virtual/powerpc${TARGET_VENDOR}-linux-libc-for-gcc        = "eglibc"
-PREFERRED_PROVIDER_virtual/mipsel${TARGET_VENDOR}-linux-libc-for-gcc         = "eglibc"
-PREFERRED_PROVIDER_virtual/sparc${TARGET_VENDOR}-linux-libc-for-gcc          = "eglibc"
-
-TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
-
-#TARGET_OS = "linux-gnuspe"
-
-#mess with compiler flags to use -Os instead of -O2
-#Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-# perl has some problems, see http://bugs.openembedded.net/show_bug.cgi?id=1616
 # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
 
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/include/sane-toolchain-glibc.inc
index b14f880..b4da525 100644
--- a/conf/distro/include/sane-toolchain-glibc.inc
+++ b/conf/distro/include/sane-toolchain-glibc.inc
@@ -1,19 +1,6 @@
-# glibc:
-PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
-PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
-PREFERRED_PROVIDER_virtual/libc ?= "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "glibc-initial"
-PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
-
-#Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc               = "glibc"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc    = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-gnueabi-libc-for-gcc  = "glibc"
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-libc-for-gcc            = "glibc"
-PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
-PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc"
-PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc"
+# Originally brought to you by the Angstrom Distribution
 
+# glibc:
 
 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index 66ac81a..394b52a 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -1,14 +1,6 @@
 # Originally brought to you by the Angstrom Distribution
 
 # uclibc:
-#fix some iconv issues, needs to be adjusted when doing uclibc builds
-PREFERRED_PROVIDER_virtual/libc = "uclibc"
-PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
-PREFERRED_PROVIDER_virtual/libintl_avr32 = "proxy-libintl"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
-PREFERRED_PROVIDER_virtual/arm-${TARGET_VENDOR}-linux-uclibcgnueabi-libc-for-gcc    = "uclibc-initial"
-PREFERRED_PROVIDER_virtual/armeb-${TARGET_VENDOR}-linux-uclibcgnueabi-libc-for-gcc  = "uclibc-initial"
 
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
index 85ccddf..b757efb 100644
--- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
@@ -1,10 +1,6 @@
 # Originally brought to you by the Angstrom Distribution
 
 # uclibc:
-#fix some iconv issues, needs to be adjusted when doing uclibc builds
-PREFERRED_PROVIDER_virtual/libc = "uclibc"
-PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
 
 USE_NLS ?= "no"
 USE_NLS_glib-2.0 = "yes"
diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index f70e98e..724e879 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -116,6 +116,7 @@ TARGET_CC_ARCH_pn-cairo_armv5te = "-march=armv4t"
 
 # Can be "glibc", "eglibc" or "uclibc"
 PREFERRED_LIBC ?= "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 PSTAGE_EXTRAPATH = "${PREFERRED_LIBC}"
 require conf/distro/include/sane-toolchain-${PREFERRED_LIBC}.inc
 
diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
index b141548..252e80d 100644
--- a/conf/distro/include/slugos.inc
+++ b/conf/distro/include/slugos.inc
@@ -120,13 +120,6 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-interme
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc		    = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++		    = "gcc-cross"
 
-#Set preferred provider for the C library that is used to build the crosscompiler (NPTL voodoo)
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc	    = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc	    = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc	    = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-gnueabi-libc-for-gcc   = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-linux-gnueabi-libc-for-gcc = "glibc"
-
 # Set the preferred provider for a few toolchain-related items, otherwise
 # these may be selected from the external-toolchain instead.
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils	    = "binutils-cross"
diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.inc
index bb2e2be..979b7f1 100644
--- a/conf/distro/include/uclibc.inc
+++ b/conf/distro/include/uclibc.inc
@@ -4,6 +4,8 @@ OVERRIDES .= ":uclibc"
 # The things uclibc can provide.  We default to wanting uclibc to provide them.
 PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
 PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+#fix some iconv issues, needs to be adjusted when doing uclibc builds
+PREFERRED_PROVIDER_virtual/libintl_avr32 = "proxy-libintl"
 PREFERRED_PROVIDER_virtual/libc = "uclibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "uclibc-initial"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
diff --git a/conf/distro/jlime-2009.1.conf b/conf/distro/jlime-2009.1.conf
index 277da3c..57a853b 100644
--- a/conf/distro/jlime-2009.1.conf
+++ b/conf/distro/jlime-2009.1.conf
@@ -70,12 +70,8 @@ TARGET_FPU_arm = "soft"
 TARGET_FPU_armeb = "soft"
 
 PREFERRED_LIBC = "glibc"
-PREFERRED_PROVIDER_virtual/libiconv = "glibc"
-PREFERRED_PROVIDER_virtual/libintl = "glibc"
-PREFERRED_PROVIDER_virtual/libc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
+
 PREFERRED_VERSION_linux-libc-headers = "2.6.18"
 PREFERRED_VERSION_glibc = "2.5"
 
diff --git a/conf/distro/jlime-donkey.conf b/conf/distro/jlime-donkey.conf
index 4ff7f9b..7034cb5 100644
--- a/conf/distro/jlime-donkey.conf
+++ b/conf/distro/jlime-donkey.conf
@@ -24,8 +24,7 @@ PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-inte
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS +=  "virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_LIBC = "glibc"
-PREFERRED_PROVIDER_virtual/sh3-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 #<>----------------------------------------------------------------->
 #<> We want this so we can crosscompile the kernel using gcc 3.4.3
diff --git a/conf/distro/jlime-henchman.conf b/conf/distro/jlime-henchman.conf
index 452d62e..55da3d5 100644
--- a/conf/distro/jlime-henchman.conf
+++ b/conf/distro/jlime-henchman.conf
@@ -69,12 +69,8 @@ TARGET_FPU_arm = "fixed"
 TARGET_FPU_armeb = "fixed"
 
 PREFERRED_LIBC = "glibc"
-PREFERRED_PROVIDER_virtual/libiconv = "glibc"
-PREFERRED_PROVIDER_virtual/libintl = "glibc"
-PREFERRED_PROVIDER_virtual/libc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
+
 PREFERRED_VERSION_linux-libc-headers = "2.6.23"
 PREFERRED_VERSION_glibc = "2.5"
 
diff --git a/conf/distro/jlime-mongo.conf b/conf/distro/jlime-mongo.conf
index a262c5c..cbf45d9 100644
--- a/conf/distro/jlime-mongo.conf
+++ b/conf/distro/jlime-mongo.conf
@@ -70,12 +70,8 @@ TARGET_FPU_arm = "soft"
 TARGET_FPU_armeb = "soft"
 
 PREFERRED_LIBC = "glibc"
-PREFERRED_PROVIDER_virtual/libiconv = "glibc"
-PREFERRED_PROVIDER_virtual/libintl = "glibc"
-PREFERRED_PROVIDER_virtual/libc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_ARCH}-${TARGET_OS}-libc-for-gcc = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
+
 PREFERRED_VERSION_linux-libc-headers = "2.6.18"
 PREFERRED_VERSION_glibc = "2.5"
 
diff --git a/conf/distro/jlime-shrek.conf b/conf/distro/jlime-shrek.conf
index 610694f..08b43a2 100644
--- a/conf/distro/jlime-shrek.conf
+++ b/conf/distro/jlime-shrek.conf
@@ -16,7 +16,7 @@ PREFERRED_PROVIDERS  =  "virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-inte
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
 PREFERRED_LIBC = "glibc"
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 PREFERRED_PROVIDER_virtual/kernel = "jlime-kernel-${TARGET_ARCH}"
 PREFERRED_PROVIDER_xserver        = "xserver-kdrive"
 
diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
index 564567d..2cfe79a 100644
--- a/conf/distro/mamona.conf
+++ b/conf/distro/mamona.conf
@@ -54,23 +54,13 @@ PREFERRED_VERSION_binutils-cross-sdk ?= "2.18"
 # *libc
 TARGET_OS = "linux-gnueabi"
 PREFERRED_LIBC = "glibc"
-PREFERRED_PROVIDER_virtual/libiconv = "glibc"
-PREFERRED_PROVIDER_virtual/libintl = "glibc"
-PREFERRED_PROVIDER_virtual/libc = "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "glibc-initial"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 PREFERRED_VERSION_glibc ?= "2.5"
 PREFERRED_VERSION_glibc-intermediate ?= "2.5"
 PREFERRED_VERSION_glibc-initial ?= "2.5"
 PREFERRED_VERSION_uclibc ?= "0.9.29"
 
-# NPTL stuff
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-mamona-linux-gnueabi-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-mamona-linux-gnueabi-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-mamona-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/i586-mamona-linux-libc-for-gcc = "glibc"
-
 # Other Packages
 # ==============
 
diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index 82b2fc9..62e70e1 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -21,12 +21,12 @@ DISTRO_NAME = "minimal-uclibc"
 TARGET_OS = "linux-uclibc"
 TARGET_FPU_arm = "soft"
 TARGET_FPU_armeb = "soft"
-PREFERRED_LIBC = "uclibc"
-PREFERRED_PROVIDER_virtual/libc = "uclibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
-PREFERRED_PROVIDER_virtual/libiconv = "libiconv"
+
+# Override the default virtual/libintl
+PREFERRED_LIBC = "uclibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 PREFERRED_PROVIDER_virtual/libintl = "proxy-libintl"
 
 USE_NLS ?= "no"
diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
index 54b55a3..77a79b1 100644
--- a/conf/distro/nylon.conf
+++ b/conf/distro/nylon.conf
@@ -17,11 +17,11 @@ INHERIT += "package_ipk debian nylon-mirrors"
 INHERIT += "linux-kernel-base"
 
 PREFERRED_LIBC = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
 PREFERRED_PROVIDERS += " virtual/libx11:diet-x11"
 PREFERRED_PROVIDERS += " python:python-curses"
 PREFERRED_PROVIDER_classpath = "classpath-minimal"
diff --git a/conf/distro/openmn.conf b/conf/distro/openmn.conf
index b6fcf8a..19e1dc1 100644
--- a/conf/distro/openmn.conf
+++ b/conf/distro/openmn.conf
@@ -14,6 +14,7 @@ INHERIT += "package_ipk"
 INHERIT += "debian"
 PACKAGE_EXTRA_ARCHS = "armv5te openmn"
 PREFERRED_LIBC = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 FEED_URIS  = "mnci54##http://www.mn-solutions.de/feed/mnci54/base"
 
diff --git a/conf/distro/openmoko.conf b/conf/distro/openmoko.conf
index 0b49f92..06cf866 100644
--- a/conf/distro/openmoko.conf
+++ b/conf/distro/openmoko.conf
@@ -19,6 +19,7 @@ DISTRO = "openmoko"
 OVERRIDES = "local:${MACHINE}:openmoko:angstrom:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
 
 PREFERRED_LIBC = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 INHERIT += "packaged-staging"
 
diff --git a/conf/distro/openprotium.conf b/conf/distro/openprotium.conf
index b52a800..c85bb40 100644
--- a/conf/distro/openprotium.conf
+++ b/conf/distro/openprotium.conf
@@ -63,14 +63,8 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-interme
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/powerpc-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/powerpc-linux-libc-initial = "glibc-initial"
-
 PREFERRED_LIBC = "glibc"
-PREFERRED_PROVIDER_virtual/libc     = "glibc"
-PREFERRED_PROVIDER_virtual/libiconv = "glibc"
-PREFERRED_PROVIDER_virtual/libintl  = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 #silence a warning message...
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc.conf
index 1032d1b..2237c6a 100644
--- a/conf/distro/oplinux-uclibc.conf
+++ b/conf/distro/oplinux-uclibc.conf
@@ -29,9 +29,8 @@ DISTRO_TYPE = "debug"
 # Target OS & FPU system
 #
 TARGET_OS = "linux-uclibc"
-PREFERRED_PROVIDER_virtual/libiconv = "libiconv"
-PREFERRED_PROVIDER_virtual/libintl = "gettext"
 PREFERRED_LIBC = "uclibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 #
 # Kernel
diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
index 9d59549..9eb16b6 100644
--- a/conf/distro/oplinux.conf
+++ b/conf/distro/oplinux.conf
@@ -47,21 +47,7 @@ PREFERRED_PROVIDER_esound 		?= "pulseaudio"
 
 # glibc:
 PREFERRED_LIBC ?= "glibc"
-PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
-PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
-PREFERRED_PROVIDER_virtual/libc ?= "glibc"
-
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-oplinux-linux-gnueabi-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-oplinux-linux-gnueabi-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/armeb-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/powerpc-oplinux-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/mipsel-oplinux-linux-libc-for-gcc = "glibc"
-PREFERRED_PROVIDER_virtual/sparc-oplinux-linux-libc-for-gcc = "glibc"
-
-
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 # Virtuals:
 PREFERRED_PROVIDER_virtual/db ?= "db"
diff --git a/conf/distro/slugos.conf b/conf/distro/slugos.conf
index f329179..8a1738e 100644
--- a/conf/distro/slugos.conf
+++ b/conf/distro/slugos.conf
@@ -19,7 +19,4 @@ require conf/distro/include/slugos.inc
 
 # glibc:
 PREFERRED_LIBC ?= "glibc"
-PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
-PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
-PREFERRED_PROVIDER_virtual/libc ?= "glibc"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "glibc-initial"
+require conf/distro/include/${PREFERRED_LIBC}.inc
diff --git a/conf/distro/ucslugc.conf b/conf/distro/ucslugc.conf
index 14d3e99..518a3a5 100644
--- a/conf/distro/ucslugc.conf
+++ b/conf/distro/ucslugc.conf
@@ -9,6 +9,7 @@ ARM_INSTRUCTION_SET = "thumb"
 THUMB_INTERWORK = "yes"
 TARGET_OS = "linux-uclibc"
 PREFERRED_LIBC = "uclibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
 PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
diff --git a/conf/distro/unslung.conf b/conf/distro/unslung.conf
index bf74509..859c89d 100644
--- a/conf/distro/unslung.conf
+++ b/conf/distro/unslung.conf
@@ -45,13 +45,11 @@ PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-initial:glibc-initial"
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:glibc"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}binutils:binutils-cross"
-PREFERRED_PROVIDERS += " virtual/libc:glibc"
 PREFERRED_PROVIDERS += " linux-libc-headers:linux-libc-headers"
 
 PREFERRED_LIBC = "glibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 PREFERRED_PROVIDER_libc6-unslung = "glibc"
 
 PREFERRED_VERSION_binutils ?= "2.15.94.0.1"
diff --git a/conf/distro/wrt54oe.conf b/conf/distro/wrt54oe.conf
index c9b6e2b..982ba54 100644
--- a/conf/distro/wrt54oe.conf
+++ b/conf/distro/wrt54oe.conf
@@ -13,12 +13,12 @@ INHERIT += "package_ipk debian"
 
 TARGET_OS = "linux-uclibc"
 PREFERRED_LIBC = "uclibc"
+require conf/distro/include/${PREFERRED_LIBC}.inc
 
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
 PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"
 
 PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
 PREFERRED_VERSION_gcc-cross-intermediate = "3.4.4"
-- 
1.6.2.1.469.gdffc

-- 
Tom Rini


