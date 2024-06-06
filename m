Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802AAC27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.9756.1717664830964561522
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sc1SP0rG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664832; x=1749200832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CLIuqcEORfMczFQuGcFloyF5diQnEFz36Kpd35oj7aU=;
  b=Sc1SP0rGQFYy2ANlw5r4VKYIE6styHENYIbDdcS1uwbjmnyn5cTpUwp7
   9viVoyEpKUJBAm8nzt/zfkz+zFSTN2M3+aqbUrZN8B/QhdJ429qpHoWUn
   RaDiNi/7Oxi7XvEJkiuf2f8burzsupK66Eg0Wm/Xqpx6xuVyX3QbROw4O
   LQ+2awaEGMcCMKN01XdVSNGcFBaNFksPNOtY7Hw0ucn1Euwdn2QF49mag
   Eyc2pYpmMmUmDcsGmgRui2wEPq+mLD/sbaAL618eLDiihYwZ7se/8Zh8O
   lIXa19z0Ljkrq7KalDuytuIRDoZi99AfwAc7SdxrrmoPxUp81k6zZ+ZvU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162136687"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162136687"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BFA29D922F
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D749D72A0
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0CD5401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E2351A000A;
	Thu,  6 Jun 2024 17:07:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 35/36] poco: upgrade 1.12.5p2 -> 1.13.3
Date: Thu,  6 Jun 2024 17:06:34 +0800
Message-Id: <1717664795-13902-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--10.993100-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/ySrLqyE6Ur/jCZa9cSpBObmlCu6kKVgvEgyf
	XeYFOVFHFTBB/IBXpeGFClSci0DxS31VIn2QdLBc8KdIN9q4LF+el2cAq/NuwaYafp33PlMqdYJ
	3pC9XNt6XcV/PU+QptxcHv+b01YKmG/kkIQ/06pJKzjuZtPtIBHhKwaDYNA5ity9mj1urE9Kq0i
	/TXguI/YAAzcwNZpHFeb+pbQtKMOcS5iXdhf8hbr+a7Hw+x9qZP8UQejhp29qysPB8dBBorYIPF
	ubbBVyAoTssFGSH7W3mn3xyPJAJoswrDggcQ6d1GYJhRh6ssetXb09ETGBTKRHfiujuTbedS1c5
	HPN1AYdaaTQaF8Q9iNWTXnicoB4YTweK12oEGfsTMSg6oABUs53ZbPRfc5otmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1SPqUqJpSCRtkBqi2ChDY/Yl2zp5cfsW2u0ltzSAmQAomDxdaFUpBNg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110742

From: Wang Mingyu <wangmy@fujitsu.com>

0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch
removed since it's included in 1.13.3

0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
refreshed for 1.13.3

Changelog:
============
- GH #4496 Upgrade bundled libexpat to 2.6.2
- GH #4488 Add Poco::Util::Timer::idle() method to check if timer has any tasks scheduled
- GH #3807 DNS.resolve() should not be sorted in HostEntry::removeDuplicates()
- GH #4515 Upgrade bundled SQLite to 3.45.2
- PR #4517 Optimize Net module for Android
- GH #4505 ODBC Unicode wrappers do not check for null length pointers
- GH #4492 Poco::BasicMemoryStreamBuf is missing seekpos()
- GH #4486 DateTimeFormat RFC1036 Sunday name is short (should be long)
- GH #4468 Poco::URI: don't lowercase host part if it's a Unix domain socket
- GH #4450 Error between Poco::ActiveRecord and Poco::Data::PostgreSQL
- GH #4435 SecureStreamSocket is not thread-safe
- GH #4415 SecureSocketImpl::reset shouldn't close socket
- GH #3857 Thread_POSIX.cpp shouldn't convert thread IDs to long
- GH #3725 secure socket receiveTimeout throwing after configured timeout * 2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nx-Ignore-PKCS12-and-testLaunch-test.patch |  6 ++--
 ...l-cmake-files-with-resolved-ENABLE_J.patch | 32 -------------------
 .../poco/{poco_1.12.5p2.bb => poco_1.13.3.bb} |  5 ++-
 3 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco/0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch
 rename meta-oe/recipes-support/poco/{poco_1.12.5p2.bb => poco_1.13.3.bb} (96%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
index f70e8bcc7..d172c8dbf 100644
--- a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
@@ -1,4 +1,4 @@
-From 879ddb725823c78c9510cfd39786adb16f3726c8 Mon Sep 17 00:00:00 2001
+From 6b1123b313e439d8bfae3570a3e541b3aa26f3ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 16 Sep 2023 19:52:56 -0700
 Subject: [PATCH] cppignore.lnx: Ignore PKCS12 and testLaunch test
@@ -48,10 +48,10 @@ Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/cppignore.lnx b/cppignore.lnx
-index 2c2376526..65df4af08 100644
+index b3288d474..9aad48ca5 100644
 --- a/cppignore.lnx
 +++ b/cppignore.lnx
-@@ -28,3 +28,12 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
+@@ -30,3 +30,12 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
  CppUnit::TestCaller<HTTPSStreamFactoryTest>.testProxy
  CppUnit::TestCaller<DNSTest>.testHostByAddress
  CppUnit::TestCaller<DNSTest>.testHostByName
diff --git a/meta-oe/recipes-support/poco/poco/0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch b/meta-oe/recipes-support/poco/poco/0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch
deleted file mode 100644
index 427cb9723..000000000
--- a/meta-oe/recipes-support/poco/poco/0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e54478c936493c0ed87e875f04127bd13642de44 Mon Sep 17 00:00:00 2001
-From: tyler92 <tyler92@inbox.ru>
-Date: Tue, 21 Nov 2023 05:07:24 +0300
-Subject: [PATCH] fix(build): Install cmake files with resolved ENABLE_JSON and
- ENABLE_XML (#4227)
-
-Upstream-Status: Backport [https://github.com/pocoproject/poco/pull/4227]
-Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
-
----
- Util/cmake/PocoUtilConfig.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Util/cmake/PocoUtilConfig.cmake b/Util/cmake/PocoUtilConfig.cmake
-index 90c1eab1c..8186435e1 100644
---- a/Util/cmake/PocoUtilConfig.cmake
-+++ b/Util/cmake/PocoUtilConfig.cmake
-@@ -1,9 +1,9 @@
- include(CMakeFindDependencyMacro)
- find_dependency(PocoFoundation)
--if(ENABLE_XML)
-+if(@ENABLE_XML@)
- 	find_dependency(PocoXML)
- endif()
--if(ENABLE_JSON)
-+if(@ENABLE_JSON@)
- 	find_dependency(PocoJSON)
- endif()
- include("${CMAKE_CURRENT_LIST_DIR}/PocoUtilTargets.cmake")
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
similarity index 96%
rename from meta-oe/recipes-support/poco/poco_1.12.5p2.bb
rename to meta-oe/recipes-support/poco/poco_1.13.3.bb
index a0bb0b5d9..6ad577b37 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -8,13 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=master-unused;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://run-ptest \
-           file://0002-fix-build-Install-cmake-files-with-resolved-ENABLE_J.patch \
            "
-SRCREV = "1d6fb3e1383e559cacbada5e3f861c0dafaf5d30"
+SRCREV = "d6bd48a94c5f03e3c69cac1b024fdad5120e3a7b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


