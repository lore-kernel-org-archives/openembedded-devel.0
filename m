Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.315.1623866385258893709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ve65W4eX;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso2217515pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8VuKuIozYq4lPNXphA1f+FruQudGfuqh8YYe9yUjjsY=;
        b=ve65W4eXiN1BTDVNffLL4/0OVvn9pPyxnbbNVBChI0t4khCbI9aUvO65XA5JNo+fla
         aC9tUBgSYByOwYgsOz2ZpnvKaLBJf+kVqhSyyQPtB9TL77nG28o4V68HCygJc4PpkNap
         rExRfmpOBDk96tdbJrTmzaRvMUt0cjNFj79MjqmfpEX9DGwZSqdTl8x8a+j/VJSFXzfG
         rY9+p/w0nixlCpaw+KMRFYiuaSNDXv0v20qGIewpSlkJk3qlu3EJAIRchp2HZtzxwRHM
         HeLNO4OwMDNd3LC5IqFcNGzfeMj7F44JIYW9j2zOPa/RdHSzaAo/szonUPyToAmRM9f8
         OQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8VuKuIozYq4lPNXphA1f+FruQudGfuqh8YYe9yUjjsY=;
        b=RdUitwErdYWFc9AyQPNbEP77ZMVOkbjxsscxt5jpp7P5c8+58peCaa6zCd668wH1wj
         nRq2mZgr1+rcACMDXPG/GUXjm1Tg9c02NrXtybQ/6km/FqbafhfoqHwGKZuGGn+4jEOO
         am1mjnele5LAtroN0R7o/nXpPtcmyNxyjKoEWjVrpHxeRFB/nsiwYko24uYDBzwMYiQI
         HwV59BTPmOiQHP4owoAnpwJ3+U1HmzhODKar2IZznHvS664mhhvhY+UqFSmx/UJEZsLL
         0foEHrO0+moEhHtDpRJ8vDRe02uceNthd6bGPFLfu5szmw23OpEufiJr2JhzcheYG/3E
         LDtw==
X-Gm-Message-State: AOAM531W9+PauE/pS160P3QvSXJ/e1ztDOZ4cWcrGu/3mBH6qNGgKZIK
	rhrdP94K85mSblqn6fmsB8nRoYV8b3AlTA==
X-Google-Smtp-Source: ABdhPJxHNHMl9qPxZhpEZeZzMqxUYrPOH7W6i3XKj3i+AUntaxM96nVW2ygJ8jEU0rtkF/swslaEBQ==
X-Received: by 2002:a17:903:410b:b029:115:333f:dcda with SMTP id r11-20020a170903410bb0290115333fdcdamr659167pld.71.1623866384599;
        Wed, 16 Jun 2021 10:59:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/9] c-ares: Upgrade to 1.17.1 release
Date: Wed, 16 Jun 2021 10:59:35 -0700
Message-Id: <20210616175937.323664-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616175937.323664-1-raj.khem@gmail.com>
References: <20210616175937.323664-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forward port cmake-install-libcares.pc.patch, drop the need to install
pkgconfig files as its already being done by main Makefile

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../c-ares/cmake-install-libcares.pc.patch    | 27 +++++++------------
 .../{c-ares_1.16.1.bb => c-ares_1.17.1.bb}    |  4 +--
 2 files changed, 12 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.1.bb => c-ares_1.17.1.bb} (89%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
index 0eb7e4bbb3..c6f9c6de61 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
@@ -1,4 +1,4 @@
-From 12414304245cce6ef0e8b9547949be5109845353 Mon Sep 17 00:00:00 2001
+From 2cc41bee63223cb398ea932aad6ecc94ff5b61dd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 24 Jul 2018 13:33:33 +0800
 Subject: [PATCH] cmake: Install libcares.pc
@@ -11,12 +11,13 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
 update to 1.14.0, fix patch warning
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- CMakeLists.txt | 28 +++++++++++++++++++++++-----
- 1 file changed, 23 insertions(+), 5 deletions(-)
+ CMakeLists.txt | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd123e1..3a5878d 100644
+index 08c0247..0020d6b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
@@ -50,9 +51,9 @@ index fd123e1..3a5878d 100644
  
  # When checking for symbols, we need to make sure we set the proper
  # headers, libraries, and definitions for the detection to work properly
-@@ -554,6 +557,15 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_DIR}/ares_build.h)
- # Write ares_config.h configuration file.  This is used only for the build.
- CONFIGURE_FILE (ares_config.h.cmake ${PROJECT_BINARY_DIR}/ares_config.h)
+@@ -551,6 +554,15 @@ ENDIF()
+ # Record toplevel CMakeLists.txt path
+ set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
  
 +# Pass required CFLAGS to pkg-config in case of static library
 +IF (CARES_STATIC)
@@ -66,19 +67,11 @@ index fd123e1..3a5878d 100644
  
  # TRANSFORM_MAKEFILE_INC
  #
-@@ -728,6 +740,12 @@ IF (CARES_INSTALL)
+@@ -624,7 +636,6 @@ IF (CARES_INSTALL)
  	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
  ENDIF ()
  
-+# pkg-config file
-+IF (CARES_INSTALL)
-+       SET (PKGCONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-+       INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATION ${PKGCONFIG_INSTALL_DIR})
-+ENDIF ()
-+
+-
  # Legacy chain-building variables (provided for compatibility with old code).
  # Don't use these, external code should be updated to refer to the aliases directly (e.g., Cares::cares).
  SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
similarity index 89%
rename from meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
index 67dd701807..92eb9dae5a 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
@@ -5,14 +5,14 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.16.0+gitr${SRCPV}"
+PV = "1.17.1"
 
 SRC_URI = "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
 "
-SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
+SRCREV = "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.32.0

