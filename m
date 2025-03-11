Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC05DC36001
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4207.1741683333101797981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pPu6gA4a;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683333; x=1773219333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wAUSijpUzlA/WqG+Q4EyxUoyPHTA32Cm2pWakk960mQ=;
  b=pPu6gA4ar+jOYWa3px5an/t5Wqg8yhPyI+3AKGu1YwOPekCEy8rhjNLy
   dImMCPdQ6T3ZfYgfkHrOnR7WM3I947aYlqmhege35jye2M0LQV2Wb7HAt
   CNncQYPcYc3hUFKOErj/gk+K46KnkYx4wL1mHO9OuRE9bajNOOodpekrd
   caJ3nKqKMIw7IKJyrQlMr4sbrulErVvEOyhoz02AsDruSdMh2lJPquVsa
   qZUKB30Op7pEhdSc/j58MrN8rcD6J3hz3tkFKIGBhAd7HPE4h0+qhf4gE
   tlCbpJ+XZYDndWBPeIsFbE6mNUsVUGDgjBdWuf+VB1M3rnp/DP2i6P4Ix
   A==;
X-CSE-ConnectionGUID: 1cOVMbZXRVCCP9XAo1AoOw==
X-CSE-MsgGUID: kCOOO551RKKe7fpEk2VYlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171602370"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171602370"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21373C2266
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DAB8CBDC81
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A061C1A0071;
	Tue, 11 Mar 2025 16:55:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/36] python3-fsspec: upgrade 2025.2.0 -> 2025.3.0
Date: Tue, 11 Mar 2025 16:54:53 +0800
Message-Id: <1741683310-8681-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115870

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- add pipe_file to HTTP
- add sync http for pyodide
- ls performance for local and detail=False
- dir/info consistency in dirfs
- referenceFS async consistency
- CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2025.2.0.bb => python3-fsspec_2025.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2025.2.0.bb => python3-fsspec_2025.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2025.2.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2025.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2025.2.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2025.3.0.bb
index 31e5243d25..7c713d5caa 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2025.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2025.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "1c24b16eaa0a1798afa0337aa0db9b256718ab2a89c425371f5628d22c3b6afd"
+SRC_URI[sha256sum] = "a935fd1ea872591f2b5148907d103488fc523295e6c64b835cfad8c3eca44972"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


