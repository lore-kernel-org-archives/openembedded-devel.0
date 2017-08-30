Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 591CE78376
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 15:15:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u26so2108765wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IXKz8nfjDaAX9cSSlB2f6WC8j7Wenes9TVf8LPMf2QQ=;
	b=LQ3LuOnMEFoqDjfbVqGf/TZ8qLMxX7X1gd5+GWmHQgD4Ar0GSpbcLFF3ZKmDkJvK+v
	znZaMR1q6u1T0/zQP8g0SZIBt3z+jkyP1CyoAROR8lKSjihLqw0bkS9YfOSJ9p7/yG3z
	RUKJagXauScT7ayjqmcdMpE52wxWXpWfT+knaA5WIiNmzc8Rm2J5u7lm/ZJBry1Osf04
	Q2az9+C8sPfEq0TUAj8Cce0F1W8mpoV934Nv0vOUFJc1+hgKAeWwUK0ex9wYUiHkgkor
	zFZkXYxLhUyulOKrW8yhJYyBX/CauDua6XS3/KiAhXTiqbaAwcK7Bp1R3eqgy/3vnMno
	DqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IXKz8nfjDaAX9cSSlB2f6WC8j7Wenes9TVf8LPMf2QQ=;
	b=epjtVVHJpH2taxyAisNKQQjKDkECjZ60oRo8fDNqOMFiJBCspaQ90LNYOZv5vVF9Pk
	DUMpKfAwx+eaYqvH1+nXYekz7q+oWyb8EofRlNLNiv6TKQ9mP9/mkEBtDofk8pFEsjt+
	YQB98bThLAk5TdUyN33/f2bqqH1Z3i6JaKUH6p6ZroGoaoHM0jfeelfG2EO5O7Hpm8xR
	oQAkqJHsm4hIWhn+H2ZesaKSt9o+UQwZ/6slBtKKmIST0qvRqxgYKjzRvr0fDEosJSWz
	qGiLvcOp4a2jy1r3fyb9FPo1HNLhrI/OvCwUfBYzC2jHAuWSPFaALUDTyj82W4XGokM9
	gcLg==
X-Gm-Message-State: AHYfb5iVRibiGxf0cfu/rtJZ2sRrDgZK2IIhelDpkrv4/BW4JikjILIF
	6vjGVdCJPNceU31NCSA=
X-Received: by 10.80.144.103 with SMTP id z36mr2025579edz.23.1504106153063;
	Wed, 30 Aug 2017 08:15:53 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.200.238]) by smtp.gmail.com with ESMTPSA id
	c16sm2846282ede.24.2017.08.30.08.15.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Aug 2017 08:15:51 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Aug 2017 17:15:28 +0200
Message-Id: <1504106128-26607-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] json-spirit: link to libatomic
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
X-List-Received-Date: Wed, 30 Aug 2017 15:15:52 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

In commit ac2a6d2b5d69937577effcb8bb2149651bac0176:
[ json-spirit: Add -latomic to LDFLAGS ]

I added '-latomic' to LDFLAGS, which worked for clang 3.9 but it does
not work for clang 5.0, seems the linking order matters for clang 5.0,
it should be after -ljson_spirit.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../json-spirit/0001-Link-to-libatomic.patch       | 64 ++++++++++++++++++++++
 .../json-spirit/json-spirit_4.08.bb                |  3 +-
 2 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Link-to-libatomic.patch

diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Link-to-libatomic.patch b/meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Link-to-libatomic.patch
new file mode 100644
index 0000000..4c8c7b9
--- /dev/null
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit/0001-Link-to-libatomic.patch
@@ -0,0 +1,64 @@
+From bbac9ac3e391253bc1f90cf0f70a2ce1aac9511f Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Wed, 30 Aug 2017 16:50:56 +0200
+Subject: [PATCH] Link to libatomic
+
+This is needed for clang compiler.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ json_demo/CMakeLists.txt              | 2 +-
+ json_headers_only_demo/CMakeLists.txt | 2 +-
+ json_map_demo/CMakeLists.txt          | 2 +-
+ json_test/CMakeLists.txt              | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/json_demo/CMakeLists.txt b/json_demo/CMakeLists.txt
+index b1d3c6a..0dfd308 100644
+--- a/json_demo/CMakeLists.txt
++++ b/json_demo/CMakeLists.txt
+@@ -5,5 +5,5 @@ FIND_PACKAGE(Boost 1.34 REQUIRED)
+ INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
+ 
+ ADD_EXECUTABLE(json_demo ${JSON_DEMO_SRCS})
+-TARGET_LINK_LIBRARIES(json_demo json_spirit)
++TARGET_LINK_LIBRARIES(json_demo json_spirit -latomic)
+ 
+diff --git a/json_headers_only_demo/CMakeLists.txt b/json_headers_only_demo/CMakeLists.txt
+index a3c787a..6eae11e 100644
+--- a/json_headers_only_demo/CMakeLists.txt
++++ b/json_headers_only_demo/CMakeLists.txt
+@@ -5,5 +5,5 @@ FIND_PACKAGE(Boost 1.34 REQUIRED)
+ INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
+ 
+ ADD_EXECUTABLE(json_headers_only_demo ${JSON_HEADERS_ONLY_DEMO_SRCS})
+-TARGET_LINK_LIBRARIES(json_headers_only_demo json_spirit)
++TARGET_LINK_LIBRARIES(json_headers_only_demo json_spirit -latomic)
+ 
+diff --git a/json_map_demo/CMakeLists.txt b/json_map_demo/CMakeLists.txt
+index 599006a..e3e45e8 100644
+--- a/json_map_demo/CMakeLists.txt
++++ b/json_map_demo/CMakeLists.txt
+@@ -5,5 +5,5 @@ FIND_PACKAGE(Boost 1.34 REQUIRED)
+ INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
+ 
+ ADD_EXECUTABLE(json_map_demo ${JSON_MAP_DEMO_SRCS})
+-TARGET_LINK_LIBRARIES(json_map_demo json_spirit)
++TARGET_LINK_LIBRARIES(json_map_demo json_spirit -latomic)
+ 
+diff --git a/json_test/CMakeLists.txt b/json_test/CMakeLists.txt
+index 38ffa7f..1ec1365 100644
+--- a/json_test/CMakeLists.txt
++++ b/json_test/CMakeLists.txt
+@@ -11,5 +11,5 @@ FIND_PACKAGE(Boost 1.34 REQUIRED)
+ INCLUDE_DIRECTORIES(${Boost_INCLUDE_DIR})
+ 
+ ADD_EXECUTABLE(json_test ${JSON_TEST_SRCS})
+-TARGET_LINK_LIBRARIES(json_test json_spirit)
++TARGET_LINK_LIBRARIES(json_test json_spirit -latomic)
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
index 2f456bf..c7c1ad1 100644
--- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
+++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
@@ -11,14 +11,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=278ef6183dec4aae1524fccc4b0113c9"
 
 SRC_URI = "file://json_spirit_v${PV}.zip \
            file://0001-Adjust-the-cmake-files.patch \
+           file://0001-Link-to-libatomic.patch \
 "
 
 S = "${WORKDIR}/json_spirit_v${PV}"
 
 DEPENDS = "boost"
 
-LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
-
 inherit cmake
 
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
-- 
2.7.4


