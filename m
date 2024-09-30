Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB17ACF64A1
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:48 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.49300.1727682223182766253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dksC3P/D;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682224; x=1759218224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ghiD0QLNaNEF9f/+6iJFXXIw4MO8Xjb9t+PsuRi0sXI=;
  b=dksC3P/DvBQFXBSkenCtlnXTGjBbbt07NPma34Mmmavxn4ctyma75toh
   Ar52Yjx86gMsKVhLMFAK+a7fL/Ywvtu339DIJ+txsjcTKtMmibr2luCwn
   8P0Srud0XSFxc6nGst6uIUYdnayfWBo0nEO5rNlq371nexRaFrqcIETYY
   lWVAycHpHra03jp8hs62OsFw6KEqUJUFNH1EVGfdEV7ppB04PXgwUQGrZ
   i0lLfeinHAaO7FfrBWr+730WUHtFS32WUoK6kQLWURytXeqJD/Yh/f5Zi
   FNJ/CtZp5kg4oSDqMWw9hR1/k8QDNRylZnoSrKdxo2McEzXMVAIFRuSms
   Q==;
X-CSE-ConnectionGUID: OB8IhXp9R5SDZvJbegG50w==
X-CSE-MsgGUID: RZK5kfwMQOaHk91m4XXREw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="174441228"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="174441228"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:41 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 198D7D29F6
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F079D4C0A
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC2D220076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EA051A000A;
	Mon, 30 Sep 2024 15:43:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/40] python3-configobj: upgrade 5.0.8 -> 5.0.9
Date: Mon, 30 Sep 2024 15:42:43 +0800
Message-Id: <1727682185-12664-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-2.737400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yVgowyUWHgGdpxAd6mi1Ga1s1Ir4NZzFmgQF
	TLnXm7yY4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2f5rVOs2bw4Rh+t
	oLLKXwRGBkESMI05d4uuLFZZYlisfHxPMjOKY7A8LbigRnpKlKSBuGJWwgxArHsoRE2DMTEYtPO
	8X8ma7dMinXPzlZB18WGTSrktxvv+aJQR99k7ErzBexxaZKn0mgPKO9qzWRavIDyi8iDvBmSKqs
	qfVHNujpAPwlJfQVyKIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112574

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Drop extra '2014' in LICENSE file.

Changelog:
===========
- Address CVE-2023-26112 ReDoS
- Drop Python 2 support and compatibility code
- Extra 2014
- setup.py: fix license tag
- Update minimum python to 3.7 everywhere, and add 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-configobj_5.0.8.bb => python3-configobj_5.0.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configobj_5.0.8.bb => python3-configobj_5.0.9.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
rename to meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
index 96e579c78..2f6572af5 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Config file reading, writing and validation."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6f99b84d9a94610c62e48fa2e59e72"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2df3cb285297a24cd1097dfe6e96f95"
 
 PYPI_PACKAGE = "configobj"
-SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97"
+SRC_URI[sha256sum] = "03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


