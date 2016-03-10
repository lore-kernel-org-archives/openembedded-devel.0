Return-Path: <gthomas@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 608E9731EC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:07:46 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id E7CB868A01C; Thu, 10 Mar 2016 16:07:46 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id A0FD368A01B;
	Thu, 10 Mar 2016 16:07:27 +0000 (GMT)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id 57DBD6740715; Thu, 10 Mar 2016 17:07:27 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 17:07:22 +0100
Message-Id: <1457626042-28653-3-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH v3 2/2] mpv: Media Player
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
X-List-Received-Date: Thu, 10 Mar 2016 16:07:46 -0000

mpv is a fork of mplayer2 and MPlayer. It shares some features with
the former projects while introducing many more.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
new file mode 100644
index 0000000..acad319
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -0,0 +1,67 @@
+SUMMARY = "Open Source multimedia player"
+SECTION = "multimedia"
+HOMEPAGE = "http://www.mpv.io/"
+DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
+           libxscrnsaver libv4l libxinerama \
+"
+
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
+inherit pkgconfig
+
+# Note: both lua and libass are required to get on-screen-display (controls)
+PACKAGECONFIG ??= "lua libass"
+PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
+PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
+PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
+
+EXTRA_OECONF = " \
+    --prefix=${prefix} \
+    --target=${SIMPLE_TARGET_SYS} \
+    --confdir=${sysconfdir} \
+    --datadir=${datadir} \
+    --disable-manpage-build \
+    --disable-gl \
+    --disable-libsmbclient \
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
+    ../waf install --destdir=${D}
+}
+
+FILES_${PN} += "${datadir}/icons"
-- 
2.5.0


