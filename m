Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08BDC54799
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.16492.1747731319889207196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=neme4YLX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731321; x=1779267321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=seZqgA4IWqFKPzeGD5w+kYp4JRrZt0URMPmuQMSLyWg=;
  b=neme4YLXgtTDK9O72kZ9vFWupdqaVcYrpzGS/D1ysPlWLCkUhfiHZgK4
   /HPMbdOfwcOEundHtoRXG+Xzb7tUJ/y6SPOulU8kFE9VtxZ2HEUdzM9pg
   AUIdSonLrYaxAza58VbsY5BRS9hNwVerWH/sahHe50epVpfrr3NWLmfBx
   /uDlkCMgPkku/aPCMUEoYmXvfdTJ2V0uNjyUAz5CxI05s7texI88h/E/O
   GEelqPVsE+OftxpyH9nvdjgsH4vWBkZp2T0dAFPblqe/u3NDbHFdp3HKx
   8W7pWvX9i7TBJeDhdIccMHYKB/IyrIZAmaoUG86dh3qHkI9dSfpJkCNya
   g==;
X-CSE-ConnectionGUID: K+lWez45Sr6afw6GvMt1Mw==
X-CSE-MsgGUID: 1JFXhzFPQj2fulWhRWqepw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200017535"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200017535"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:16 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D61ED5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 30A24D3F0C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BAE631A0078;
	Tue, 20 May 2025 16:55:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/27] libyang: upgrade 3.7.8 -> 3.12.2
Date: Tue, 20 May 2025 16:54:45 +0800
Message-Id: <1747731299-20448-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117500

From: Wang Mingyu <wangmy@fujitsu.com>

0001-test_context-skip-test-case-test_searchdirs.patch
refreshed for 3.12.2

Changelog:
==========
- optional xxhash faster hasing function
- support for metadata in diff
- lots of optimizations and fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...001-test_context-skip-test-case-test_searchdirs.patch | 9 +++------
 .../libyang/{libyang_3.7.8.bb => libyang_3.12.2.bb}      | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/libyang/{libyang_3.7.8.bb => libyang_3.12.2.bb} (95%)

diff --git a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
index 3c6aee9247..70890e2485 100644
--- a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
+++ b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-case-test_searchdirs.patch
@@ -1,4 +1,4 @@
-From 5de24e1b39c09adb0c5bf4bb4228bd1bb935542a Mon Sep 17 00:00:00 2001
+From 24ec37bfe5c4c248dda0e80d6e7ab27afca1d60e Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 22 Mar 2023 16:03:56 +0800
 Subject: [PATCH] test_context: skip test case test_searchdirs
@@ -13,10 +13,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test_context.c
-index cfba1d30f..8c3bb7ad6 100644
+index 116b2ce36..4e96f4e96 100644
 --- a/tests/utests/basic/test_context.c
 +++ b/tests/utests/basic/test_context.c
-@@ -1061,7 +1061,6 @@ int
+@@ -1110,7 +1110,6 @@ int
  main(void)
  {
      const struct CMUnitTest tests[] = {
@@ -24,6 +24,3 @@ index cfba1d30f..8c3bb7ad6 100644
          UTEST(test_options),
          UTEST(test_models),
          UTEST(test_imports),
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
similarity index 95%
rename from meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
rename to meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
index 3bea9bc2b8..ea51f6cb14 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
@@ -6,9 +6,9 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
 
-SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
+SRCREV = "da7272e19d9e27d1bfdd68108fa9dce25fbdf5e8"
 
-SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
            file://run-ptest \
            "
-- 
2.43.0


