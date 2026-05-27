Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCCCCD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:54 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16814.1779875386495525726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=awMEHNXv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875386; x=1811411386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dN5pEnjKjFaGcPiu31UP/6UyHnOnHo51R6zbAENQZFA=;
  b=awMEHNXvrEkNbcr1QX+KxUvLQp4MYWHSX2Nhl9n1Gs45HFbU6WWW0WYi
   L/MT7Hf6vDwOuzpg7SWT2ZR+bcW4fM9aXmcXdwbc5tCNwB+NREK9v36mf
   xzYsw4emNX222/z5tUoEjHZeyOZysOh8oLDv/5PW3mrg0XtGNUxHk0CKO
   7thSmteClcm8u+LqC3gLV9fY6fmYzMhHXGfO8fZYIB1bY/inY3a0MVb9V
   kWRv1O3F/OeZAm7sldayzNHgGio4jIheFoK1kmD7BUWmqUh6WvHqKynTv
   j9RWOJkgl61iAymria/Wwa3Jsa0lOzJBpJfJ490pD+ZTH1wMe7eaDBADZ
   g==;
X-CSE-ConnectionGUID: Vv8sJ3xOTtuCzU9H0ZURQw==
X-CSE-MsgGUID: 3Zd1XwyNQ/ubv6GODdw9uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="220931956"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="220931956"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E778E42A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:44 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9C3B41C4B515
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B3E3C82A2C9;
	Wed, 27 May 2026 09:49:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 53/56] sdbus-c++: upgrade 2.2.1 -> 2.3.1
Date: Wed, 27 May 2026 17:48:02 +0800
Message-ID: <20260527094805.2039-53-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127261

From: Wang Mingyu <wangmy@fujitsu.com>

0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch
refreshed for 2.3.1

Changelog:
=============
- Add coroutine support for client-side async calls
- Add support for dumping variant to string
- Introduce clang-tidy for static analysis and fix issues
- Add deduction guides for Struct from std::tuple
- Other fixes and improvements
- Fix ABI compat issue by moving new virtual functions to the end of the class

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...x-error-factory-test-for-musl-libc-compatibil.patch | 10 ++++++----
 .../{sdbus-c++_2.2.1.bb => sdbus-c++_2.3.1.bb}         |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_2.2.1.bb => sdbus-c++_2.3.1.bb} (97%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch
index 118d84e290..6f366695ba 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch
@@ -1,4 +1,4 @@
-From da0d6595c48905ec7d99f1a75878fbeb17972d75 Mon Sep 17 00:00:00 2001
+From ee1f61e7b4ac2cd5eb383e92b9e6eb1640675f72 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 26 Nov 2025 23:29:53 -0800
 Subject: [PATCH] test: Fix error factory test for musl libc compatibility
@@ -13,12 +13,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tests/unittests/Types_test.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ tests/unittests/Types_test.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/tests/unittests/Types_test.cpp b/tests/unittests/Types_test.cpp
+index 7405265..7a24f0c 100644
 --- a/tests/unittests/Types_test.cpp
 +++ b/tests/unittests/Types_test.cpp
-@@ -488,7 +488,7 @@ TEST(AnErrorFactory, CanCreateAnErrorFro
+@@ -551,7 +551,7 @@ TEST(AnErrorFactory, CanCreateAnErrorFromErrno)
      EXPECT_TRUE(error.isValid());
  }
  
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
similarity index 97%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
index 43646953f2..b752025dd4 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] = "-DSDBUSCPP_BUILD_TESTS=ON -DSDBUSCPP_INSTALL_TESTS=
 
 DEPENDS += "expat"
 
-SRCREV = "28b78822cfc5fbec4bd9906168493e9985f586ed"
+SRCREV = "ca073434d2c03c2b619f7e23f285cebbf32c7e46"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch \
            file://run-ptest"
-- 
2.43.0


