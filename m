Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.9395.1609946281048539424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mQhlto84;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id n26so5501985eju.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w/7CsDpHxtJcXOJXT/czsGjRVlm65jMTgVjWQk8CvTA=;
        b=mQhlto84PtRXUgm2LVfP7Tdq/YATGx4a1NErbYYzFk8ORB0/AE4IVICoRlb6WxYq9y
         LOo4Tf9W/7wotGvL8AXZh8EMkO8Y/wpzZ6e2uOm2UjGk/6TMiDlwc6VAaFmjRn4OhAwa
         jUSm09rAKzSwbpobAX++KYHWTOmopP+Qi2fZcXVoQ9ae9MEHTjNQ0pSlKqT94sv972rK
         I60wJ24LJkVNNi7GymQLy5VjpwiaFHfyD4X3m3a4rzQduaziZIZj0jVRvitzRUw3T9zu
         208TEsKrxDGbQ/88FFj+1a7WetdcZE5DllACNKNzvlPmziKR/CfMyReWuxDNc8v+XHkY
         IUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w/7CsDpHxtJcXOJXT/czsGjRVlm65jMTgVjWQk8CvTA=;
        b=suDoj6ur0PuKcWZj+6jEZCtDa3oLpjyzUqfRoru0CYVy++1DKn3w09+McFLlYuFMAP
         3La8dyXcp4fqSgadp2UgouN1KyWCwBElLA08xY5jB5ivXFEGc23Z1GJhGaRU0fZ7477P
         03fvgJ0ndl80eK4axBvwt9NzY/stcCt/TyqAH1Koahc82MsU7YSplJx7GXrkiPGvtPJ4
         tA80KaN8EG0Rlu+4XmuESIfdfjopPq/clnsPDRhi2j/I2x88wefxOXELgnahdUnFekPa
         Y6Ntfd+eRtKaydxD5Lslq+7kI6EectPbPMWswV0p98KaQZLt3cZQtC5f8S7N5tj/HmbZ
         v/7Q==
X-Gm-Message-State: AOAM533t2vGivXzsYiQ/nMcXrwF6vl9fr6WEfL0a1/p7RPr2EiCA0A2X
	4QDW401Wy51qJJzgivN+QG/mUY254VUPvg==
X-Google-Smtp-Source: ABdhPJzNBZ105Pzf41N2Ce2/zvKNZ0Ki5Jvj55C2qSGzyHXUj2WOcIMUVsgc79iaVPEAxLivpI+Xbg==
X-Received: by 2002:a17:906:9a07:: with SMTP id ai7mr3257611ejc.216.1609946279614;
        Wed, 06 Jan 2021 07:17:59 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:58 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 23/28] xfce4-hotcorner-plugin: remove
Date: Wed,  6 Jan 2021 16:17:12 +0100
Message-Id: <20210106151717.1779543-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it broke by xfce 4.16
* the develeoper will not continue it [1]

[1] https://github.com/brianhsu/xfce4-hotcorner-plugin/issues/11

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...keLists.txt-fix-library-install-path.patch | 39 -------------------
 .../hotcorner/xfce4-hotcorner-plugin_0.0.2.bb | 14 -------
 .../packagegroup-xfce-extended.bb             |  1 -
 3 files changed, 54 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb

diff --git a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch
deleted file mode 100644
index df348dc85..000000000
--- a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Submitted [https://github.com/brianhsu/xfce4-hotcorner-plugin/pull/8]
-
-The library install path may be ${CMAKE_INSTALL_PREFIX}/lib64 rather
-than fixed ${CMAKE_INSTALL_PREFIX}/lib. Provide a variable to make it
-could override by cmake command line.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- CMakeLists.txt | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e193787..84cb52d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -10,8 +10,9 @@ include(GNUInstallDirs)
- 
- PKG_CHECK_MODULES(GTK REQUIRED libxfce4panel-1.0 libxfce4ui-1 libwnck-3.0)
- 
--set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
--set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
-+set(BASE_LIB_PATH "lib" CACHE STRING "base library install path")
-+set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${BASE_LIB_PATH})
-+set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${BASE_LIB_PATH})
- set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
-  
- INCLUDE_DIRECTORIES(${GTK_INCLUDE_DIRS})
-@@ -28,7 +29,7 @@ ADD_LIBRARY(hotcorner SHARED src/hotcorner.c src/util.c)
-  
- TARGET_LINK_LIBRARIES(hotcorner ${GTK_LIBRARIES})
- 
--INSTALL(TARGETS hotcorner  LIBRARY DESTINATION lib/xfce4/panel/plugins/)
-+INSTALL(TARGETS hotcorner  LIBRARY DESTINATION ${BASE_LIB_PATH}/xfce4/panel/plugins/)
- INSTALL(FILES hotcorner.desktop DESTINATION share/xfce4/panel/plugins/)
- GETTEXT_CREATE_TRANSLATIONS(po/xfce4-hotcorner-plugin.pot ALL po/zh_TW.po)
- 
--- 
-2.11.0
-
diff --git a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
deleted file mode 100644
index 57a815b1b..000000000
--- a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Plugin providing hotcorners"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README.md;beginline=48;endline=53;md5=2c694b8e0f73274b13465b509e4f5427"
-
-inherit xfce-panel-plugin cmake
-
-DEPENDS += "libwnck3"
-
-SRC_URI = "https://github.com/brianhsu/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.gz \
-           file://0001-CMakeLists.txt-fix-library-install-path.patch"
-SRC_URI[md5sum] = "ac31b45cda1867cb6bd69bb285638263"
-SRC_URI[sha256sum] = "942684c92f96a158e1417e597947f822769ac56aa1993a8c9f166ee633ef2b8d"
-
-EXTRA_OECMAKE = "-DBASE_LIB_PATH=${baselib}"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 255d2b5eb..f8a4b2f68 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -46,7 +46,6 @@ RRECOMMENDS_${PN} = " \
     xfce4-whiskermenu-plugin \
     xfce4-mailwatch-plugin \
     xfce4-smartbookmark-plugin \
-    xfce4-hotcorner-plugin \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \
     xfce4-sensors-plugin \
     xfce4-calculator-plugin \
-- 
2.26.2

