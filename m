Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4672F7F367
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 08:13:55 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p74so5768194wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=70zbRVdoXLrBBHVBHWoHdwG3Eyt4PsvSWq+qTg/ARUA=;
	b=UJYdACSHNF6qpzkgAkObQalPUWzoaZgaW9ks2HMMdGNM/wef7ZeI0Twq3q1Lp//xU7
	IWCC52UOFy857lno9o8sAfE7+9shL6kdPeLYurH/Y20WgLBWrq1z5jd2S0w/t3z7Wl0m
	gfkrPNAqusydDBVBsGpl5oZxdZfWVKoQH4JHNA2G6RiW/tMkrfr0mkRl97xdq7LrefsZ
	K9a7auv+ki9pbVzI7siw8BG5a6X72OqQgek3TffejmQVNlPGrxIje+deuf+Y8Y9AVcdi
	244ijBIFBprlA/dfqixN1GAj+Uc1khdKcgz6wHPglu4MNftB4hHLO+IaRnbmzjoEq+bF
	qN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=70zbRVdoXLrBBHVBHWoHdwG3Eyt4PsvSWq+qTg/ARUA=;
	b=XOlMI9tPWHQD05HlYOmtsvAWVyS/44X20F1b0DF+ncD/alHmgfK4liqPyuvskEvLtw
	jCuPZ202iBDTmgXjEzvkfjwtXLdIphkqPsKeceHJkNyYYtTKQPmldW9BmgtBWtljwYuf
	hXqiKzxti4dgQ8FgVLKBBK38ICImpDHPRwMYqR7FSaVNe6wVstih90Aicg2TXMmCjoYD
	B3xUBYaYMHdtBPLv8w5nhHLRzzS4e408JiaEFpUlank31++uLrqhcXkW8tw5Uj4eHrBu
	OUGgJzoj1E+lB/K5HcKVValO0MJrbuGTpoNvMevNtXNK6IL8BHSo1pduAJSURnlL4Km/
	evvg==
X-Gm-Message-State: APjAAAVQfJFqYh9bXRHqF6FtW+ChZEClVs8onDfeXWzE7ugQUXAQJ7FP
	CRkiWrEsgOdZxyoiPKmg91/Fw0tc
X-Google-Smtp-Source: APXvYqysJBxH8aeQcm0UjEGwg1z0JJfGrrAp2rNrbYM9ODdyMXgDlpcWwdCOmCsRii1MWmbFOlSIew==
X-Received: by 2002:a1c:6782:: with SMTP id
	b124mr11270363wmc.143.1566029629461; 
	Sat, 17 Aug 2019 01:13:49 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F2D875347F2BEDFD5FFA793.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8753:47f2:bedf:d5ff:a793])
	by smtp.gmail.com with ESMTPSA id
	q124sm7592567wma.33.2019.08.17.01.13.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 01:13:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 17 Aug 2019 10:13:36 +0200
Message-Id: <20190817081339.22253-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817081339.22253-1-schnitzeltony@gmail.com>
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [warrior][PATCH 1/4] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Sat, 17 Aug 2019 08:13:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* qt4 support is gone -> move to qt5
* while at it remove noop libtool copy

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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


