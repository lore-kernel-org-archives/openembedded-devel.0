Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 362C372EB0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 06:34:45 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o15-v6so10745042wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Mzm4GwHl42ioXEmLAXYn9VAGxBRde+MlWvJVT2kX700=;
	b=atTpQMxzKhE5Zs+3Ou1m5ASXj1kz7gV3m1/xYtnjqYyQtSf9NMOJ+PVEZTJStOnjX7
	JfAMzvsmHVbUXvDwacfYou156RpaSh45dAlYnw7RcF0k8i5zE/H9qwhtiFRwPZKH6Mab
	pQBUTkZe2A3oscLP7vmcWqJnavi62a8CiGT6Qbd4L9kt94D1+On3fOwvAT2PoDhuM8qx
	f1qtuTQ/prtjbtHxsOi+sfS2ENALXCdIjOw29DaT1MVvp3gf+DQlnvRZCMbNXR84ynHw
	CaAzDOIFuv3lDbA5pDZZI6pgbg4n6XgGIiW96MsF3jTWDLZ3RQpl0qUDCWXiv9pONfK9
	vflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Mzm4GwHl42ioXEmLAXYn9VAGxBRde+MlWvJVT2kX700=;
	b=Xx954YAwj0oU7AZC1zh98UMru75L0nzMXugoewX7aBgdtCPzoz76M6ib61W3YEZEyU
	qpE68yxZx5lgYlGtF+zOxLdEc3cxSq7qOEkMB4zt0nYO0sFmieK0AmVoYSsvY1V8d2t8
	+ASDT+4uBHBcGzh9UQC20GGPZzJva15vLjDu+l0BzFF7pxFz1Pc5xC3PI60PbqMzANUl
	HmH7AbCtMMFuzQs78kIcBie1ammSJcv3J+KdDYe7Yr/fGZQbnLRu9rwTh/c+L8Zc9jhm
	tgcD168VVZSK+fEWW0v6Hsvv3iUwrtGxJqJ43pzVFnnX7KWRLCRztE2eo1Sk9YvCj4oW
	BBKg==
X-Gm-Message-State: ALQs6tCx8Yf/bWQU/jlQAyLHRyID1baW759XpEyRMwTn3nNzOfB/l3O/
	zkJAoetXinUZpp3E5/wIAN3NjQ==
X-Google-Smtp-Source: AIpwx48IGeCMC8WrRa7TCBX+I6UOoocncXnfJdxNyIXjx/YAvftkBoCAh71cvDrKH1wfvqCwT2wLAg==
X-Received: by 2002:adf:c50f:: with SMTP id
	q15-v6mr3420453wrf.208.1524119685814; 
	Wed, 18 Apr 2018 23:34:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y68-v6sm3179429wrb.91.2018.04.18.23.34.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Apr 2018 23:34:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Apr 2018 06:34:33 +0000
Message-Id: <20180419063433.4985-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180419063433.4985-1-Martin.Jansa@gmail.com>
References: <20180419063433.4985-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][WIP][PATCH 2/2] tufao: fix build with Qt 5.11, don't use qt5_use_modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 06:34:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ix-build-with-Qt-5.11-don-t-use-qt5_.patch | 91 +++++++++++++++++++
 recipes-qt/tufao/tufao_1.3.10.bb              |  4 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/tufao/tufao/0001-CMakeLists.txt-fix-build-with-Qt-5.11-don-t-use-qt5_.patch

diff --git a/recipes-qt/tufao/tufao/0001-CMakeLists.txt-fix-build-with-Qt-5.11-don-t-use-qt5_.patch b/recipes-qt/tufao/tufao/0001-CMakeLists.txt-fix-build-with-Qt-5.11-don-t-use-qt5_.patch
new file mode 100644
index 0000000..50dd784
--- /dev/null
+++ b/recipes-qt/tufao/tufao/0001-CMakeLists.txt-fix-build-with-Qt-5.11-don-t-use-qt5_.patch
@@ -0,0 +1,91 @@
+From 85a4a1fcba0d81fbd8c4af3421114360f32c384e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 19 Apr 2018 06:31:09 +0000
+Subject: [PATCH] CMakeLists.txt: fix build with Qt 5.11, don't use
+ qt5_use_modules
+
+* replace deprecated (and in 5.11 removed) qt5_use_modules macro usage with
+  the list of libraries in target_link_libraries as suggested in:
+  https://stackoverflow.com/questions/31172156/what-to-use-instead-of-qt5-use-modules
+
+Upstream-Status: Submitted https://github.com/vinipsmaker/tufao/pull/91
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ examples/cmake/hello-cmake/CMakeLists.txt           | 3 +--
+ examples/cmake/sample_plugin/plugins/CMakeLists.txt | 3 +--
+ examples/cmake/sample_plugin/src/CMakeLists.txt     | 3 +--
+ src/CMakeLists.txt                                  | 2 +-
+ src/tests/CMakeLists.txt                            | 3 +--
+ 5 files changed, 5 insertions(+), 9 deletions(-)
+
+diff --git a/examples/cmake/hello-cmake/CMakeLists.txt b/examples/cmake/hello-cmake/CMakeLists.txt
+index 1995220..e93c83c 100644
+--- a/examples/cmake/hello-cmake/CMakeLists.txt
++++ b/examples/cmake/hello-cmake/CMakeLists.txt
+@@ -13,5 +13,4 @@ find_package(CXX11 REQUIRED)
+ set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXX11_FLAGS}")
+ 
+ add_executable(${PROJECT_NAME} main.cpp)
+-qt5_use_modules(${PROJECT_NAME} Core Network)
+-target_link_libraries(${PROJECT_NAME} ${TUFAO_LIBRARIES})
++target_link_libraries(${PROJECT_NAME} ${TUFAO_LIBRARIES} Qt5::Core Qt5::Network)
+diff --git a/examples/cmake/sample_plugin/plugins/CMakeLists.txt b/examples/cmake/sample_plugin/plugins/CMakeLists.txt
+index 3099dfb..b0ded18 100644
+--- a/examples/cmake/sample_plugin/plugins/CMakeLists.txt
++++ b/examples/cmake/sample_plugin/plugins/CMakeLists.txt
+@@ -9,5 +9,4 @@ set(PLUGIN_HEADERS
+ )
+ 
+ add_library(Test SHARED ${PLUGIN_HEADERS} ${PLUGIN_SOURCE})
+-qt5_use_modules(Test Core Network)
+-target_link_libraries(Test ${TUFAO_LIBRARIES})
++target_link_libraries(Test ${TUFAO_LIBRARIES} Qt5::Test Qt5::Core Qt5::Network)
+diff --git a/examples/cmake/sample_plugin/src/CMakeLists.txt b/examples/cmake/sample_plugin/src/CMakeLists.txt
+index 379440f..fe97a0f 100644
+--- a/examples/cmake/sample_plugin/src/CMakeLists.txt
++++ b/examples/cmake/sample_plugin/src/CMakeLists.txt
+@@ -9,5 +9,4 @@ set(${PROJECT_NAME}_HEADERS
+ )
+ 
+ add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_HEADERS} ${${PROJECT_NAME}_SOURCE})
+-qt5_use_modules(${PROJECT_NAME} Core Network)
+-target_link_libraries(${PROJECT_NAME} ${TUFAO_LIBRARIES} ${Test})
++target_link_libraries(${PROJECT_NAME} ${TUFAO_LIBRARIES} ${Test} Qt5::Core Qt5::Network)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 3b10a35..91e619e 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -36,7 +36,7 @@ endif()
+ 
+ add_library("${TUFAO_LIBRARY}" SHARED ${tufao_SRC})
+ 
+-qt5_use_modules("${TUFAO_LIBRARY}" Core Network)
++target_link_libraries("${TUFAO_LIBRARY}" Qt5::Core Qt5::Network)
+ 
+ set_target_properties(
+     "${TUFAO_LIBRARY}"
+diff --git a/src/tests/CMakeLists.txt b/src/tests/CMakeLists.txt
+index cc2fef7..2ec9fa9 100644
+--- a/src/tests/CMakeLists.txt
++++ b/src/tests/CMakeLists.txt
+@@ -20,7 +20,6 @@ set(tests
+ )
+ 
+ macro(setup_test_target target)
+-    qt5_use_modules("${target}" Core Network Test)
+     set_target_properties(
+         "${target}"
+         PROPERTIES
+@@ -43,7 +42,7 @@ macro(setup_test_target target)
+ endif()
+ 
+ 
+-    target_link_libraries("${target}" "${TUFAO_LIBRARY}")
++target_link_libraries("${target}" "${TUFAO_LIBRARY}" Qt5::Core Qt5::Network Qt5::Test)
+ 
+     add_test(NAME "${target}"
+         WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/src"
+-- 
+2.17.0
+
diff --git a/recipes-qt/tufao/tufao_1.3.10.bb b/recipes-qt/tufao/tufao_1.3.10.bb
index d4b62e2..719269f 100644
--- a/recipes-qt/tufao/tufao_1.3.10.bb
+++ b/recipes-qt/tufao/tufao_1.3.10.bb
@@ -5,7 +5,9 @@ DEPENDS = "qtbase"
 
 SRCREV = "ad505c32d0ba14c3c616de8ba4c7eb79396c20a6"
 SRC_URI = "git://github.com/vinipsmaker/tufao.git;protocol=http;branch=1.x \
-           file://build-Fix-mkspecs-and-CMake-module-install-directori.patch"
+    file://build-Fix-mkspecs-and-CMake-module-install-directori.patch \
+    file://0001-CMakeLists.txt-fix-build-with-Qt-5.11-don-t-use-qt5_.patch \
+"
 
 # This includes bugfixes from 1.x branch
 PV_append = "+${SRCPV}"
-- 
2.17.0


