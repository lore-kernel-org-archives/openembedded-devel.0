Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0385B65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 11:55:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n25so18502866wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 04:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Br059aY4WttkZY0AweV5gz9c5jPKaE2x5NGuvs83GwI=;
	b=QmCDUdsUSEikFlSsMcu2bxmJGyfT6NsfnDwKsHzjiZtukzLUuPSzseS6nSIDJ5sP2/
	hRjZigGhZF25c4yg3Fsg3vpT6IsdIS+iUuvUJkFY6f0fNwHNRfUyV3+iMOd5eUrSekS4
	du/ME4lrxifqZhE3XkrLjvQEeL8yeDFMScYeLdXUf71kJH+vADy6/lTsu38mM3IfrF8d
	oMaW/Z6eoIsz1050kc3vAaK+lPwjzL6d0KxEEb5yVhCikdqXcIxU6N0gsmpvmPI4fNWg
	0YdQDUDprsA5Kx98mX5JvNveRMO+Am2gZ1/RLxAu8CiZbCGTDDfrRAhyY2O7hNXVI4sR
	BXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Br059aY4WttkZY0AweV5gz9c5jPKaE2x5NGuvs83GwI=;
	b=Fft2gYU6Ohdt8/9FY4avPXSIH2vTNOcQ2lKHGlvq/xei/DsTz17/eLL2B1bshyMqn0
	iJ6lPdsIZ/067V8UmqRDb7e3HPcXPB8V66qhvyc2xJoztbrAhcV4J9AoDg4j8ZFcjQWi
	kDA0F6ehyYGjG5x+34jRnU1LzKe4froUYXNiQLMIAknUaL7HJTZ7LBOL6fYiaLv1IrmZ
	HFE4ShGl1vOplXGDFuNOt9R8kcg/qJUnRHJgnsQFRqJxzSlRBrYLtWIVnXU2Sym4um+s
	c73PB6WV7vSOJUEDDzjdCk9DKTFobWUiyWp8vFg6P4KL0X+3B6YM3BDRQr3XuEhmdX98
	f6HA==
X-Gm-Message-State: APjAAAWpmngwL4KiXkLnEJ4XDR8nHP3VLzib/x62NZlp4fGm2f7l9A1y
	F/eupBpC7JmLCOVhtuY8oLpSblJR
X-Google-Smtp-Source: APXvYqxinfk7XnanQymu0tmAWgLEXzh/x8wusLVcSWTfTo4RshImKNgNrvCe/8w/+z/+rnofUbEqnQ==
X-Received: by 2002:a1c:4844:: with SMTP id v65mr2028712wma.139.1556020530145; 
	Tue, 23 Apr 2019 04:55:30 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F06D061E0920178A04BAB4C.dip0.t-ipconnect.de.
	[2003:f0:7f06:d061:e092:178:a04b:ab4c])
	by smtp.gmail.com with ESMTPSA id e7sm5987066wrp.19.2019.04.23.04.55.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 04:55:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2019 13:55:21 +0200
Message-Id: <20190423115521.4236-1-schnitzeltony@gmail.com>
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
X-List-Received-Date: Tue, 23 Apr 2019 11:55:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* qt4 support is gone -> move to qt5
* while at it remove noop libtool copy

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Aargh again typo in commit message...
V2 -> V3: Do not enable qt5-gui by default

 .../recipes-multimedia/vlc/vlc.inc            | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 19ac8206c..9bbc6685d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -36,12 +36,17 @@ EXTRA_OECONF = "\
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
+"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
 
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
@@ -54,7 +59,7 @@ PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
-PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
+PACKAGECONFIG[qt5] = "--enable-qt,--disable-qt, qtbase-native qtx11extras qtsvg"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
 PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
@@ -76,12 +81,13 @@ PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util
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


