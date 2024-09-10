Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6005DEDE9AF
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.18338.1725959013420350134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D4xrAmHL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959014; x=1757495014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zCWY1AeSNSxCZq/G/QQp+FPwDP78VVLHi/3lyFl4bRc=;
  b=D4xrAmHLZKVBG5Y2JQBOFM0Bf3ENYwczl7k1xxs8yN4ExFCipvt/1z//
   YI8pDjY3T8rBUj17mxva2cH/4AhQ/lWQnl12YkQ+qGbwkZsq7hf7TiB/W
   jwujsFCJrZZaZdkUjPpTEOdM9JMrRMI2nCt/zSD6a6OjsH568c2S+CF+J
   T/+AvZFW9N07V0IQkyW3weMZwkxOfuWwWPGBgtjdcH1wYGpWU34bY1N6F
   UfEEdNaPj5QhiPVKNQxQGRMrhfRQ0l4coDCkvevr0blxCg0YKYE7PaB0x
   vdRwvUHT4jteO3+f1NSSJ3brwRo1mLQ6j68cMYuWujJdFC1WDQveRw/Tb
   Q==;
X-CSE-ConnectionGUID: 1silpTxSRt6NmR+J4Z4efg==
X-CSE-MsgGUID: w1Zq5S9XS4e9CLBFnFXkRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152138462"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152138462"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A27BDC68E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E6AF4D50EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A966200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 194C71A01E9;
	Tue, 10 Sep 2024 17:03:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/42] python3-pymodbus: upgrade 3.7.0 -> 3.7.2
Date: Tue, 10 Sep 2024 17:02:57 +0800
Message-Id: <1725958990-5719-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--6.529200-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrtOtXYgbXjdf+Aw16GgqpOx00
	gViYX/XQzRFF1f+/9c8+j95AJb21uxJ8EINAmcWb466ysdvAPV4WUg/hm489yPZqmYjn42vPFlo
	O+iJRP8yb/AcBM9rv02BFYvOCHl/GxBNI9kTkfyA8+i/lP6Xo8TFVRYZezcLzOxWg7dD4d3g44l
	SQSFzxs93D8UbcgvNtedu/gVuQyeBaQiLka9EcSk7nLUqYrlslFIuBIWrdOeMR34ro7k23ndb2e
	7N2CFQy2IAqem4wIGqAMuqetGVethtouMvD9sV53QfwsVk0UbtuRXh7bFKB7sfkYRpGXWd5ZTD8
	5pTyNI3IT/hPhh0tCJx8JgfZ63SS66XHIc5w+gc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112214

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Better error message, when pyserial is missing.
- Slave=0 will return first response, used to identify device address.
- Feature/add simulator api skeleton
- Correct max. read size for registers.
- Ruff complains, due to upgrade.
- Properly process 'slaves' argument
- Update repl requirement to >= 2.0.4
- Fix aiohttp < 3.9.0
- Simplify framer test setup
- Clean up ModbusControlBlock
- example docstrings diag_message -> pdu.diag_message
- Explain version schema
- Add more testing for WriteRegisters.
- Proof for issue 2273.
- Update simulator tests.
- Correct README
- Rename branch wait3.8.0 to wait_next_API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.7.0.bb => python3-pymodbus_3.7.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.7.0.bb => python3-pymodbus_3.7.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.7.2.bb
index 9e2885f5c..b240837d4 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "5c772babaa61a65ff908293faa668aedcd9d9e10f4bcf5c77a8fe51a6fd9ed47"
+SRC_URI[sha256sum] = "6cc63a14c8cca83f5b6d9dae3319565061bd49503ee7282df681201c16357eef"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


