Return-Path: <Abdur_Rehman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 55AC36FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 19:08:19 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b5Hgi-0004FR-4T from Abdur_Rehman@mentor.com ;
	Tue, 24 May 2016 12:08:20 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 24 May 2016 20:08:18 +0100
From: Abdur Rehman <abdur_rehman@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 May 2016 00:07:51 +0500
Message-ID: <1464116871-38779-2-git-send-email-abdur_rehman@mentor.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1464116871-38779-1-git-send-email-abdur_rehman@mentor.com>
References: <1464116871-38779-1-git-send-email-abdur_rehman@mentor.com>
MIME-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [meta-oe][PATCH v4 2/2] mpv: Media Player
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
X-List-Received-Date: Tue, 24 May 2016 19:08:21 -0000
Content-Type: text/plain

mpv is a fork of mplayer2 and MPlayer. It shares some features with
the former projects while introducing many more.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 69 ++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
new file mode 100644
index 0000000..e5d5c53
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -0,0 +1,69 @@
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
+inherit pkgconfig pythonnative
+
+# Note: both lua and libass are required to get on-screen-display (controls)
+PACKAGECONFIG ??= "lua libass"
+PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua luajit"
+PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
+PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive"
+PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
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
+    export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
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
2.8.1


