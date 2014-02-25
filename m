Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id F2F726F36A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 16:31:18 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so1794153pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uQQ67Jnro0s9GygB9FFDgReXb2Wf4Mbk9B2oOZYUgt8=;
	b=ZSv+LFKsNHYMHjqr//IX7V+7WbOFDK9wGhIgivCzxTmO4L58OHmA35h/fvbGR296yo
	Ts/wmBc0fiKcTbIXrWd+/LYx0MqfDq7w264yFBh+GY+v0xaCZ8VJXz55ameFnd8dpBNn
	g7hXL3sJKGl5+8/VNJTskqenqM2rOL6veA/YEuqqayiCZc1W9UsO+o5rICvx/S23aDBN
	xZEmALGJMO+P1N1OLtucg/tFLymbWyTu9S1neJBCcbJeLdzSzPnG7VTxA++t6kLp0Jxj
	B8ujjVqGw0mc6SvwhKay9RmfgyIfgaLDAVjwlvHpGlpIwndXRrGQ6UllCBGbsVcs1S8S
	QlMw==
X-Received: by 10.68.87.98 with SMTP id w2mr835961pbz.2.1393345879705;
	Tue, 25 Feb 2014 08:31:19 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	eb5sm146677117pad.22.2014.02.25.08.31.18 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 08:31:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 08:32:55 -0800
Message-Id: <1393345975-20556-4-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
References: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] vlc: update to 2.1.2
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
X-List-Received-Date: Tue, 25 Feb 2014 16:31:19 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../vlc/files/0001-enable-subdir-objects.patch        | 13 +++++++++++++
 .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17 +++++++++++++++++
 meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 12 +++++++++---
 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 19 +++++++++++++++++++
 4 files changed, 58 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb

diff --git a/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
new file mode 100644
index 0000000..9f0e708
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects.patch
@@ -0,0 +1,13 @@
+Index: vlc-2.1.2/configure.ac
+===================================================================
+--- vlc-2.1.2.orig/configure.ac
++++ vlc-2.1.2/configure.ac
+@@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
+ AC_CANONICAL_HOST
+ AC_PRESERVE_HELP_ORDER
+ 
+-AM_INIT_AUTOMAKE(tar-ustar color-tests foreign)
++AM_INIT_AUTOMAKE(tar-ustar color-tests foreign subdir-objects)
+ AC_CONFIG_HEADERS([config.h])
+ 
+ # Disable with "./configure --disable-silent-rules" or "make V=1"
diff --git a/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
new file mode 100644
index 0000000..6d2a46f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provide-strlcpy.patch
@@ -0,0 +1,17 @@
+Index: vlc-2.1.2/src/input/subtitles.c
+===================================================================
+--- vlc-2.1.2.orig/src/input/subtitles.c
++++ vlc-2.1.2/src/input/subtitles.c
+@@ -44,6 +44,12 @@
+ #include "input_internal.h"
+ 
+ /**
++ * Drepper's alternative 
++ * http://en.wikibooks.org/wiki/C_Programming/C_Reference/nonstandard/strlcpy
++ */
++#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) = '\0'
++
++/**
+  * We are not going to autodetect more subtitle files than this.
+  */
+ #define MAX_SUBTITLE_FILES 128
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index f3d8a03..6ff8c21 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -5,13 +5,13 @@ SECTION = "multimedia"
 
 DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-lib"
 
-SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
+SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.xz"
 
 inherit autotools gettext
 
 ARM_INSTRUCTION_SET = "arm"
 
-DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1"
+DEPENDS += "libdvdcss libdvdread lua-native lua live555"
 
 LEAD_SONAME = "libvlc.so.5"
 
@@ -36,6 +36,9 @@ FILES_libvlc-dbg = "\
 
 FILES_libvlc = "${libdir}/lib*.so.*"
 
+FILES_libvlc-staticdev = "${libdir}/vlc/plugins/*/*.a"
+
+
 FILES_${PN} += "${bindir}/vlc \
     ${datadir}/applications \
     ${datadir}/vlc/ \
@@ -70,6 +73,8 @@ PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3tag,--disable-id3tag,libid3tag"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
 
 do_configure() {
     cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ 
@@ -80,6 +85,7 @@ do_configure() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
     oe_runconf
     rm config.log
-    sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
+    #sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
     sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
+    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_ARCH}-${DISTRO}-${TARGET_OS}-libtool:g doltlibtool
 }
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
new file mode 100644
index 0000000..40052d7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
@@ -0,0 +1,19 @@
+# This recipe packages vlc as a library as well, so qt4 dependencies
+# can be avoided when only the library is installed.
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+require vlc.inc
+
+PR = "r6"
+
+# work around build failure
+EXTRA_OECONF += " --enable-libxml2=no"
+
+SRC_URI += "file://0001-enable-subdir-objects.patch \
+            file://0002-glibc-does-not-provide-strlcpy.patch \
+"
+
+SRC_URI[md5sum] = "fb6787ad749aadcfaeab3471939b3426"
+SRC_URI[sha256sum] = "219b812be1bc2eba40faa86419d0aa2c479a7380af8af216e8bfa22eb6fc8ec4"
+
-- 
1.8.3.2


