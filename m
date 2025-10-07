Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7379DCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 17:49:06 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.25517.1759859341192531991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 10:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ysrg5vt3;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2e0513433bso1013811366b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 10:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759859339; x=1760464139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2uBqC1hLetvkUMM6bx8YqeUi/j4soHi/2Nm6KCBdWAI=;
        b=Ysrg5vt3DIM0ZTXBKlmaAaP4qvjMADJF0W/0fyOUjHXzUCWvmLkgEYPa/42BBx2VjJ
         z43BUq9R4wkLwFhH40d2kxjg3ppFw7PxlD6yDviFQVgVSem6MXB28xmwLCYTlcwcGEr8
         AEU0jehZwBf2K1abKNXLkLUDVDZUhLV6ppG2mWsPOS1OFh3wGs+lOowegcmhVobths52
         zZyCCca47mpUpbWiECfBTLqOuHOUfoFXKWRVGjOtv1d2kvqc7S9bJUNI4aTWvAhcaGHm
         pUNDJVU61Uff+nIKuG4slZk15gOaBgM0EHbWvY+Hswk7JBvU3ypBXKeAgwdl3aTc+GYh
         44kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759859339; x=1760464139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uBqC1hLetvkUMM6bx8YqeUi/j4soHi/2Nm6KCBdWAI=;
        b=n+/xPViZQU6ckNCo6AmGnYKp5LvaXlt0U3B7cUIQVXz8nkLoq0x8LBC8aZxG1VbAFY
         3JswI9EVvtwmf8N6MsAeyzMpK1ej6KP4dtKblmKmWOjcGX9EtwR8MayhLETil9fQAFAT
         q+hYnQzxCjs1p+tF55wnxFOrPRsAW3f5ERtQmgk0C1v6+BEMEWNfYxL9z2b3Q3tD/fSN
         ZipiYCGHP8sYsfhc42CzfBdhwIJKmE9BcFOWSeDxmvA5Es7n/9V1rVNoqNO7q8ayCjU/
         6g43CsjqbsZGyaCV93BvG0vafOAuAcq7cGbBV6R7juJm8Pu73/ykeJV/qcoA29Kp4fQc
         l29g==
X-Gm-Message-State: AOJu0YwaEARgE6y5kPHGLd459yf/dv1pOMaEqyB29oVgPLEvAHZ9cuu1
	7l9ZCQt4Q3nOwDr6JWOtPja0QYZfWjypxLD719ydZe+lQIy8yzCDTlRoEgxxsA==
X-Gm-Gg: ASbGncs0YO4cABoVg98o2xXhBWnLz07TmZGMuXAHvirtqDKzz1fl7Rofc5pX+UlM48L
	Nsa6gE74eH06dMGbiJVfaJhWPEvTtjghG8+giAIQDP0Tt5L8xIDVQf5CSOriRO8HgcuGeZIMauN
	sKrNjTf9TrhdMZbA0Fu60/gRaylq3kagI9Uk69xdD6q/9+nrGTlF1AKPdgVQU9VDzq34xfENNHs
	m4GUMb0eD8Dd/cMvCZVebc765vBg0LhmwjDg5nLvQI4BWkwJ2WMPeoHEY/otUUIaOM+kos3UaoT
	tlT7Et0pdD/mwtB8y5fpXvG9WFf1vAJ4UX1+7Nsps5Ba0zVNBXSqQoi+o9q7j3hrLWwKrPvl9UP
	UXRC2OONJYnW+lBTd9szP9lJrR53IKVXzIziWSa27NnFW
X-Google-Smtp-Source: AGHT+IH01i+aZ5IGDaKuwH9RlBHwLKRngfrp/YudeeMbxAi6DpyNi/IfRgBToTiYwKIegUlGy+foCA==
X-Received: by 2002:a17:907:86a6:b0:b45:eea7:e986 with SMTP id a640c23a62f3a-b50ac4db255mr63912766b.43.1759859339209;
        Tue, 07 Oct 2025 10:48:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2basm1445063666b.51.2025.10.07.10.48.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 10:48:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libiec61850: upgrade 1.5.3 -> 1.6.1
Date: Tue,  7 Oct 2025 19:48:58 +0200
Message-ID: <20251007174858.87288-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 17:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120342

This update contains a fix for CVE-2024-26529, CVE-2024-45970 and CVE-2024-45971

Changelog: https://github.com/mz-automation/libiec61850/blob/v1.6/CHANGELOG

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...MAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 24 +++++++-----
 ...-break-CMAKE_INSTALL_PATH-by-trying-.patch | 39 -------------------
 ...iec61850_1.5.3.bb => libiec61850_1.6.1.bb} | 10 ++---
 3 files changed, 20 insertions(+), 53 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.3.bb => libiec61850_1.6.1.bb} (77%)

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
similarity index 77%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index cfded66e41..eb9ab9b4fe 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -13,10 +13,9 @@ SECTION = "console/network"
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
 
@@ -26,12 +25,13 @@ inherit cmake pkgconfig python3-dir python3native siteinfo
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

