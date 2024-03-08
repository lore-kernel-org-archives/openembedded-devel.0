Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780A7C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 06:29:55 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.15506.1709879392618996568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 22:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MEMa9n6g;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2206232d806so271014fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 22:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709879391; x=1710484191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHln7MWJomrb3AKVsCCoRGUe9cfHm9SUxvMUkYnzU1Q=;
        b=MEMa9n6gdR8GXf3QL7RxfzpXONkEtMMsGZuUEYcEJAA5n66Cc6xJ9xHe9y2IEKZlIS
         2HgMd7LoNzsejLrlB87r21RyATguylZVt9jAdAYo73RoiWdFRxzkQCWuE5XvkouRBZEI
         8waxA3pxojPTEYGx0DZnwND+lnKMcL5VDqq71nMV/6IewgJqTzDHWkcvs0at197SA59m
         VqwD9boI9XXTzcvsafiK5BbnKgXeP05s1xg+QvIxoshd+/uMfPi05Mw9mKD6L6HQjTFl
         ny1IhFPH3Q5PDX7u/ZE/4V/42s3F+Gznqe40gsN8GKZjC4sU0nr1qFPyXEBcwaBjClCu
         +lHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709879391; x=1710484191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHln7MWJomrb3AKVsCCoRGUe9cfHm9SUxvMUkYnzU1Q=;
        b=pLDS2ynaH0LS575LraNMEXCE5dPXe+MVl53L/Pu55ymnn2Htxqi25lKy6oUDbb9MSM
         NtzH//uwsj4/Fco0UD8M4Dd9rMohNDKlto5uiuWOf7Mrovi4pmhvJNAZh7JJBlJcCFzN
         PrV2t+KMvlxDt1sfvT1nyS6er8r1by7otUXhG1i4yoyNA7wUAh096X6JHiSxJ2RPfdWj
         bSfWplWGUiO95bZVu4JftJ9aaTnZnyTuNad1JYGxz73LW8fqN7ZWfplu+V/nJUVUovfk
         ofdcENlTYs+ZisauDt2isyIB4YjCw9G0F2CsZcSmmXQGc2Fw+tQLFXduBlX9BUZFp++G
         JEdg==
X-Gm-Message-State: AOJu0Yx2MCN3ahXn8pMaN6n/1rBwvpBJvN0+qlnUJMlvLhgjoqLH7XDQ
	4mUvGLq2LSaqZJG415+XIhxvPJp2tGWoIyDmCBfVhGSjrhofwbaX/x3cUaoP
X-Google-Smtp-Source: AGHT+IFiOvSEmuVdraeLKMN7qbyGyRtzawsawP0IbLX3MY8wTAsR++JSW6PvkpeULGV7YMCWa2CUiQ==
X-Received: by 2002:a05:6870:200f:b0:221:8360:c220 with SMTP id o15-20020a056870200f00b002218360c220mr2008795oab.58.1709879391412;
        Thu, 07 Mar 2024 22:29:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id d4-20020a056a00198400b006e4fc1b1881sm8443738pfl.24.2024.03.07.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 22:29:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] vlc: Upgrade to 3.0.20
Date: Thu,  7 Mar 2024 22:29:47 -0800
Message-ID: <20240308062947.1258485-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308062947.1258485-1-raj.khem@gmail.com>
References: <20240308062947.1258485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 06:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109223

Fix build with taglib 2.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../vlc/0001-make-opencv-configurable.patch   |  2 +-
 .../vlc/vlc/0002-use-vorbisidec.patch         |  2 +-
 ...packageconfig-to-detect-mmal-support.patch |  2 +-
 ...ave-same-signature-between-glibc-and.patch | 11 +--
 ...e-incompatible-function-pointer-type.patch |  7 +-
 .../recipes-multimedia/vlc/vlc/taglib-2.patch | 67 +++++++++++++++++++
 .../vlc/{vlc_3.0.18.bb => vlc_3.0.20.bb}      |  7 +-
 7 files changed, 76 insertions(+), 22 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.18.bb => vlc_3.0.20.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
index cc65af009b..d6ff0b2dba 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-make-opencv-configurable.patch
@@ -7,7 +7,7 @@ Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1892,7 +1892,16 @@ PKG_ENABLE_MODULES_VLC([BLURAY], [libblu
+@@ -1891,7 +1891,16 @@ PKG_ENABLE_MODULES_VLC([BLURAY], [libblu
  dnl
  dnl  OpenCV wrapper and example filters
  dnl
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
index 8ecddd33c6..f68da33607 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-use-vorbisidec.patch
@@ -6,7 +6,7 @@ Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 
 --- a/modules/codec/Makefile.am
 +++ b/modules/codec/Makefile.am
-@@ -321,7 +321,7 @@ codec_LTLIBRARIES += $(LTLIBdaala)
+@@ -324,7 +324,7 @@ codec_LTLIBRARIES += $(LTLIBdaala)
  libtremor_plugin_la_SOURCES = codec/vorbis.c
  libtremor_plugin_la_CPPFLAGS = $(AM_CPPFLAGS) -DMODULE_NAME_IS_tremor
  libtremor_plugin_la_LDFLAGS = $(AM_LDFLAGS) -rpath '$(codecdir)'
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
index b9f5ad591c..6659a44a0a 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-Use-packageconfig-to-detect-mmal-support.patch
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3461,27 +3461,18 @@ AC_ARG_ENABLE(mmal,
+@@ -3460,27 +3460,18 @@ AC_ARG_ENABLE(mmal,
    AS_HELP_STRING([--enable-mmal],
      [Multi-Media Abstraction Layer (MMAL) hardware plugin (default enable)]))
  if test "${enable_mmal}" != "no"; then
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch
index cbf4f2b911..89e7d585d7 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-ioctl-does-not-have-same-signature-between-glibc-and.patch
@@ -10,11 +10,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  modules/access/v4l2/v4l2.h | 4 ++++
  2 files changed, 8 insertions(+)
 
-diff --git a/modules/access/v4l2/lib.c b/modules/access/v4l2/lib.c
-index b212e1bc5f..ff7c66bf35 100644
 --- a/modules/access/v4l2/lib.c
 +++ b/modules/access/v4l2/lib.c
-@@ -43,7 +43,11 @@ int (*v4l2_fd_open) (int, int) = fd_open;
+@@ -49,7 +49,11 @@ int (*v4l2_fd_open) (int, int) = fd_open
  //int (*v4l2_open) (const char *, int, ...) = open;
  //int (*v4l2_dup) (const char *, int, ...) = dup;
  int (*v4l2_close) (int) = close;
@@ -26,11 +24,9 @@ index b212e1bc5f..ff7c66bf35 100644
  ssize_t (*v4l2_read) (int, void *, size_t) = read;
  //ssize_t (*v4l2_write) (int, const void *, size_t) = write;
  void * (*v4l2_mmap) (void *, size_t, int, int, int, int64_t) = mmap;
-diff --git a/modules/access/v4l2/v4l2.h b/modules/access/v4l2/v4l2.h
-index ac4562e269..727e83e9b1 100644
 --- a/modules/access/v4l2/v4l2.h
 +++ b/modules/access/v4l2/v4l2.h
-@@ -23,7 +23,11 @@
+@@ -28,7 +28,11 @@
  /* libv4l2 functions */
  extern int (*v4l2_fd_open) (int, int);
  extern int (*v4l2_close) (int);
@@ -42,6 +38,3 @@ index ac4562e269..727e83e9b1 100644
  extern ssize_t (*v4l2_read) (int, void *, size_t);
  extern void * (*v4l2_mmap) (void *, size_t, int, int, int, int64_t);
  extern int (*v4l2_munmap) (void *, size_t);
--- 
-2.39.2
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch
index 4128db1aea..b158328aa2 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0006-configure-Disable-incompatible-function-pointer-type.patch
@@ -10,11 +10,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
-index 9f1c099e13..8e45a05808 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -98,6 +98,11 @@ AS_IF([test -n "${with_binary_version}"],[
+@@ -98,6 +98,11 @@ AS_IF([test -n "${with_binary_version}"]
  dnl Prevent clang from accepting unknown flags with a mere warning
  AX_APPEND_COMPILE_FLAGS([-Werror=unknown-warning-option -Werror=invalid-command-line-argument], [CFLAGS])
  AX_APPEND_COMPILE_FLAGS([-Werror=unknown-warning-option -Werror=invalid-command-line-argument], [CXXFLAGS])
@@ -26,6 +24,3 @@ index 9f1c099e13..8e45a05808 100644
  
  dnl
  dnl  Check the operating system
--- 
-2.39.2
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch
new file mode 100644
index 0000000000..f238ff4244
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/taglib-2.patch
@@ -0,0 +1,67 @@
+Fix build with taglib 2.0
+
+Source: https://gitlab.archlinux.org/archlinux/packaging/packages/vlc/-/blob/main/taglib-2.patch?ref_type=heads
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/modules/meta_engine/taglib.cpp
++++ b/modules/meta_engine/taglib.cpp
+@@ -185,7 +185,7 @@ public:
+         ByteVector res(length, 0);
+         ssize_t i_read = vlc_stream_Read( m_stream, res.data(), length);
+         if (i_read < 0)
+-            return ByteVector::null;
++            return ByteVector();
+         else if ((size_t)i_read != length)
+             res.resize(i_read);
+         return res;
+@@ -465,7 +465,7 @@ static void ReadMetaFromASF( ASF::Tag* t
+ static void ReadMetaFromBasicTag(const Tag* tag, vlc_meta_t *dest)
+ {
+ #define SET( accessor, meta )                                                  \
+-    if( !tag->accessor().isNull() && !tag->accessor().isEmpty() )              \
++    if( !tag->accessor().isEmpty() )              \
+         vlc_meta_Set##meta( dest, tag->accessor().toCString(true) )
+ #define SETINT( accessor, meta )                                               \
+     if( tag->accessor() )                                                      \
+@@ -806,15 +806,15 @@ static void ReadMetaFromMP4( MP4::Tag* t
+ {
+     MP4::Item list;
+ #define SET( keyName, metaName )                                                             \
+-    if( tag->itemListMap().contains(keyName) )                                               \
++    if( tag->itemMap().contains(keyName) )                                               \
+     {                                                                                        \
+-        list = tag->itemListMap()[keyName];                                                  \
++        list = tag->itemMap()[keyName];                                                  \
+         vlc_meta_Set##metaName( p_meta, list.toStringList().front().toCString( true ) );     \
+     }
+ #define SET_EXTRA( keyName, metaName )                                                   \
+-    if( tag->itemListMap().contains(keyName) )                                  \
++    if( tag->itemMap().contains(keyName) )                                  \
+     {                                                                                \
+-        list = tag->itemListMap()[keyName];                                     \
++        list = tag->itemMap()[keyName];                                     \
+         vlc_meta_AddExtra( p_meta, metaName, list.toStringList().front().toCString( true ) ); \
+     }
+ 
+@@ -824,9 +824,9 @@ static void ReadMetaFromMP4( MP4::Tag* t
+ #undef SET
+ #undef SET_EXTRA
+ 
+-    if( tag->itemListMap().contains("covr") )
++    if( tag->itemMap().contains("covr") )
+     {
+-        MP4::CoverArtList list = tag->itemListMap()["covr"].toCoverArtList();
++        MP4::CoverArtList list = tag->itemMap()["covr"].toCoverArtList();
+         const char *psz_format = list[0].format() == MP4::CoverArt::PNG ? "image/png" : "image/jpeg";
+ 
+         msg_Dbg( p_demux_meta, "Found embedded art (%s) is %i bytes",
+@@ -1337,7 +1337,7 @@ static int WriteMeta( vlc_object_t *p_th
+         if( RIFF::AIFF::File* riff_aiff = dynamic_cast<RIFF::AIFF::File*>(f.file()) )
+             WriteMetaToId3v2( riff_aiff->tag(), p_item );
+         else if( RIFF::WAV::File* riff_wav = dynamic_cast<RIFF::WAV::File*>(f.file()) )
+-            WriteMetaToId3v2( riff_wav->tag(), p_item );
++            WriteMetaToId3v2( riff_wav->ID3v2Tag(), p_item );
+     }
+     else if( TrueAudio::File* trueaudio = dynamic_cast<TrueAudio::File*>(f.file()) )
+     {
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
index 12b32879a7..85af2f9bbe 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
@@ -16,17 +16,16 @@ DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native bison-nat
 LDFLAGS:append:riscv64 = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
-SRC_URI = "git://github.com/videolan/vlc.git;protocol=https;branch=3.0.x \
+SRC_URI = "https://get.videolan.org/${BPN}/${PV}/${BP}.tar.xz \
            file://0001-make-opencv-configurable.patch \
            file://0002-use-vorbisidec.patch \
            file://0003-fix-luaL-checkint.patch \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-ioctl-does-not-have-same-signature-between-glibc-and.patch \
            file://0006-configure-Disable-incompatible-function-pointer-type.patch \
-           file://0001-po-Fix-invalid-.oc-translation-format-string.patch \
+           file://taglib-2.patch \
 "
-SRCREV = "e9eceaed4d838dbd84638bfb2e4bdd08294163b1"
-S = "${WORKDIR}/git"
+SRC_URI[sha256sum] = "adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5"
 
 inherit autotools-brokensep features_check gettext pkgconfig mime-xdg
 
-- 
2.44.0


