Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.6972.1620483699505777246
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 May 2021 07:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TF2UcRT2;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id h14-20020a17090aea8eb02901553e1cc649so6997489pjz.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 May 2021 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tUtjhCsAUk/5FXGlRE+bjzRBqAkG4uxrm9puIyX3Iag=;
        b=TF2UcRT2a/R/dbsOYJeE09OCqCRxpmIfmOZPgokixhw7jJj5CPkO/bEtJYkflne9fX
         mwSpGzME0XY5dPwLKk7MtuU3JL/ZDSNzuxbYl1TiRfU/3vkCELuX7qu+ZaAuaUOUULuT
         zyMyXw4EdfF5p8MCGmHw86xWhhhf3PLtyBYj/n25bIy0Hcr3xbKERZLKQMlm69y0wiyO
         m8GjkVbk5wpg+Itd7i2hpVPoTrVn/XTNf02sEPzrJ+osSqTyT7GiTdd1C/4LN/5WAQqk
         L3QsZ0EPdCy64OxmVdd2tXAUCmS+dgSgvbtnKdqYQapP6+5pwrsUqOzeuM4aUg3XQ+FY
         eqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tUtjhCsAUk/5FXGlRE+bjzRBqAkG4uxrm9puIyX3Iag=;
        b=jxz3jLdt1sAnsjmUblEZJ/Zrh1JDIkGeM7PfyunOrgfXi3ZQgPVViWD0apOmYJsfBy
         qUKILVOc73g6XgZaovmDE9NbM8WkWAX7fVQaRkZbSdFgcWOgkZf4Q/l+bQ6mM+0Ofk8j
         fqIra0c4YWL8aWZDyJcamWY3JFz2dsA1SMXbLQ9NqdjObTTLRSEaJJ8EjPmowtguyhvL
         O/aMuqqlAGFKIxxYfhcbQ3F3NWz7D/Wa4C/Ox3BsuXLTL1u+Tn37eaZGDMEKKcYLHPMt
         HhzizniO1t78QxY/OYAm5Ad1+1zapLavbJYm3IDZKYyU0PHKzyWWOzok84zOAC854pDi
         ajfA==
X-Gm-Message-State: AOAM532mZLoUvPkKbu+4vh2aiOT09M+kRDjR2cJfLhl67HZ6nZCK6rL9
	iJ4GI3d9Ux+1y2GvwT98fl0oaRLxZt8Qaw==
X-Google-Smtp-Source: ABdhPJxWuoJlJNNIloMzxIyTEjYgxnJVH/9Pdm8D7oFCcUE3XoYrvTyF7DDzTrVfRMKZDaHUgngY3A==
X-Received: by 2002:a17:90a:288:: with SMTP id w8mr16456066pja.111.1620483698621;
        Sat, 08 May 2021 07:21:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id k9sm363802pgq.27.2021.05.08.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 07:21:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] libmusicbrainz: Rework native and target pieces
Date: Sat,  8 May 2021 07:21:35 -0700
Message-Id: <20210508142135.2014030-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build the native tools via a proper native recipe
Once done this way we do not need any patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../files/allow-libdir-override.patch         | 21 ------------
 .../musicbrainz/libmusicbrainz_git.bb         | 34 +++++--------------
 2 files changed, 9 insertions(+), 46 deletions(-)
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
index ca9d94a19c..f5ea36da91 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -3,38 +3,22 @@ DESCRIPTION = "The MusicBrainz client is a library which can be built into other
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
+    install -Dm 0644 ${B}/ImportExecutables.cmake ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+    sed -e "s#${B}/src/##g" ${D}${libdir}/cmake/${BPN}/ImportExecutables.cmake
+}
 
-# out-of-tree building doesn't appear to work for this package.
-B = "${S}"
+BBCLASSEXTEND = "native"
-- 
2.31.1

