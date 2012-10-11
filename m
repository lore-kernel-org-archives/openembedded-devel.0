Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TMQlp-0005ZC-CR
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 23:58:21 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so7891331wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2012 14:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=1IGhgo9JHYuDfVaq5hJpdaY2ynemt4PTkOUNTSXCNus=;
	b=W4Ejf5w/pNiymJo3mUIL2HERWnveoFJMGIGU9anYVOpw8iHT3FRGs/nph5/7GPPj5G
	+9b+Zux/10F9t40qqjXuZihavWV8QqZEH4YXHVAkh1iDgpq3c8l8O9P8fuZrBSr4xKBF
	3ZuHb1z3IHPpeDH/AkFbEf1B2KJY7rAZhMhwyAHcM48iw2cZSLrqkQMG2p43L+WZ68DO
	+RRAohPRaq9sPZKDYMadoWlZ5Y40Qd09+oErXUgyJCfIIBvJjBeLT8xANtTcfHHAsmAY
	LryGt/zdHUEK8u1XxvEWu+t5GdVFomsmTbFBqPe79qGy7PZdHAsHI+5Zgit1lJM+xveB
	xjVQ==
Received: by 10.216.218.73 with SMTP id j51mr1141521wep.161.1349991910647;
	Thu, 11 Oct 2012 14:45:10 -0700 (PDT)
Received: from nano.lab.ossystems.com.de (gateway03.m3-connect.de.
	[88.79.237.13])
	by mx.google.com with ESMTPS id ct3sm666305wib.5.2012.10.11.14.45.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 14:45:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Oct 2012 18:46:02 -0300
Message-Id: <1349991962-3844-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
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
X-List-Received-Date: Thu, 11 Oct 2012 21:58:21 -0000

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
index f0ce7cf..74bf710 100644
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
+                             python-netclient \
+                             libcurl \
                              "
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
-
-
-- 
1.7.10.4



