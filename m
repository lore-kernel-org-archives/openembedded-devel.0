Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B4BC3065C
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.167246.1719305853919167889
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XaWforVP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305854; x=1750841854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=neVWL3lFyUjLH05GClg28tVaBGys7Xfw9GSNrl/9T/8=;
  b=XaWforVPmTyY8cZ8ujLNYIt0ASjbRyDFr9qgQ/FWENBZv1VlWrfsZQAR
   FSTssez/BdxaW7nP5T4iYs+G3c5MvR4OTV7iDEmjMvJDJVQ/HWbJSbcpd
   UxNdOZG69aT4BPwPGRyZomzRYU6nSSYECUCZQhr5FxkK2izTQ9u8CgTOr
   +NNdwBaxhXDuUEx0g/BliAQugXpisG0iBpnNS06jono8F3hooDxyLCknR
   6dCQvmfKAHZO7RUaFKlRlycXoVlXFCTwuYW43Fv3oIVadnyEq1XJgaJoq
   Gb6MHv+f+Mzn+b929pBcTg5MGaCRnjvG4GFVT65eFCILyjh34fUnrBrg4
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143913911"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143913911"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B840AC9448
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FC61F769
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F756E2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1CCB01A000C;
	Tue, 25 Jun 2024 16:57:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/57] python3-pymongo: upgrade 4.7.2 -> 4.7.3
Date: Tue, 25 Jun 2024 16:56:18 +0800
Message-Id: <1719305790-11484-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--5.419500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrUXlp1FHYSPU8DTfVRLTQzBNh
	u03caeD7LaQvmyfa9Wm7n2B38Y2yf1WbI3T6a+TYA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYX+JCeGcq8WG5x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSkj80Za3RRg8HVwAPcixUiunJkVwW5+WQQg0PfLh5UeOAxIh
	o72G9uprP2oEAEBXfg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111059

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Reduce verbosity of "Waiting for suitable server to become available" log message
- Add Custom CodeQL Scanning
- Use deferred imports instead of lazy module loading
- Optimize find/aggregate/command by avoiding duplicate calls to _get_topology
- Improve import time on Windows

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.7.2.bb => python3-pymongo_4.7.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.7.2.bb => python3-pymongo_4.7.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.7.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
index 2951f8f85..ccd364f72 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "9024e1661c6e40acf468177bf90ce924d1bc681d2b244adda3ed7b2f4c4d17d7"
+SRC_URI[sha256sum] = "6354a66b228f2cd399be7429685fb68e07f19110a3679782ecb4fdb68da03831"
 
 inherit pypi setuptools3
 
-- 
2.34.1


