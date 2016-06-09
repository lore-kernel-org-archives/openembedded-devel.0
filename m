Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DD81560722
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 18:13:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c74so3312889pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=i3jWcw/G87T4DWaeHPQ2jnBhhtziMfHzRyg3c2Q76J8=;
	b=sBb07oFpkvftPCamgZZioN0aM0Qu0g/1P+cyuJPsU3qdToom7PX4H8nj1JRmhuCOul
	X8/3KNfnl1rK+8tlkaC3q0ZnvNudeBG2gFL5MOvazP6eHEcUo4F+HeG7MCNjoCeqPX3B
	5hN8A40z2/rNAebhxFU8pvm6imUF7Rmt6wmcnKZR6IPge4NXGc6YV+nHrKstCB43w9Y0
	U98a2c4p3W0oFk/cQE8MyMwDC7nNqk+gFYq71ivYT6L7jIf1HzbjHemabBMvfvP6MWty
	fHlb7RQSelfwePTGhoJZmBwszXarC9eH5GlndLJ9/MrG+tt2o5shPk5kVwCGNLICJud2
	TTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=i3jWcw/G87T4DWaeHPQ2jnBhhtziMfHzRyg3c2Q76J8=;
	b=deCfrsdJROnLdQzYdxeHgjm3tQQ876umigXKe/C4MNgQwsr6twxlLl5fP2IHraPeZB
	RDjc/4qxoTYwf88JU8Rj6apZV+RFwQaiuLcJuMYBlJpU7qLtb0Bc5yo9+dJ8oGWect3B
	yJTmfyOi7fVG52Q3K6ieWrezXZSvhn0+9qLZPBF02UZS9rW7MI5SLVlq+IZgbMuWYzJd
	wGng9mYrGTTN42FXl2X8AQdIQOwZq/7VpILXMbYzsvZAbMbitF9t6cvMY95cmV2gfalw
	XhrOF0NGb4vbzCXGktrx9GC5HMwZ3G1Jhcg5ku84l8sFd/tTD6QZre1DdBVlcS80sWob
	lugA==
X-Gm-Message-State: ALyK8tLhTEnElKJpgUKRha8kQqCdTZahkJPdlalTNtPMbmPg/CSHznjmN0vP5HMyZSh+bw==
X-Received: by 10.98.75.83 with SMTP id y80mr5754218pfa.97.1465496026133;
	Thu, 09 Jun 2016 11:13:46 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	fd8sm11647579pac.23.2016.06.09.11.13.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jun 2016 11:13:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 11:13:32 -0700
Message-Id: <6a901498827e454d5a3852b9e45dc1ad67ca9442.1465495803.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <753103782dfd0011b8babec0d1d88df41c61c97e.1465495803.git.chris_larson@mentor.com>
References: <753103782dfd0011b8babec0d1d88df41c61c97e.1465495803.git.chris_larson@mentor.com>
In-Reply-To: <cover.1465495803.git.chris_larson@mentor.com>
References: <cover.1465495803.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 2/2] mpv: use waf.bbclass
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
X-List-Received-Date: Thu, 09 Jun 2016 18:13:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
index 5fac298..768c87a 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -12,14 +12,14 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
 
 SRC_URI = "https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
-           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf \
+           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf;subdir=${BPN}-${PV} \
 "
 SRC_URI[mpv.md5sum] = "9042bd3fbff2bc8ba0b7fadaa4a22101"
 SRC_URI[mpv.sha256sum] = "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
 SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
 SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
 
-inherit pkgconfig pythonnative distro_features_check
+inherit waf pkgconfig pythonnative distro_features_check
 
 # Note: both lua and libass are required to get on-screen-display (controls)
 PACKAGECONFIG ??= "lua libass"
@@ -28,6 +28,7 @@ PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
 PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
 PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
 
+SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
 EXTRA_OECONF = " \
     --prefix=${prefix} \
     --target=${SIMPLE_TARGET_SYS} \
@@ -50,21 +51,9 @@ EXTRA_OECONF = " \
     --disable-vapoursynth-lazy \
 "
 
-do_configure() {
-    if [ ! -L ../waf ]; then
-        chmod a+x ../waf-1.8.12
-	ln -s waf-1.8.12 ../waf
-    fi
-    export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
-    ../waf configure ${EXTRA_OECONF}
-}
-
-do_compile () {
-    ../waf build
-}
-
-do_install() {
-    ../waf install --destdir=${D}
+do_configure_prepend () {
+    ln -sf waf-1.8.12 ${S}/waf
+    chmod +x ${S}/waf
 }
 
 FILES_${PN} += "${datadir}/icons"
-- 
2.8.0


