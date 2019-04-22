Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 31F2C6C4CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 23:46:25 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t17so17614778wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 16:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7a/05uxulSKonUNOh7AAbWI9l/LRVIEVZmD45QuAPTw=;
	b=kxD4EZlBbbFxM2faiIYLM1bCamsawBDd9pjYaQmUwbzmr318Lg1d390dWNeZYQn3lN
	QUtnqe+fRTOJVN5LrxdptOg7QuMer3DSCJVVpGPwXSfk22OpByw+icOCQmkAdEvPAWk9
	RYgnLf88cAris9OGH8vzpM2MsyD3Bxz8xjqRTbjGzguA464aTgTen/X8se0QZF+u8m/H
	7WBIDf/RFAN08O5fBiLIFoNzkmDPMLnKJPQE90QyNN3aY1bMBMF5ERXBzeqrqKUcReLp
	KAXRM/Umy3yGk6tLo2YFsXvFGo0raEucivcwaMVwwfq5H4Fe6mMNzghIF+/HYIaTUIyL
	etWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7a/05uxulSKonUNOh7AAbWI9l/LRVIEVZmD45QuAPTw=;
	b=bpTiOvdTZ5BJiZWrfJRAkC8fMl1h9QeA1EfyvsEfdYqjRfn42a81rJoJCjGAZJ8zHd
	brds8tPU7vL+sC0SbXZa5BwyUPbBPPof9GLYOtwJhzKiZVJ9lUmH0Q0AnBV+/FC1Iw3H
	ZBf2/mZedCkIOlsvn54mcJpJqPFOHx2lAxESC/hJ2COT2XTV03WSdjt3fxdf2gpgUcz8
	94lDsEkmHiRH+Uw3AlAcf/GCxCDcf/+FgS5iZYsX9az1nI+EytHZmMijjFbWugfU7688
	vMWsCnnf5BGyzlxSBrwKbQ0QyL6KCNUTtfeI2MAxuwuiQymm781ugeXIFzDRbqzxkhAL
	sg8A==
X-Gm-Message-State: APjAAAW/aBDiOWQASZ1MmLn58WekMiWp4MDRxfMfXLXL0/8XDTdYGoc1
	h4YufgwMYiywvGtOY6jXZFl/wbk9
X-Google-Smtp-Source: APXvYqzt2xzX+nrrmN1cG14ub5W3pfgZRIJ4+GlqVQnDNOtix73Pcr6Q+rwTOpxTqJMvXsVUP6JhQg==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr239920wrm.84.1555976785595;
	Mon, 22 Apr 2019 16:46:25 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F06D035817AE370820A503A.dip0.t-ipconnect.de.
	[2003:f0:7f06:d035:817a:e370:820a:503a])
	by smtp.gmail.com with ESMTPSA id
	m13sm14419076wmg.42.2019.04.22.16.46.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Apr 2019 16:46:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2019 01:46:17 +0200
Message-Id: <20190422234617.5419-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] vlc: rework qt PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2019 23:46:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* qt4 support is gone -> move to qt5
* enable qt5 gui in case meta-qt5 is in layers (it is more or less useless
  without gui)
* while at it remove noop libtool copy

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Aargh again typo in commit messeage...
 .../recipes-multimedia/vlc/vlc.inc            | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 19ac8206c..6ba1444b5 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -36,12 +36,18 @@ EXTRA_OECONF = "\
     --enable-realrtsp \
     --disable-libtar \
     --enable-avcodec \
-    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
-    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
-    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
+    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/moc \
+    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/rcc \
+    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/uic \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ?= " \
+    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)} \
+"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
 
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
@@ -54,7 +60,7 @@ PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
-PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
+PACKAGECONFIG[qt5] = "--enable-qt,--disable-qt, qtbase-native qtx11extras qtsvg"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
@@ -76,12 +82,13 @@ PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util
 PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 
-do_configure_prepend() {
-    cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-}
-
 do_configure_append() {
     sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
+
+    # moc needs support: precreate build paths
+    for qtpath in adapters components/epg components/playlist components/sout dialogs managers styles util/buttons; do
+        mkdir -p "${B}/modules/gui/qt/$qtpath"
+    done
 }
 
 # This recipe packages vlc as a library as well, so qt4 dependencies
-- 
2.20.1


