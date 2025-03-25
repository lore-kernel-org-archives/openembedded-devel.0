Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AE4C36016
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.61528.1742893334031795773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y7Y1i5zd;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893339; x=1774429339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7qlG6XUuhqnxSnp5x3B5QsFTocTrfQo0S/x8//KDqFM=;
  b=Y7Y1i5zdcbCQBLSUOM4R2fJihxZ1qOV0It6AXI+yl7xHvzdZ+aocd5Wm
   iXRu67PTXZlJ/V40S9CjHQy3uYH12TREqpButN5v/7IV8PN5t5F0BrmEC
   Z6zAzeZxt3cilb54ysXJDr7UGRwJTbR5PfVZ72NMS4FmIsnsVjc9/tXiA
   zTGuoTAbqDvItgz7qk1INN1Gb4YybFS2swpbcbKfJC+eGWy00pwpA3Usr
   w6tlUL7yqFfNr1wCHAcBPoFqEJpYhbwVzn+dx7x5EWdyP0JGFKn/F/1ua
   yEMhdUlHsYjrGfKsTF00m8kdACdtWCsFNOytnEdh8NXafxWpVTqpeD4rc
   g==;
X-CSE-ConnectionGUID: 7Dj/YOfIRWiyS3DOHSpVSw==
X-CSE-MsgGUID: RRAMe/rhQY2uJOTXv2U7kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182159860"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182159860"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:17 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B40E7E8535
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D10ED50B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 018AC1A00AE;
	Tue, 25 Mar 2025 17:02:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/45] php: upgrade 8.4.4 -> 8.4.5
Date: Tue, 25 Mar 2025 17:01:26 +0800
Message-Id: <1742893312-3809-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116241

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.4.bb => php_8.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.4.bb => php_8.4.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.4.bb b/meta-oe/recipes-devtools/php/php_8.4.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.4.bb
rename to meta-oe/recipes-devtools/php/php_8.4.5.bb
index c49780a2a4..cf4b756b85 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.5.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${WORKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "192a325fd3ca09b6c528dd6014ee07d803c3162514d4bb0d3e0981d00ac700ec"
+SRC_URI[sha256sum] = "9378c78887d0cd7462fc5c17f2de30c852f20f79d28795e2573fe3250d39436e"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


