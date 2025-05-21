Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F83C5B541
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6738.1747817995896623808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jpgj7yd3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818000; x=1779354000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t1DmNrKg5KNUKoHjj8oSEif8pPZuW4JG4PO5OaGGs6s=;
  b=Jpgj7yd3ENZUnDkp76GshM6BANYWFgXNlUr2EtR8FZxT9P3LyFeB7AM6
   toGgVpHBpdu2/GMTL7Gr33jNhY5+FKx47aEtnjcgvPQxDH7e2WBVcURXx
   cz8PXFwQ3VelLZAhzi65josikcdMUvNQkqrYK++J2Dnah4+IkQbR95Tbp
   ZpqjbAriKQB5bwWJlVC4BL8S6KJsTbDewq5dMKNI/d408gWNFBaezSvVe
   POtTIfRCbWz4+N/TM9tVNd+EziMpjbsxEAELthfCVb33XZvV8tr/7lG8s
   Y69jFv2XY5wWqwXhIKR9JMIvhBIoVzD4IjKFmWu6hwbauIPEzgUNbwsio
   A==;
X-CSE-ConnectionGUID: 2v/8MqFhTMS1m1s20/IFbg==
X-CSE-MsgGUID: RUrQ6leYRK2skxjAfhusoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152534"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152534"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 389F3E9E80
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EC592D52D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7D4221A00A1;
	Wed, 21 May 2025 16:59:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/43] python3-pybcj: upgrade 1.0.3 -> 1.0.6
Date: Wed, 21 May 2025 16:59:12 +0800
Message-Id: <1747817972-28874-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117549

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pybcj_1.0.3.bb => python3-pybcj_1.0.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybcj_1.0.3.bb => python3-pybcj_1.0.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.3.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybcj_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb
index 2b78e3a7b3..1d3d0ee245 100644
--- a/meta-python/recipes-devtools/python/python3-pybcj_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.6.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "b8873637f0be00ceaa372d0fb81693604b4bbc8decdb2b1ae5f9b84d196788d9"
+SRC_URI[sha256sum] = "70bbe2dc185993351955bfe8f61395038f96f5de92bb3a436acb01505781f8f2"
 
 inherit pypi python_setuptools_build_meta pypi
 
-- 
2.43.0


