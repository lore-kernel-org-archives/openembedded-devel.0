Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00EF16C4DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 23:40:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s15so17600679wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 16:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oCOAGDz1fyJl7KUx3JYYt1f1dLNgbz3B0YVpJ6KRrG0=;
	b=gGKDoykrI1ylTnBd7No9op8MCTXbTYsQVge/ObCBurgeP6MXHzqA9mft0ks7l1RhSF
	sXBkMwoD8CFi+lIhmMjkEmTKVeQWu/DCaKKxLcBbC1680i80E0gCBXode7zjZs7JPx2H
	rBzwZJswOOntUURA5InmfabYboihDLOyPfjH87Kp3MPSCv25iN24AtJEb7fHH4S8/3l6
	PrvPJ7ZcwxiI4XBQYQ4FkjLIV00qsV3+xG5JxgoBEZgQQmq1KqGL+w+F5aY2nlhDWi5t
	LYlfZfS3Cnqy1a1Q5+HFl5BusM+D1nkF+xPEVQrAHm6j4qWezsnQtUD8C/2f1fRSba1B
	jO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oCOAGDz1fyJl7KUx3JYYt1f1dLNgbz3B0YVpJ6KRrG0=;
	b=aNgpv+iVpCZb8R0h/IZAAigIF6hnpg6qgKKuZWWUPf2bYRM6vl/Rx8o+48lyUkGi9j
	1kIYF0lR2dmUV2oIuea6sZOBumqtxM+O1+govsT7uShHqYoO3g3O+dYoIOZOkIky1nqT
	vq72C76xTV4ZoysKfCswcppH7Z6SugX0DZ+Bno/Ifhjq28q1GWCuEve+Zt0q175yiIXb
	0hd8JAqGYTr9oq0fKbjOlMWn97eF42JXo4j1ocxH39YmS1VAfgtf/lLv4rn2fqRCDoLM
	BaaLSfHvi9BCudUuuuapdOGqmLfAuplYHgjxIMVHATXdY3WTPajv44Cme3rHH6dYF/3K
	wzoA==
X-Gm-Message-State: APjAAAXzmJvcHC/jo44ZgxwYXzTmJpkepEuaMYRnXrkVXWzVeSPe8Bza
	T+cm/Wn8XoRp7IOcZr5S/eKtjVcf
X-Google-Smtp-Source: APXvYqyb7oj3H1rMNLoxzeGWmIoyHHqKAGaNO49P/g/9XJmiKPI46eA8snHfASRMXegoAdIHE6VE5w==
X-Received: by 2002:a05:6000:1291:: with SMTP id
	f17mr14435536wrx.201.1555976421361; 
	Mon, 22 Apr 2019 16:40:21 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F06D035817AE370820A503A.dip0.t-ipconnect.de.
	[2003:f0:7f06:d035:817a:e370:820a:503a])
	by smtp.gmail.com with ESMTPSA id
	m14sm5242773wru.51.2019.04.22.16.40.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Apr 2019 16:40:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2019 01:40:01 +0200
Message-Id: <20190422234001.5250-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] vlc: revork qt PACKAGECONFIG
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
X-List-Received-Date: Mon, 22 Apr 2019 23:40:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* qt4 support is gone -> move to qt5
* enable qt5 gui in case meta-qt5 is in layers (it is more or less useless
  without gui)
* while at it remove noop libtool copy

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
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


