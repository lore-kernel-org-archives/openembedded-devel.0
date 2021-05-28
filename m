Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2135.1622162380341382121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 17:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C41qA7gd;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id v12so801840plo.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 17:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y1krudgDtvmHA/DgznWTu9RUVHly6Li7rz0KIgox3/Q=;
        b=C41qA7gdZx1ghrKYP/dLXd8/744fUP6cmiONjCWP5CR6M6/Kevb0yEIOKSo/Sk91da
         /uuxgJGxRSPaU20ltSarsS9dhU81Auo4a8JtRdl9et91x4I/KXRZiCIRvG8NG2O3ryii
         04s+DOLrfZu1ueBTs4xtdxwI+p7YUFTPknD7PoAUs/GH1uRxDUUlRQInZSaWG6Mt5Ld0
         5uTmVL05TzZ5YUURfyhHf9sEiyBTUEWAuSAxcvRQJoze+dAVkzxUoq9cJZAF5ZoF8Gyc
         vUihaic7ksRX+zoxoXpW2x+n2S5r4iUMFZKcN9yvJuMNbLFpC+/+gePR+032lqRDABBA
         VpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y1krudgDtvmHA/DgznWTu9RUVHly6Li7rz0KIgox3/Q=;
        b=Z6idgeniiVCWSVLSrLgr40PKkkGXfY1JdX0KVcQmY3yp2uECNdGuNa5AGzG5T8bIyV
         tazbiRl/q5A50DolbO1XplwuRl5DrzLx8hrrMSSYQBa+ymMLNBu9sFoDPmEV++EAZ/FX
         L3Blg/uqXfgCRYMzBiOHrQZ79oKAObqllrDYuxuqnnlNFs67K+KVTgJXaO++hFEE9tle
         xsiom234jhxAcaQNPUu1XK2H3o1Syq8zl5TRfIqBk8pOdxCp+9axZ4H6VXAjVenEDS6C
         9b1gFwE5/3DSNMKqqJt8crL50TPfkrfCMMhlVvnUzkEj4Ga0wTBZJvbF90+k14b5TNn3
         1Nag==
X-Gm-Message-State: AOAM53088w/dodT6Srs1MQp9+WuJQGiyXiMoj6tyciNQXxNFKQ5EA7rv
	WtHlOGGCxwnQk1r0rvLG67yaFAU0uwXsdQ==
X-Google-Smtp-Source: ABdhPJw+6WucMcRX0ek2fVU5ofvMMjixRUHNgiUI60+h4Liyinror4jhEUekrs40kf24NCLSl2bF0A==
X-Received: by 2002:a17:902:7e4e:b029:f0:d949:8ab3 with SMTP id a14-20020a1709027e4eb02900f0d9498ab3mr5574837pln.40.1622162379470;
        Thu, 27 May 2021 17:39:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id gb14sm2877460pjb.57.2021.05.27.17.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 17:39:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] sdbus-cpp: Do not fetch googletest on the fly
Date: Thu, 27 May 2021 17:39:36 -0700
Message-Id: <20210528003936.568907-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528003936.568907-1-raj.khem@gmail.com>
References: <20210528003936.568907-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This package downloads code ( gtest ) post do_fetch task

Now this is checked out by bitbake fetcher into decided source directory,
this ensures reproducibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fetch googletest via bitbake

 ...-Do-not-download-gtest-automatically.patch | 44 +++++++++++++++++++
 .../recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb | 10 ++++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Do-not-download-gtest-automatically.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Do-not-download-gtest-automatically.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Do-not-download-gtest-automatically.patch
new file mode 100644
index 0000000000..5bd3801f38
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Do-not-download-gtest-automatically.patch
@@ -0,0 +1,44 @@
+From af91a20ee201f13e56f225df536a56e5d8d259e8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 27 May 2021 09:56:49 -0700
+Subject: [PATCH] Do not download gtest automatically
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/CMakeLists.txt                        | 9 +--------
+ tests/googletest-download/CMakeLists.txt.in | 3 ---
+ 2 files changed, 1 insertion(+), 11 deletions(-)
+
+--- a/tests/googletest-download/CMakeLists.txt.in
++++ b/tests/googletest-download/CMakeLists.txt.in
+@@ -7,10 +7,7 @@ project(googletest-download NONE)
+ include(ExternalProject)
+ 
+ ExternalProject_Add(googletest
+-    GIT_REPOSITORY    https://github.com/google/googletest.git
+-    GIT_TAG           master
+-    GIT_SHALLOW       1
+-    SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/googletest-src"
++    SOURCE_DIR        "${CMAKE_CURRENT_SOURCE_DIR}/googletest-src"
+     BINARY_DIR        "${CMAKE_CURRENT_BINARY_DIR}/googletest-build"
+     UPDATE_COMMAND    ""
+     CONFIGURE_COMMAND ""
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -6,9 +6,7 @@ include(FetchContent)
+ 
+ message("Fetching googletest...")
+ FetchContent_Declare(googletest
+-                     GIT_REPOSITORY https://github.com/google/googletest.git
+-                     GIT_TAG        master
+-                     GIT_SHALLOW    1
++                     SOURCE_DIR    ${CMAKE_CURRENT_SOURCE_DIR}/googletest-src
+                      UPDATE_COMMAND "")
+ 
+ #FetchContent_MakeAvailable(googletest) # Not available in CMake 3.13 :-( Let's do it manually:
+@@ -144,4 +142,4 @@ endif()
+ if(NOT CMAKE_CROSSCOMPILING)
+     add_test(NAME sdbus-c++-unit-tests COMMAND sdbus-c++-unit-tests)
+     add_test(NAME sdbus-c++-integration-tests COMMAND sdbus-c++-integration-tests)
+-endif() 
++endif()
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
index 98829765c2..91cf70c911 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
 inherit cmake pkgconfig systemd ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-external-libsystemd', 'with-builtin-libsystemd', d)} \
-                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
+                   ${@bb.utils.contains('PTEST_ENABLED', '0', 'with-tests', '', d)}"
 PACKAGECONFIG[with-builtin-libsystemd] = ",,sdbus-c++-libsystemd,libcap"
 PACKAGECONFIG[with-external-libsystemd] = ",,systemd,libsystemd"
 PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${BPN}/tests,-DBUILD_TESTS=OFF"
@@ -17,7 +17,13 @@ PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${B
 DEPENDS += "expat"
 
 SRCREV = "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
-SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
+SRCREV_gtest = "a3460d1aeeaa43fdf137a6adefef10ba0b59fe4b"
+SRCREV_FORMAT = "default_gtest"
+
+SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master \
+           git://github.com/google/googletest.git;protocol=https;branch=master;name=gtest;destsuffix=git/tests/googletest-src \
+           file://0001-Do-not-download-gtest-automatically.patch \
+"
 SRC_URI += "file://run-ptest"
 
 EXTRA_OECMAKE = "-DBUILD_CODE_GEN=ON \
-- 
2.31.1

