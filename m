Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2158EC83F27
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:37 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.10145.1752228086364171799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=PUqw+N1q;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228090; x=1783764090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jlxn0B/QtiUI194xhTbOjSiLvN3fFiXFlEv6D24kvIs=;
  b=PUqw+N1qxBnEeYKraCsPLDJTsXSMbFmKJHH/VOfKnMr7SIeYMswf0sa6
   eMzM9pUbKqBU33UGvAN5Q9sVtFOVJ18PKjHY7BDfxP3Zw2m/NfEr43GHt
   /xlX6WRAYO5VPsbabMNgXEgNZ9+hCCRaWPzWUOpD63woNmUhycmrq/XJ+
   A=;
X-CSE-ConnectionGUID: 60qjpYQOSTODvxEjuKEWsg==
X-CSE-MsgGUID: XqT592N9TOuXJraHqki24w==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 11 Jul 2025 12:01:24 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:23 +0200
X-CSE-ConnectionGUID: nhKLzqvESu2HzAeK1YJnaQ==
X-CSE-MsgGUID: TyJ4N4XHQmOYa/PiUjufHw==
X-CSE-ConnectionGUID: vP8ePueLQ4Gj2MYp0WYa0w==
X-CSE-MsgGUID: SpeyS8WJR3uNnFIlsZLFVA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 03/10] cpputest: Backport patches to support builds with CMake 4+
Date: Fri, 11 Jul 2025 12:00:20 +0200
Message-ID: <20250711100052.255467-4-Moritz.Haase@bmw.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118439

There hasn't been a new upstream release yet that ships the required changes.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...um_required-before-project-in-CMakeL.patch | 36 ++++++++++++++++
 .../0002-Squelch-deprecation-warning.patch    | 43 +++++++++++++++++++
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb |  5 ++-
 3 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch
 create mode 100644 meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch

diff --git a/meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch b/meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch
new file mode 100644
index 0000000000..a987939ea6
--- /dev/null
+++ b/meta-oe/recipes-test/cpputest/cpputest/0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch
@@ -0,0 +1,36 @@
+From 5351875cde23340c0a98fe46566cde5535c40e21 Mon Sep 17 00:00:00 2001
+From: georgev93 <georgeavogt93@gmail.com>
+Date: Fri, 26 Jun 2020 19:07:14 -0400
+Subject: [PATCH 1/2] Call cmake_minimum_required() before project() in
+ CMakeLists.txt.
+
+From https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html:
+Note: Call the cmake_minimum_required() command at the beginning of the top-level CMakeLists.txt file even before calling the project() command. It is important to establish version and policy settings before invoking other commands whose behavior they may affect. See also policy CMP0000.
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [e0c050d8b614294b2215a62e64628470fab67f20]
+---
+ CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 88e0cfb5..d36c6491 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,12 +1,12 @@
++# 2.6.3 is needed for ctest support
++# 3.1 is needed for target_sources
++cmake_minimum_required(VERSION 3.1)
++
+ project(CppUTest)
+ 
+ set(CppUTest_version_major 4)
+ set(CppUTest_version_minor 0)
+ 
+-# 2.6.3 is needed for ctest support
+-# 3.1 is needed for target_sources
+-cmake_minimum_required(VERSION 3.1)
+-
+ ###############
+ # Conan support
+ ###############
diff --git a/meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch b/meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch
new file mode 100644
index 0000000000..6f791e4c0e
--- /dev/null
+++ b/meta-oe/recipes-test/cpputest/cpputest/0002-Squelch-deprecation-warning.patch
@@ -0,0 +1,43 @@
+From 46bdc8ceca42fd19cd2b97d9fa845860e537dee9 Mon Sep 17 00:00:00 2001
+From: Chad Condon <chad@condon.tech>
+Date: Fri, 27 Dec 2024 18:21:21 -0800
+Subject: [PATCH 2/2] Squelch deprecation warning
+
+Most recent CMake started complaining about the pending end of 3.8
+support.
+
+> ```
+> CMake Deprecation Warning at CMakeLists.txt:4 (cmake_minimum_required):
+>   Compatibility with CMake < 3.10 will be removed from a future version of
+>   CMake.
+>
+>   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+>   to tell CMake that the project requires at least <min> but has been updated
+>   to work with policies introduced by <max> or earlier.
+> ```
+
+We can retain support by adding a max version. This will no
+prevent use with newer versions, but indicates forward
+compatibility.[^1]
+
+[^1]: https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [9dda473ded5913d47221e7ae50817dbcd45175ff]
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d36c6491..0cc12cb1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,7 @@
+ # 2.6.3 is needed for ctest support
+ # 3.1 is needed for target_sources
+-cmake_minimum_required(VERSION 3.1)
++# 3.8 is needed for try_compile improvements (CMP0067)
++cmake_minimum_required(VERSION 3.8...3.31)
+ 
+ project(CppUTest)
+ 
diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
index 5710585b6c..2b643d0cd5 100644
--- a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
+++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
@@ -5,7 +5,10 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
 
-SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/cpputest/cpputest.git;protocol=https;branch=master \
+           file://0001-Call-cmake_minimum_required-before-project-in-CMakeL.patch \
+           file://0002-Squelch-deprecation-warning.patch \
+"
 SRCREV = "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
 
 

