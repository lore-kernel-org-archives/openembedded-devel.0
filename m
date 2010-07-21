Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxs-0006lh-V5
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 3E0FA4036DE6F;
	Wed, 21 Jul 2010 16:07:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 35CD04036DE6D;
	Wed, 21 Jul 2010 16:07:25 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJ2DVn5zriAq; Wed, 21 Jul 2010 16:07:25 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 5541A4036DE6F;
	Wed, 21 Jul 2010 16:07:24 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxC-0006Uf-4o; Wed, 21 Jul 2010 16:07:22 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:11 +0200
Message-Id: <1279721232-24744-21-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 20/21] icedtea6-native: backported from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:36 -0000

From: Henning Heinold <h.heinold@tarent.de>

---
 conf/checksums.ini                                 |   19 +
 .../icedtea6-native-1.7.3/build-hacks-native.patch |   15 +
 .../disable-library-checks.patch                   |  141 +++
 .../icedtea-ecj-disable-compilation.patch          |  513 +++++++++
 .../icedtea-ecj-disable-sanitychecks.patch         |   76 ++
 .../icedtea-ecj-fix-freetype.patch                 |   13 +
 .../icedtea-ecj-fix-zlib.patch                     |   61 ++
 .../icedtea-fix-jar-command.patch                  |   27 +
 .../icedtea-hotspot-make-arch-sane-for-x86.patch   | 1130 ++++++++++++++++++++
 .../icedtea6-native-1.7.3/icedtea-javac-in.patch   |   28 +
 .../icedtea-jdk-sane-x86-arch.patch                |  240 +++++
 .../icedtea-sane-x86-arch-name.patch               |   47 +
 .../icedtea-unbreak-float.patch                    |   18 +
 recipes/icedtea/icedtea6-native_1.7.3.bb           |  233 ++++
 14 files changed, 2561 insertions(+), 0 deletions(-)
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/build-hacks-native.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/disable-library-checks.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-compilation.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-sanitychecks.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-freetype.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-zlib.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-fix-jar-command.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-hotspot-make-arch-sane-for-x86.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-javac-in.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-jdk-sane-x86-arch.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-sane-x86-arch-name.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-unbreak-float.patch
 create mode 100644 recipes/icedtea/icedtea6-native_1.7.3.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 40eec41..3c70f41 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -11458,6 +11458,14 @@ sha256=4f23aadcee80a9a03c858e36a8eaaa92149987ce0a3eac276e3003c9b2462739
 md5=a67303675a53781c4e42bdb02ec78e40
 sha256=1ec328f41f8adfbf797599bc7bf4c07de162ac6d565d2b9fd95685b1cbc99ac8
 
+[http://icedtea.classpath.org/download/source/icedtea6-1.7.3.tar.gz]
+md5=9ad707a5edc471e883a66c882adeab46
+sha256=855a7f1a1a7798e3c4c25281b89ee6906a53b226ac39e3153cc0336a6952ca6b
+
+[http://icedtea.classpath.org/download/source/icedtea6-1.8.tar.gz]
+md5=e08dd0762749fb50ec6c273c366ee8ae
+sha256=6823ff87969d978fe5523c729be3074142698c89acc8cc96c05b849fde54f61b
+
 [http://jalimo.evolvis.org/repository/sources/icepick-0.0+hg20080118.tar.bz2]
 md5=ce7b1827e6f4cbe73b9ffa90b0d45a6a
 sha256=63170836095f8451498c813a1f93a9ec70a1164d82aa30650c0f2216ca4377ab
@@ -18966,6 +18974,17 @@ sha256=1272f975052e51d3faf2d7ac13d0b8b4ac68019a688bffe03d9b684a9e3b4480
 md5=850a29b70206bc7fa083cd26acc781f3
 sha256=96159489d8b70db275c125b627c6e6912e6c078279d76b968d2e0969359c9420
 
+<<<<<<< HEAD
+=======
+[http://download.java.net/openjdk/jdk6/promoted/b17/openjdk-6-src-b17-14_oct_2009.tar.gz]
+md5=078fe0ab744c98694decc77f2456c560
+sha256=2019a4c3d2d14620caa78d7df49fd987a041066b4631bde4fd8424033f3c1785
+
+[http://download.java.net/openjdk/jdk6/promoted/b18/openjdk-6-src-b18-16_feb_2010.tar.gz]
+md5=94db01691ab38f98b7d42b2ebf4d5c0b
+sha256=778ea7b323aaa24d3c6e8fe32b8bb0f49040d9e86271859077ada9f9ee3c8ebf
+
+>>>>>>> 14ccfa9... icedtea6-native: backported from openembedded-dev
 [http://jalimo.evolvis.org/repository/sources/openjdk-langtools-jdk7-b31.tar.bz2]
 md5=670931f67b2e4ac46c6e0cd15418f2fa
 sha256=f8b8820e410c137d279d14dec7e7a93217cc371acdfe1b3343b2278d1728932e
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/build-hacks-native.patch b/recipes/icedtea/icedtea6-native-1.7.3/build-hacks-native.patch
new file mode 100644
index 0000000..9432d03
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/build-hacks-native.patch
@@ -0,0 +1,15 @@
+Index: icedtea6-1.6.1/Makefile.am
+===================================================================
+--- icedtea6-1.6.1.orig/Makefile.am	2009-12-24 11:38:06.582572265 +0100
++++ icedtea6-1.6.1/Makefile.am	2009-12-24 11:57:27.159578486 +0100
+@@ -265,6 +265,10 @@
+ 	FT2_LIB="$(FREETYPE2_LIBS)" \
+ 	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
+ 	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
++        OE_CFLAGS="$(OE_CFLAGS)" \
++        OE_CPPFLAGS="$(OE_CPPFLAGS)" \
++        OE_CXXFLAGS="$(OE_CXXFLAGS)" \
++        OE_LDFLAGS="$(OE_LDFLAGS)" \
+ 	JAVAC="" \
+ 	RHINO_JAR="$(RHINO_JAR)" \
+ 	JAR_KNOWS_ATFILE="$(JAR_KNOWS_ATFILE)" \
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/disable-library-checks.patch b/recipes/icedtea/icedtea6-native-1.7.3/disable-library-checks.patch
new file mode 100644
index 0000000..23b8bed
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/disable-library-checks.patch
@@ -0,0 +1,141 @@
+Index: icedtea6-1.7/configure.ac
+===================================================================
+--- icedtea6-1.7.orig/configure.ac	2010-01-26 04:52:18.000000000 +0100
++++ icedtea6-1.7/configure.ac	2010-02-08 12:05:51.354556052 +0100
+@@ -205,9 +205,9 @@
+ fi
+ 
+ dnl pkgconfig cannot be used to find these headers and libraries.
+-AC_CHECK_HEADERS([cups/cups.h cups/ppd.h],[]
+-	,[AC_MSG_ERROR("CUPS headers were not found -
+-	try installing cups-devel.")])
++#AC_CHECK_HEADERS([cups/cups.h cups/ppd.h],[]
++#	,[AC_MSG_ERROR("CUPS headers were not found -
++#	try installing cups-devel.")])
+ AC_CHECK_HEADERS([X11/X.h],[]
+ 	,[AC_MSG_ERROR("xorg headers were not found -
+ 	try installing xorg-x11-proto-devel.")])
+@@ -239,12 +239,12 @@
+ AC_SUBST(XT_LIBS)
+ 
+ dnl Check for libXp headers and libraries.
+-PKG_CHECK_MODULES(XP, xp,[XP_FOUND=yes],[XP_FOUND=no])
+-if test "x${XP_FOUND}" = xno
+-then
+-  AC_MSG_ERROR([Could not find Xp - \
+-  Try installing libXp-devel.])
+-fi
++#PKG_CHECK_MODULES(XP, xp,[XP_FOUND=yes],[XP_FOUND=no])
++#if test "x${XP_FOUND}" = xno
++#then
++#  AC_MSG_ERROR([Could not find Xp - \
++#  Try installing libXp-devel.])
++#fi
+ AC_SUBST(XP_CFLAGS)
+ AC_SUBST(XP_LIBS)
+ 
+@@ -258,16 +258,16 @@
+ AC_SUBST(X11_CFLAGS)
+ AC_SUBST(X11_LIBS)
+ 
+-dnl Check for libXinerama headers and libraries.
+-PKG_CHECK_MODULES(XINERAMA, xinerama,[XINERAMA_FOUND=yes]
+-	,[XINERAMA_FOUND=no])
+-if test "x${XINERAMA_FOUND}" = xno
+-then
+-  AC_MSG_ERROR([Could not find Xinerama - \
+-  Try installing libXinerama-devel.])
+-fi
+-AC_SUBST(XINERAMA_CFLAGS)
+-AC_SUBST(XINERAMA_LIBS)
++#dnl Check for libXinerama headers and libraries.
++#PKG_CHECK_MODULES(XINERAMA, xinerama,[XINERAMA_FOUND=yes]
++#	,[XINERAMA_FOUND=no])
++#if test "x${XINERAMA_FOUND}" = xno
++#then
++#  AC_MSG_ERROR([Could not find Xinerama - \
++#  Try installing libXinerama-devel.])
++#fi
++#AC_SUBST(XINERAMA_CFLAGS)
++#AC_SUBST(XINERAMA_LIBS)
+ 
+ if test "x${ENABLE_XRENDER}" = "xyes"
+ then
+@@ -341,26 +341,26 @@
+   AC_CONFIG_FILES([tapset/jstack.stp])
+ fi
+ 
+-dnl Check for libpng headers and libraries.
+-PKG_CHECK_MODULES(LIBPNG, libpng,[LIBPNG_FOUND=yes]
+-	,[LIBPNG_FOUND=no])
+-if test "x${LIBPNG_FOUND}" = xno
+-then
+-  AC_MSG_ERROR([Could not find libpng - \
+-  Try installing libpng-devel.])
+-fi
+-AC_SUBST(LIBPNG_CFLAGS)
+-AC_SUBST(LIBPNG_LIBS)
+-
+-dnl Check for libXtst headers and libraries.
+-PKG_CHECK_MODULES(XTST, xtst,[XTST_FOUND=yes],[XTST_FOUND=no])
+-if test "x${XTST_FOUND}" = xno
+-then
+-  AC_MSG_ERROR([Could not find Xtst - \
+-  Try installing libXtst-devel.])
+-fi
+-AC_SUBST(XTST_CFLAGS)
+-AC_SUBST(XTST_LIBS)
++#dnl Check for libpng headers and libraries.
++#PKG_CHECK_MODULES(LIBPNG, libpng,[LIBPNG_FOUND=yes]
++#	,[LIBPNG_FOUND=no])
++#if test "x${LIBPNG_FOUND}" = xno
++#then
++#  AC_MSG_ERROR([Could not find libpng - \
++#  Try installing libpng-devel.])
++#fi
++#AC_SUBST(LIBPNG_CFLAGS)
++#AC_SUBST(LIBPNG_LIBS)
++
++#dnl Check for libXtst headers and libraries.
++#PKG_CHECK_MODULES(XTST, xtst,[XTST_FOUND=yes],[XTST_FOUND=no])
++#if test "x${XTST_FOUND}" = xno
++#then
++#  AC_MSG_ERROR([Could not find Xtst - \
++#  Try installing libXtst-devel.])
++#fi
++#AC_SUBST(XTST_CFLAGS)
++#AC_SUBST(XTST_LIBS)
+ 
+ dnl Check for freetype2 headers and libraries.
+ PKG_CHECK_MODULES(FREETYPE2, freetype2,[FREETYPE2_FOUND=yes]
+@@ -373,18 +373,18 @@
+ AC_SUBST(FREETYPE2_CFLAGS)
+ AC_SUBST(FREETYPE2_LIBS)
+ 
+-dnl Check for alsa headers and libraries (only required for Linux).
+-if test "x${BUILD_OS_DIR}" = "xlinux"
+-then
+-  PKG_CHECK_MODULES(ALSA, alsa,[ALSA_FOUND=yes],[ALSA_FOUND=no])
+-  if test "x${ALSA_FOUND}" = xno
+-  then
+-    AC_MSG_ERROR([Could not find alsa - \
+-    Try installing alsa-lib-devel.])
+-  fi
+-AC_SUBST(ALSA_CFLAGS)
+-AC_SUBST(ALSA_LIBS)
+-fi
++#dnl Check for alsa headers and libraries (only required for Linux).
++#if test "x${BUILD_OS_DIR}" = "xlinux"
++#then
++#  PKG_CHECK_MODULES(ALSA, alsa,[ALSA_FOUND=yes],[ALSA_FOUND=no])
++#  if test "x${ALSA_FOUND}" = xno
++#  then
++#    AC_MSG_ERROR([Could not find alsa - \
++#    Try installing alsa-lib-devel.])
++#  fi
++#AC_SUBST(ALSA_CFLAGS)
++#AC_SUBST(ALSA_LIBS)
++#fi
+ 
+ if test "x${enable_pulse_java}" = "xyes"
+ then
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-compilation.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-compilation.patch
new file mode 100644
index 0000000..cd0f68a
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-compilation.patch
@@ -0,0 +1,513 @@
+Index: openjdk/jdk/make/sun/awt/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/awt/Makefile	2009-04-24 09:33:55.000000000 +0200
++++ openjdk/jdk/make/sun/awt/Makefile	2009-09-29 13:57:14.446815782 +0200
+@@ -180,7 +180,8 @@
+ include $(BUILDDIR)/common/Mapfile-vers.gmk
+ include $(BUILDDIR)/common/Library.gmk
+ 
+-build: fontconfigs
++#build: fontconfigs
++build:
+ 
+ 
+ ifeq ($(PLATFORM), windows)
+@@ -535,9 +536,9 @@
+             -I$(PLATFORM_SRC)/native/$(PKGDIR) \
+ 	    $(EVENT_MODEL)
+ 
+-ifeq ($(PLATFORM), linux)
+-LDFLAGS += -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
+-endif
++#ifeq ($(PLATFORM), linux)
++#LDFLAGS += -L$(MOTIF_LIB) -L$(OPENWIN_LIB)
++#endif
+ 
+ LDFLAGS += -L$(LIBDIR)/$(LIBARCH)/$(TSOBJDIR) \
+ 	   $(AWT_RUNPATH)
+Index: openjdk/jdk/make/javax/sound/jsoundalsa/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/javax/sound/jsoundalsa/Makefile	2009-09-29 13:48:34.534565581 +0200
++++ openjdk/jdk/make/javax/sound/jsoundalsa/Makefile	2009-09-29 13:57:14.446815782 +0200
+@@ -44,34 +44,35 @@
+ # Files
+ #
+ 
+-FILES_c = \
+-	Utilities.c \
+-	$(DAUDIOFILES_c) \
+-	$(MIDIFILES_c) \
+-	$(PORTFILES_c)
++#FILES_c = \
++#	Utilities.c \
++#	$(DAUDIOFILES_c) \
++#	$(MIDIFILES_c) \
++#	$(PORTFILES_c)
+ 
+ # platform dependent files
+-FILES_c += \
+-	PLATFORM_API_LinuxOS_ALSA_CommonUtils.c   \
+-	PLATFORM_API_LinuxOS_ALSA_PCM.c     \
+-	PLATFORM_API_LinuxOS_ALSA_PCMUtils.c   \
+-	PLATFORM_API_LinuxOS_ALSA_MidiIn.c  \
+-	PLATFORM_API_LinuxOS_ALSA_MidiOut.c \
+-	PLATFORM_API_LinuxOS_ALSA_MidiUtils.c \
+-	PLATFORM_API_LinuxOS_ALSA_Ports.c
+-
+-FILES_export = \
+-	$(DAUDIOFILES_export) \
+-	$(MIDIFILES_export) \
+-	$(PORTFILES_export)
++#FILES_c += \
++#	PLATFORM_API_LinuxOS_ALSA_CommonUtils.c   \
++#	PLATFORM_API_LinuxOS_ALSA_PCM.c     \
++#	PLATFORM_API_LinuxOS_ALSA_PCMUtils.c   \
++#	PLATFORM_API_LinuxOS_ALSA_MidiIn.c  \
++#	PLATFORM_API_LinuxOS_ALSA_MidiOut.c \
++#	PLATFORM_API_LinuxOS_ALSA_MidiUtils.c \
++#	PLATFORM_API_LinuxOS_ALSA_Ports.c
++
++FILES_export =
++#FILES_export = \
++#	$(DAUDIOFILES_export) \
++#	$(MIDIFILES_export) \
++#	$(PORTFILES_export)
+ 
+-OTHER_LDLIBS += -lasound
++#OTHER_LDLIBS += -lasound
+ 
+ CPPFLAGS += \
+-	-DUSE_DAUDIO=TRUE \
+-	-DUSE_PORTS=TRUE  \
+-	-DUSE_PLATFORM_MIDI_OUT=TRUE \
+-	-DUSE_PLATFORM_MIDI_IN=TRUE \
++	-DUSE_DAUDIO=FALSE \
++	-DUSE_PORTS=FALSE  \
++	-DUSE_PLATFORM_MIDI_OUT=FALSE \
++	-DUSE_PLATFORM_MIDI_IN=FALSE \
+ 	-I$(SHARE_SRC)/native/com/sun/media/sound
+ 
+ #
+Index: openjdk/jdk/make/sun/splashscreen/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/splashscreen/Makefile	2009-09-29 13:48:33.738565601 +0200
++++ openjdk/jdk/make/sun/splashscreen/Makefile	2009-09-29 13:57:14.446815782 +0200
+@@ -32,7 +32,8 @@
+ #
+ # Files
+ #
+-include FILES_c.gmk
++#include FILES_c.gmk
++FILES_c = 
+ 
+ FILES_java = \
+     java/awt/SplashScreen.java
+@@ -62,9 +63,9 @@
+ CFLAGS += -DSPLASHSCREEN -DPNG_NO_MMX_CODE
+ 
+ ifneq ($(PLATFORM), windows)
+-  CFLAGS += -DWITH_X11
+-  CPPFLAGS += -I$(OPENWIN_HOME)/include -I$(OPENWIN_HOME)/include/X11/extensions
+-  OTHER_LDLIBS += -L$(OPENWIN_LIB) -lX11 -lXext $(LIBM) -lpng -ljpeg -lgif -lz -lpthread
++#  CFLAGS += -DWITH_X11
++#  CPPFLAGS += -I$(OPENWIN_HOME)/include -I$(OPENWIN_HOME)/include/X11/extensions
++#  OTHER_LDLIBS += -L$(OPENWIN_LIB) -lX11 -lXext $(LIBM) -lpng -ljpeg -lgif -lz -lpthread
+ else # PLATFORM
+   CFLAGS += -DWITH_WIN32
+   OTHER_LDLIBS += kernel32.lib user32.lib gdi32.lib 
+@@ -79,7 +80,7 @@
+ vpath %.c   $(SHARE_SRC)/native/$(PKGDIR)/image/jpeg
+ vpath %.c   $(PLATFORM_SRC)/native/$(PKGDIR)/splashscreen
+ 
+-CPPFLAGS += -I$(PLATFORM_SRC)/native/$(PKGDIR)/splashscreen -I$(SHARE_SRC)/native/$(PKGDIR)/splashscreen
++#CPPFLAGS += -I$(PLATFORM_SRC)/native/$(PKGDIR)/splashscreen -I$(SHARE_SRC)/native/$(PKGDIR)/splashscreen
+ 
+ ifeq ($(PLATFORM), linux)
+   ifeq ($(ARCH_DATA_MODEL), 64)
+Index: openjdk/jdk/make/sun/xawt/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/xawt/Makefile	2009-04-24 09:33:56.000000000 +0200
++++ openjdk/jdk/make/sun/xawt/Makefile	2009-09-29 13:57:14.446815782 +0200
+@@ -41,15 +41,16 @@
+ #
+ # Files
+ #
+-include FILES_c_unix.gmk
+-include FILES_export_unix.gmk
++#include FILES_c_unix.gmk
++FILES_c = 
++#include FILES_export_unix.gmk
+ AUTO_FILES_JAVA_DIRS = sun/awt/X11
+ AUTO_JAVA_PRUNE = WrapperGenerator.java
+ 
+ LDFLAGS += -L$(OPENWIN_LIB)
+ 
+ ifeq ($(PLATFORM), linux)
+-LDFLAGS += -lpthread
++#LDFLAGS += -lpthread
+ dummy := $(shell $(MKDIR) -p $(LIB_LOCATION))
+ endif
+ 
+@@ -86,16 +87,19 @@
+ vpath %.c   $(PLATFORM_SRC)/native/sun/java2d/opengl
+ vpath %.c   $(PLATFORM_SRC)/native/sun/java2d/x11
+ 
+-OTHER_LDLIBS = $(LIBM) -lawt -lXext -lX11 -ldl \
+-                   $(LDFLAGS_COMMON) $(AWT_RUNPATH) $(OTHER_LDFLAGS) -lXtst -lXi
++#OTHER_LDLIBS = $(LIBM) -lawt -lXext -lX11 -ldl \
++#                   $(LDFLAGS_COMMON) $(AWT_RUNPATH) $(OTHER_LDFLAGS) -lXtst -lXi
+ 
+ ifeq  ($(PLATFORM), solaris)
+ CPPFLAGS += -DFUNCPROTO=15
+ dummy := $(shell $(MKDIR) -p $(LIB_LOCATION))
+ endif
+ 
+-CPPFLAGS += -I$(CUPS_HEADERS_PATH)
++#CPPFLAGS += -I$(CUPS_HEADERS_PATH)
+ 
++# Normally we would like to patch these includes away but
++# we need them for the successfull compilation of the sizer
++# executables.
+ CPPFLAGS += -DXAWT -DXAWT_HACK \
+         -I$(TEMPDIR)/../../sun.awt/awt/CClassHeaders \
+         -I$(PLATFORM_SRC)/native/sun/awt \
+@@ -124,10 +128,10 @@
+ 
+ ifeq ($(PLATFORM), linux)
+ # Allows for builds on Debian GNU Linux, X11 is in a different place 
+-  CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
+-              -I/usr/include/X11/extensions \
+-              -I$(MOTIF_DIR)/include \
+-              -I$(OPENWIN_HOME)/include 
++#  CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
++#              -I/usr/include/X11/extensions \
++#              -I$(MOTIF_DIR)/include \
++#              -I$(OPENWIN_HOME)/include 
+ endif
+ 
+ ifeq ($(PLATFORM), solaris)
+@@ -238,18 +242,20 @@
+ 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
+ 
+ $(SIZES): $(SIZERS)
+-	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
+-	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
+-	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
+-	    $(CHMOD) +w $@;\
+-	else	\
+-	    $(ECHO) GENERATING $@; \
+-	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
+-	fi
+-	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
+-	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
+-	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
+-	fi	
++	touch $(SIZES)
++#
++#	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
++#	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
++#	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
++#	    $(CHMOD) +w $@;\
++#	else	\
++#	    $(ECHO) GENERATING $@; \
++#	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
++#	fi
++#	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
++#	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
++#	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
++#	fi	
+ 
+ $(TEMPDIR)/.gen.wrappers: $(SIZES) $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
+ 	$(BOOT_JAVA_CMD) -cp $(WRAPPER_GENERATOR_TEMPDIR) WrapperGenerator \
+Index: openjdk/jdk/make/sun/jawt/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/jawt/Makefile	2009-09-29 13:48:34.186565471 +0200
++++ openjdk/jdk/make/sun/jawt/Makefile	2009-09-29 13:57:14.446815782 +0200
+@@ -36,7 +36,8 @@
+ ifeq ($(PLATFORM), windows)
+ FILES_cpp = jawt.cpp
+ else # PLATFORM
+-FILES_c = jawt.c
++FILES_c = 
++#FILES_c = jawt.c
+ endif # PLATFORM
+ 
+ FILES_h = $(INCLUDEDIR)/jawt.h \
+Index: openjdk/jdk/make/sun/jpeg/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/sun/jpeg/Makefile	2009-09-29 13:48:33.726565626 +0200
++++ openjdk/jdk/make/sun/jpeg/Makefile	2009-09-29 13:57:14.446815782 +0200
+@@ -37,7 +37,8 @@
+ #
+ # Files
+ #
+-include FILES_c.gmk
++FILES_c = 
++#include FILES_c.gmk
+ 
+ AUTO_FILES_JAVA_DIRS = sun/awt/image com/sun/imageio/plugins/jpeg
+ 
+Index: openjdk/jdk/make/common/shared/Defs-java.gmk
+===================================================================
+--- openjdk.orig/jdk/make/common/shared/Defs-java.gmk	2009-09-29 13:48:55.954565215 +0200
++++ openjdk/jdk/make/common/shared/Defs-java.gmk	2009-09-29 13:57:14.446815782 +0200
+@@ -36,14 +36,14 @@
+ # Memory related -J flags that all uses of java tools should use.
+ #
+ JAVA_MEM_FLAGS   = -Xmx$(MAX_VM_MEMORY)m
+-ifneq (,$(filter $(ARCH), ia64 s390))
++#ifneq (,$(filter $(ARCH), ia64 s390))
+   # Special flags for javac on ia64 to work around a VM problem with
+   #   bad code generation during inlining (what version had this problem?):
+   #   Suspect this may not be needed anymore.
+-  JAVA_MEM_FLAGS   += -Xms$(MAX_VM_MEMORY)m -XX:-Inline
+-else
+-  JAVA_MEM_FLAGS   += -Xms$(MIN_VM_MEMORY)m -XX:PermSize=32m -XX:MaxPermSize=160m
+-endif
++#  JAVA_MEM_FLAGS   += -Xms$(MAX_VM_MEMORY)m -XX:-Inline
++#else
++#  JAVA_MEM_FLAGS   += -Xms$(MIN_VM_MEMORY)m -XX:PermSize=32m -XX:MaxPermSize=160m
++#endif
+ 
+ # 
+ # All java tools (javac, javah, and javadoc) run faster with certain java
+Index: openjdk/jdk/src/share/classes/java/awt/GraphicsEnvironment.java
+===================================================================
+--- openjdk.orig/jdk/src/share/classes/java/awt/GraphicsEnvironment.java	2009-04-24 09:34:04.000000000 +0200
++++ openjdk/jdk/src/share/classes/java/awt/GraphicsEnvironment.java	2009-09-29 13:57:14.450815511 +0200
+@@ -113,7 +113,7 @@
+      * @since 1.4
+      */
+     public static boolean isHeadless() {
+-        return getHeadlessProperty();
++        return true;
+     }
+ 
+     /**
+Index: openjdk/corba/make/common/Defs.gmk
+===================================================================
+--- openjdk.orig/corba/make/common/Defs.gmk	2009-04-24 09:30:19.000000000 +0200
++++ openjdk/corba/make/common/Defs.gmk	2009-09-29 13:57:14.450815511 +0200
+@@ -444,11 +444,11 @@
+ # Tool flags
+ #
+ ASFLAGS         = $(ASFLAGS_$(VARIANT)) $(ASFLAGS_COMMON) $(OTHER_ASFLAGS)
+-CFLAGS          = $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) $(OTHER_CFLAGS)
+-CXXFLAGS        = $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) $(OTHER_CXXFLAGS)
+-CPPFLAGS        = $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) $(OTHER_CPPFLAGS) \
++CFLAGS          = $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) $(OTHER_CFLAGS) $(OE_CFLAGS)
++CXXFLAGS        = $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) $(OTHER_CXXFLAGS) $(OE_CXXFLAGS)
++CPPFLAGS        = $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) $(OTHER_CPPFLAGS) $(OE_CPPFLAGS) \
+ 		  $(DEFINES) $(OPTIONS:%=-D%)
+-LDFLAGS         = $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) $(OTHER_LDFLAGS)
++LDFLAGS         = $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) $(OTHER_LDFLAGS) $(OE_LDFLAGS)
+ LDLIBS          = $(OTHER_LDLIBS) $(LDLIBS_$(VARIANT)) $(LDLIBS_COMMON)
+ LINTFLAGS       = $(LINTFLAGS_$(VARIANT)) $(LINTFLAGS_COMMON) \
+ 		  $(OTHER_LINTFLAGS)
+Index: openjdk/jdk/make/common/Defs.gmk
+===================================================================
+--- openjdk.orig/jdk/make/common/Defs.gmk	2009-09-29 13:48:33.590565061 +0200
++++ openjdk/jdk/make/common/Defs.gmk	2009-09-29 13:57:14.450815511 +0200
+@@ -662,11 +662,11 @@
+ # Tool flags
+ #
+ ASFLAGS         = $(ASFLAGS_$(VARIANT)) $(ASFLAGS_COMMON) $(OTHER_ASFLAGS)
+-CFLAGS          = $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) $(OTHER_CFLAGS)
+-CXXFLAGS        = $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) $(OTHER_CXXFLAGS)
+-CPPFLAGS        = $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) $(OTHER_CPPFLAGS) \
++CFLAGS          = $(CFLAGS_$(VARIANT)/BYFILE)   $(CFLAGS_COMMON) $(OTHER_CFLAGS) $(OE_CFLAGS)
++CXXFLAGS        = $(CXXFLAGS_$(VARIANT)/BYFILE) $(CXXFLAGS_COMMON) $(OTHER_CXXFLAGS) $(OE_CXXFLAGS)
++CPPFLAGS        = $(CPPFLAGS_$(VARIANT)) $(CPPFLAGS_COMMON) $(OTHER_CPPFLAGS) $(OE_CPPFLAGS) \
+ 		  $(DEFINES) $(OPTIONS:%=-D%)
+-LDFLAGS         = $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) $(OTHER_LDFLAGS)
++LDFLAGS         = $(LDFLAGS_$(VARIANT)) $(LDFLAGS_COMMON) $(OTHER_LDFLAGS) $(OE_LDFLAGS)
+ LDLIBS          = $(OTHER_LDLIBS) $(LDLIBS_$(VARIANT)) $(LDLIBS_COMMON)
+ LINTFLAGS       = $(LINTFLAGS_$(VARIANT)) $(LINTFLAGS_COMMON) \
+ 		  $(OTHER_LINTFLAGS)
+Index: openjdk/hotspot/make/linux/makefiles/vm.make
+===================================================================
+--- openjdk.orig/hotspot/make/linux/makefiles/vm.make	2009-09-29 13:48:34.098565716 +0200
++++ openjdk/hotspot/make/linux/makefiles/vm.make	2009-09-29 13:57:14.450815511 +0200
+@@ -170,6 +170,7 @@
+ LIBS_VM   += $(LLVM_LIBS)
+ endif
+ 
++LFLAGS_VM = $(OE_LDFLAGS)
+ LINK_VM = $(LINK_LIB.c)
+ 
+ # rule for building precompiled header
+Index: openjdk/jdk/src/solaris/native/sun/awt/CUPSfuncs.c
+===================================================================
+--- openjdk.orig/jdk/src/solaris/native/sun/awt/CUPSfuncs.c	2009-04-24 09:34:34.000000000 +0200
++++ openjdk/jdk/src/solaris/native/sun/awt/CUPSfuncs.c	2009-09-29 13:57:14.450815511 +0200
+@@ -26,8 +26,10 @@
+ #include <jni.h>
+ #include <jni_util.h>
+ #include <dlfcn.h>
++#if 0
+ #include <cups/cups.h>
+ #include <cups/ppd.h>
++#endif
+ 
+ //#define CUPS_DEBUG
+ 
+@@ -37,6 +39,7 @@
+ #define DPRINTF(x, y)
+ #endif
+ 
++#if 0
+ typedef const char* (*fn_cupsServer)(void);
+ typedef int (*fn_ippPort)(void);
+ typedef http_t* (*fn_httpConnect)(const char *, int);
+@@ -56,7 +59,7 @@
+ fn_ppdClose j2d_ppdClose;
+ fn_ppdFindOption j2d_ppdFindOption;
+ fn_ppdPageSize j2d_ppdPageSize;
+-
++#endif
+ 
+ /*
+  * Initialize library functions.
+@@ -65,6 +68,7 @@
+ JNIEXPORT jboolean JNICALL
+ Java_sun_print_CUPSPrinter_initIDs(JNIEnv *env,
+                                          jobject printObj) {
++#if 0
+   void *handle = dlopen("libcups.so.2", RTLD_LAZY | RTLD_GLOBAL);
+ 
+   if (handle == NULL) {
+@@ -131,6 +135,8 @@
+   }
+ 
+   return JNI_TRUE;
++#endif
++	return JNI_FALSE;
+ }
+ 
+ /*
+@@ -141,6 +147,7 @@
+ Java_sun_print_CUPSPrinter_getCupsServer(JNIEnv *env,
+                                          jobject printObj)
+ {
++#if 0
+     jstring cServer = NULL;
+     const char* server = j2d_cupsServer();
+     if (server != NULL) {
+@@ -152,6 +159,8 @@
+         }
+     }
+     return cServer;
++#endif
++	return NULL;
+ }
+ 
+ /*
+@@ -162,8 +171,11 @@
+ Java_sun_print_CUPSPrinter_getCupsPort(JNIEnv *env,
+                                          jobject printObj)
+ {
++#if 0
+     int port = j2d_ippPort();
+     return (jint) port;
++#endif
++	return 0;
+ }
+ 
+ 
+@@ -177,6 +189,7 @@
+                                       jstring server,
+                                       jint port)
+ {
++#if 0
+     const char *serverName;
+     serverName = (*env)->GetStringUTFChars(env, server, NULL);
+     if (serverName != NULL) {
+@@ -187,6 +200,7 @@
+             return JNI_TRUE;
+         }
+     }
++#endif
+     return JNI_FALSE;
+ }
+ 
+@@ -199,6 +213,7 @@
+                                          jobject printObj,
+                                          jstring printer)
+ {
++#if 0
+     ppd_file_t *ppd;
+     ppd_option_t *optionTray, *optionPage;
+     ppd_choice_t *choice;
+@@ -304,6 +319,8 @@
+     j2d_ppdClose(ppd);
+     unlink(filename);
+     return nameArray;
++#endif
++	return NULL;
+ }
+ 
+ 
+@@ -315,6 +332,7 @@
+                                          jobject printObj,
+                                          jstring printer)
+ {
++#if 0
+     ppd_file_t *ppd;
+     ppd_option_t *option;
+     ppd_choice_t *choice;
+@@ -374,4 +392,6 @@
+     j2d_ppdClose(ppd);
+     unlink(filename);
+     return sizeArray;
++#endif
++	return NULL;
+ }
+Index: openjdk/jdk/src/share/classes/sun/java2d/SunGraphicsEnvironment.java
+===================================================================
+--- openjdk.orig/jdk/src/share/classes/sun/java2d/SunGraphicsEnvironment.java	2009-04-24 09:34:17.000000000 +0200
++++ openjdk/jdk/src/share/classes/sun/java2d/SunGraphicsEnvironment.java	2009-09-29 13:57:14.454815276 +0200
+@@ -244,6 +244,8 @@
+                  * that might be specified.
+                  */
+                 fontConfig = createFontConfiguration();
++								if (fontConfig == null)
++									return null;
+                 getPlatformFontPathFromFontConfig();
+ 
+                 String extraFontPath = fontConfig.getExtraFontPath();
+Index: openjdk/jdk/src/solaris/classes/sun/awt/X11GraphicsEnvironment.java
+===================================================================
+--- openjdk.orig/jdk/src/solaris/classes/sun/awt/X11GraphicsEnvironment.java	2009-04-24 09:34:33.000000000 +0200
++++ openjdk/jdk/src/solaris/classes/sun/awt/X11GraphicsEnvironment.java	2009-09-29 13:57:14.454815276 +0200
+@@ -899,7 +899,8 @@
+ 
+     // Implements SunGraphicsEnvironment.createFontConfiguration.
+     protected FontConfiguration createFontConfiguration() {
+-        return new MFontConfiguration(this);
++//        return new MFontConfiguration(this);
++			return null;
+     }
+     public FontConfiguration
+         createFontConfiguration(boolean preferLocaleFonts,
+Index: openjdk/jdk/make/launchers/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/launchers/Makefile	2009-09-29 13:48:33.490815135 +0200
++++ openjdk/jdk/make/launchers/Makefile	2009-09-29 13:57:14.454815276 +0200
+@@ -57,7 +57,7 @@
+ endif
+ # Run MAKE $@ for all generic launchers
+ define make-all-launchers
+-$(call make-launcher, appletviewer, sun.applet.Main, , )
++#$(call make-launcher, appletviewer, sun.applet.Main, , )
+ $(call make-launcher, apt, com.sun.tools.apt.Main, , )
+ $(call make-launcher, extcheck, com.sun.tools.extcheck.Main, , )
+ $(call make-launcher, idlj, com.sun.tools.corba.se.idl.toJavaPortable.Compile, , )
+@@ -93,7 +93,7 @@
+   -J-Dcom.sun.CORBA.activation.Port=1049 \
+   -J-Dcom.sun.CORBA.POA.ORBServerId=1, )
+ $(call make-launcher, pack200, com.sun.java.util.jar.pack.Driver, , --pack)
+-$(call make-launcher, policytool, sun.security.tools.PolicyTool, , )
++#$(call make-launcher, policytool, sun.security.tools.PolicyTool, , )
+ $(call make-launcher, rmic, sun.rmi.rmic.Main, , )
+ $(call make-launcher, rmid, sun.rmi.server.Activation, , )
+ $(call make-launcher, rmiregistry, sun.rmi.registry.RegistryImpl, , )
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-sanitychecks.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-sanitychecks.patch
new file mode 100644
index 0000000..1dbdd80
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-sanitychecks.patch
@@ -0,0 +1,76 @@
+Index: openjdk-ecj/jdk/make/common/shared/Sanity.gmk
+===================================================================
+--- openjdk-ecj/jdk/make/common/shared/Sanity.gmk.orig	2009-07-18 00:55:46.924662599 +0200
++++ openjdk-ecj/jdk/make/common/shared/Sanity.gmk	2009-07-18 01:00:50.241296356 +0200
+@@ -1,3 +1,4 @@
++# BLA
+ #
+ # Copyright 2005-2007 Sun Microsystems, Inc.  All Rights Reserved.
+ # DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+@@ -80,8 +81,8 @@
+       ALSA_VERSION = 1.0.0
+     else
+       # dummy program that outputs ALSA's version (created in target sane-alsa-versioncheck)
+-      ALSA_VERSION_CHECK = $(TEMPDIR)/alsaversioncheck
+-      ALSA_VERSION = `if [ -f "$(ALSA_VERSION_CHECK)" ] ; then $(ALSA_VERSION_CHECK) ; fi`
++#      ALSA_VERSION_CHECK = $(TEMPDIR)/alsaversioncheck
++#      ALSA_VERSION = `if [ -f "$(ALSA_VERSION_CHECK)" ] ; then $(ALSA_VERSION_CHECK) ; fi`
+     endif
+   endif
+ endif
+@@ -131,11 +132,7 @@
+ 
+ ifndef CROSS_COMPILATION
+ MORE_PHONY_RULES = \
+-	sane-freetype \
+-  sane-cups \
+-  sane-motif \
+-  sane-alsa-versioncheck \
+-  sane-alsa-headers
++	sane-freetype
+ endif
+ 
+ .PHONY: \
+Index: openjdk-ecj/jdk/make/common/Sanity.gmk
+===================================================================
+--- openjdk-ecj/jdk/make/common/Sanity.gmk.orig	2009-07-18 00:55:46.924662599 +0200
++++ openjdk-ecj/jdk/make/common/Sanity.gmk	2009-07-18 01:02:48.041771212 +0200
+@@ -95,10 +95,6 @@
+     sane-alt_bootdir \
+     sane-bootdir
+ 
+-ifndef CROSS_COMPILATION
+-sanity-all:: sane-alsa-headers
+-endif
+-
+ ifdef OPENJDK
+ sanity-all:: sane-freetype 
+ endif
+@@ -109,27 +105,6 @@
+     sane-motif
+ endif
+ 
+-# on Linux, only check motif path if we are not building it from scratch.
+-#   (Which only happens with a full control build. The control makefiles are
+-#    the files that set BUILD_MOTIF).
+-#   We cannot sanity check something that has not been built yet. 
+-ifndef CROSS_COMPILATION
+-  ifeq ($(PLATFORM), linux)
+-    ifneq ($(BUILD_MOTIF), true)
+-sanity-all:: \
+-  sane-motif
+-    endif
+-  endif
+-endif
+-
+-# Always check cups header paths on solaris & linux
+-ifndef CROSS_COMPILATION
+-  ifneq ($(PLATFORM), windows)
+-sanity-all:: \
+-    sane-cups
+-  endif
+-endif
+-
+ # Always check hotspot binary paths even if we are building them from scratch
+ HOTSPOT_IMPORT_CHECK=true
+ ifeq ($(HOTSPOT_IMPORT_CHECK),true)
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-freetype.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-freetype.patch
new file mode 100644
index 0000000..3420fbd
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-freetype.patch
@@ -0,0 +1,13 @@
+Index: openjdk/jdk/make/tools/freetypecheck/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/tools/freetypecheck/Makefile	2009-09-29 13:48:33.590565061 +0200
++++ openjdk/jdk/make/tools/freetypecheck/Makefile	2009-09-29 14:00:04.470566156 +0200
+@@ -45,7 +45,7 @@
+   FT_OPTIONS  = $(CFLAGS)
+ endif
+ 
+-FT_OPTIONS += -I$(FT_HEADERS) -I$(FT_HEADERS)/freetype2
++FT_OPTIONS += -I$(FT_HEADERS) -I$(FT_HEADERS)/freetype2 $(FREETYPE2_CFLAGS) $(FREETYPE2_LIBS) $(FREETYPE2_HEADERS)
+ FT_OPTIONS += $(XARCH)
+ 
+ #add runtime library search path
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-zlib.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-zlib.patch
new file mode 100644
index 0000000..eff7e48
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-zlib.patch
@@ -0,0 +1,61 @@
+Index: openjdk/jdk/make/com/sun/java/pack/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/com/sun/java/pack/Makefile	2009-09-29 13:48:34.538565136 +0200
++++ openjdk/jdk/make/com/sun/java/pack/Makefile	2009-09-29 14:00:26.226565853 +0200
+@@ -80,7 +80,7 @@
+   OTHER_LDLIBS += $(JVMLIB)
+ endif
+ 
+-OTHER_LDLIBS += -lz
++OTHER_LDLIBS += -L$(libdir) -lz
+ CXXFLAGS_DBG += -DFULL
+ CXXFLAGS_OPT += -DPRODUCT
+ CXXFLAGS_COMMON += -DFULL
+Index: openjdk/jdk/make/common/Defs.gmk
+===================================================================
+--- openjdk.orig/jdk/make/common/Defs.gmk	2009-09-29 13:57:14.450815511 +0200
++++ openjdk/jdk/make/common/Defs.gmk	2009-09-29 14:00:26.226565853 +0200
+@@ -289,7 +289,7 @@
+ 
+ endif # PROGRAM
+ 
+-LDLIBS_COMMON += $(EXTRA_LIBS)
++LDLIBS_COMMON += $(EXTRA_LIBS) -L$(libdir)
+ 
+ #
+ # Default is to build, not import native binaries
+@@ -425,7 +425,7 @@
+ CLASSDESTDIR = $(CLASSBINDIR)
+ endif
+ 
+-INCLUDES = -I. -I$(CLASSHDRDIR) \
++INCLUDES = -I$(includedir) -I. -I$(CLASSHDRDIR) \
+ 	$(patsubst %,-I%,$(subst $(CLASSPATH_SEPARATOR), ,$(VPATH.h))) $(OTHER_INCLUDES)
+ OTHER_CPPFLAGS = $(INCLUDES)
+ 
+Index: openjdk/jdk/make/common/Program.gmk
+===================================================================
+--- openjdk.orig/jdk/make/common/Program.gmk	2009-09-29 13:48:33.914565255 +0200
++++ openjdk/jdk/make/common/Program.gmk	2009-09-29 14:00:26.226565853 +0200
+@@ -73,7 +73,7 @@
+ # itself, as with all the Windows libraries.
+ #
+ ifneq (,$(findstring $(PLATFORM), linux solaris))	# UNIX systems
+-    LDFLAGS += -L $(LIBDIR)/$(LIBARCH)/jli
++    LDFLAGS += -L $(LIBDIR)/$(LIBARCH)/jli -L $(libdir)
+     OTHER_LDLIBS += -ljli
+     ifeq ($(PLATFORM), solaris)
+ 	ifeq ($(ARCH_DATA_MODEL), 32)
+Index: openjdk/jdk/make/java/jli/Makefile
+===================================================================
+--- openjdk.orig/jdk/make/java/jli/Makefile	2009-09-29 13:48:33.806565054 +0200
++++ openjdk/jdk/make/java/jli/Makefile	2009-09-29 14:00:26.230565844 +0200
+@@ -61,7 +61,7 @@
+ ifneq (,$(findstring $(PLATFORM), linux solaris))	# UNIX systems
+ 	LIB_LOCATION = $(LIBDIR)/$(LIBARCH)/jli
+ 	# Guarantee very limited dependencies
+-	LDLIBS = -lz -lc 
++	LDLIBS = -L$(libdir) -lz -lc
+ endif
+ 
+ ifeq ($(PLATFORM), windows)
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-fix-jar-command.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-fix-jar-command.patch
new file mode 100644
index 0000000..607797e
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-fix-jar-command.patch
@@ -0,0 +1,27 @@
+Index: icedtea6-1.8/Makefile.am
+===================================================================
+--- icedtea6-1.8.orig/Makefile.am	2010-06-17 10:29:13.654666801 +0200
++++ icedtea6-1.8/Makefile.am	2010-06-17 10:30:50.334670771 +0200
+@@ -1662,12 +1662,7 @@
+ 	rm -f extra-source-files.txt
+ 
+ extra-lib/about.jar: stamps/extra-class-files.stamp
+-	if ! test -d $(ICEDTEA_BOOT_DIR) ; \
+-	then \
+-	  $(JAR) cf $@ -C extra-lib net ; \
+-	else \
+-	  $(ICEDTEA_BOOT_DIR)/bin/jar cf $@ -C extra-lib net ; \
+-	fi
++	$(ICEDTEA_BOOT_DIR)/bin/jar cf $@ -C extra-lib net ;
+ 
+ # PulseAudio based mixer
+ # (pulse-java)
+@@ -1750,7 +1745,7 @@
+ stamps/rewrite-rhino.stamp: stamps/rewriter.stamp $(RHINO_JAR)
+ if WITH_RHINO
+ 	mkdir -p rhino/rhino.{old,new}
+-	(cd rhino/rhino.old ; jar xf $(RHINO_JAR))
++	(cd rhino/rhino.old ; $(ICEDTEA_BOOT_DIR)/bin/jar xf $(RHINO_JAR))
+ 	$(ICEDTEA_BOOT_DIR)/bin/java -cp $(abs_top_builddir)/rewriter \
+ 	  com.redhat.rewriter.ClassRewriter \
+ 	  $(abs_top_builddir)/rhino/rhino.old $(abs_top_builddir)/rhino/rhino.new \
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-hotspot-make-arch-sane-for-x86.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-hotspot-make-arch-sane-for-x86.patch
new file mode 100644
index 0000000..9d7b9bb
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-hotspot-make-arch-sane-for-x86.patch
@@ -0,0 +1,1130 @@
+From b8a51665ada45e3beb0823c03c025d5514f5e745 Mon Sep 17 00:00:00 2001
+From: woglinde <woglinde@rhein.zuhause.netz>
+Date: Thu, 22 Oct 2009 16:35:25 +0200
+Subject: [PATCH] hotspot: make arch sane for x86
+
+diff --git openjdk/hotspot/agent/make/saenv.sh openjdk/hotspot/agent/make/saenv.sh
+index 38e0f78..64c8410 100644
+--- openjdk/hotspot/agent/make/saenv.sh
++++ openjdk/hotspot/agent/make/saenv.sh
+@@ -43,9 +43,9 @@ if [ "$OS" = "Linux" ]; then
+      OPTIONS="-Dsa.library.path=$SA_LIBPATH"
+      CPU=amd64
+    else
+-     SA_LIBPATH=$STARTDIR/../src/os/linux/i386:$STARTDIR/linux/i386
++     SA_LIBPATH=$STARTDIR/../src/os/linux/x86:$STARTDIR/linux/x86
+      OPTIONS="-Dsa.library.path=$SA_LIBPATH"
+-     CPU=i386
++     CPU=x86
+    fi
+ else
+    SA_LIBPATH=$STARTDIR/../src/os/solaris/proc/`uname -p`:$STARTDIR/solaris/`uname -p`
+diff --git openjdk/hotspot/make/defs.make openjdk/hotspot/make/defs.make
+index 83ddd1a..c20c7eb 100644
+--- openjdk/hotspot/make/defs.make
++++ openjdk/hotspot/make/defs.make
+@@ -207,7 +207,7 @@ ifneq ($(OSNAME),windows)
+     ifdef LP64
+       BUILDARCH = amd64
+     else
+-      BUILDARCH = i486
++      BUILDARCH = x86
+     endif
+   endif
+   ifeq ($(BUILDARCH), sparc)
+@@ -218,7 +218,7 @@ ifneq ($(OSNAME),windows)
+ 
+   # LIBARCH is 1:1 mapping from BUILDARCH
+   LIBARCH         = $(LIBARCH/$(BUILDARCH))
+-  LIBARCH/i486    = i386
++  LIBARCH/x86     = x86
+   LIBARCH/amd64   = amd64
+   LIBARCH/sparc   = sparc
+   LIBARCH/sparcv9 = sparcv9
+diff --git openjdk/hotspot/make/jprt.config openjdk/hotspot/make/jprt.config
+index bc82543..4a1ef4e 100644
+--- openjdk/hotspot/make/jprt.config
++++ openjdk/hotspot/make/jprt.config
+@@ -111,7 +111,7 @@ elif [ "${osname}" = Linux ] ; then
+     # LINUX: X86, AMD64
+     osarch=`uname -m`
+     if [ "${osarch}" = i686 ] ; then
+-	linux_arch=i586
++	linux_arch=x86
+     elif [ "${osarch}" = x86_64 ] ; then
+ 	linux_arch=amd64
+     fi
+diff --git openjdk/hotspot/make/jprt.properties openjdk/hotspot/make/jprt.properties
+index eb2ce82..7193de0 100644
+--- openjdk/hotspot/make/jprt.properties
++++ openjdk/hotspot/make/jprt.properties
+@@ -70,7 +70,7 @@ jprt.my.solaris.x64.jdk6u10=solaris_x64_5.10
+ jprt.my.solaris.x64.jdk6u14=solaris_x64_5.10
+ jprt.my.solaris.x64=${jprt.my.solaris.x64.${jprt.tools.default.release}}
+ 
+-jprt.my.linux.i586=linux_i586
++jprt.my.linux.x86=linux_x86
+ jprt.my.linux.x64=linux_x64
+ jprt.my.windows.i586=windows_i586
+ jprt.my.windows.x64=windows_x64
+@@ -201,30 +201,30 @@ jprt.my.solaris.i586.test.targets= \
+     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_2, \
+     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_3
+ 
+-jprt.my.linux.i586.test.targets = \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-jvm98, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-scimark, \
+-    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp, \
+-    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_2, \
+-    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_3, \
+-    ${jprt.my.linux.i586}-fastdebug-c1-runThese_Xshare, \
+-    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp, \
+-    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp_2, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_default, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_default, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_SerialGC, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParallelGC, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParNewGC, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_CMS, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_default, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_ParallelGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_CMS, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_2, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_3
++jprt.my.linux.x86.test.targets = \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-jvm98, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-scimark, \
++    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp, \
++    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_2, \
++    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_3, \
++    ${jprt.my.linux.x86}-fastdebug-c1-runThese_Xshare, \
++    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp, \
++    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp_2, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_default, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_default, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_SerialGC, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParallelGC, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParNewGC, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_CMS, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_default, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_ParallelGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_CMS, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_2, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_3
+ 
+ jprt.my.linux.x64.test.targets = \
+     ${jprt.my.linux.x64}-{product|fastdebug}-c2-jvm98, \
+@@ -294,7 +294,7 @@ jprt.test.targets = \
+   ${jprt.my.solaris.sparcv9.test.targets}, \
+   ${jprt.my.solaris.i586.test.targets}, \
+   ${jprt.my.solaris.x64.test.targets}, \
+-  ${jprt.my.linux.i586.test.targets}, \
++  ${jprt.my.linux.x86.test.targets}, \
+   ${jprt.my.linux.x64.test.targets}, \
+   ${jprt.my.windows.i586.test.targets}, \
+   ${jprt.my.windows.x64.test.targets}
+diff --git openjdk/hotspot/make/linux/build.sh openjdk/hotspot/make/linux/build.sh
+index e317fdd..5d3b1ff 100644
+--- openjdk/hotspot/make/linux/build.sh
++++ openjdk/hotspot/make/linux/build.sh
+@@ -43,7 +43,7 @@ esac
+ 
+ case `uname -m` in
+   i386|i486|i586|i686)
+-    mach=i386
++    mach=x86
+     ;;
+   *)
+     echo "Unsupported machine: " `uname -m`
+diff --git openjdk/hotspot/make/linux/makefiles/buildtree.make openjdk/hotspot/make/linux/makefiles/buildtree.make
+index add9823..cbbf81f 100644
+--- openjdk/hotspot/make/linux/makefiles/buildtree.make
++++ openjdk/hotspot/make/linux/makefiles/buildtree.make
+@@ -30,7 +30,7 @@
+ # The macros ARCH, GAMMADIR, OS_FAMILY and VARIANT must be defined in the
+ # environment or on the command-line:
+ #
+-# ARCH		- sparc, i486, ... HotSpot cpu and os_cpu source directory
++# ARCH		- sparc, x86, ... HotSpot cpu and os_cpu source directory
+ # BUILDARCH     - build directory
+ # LIBARCH       - the corresponding directory in JDK/JRE
+ # GAMMADIR	- top of workspace
+@@ -316,7 +316,7 @@ NO_JAVA_HOME_MSG	= \
+ DATA_MODE = $(DATA_MODE/$(BUILDARCH))
+ JAVA_FLAG = $(JAVA_FLAG/$(DATA_MODE))
+ 
+-DATA_MODE/i486    = 32
++DATA_MODE/x86     = 32
+ DATA_MODE/sparc   = 32
+ DATA_MODE/sparcv9 = 64
+ DATA_MODE/amd64   = 64
+diff --git openjdk/hotspot/make/linux/makefiles/cscope.make openjdk/hotspot/make/linux/makefiles/cscope.make
+index 113d4f8..d3f06cb 100644
+--- openjdk/hotspot/make/linux/makefiles/cscope.make
++++ openjdk/hotspot/make/linux/makefiles/cscope.make
+@@ -78,7 +78,7 @@ endif
+ # Processor-specific files for other processors are excluded by default.  Use
+ # CS_CPU=x to include platform-specific files for other platforms.
+ ifndef	CS_CPU
+-CS_CPU		= i486 sparc amd64 ia64
++CS_CPU		= x86 sparc amd64 ia64
+ CS_PRUNE_CPU	= $(patsubst %,-o -name '*%*',$(filter-out ${SRCARCH},${CS_CPU}))
+ endif
+ 
+diff --git openjdk/hotspot/make/linux/makefiles/defs.make openjdk/hotspot/make/linux/makefiles/defs.make
+index 9131c79..138dfb3 100644
+--- openjdk/hotspot/make/linux/makefiles/defs.make
++++ openjdk/hotspot/make/linux/makefiles/defs.make
+@@ -85,6 +85,14 @@ ifeq ($(ARCH), sparc)
+   HS_ARCH          = sparc
+ endif
+ 
++# x86
++ifeq ($(findstring 86,$(ARCH)), 86)
++  ARCH_DATA_MODEL  = 32
++  PLATFORM         = linux-x86
++  VM_PLATFORM      = linux_x86
++  HS_ARCH          = x86
++endif
++
+ # x86_64
+ ifeq ($(ARCH), x86_64) 
+   ifeq ($(ARCH_DATA_MODEL), 64)
+@@ -95,22 +103,12 @@ ifeq ($(ARCH), x86_64)
+     HS_ARCH         = x86
+   else
+     ARCH_DATA_MODEL = 32
+-    PLATFORM        = linux-i586
+-    VM_PLATFORM     = linux_i486
++    PLATFORM        = linux-x86
++    VM_PLATFORM     = linux_x86
+     HS_ARCH         = x86
+-    # We have to reset ARCH to i686 since SRCARCH relies on it
+-    ARCH            = i686   
+   endif
+ endif
+ 
+-# i686
+-ifeq ($(ARCH), i686)
+-  ARCH_DATA_MODEL  = 32
+-  PLATFORM         = linux-i586
+-  VM_PLATFORM      = linux_i486
+-  HS_ARCH          = x86
+-endif
+-
+ JDK_INCLUDE_SUBDIR=linux
+ 
+ # FIXUP: The subdirectory for a debug build is NOT the same on all platforms
+diff --git openjdk/hotspot/make/linux/makefiles/sparcWorks.make openjdk/hotspot/make/linux/makefiles/sparcWorks.make
+index 0a9f75b..2e29bb9 100644
+--- openjdk/hotspot/make/linux/makefiles/sparcWorks.make
++++ openjdk/hotspot/make/linux/makefiles/sparcWorks.make
+@@ -30,7 +30,7 @@ CC  = cc
+ AS  = $(CC) -c
+ 
+ ARCHFLAG = $(ARCHFLAG/$(BUILDARCH))
+-ARCHFLAG/i486    = -m32
++ARCHFLAG/x86    = -m32
+ ARCHFLAG/amd64   = -m64
+ 
+ CFLAGS     += $(ARCHFLAG)
+diff --git openjdk/hotspot/make/linux/platform_i486 openjdk/hotspot/make/linux/platform_i486
+deleted file mode 100644
+index 610ac91..0000000
+--- openjdk/hotspot/make/linux/platform_i486
++++ /dev/null
+@@ -1,15 +0,0 @@
+-os_family = linux
+-
+-arch = x86
+-
+-arch_model = x86_32
+-
+-os_arch = linux_x86
+-
+-os_arch_model = linux_x86_32
+-
+-lib_arch = i386
+-
+-compiler = gcc
+-
+-sysdefs = -DLINUX -D_GNU_SOURCE -DIA32
+diff --git openjdk/hotspot/make/linux/platform_i486.suncc openjdk/hotspot/make/linux/platform_i486.suncc
+index 325a3fe..717fc75 100644
+--- openjdk/hotspot/make/linux/platform_i486.suncc
++++ openjdk/hotspot/make/linux/platform_i486.suncc
+@@ -8,10 +8,10 @@ os_arch = linux_x86
+ 
+ os_arch_model = linux_x86_32
+ 
+-lib_arch = i386
++lib_arch = x86
+ 
+ compiler = sparcWorks
+ 
+-gnu_dis_arch = i386
++gnu_dis_arch = x86
+ 
+ sysdefs = -DLINUX -DSPARC_WORKS -D_GNU_SOURCE -DIA32
+diff --git openjdk/hotspot/make/linux/platform_x86 openjdk/hotspot/make/linux/platform_x86
+new file mode 100644
+index 0000000..5c613fe
+--- /dev/null
++++ openjdk/hotspot/make/linux/platform_x86
+@@ -0,0 +1,15 @@
++os_family = linux
++
++arch = x86
++
++arch_model = x86_32
++
++os_arch = linux_x86
++
++os_arch_model = linux_x86_32
++
++lib_arch = x86
++
++compiler = gcc
++
++sysdefs = -DLINUX -D_GNU_SOURCE -DIA32
+diff --git openjdk/hotspot/src/os/linux/vm/os_linux.cpp openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+index b2b3162..a4bbe70 100644
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+@@ -164,7 +164,7 @@ bool os::have_special_privileges() {
+ // i386: 224, ia64: 1105, amd64: 186, sparc 143
+ #ifdef __ia64__
+ #define SYS_gettid 1105
+-#elif __i386__
++#elif __x86__
+ #define SYS_gettid 224
+ #elif __amd64__
+ #define SYS_gettid 186
+@@ -181,7 +181,7 @@ static char cpu_arch[] = ZERO_LIBARCH;
+ #elif defined(IA64)
+ static char cpu_arch[] = "ia64";
+ #elif defined(IA32)
+-static char cpu_arch[] = "i386";
++static char cpu_arch[] = "x86";
+ #elif defined(AMD64)
+ static char cpu_arch[] = "amd64";
+ #elif defined(SPARC)
+diff --git openjdk/hotspot/src/share/tools/hsdis/Makefile openjdk/hotspot/src/share/tools/hsdis/Makefile
+index 6bdf4b8..fd43c6e 100644
+--- openjdk/hotspot/src/share/tools/hsdis/Makefile
++++ openjdk/hotspot/src/share/tools/hsdis/Makefile
+@@ -32,7 +32,7 @@ BINUTILS	= $(shell cd ../../../../..;pwd)/binutils-2.17-$(LIBARCH)
+ endif
+ 
+ # Default arch; it is changed below as needed.
+-ARCH		= i386
++ARCH		= x86
+ OS		= $(shell uname)
+ 
+ CPPFLAGS	+= -I$(BINUTILS)/include -I$(BINUTILS)/bfd
+@@ -87,7 +87,7 @@ endif	# SunOS
+ LIBARCH		= $(ARCH)
+ ifdef		LP64
+ LIBARCH64/sparc	= sparcv9
+-LIBARCH64/i386	= amd64
++LIBARCH64/x86	= amd64
+ LIBARCH64	= $(LIBARCH64/$(ARCH))
+ ifneq		($(LIBARCH64),)
+ LIBARCH		= $(LIBARCH64)
+diff --git openjdk/hotspot/src/share/tools/hsdis/hsdis.c openjdk/hotspot/src/share/tools/hsdis/hsdis.c
+index 75b7efe..62c692b 100644
+--- openjdk/hotspot/src/share/tools/hsdis/hsdis.c
++++ openjdk/hotspot/src/share/tools/hsdis/hsdis.c
+@@ -383,8 +383,8 @@ static void print_help(struct hsdis_app_data* app_data,
+   else
+     disassembler_usage(stderr); /* better than nothing */
+   (*printf_callback)(printf_stream, "  mach=<arch>   select disassembly mode\n");
+-#if defined(LIBARCH_i386) || defined(LIBARCH_amd64)
+-  (*printf_callback)(printf_stream, "  mach=i386     select 32-bit mode\n");
++#if defined(LIBARCH_x86) || defined(LIBARCH_amd64)
++  (*printf_callback)(printf_stream, "  mach=x86      select 32-bit mode\n");
+   (*printf_callback)(printf_stream, "  mach=x86-64   select 64-bit mode\n");
+   (*printf_callback)(printf_stream, "  suffix        always print instruction suffix\n");
+ #endif
+@@ -406,7 +406,7 @@ static const bfd_arch_info_type* find_arch_info(const char* arch_name) {
+ static const char* native_arch_name() {
+   const char* res = HOTSPOT_LIB_ARCH;
+ #ifdef LIBARCH_amd64
+-    res = "i386:x86-64";
++    res = "x86:x86-64";
+ #endif
+ #ifdef LIBARCH_sparc
+     res = "sparc:v8plusb";
+diff --git openjdk/hotspot/test/Makefile openjdk/hotspot/test/Makefile
+index 2596d85..c2f3eb9 100644
+--- openjdk/hotspot/test/Makefile
++++ openjdk/hotspot/test/Makefile
+@@ -33,14 +33,14 @@ ifeq ($(OSNAME), SunOS)
+   PLATFORM = solaris
+   ARCH = $(shell uname -p)
+   ifeq ($(ARCH), i386)
+-    ARCH=i586
++    ARCH=x86
+   endif
+ endif
+ ifeq ($(OSNAME), Linux)
+   PLATFORM = linux
+   ARCH = $(shell uname -m)
+-  ifeq ($(ARCH), i386)
+-    ARCH = i586
++  ifeq ($(findstring 86,$(ARCH)), 86)
++    ARCH = x86
+   endif
+ endif
+ ifeq ($(OSNAME), Windows_NT)
+@@ -55,7 +55,7 @@ ifeq ($(OSNAME), Windows_NT)
+       ifeq ($(word 1, $(PROCESSOR_IDENTIFIER)),EM64T)
+         ARCH = x64
+       else
+-        ARCH = i586
++        ARCH = x86
+       endif
+     endif
+   endif
+diff --git openjdk/hotspot/agent/make/saenv.sh openjdk/hotspot/agent/make/saenv.sh
+index 38e0f78..64c8410 100644
+--- openjdk/hotspot/agent/make/saenv.sh
++++ openjdk/hotspot/agent/make/saenv.sh
+@@ -43,9 +43,9 @@ if [ "$OS" = "Linux" ]; then
+      OPTIONS="-Dsa.library.path=$SA_LIBPATH"
+      CPU=amd64
+    else
+-     SA_LIBPATH=$STARTDIR/../src/os/linux/i386:$STARTDIR/linux/i386
++     SA_LIBPATH=$STARTDIR/../src/os/linux/x86:$STARTDIR/linux/x86
+      OPTIONS="-Dsa.library.path=$SA_LIBPATH"
+-     CPU=i386
++     CPU=x86
+    fi
+ else
+    SA_LIBPATH=$STARTDIR/../src/os/solaris/proc/`uname -p`:$STARTDIR/solaris/`uname -p`
+diff --git openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c
+index c4ca7de..54c12ca 100644
+--- openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c
++++ openjdk/hotspot/agent/src/os/linux/LinuxDebuggerLocal.c
+@@ -29,7 +29,7 @@
+ #define amd64 1
+ #endif
+ 
+-#ifdef i386
++#ifdef x86
+ #include "sun_jvm_hotspot_debugger_x86_X86ThreadContext.h"
+ #endif
+ 
+@@ -295,7 +295,7 @@ JNIEXPORT jlongArray JNICALL Java_sun_jvm_hotspot_debugger_linux_LinuxDebuggerLo
+   }
+ 
+ #undef NPRGREG
+-#ifdef i386
++#ifdef x86
+ #define NPRGREG sun_jvm_hotspot_debugger_x86_X86ThreadContext_NPRGREG
+ #endif
+ #ifdef ia64
+@@ -314,7 +314,7 @@ JNIEXPORT jlongArray JNICALL Java_sun_jvm_hotspot_debugger_linux_LinuxDebuggerLo
+ 
+ #undef REG_INDEX
+ 
+-#ifdef i386
++#ifdef x86
+ #define REG_INDEX(reg) sun_jvm_hotspot_debugger_x86_X86ThreadContext_##reg
+ 
+   regs[REG_INDEX(GS)]  = (uintptr_t) gregs.xgs;
+@@ -333,7 +333,7 @@ JNIEXPORT jlongArray JNICALL Java_sun_jvm_hotspot_debugger_linux_LinuxDebuggerLo
+   regs[REG_INDEX(CS)]  = (uintptr_t) gregs.xcs;
+   regs[REG_INDEX(SS)]  = (uintptr_t) gregs.xss;
+ 
+-#endif /* i386 */
++#endif /* x86 */
+ 
+ #if ia64
+   regs = (*env)->GetLongArrayElements(env, array, &isCopy);
+diff --git openjdk/hotspot/agent/src/os/linux/Makefile openjdk/hotspot/agent/src/os/linux/Makefile
+index a16f3a7..85fecb1 100644
+--- openjdk/hotspot/agent/src/os/linux/Makefile
++++ openjdk/hotspot/agent/src/os/linux/Makefile
+@@ -22,7 +22,7 @@
+ #  
+ #
+ 
+-ARCH := $(shell if ([ `uname -m` = "ia64" ])  ; then echo ia64 ; elif ([ `uname -m` = "x86_64" ]) ; then echo amd64; elif ([ `uname -m` = "sparc64" ]) ; then echo sparc; else echo i386 ; fi )
++ARCH := $(shell if ([ `uname -m` = "ia64" ])  ; then echo ia64 ; elif ([ `uname -m` = "x86_64" ]) ; then echo amd64; elif ([ `uname -m` = "sparc64" ]) ; then echo sparc; else echo x86 ; fi )
+ GCC      = gcc$(GCC_SUFFIX)
+ 
+ JAVAH    = ${JAVA_HOME}/bin/javah
+diff --git openjdk/hotspot/agent/src/os/linux/ps_core.c openjdk/hotspot/agent/src/os/linux/ps_core.c
+index 3562f2d..47ab01b 100644
+--- openjdk/hotspot/agent/src/os/linux/ps_core.c
++++ openjdk/hotspot/agent/src/os/linux/ps_core.c
+@@ -540,7 +540,7 @@ static bool core_handle_prstatus(struct ps_prochandle* ph, const char* buf, size
+ 
+    if (is_debug()) {
+       print_debug("integer regset\n");
+-#ifdef i386
++#ifdef x86
+       // print the regset
+       print_debug("\teax = 0x%x\n", newthr->regs.eax);
+       print_debug("\tebx = 0x%x\n", newthr->regs.ebx);
+diff --git openjdk/hotspot/make/defs.make openjdk/hotspot/make/defs.make
+index 83ddd1a..c20c7eb 100644
+--- openjdk/hotspot/make/defs.make
++++ openjdk/hotspot/make/defs.make
+@@ -207,7 +207,7 @@ ifneq ($(OSNAME),windows)
+     ifdef LP64
+       BUILDARCH = amd64
+     else
+-      BUILDARCH = i486
++      BUILDARCH = x86
+     endif
+   endif
+   ifeq ($(BUILDARCH), sparc)
+@@ -218,7 +218,7 @@ ifneq ($(OSNAME),windows)
+ 
+   # LIBARCH is 1:1 mapping from BUILDARCH
+   LIBARCH         = $(LIBARCH/$(BUILDARCH))
+-  LIBARCH/i486    = i386
++  LIBARCH/x86     = x86
+   LIBARCH/amd64   = amd64
+   LIBARCH/sparc   = sparc
+   LIBARCH/sparcv9 = sparcv9
+diff --git openjdk/hotspot/make/jprt.config openjdk/hotspot/make/jprt.config
+index bc82543..4a1ef4e 100644
+--- openjdk/hotspot/make/jprt.config
++++ openjdk/hotspot/make/jprt.config
+@@ -111,7 +111,7 @@ elif [ "${osname}" = Linux ] ; then
+     # LINUX: X86, AMD64
+     osarch=`uname -m`
+     if [ "${osarch}" = i686 ] ; then
+-	linux_arch=i586
++	linux_arch=x86
+     elif [ "${osarch}" = x86_64 ] ; then
+ 	linux_arch=amd64
+     fi
+diff --git openjdk/hotspot/make/jprt.properties openjdk/hotspot/make/jprt.properties
+index eb2ce82..7193de0 100644
+--- openjdk/hotspot/make/jprt.properties
++++ openjdk/hotspot/make/jprt.properties
+@@ -70,7 +70,7 @@ jprt.my.solaris.x64.jdk6u10=solaris_x64_5.10
+ jprt.my.solaris.x64.jdk6u14=solaris_x64_5.10
+ jprt.my.solaris.x64=${jprt.my.solaris.x64.${jprt.tools.default.release}}
+ 
+-jprt.my.linux.i586=linux_i586
++jprt.my.linux.x86=linux_x86
+ jprt.my.linux.x64=linux_x64
+ jprt.my.windows.i586=windows_i586
+ jprt.my.windows.x64=windows_x64
+@@ -201,30 +201,30 @@ jprt.my.solaris.i586.test.targets= \
+     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_2, \
+     ${jprt.my.solaris.i586}-{product|fastdebug}-{c1|c2}-scimark_3
+ 
+-jprt.my.linux.i586.test.targets = \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-jvm98, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-scimark, \
+-    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp, \
+-    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_2, \
+-    ${jprt.my.linux.i586}-product-c1-runThese_Xcomp_3, \
+-    ${jprt.my.linux.i586}-fastdebug-c1-runThese_Xshare, \
+-    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp, \
+-    ${jprt.my.linux.i586}-fastdebug-c2-runThese_Xcomp_2, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_default, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_default, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_SerialGC, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParallelGC, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_ParNewGC, \
+-    ${jprt.my.linux.i586}-product-{c1|c2}-GCOld_CMS, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_default, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_ParallelGC, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c1-jbb_CMS, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_2, \
+-    ${jprt.my.linux.i586}-{product|fastdebug}-c2-scimark_3
++jprt.my.linux.x86.test.targets = \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-jvm98, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-scimark, \
++    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp, \
++    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_2, \
++    ${jprt.my.linux.x86}-product-c1-runThese_Xcomp_3, \
++    ${jprt.my.linux.x86}-fastdebug-c1-runThese_Xshare, \
++    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp, \
++    ${jprt.my.linux.x86}-fastdebug-c2-runThese_Xcomp_2, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_default, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_SerialGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParallelGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_ParNewGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-{c1|c2}-GCBasher_CMS, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_default, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_SerialGC, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParallelGC, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_ParNewGC, \
++    ${jprt.my.linux.x86}-product-{c1|c2}-GCOld_CMS, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_default, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_ParallelGC, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c1-jbb_CMS, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_2, \
++    ${jprt.my.linux.x86}-{product|fastdebug}-c2-scimark_3
+ 
+ jprt.my.linux.x64.test.targets = \
+     ${jprt.my.linux.x64}-{product|fastdebug}-c2-jvm98, \
+@@ -294,7 +294,7 @@ jprt.test.targets = \
+   ${jprt.my.solaris.sparcv9.test.targets}, \
+   ${jprt.my.solaris.i586.test.targets}, \
+   ${jprt.my.solaris.x64.test.targets}, \
+-  ${jprt.my.linux.i586.test.targets}, \
++  ${jprt.my.linux.x86.test.targets}, \
+   ${jprt.my.linux.x64.test.targets}, \
+   ${jprt.my.windows.i586.test.targets}, \
+   ${jprt.my.windows.x64.test.targets}
+diff --git openjdk/hotspot/make/linux/build.sh openjdk/hotspot/make/linux/build.sh
+index e317fdd..5d3b1ff 100644
+--- openjdk/hotspot/make/linux/build.sh
++++ openjdk/hotspot/make/linux/build.sh
+@@ -43,7 +43,7 @@ esac
+ 
+ case `uname -m` in
+   i386|i486|i586|i686)
+-    mach=i386
++    mach=x86
+     ;;
+   *)
+     echo "Unsupported machine: " `uname -m`
+diff --git openjdk/hotspot/make/linux/makefiles/buildtree.make openjdk/hotspot/make/linux/makefiles/buildtree.make
+index add9823..cbbf81f 100644
+--- openjdk/hotspot/make/linux/makefiles/buildtree.make
++++ openjdk/hotspot/make/linux/makefiles/buildtree.make
+@@ -30,7 +30,7 @@
+ # The macros ARCH, GAMMADIR, OS_FAMILY and VARIANT must be defined in the
+ # environment or on the command-line:
+ #
+-# ARCH		- sparc, i486, ... HotSpot cpu and os_cpu source directory
++# ARCH		- sparc, x86, ... HotSpot cpu and os_cpu source directory
+ # BUILDARCH     - build directory
+ # LIBARCH       - the corresponding directory in JDK/JRE
+ # GAMMADIR	- top of workspace
+@@ -316,7 +316,7 @@ NO_JAVA_HOME_MSG	= \
+ DATA_MODE = $(DATA_MODE/$(BUILDARCH))
+ JAVA_FLAG = $(JAVA_FLAG/$(DATA_MODE))
+ 
+-DATA_MODE/i486    = 32
++DATA_MODE/x86     = 32
+ DATA_MODE/sparc   = 32
+ DATA_MODE/sparcv9 = 64
+ DATA_MODE/amd64   = 64
+diff --git openjdk/hotspot/make/linux/makefiles/cscope.make openjdk/hotspot/make/linux/makefiles/cscope.make
+index 113d4f8..d3f06cb 100644
+--- openjdk/hotspot/make/linux/makefiles/cscope.make
++++ openjdk/hotspot/make/linux/makefiles/cscope.make
+@@ -78,7 +78,7 @@ endif
+ # Processor-specific files for other processors are excluded by default.  Use
+ # CS_CPU=x to include platform-specific files for other platforms.
+ ifndef	CS_CPU
+-CS_CPU		= i486 sparc amd64 ia64
++CS_CPU		= x86 sparc amd64 ia64
+ CS_PRUNE_CPU	= $(patsubst %,-o -name '*%*',$(filter-out ${SRCARCH},${CS_CPU}))
+ endif
+ 
+diff --git openjdk/hotspot/make/linux/makefiles/defs.make openjdk/hotspot/make/linux/makefiles/defs.make
+index 9131c79..138dfb3 100644
+--- openjdk/hotspot/make/linux/makefiles/defs.make
++++ openjdk/hotspot/make/linux/makefiles/defs.make
+@@ -85,6 +85,14 @@ ifeq ($(ARCH), sparc)
+   HS_ARCH          = sparc
+ endif
+ 
++# x86
++ifeq ($(findstring 86,$(ARCH)), 86)
++  ARCH_DATA_MODEL  = 32
++  PLATFORM         = linux-x86
++  VM_PLATFORM      = linux_x86
++  HS_ARCH          = x86
++endif
++
+ # x86_64
+ ifeq ($(ARCH), x86_64) 
+   ifeq ($(ARCH_DATA_MODEL), 64)
+@@ -95,22 +103,12 @@ ifeq ($(ARCH), x86_64)
+     HS_ARCH         = x86
+   else
+     ARCH_DATA_MODEL = 32
+-    PLATFORM        = linux-i586
+-    VM_PLATFORM     = linux_i486
++    PLATFORM        = linux-x86
++    VM_PLATFORM     = linux_x86
+     HS_ARCH         = x86
+-    # We have to reset ARCH to i686 since SRCARCH relies on it
+-    ARCH            = i686   
+   endif
+ endif
+ 
+-# i686
+-ifeq ($(ARCH), i686)
+-  ARCH_DATA_MODEL  = 32
+-  PLATFORM         = linux-i586
+-  VM_PLATFORM      = linux_i486
+-  HS_ARCH          = x86
+-endif
+-
+ JDK_INCLUDE_SUBDIR=linux
+ 
+ # FIXUP: The subdirectory for a debug build is NOT the same on all platforms
+diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
+index a2c24bc..27bad01 100644
+--- openjdk/hotspot/make/linux/makefiles/gcc.make
++++ openjdk/hotspot/make/linux/makefiles/gcc.make
+@@ -77,7 +77,7 @@ CFLAGS += -fcheck-new
+ CFLAGS += -g
+ 
+ ARCHFLAG = $(ARCHFLAG/$(BUILDARCH))
+-ARCHFLAG/i486    = -m32 -march=i586
++ARCHFLAG/x86    = -m32
+ ARCHFLAG/amd64   = -m64
+ ARCHFLAG/ia64    =
+ ARCHFLAG/sparc   = -m32 -mcpu=v9
+diff --git openjdk/hotspot/make/linux/makefiles/sparcWorks.make openjdk/hotspot/make/linux/makefiles/sparcWorks.make
+index 0a9f75b..2e29bb9 100644
+--- openjdk/hotspot/make/linux/makefiles/sparcWorks.make
++++ openjdk/hotspot/make/linux/makefiles/sparcWorks.make
+@@ -30,7 +30,7 @@ CC  = cc
+ AS  = $(CC) -c
+ 
+ ARCHFLAG = $(ARCHFLAG/$(BUILDARCH))
+-ARCHFLAG/i486    = -m32
++ARCHFLAG/x86    = -m32
+ ARCHFLAG/amd64   = -m64
+ 
+ CFLAGS     += $(ARCHFLAG)
+diff --git openjdk/hotspot/make/linux/platform_i486 openjdk/hotspot/make/linux/platform_i486
+deleted file mode 100644
+index 610ac91..0000000
+--- openjdk/hotspot/make/linux/platform_i486
++++ /dev/null
+@@ -1,15 +0,0 @@
+-os_family = linux
+-
+-arch = x86
+-
+-arch_model = x86_32
+-
+-os_arch = linux_x86
+-
+-os_arch_model = linux_x86_32
+-
+-lib_arch = i386
+-
+-compiler = gcc
+-
+-sysdefs = -DLINUX -D_GNU_SOURCE -DIA32
+diff --git openjdk/hotspot/make/linux/platform_i486.suncc openjdk/hotspot/make/linux/platform_i486.suncc
+deleted file mode 100644
+index 325a3fe..0000000
+--- openjdk/hotspot/make/linux/platform_i486.suncc
++++ /dev/null
+@@ -1,17 +0,0 @@
+-os_family = linux
+-
+-arch = x86
+-
+-arch_model = x86_32
+-
+-os_arch = linux_x86
+-
+-os_arch_model = linux_x86_32
+-
+-lib_arch = i386
+-
+-compiler = sparcWorks
+-
+-gnu_dis_arch = i386
+-
+-sysdefs = -DLINUX -DSPARC_WORKS -D_GNU_SOURCE -DIA32
+diff --git openjdk/hotspot/make/linux/platform_x86 openjdk/hotspot/make/linux/platform_x86
+new file mode 100644
+index 0000000..5c613fe
+--- /dev/null
++++ openjdk/hotspot/make/linux/platform_x86
+@@ -0,0 +1,15 @@
++os_family = linux
++
++arch = x86
++
++arch_model = x86_32
++
++os_arch = linux_x86
++
++os_arch_model = linux_x86_32
++
++lib_arch = x86
++
++compiler = gcc
++
++sysdefs = -DLINUX -D_GNU_SOURCE -DIA32
+diff --git openjdk/hotspot/make/linux/platform_x86.suncc openjdk/hotspot/make/linux/platform_x86.suncc
+new file mode 100644
+index 0000000..717fc75
+--- /dev/null
++++ openjdk/hotspot/make/linux/platform_x86.suncc
+@@ -0,0 +1,17 @@
++os_family = linux
++
++arch = x86
++
++arch_model = x86_32
++
++os_arch = linux_x86
++
++os_arch_model = linux_x86_32
++
++lib_arch = x86
++
++compiler = sparcWorks
++
++gnu_dis_arch = x86
++
++sysdefs = -DLINUX -DSPARC_WORKS -D_GNU_SOURCE -DIA32
+diff --git openjdk/hotspot/src/os/linux/launcher/java_md.c openjdk/hotspot/src/os/linux/launcher/java_md.c
+index 50a86cd..48141be 100644
+--- openjdk/hotspot/src/os/linux/launcher/java_md.c
++++ openjdk/hotspot/src/os/linux/launcher/java_md.c
+@@ -56,8 +56,8 @@
+  * models is supported, then DUAL_MODE is defined.  When DUAL_MODE is
+  * defined, the architecture names for the narrow and wide version of
+  * the architecture are defined in BIG_ARCH and SMALL_ARCH.  Currently
+- * only Solaris on sparc/sparcv9 and i586/amd64 is DUAL_MODE; linux
+- * i586/amd64 could be defined as DUAL_MODE but that is not the
++ * only Solaris on sparc/sparcv9 and x86/amd64 is DUAL_MODE; linux
++ * x86/amd64 could be defined as DUAL_MODE but that is not the
+  * current policy.
+  */
+ 
+@@ -75,8 +75,8 @@
+ 
+ #else /* 32-bit data model */
+ 
+-#  ifdef i586
+-#    define ARCH "i386"
++#  ifdef x86
++#    define ARCH "x86"
+ #  elif defined(__sparc)
+ #    define ARCH "sparc"
+ #  endif
+@@ -90,7 +90,7 @@
+ #    define SMALL_ARCH "sparc"
+ #  else
+ #    define BIG_ARCH "amd64"
+-#    define SMALL_ARCH "i386"
++#    define SMALL_ARCH "x86"
+ #  endif
+ #  include <sys/systeminfo.h>
+ #  include <sys/elf.h>
+@@ -1103,7 +1103,7 @@ void PrintMachineDependentOptions() {
+  * This code is somewhat more confused with #ifdef's than we'd
+  * like because this file is used by both Solaris and Linux
+  * platforms, and so needs to be parameterized for SPARC and
+- * i586 hardware.  The other Linux platforms (amd64 and ia64)
++ * x86 hardware.  The other Linux platforms (amd64 and ia64)
+  * don't even ask this question, because they only come with
+  * server JVMs.  */
+ 
+@@ -1168,11 +1168,11 @@ solaris_sparc_ServerClassMachine(void) {
+ 
+ #endif /* __sun && __sparc */
+ 
+-#if defined(__sun) && defined(i586)
++#if defined(__sun) && defined(x86)
+ 
+ /*
+  * A utility method for asking the CPU about itself.
+- * There's a corresponding version of linux-i586
++ * There's a corresponding version of linux-x86
+  * because the compilers are different.
+  */
+ void
+@@ -1218,13 +1218,13 @@ get_cpuid(uint32_t arg,
+ #endif
+ }
+ 
+-#endif /* __sun && i586 */
++#endif /* __sun && x86 */
+ 
+-#if defined(__linux__) && defined(i586)
++#if defined(__linux__) && defined(x86)
+ 
+ /*
+  * A utility method for asking the CPU about itself.
+- * There's a corresponding version of solaris-i586
++ * There's a corresponding version of solaris-x86
+  * because the compilers are different.
+  */
+ void
+@@ -1286,11 +1286,11 @@ get_cpuid(uint32_t arg,
+ #endif
+ }
+ 
+-#endif /* __linux__ && i586 */
++#endif /* __linux__ && x86 */
+ 
+-#ifdef i586
++#ifdef x86
+ /*
+- * Routines shared by solaris-i586 and linux-i586.
++ * Routines shared by solaris-x86 and linux-x86.
+  */
+ 
+ enum HyperThreadingSupport_enum {
+@@ -1430,11 +1430,11 @@ physical_processors(void) {
+   return result;
+ }
+ 
+-#endif /* i586 */
++#endif /* x86 */
+ 
+-#if defined(__sun) && defined(i586)
++#if defined(__sun) && defined(x86)
+ 
+-/* The definition of a server-class machine for solaris-i586/amd64 */
++/* The definition of a server-class machine for solaris-x86/amd64 */
+ jboolean
+ solaris_i586_ServerClassMachine(void) {
+   jboolean            result            = JNI_FALSE;
+@@ -1463,11 +1463,11 @@ solaris_i586_ServerClassMachine(void) {
+   return result;
+ }
+ 
+-#endif /* __sun && i586 */
++#endif /* __sun && x86 */
+ 
+-#if defined(__linux__) && defined(i586)
++#if defined(__linux__) && defined(x86)
+ 
+-/* The definition of a server-class machine for linux-i586 */
++/* The definition of a server-class machine for linux-x86 */
+ jboolean
+ linux_i586_ServerClassMachine(void) {
+   jboolean            result            = JNI_FALSE;
+@@ -1496,7 +1496,7 @@ linux_i586_ServerClassMachine(void) {
+   return result;
+ }
+ 
+-#endif /* __linux__ && i586 */
++#endif /* __linux__ && x86 */
+ 
+ /* Dispatch to the platform-specific definition of "server-class" */
+ jboolean
+@@ -1504,9 +1504,9 @@ ServerClassMachine(void) {
+   jboolean result = JNI_FALSE;
+ #if   defined(__sun) && defined(__sparc)
+   result = solaris_sparc_ServerClassMachine();
+-#elif defined(__sun) && defined(i586)
++#elif defined(__sun) && defined(x86)
+   result = solaris_i586_ServerClassMachine();
+-#elif defined(__linux__) && defined(i586)
++#elif defined(__linux__) && defined(x86)
+   result = linux_i586_ServerClassMachine();
+ #else
+   if (_launcher_debug) {
+diff --git openjdk/hotspot/src/os/linux/vm/os_linux.cpp openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+index b2b3162..a4bbe70 100644
+--- openjdk/hotspot/src/os/linux/vm/os_linux.cpp
++++ openjdk/hotspot/src/os/linux/vm/os_linux.cpp
+@@ -164,7 +164,7 @@ bool os::have_special_privileges() {
+ // i386: 224, ia64: 1105, amd64: 186, sparc 143
+ #ifdef __ia64__
+ #define SYS_gettid 1105
+-#elif __i386__
++#elif __x86__
+ #define SYS_gettid 224
+ #elif __amd64__
+ #define SYS_gettid 186
+@@ -181,7 +181,7 @@ static char cpu_arch[] = ZERO_LIBARCH;
+ #elif defined(IA64)
+ static char cpu_arch[] = "ia64";
+ #elif defined(IA32)
+-static char cpu_arch[] = "i386";
++static char cpu_arch[] = "x86";
+ #elif defined(AMD64)
+ static char cpu_arch[] = "amd64";
+ #elif defined(SPARC)
+diff --git openjdk/hotspot/src/share/tools/hsdis/Makefile openjdk/hotspot/src/share/tools/hsdis/Makefile
+index 6bdf4b8..fd43c6e 100644
+--- openjdk/hotspot/src/share/tools/hsdis/Makefile
++++ openjdk/hotspot/src/share/tools/hsdis/Makefile
+@@ -32,7 +32,7 @@ BINUTILS	= $(shell cd ../../../../..;pwd)/binutils-2.17-$(LIBARCH)
+ endif
+ 
+ # Default arch; it is changed below as needed.
+-ARCH		= i386
++ARCH		= x86
+ OS		= $(shell uname)
+ 
+ CPPFLAGS	+= -I$(BINUTILS)/include -I$(BINUTILS)/bfd
+@@ -87,7 +87,7 @@ endif	# SunOS
+ LIBARCH		= $(ARCH)
+ ifdef		LP64
+ LIBARCH64/sparc	= sparcv9
+-LIBARCH64/i386	= amd64
++LIBARCH64/x86	= amd64
+ LIBARCH64	= $(LIBARCH64/$(ARCH))
+ ifneq		($(LIBARCH64),)
+ LIBARCH		= $(LIBARCH64)
+diff --git openjdk/hotspot/src/share/tools/hsdis/hsdis.c openjdk/hotspot/src/share/tools/hsdis/hsdis.c
+index 75b7efe..62c692b 100644
+--- openjdk/hotspot/src/share/tools/hsdis/hsdis.c
++++ openjdk/hotspot/src/share/tools/hsdis/hsdis.c
+@@ -383,8 +383,8 @@ static void print_help(struct hsdis_app_data* app_data,
+   else
+     disassembler_usage(stderr); /* better than nothing */
+   (*printf_callback)(printf_stream, "  mach=<arch>   select disassembly mode\n");
+-#if defined(LIBARCH_i386) || defined(LIBARCH_amd64)
+-  (*printf_callback)(printf_stream, "  mach=i386     select 32-bit mode\n");
++#if defined(LIBARCH_x86) || defined(LIBARCH_amd64)
++  (*printf_callback)(printf_stream, "  mach=x86      select 32-bit mode\n");
+   (*printf_callback)(printf_stream, "  mach=x86-64   select 64-bit mode\n");
+   (*printf_callback)(printf_stream, "  suffix        always print instruction suffix\n");
+ #endif
+@@ -406,7 +406,7 @@ static const bfd_arch_info_type* find_arch_info(const char* arch_name) {
+ static const char* native_arch_name() {
+   const char* res = HOTSPOT_LIB_ARCH;
+ #ifdef LIBARCH_amd64
+-    res = "i386:x86-64";
++    res = "x86:x86-64";
+ #endif
+ #ifdef LIBARCH_sparc
+     res = "sparc:v8plusb";
+diff --git openjdk/hotspot/src/share/vm/adlc/Test/i486.ad openjdk/hotspot/src/share/vm/adlc/Test/i486.ad
+deleted file mode 100644
+index e69de29..0000000
+diff --git openjdk/hotspot/src/share/vm/adlc/Test/x86.ad openjdk/hotspot/src/share/vm/adlc/Test/x86.ad
+new file mode 100644
+index 0000000..e69de29
+diff --git openjdk/hotspot/test/Makefile openjdk/hotspot/test/Makefile
+index 2596d85..c2f3eb9 100644
+--- openjdk/hotspot/test/Makefile
++++ openjdk/hotspot/test/Makefile
+@@ -33,14 +33,14 @@ ifeq ($(OSNAME), SunOS)
+   PLATFORM = solaris
+   ARCH = $(shell uname -p)
+   ifeq ($(ARCH), i386)
+-    ARCH=i586
++    ARCH=x86
+   endif
+ endif
+ ifeq ($(OSNAME), Linux)
+   PLATFORM = linux
+   ARCH = $(shell uname -m)
+-  ifeq ($(ARCH), i386)
+-    ARCH = i586
++  ifeq ($(findstring 86,$(ARCH)), 86)
++    ARCH = x86
+   endif
+ endif
+ ifeq ($(OSNAME), Windows_NT)
+@@ -55,7 +55,7 @@ ifeq ($(OSNAME), Windows_NT)
+       ifeq ($(word 1, $(PROCESSOR_IDENTIFIER)),EM64T)
+         ARCH = x64
+       else
+-        ARCH = i586
++        ARCH = x86
+       endif
+     endif
+   endif
+-- 
+1.6.5
+
+diff --git openjdk/hotspot/make/linux/makefiles/i486.make b/hotspot/make/linux/makefiles/i486.make
+deleted file mode 100644
+index 9dd0b44..0000000
+--- openjdk/hotspot/make/linux/makefiles/i486.make
++++ /dev/null
+@@ -1,36 +0,0 @@
+-#
+-# Copyright 1999-2008 Sun Microsystems, Inc.  All Rights Reserved.
+-# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+-#
+-# This code is free software; you can redistribute it and/or modify it
+-# under the terms of the GNU General Public License version 2 only, as
+-# published by the Free Software Foundation.
+-#
+-# This code is distributed in the hope that it will be useful, but WITHOUT
+-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+-# version 2 for more details (a copy is included in the LICENSE file that
+-# accompanied this code).
+-#
+-# You should have received a copy of the GNU General Public License version
+-# 2 along with this work; if not, write to the Free Software Foundation,
+-# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+-#
+-# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
+-# CA 95054 USA or visit www.sun.com if you need additional information or
+-# have any questions.
+-#  
+-#
+-
+-# TLS helper, assembled from .s file
+-# Not included in includeDB because it has no dependencies
+-Obj_Files += linux_x86_32.o
+-
+-# The copied fdlibm routines in sharedRuntimeTrig.o must not be optimized
+-OPT_CFLAGS/sharedRuntimeTrig.o = $(OPT_CFLAGS/NOOPT)
+-# The copied fdlibm routines in sharedRuntimeTrans.o must not be optimized
+-OPT_CFLAGS/sharedRuntimeTrans.o = $(OPT_CFLAGS/NOOPT)
+-# Must also specify if CPU is little endian
+-CFLAGS += -DVM_LITTLE_ENDIAN
+-
+-OPT_CFLAGS/compactingPermGenGen.o = -O1
+diff --git openjdk/hotspot/make/linux/makefiles/x86.make openjdk/hotspot/make/linux/makefiles/x86.make
+new file mode 100644
+index 0000000..9dd0b44
+--- /dev/null
++++ openjdk/hotspot/make/linux/makefiles/x86.make
+@@ -0,0 +1,36 @@
++#
++# Copyright 1999-2008 Sun Microsystems, Inc.  All Rights Reserved.
++# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
++#
++# This code is free software; you can redistribute it and/or modify it
++# under the terms of the GNU General Public License version 2 only, as
++# published by the Free Software Foundation.
++#
++# This code is distributed in the hope that it will be useful, but WITHOUT
++# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++# version 2 for more details (a copy is included in the LICENSE file that
++# accompanied this code).
++#
++# You should have received a copy of the GNU General Public License version
++# 2 along with this work; if not, write to the Free Software Foundation,
++# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
++#
++# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
++# CA 95054 USA or visit www.sun.com if you need additional information or
++# have any questions.
++#  
++#
++
++# TLS helper, assembled from .s file
++# Not included in includeDB because it has no dependencies
++Obj_Files += linux_x86_32.o
++
++# The copied fdlibm routines in sharedRuntimeTrig.o must not be optimized
++OPT_CFLAGS/sharedRuntimeTrig.o = $(OPT_CFLAGS/NOOPT)
++# The copied fdlibm routines in sharedRuntimeTrans.o must not be optimized
++OPT_CFLAGS/sharedRuntimeTrans.o = $(OPT_CFLAGS/NOOPT)
++# Must also specify if CPU is little endian
++CFLAGS += -DVM_LITTLE_ENDIAN
++
++OPT_CFLAGS/compactingPermGenGen.o = -O1
+
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-javac-in.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-javac-in.patch
new file mode 100644
index 0000000..846982c
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-javac-in.patch
@@ -0,0 +1,28 @@
+From 90688bde5acdb9193f5c381ce332012ff67c0e02 Mon Sep 17 00:00:00 2001
+From: woglinde <woglinde@rhein.zuhause.netz>
+Date: Fri, 23 Oct 2009 16:10:49 +0200
+Subject: [PATCH 3/3] javac.in: remove fake-jdk rt
+
+---
+ javac.in |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git icedtea6-1.6.1/javac.in icedtea6-1.6.1/javac.in
+index a897b39..235d9b5 100644
+--- icedtea6-1.6.1/javac.in
++++ icedtea6-1.6.1/javac.in
+@@ -33,9 +33,9 @@ fi
+ if [ -e @abs_top_builddir@/native-ecj ] ; then
+     @abs_top_builddir@/native-ecj -1.5 -nowarn $bcoption $NEW_ARGS ;
+ elif [ ! -z "@ECJ@" ] ; then
+-    @ECJ@ -1.5 -nowarn $bcoption $NEW_ARGS
++    @ECJ@ -1.5 -nowarn $NEW_ARGS
+ else
+     CLASSPATH=@ECJ_JAR@${CLASSPATH:+:}$CLASSPATH \
+-     @JAVA@ org.eclipse.jdt.internal.compiler.batch.Main -1.5 -nowarn $bcoption $NEW_ARGS
++     @JAVA@ org.eclipse.jdt.internal.compiler.batch.Main -1.5 -nowarn $NEW_ARGS
+ fi
+ 
+-- 
+1.6.5
+
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-jdk-sane-x86-arch.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-jdk-sane-x86-arch.patch
new file mode 100644
index 0000000..5c989f9
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-jdk-sane-x86-arch.patch
@@ -0,0 +1,240 @@
+From 662e11a8b6017f39ceb6d00dcdbfe11473b56174 Mon Sep 17 00:00:00 2001
+From: woglinde <woglinde@rhein.zuhause.netz>
+Date: Fri, 23 Oct 2009 18:06:43 +0200
+Subject: [PATCH] sane-arch2
+
+---
+ openjdk/jdk/make/common/shared/Compiler-gcc.gmk |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git openjdk/jdk/make/common/shared/Compiler-gcc.gmk openjdk/jdk/make/common/shared/Compiler-gcc.gmk
+index 8329530..de85a11 100644
+--- openjdk/jdk/make/common/shared/Compiler-gcc.gmk
++++ openjdk/jdk/make/common/shared/Compiler-gcc.gmk
+@@ -90,8 +90,8 @@ ifeq ($(PLATFORM), linux)
+     REQUIRED_CC_VER = 3.2
+     REQUIRED_GCC_VER = 3.2.*
+   endif
+-  ifeq ($(ARCH), i586)
+-    # i586
++  ifeq ($(ARCH), x86)
++    # x86
+     REQUIRED_CC_VER = 3.2
+     REQUIRED_GCC_VER = 3.2.1*
+     REQUIRED_GCC_VER_INT = 3.2.1-7a
+-- 
+1.6.5
+
+From e2e87228dd36bd737b52ed3daeaed526b5e4d3ea Mon Sep 17 00:00:00 2001
+From: woglinde <woglinde@rhein.zuhause.netz>
+Date: Fri, 23 Oct 2009 18:16:54 +0200
+Subject: [PATCH] sane-arch3
+
+---
+ jdk/src/solaris/bin/i586/jvm.cfg |   38 --------------------------------------
+ jdk/src/solaris/bin/x86/jvm.cfg  |   38 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 38 insertions(+), 38 deletions(-)
+ delete mode 100644 jdk/src/solaris/bin/i586/jvm.cfg
+ create mode 100644 jdk/src/solaris/bin/x86/jvm.cfg
+
+diff --git openjdk/jdk/src/solaris/bin/i586/jvm.cfg openjdk/jdk/src/solaris/bin/i586/jvm.cfg
+deleted file mode 100644
+index b97e5ae..0000000
+--- openjdk/jdk/src/solaris/bin/i586/jvm.cfg
++++ /dev/null
+@@ -1,38 +0,0 @@
+-# Copyright 2001-2004 Sun Microsystems, Inc.  All Rights Reserved.
+-# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+-#
+-# This code is free software; you can redistribute it and/or modify it
+-# under the terms of the GNU General Public License version 2 only, as
+-# published by the Free Software Foundation.  Sun designates this
+-# particular file as subject to the "Classpath" exception as provided
+-# by Sun in the LICENSE file that accompanied this code.
+-#
+-# This code is distributed in the hope that it will be useful, but WITHOUT
+-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+-# version 2 for more details (a copy is included in the LICENSE file that
+-# accompanied this code).
+-#
+-# You should have received a copy of the GNU General Public License version
+-# 2 along with this work; if not, write to the Free Software Foundation,
+-# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+-#
+-# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
+-# CA 95054 USA or visit www.sun.com if you need additional information or
+-# have any questions.
+-#
+-# List of JVMs that can be used as an option to java, javac, etc.
+-# Order is important -- first in this list is the default JVM.
+-# NOTE that this both this file and its format are UNSUPPORTED and
+-# WILL GO AWAY in a future release.
+-#
+-# You may also select a JVM in an arbitrary location with the
+-# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
+-# and may not be available in a future release.
+-#
+--client IF_SERVER_CLASS -server
+--server KNOWN
+--hotspot ALIASED_TO -client
+--classic WARN
+--native ERROR
+--green ERROR
+diff --git openjdk/jdk/src/solaris/bin/x86/jvm.cfg openjdk/jdk/src/solaris/bin/x86/jvm.cfg
+new file mode 100644
+index 0000000..b97e5ae
+--- /dev/null
++++ openjdk/jdk/src/solaris/bin/x86/jvm.cfg
+@@ -0,0 +1,38 @@
++# Copyright 2001-2004 Sun Microsystems, Inc.  All Rights Reserved.
++# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
++#
++# This code is free software; you can redistribute it and/or modify it
++# under the terms of the GNU General Public License version 2 only, as
++# published by the Free Software Foundation.  Sun designates this
++# particular file as subject to the "Classpath" exception as provided
++# by Sun in the LICENSE file that accompanied this code.
++#
++# This code is distributed in the hope that it will be useful, but WITHOUT
++# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
++# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++# version 2 for more details (a copy is included in the LICENSE file that
++# accompanied this code).
++#
++# You should have received a copy of the GNU General Public License version
++# 2 along with this work; if not, write to the Free Software Foundation,
++# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
++#
++# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
++# CA 95054 USA or visit www.sun.com if you need additional information or
++# have any questions.
++#
++# List of JVMs that can be used as an option to java, javac, etc.
++# Order is important -- first in this list is the default JVM.
++# NOTE that this both this file and its format are UNSUPPORTED and
++# WILL GO AWAY in a future release.
++#
++# You may also select a JVM in an arbitrary location with the
++# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
++# and may not be available in a future release.
++#
++-client IF_SERVER_CLASS -server
++-server KNOWN
++-hotspot ALIASED_TO -client
++-classic WARN
++-native ERROR
++-green ERROR
+-- 
+1.6.5
+
+From d5274fb90454c0e40b665d865f456430949791c4 Mon Sep 17 00:00:00 2001
+From: woglinde <woglinde@rhein.zuhause.netz>
+Date: Fri, 23 Oct 2009 18:42:11 +0200
+Subject: [PATCH 2/4] sane-arch4
+
+---
+ .../share/native/com/sun/mediopenjdk/sound/SoundDefs.h   |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git openjdk/jdk/src/share/native/com/sun/media/sound/SoundDefs.h openjdk/jdk/src/share/native/com/sun/media/sound/SoundDefs.h 
+index 94624e0..6522503 100644
+--- openjdk/jdk/src/share/native/com/sun/media/sound/SoundDefs.h
++++ openjdk/jdk/src/share/native/com/sun/media/sound/SoundDefs.h
+@@ -36,7 +36,7 @@
+ #define X_ALPHA         1
+ #define X_AMD64         2
+ #define X_ARM           3
+-#define X_I586          4
++#define X_X86           4
+ #define X_IA64          5
+ #define X_M68K          6
+ #define X_MIPS          7
+-- 
+1.6.5
+
+From 251338c93253d1026a37df2793956d7985f9f4eb Mon Sep 17 00:00:00 2001
+From: woglinde <woglinde@rhein.zuhause.netz>
+Date: Fri, 23 Oct 2009 18:44:13 +0200
+Subject: [PATCH 4/4] sane-arch4
+
+---
+ jdk/make/javax/sound/SoundDefs.gmk |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git openjdk/jdk/make/javax/sound/SoundDefs.gmk openjdk/jdk/make/javax/sound/SoundDefs.gmk
+index 22ad8e0..a54ecd5 100644
+--- openjdk/jdk/make/javax/sound/SoundDefs.gmk
++++ openjdk/jdk/make/javax/sound/SoundDefs.gmk
+@@ -70,9 +70,9 @@ else
+     CPPFLAGS += -DX_ARCH=X_ARM
+   endif # ARCH arm
+ 
+-  ifeq ($(ARCH), i586)
+-    CPPFLAGS += -DX_ARCH=X_I586
+-  endif # ARCH i586
++  ifeq ($(ARCH), x86)
++    CPPFLAGS += -DX_ARCH=X_X86
++  endif # ARCH x86
+ 
+   ifeq ($(ARCH), ia64)
+     CPPFLAGS += -DX_ARCH=X_IA64
+-- 
+1.6.5
+
+Index: openjdk/jdk/make/common/shared/Platform.gmk
+===================================================================
+--- openjdk/jdk/make/common/shared/Platform.gmk	2009-10-23 22:17:12.749059413 +0200
++++ openjdk/jdk/make/common/shared/Platform.gmk	2009-10-23 22:18:16.236579466 +0200
+@@ -56,8 +56,8 @@
+ #     OS_VENDOR                   company name
+ #     TEMP_DISK                   /tmp or C:/temp
+ #     ARCH_DATA_MODEL             32 or 64
+-#     ARCH                        sparc, sparcv9, i586, amd64, or ia64
+-#     ARCH_FAMILY                 sparc or i586
++#     ARCH                        sparc, sparcv9, x86, amd64, or ia64
++#     ARCH_FAMILY                 sparc or x86
+ #     ARCHPROP                    sparc or x86
+ #     ARCH_VM_SUBDIR              jre/bin, jre/lib/sparc, etc.
+ #     LIBARCH                     sparc, sparcv9, i386, amd64, or ia64
+@@ -200,7 +200,7 @@
+   endif
+   archExpr = case "$(mach)" in \
+                 i[3-9]86) \
+-                    echo i586 \
++                    echo x86 \
+                     ;; \
+                 ia64) \
+                     echo ia64 \
+@@ -239,7 +239,7 @@
+       ARCH=sparcv9
+     endif
+   else
+-    # i586 is 32-bit, amd64 is 64-bit
++    # x86 is 32-bit, amd64 is 64-bit
+     ifndef ARCH_DATA_MODEL
+       ifeq ($(ARCH), alpha)
+         ARCH_DATA_MODEL=64
+@@ -250,7 +250,7 @@
+       ifeq ($(ARCH), arm)
+         ARCH_DATA_MODEL=32
+       endif
+-      ifeq ($(ARCH), i586)
++      ifeq ($(ARCH), x86)
+         ARCH_DATA_MODEL=32
+       endif
+       ifeq ($(ARCH), ia64)
+@@ -280,12 +280,7 @@
+     endif
+   endif
+ 
+-  # Need to maintain the jre/lib/i386 location for 32-bit Intel
+-  ifeq ($(ARCH), i586)
+-    LIBARCH = i386
+-  else
+-    LIBARCH = $(ARCH)
+-  endif
++  LIBARCH = $(ARCH)
+ 
+   # Value of Java os.arch property
+   ARCHPROP  = $(LIBARCH)
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-sane-x86-arch-name.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-sane-x86-arch-name.patch
new file mode 100644
index 0000000..1d67dbf
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-sane-x86-arch-name.patch
@@ -0,0 +1,47 @@
+Index: icedtea6-1.7/acinclude.m4
+===================================================================
+--- icedtea6-1.7.orig/acinclude.m4	2010-01-26 20:37:07.000000000 +0100
++++ icedtea6-1.7/acinclude.m4	2010-02-02 09:28:43.681373126 +0100
+@@ -8,11 +8,11 @@
+       CROSS_TARGET_ARCH=x86_64
+       ;;
+     i?86-*-*)
+-      BUILD_ARCH_DIR=i586
+-      INSTALL_ARCH_DIR=i386
+-      JRE_ARCH_DIR=i386
++      BUILD_ARCH_DIR=x86
++      INSTALL_ARCH_DIR=x86
++      JRE_ARCH_DIR=x86
+       ARCH_PREFIX=${LINUX32}
+-      CROSS_TARGET_ARCH=i386
++      CROSS_TARGET_ARCH=x86
+       ;;
+     alpha*-*-*)
+       BUILD_ARCH_DIR=alpha
+@@ -733,7 +733,7 @@
+   ZERO_LIBARCH="${INSTALL_ARCH_DIR}"
+   dnl can't use AC_CHECK_SIZEOF on multilib
+   case "${ZERO_LIBARCH}" in
+-    i386|ppc|s390|sparc)
++    x86|ppc|s390|sparc)
+       ZERO_BITSPERWORD=32
+       ;;
+     amd64|ppc64|s390x|sparc64)
+@@ -745,7 +745,7 @@
+   esac
+   AC_C_BIGENDIAN([ZERO_ENDIANNESS="big"], [ZERO_ENDIANNESS="little"])
+   case "${ZERO_LIBARCH}" in
+-    i386)
++    x86)
+       ZERO_ARCHDEF="IA32"
+       ;;
+     ppc*)
+@@ -762,7 +762,7 @@
+   esac
+   dnl multilib machines need telling which mode to build for
+   case "${ZERO_LIBARCH}" in
+-    i386|ppc|sparc)
++    x86|ppc|sparc)
+       ZERO_ARCHFLAG="-m32"
+       ;;
+     s390)
diff --git a/recipes/icedtea/icedtea6-native-1.7.3/icedtea-unbreak-float.patch b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-unbreak-float.patch
new file mode 100644
index 0000000..9f875de
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.3/icedtea-unbreak-float.patch
@@ -0,0 +1,18 @@
+Index: openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h
+===================================================================
+--- openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	2010-02-02 13:49:39.972718207 +0100
++++ openjdk/jdk/src/share/native/java/lang/fdlibm/include/fdlibm.h	2010-02-02 13:50:04.635639302 +0100
+@@ -27,13 +27,11 @@
+ 
+ #include "jfdlibm.h"
+ 
+-#ifdef __NEWVALID       /* special setup for Sun test regime */
+ #if defined(i386) || defined(i486) || \
+         defined(intel) || defined(x86) || \
+         defined(i86pc) || defined(_M_IA64) || defined(ia64)
+ #define _LITTLE_ENDIAN
+ #endif
+-#endif
+ 
+ #ifdef _LITTLE_ENDIAN
+ #define __HI(x) *(1+(int*)&x)
diff --git a/recipes/icedtea/icedtea6-native_1.7.3.bb b/recipes/icedtea/icedtea6-native_1.7.3.bb
new file mode 100644
index 0000000..9aade12
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native_1.7.3.bb
@@ -0,0 +1,233 @@
+DESCRIPTION = "Harness to build the source code from OpenJDK using Free Software build tools"
+HOMEPAGE = "http://icedtea.classpath.org"
+LICENSE  = "GPL with Classpath Exception"
+PR = "r0"
+
+DEPENDS = "virtual/javac-native classpath-tools-native \
+	   virtual/java-native classpath-native \
+	   xalan-j-native xerces-j-native rhino-native \
+	   ant-native libx11-native xproto-native libxt-native \
+	   freetype-native zlib-native giflib-native jpeg-native\
+	  "
+
+SRC_URI = "\
+	http://icedtea.classpath.org/download/source/icedtea6-${PV}.tar.gz \
+	http://download.java.net/openjdk/jdk6/promoted/b17/openjdk-6-src-b17-14_oct_2009.tar.gz;subdir=openjdk-src-dir \
+	file://disable-library-checks.patch;patch=1 \
+	file://build-hacks-native.patch;patch=1 \
+	file://icedtea-sane-x86-arch-name.patch;patch=1 \
+        file://icedtea-javac-in.patch;patch=1 \
+        file://icedtea-fix-jar-command.patch;patch=1 \
+	${ICEDTEA_PATCHES} \
+	"
+
+ICEDTEA_PATCHES = "\
+	file://icedtea-ecj-disable-compilation.patch \
+	file://icedtea-ecj-fix-freetype.patch \
+	file://icedtea-ecj-fix-zlib.patch \
+	file://icedtea-hotspot-make-arch-sane-for-x86.patch \
+	file://icedtea-jdk-sane-x86-arch.patch \
+	file://icedtea-unbreak-float.patch \
+	"
+
+export DISTRIBUTION_PATCHES = "\
+	patches/icedtea-ecj-disable-compilation.patch \
+	patches/icedtea-ecj-fix-freetype.patch \
+	patches/icedtea-ecj-fix-zlib.patch \
+	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
+	patches/icedtea-jdk-sane-x86-arch.patch \
+	patches/icedtea-unbreak-float.patch \
+	"
+
+inherit native java autotools
+
+JAVA_HOME[unexport] = "1"
+
+# No parallel build yet.
+PARALLEL_MAKE = ""
+
+#EXTRA_OEMAKE = "--debug=v"
+
+# Configure options compatible with Cacao >= 0.99 only!
+EXTRA_OECONF = "\
+	--with-parallel-jobs=1 \
+	--disable-docs \
+	--disable-pulse-java \
+	--disable-plugin \
+	--disable-xrender \
+	\
+	--with-ecj=${STAGING_BINDIR_NATIVE}/ecj-bootstrap \
+	\
+	--with-ecj-jar=${STAGING_DATADIR_JAVA_NATIVE}/ecj-bootstrap.jar \
+	--with-java=${STAGING_BINDIR_NATIVE}/java \
+	--with-javac=${STAGING_BINDIR_NATIVE}/ecj-bootstrap \
+	--with-javah=${STAGING_BINDIR_NATIVE}/gjavah \
+	--with-jar=${STAGING_BINDIR_NATIVE}/fastjar \
+	--with-rmic=${STAGING_BINDIR_NATIVE}/grmic \
+	--with-xalan2-jar=${STAGING_DATADIR_NATIVE}/java/xalan2.jar \
+	--with-xalan2-serializer-jar=${STAGING_DATADIR_NATIVE}/java/serializer.jar \
+	--with-xerces2-jar=${STAGING_DATADIR_NATIVE}/java/xercesImpl.jar \
+	--with-rhino=${STAGING_DATADIR_NATIVE}/java/rhino.jar \
+	--with-openjdk-src-dir=${WORKDIR}/openjdk-src-dir \
+	--with-gcj-home=${WORKDIR}/fake-jdk \
+	\
+	--enable-openjdk-cross-compilation \
+  "
+
+JDK_DIR = "icedtea6-native"
+
+do_configure_prepend() {
+
+        case "${TARGET_ARCH}" in
+                x86_64)
+                        libarch=amd64
+                ;;
+                i386|i486|i586|i686)
+                        libarch=x86
+                ;;
+                *)
+                        arch=${TARGET_ARCH}
+                        libarch=${TARGET_ARCH}
+                ;;
+        esac
+ 
+	chmod -R ug+w ${WORKDIR}/openjdk-src-dir
+	(cd ${WORKDIR}/openjdk-src-dir && sh ${S}/fsg.sh)
+
+	# Automatically copy everything that starts with "icedtea" and ends with
+	# ".patch" into the patches directory.
+	find ${WORKDIR} -maxdepth 1 -name "icedtea*.patch" -exec cp {} ${S}/patches \;
+
+	# Prepare JDK-like directory with Classpath' files which we can treat as a
+	# SYSTEM_GCJ_DIR afterwards.
+	mkdir -p ${WORKDIR}/fake-jdk/jre/lib/${libarch}
+	ln -sf ${STAGING_DATADIR_NATIVE}/classpath/glibj.zip ${WORKDIR}/fake-jdk/jre/lib/${libarch}/rt.jar
+
+	mkdir -p ${WORKDIR}/fake-jdk/include
+	for i in ${STAGING_INCDIR_NATIVE}/classpath/* ;do
+		test -r $i | continue;
+		bn=`basename $i`
+		ln -sf $i ${WORKDIR}/fake-jdk/include/$bn;
+	done
+}
+
+#addtask unpackpost after do_unpack before do_patch
+
+do_configure_append() {
+	oe_runmake patch-ecj
+
+	for F in openjdk-ecj/jdk/make/common/shared/Compiler-gcc.gmk openjdk-ecj/corba/make/common/shared/Compiler-gcc.gmk ;
+	do
+		sed -i \
+			-e"s|\$(COMPILER_PATH)gcc\$(GCC_SUFFIX)|${CC}|" \
+			-e"s|\$(COMPILER_PATH)gcc\$(GCC_SUFFIX) -E|${CPP}|" \
+			-e"s|\$(COMPILER_PATH)g++\$(GCC_SUFFIX)|${CXX}|" \
+			$F
+	done
+
+	for F in openjdk-ecj/hotspot/make/linux/makefiles/gcc.make openjdk-ecj/hotspot/agent/src/os/linux/Makefile ;
+	do
+		sed -i \
+			-e"s|gcc\$(GCC_SUFFIX)|${CC}|" \
+			-e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
+			$F
+	done
+}
+
+do_compile() {
+	# OpenJDK uses slightly different names for certain arches. We need to know
+	#	this to create some files which are expected by the build.
+	case "${TARGET_ARCH}" in
+		x86_64)
+			arch=amd64
+			libarch=amd64
+		;;
+		i386|i486|i586|i686)
+			arch=x86
+			libarch=x86
+		;;
+		*)
+			arch=${TARGET_ARCH}
+			libarch=${TARGET_ARCH}
+		;;
+	esac
+
+        echo "libarch ist ${libarch}"
+
+        install -d openjdk-ecj/control/build/linux-$arch/hotspot/import/jre/lib
+        if [ $libarch != $arch ]; then
+                # Something is strange with the directoy naming. OpenJDK uses both variants.
+                ln -sf $libarch openjdk-ecj/control/build/linux-$arch/hotspot/import/jre/lib/$arch
+        fi
+
+
+	# First build hotspot to get a libjvm.so
+	echo "1/2 Building Hotspot"
+	oe_runmake hotspot
+
+	# Remove the strange recursive symlink that is created here (If it is not there, then just skip this).
+	rm -rf bootstrap/ecj/jre/lib/$libarch || true
+
+	# Copy libjvm.so for target into bootstrap/jdk1.6.0/jre/lib
+	install -d bootstrap/ecj/jre/lib/$libarch
+	cp openjdk-ecj/build/linux-$arch/j2sdk-image/jre/lib/$libarch/server/libjvm.so bootstrap/ecj/jre/lib/$libarch
+
+	# OpenJDK build expects these files to exist (by creating those files we pretend
+	# that stuff was compiled)
+	common_dir=openjdk-ecj/build/linux-$arch/tmp/sun
+	for D in javax.sound/jsoundalsa sun.awt.X11/xawt sun.awt/jawt;
+	do
+		echo "creating $common_dir/$D/obj64/.files_compiled"
+		install -d $common_dir/$D/obj64
+		touch $common_dir/$D/obj64/.files_compiled
+
+		echo "creating $common_dir/$D/obj/.files_compiled"
+		install -d $common_dir/$D/obj
+		touch $common_dir/$D/obj/.files_compiled
+	done
+
+	echo "2/2 Running make icedtea-against-ecj"
+	oe_runmake icedtea-against-ecj
+	
+	# Creates a nice symlink which allows us to reach the created files easily.
+	oe_runmake stamps/bootstrap-directory-symlink.stamp
+}
+
+do_stage() {
+	case "${TARGET_ARCH}" in
+		x86_64)
+			JDK_ARCH=amd64
+		;;
+		i386|i486|i586|i686)
+			JDK_ARCH=x86
+		;;
+		*)
+			JDK_ARCH=${TARGET_ARCH}
+		;;
+	esac
+
+	install -d ${STAGING_LIBDIR_JVM}/icedtea6-native
+
+	for F in bootstrap/icedtea/{bin,include,jre,lib}
+	do
+		cp -rL $F ${STAGING_LIBDIR_JVM}/icedtea6-native
+	done
+
+	install -d ${STAGING_LIBDIR_JVM}/icedtea6-native/include/hpi
+	cp openjdk-ecj/jdk/src/solaris/hpi/export/*.h ${STAGING_LIBDIR_JVM}/icedtea6-native/include/hpi
+	cp openjdk-ecj/jdk/src/share/hpi/export/*.h ${STAGING_LIBDIR_JVM}/icedtea6-native/include/hpi
+
+	install -d ${STAGING_LIBDIR_JVM}/icedtea6-native/include/javavm
+	cp openjdk-ecj/jdk/src/share/javavm/export/*.h ${STAGING_LIBDIR_JVM}/icedtea6-native/include/javavm
+	cp openjdk-ecj/jdk/src/solaris/javavm/export/*.h ${STAGING_LIBDIR_JVM}/icedtea6-native/include/javavm
+
+	install -d ${STAGING_LIBDIR_JVM}/icedtea6-native/generated
+	cp generated/sun/awt/X11/generator/sizer.32 ${STAGING_LIBDIR_JVM}/icedtea6-native/generated
+
+	# Fix libjvm.so dependency of libfontmanager.so
+	ln -sf server/libjvm.so ${STAGING_LIBDIR_JVM}/${JDK_DIR}/jre/lib/${JDK_ARCH}/libjvm.so
+	ln -sf server/libjvm.so ${STAGING_LIBDIR_JVM}/${JDK_DIR}/jre/lib/${JDK_ARCH}/libjvm.so.0
+
+	# Fix missing write permissions on the files.
+	chmod ug+w -R ${STAGING_LIBDIR_JVM}/icedtea6-native
+}
-- 
1.7.0.4



