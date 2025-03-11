Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A5EC35FF9
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4168.1741683334176062147
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fvJjqOz/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683334; x=1773219334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=N6xz/ble8kfxo6s3RBJgXtgA8mrtm9skxBpDdylbm/Q=;
  b=fvJjqOz/NuujqGpZBHfQIdrvmAEESGmLbqhVpOmtsU9xxma1GfnXWMOX
   qw3T5HJWijclgu4pvhGBoQR0AQgMCraH2xUWZHDAih9/Q5uVJBhkIMgq9
   Ivk3LHhDX+67QaGr6YUthGytc/0OZO4jakq60qiQWkJzaFgsbeEmMkeBW
   cpVU7p8qHp4uhEYvVrOpKgBY5LXMQzbsgoVmIu5itp0GNAYAEZd13iEDo
   UrPWAvyyGa6GKYLjxkzcMv3JawKjQ4UXPPWP1sP4+VMo+6lymzLhLjKUs
   7giagkoS862GF/NqrIS4ilKoCXmhOEcH/xhrl9SJ5GIJT7i57AUV9ZNe6
   Q==;
X-CSE-ConnectionGUID: Zn05cL5uQ9O7FljqVpJMYQ==
X-CSE-MsgGUID: YtouiRJ+RiiIruv5kmoIKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="181074424"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="181074424"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25B33D480A
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DBA91BDC81
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7B2F71A00A1;
	Tue, 11 Mar 2025 16:55:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/36] python3-inline-snapshot: upgrade 0.20.2 -> 0.20.5
Date: Tue, 11 Mar 2025 16:54:55 +0800
Message-Id: <1741683310-8681-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115875

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- correct normalization of "python3.9" to "python" in tests
- Prevent a crash if a value cannot be copied and a UsageError is raised.
- Use the black API directly to format python code.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.20.2.bb => python3-inline-snapshot_0.20.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.20.2.bb => python3-inline-snapshot_0.20.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.2.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.2.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.5.bb
index 246f67b0d7..0e4807b856 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "c276a2e018575d50e720e9b79b70f7030d292120f96e6be2e138a87a5a6d096b"
+SRC_URI[sha256sum] = "d8b67c6d533c0a3f566e72608144b54da65dc3da5d0dba4169b2c56b75530fb5"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


