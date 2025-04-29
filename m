Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF77C3ABAD
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:16:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7606.1745900154669070348
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kOdYUDJi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900154; x=1777436154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KBucrjA1mdhqrvdOPeVEqlzkl2Ggy04KkB782PkoR2c=;
  b=kOdYUDJiw4X8kT2rCDx4FqXgDOmcZRtH7vpISJycOTao6k3m1cw3iL4c
   muGPyr9CNSN+w7ZhMmqqaD7kheTJkUxv1aT4xiWkR7ossSaLAbUeedrpy
   N/EUEobnHmz0IOpm3fN/QdjReWsBImPC/dTGQ66NoclVXG5KEW2l/DZ1H
   lOd9mEyxE9BJ0AW31g8IfheRo4T9RKZ8QFxKXWMRSOxaFpKnt3ZzXWvC6
   sBlWYjkZXmHjR5tq/Uhd72HA5DzbrrYY4IkjWXldUHmpAiWNpRmaMA05N
   REZcwEUpmqff50is31hTncUMff2Lc97VNJq5Gmv1aiLhQt9CWZdtG2ZqI
   w==;
X-CSE-ConnectionGUID: qrTuo1KRRq+EdKNiLE+tWQ==
X-CSE-MsgGUID: JuAT6PsCRhWKnC36OiXbTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="186390927"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="186390927"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5818D4C3C
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2002BF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 643261A0071;
	Tue, 29 Apr 2025 12:15:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/23] python3-moteus: upgrade 0.3.81 -> 0.3.82
Date: Tue, 29 Apr 2025 12:15:35 +0800
Message-Id: <1745900138-26424-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117225

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.81.bb => python3-moteus_0.3.82.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.81.bb => python3-moteus_0.3.82.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.82.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.82.bb
index bb8f572180..b4e7b64806 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.81.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.82.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6f0f3b5ec38c044cf28546e4693b22644c3e9be7a1338933d20b67d0fd55eccc"
+SRC_URI[sha256sum] = "88f76d6901312ba044240f038a97f54fff463221888ca89e2c2bdc7e1679bd5d"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.43.0


