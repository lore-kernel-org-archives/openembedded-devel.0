Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2430CC27C44
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:50:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.12719.1716861053517820238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q4djVh8Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861053; x=1748397053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o3df8TMigNUs5VrvRdFO8EK1gtC8MPWcNPHCTlNkmL0=;
  b=Q4djVh8ZUN2vnjM2eQf7NiFU3YT+vg4MFE1JJLF3cZZnOUTyif3jEtnG
   xPUg+rDU1wXAJvk51iJ9cHTwQNDxp9JUD0Mhf6UZx23nLWGpnGLQWR7hL
   4p5xiGKFZ9dcNpIqN8pP+G194fsGkcUCr1ZmdhRBcdmszfF7W8p/TY00F
   KPuHk7uqvoiP7DrAiJMxGAiuff6c++UEfN6Thf/BLd67qav/apyocPEt5
   kY5/w3NZG8UzdVX8LLhxjIa58q/Saq4HrD17j8MtQgKL48v5pn//hcr+A
   m2Vk4k3lv4rxoQJjzs3ZK2jSyusDzvy9soWTKwEW0YOHA3ACfs4lDF1pi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139360307"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139360307"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DD91C68E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A5604D20AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E7422007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D10E11A000A;
	Tue, 28 May 2024 09:50:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/40] python3-web3: upgrade 6.18.0 -> 6.19.0
Date: Tue, 28 May 2024 09:48:16 +0800
Message-Id: <1716860901-863-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--2.397600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrtOtXYgbXjddhR1Y/uhfqyP3F
	20dGzUU9fueRQRHqq3RQfw/ZZiLyte1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtPkBnLT8/aW6LHS69sAzu6Yvpjq8IDzdJdKjkzyNZ+W8YHsxQ6rmxUPfgp
	OJpKBiDi7SefVzKF2kmNtca1TZKNnAsorLOPCFBHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110570

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Properly propagate exceptions from the message listener task to the main loop
  for persistent connection providers.
- Warn of updates to WebSocketProvider in v7
- Condense the migration guides into one page
- Add py312 support by adding it to CI testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.18.0.bb => python3-web3_6.19.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.18.0.bb => python3-web3_6.19.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.18.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.19.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_6.18.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.19.0.bb
index dab37c870..7f06ca500 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.19.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "2e626a4bf151171f5dc8ad7f30c373f0416dc2aca9d8d102a63578a2413efa26"
+SRC_URI[sha256sum] = "d27fbd4ac5aa70d0e0c516bd3e3b802fbe74bc159b407c34052d9301b400f757"
 
 inherit pypi setuptools3
 
-- 
2.34.1


