Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.23756.1620594500717329330
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 May 2021 14:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n1+ceoMd;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id h20so8142273plr.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 May 2021 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J7l0Iu/MrlTOJFwgbFu+UHc9NKsKot9WwzyCPbJev3U=;
        b=n1+ceoMdjJCFFQ7qzD+WxcH6wFe94vsJRi6OxTcJtufSx625LRE6rSQk96qYRUmMqR
         W5xcbMYX0Kggq9MRZPQvv3iI4LeYvDFprwZySeqifKE6Lc21/v6LHyED4vTC64n5oK1n
         bwoxTxU4qJBsDLJvjgEqX5Gd/n67pM68wTJt9jJffhX9WzFL1l9vKAQsOFX6VS0ZFAPw
         sMDpCtHO/tsdWhqZXngD+NkfljzDB5T4WOa52tgOMH7oh3mfA5X+ircFnBn5bPnXzyUs
         soqmf5wYTZWKs5R3Tp6VqYwnGudiwaGm/2jE+KjGLTPnTaNyO3PedjqQeVjC2/G2Bkmb
         oDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J7l0Iu/MrlTOJFwgbFu+UHc9NKsKot9WwzyCPbJev3U=;
        b=KBbAepP8lodpge3exaqxAhnTlnSv59cjbiBtfnmd8Knav+K0QD7rs1opbIC/4U1IR5
         SfEc7/7IZqZG9bUufIYNdHMXX5suTqmrag3E48rWkDKWQgbhcbnb7u4GEW6q0A6C2AwQ
         2w82B1djxUaLyIQb4BbZCr1DUV/Q/qJQqrvXQcv6v7Aeh/cQHGbKmM0kmeWoRq2rtp5s
         HyAISZkiyvLNmyruHxmTMIAilhcYI0IAmNnbIkxc0u4yGuh4RqbPEJz0q+GZ0B/a6NSG
         pkZzRG3K8A2X0XZAATtb7GzsqSR8f5Ob0+ddkQtA1NXAJq9ehMOWrH/Atc7M8tPG9jzV
         pgYA==
X-Gm-Message-State: AOAM532mkR01qVAavo3M6KjvAt/JO6SRqjgAx+14R1Adgx7zXgKCxeNk
	QR/m6YYryC0Z/Oy5sle41hPkm0qPpCwR/g==
X-Google-Smtp-Source: ABdhPJzcltUepj2x4TtIoZFX2dPsiQOjJViecR3vdb9JXQlPvSwZTC47DR856oJPp3cbgQBnoronrA==
X-Received: by 2002:a17:90a:c389:: with SMTP id h9mr35549727pjt.98.1620594499916;
        Sun, 09 May 2021 14:08:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id n18sm9357514pgj.71.2021.05.09.14.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:08:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] libmusicbrainz: Rework native and target pieces
Date: Sun,  9 May 2021 14:08:17 -0700
Message-Id: <20210509210817.1511613-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build the native tools via a proper native recipe
Once done this way we do not need any patches

Bump SRCREV to latest which brings in one fix [1]

[1] https://github.com/metabrainz/libmusicbrainz/commit/8be45b12a86bc0e46f2f836c8ac88e1e98d82aee

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
v2: Improve commit msg
v3: Install native make-c-interface as well

 .../files/allow-libdir-override.patch         | 21 -----------
 .../musicbrainz/libmusicbrainz_git.bb         | 35 ++++++-------------
 2 files changed, 10 insertions(+), 46 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch b/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
deleted file mode 100644
index db4d6e8c99..0000000000
--- a/meta-multimedia/recipes-multimedia/musicbrainz/files/allow-libdir-override.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Allow LIB_INSTALL_DIR to be set by the the cmake configure invocation.  We dont
-easily have a way of determining something that patches ${LIB_SUFFIX} so we'll
-set LIB_INSTALL_DIR.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
-
-Index: git/CMakeLists.txt
-===================================================================
---- git.orig/CMakeLists.txt
-+++ git/CMakeLists.txt
-@@ -36,7 +36,7 @@ FIND_PACKAGE(LibXml2 REQUIRED)
- SET(LIB_SUFFIX "" CACHE STRING "Define suffix of directory name (32/64)")
- SET(EXEC_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE PATH "Installation prefix for executables and object code libraries" FORCE)
- SET(BIN_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/bin CACHE PATH "Installation prefix for user executables" FORCE)
--SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries" FORCE)
-+SET(LIB_INSTALL_DIR ${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX} CACHE PATH  "Installation prefix for object code libraries")
- SET(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE PATH "Installation prefix for C header files" FORCE)
- 
- CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libmusicbrainz5.pc.cmake ${CMAKE_CURRENT_BINARY_DIR}/libmusicbrainz5.pc)
diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index ca9d94a19c..20f0777c35 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -3,38 +3,23 @@ DESCRIPTION = "The MusicBrainz client is a library which can be built into other
 HOMEPAGE = "http://musicbrainz.org"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "expat libxml2 libxml2-native neon neon-native"
+DEPENDS = "expat libxml2 libxml2-native neon neon-native libmusicbrainz-native"
 
 PV = "5.1.0+git${SRCPV}"
 
-SRCREV = "44c05779dd996035758f5ec426766aeedce29cc3"
-SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
-           file://allow-libdir-override.patch "
+SRCREV = "8be45b12a86bc0e46f2f836c8ac88e1e98d82aee"
+SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git"
 
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
-do_configure_prepend() {
-    # The native build really doesn't like being rebuilt, so delete
-    # it if it's already present. Also delete all other files not
-    # known to Git to fix subsequent invocations of do_configure.
-    git clean -dfx -e /.pc/ -e /patches/ .
-    mkdir build-native
-    cd build-native
-    LDFLAGS="${BUILD_LDFLAGS}" \
-          cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
-          -DCMAKE_C_COMPILER=${BUILD_CC} \
-          -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
-          -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
-          -DCMAKE_EXE_LINKER_FLAGS=${BUILD_LDFLAGS} \
-          ..
-    make make-c-interface
-    cd ..
-}
+EXTRA_OECMAKE_append_class-target = " -DIMPORT_EXECUTABLES=${STAGING_LIBDIR_NATIVE}/cmake/${BPN}/ImportExecutables.cmake"
 
-EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
-                 -DIMPORT_EXECUTABLES=build-native/ImportExecutables.cmake"
+do_install_append_class-native() {
+    install -Dm 0755 ${B}/src/make-c-interface ${D}${bindir}/make-c-interface
+    install -Dm 0644 ${B}/ImportExecutables.cmake ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+    sed -e "s#${B}/src/##g" ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+}
 
-# out-of-tree building doesn't appear to work for this package.
-B = "${S}"
+BBCLASSEXTEND = "native"
-- 
2.31.1

