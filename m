Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADC3C3DA65
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.33832.1721034181887278081
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z2b4EEKY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aNstRNW7zRwQsRLTdz028cF8T3bFjpuH/jr/ZooDRHw=;
  b=Z2b4EEKYFRNM41aybAIPnG0B10ffxOPWu9sUVJa06r+4ODry5vtcUP33
   FXUc3sDDi1IDbi3MQmDKZTGoHbJ/wTGux6tc/3X2ly4cpdUNkXF5EhKqN
   2UaN/sGCJgRQdPLmMTDDOsSEMb+jLhtaYERFGb25KeIhSx2RxN86CRXbT
   zQE9fx2NFrpVdTuY6zxuQBNWKQ3/cC1tcHo8LyWNN7/jJiVQVWP4zb9Ur
   /cKg7GFhgM99UEu/3dvLHKNxVQd0WDz0Nwc7MCYhc+IHAstEVua0KQTYv
   GogmojH6Zbvu/cKCo0sTw+KvWOU5W1aHYUw9AeICOrx3WnWhTQixlGXlf
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="146374032"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="146374032"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D941DB3B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE166CFAB4
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 453EF6BE55
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E99451A000D;
	Mon, 15 Jul 2024 17:02:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/38] python3-prettytable: upgrade 3.10.0 -> 3.10.2
Date: Mon, 15 Jul 2024 17:02:18 +0800
Message-Id: <1721034151-540-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--2.176600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuK6YeLVLZH4CGu
	zVLLKJdO0wZ8umUEkrMNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDKIp/k2x3jvkRAISLmT6dDEHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5RRJ
	pYX+mVQYZ/zVOaJo1+SBcIZqBf/sKrk6cu8cqaFcsND9qkcIZFFIGtRaUafHVaUgXVO/SlO2EU9
	T2XYopFB0iKTcr3wNSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111345

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix typo in README.md
- Change how size of headers are calculated to fix ColorTable with title

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-prettytable_3.10.0.bb => python3-prettytable_3.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.10.0.bb => python3-prettytable_3.10.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.10.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.10.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.10.2.bb
index 35e9ab179..519b58d20 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.10.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
 
-SRC_URI[sha256sum] = "9665594d137fb08a1117518c25551e0ede1687197cf353a4fdc78d27e1073568"
+SRC_URI[sha256sum] = "29ec6c34260191d42cd4928c28d56adec360ac2b1208a26c7e4f14b90cc8bc84"
 SRC_URI += " \
 	file://run-ptest \
 "
-- 
2.34.1


