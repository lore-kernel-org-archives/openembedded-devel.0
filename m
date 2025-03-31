Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02491C369AF
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:11 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.47544.1743412320889794997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DELK9iM8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412320; x=1774948320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EAGLft5azSmZCeHoSA20WZR7iWwhKwgw27NXDly0Fcs=;
  b=DELK9iM81dk9tZw8CRF093yCyzVcqvT8HqrlqzlaaSQreYgPP3CLNUYY
   w02tyQvvghKjZZNiGDEaXZqE1Vc/R0n8kDBKUe8iUS0Xs+yeF4Zfq2h/n
   XuGt9UezJLEulxmBpVAjFkdqp4MKq5xXfxlq9XXc8GhATmGg1S8Trljnu
   8EKZXMg6MQXDXSQ6A/i9AWWFPkTB+0HCdMvMdER5Ln4xlOohhXEssImG/
   CW1Pz0emfyPcfPglSnHJJbykM/pY7YqYCrqZR4oJxlA6rwRhdDoaKySAS
   NUqRZBFd9g4NBCKagtlxY6KA0ph5K/rSF6tTJaM8dvCxzRVQUgPCRdB2j
   Q==;
X-CSE-ConnectionGUID: dHOQuZStRDeKgjWZofmHMg==
X-CSE-MsgGUID: me68kfDjT3KqM9SF5x5y3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="182942887"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="182942887"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:58 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38F4FE8520
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDE3EF310
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 81B271A009B;
	Mon, 31 Mar 2025 17:11:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] protobuf: upgrade 5.29.4 -> 6.30.1
Date: Mon, 31 Mar 2025 17:11:23 +0800
Message-Id: <1743412308-21887-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116400

From: Wang Mingyu <wangmy@fujitsu.com>

0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
refreshed for 6.30.1

0001-utf8_range-add-version-marker-to-library-19009.patch
removed since it's included in 6.30.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  8 ++--
 ...-add-version-marker-to-library-19009.patch | 43 -------------------
 ...{protobuf_5.29.4.bb => protobuf_6.30.1.bb} |  5 +--
 3 files changed, 6 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_6.30.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 7a8906a9a4..77155af4ee 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -31,7 +31,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index f7ee9b116..8cd1359e2 100644
+index 5290fdb..8cd1359 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -4,6 +4,8 @@
@@ -47,16 +47,16 @@ index f7ee9b116..8cd1359e2 100644
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
+-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
 -- 
-2.25.1
+2.43.0
 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
deleted file mode 100644
index e58fdc1d19..0000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From fd020ef700dbf2d324aecd087b8fcb6ff329feb6 Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@inai.de>
-Date: Thu, 21 Nov 2024 11:30:17 -0800
-Subject: [PATCH] utf8_range: add version marker to library (#19009)
-
-Unversioned libraries / libraries without due ABI indicators are not allowed in certain Linux distributions because it precludes the concurrent presence of multiple versions.
-
-If you have both /usr/lib/libprotobuf-lite.so.28.3.0 and /usr/lib/libprotobuf-lite.so.29.0.0, both of them want libutf8_validity.so, but if the ABI is different between utf8_range 28 and utf8_range 29, that's a problem.
-
-Closes #19009
-
-COPYBARA_INTEGRATE_REVIEW=https://github.com/protocolbuffers/protobuf/pull/19009 from jengelh:master 1a5f8682be2f2b84da07fcdd32474baae8088959
-PiperOrigin-RevId: 698855702
-
-Upstream-Status: Backport [https://github.com/protocolbuffers/protobuf/commit/ced605d0e6a7ad20985375b596b2ca6720e07737]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- third_party/utf8_range/CMakeLists.txt | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/third_party/utf8_range/CMakeLists.txt b/third_party/utf8_range/CMakeLists.txt
-index 4276b97290..e054893c63 100644
---- a/third_party/utf8_range/CMakeLists.txt
-+++ b/third_party/utf8_range/CMakeLists.txt
-@@ -19,6 +19,15 @@ add_library (utf8_range
- # A heavier-weight C++ wrapper that supports Abseil.
- add_library (utf8_validity utf8_validity.cc utf8_range.c)
- 
-+set_target_properties(utf8_range PROPERTIES
-+  VERSION ${protobuf_VERSION}
-+  OUTPUT_NAME ${LIB_PREFIX}utf8_range
-+)
-+set_target_properties(utf8_validity PROPERTIES
-+  VERSION ${protobuf_VERSION}
-+  OUTPUT_NAME ${LIB_PREFIX}utf8_validity
-+)
-+
- # Load Abseil dependency.
- if (NOT TARGET absl::strings)
-   if (NOT ABSL_ROOT_DIR)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
index 30b805e6b1..c3e701b5d3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.30.1.bb
@@ -14,13 +14,12 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
+SRCREV = "0d815c5b74281f081c1ee4b431a4d5bbb1615c97"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=30.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
-           file://0001-utf8_range-add-version-marker-to-library-19009.patch \
            "
 SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 
-- 
2.43.0


