Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622C6C5B54C
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6741.1747817999049967028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k+6+nc85;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817999; x=1779353999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=v9oQxVnX0OD7a1/G657tuq0ATAzZhtnatSwpOXYgIlE=;
  b=k+6+nc85ksoTe9TxG0TyIPRNYG9nG65+IMj9/cUx9VCW1WkdrwgLyfzA
   f/exH+KBOgP/kjaH9Y5smq9BRcitielWkYPae+gRgtWcK+7Q0kpuqc5u1
   UuV4205x7MvpV7Qa2PE9t0gxXfmehMcVcVJbhRzwSgTOb0zZojZikm/TW
   4D6OZTA8h97o4nxe3TrGf5cWnkR6rA40XvUDNRUv0L/OEJRhJyieSepFy
   hk6uWGfdTZI8kod/t3G4DfKkJ34+GhBID2WwVU1XjXQ859xhSteZJO397
   ZkaoZZMQULudJknxVdj+mrqIKPlLcRTV6w5SfJJJPhQG1+h5BzUpZj9dH
   g==;
X-CSE-ConnectionGUID: qFqpDNk+QpiMzlCMK3Z2Nw==
X-CSE-MsgGUID: sTMmJLC/SqeUxV7OqpLN9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179669864"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179669864"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CC52FE8FE0
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 897BAD8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 496361A009A;
	Wed, 21 May 2025 16:59:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/43] python3-hexbytes: upgrade 1.3.0 -> 1.3.1
Date: Wed, 21 May 2025 16:59:04 +0800
Message-Id: <1747817972-28874-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117542

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hexbytes_1.3.0.bb => python3-hexbytes_1.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_1.3.0.bb => python3-hexbytes_1.3.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_1.3.0.bb b/meta-python/recipes-devtools/python/python3-hexbytes_1.3.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-hexbytes_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_1.3.1.bb
index f3cb7d7b8a..79eb54255e 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_1.3.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a26e64020156e806cf0054a6d504b301"
 
-SRC_URI[sha256sum] = "4a61840c24b0909a6534350e2d28ee50159ca1c9e89ce275fd31c110312cf684"
+SRC_URI[sha256sum] = "a657eebebdfe27254336f98d8af6e2236f3f83aed164b87466b6cf6c5f5a4765"
 
 inherit pypi setuptools3
 
-- 
2.43.0


