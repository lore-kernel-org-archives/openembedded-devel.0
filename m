Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E61D6407F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 06:56:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8716.1765954590875072163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 22:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l6ce5q7q;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765954590; x=1797490590;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eNNGGwqusrPoQ2O5O2AhyzhkwjLlkf15glxH+ZL0etE=;
  b=l6ce5q7q0kbLjUyvxL2iC7/cw61t6boECe9rrW/BKANGxUMkAoQf5Oo3
   clfkWM4+HC+Y1CYNQPYdTD4H7Ch7+HAxOnGW8bfGDrvUsO+qs97Vn5t2a
   MBWx1ld0N4sfRCJNsm9YgnzXepcYSspJ3cDuWpkjVkHGOi8ETFb33mHmq
   qrz3NT0l6qWmkpIpG5Op/tG9yysRnFj1DM8AZcjAmHmtYI03tSbWgXlhh
   BQmyBfrlO0aXFGBxLKvYm9/8KpWRywe+YVRXLgLTHfYlBwUXIS21BEv+4
   SMHOjMn/ZDT+qGMjIqggNtd4Jud3zFKQgwnRSTWkwodkapQz+6Xvkj7xp
   A==;
X-CSE-ConnectionGUID: SZH28ZdIT5muD4hRFoq6Pg==
X-CSE-MsgGUID: Gc1XVlXFTRyps3HPU5QVnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="222914274"
X-IronPort-AV: E=Sophos;i="6.21,155,1763391600"; 
   d="scan'208";a="222914274"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:56:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 23E171C0009A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:29 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C35D11C00CD2
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:28 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 96E07829550
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:26 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 3/5] double-conversion: upgrade 3.3.1 -> 3.4.0
Date: Wed, 17 Dec 2025 14:56:00 +0800
Message-ID: <20251217065601.33454-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122715

Drop 0001-allow-build-with-cmake-4.patch as it was merged upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...on_3.3.1.bb => double-conversion_3.4.0.bb} |  3 +-
 .../files/0001-allow-build-with-cmake-4.patch | 40 -------------------
 2 files changed, 1 insertion(+), 42 deletions(-)
 rename meta-oe/recipes-support/dc/{double-conversion_3.3.1.bb => double-conversion_3.4.0.bb} (92%)
 delete mode 100644 meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb b/meta-oe/recipes-support/dc/double-conversion_3.4.0.bb
similarity index 92%
rename from meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
rename to meta-oe/recipes-support/dc/double-conversion_3.4.0.bb
index 42777971d8..2e64da1b71 100644
--- a/meta-oe/recipes-support/dc/double-conversion_3.3.1.bb
+++ b/meta-oe/recipes-support/dc/double-conversion_3.4.0.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ea35644f0ec0d9767897115667e901f"
 SRC_URI = " \
         git://github.com/google/double-conversion.git;protocol=https;branch=master \
         file://run-ptest \
-        file://0001-allow-build-with-cmake-4.patch \
 "
-SRCREV = "ae0dbfeb9744efd216c95b30555049d75d47116a"
+SRCREV = "9dd6227ee3e29807183e56877f0282aeb40b8b1e"
 
 inherit cmake ptest
 
diff --git a/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index db8296c65d..0000000000
--- a/meta-oe/recipes-support/dc/files/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1652f5b555b4b4a7916af40bebacc32c23e4aca5 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Tue, 8 Jul 2025 20:43:45 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/google/double-conversion/commit/101e1ba89dc41ceb75090831da97c43a76cd2906]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8749ef8..3145772 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- project(double-conversion VERSION 3.3.0)
- 
- option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of static ones (.lib/.a)" OFF)
--- 
-2.43.0
-
-- 
2.43.0


