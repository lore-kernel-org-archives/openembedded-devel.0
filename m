Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F79DC3601C
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.61530.1742893339566841355
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YRV6VQWU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893342; x=1774429342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9u0jidIqeQhWP2WwV/ldoSvZ5pZQbryeoYzhPSsj6/8=;
  b=YRV6VQWUoN8d0IJq6ZDEHl/TOXxQXUmpYUPAeK2wpkvodcHTsIUrWzGi
   SIqNMOcz73tRCG8ljDxvsGdzs/qNWJUPZh2CTBPQ8qIQRlw8hPQe6i8Eb
   Hb1eZas88FpbW8RS6uajSKxiX30+3kJcem0Hu+7FBIpiw6JIZl0135OZb
   tmqT1KXQMVC4w16vvo+dwF1daZleeu1Pdfval+5k26l2hgDRcb2e111I4
   22X/QaGxRWWXbYFw/oNjvlKbqoS9hmCnb8iPj1EYxXEuctbgL5TrMz+ad
   L9rt2Z79rU8arGIGWn94kNKmumXiPBuD5xxYsC4oYAPIdmH0Z+/TAZzOz
   A==;
X-CSE-ConnectionGUID: 9fzTW2qiTdeMGRy5N9vd/w==
X-CSE-MsgGUID: zpSNTxYdT4+rvT+6PyvDzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="181539274"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="181539274"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FFC7D481D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0516FBDCAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD62B1A009B;
	Tue, 25 Mar 2025 17:02:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/45] python3-pymongo: upgrade 4.11.2 -> 4.11.3
Date: Tue, 25 Mar 2025 17:01:43 +0800
Message-Id: <1742893312-3809-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116257

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- WaitQueueTimeoutError should not clear the pool
- Migrate off of Ubuntu 20.04 GitHub Actions Runners
- Fix test_03_invalid_keyid

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.11.2.bb => python3-pymongo_4.11.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.11.2.bb => python3-pymongo_4.11.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.11.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.11.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
index a31deba759..e36f009869 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d0ee3e0275f67bddcd83b2263818b7c4ae7af1ecafebe7eb7fd16389457ec210"
+SRC_URI[sha256sum] = "b6f24aec7c0cfcf0ea9f89e92b7d40ba18a1e18c134815758f111ecb0122e61c"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


