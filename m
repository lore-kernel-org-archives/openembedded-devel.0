Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EDFC35FF3
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4169.1741683334782495662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q0U9+M5l;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683336; x=1773219336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=17fnoEIOKOLHD0SFjsjF7zacibLs0YPgoAUDTJNlzbU=;
  b=q0U9+M5lXkgZ3WkB9OBUNUVQrmrUpe23BNYiPglFNx0cEgkRrLeLkI2u
   nAq5v9c04kmGHtJVgWjdk+JCxTzPp0tIJGTNSCUhT62ARQGi2kTLp5xxJ
   wV8SQzNvcH6rZ8pmAutsGroKUYj10ClTveWhOECtOlvIU6fQ3qVDQblvL
   m3t/sZQNRN19JiwcLonhcCXYel12Rj2iIMbTO8bcM2/hmhbucgBUdjCel
   je4cKTd3VLunbi2ROEhx+yNEgRl9BxXpfcX/YbQWtvvVpXjWpV0QVd5pZ
   b1ZdwX8G4JoxH+wDvJO5EteO4GUC6debJ9U1WuOWIF901N8+2K0Sn3qWg
   A==;
X-CSE-ConnectionGUID: h6f+EsDeS8yUFlzy3eAg3Q==
X-CSE-MsgGUID: ZkjNoZrmSIq7YoQ+l33tCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="195361228"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="195361228"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70CD3C2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 287CCD729C
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:32 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB4061A00A0;
	Tue, 11 Mar 2025 16:55:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/36] python3-scikit-build-core: upgrade 0.10.7 -> 0.11.0
Date: Tue, 11 Mar 2025 16:55:03 +0800
Message-Id: <1741683310-8681-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115879

From: Wang Mingyu <wangmy@fujitsu.com>

0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
refreshed for 0.11.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch       | 9 +++------
 ...ore_0.10.7.bb => python3-scikit-build-core_0.11.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.10.7.bb => python3-scikit-build-core_0.11.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
index 13cb7b1e7f..36eff85334 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
@@ -1,4 +1,4 @@
-From 5bc2d175c6a31a3de04444e5e22af310799ab10d Mon Sep 17 00:00:00 2001
+From 3f5d2be717d200406126537eb2f3ed4de92bd2c1 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 27 Jan 2025 19:17:48 +0200
 Subject: [PATCH] builder.py: Check PYTHON_INCLUDE_DIR
@@ -15,10 +15,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/scikit_build_core/builder/builder.py b/src/scikit_build_core/builder/builder.py
-index b19173f..f4fb2af 100644
+index 532d328..0c99ef3 100644
 --- a/src/scikit_build_core/builder/builder.py
 +++ b/src/scikit_build_core/builder/builder.py
-@@ -203,7 +203,7 @@ class Builder:
+@@ -228,7 +228,7 @@ class Builder:
          python_sabi_library = (
              get_python_library(self.config.env, abi3=True) if limited_api else None
          )
@@ -27,6 +27,3 @@ index b19173f..f4fb2af 100644
          numpy_include_dir = get_numpy_include_dir()
  
          # Classic Find Python
--- 
-2.39.5
-
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.0.bb
index 4df47c3c5d..2d01f0bf03 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.0.bb
@@ -10,6 +10,6 @@ DEPENDS = "python3-hatch-vcs-native"
 inherit pypi python_hatchling
 
 SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
-SRC_URI[sha256sum] = "04cbb59fe795202a7eeede1849112ee9dcbf3469feebd9b8b36aa541336ac4f8"
+SRC_URI[sha256sum] = "423d8b0885bf1942816c851f8ec7c1efc0a7ecad4f38ff43d5ba869a894b107b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


