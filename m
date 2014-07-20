Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 167A46AC93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 04:08:05 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id id10so5384357vcb.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2014 21:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8SO5uHGzVFC3/MV0mRV47VxSmTRrmdwcv16+eXwZgBY=;
	b=eWWQ8HgjC0UfDkZTttusdRXahI5YQjpva272ePt6FrNH/ZHSNE5hIMkZjc80YcqpSN
	KMgNncgUMr69aYNv+8/qewoWoqLYAzVjbbmldgSpBAlF/ajSwrykym6ghsgrnzcnnZo8
	6WU2DPHtlVstViUiei43PuivU39mwk04RVKX50XfIBWT4Y88tXnfOOAqZOgs1NQ/sGxA
	rU5cScfOeD8/aUr84FhLmSdiWD0vua14HX61u7zV+ZeIbe8VmzwTJb9No7VFalIzUYq1
	6TxNxq/kzyeiL/EQNoSce8VlEDLMvXZvRcraKIu8gnvXk/nhFSiX4joSBrIu7plhGR6k
	QHVg==
X-Received: by 10.220.144.10 with SMTP id x10mr6480482vcu.42.1405829286822;
	Sat, 19 Jul 2014 21:08:06 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id n7sm2868785ven.1.2014.07.19.21.08.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jul 2014 21:08:05 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jul 2014 21:07:37 -0700
Message-Id: <1405829260-13293-2-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-multimedia][PATCH 1/4] vlc.inc: cleanup configure, inherit pkgconfig
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
X-List-Received-Date: Sun, 20 Jul 2014 04:08:06 -0000

* Upstream is now much more pkg-config friendly
* Clean up configure baggage, no longer needed

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 33 ++++++++++++--------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 58f5648..c188771 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -5,17 +5,17 @@ SECTION = "multimedia"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl \
-   libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutls tremor \
-   faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib libdvdcss \
-   libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs libdc1394 \
-   libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
+DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native gst-plugins-bad \
+   virtual/libsdl libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutls \
+   tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
+   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
+   libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp opencv libopus orc libusb1 schroedinger taglib \
    tiff xcb-util-keysyms samba"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -29,18 +29,20 @@ EXTRA_OECONF = "\
     --enable-freetype \
     --enable-sdl \ 
     --enable-png \
-    --enable-live555 --enable-tremor \
+    --enable-tremor \
     --enable-v4l2 --disable-aa --disable-faad \
     --enable-dbus \
     --without-contrib \
     --without-kde-solid \
     --disable-glx \
     --enable-realrtsp \
+    --disable-libtar \
     ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
     ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
+PACKAGECONFIG ?= " live555"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -48,18 +50,13 @@ PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[mkv] = "--enable-mkv,--disable-mkv,libmatroska libebml"
 
-do_configure() {
-    cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ 
-    ./bootstrap    
-    gnu-configize --force
-    libtoolize --force
-    #autoreconf --force -i
+do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-    oe_runconf
-    rm config.log
-    #sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g ${S}/vlc-config
-    sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
-    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g ${S}/doltlibtool
+}
+
+do_configure_append() {
+    sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/include\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
+    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g ${B}/doltlibtool
 }
 
 # This recipe packages vlc as a library as well, so qt4 dependencies
-- 
1.9.3


