Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19056C3600A
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.4165.1741683327904038513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YCd6DAz8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683327; x=1773219327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Kwg5JBHJdGtiqxv2PUXtzt880tMdOMB/dVPLMzTMSWo=;
  b=YCd6DAz8HEvRCA1g3Mv3eda32nGF/QojC9t+fHvdWekpuee23EWwarZ8
   z8/BUOPeQ9+Wx8FyzjsJ+ETbuDhlJptmSI0DTJn70+UaT/8QlKWbjjibr
   +gvzf4X5vFhVM01HPs++BIGz2y7h/PdAvtONAbFDXCI+R2ExF+AEismfX
   v3MnAuVBmdel7C6TEjCoHnIg9suWIi50RBoa9WNPiM/j6CdoUA3BNLwcn
   n8Gt3DEe6Ol1g5FLFkNX1srDn24R7wgofLDI744yenbWMuIdgzhlPKNQA
   1cdH3jFq251i46qjqW4bZ6Qi6EVEUbcIq4iIksibX4fCqELObHIymD/Ya
   w==;
X-CSE-ConnectionGUID: bMBxNEuDR9mzgUpWWkDRnw==
X-CSE-MsgGUID: tzbN+rv1QX2d/IXGdCJHWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192962860"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192962860"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AED5D4C31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 309B8D52CF
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C56271A009B;
	Tue, 11 Mar 2025 16:55:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/36] iozone3: upgrade 506 -> 507
Date: Tue, 11 Mar 2025 16:54:40 +0800
Message-Id: <1741683310-8681-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115859

From: Wang Mingyu <wangmy@fujitsu.com>

0001-let-system-headers-provide-pread64.patch
removed since it's not available in 507

License-Update:
  file location of Copyright changed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-let-system-headers-provide-pread64.patch | 34 -------------------
 .../{iozone3_506.bb => iozone3_507.bb}        |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_506.bb => iozone3_507.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch b/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
deleted file mode 100644
index a61a56a71d..0000000000
--- a/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 64389a67b93a53b9fb7e9e20e905a5ee4613606b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 Jan 2020 17:10:42 -0800
-Subject: [PATCH] let system headers provide pread64()
-
-The signature does not match with system headers anyway
-
-Fixes
-
-iozone.c:1270:9: error: redeclaration of 'pread64' must have the 'overloadable' attribute                                                                       ssize_t pread64();                                                                      ^                                                                       /mnt/b/yoe/build/tmp/work/core2-64-yoe-linux/iozone3/488-r0/recipe-sysroot/usr/include/bits/unistd.h:83:1: note: previous overload of function is here          pread64 (int __fd, void *const __clang_pass_object_size0 __buf,                 ^
-1 error generated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- iozone.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/iozone.c b/iozone.c
-index 090dd5f..fdea400 100644
---- a/iozone.c
-+++ b/iozone.c
-@@ -1267,7 +1267,6 @@ int pit_gettimeofday();
- #ifdef HAVE_ANSIC_C
- #if defined (HAVE_PREAD) && defined(_LARGEFILE64_SOURCE)
- ssize_t pwrite64(); 
--ssize_t pread64(); 
- #endif
- #if !defined(linux)
- char *getenv();
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
index 6ab1121efb..8e229499b1 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
@@ -3,14 +3,13 @@ HOMEPAGE = "http://www.iozone.org/"
 SECTION = "console/tests"
 LICENSE = "iozone3"
 LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
-    file://iozone.c;beginline=276;endline=282;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
+    file://iozone.c;beginline=317;endline=323;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
 "
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
-    file://0001-let-system-headers-provide-pread64.patch \
     file://copyright.txt \
 "
-SRC_URI[sha256sum] = "114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7"
+SRC_URI[sha256sum] = "1e8087ada056f5d8018ee0bc76686d416fc2251ed03038055dbd0af78d1e5ce3"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.43.0


