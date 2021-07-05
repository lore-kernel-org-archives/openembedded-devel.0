Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.5037.1625446024968306849
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 17:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uBH6FolW;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id f17so3722988pfj.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jul 2021 17:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4jcUZPgJFPlIcNNqgAWbfZ0SQjslh0g+MvKAMt9YEY=;
        b=uBH6FolWQJX0z74vEhTLUl2dBACY1J/zd57DK6h3Jy1JrQOIIc6S5zKlKU4kek8bS6
         HB7t8YuY/Gl7AWy2tHioe5VoJEr1wN1883sHeHDKqtSpuNhzIjhmgsdysUAOY+t8E1h4
         Ms1JXyT3Ha2+e+KBXajwviFCtDC31wtW7IRpOfvdBMMpU9FvaabiI5HZSLN1/khtp1YJ
         BgmhjFTIYFMPSAy6Fyls/u475Eli3kbj1jf2Nrymck0V6CNEd4sgBsH4Lqz7+B93MZrL
         ZE4q7II84+2FRjOBIOHWWdEUPfoCcHcAEsM2Rrv68Ur5QTbLyIoMtDUeP/y8hY9OxHG6
         XAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4jcUZPgJFPlIcNNqgAWbfZ0SQjslh0g+MvKAMt9YEY=;
        b=U7gc3+GBqw5dspCDlLa8/tQRYrQbuK7SybEhBinAYEgXPINZPp2cEKQgMfEpON0A/+
         2feEwlCpjQEsAxATk5kA0/pVgO4JUfs19g8NRrWu2nwUd8iEFbUJ4opwa9usypf8c9Vo
         gIxqGeBdfdwbK+ntTm6nhwH8c2U6UjP36Ziu5rPaGF3yPPhDv2gdH/L52BwOe+FNZeqW
         HHchyQSFlbXSo2xeFFGUzuGz1tya6BlDvBaqQXp/4FD1xsX8VHO7pnEGGpLbI5VYl2xp
         0Jbmrr7xveExnmnQZhn6CshaWNRyuVVtmTiyA1KwS6hTNml8N6eZNwS67l3lFZwHHbbV
         k13A==
X-Gm-Message-State: AOAM532dFOJpiDlQwyIQm6Nhi0wgbh325JV1A2Mq19DRTuZryiuWWaZV
	IZlSZIq+wEyYb7tgAuJ7zY2/xN2bN/uJUA==
X-Google-Smtp-Source: ABdhPJyvQjAr7wBKiNJ0J5AoI2ZeRrsjIVyO0F5zBLca/y619dJdsB9J0SqBGZiU/warhkvoQMGH9w==
X-Received: by 2002:a63:7985:: with SMTP id u127mr12837262pgc.228.1625446024331;
        Sun, 04 Jul 2021 17:47:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id 10sm10687648pfh.174.2021.07.04.17.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 17:47:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] portaudio-v19: Use GNUInstallDirs to make it portable
Date: Sun,  4 Jul 2021 17:47:00 -0700
Message-Id: <20210705004700.2627341-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libdir varies for different architectures therefore do not hardcode it
to lib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Use-GNUInstallDirs.patch       | 49 +++++++++++++++++++
 .../portaudio/portaudio-v19_19.7.0.bb         |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch
new file mode 100644
index 0000000000..892399de70
--- /dev/null
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch
@@ -0,0 +1,49 @@
+From ced7af0420c1df0ac02f0c25e7c3534431ebd7fd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 4 Jul 2021 17:09:49 -0700
+Subject: [PATCH] cmake: Use GNUInstallDirs
+
+Helps install cmakefiles in right libdir
+
+Upstream-Status: Submitted [https://github.com/PortAudio/portaudio/pull/610]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,6 +6,8 @@
+
+ CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
+
++include(GNUInstallDirs)
++
+ # Check if the user is building PortAudio stand-alone or as part of a larger
+ # project. If this is part of a larger project (i.e. the CMakeLists.txt has
+ # been imported by some other CMakeLists.txt), we don't want to trump over
+@@ -452,18 +454,18 @@ IF(NOT PA_OUTPUT_OSX_FRAMEWORK AND NOT P
+   CONFIGURE_FILE(cmake_support/portaudio-2.0.pc.in ${CMAKE_CURRENT_BINARY_DIR}/portaudio-2.0.pc @ONLY)
+   INSTALL(FILES README.md DESTINATION share/doc/portaudio)
+   INSTALL(FILES LICENSE.txt DESTINATION share/doc/portaudio)
+-  INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/portaudio-2.0.pc DESTINATION lib/pkgconfig)
++  INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/portaudio-2.0.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+   INSTALL(FILES ${PA_PUBLIC_INCLUDES} DESTINATION include)
+   INSTALL(TARGETS ${PA_TARGETS}
+     EXPORT portaudio-targets
+-    RUNTIME DESTINATION bin
+-    LIBRARY DESTINATION lib
+-    ARCHIVE DESTINATION lib)
+-  INSTALL(EXPORT portaudio-targets FILE "portaudioTargets.cmake" DESTINATION "lib/cmake/portaudio")
++    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
++  INSTALL(EXPORT portaudio-targets FILE "portaudioTargets.cmake" DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/portaudio")
+   EXPORT(TARGETS ${PA_TARGETS} FILE "${PROJECT_BINARY_DIR}/cmake/portaudio/portaudioTargets.cmake")
+   INSTALL(FILES "${CMAKE_BINARY_DIR}/cmake/portaudio/portaudioConfig.cmake"
+                 "${CMAKE_BINARY_DIR}/cmake/portaudio/portaudioConfigVersion.cmake"
+-    DESTINATION "lib/cmake/portaudio")
++    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/portaudio")
+
+   IF (NOT TARGET uninstall)
+     CONFIGURE_FILE(
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index 3a0f7894f1..aec482b9b7 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -8,6 +8,7 @@ PV = "v190700"
 SRC_URI = " \
     git://github.com/PortAudio/portaudio.git \
     file://0001-Find-jack.patch \
+    file://0001-cmake-Use-GNUInstallDirs.patch \
 "
 SRCREV = "147dd722548358763a8b649b3e4b41dfffbcfbb6"
 S = "${WORKDIR}/git"
--
2.32.0
