Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14705CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:42:29 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.627.1759952542404839068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EHmJQZ67;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso298203a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 12:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759952541; x=1760557341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYN9eDG74rWnIGF7ufrR9p8wclc9Nzi22wdT+kPimaA=;
        b=EHmJQZ67I8RMhJR2tEtn5qdDjbZDiRj0UbF/kY7/I6hnwLW2syRBUrtZBUfHnmOX+9
         cah32VxMoNARC9YeEmhahu2aNSc9HYt6okfa27k4WdKdqSwdHCUhJ/pfZ+oxJ14ZIjJR
         NMabHRumCjIWuhkqFn0yqObx55kd+eTOspu93D6OHCtgPXagIP7HQBqz7c88WZWg39cP
         UwNJ/wFyhvzdmRwYgoUW6PcCqWc51U16T3ReJMZd+3tHT0t77lov63GhsQ5Af/HWfSAx
         T+CgPCQSKXQ5SngcJ95gDvzdyeOlPd29e9Of/XtQSKloMDyFdxKt4TECON0pa9GB4yCk
         WKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759952541; x=1760557341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYN9eDG74rWnIGF7ufrR9p8wclc9Nzi22wdT+kPimaA=;
        b=bsPHKLtmeq6s2AtTRgx1psDzpfJxtceLU8oPuX7y1A1IvWJlzggDfJUYzcU2qAFqEf
         IYEUMtAMNuu++4vG1n4TGETulkHUfsr3qZ+KDGGey02EcDYEAeJY2nhJvJzd78QcmArN
         1Xl/1SNpk6J17PvGsczVtCyRE2iRhTqkHDdKcdPiZueWAOUMPxp56xXlKuu6/KDR5D7s
         6k2VnObFBO7OU4CEE7vRp+89CHzW47zfgmcjucLyqWZH+HubVcW1Nhqw5aaxBQ6S1q0n
         I12kgLAcKYS+l9dJOHLZ9rj0mw5VhAG5DmdidhSdUsIyAQg4iZyZZLFEcJcnccnZapre
         74rw==
X-Gm-Message-State: AOJu0YydZaC6cF6G7PunP3/QGnU4E8NC2o1aioGmthYmI5jblOMBVFrD
	JSmfi0OSgjO6doT6QY8+uMY3vR0dVVRQU7aT5CxPTLZpTwjDJXDTNhajtb/8DLtg
X-Gm-Gg: ASbGncuUyEukJWyetkkl1B64/Gf2iz2w41EJ1pFVcO4GcNpchJvZs3mowc3qbHqncoj
	12yvgtq8i6mhqmdSfzvnLoeTVxn2vy+oaZyyD9xVxRAh64JnsJcIX+eoQ/XbXGxmZxFluYr61kQ
	7fZS6Xv34kkbiySfHhUtERQXp/lHu+9nU/5eSllfn8mw7Jw0eFsF0xP4Cyx7hp5sSeuq2wxgZMs
	O2PgbmlGVAqBt0aTU0GdPt/dbKW93U/YDKvt65tv7495EsmFAO9+vRFN8U0VWfoaTps6NYvQ51H
	ZycOJWk7tpPh9HYITj3R/UAGgUri79ATLS0ZNsk39YA42eOZP7F1//n8enwtDId489GxMbhdWCz
	aPP+5uFxp2yMXq1mLiznFr9dm1f1Zlt8qFG4loI5IP9za
X-Google-Smtp-Source: AGHT+IE8NWJeWOcGXsdiszy8ZARc+NJ4WZTONIjr4ckGKgHUDa47kbdGtKvIBhe7XHUj1IvUCvbimg==
X-Received: by 2002:a17:907:7290:b0:b45:a03f:d172 with SMTP id a640c23a62f3a-b50acc2f5bemr551902066b.57.1759952540357;
        Wed, 08 Oct 2025 12:42:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f93esm1736693366b.83.2025.10.08.12.42.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:42:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] libiec61850: upgrade 1.5.3 -> 1.6.1
Date: Wed,  8 Oct 2025 21:42:19 +0200
Message-ID: <20251008194219.497061-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 19:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120382

This update contains a fix for CVE-2024-26529, CVE-2024-45970 and CVE-2024-45971

Changelog: https://github.com/mz-automation/libiec61850/blob/v1.6/CHANGELOG

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: inherit python3targetconfig to avoid using python headers from ${RECIPE_SYSROOT_NATIVE}

 ...MAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 24 +++++++-----
 ...-break-CMAKE_INSTALL_PATH-by-trying-.patch | 39 -------------------
 ...iec61850_1.5.3.bb => libiec61850_1.6.1.bb} | 12 +++---
 3 files changed, 21 insertions(+), 54 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.3.bb => libiec61850_1.6.1.bb} (72%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
index e778e8158b..a33a6248a7 100644
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
+++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs in
 This ensures that it gets installed in platform specified system libdir
 all platforms do not use /usr/lib as assumed here e.g. ppc64 uses lib64
 
-Upstream-Status: Submitted [https://github.com/mz-automation/libiec61850/pull/376]
+Upstream-Status: Denied [https://github.com/mz-automation/libiec61850/pull/376 - closed without a word]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  pyiec61850/CMakeLists.txt | 6 ++++--
@@ -15,15 +15,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/pyiec61850/CMakeLists.txt
 +++ b/pyiec61850/CMakeLists.txt
-@@ -31,7 +31,9 @@ endif()
+@@ -31,14 +31,9 @@ swig_add_library(pyiec61850
  
- swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
+ swig_link_libraries(pyiec61850 ${LIBS})
  
--install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
--install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
+-# Finding python modules install path
+-execute_process(
+-	COMMAND ${Python_EXECUTABLE} -c
+-	"from sysconfig import get_path; import sys; sys.stdout.write(get_path('platlib'))"
+-	OUTPUT_VARIABLE PYTHON_SITE_DIR
+-)
 +include(GNUInstallDirs)
-+
-+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
-+install(TARGETS _iec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}//python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
  
- add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
+-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${PYTHON_SITE_DIR})
+-install(TARGETS pyiec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
++install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
+ 
+ add_test(test_pyiec61850 ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
deleted file mode 100644
index 3f0490cb80..0000000000
--- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 10 Jul 2020 17:08:34 +0200
-Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
- python modules install path (site-packages)
-
-https://stackoverflow.com/questions/1242904/finding-python-site-packages-directory-with-cmake
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
-Upstream-Status: Pending
-
- pyiec61850/CMakeLists.txt | 11 ++---------
- 1 file changed, 2 insertions(+), 9 deletions(-)
-
-diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
-index 159ef4b..d1732a1 100644
---- a/pyiec61850/CMakeLists.txt
-+++ b/pyiec61850/CMakeLists.txt
-@@ -31,14 +31,7 @@ endif()
- 
- swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
- 
--# Finding python modules install path
--execute_process(
--	COMMAND ${PYTHON_EXECUTABLE} -c
--	"from distutils.sysconfig import get_python_lib; import sys; sys.stdout.write(get_python_lib())"
--	OUTPUT_VARIABLE PYTHON_SITE_DIR
--)
--
--install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${PYTHON_SITE_DIR})
--install(TARGETS _iec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
-+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
-+install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
- 
- add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
--- 
-2.31.1
-
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
similarity index 72%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index cfded66e41..c46ed88d83 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -13,25 +13,25 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
+SRCREV = "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
 
-SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
-           file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
+SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
 "
 
 
-inherit cmake pkgconfig python3-dir python3native siteinfo
+inherit cmake pkgconfig python3-dir python3native siteinfo python3targetconfig
 
 EXTRA_OECMAKE = " \
     -DBUILD_EXAMPLES=OFF \
     -DBUILD_PYTHON_BINDINGS=ON \
+    -DPYTHON_BASEVERSION=${PYTHON_BASEVERSION} \
 "
 
 RDEPENDS:${PN}-python = " python3-core "
 RDEPENDS:${PN} = " python3-core "
 
 FILES:${PN} += " \
-    ${PYTHON_SITEPACKAGES_DIR}/iec61850.py \
-    ${PYTHON_SITEPACKAGES_DIR}/_iec61850.so \
+    ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
+    ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
 "

