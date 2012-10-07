Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKhcj-0003QB-OQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 05:33:49 +0200
Received: by mail-yh0-f47.google.com with SMTP id g23so705066yhg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 20:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=YAs28EEEpnI5nk/y8xcjBxfszRTymoAXEQ4JCvfToWs=;
	b=FNL3cowjYdBfGq5Ar4wBb1RmF6fCqAXjLOEeTzv+ai2Plk/Qh6X+XWcztl8dAV0OCm
	06otkUHVpduT0PQ/G/LX4Aww0mRgwhhEKB1eJBWmRvtw1Fix1SdX6pkwLB2h8ejuZtYY
	T8QfjC0zdAMS7LDO0ajZCGVNcQ5OCxcETcBSzCFaUDQ3qf7whRu6W66u81KkGuJX+0/n
	O5nIJJdZ1FszFos2UFWPoA+pLsmx7tIdrSQMUfYA3kIaXFHDJS/S31TVZMxysLkB7Jgj
	K7ZwFZ8tqeOM/5Tqp4OSjKHt7NKudURfh1wdPb13cYVnOQI/yT8QMu6mNQ1EC6qhK8I2
	c8qw==
Received: by 10.236.176.234 with SMTP id b70mr12217810yhm.55.1349580044941;
	Sat, 06 Oct 2012 20:20:44 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id z30sm20623129yhh.6.2012.10.06.20.20.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 20:20:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 00:20:35 -0300
Message-Id: <1349580035-28194-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] xbmc: Fix serveral build errors and install missing dependencies
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
X-List-Received-Date: Sun, 07 Oct 2012 03:33:50 -0000

This allow the package to build fine. On the test board it didn't show
anything in display but it seems to be hardware specific issue.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xbmc/configure.in-Avoid-running-code.patch     |   32 ++++++++++++++++++++
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |   28 +++++++++++------
 2 files changed, 50 insertions(+), 10 deletions(-)
 create mode 100644 meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
new file mode 100644
index 0000000..5c14059
--- /dev/null
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-code.patch
@@ -0,0 +1,32 @@
+From cfd851660a594801a591e80dc820c65cb7bd7836 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sat, 6 Oct 2012 06:40:03 -0300
+Subject: [PATCH] configure.in: Avoid running code or we break cross-compile
+
+Upstream-Status: Backport [similar change done for 12.0]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ configure.in |    6 +-----
+ 1 files changed, 1 insertions(+), 5 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index ef94683..d7efcb0 100755
+--- a/configure.in
++++ b/configure.in
+@@ -1246,11 +1246,7 @@ if test "$use_external_ffmpeg" = "yes"; then
+   AC_DEFINE([USE_EXTERNAL_FFMPEG], [1], [Whether to use external FFmpeg libraries.])
+ 
+   # Disable vdpau support if external libavcodec doesn't have it
+-  AC_RUN_IFELSE(
+-    AC_LANG_PROGRAM([[#include <libavcodec/avcodec.h>]],
+-      [[avcodec_register_all();
+-        AVCodec *codec = avcodec_find_decoder_by_name("vc1_vdpau");
+-        return (codec) ? 0 : 1;]]),,
++  AC_CHECK_LIB([avcodec], [ff_vdpau_vc1_decode_picture],,
+     [if test "x$use_vdpau" = "xyes"; then
+       AC_MSG_ERROR($ffmpeg_vdpau_not_supported)
+     else
+-- 
+1.7.2.5
+
diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index f0ce7cf..baa3dd2 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "XBMC Media Center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
 
-DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib"
+DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml"
 #require recipes/egl/egl.inc
 
 SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
@@ -15,12 +15,17 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
            file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
            file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
+           file://configure.in-Avoid-running-code.patch \
           "
 
 inherit autotools gettext python-dir
 
 S = "${WORKDIR}/git"
 
+CACHED_CONFIGUREVARS += " \
+ ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \
+"
+
 EXTRA_OECONF = " \
  --disable-rpath \
  --enable-gles \
@@ -30,6 +35,11 @@ EXTRA_OECONF = " \
  --enable-external-libraries \
 "
 
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+
+EXTRA_OECONF_append_armv7a = "--cpu=cortex-a8"
+
 # for python modules
 export HOST_SYS
 export BUILD_SYS
@@ -45,19 +55,17 @@ do_configure() {
 PARALLEL_MAKE = ""
 
 do_compile_prepend() {
-
-	sed -i -e 's:-rpath \$(libdir)::g' lib/libid3tag/libid3tag/Makefile
-
 	for i in $(find . -name "Makefile") ; do
-		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${STAGING_LIBDIR}:g' $i
+		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
 	done
 
-	for i in $(find . -name "*.mak*") ; do
-		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir)::g' $i
+	for i in $(find . -name "*.mak*" -o	-name "Makefile") ; do
+		sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${libdir}:g' $i
 	done
-	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir)::g' ${S}/Makefile	
 }
 
+INSANE_SKIP_${PN} = "rpaths"
+
 # on ARM architectures xbmc will use GLES which will make the regular wrapper fail, so start it directly
 do_install_append_arm() {
 	sed -i -e 's:Exec=xbmc:Exec=${libdir}/xbmc/xbmc.bin:g' ${D}${datadir}/applications/xbmc.desktop
@@ -71,7 +79,7 @@ RRECOMMENDS_${PN}_append = " libcec \
                              python \
                              python-lang \
                              python-re \
+                             python--netclient \
+                             libcurl \
                              "
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
-
-
-- 
1.7.2.5



