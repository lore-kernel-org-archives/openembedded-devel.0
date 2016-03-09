Return-Path: <gthomas@mlbassoc.com>
X-Greylist: delayed 337 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Mar 2016 06:26:18 UTC
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 94B2360290
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 06:26:18 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 6BFC068A01C; Wed,  9 Mar 2016 06:20:40 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9D24768A019;
	Wed,  9 Mar 2016 06:20:36 +0000 (GMT)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id 4E0316740A56; Wed,  9 Mar 2016 07:20:36 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 07:20:33 +0100
Message-Id: <1457504433-21548-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.5.0
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH] mpv: Media Player
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
X-List-Received-Date: Wed, 09 Mar 2016 06:26:19 -0000

mpv is a fork of mplayer2 and MPlayer. It shares some features with the former projects while introducing many more.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
new file mode 100644
index 0000000..37e4b02
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -0,0 +1,60 @@
+SUMMARY = "Open Source multimedia player"
+SECTION = "multimedia"
+HOMEPAGE = "http://www.mpv.io/"
+DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv libxscrnsaver"
+
+# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
+REQUIRED_DISTRO_FEATURES = "x11"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91f1cb870c1cc2d31351a4d2595441cb"
+
+SRC_URI = "https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
+           http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=waf \
+"
+SRC_URI[mpv.md5sum] = "9042bd3fbff2bc8ba0b7fadaa4a22101"
+SRC_URI[mpv.sha256sum] = "7d31217ba8572f364fcea2955733f821374ae6d8c6d8f22f8bc63c44c0400bdc"
+SRC_URI[waf.md5sum] = "cef4ee82206b1843db082d0b0506bf71"
+SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f22fca60c98b"
+
+EXTRA_OECONF = " \
+    --prefix=${D}/usr \
+    --mandir=${mandir} \
+    --target=${SIMPLE_TARGET_SYS} \
+    --disable-gl \
+    --disable-libsmbclient \
+    --disable-libass \
+    --disable-lua \
+    --disable-libass-osd \
+    --disable-encoding \
+    --disable-libbluray \
+    --disable-dvdread \
+    --disable-dvdnav \
+    --disable-cdda \
+    --disable-enca \
+    --disable-libguess \
+    --disable-uchardet \
+    --disable-rubberband \
+    --disable-lcms2 \
+    --disable-vapoursynth \
+    --disable-vapoursynth-lazy \
+    --enable-libarchive \
+"
+
+do_configure() {
+    if [ ! -L ../waf ]; then
+        chmod a+x ../waf-1.8.12
+	ln -s waf-1.8.12 ../waf
+    fi
+    ../waf configure ${EXTRA_OECONF}
+}
+
+do_compile () {
+    ../waf build
+}
+
+do_install() {
+    ../waf install
+}
+
+FILES_${PN} += "/usr/"
-- 
2.5.0


