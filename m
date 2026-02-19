Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B772E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:32:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11060.1771497166722873873
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1713BAH;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4833115090dso7645165e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 02:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771497165; x=1772101965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yrxDmTTsce0EkKin8r4LaTckCFTkXD/jIognCrnLO0o=;
        b=Y1713BAHuO1tmalr1yE/kRLBhjD+nbvCbYjysIgamiHPUxxO0mVC/rso7GuH0yaBpL
         dvkZkxRcQLV5tiSA86VKfr3AfYrVLi3LBb/Cfr4H17gDHzekWgSuO/uHGRc5KDUkI8zU
         vMHoQQIWo9guR3uMLLFInNSCrr+jYwf782Bp86V++KaUxtyuQl9IC5WtmZPF37D/gwWi
         mgC5IZgbSgtTqpUaHgx/n8kTkDqNBg5kq9osVtZM9OA8NgjV/IKom2PSgLgjzwAgTIUK
         tQ0RiTeH7Bb4e+uR5KTXcCwgg1Jzr9HRBSjzJ/ueyLe3USUmQrhUs3FCuTpAgeC2gtfO
         72oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497165; x=1772101965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrxDmTTsce0EkKin8r4LaTckCFTkXD/jIognCrnLO0o=;
        b=Xg2pwvzCDwiB2p5jtkWJrKcRWmrMMPSeUoe2CrumViy+IqG0xcNMT2JnnokYIouyJN
         kY9EWd2TIy2xH08e4ju/9abCF+oI0ypnM5NiXKu9UFkJmL2dXbPTJ6jHbtIOHgylGLT3
         r5/E9U3NUimXSw2qcmpSZdU93M+yRLTXsfWkg2dz6rSF1op4eXtogLOYS9TkLzICs5NJ
         /y76/qTbrY4JOGHM/u3xiDMmIzJgjAtzuCu5RK27vw4yqVGU6bXN5iHl+koMjIUwjJEV
         TN3P8cUbepIl/A+XnxDVo6XVelDtgjxYNoa7NtupBARjuDW4UvdRNUkUBGKDNN5z3pvS
         naUw==
X-Gm-Message-State: AOJu0Yy/7+8vz3IqyWodDa6Y3i/5+vw/g6MEKGddxO3tEw3H5cgad2IL
	7t9Wo6Z/kHBDu+vhkcR+rpB+dW2mUDHIF6PTcQTd75XfYBppCqNyaG46TZIfpg==
X-Gm-Gg: AZuq6aLXT95P7oyyeAbNyxUfDZXt75c/jlHj9ioGhN/BmakQ1xcyn6MZlXMSdVq96+g
	nfgZh9di/oGLGDmVu2/fCOXkKE+Clqw/m3N+B33klraFIyR45hn3VKKgd9Xq7fK7v0y1Eydkwv8
	P2ayexnv1GM3dab3bVUX8cocI3k8yx+s8CPBYaPk/GHqZrUr+HVS8Sd8R1aiI9ejfKLTsyUlXUW
	zw6QFb8XYDBLzI610KB06yvaQ+wc3tCljQykGawJpMaGT63MEB2L7XWb36e5HXhlYsUa1oPkGPA
	+xasSEhM4aRiwrgATT2Jz19UHfdASFmGdBAbVAevQxYT7B8QDSAuahHjqhUfgUc1y9C85gvfoCt
	kcAQLE+5iZ1Kj2kxLR4iPhqFo1y79M+MLpDewCagQHzRinuPNTCEv1w1fY4qjBcG7nPCL/fUZUl
	E1r+eCH1nPBPxzIF9wwj3+
X-Received: by 2002:a05:600c:1987:b0:483:79a6:e7e1 with SMTP id 5b1f17b1804b1-48398a4839bmr89040815e9.7.1771497164829;
        Thu, 19 Feb 2026 02:32:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f978328sm16680325e9.14.2026.02.19.02.32.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:32:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] vlc: upgrade 3.0.21 -> 3.0.23
Date: Thu, 19 Feb 2026 11:32:43 +0100
Message-ID: <20260219103243.3622583-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 10:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124505

Vlc can be compiled again against modern ffmpeg - the SKIP_RECIPE tag is removed.

Drop patches that became obsolete, because the underlying problems were solved.

Was able to build it successfully with meta-qt5, and also play a video in core-image-sato.

Some (opt-in) PACKAGECONFIGs are broken (not removed as part of this patch):
- freerdp - it requires a too old freerdp codebase
- opencv - it requires a too old opencv codebase
- vdpau - compilation fails (undefined symbol av_vdpau_get_surface_parameters),
  not really sure about the reason

Changelog: https://github.com/videolan/vlc/blob/3.0.23/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-taglib-Fix-build-on-x86-32-bit.patch | 50 --------------
 .../recipes-multimedia/vlc/vlc/taglib-2.patch | 67 -------------------
 .../vlc/{vlc_3.0.21.bb => vlc_3.0.23.bb}      | 16 ++---
 3 files changed, 8 insertions(+), 125 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.21.bb => vlc_3.0.23.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch
deleted file mode 100644
index 2dff9b63ce..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-taglib-Fix-build-on-x86-32-bit.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 5b921009b0db2c5c15aef7ce241d3c81f9c272c9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Mar 2024 12:26:39 -0800
-Subject: [PATCH] taglib: Fix build on x86 32-bit
-
-While compiling with clang, there are errors seen such as
-on function override signature mismatches
-
-meta_engine/taglib.cpp:240:10: error: virtual function 'tell' has a different return type ('long') than the function it overrides (which has return type 'offset_t' (aka 'long long'))
-  240 |     long tell() const
-      |     ~~~~ ^
-/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/vlc/3.0.20/recipe-sysroot/usr/include/taglib/tiostream.h:156:22: note: overridden virtual function is here
-  156 |     virtual offset_t tell() const = 0;
-      |             ~~~~~~~~ ^
-meta_engine/taglib.cpp:245:10: error: virtual function 'length' has a different return type ('long') than the function it overrides (which has return type 'offset_t' (aka 'long long'))
-  245 |     long length()
-      |     ~~~~ ^
-/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/vlc/3.0.20/recipe-sysroot/usr/include/taglib/tiostream.h:161:22: note: overridden virtual function is here
-  161 |     virtual offset_t length() = 0;
-      |             ~~~~~~~~ ^
-
-Upstream-Status: Submitted [https://mailman.videolan.org/pipermail/vlc-devel/2024-March/143639.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- modules/meta_engine/taglib.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/modules/meta_engine/taglib.cpp b/modules/meta_engine/taglib.cpp
-index f371485008..129fdf55f1 100644
---- a/modules/meta_engine/taglib.cpp
-+++ b/modules/meta_engine/taglib.cpp
-@@ -237,12 +237,12 @@ public:
-         return;
-     }
- 
--    long tell() const
-+    offset_t tell() const
-     {
--        return m_previousPos;
-+        return (offset_t)m_previousPos;
-     }
- 
--    long length()
-+    offset_t length()
-     {
-         uint64_t i_size;
-         if (vlc_stream_GetSize( m_stream, &i_size ) != VLC_SUCCESS)
--- 
-2.44.0
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch
deleted file mode 100644
index f238ff4244..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Fix build with taglib 2.0
-
-Source: https://gitlab.archlinux.org/archlinux/packaging/packages/vlc/-/blob/main/taglib-2.patch?ref_type=heads
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/modules/meta_engine/taglib.cpp
-+++ b/modules/meta_engine/taglib.cpp
-@@ -185,7 +185,7 @@ public:
-         ByteVector res(length, 0);
-         ssize_t i_read = vlc_stream_Read( m_stream, res.data(), length);
-         if (i_read < 0)
--            return ByteVector::null;
-+            return ByteVector();
-         else if ((size_t)i_read != length)
-             res.resize(i_read);
-         return res;
-@@ -465,7 +465,7 @@ static void ReadMetaFromASF( ASF::Tag* t
- static void ReadMetaFromBasicTag(const Tag* tag, vlc_meta_t *dest)
- {
- #define SET( accessor, meta )                                                  \
--    if( !tag->accessor().isNull() && !tag->accessor().isEmpty() )              \
-+    if( !tag->accessor().isEmpty() )              \
-         vlc_meta_Set##meta( dest, tag->accessor().toCString(true) )
- #define SETINT( accessor, meta )                                               \
-     if( tag->accessor() )                                                      \
-@@ -806,15 +806,15 @@ static void ReadMetaFromMP4( MP4::Tag* t
- {
-     MP4::Item list;
- #define SET( keyName, metaName )                                                             \
--    if( tag->itemListMap().contains(keyName) )                                               \
-+    if( tag->itemMap().contains(keyName) )                                               \
-     {                                                                                        \
--        list = tag->itemListMap()[keyName];                                                  \
-+        list = tag->itemMap()[keyName];                                                  \
-         vlc_meta_Set##metaName( p_meta, list.toStringList().front().toCString( true ) );     \
-     }
- #define SET_EXTRA( keyName, metaName )                                                   \
--    if( tag->itemListMap().contains(keyName) )                                  \
-+    if( tag->itemMap().contains(keyName) )                                  \
-     {                                                                                \
--        list = tag->itemListMap()[keyName];                                     \
-+        list = tag->itemMap()[keyName];                                     \
-         vlc_meta_AddExtra( p_meta, metaName, list.toStringList().front().toCString( true ) ); \
-     }
- 
-@@ -824,9 +824,9 @@ static void ReadMetaFromMP4( MP4::Tag* t
- #undef SET
- #undef SET_EXTRA
- 
--    if( tag->itemListMap().contains("covr") )
-+    if( tag->itemMap().contains("covr") )
-     {
--        MP4::CoverArtList list = tag->itemListMap()["covr"].toCoverArtList();
-+        MP4::CoverArtList list = tag->itemMap()["covr"].toCoverArtList();
-         const char *psz_format = list[0].format() == MP4::CoverArt::PNG ? "image/png" : "image/jpeg";
- 
-         msg_Dbg( p_demux_meta, "Found embedded art (%s) is %i bytes",
-@@ -1337,7 +1337,7 @@ static int WriteMeta( vlc_object_t *p_th
-         if( RIFF::AIFF::File* riff_aiff = dynamic_cast<RIFF::AIFF::File*>(f.file()) )
-             WriteMetaToId3v2( riff_aiff->tag(), p_item );
-         else if( RIFF::WAV::File* riff_wav = dynamic_cast<RIFF::WAV::File*>(f.file()) )
--            WriteMetaToId3v2( riff_wav->tag(), p_item );
-+            WriteMetaToId3v2( riff_wav->ID3v2Tag(), p_item );
-     }
-     else if( TrueAudio::File* trueaudio = dynamic_cast<TrueAudio::File*>(f.file()) )
-     {
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
index 2d2ecc63b9..d17357b727 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.21.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
@@ -23,10 +23,8 @@ SRC_URI = "https://get.videolan.org/${BPN}/${PV}/${BP}.tar.xz \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-ioctl-does-not-have-same-signature-between-glibc-and.patch \
            file://0006-configure-Disable-incompatible-function-pointer-type.patch \
-           file://taglib-2.patch \
-           file://0001-taglib-Fix-build-on-x86-32-bit.patch \
 "
-SRC_URI[sha256sum] = "24dbbe1d7dfaeea0994d5def0bbde200177347136dbfe573f5b6a4cee25afbb0"
+SRC_URI[sha256sum] = "e891cae6aa3ccda69bf94173d5105cbc55c7a7d9b1d21b9b21666e69eff3e7e0"
 inherit autotools-brokensep features_check gettext pkgconfig mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -44,7 +42,6 @@ EXTRA_OECONF = "\
     --without-contrib \
     --without-kde-solid \
     --enable-realrtsp \
-    --disable-libtar \
     --enable-avcodec \
     ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/moc \
     ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/rcc \
@@ -94,7 +91,12 @@ PACKAGECONFIG[vnc] = "--enable-vnc,--disable-vnc, libvncserver"
 PACKAGECONFIG[x11] = "--with-x --enable-xcb,--without-x --disable-xcb,  xcb-util-keysyms libxpm libxinerama"
 PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland wayland-native"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland wayland-native wayland-protocols"
+
+do_configure:prepend() {
+    # use wayland-scanner from native sysroot instead of build host
+    sed -i 's,\(WAYLAND_SCANNER=\).*,\1${STAGING_BINDIR_NATIVE}/wayland-scanner,' configure.ac
+}
 
 do_configure:append() {
     # moc needs support: precreate build paths
@@ -117,7 +119,7 @@ FILES:${PN} += "\
     ${datadir}/applications \
     ${datadir}/vlc/ \
     ${datadir}/icons \
-    ${datadir}/metainfo/vlc.appdata.xml \
+    ${datadir}/metainfo/org.videolan.vlc.appdata.xml \
 "
 
 FILES:${PN}-dbg += "\
@@ -132,5 +134,3 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN} = "dev-so"
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
-
-SKIP_RECIPE[vlc] = "requires porting to ffmpeg >= 7 as of ffmpeg >= 5 it requires extensive changes disabling VAAPI (only supported with vlc >= 4)"

