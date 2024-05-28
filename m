Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980C3C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.12683.1716860952977553025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pjC6lHn+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860953; x=1748396953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DYok58wS/XMbZ6NU56NJZIXP3gKz30/hsUoZbw0uOPc=;
  b=pjC6lHn+7eZNAZp7DgtTnqjtBjeBolaGlpHdMcljghJswpqE1dBPkqf+
   bisMZI4rqdLyJH3QygLjPNxs/D1cLXsfHJMHfSyzZH4S1CyYWQPIsHzlq
   vyHClZXGs4fCvM3payuNhueT0iWLTjuThuJJSnmv6XuRowGqiiZGOlnHz
   HfdBteMfzfCkp5NiGoIWEwRn1f6OcGG+Bfno4R1Dn1NSmVVmWPIj2XuIC
   qZxjbwY5XI+V+W67SlUNopPYDeru3g7semFiaZq2Lqub5Ivjh1BkaemuK
   NzOxzZOAN0rYeO8w/6NiuTMDakJtkDIeoN8rLhZKQFxo0etidk/nO8aSi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160604996"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160604996"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55E36CA1E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C92DDB9FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0983E411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB04A1A000A;
	Tue, 28 May 2024 09:49:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/40] googlebenchmark: upgrade 1.8.3 -> 1.8.4
Date: Tue, 28 May 2024 09:47:47 +0800
Message-Id: <1716860901-863-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--4.603700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBkmInFtzPDn6/T
	WdsRtz9hpXroF0mcF3MNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2lNc
	WZ7137CiBkESMI05d4qHvyg1ZsxTfNrsgG44+2ERvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKD6Xh4UukGqsxPdoN1rURpTPAnPJJvD1j5jig8lMtlsa3Fd
	lGiYG6uK/kdeDzilyqAF/YbSn+5N+NeS5jTgF8RC3zFJl5O3ThLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110541

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/google/benchmark/releases/tag/v1.8.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.8.3.bb => googlebenchmark_1.8.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.8.3.bb => googlebenchmark_1.8.4.bb} (90%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.3.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
similarity index 90%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.3.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
index f945a30f3..ffb57942e 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.3.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
-SRCREV = "344117638c8ff7e239044fd0fa7085839fc03021"
+SRCREV = "a4cf155615c63e019ae549e31703bf367df5b471"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


