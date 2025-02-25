Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03821C282C5
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2203.1740525898314938418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KlYEdJ/J;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525903; x=1772061903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1+fPSja3z++zXIDm2OQs1a7Udc/39YoqQ4efUA7dlqY=;
  b=KlYEdJ/J2uSesf9LZqgHzJhw1KbDPxCw2q4QZYpu8FUHbA+FRXAl2S2R
   WPCtFvtHJcUozQz5dh6+yY/B8OTlpjl/zy0OcZSAJHP2ZT/6fjYRHKnG4
   tNAw4SHztXlM9ct9lLgDQ5pib+kYbTrQNkP538SXFvUs5ksFzEkPSQj5I
   5nFBAVI153m/8/V240mMIW/SLmG52NX+dHBlENSYd8Q1NRBJEP+25hQ5o
   XgT+wHCmhsvRvynXmOEBENgQPQhZ1fuqt7G94kedeSvUiVIER3TztVZd6
   LgQdVoNG21lXYCenIy3dbZpOyAUF8usbwVqLMW5FhCADC68DfonM/xkK3
   Q==;
X-CSE-ConnectionGUID: v8KZ599JRXGp1KJJCFHWxQ==
X-CSE-MsgGUID: NqN+/OBTTY6p0bSpKfCrDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179142890"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179142890"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A539D500C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 23148141FB
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA5C51A000B;
	Wed, 26 Feb 2025 07:24:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/51] python3-pymongo: upgrade 4.11 -> 4.11.1
Date: Wed, 26 Feb 2025 07:24:28 +0800
Message-Id: <1740525881-21103-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115635

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 restores wheel support for s390x and ppc64le architectures

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.11.bb => python3-pymongo_4.11.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.11.bb => python3-pymongo_4.11.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.11.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.11.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.11.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.11.1.bb
index 5bd28af4ee..df7f2b0f11 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.11.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "21b9969e155c4b16a160fbe90c390a07ca7514479af6c3811b1d15ead26e10ba"
+SRC_URI[sha256sum] = "3757ce9257c3486eead45680a8895a0ed9ba27efaf1791fc0cf854367c21c638"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


