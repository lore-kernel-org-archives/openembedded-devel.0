Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEDDC83F25
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:37 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.10145.1752228086364171799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=qpNyhxpx;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228089; x=1783764089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/j93TC3dn4ySq17ydUA7LHJlBmJmr+5o/nbDmeSw9tY=;
  b=qpNyhxpxcpgPqWCFg2Rkh27vnNWJzpNFPTNb57yD4WKdya0Sbmiik/IZ
   mcfa6Urg+z93UKM5ztIHkggtbIjhH7ZX0alxFU6hqKIOwgLzFJS2qCL/9
   Hh7Z4m1M3dqS49p617y327GIK61Sdsx9s4fV8j1fBjN/MMOieLiISDQnX
   0=;
X-CSE-ConnectionGUID: 60qjpYQOSTODvxEjuKEWsg==
X-CSE-MsgGUID: 8J6jOm44R02M2sQi2Bk6nQ==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 11 Jul 2025 12:01:24 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:24 +0200
X-CSE-ConnectionGUID: ZqInWkBCSSeNftx8wbb9OA==
X-CSE-MsgGUID: 8kyaQ16xQFyJqpSG7UhzAw==
X-CSE-ConnectionGUID: U3iicCzlTdy0bvvh5KK+3g==
X-CSE-MsgGUID: Hjc+/FGRQs+a7P/83pUE3A==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 04/10] redis-plus-plus: upgrade 1.3.11 -> 1.3.14
Date: Fri, 11 Jul 2025 12:00:21 +0200
Message-ID: <20250711100052.255467-5-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711100052.255467-1-Moritz.Haase@bmw.de>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118438

Additionally backport a patch to support to build against CMake 4+ that hasn't
made it into a release yet.

Release notes are available at [0].

[0]: https://github.com/sewenew/redis-plus-plus/releases

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...update-cmake_minimum_required-to-3.5.patch | 34 +++++++++++++++++++
 ...us_1.3.11.bb => redis-plus-plus_1.3.14.bb} |  6 ++--
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.11.bb => redis-plus-plus_1.3.14.bb} (86%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch b/meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..02093573ce
--- /dev/null
+++ b/meta-oe/recipes-extended/redis-plus-plus/files/0001-update-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,34 @@
+From e30d4c4c557568b01d5adce9df2714de8d3921c2 Mon Sep 17 00:00:00 2001
+From: sewenew <sewe.code@gmail.com>
+Date: Tue, 15 Apr 2025 22:57:08 +0800
+Subject: [PATCH] update cmake_minimum_required to 3.5
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [e30d4c4c557568b01d5adce9df2714de8d3921c2]
+---
+ CMakeLists.txt      | 2 +-
+ test/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e0a8cf4..9c742f9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ function(GET_VERSION VERSION_PART VERSION_NUM)
+     set(VERSION_REGEX "^const int VERSION_${VERSION_PART} = (.+);$")
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index 3423956..88aa079 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ project(test_redis++)
+ 
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ set(REDIS_PLUS_PLUS_TEST_SOURCES src/sw/redis++/test_main.cpp)
+ 
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.14.bb
similarity index 86%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.14.bb
index d643c6f0b9..19e68edea8 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.11.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.14.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS += "hiredis"
 
-SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
-           file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
-SRCREV = "ad6baa121f4c6fbc7622d83d606210ac22549c78"
+SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https;tag=${PV} \
+           file://0001-update-cmake_minimum_required-to-3.5.patch"
+SRCREV = "b13fcead60bdc03f9771da25715bb134be89aa2f"
 
 
 inherit cmake

