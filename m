Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 16E297F57F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 08:06:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id y21so9224556wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OE/0uAXNkquyqqYy3ZEl0YBL4FjfuYngD/Eu88Okuq4=;
	b=gGyZeQiLdpr/TfDPnOy9uYdLPedvq2OzBStEjjbXKVdbQ8ljrYZbZ8+gOboeWNvq3a
	LBnxzicPfsElHcqUTDxWySsusEzu5AYAjNih5KzpditUAzHN49dC2YNOcyO+cjdRvuw8
	VSlkGxjSuIUifplAewJuWn2GKtiTluwva6t25IuJwIt/tJpx7vFvGlpMEEIEoXCwQJPq
	d8oKvRqJwb1jAiOv8kjJJuaFWfRmzkenfzj8brZGDrDxHq2+JRNPXvBeMSzwh4qkgt6I
	ybfGlcPPPYdV/OWojC1co2Cv3D+///F6id0DN6R6csc2/h+tZkfn8el3AfgVhgCBNxeK
	sxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OE/0uAXNkquyqqYy3ZEl0YBL4FjfuYngD/Eu88Okuq4=;
	b=dBmUn8/ACH/nsM3c5kFqTRCOCIAczrthn1N3BZtzpv1VDxx0kfCNfPZlMhqF98zzy8
	P50RW1h3IXd2d9UWh8ZXlC1GBfm/COAGrFt7xDXBQHmNXGl8I7uXoAMrdksIGrPSjlqK
	gk3SDYjMhe5tTWd6j6eZdCrdikjMLI7eFLo/maMC5d6bWxiSgTn7yQLpZrta04dIlV73
	OhD2E8cwUr08pofwN4lqc0m5+r6FG6enFrj6IOkpdQ3iZZDHMvSIn8NccleD16uCLBII
	dczIQ1QvmAlYXdEJEKCn9hIHjbYEv07yyFmyfa6wnigLit92RUMoIULMpJMJhM6Ole42
	okAA==
X-Gm-Message-State: APjAAAV3dQ9YxPj2VH7D/aMBc/FuFC1MfFaLiEbw7f1Lcmws5uZ8TsNm
	ekcQX1Oov8sebfNOLyHO1lu4mfv4
X-Google-Smtp-Source: APXvYqz1vUelCKLwNOa2Jkumo5EzHnX9WP2qlVC4mvB8Xk6zp+Xzt2J5fnbOo3JfCa2sNDbXOBS+Wg==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr2018461wmj.161.1570781200445; 
	Fri, 11 Oct 2019 01:06:40 -0700 (PDT)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	y186sm15431226wmb.41.2019.10.11.01.06.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 01:06:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2019 10:06:29 +0200
Message-Id: <20191011080629.3136-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011080629.3136-1-schnitzeltony@gmail.com>
References: <20191011080629.3136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [warrior][RESEND][PATCH 3/3] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Fri, 11 Oct 2019 08:06:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* qt4 support is gone -> move to qt5
* while at it remove noop libtool copy

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a086334bce809327a9ca6fe1006ae63861116349)
---
 .../recipes-multimedia/vlc/vlc.inc            | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index e5102a327..0bedc5da9 100644
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
2.21.0


