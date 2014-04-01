Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0D01B6F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:15 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l18so7627306wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=souNk1AHqoDaqTodjBjWn/sMfwPbrobapIATzOr3zTs=;
	b=BzVFYpG5FpCVv4XGWnm60kplN+QGqIEAyaZewwZTCeMiuOfAUSPWiNiHwaS1txEaVC
	yNKKTmSYNGLZ54OkyTP/FmZss/rqxyY1feXj5YuzwaLgCsQc+/9AtToHy/QL8619AAjt
	7qACvZZwxZPy1mNK6ieIuYxQhH2sfUVNqR1jitYEjXi5soO/qbcp6asBc+HFNDagjPPI
	bdpb9rTv7gYip2uHeqJye8LlwOUs7HzZwoKDrW5WU4g2zOW7VRRXsGTr5eTDYrbMjRIB
	LpJhkicLKdWdyMIa0RMbFSLqzFvraIATaw8Ehyt0wdjJXvU2b/trOwvABJGNWtga9IyN
	EoqQ==
X-Received: by 10.194.81.164 with SMTP id b4mr24308914wjy.2.1396372456189;
	Tue, 01 Apr 2014 10:14:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm41847053eev.28.2014.04.01.10.14.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:17 +0200
Message-Id: <1396372434-10710-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/46] mplayer2: bump SRCREV to fix build issues with newer live555
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:16 -0000

* live555 support was removed in:
  http://git.mplayer2.org/mplayer2/commit/?id=e77b823b341fca0b931228d3e623dab50aa11723
* remove now unsupported options
* needs libav-9.10 which is in oe-core but with negative D_P otherwise
  configure fails:
  Requested 'libavcodec >= 54.25.0' but version of libavcodec is 53.35.0
* disable man installation, because we don't have rst2man

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...on-t-disable-ASS-support-when-explicitly-.patch | 26 ++++++++++++++
 .../mplayer/mplayer2/cross.compile.codec-cfg.patch | 16 ---------
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 41 +++++-----------------
 3 files changed, 35 insertions(+), 48 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2/0001-configure-don-t-disable-ASS-support-when-explicitly-.patch
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2/cross.compile.codec-cfg.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-configure-don-t-disable-ASS-support-when-explicitly-.patch b/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-configure-don-t-disable-ASS-support-when-explicitly-.patch
new file mode 100644
index 0000000..e232595
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-configure-don-t-disable-ASS-support-when-explicitly-.patch
@@ -0,0 +1,26 @@
+From 3541649b711a773aa2e42ac80d9b4c1b36fce23f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 27 Mar 2014 00:08:54 +0100
+Subject: [PATCH] configure: don't disable ASS support when explicitly enabled
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 60fd308..2f7df3b 100755
+--- a/configure
++++ b/configure
+@@ -4346,7 +4346,7 @@ fi
+ 
+ 
+ echocheck "SSA/ASS support"
+-if test "$_ass" = auto ; then
++if test "$_ass" = auto -o "$_ass" = yes ; then
+     if pkg_config_add libass ; then
+         _ass=yes
+         def_ass='#define CONFIG_ASS 1'
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2/cross.compile.codec-cfg.patch b/meta-oe/recipes-multimedia/mplayer/mplayer2/cross.compile.codec-cfg.patch
deleted file mode 100644
index 7b290b5..0000000
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2/cross.compile.codec-cfg.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff --git a/Makefile b/Makefile
-index 6013ca3..28c6383 100644
---- a/Makefile
-+++ b/Makefile
-@@ -600,7 +602,7 @@ mplayer$(EXESUF):
- 	$(CC) -o $@ $^ $(EXTRALIBS)
- 
- codec-cfg$(EXESUF): codec-cfg.c codec-cfg.h
--	$(HOST_CC) -O -DCODECS2HTML -I. -o $@ $<
-+	$(BUILD_CC) -O -DCODECS2HTML -I. -Iffmpeg -o $@ $<
- 
- codecs.conf.h: codec-cfg$(EXESUF) etc/codecs.conf
- 	./$^ > $@
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 63ee55e..2437884 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Open Source multimedia player"
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
-DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
+DEPENDS = "libvpx libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
            libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
            libxv virtual/libx11 libass speex faad2"
 
@@ -13,11 +13,11 @@ RCONFLICTS_${PN} = "mplayer"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "git://repo.or.cz/mplayer.git;branch=master \
-           file://cross.compile.codec-cfg.patch \
+SRC_URI = "git://repo.or.cz/mplayer.git \
+    file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
 "
 
-SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
+SRCREV = "2c378c71a4d9b1df382db9aa787b646628b4e3f9"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -47,21 +47,15 @@ EXTRA_OECONF = " \
     --disable-vm \
     --disable-xf86keysym \
     --enable-tv \
-    --disable-tv-v4l1 \     
     --enable-tv-v4l2 \
     --disable-tv-bsdbt848 \
     --enable-rtc \
     --enable-networking \
     --disable-smb \
-    --enable-live \
     --disable-dvdnav \
     --enable-dvdread \
     --disable-dvdread-internal \
     --disable-libdvdcss-internal \
-    --disable-cdparanoia \
-    --enable-freetype \
-    --enable-sortsub \
-    --disable-fribidi \
     --disable-enca \
     --disable-ftp \
     --disable-vstream \
@@ -84,49 +78,31 @@ EXTRA_OECONF = " \
     --disable-musepack \
     \
     --disable-gl \
-    --disable-vesa \
-    --disable-svga \
     --enable-sdl \
-    --disable-aa \
     --disable-caca \
-    --disable-ggi \
-    --disable-ggiwmh \
     --disable-directx \
-    --disable-dxr3 \
     --disable-dvb \
-    --disable-mga \
-    --disable-xmga \
     --enable-xv \
     --disable-vm \
     --disable-xinerama \
     --enable-x11 \
-    --enable-fbdev \
-    --disable-3dfx \
-    --disable-tdfxfb \
-    --disable-s3fb \
     --disable-directfb \
-    --disable-bl \
-    --disable-tdfxvid \
     --disable-tga \
     --disable-pnm \
     --disable-md5sum \
     \
     --enable-alsa \
     --enable-ossaudio \
-    --disable-arts \
-    --disable-esd \
     --disable-pulse \
     --disable-jack \
     --disable-openal \
-    --disable-nas \
-    --disable-sgiaudio \
-    --disable-sunaudio \
-    --disable-win32waveout \
     --enable-select \
     --enable-libass \
     \
-    --extra-libs=' -lXext -lX11 -lBasicUsageEnvironment -lUsageEnvironment -lgroupsock -lliveMedia -lstdc++ -lvorbis ' \
+    --extra-libs=' -lXext -lX11 -lvorbis -ltheoradec -lasound ' \
 "
+# -ltheoradec is missing in:
+# libmpcodecs/vd_theora.o: undefined reference to symbol 'theora_decode_init@@libtheora.so.1.0'
 
 EXTRA_OECONF_append_armv6 = " --enable-armv6"
 EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
@@ -157,7 +133,8 @@ do_compile () {
     oe_runmake
 }
 
-do_install_append() {
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install-no-man
     install -d ${D}/usr/etc/mplayer
     install ${S}/etc/input.conf ${D}/usr/etc/mplayer/
     install ${S}/etc/example.conf ${D}/usr/etc/mplayer/
-- 
1.9.1


