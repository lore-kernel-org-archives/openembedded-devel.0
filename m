Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 538D9718DD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 02:47:35 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id lf10so3981913pab.30
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 19:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JOrr6ymdEvtOmBGFmMfk+rWPHUlbHYSAnssJBGsTpYA=;
	b=OgqgF52e+xhWK5c1jitpmZCyG79favyQhqYUOoDxobbsmgM9EVxSSS9Oa2UlujRzXM
	36FtmCZDVbbkNrD6vKCd6j1dAwrmqbhdkOER4FBXka6PVTDIkwg9Gqui4pR+Tx0RcRbv
	FqkwRUQLzW3A2CWFj/I9PliOluqwVAx1KKMFII436IUwmB2RJr+7e8ltp91fBDWnezed
	qvixDp8cRLni8sQqyeAbZ3MjB+yDnGeFVtSQQnPoqNH9oslq/At4T6vxaKtZ4q+JLI1l
	wQRJssmBCJvtkNWmpUfMn+8jEFWRmy/DgdN0MdZrXDNC/WE5IQ43bcm/GcVlUUXokErd
	uLog==
X-Received: by 10.70.49.8 with SMTP id q8mr15181329pdn.30.1413082055765;
	Sat, 11 Oct 2014 19:47:35 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id w1sm7319472pdb.52.2014.10.11.19.47.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Oct 2014 19:47:34 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Oct 2014 19:47:24 -0700
Message-Id: <1413082045-2674-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-multimedia][PATCH 1/2] vlc: make opencv explicitly configurable
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
X-List-Received-Date: Sun, 12 Oct 2014 02:47:44 -0000

World builds are failing due to change in opencv in API.
Since vlc is only using opencv as an example and a filter, disable by default.
Revisit when upstream adapts to new opencv API.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc     |  3 ++-
 .../vlc/vlc/0006-make-opencv-configurable.patch    | 29 ++++++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_2.1.4.bb            |  1 +
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 88605df..72a93f5 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -10,7 +10,7 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native gst-plugins-bad \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
    libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
    libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
-   libmtp opencv libopus orc libusb1 schroedinger taglib \
+   libmtp libopus orc libusb1 schroedinger taglib \
    tiff xcb-util-keysyms samba"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
@@ -50,6 +50,7 @@ PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[mkv] = "--enable-mkv,--disable-mkv,libmatroska libebml"
 PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
+PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch
new file mode 100644
index 0000000..950c09b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0006-make-opencv-configurable.patch
@@ -0,0 +1,29 @@
+Recent opencv API changes break upstream filter and example.
+Make opencv explicitly configurable.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Tim Orling <TicoTimo@gmail.com>
+
+Index: vlc-2.1.4/configure.ac
+===================================================================
+--- vlc-2.1.4.orig/configure.ac
++++ vlc-2.1.4/configure.ac
+@@ -1693,7 +1693,16 @@ PKG_ENABLE_MODULES_VLC([BLURAY], [libblu
+ dnl
+ dnl  OpenCV wrapper and example filters
+ dnl
+-PKG_ENABLE_MODULES_VLC([OPENCV], [opencv_example opencv_wrapper], [opencv > 2.0], (OpenCV (computer vision) filter), [auto])
++AC_ARG_ENABLE(opencv,
++  [AS_HELP_STRING([--disable-opencv],
++    [disable OpenCV computer vision filter and example (default auto)])])
++if test "${enable_opencv}" != "no"
++then
++    PKG_ENABLE_MODULES_VLC([OPENCV], 
++                           [opencv_example opencv_wrapper], 
++                           [opencv > 2.0], 
++                           (OpenCV (computer vision) filter), [auto])
++fi
+ 
+ 
+ dnl
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
index b4047d3..418f77c 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-enable-subdir-objects.patch \
             file://0003-use-am-path-libgcrypt.patch \
             file://0004-modules-gui-qt4-out-of-tree-build.patch \
             file://0005-libpostproc-header-check.patch \
+            file://0006-make-opencv-configurable.patch \
 "
 
 SRC_URI[md5sum] = "7ed67d22f7425011078772bfc62ac222"
-- 
1.9.3


