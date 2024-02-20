Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F2EC54E49
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9335.1708419301795006605
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tTvaozMS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419303; x=1739955303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=H+hGpF0O0TYETw0MFXSObixuBOwiBAul1c1/zpYnf20=;
  b=tTvaozMS6IQXBA50gZCgVphpePDygFNzhfQNVrKlqOfg8fcqxaOLBF68
   hnk5fJJb7fAb+7UGNNrFMitlsr0OZoHLHhUEX/yBp1M1nr/GcFjvk0isa
   j6uoNuHEiCgcS/Hz5JT62ekEQPPThzlqWl/jukEQ9xtkeordlDFcP0Aq2
   si9YrPyk3ACn4tk3nRiMLgFYtE20oKHk2FbbJttojoPQM9JfMLxEoTZug
   hUnOCWXkGvUfkvht1n54lLsQy+3ISMwfYX3Z0mHEU4/w+H4hpTo51ojzx
   yGUHfqAWLqrH12fr95q8NK9cEySZLFOso/R5Pn8Q7dKfSAwKBb+YaX/rd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149905941"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149905941"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 744571F475E
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B62CCF314C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 543896B8C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 08A4C1A006B;
	Tue, 20 Feb 2024 16:54:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/26] python3-pymodbus: upgrade 3.6.3 -> 3.6.4
Date: Tue, 20 Feb 2024 16:54:31 +0800
Message-Id: <1708419281-26047-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--9.892200-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrMhWn2gQUyKnXXbamj/TU528q
	nFk+BWUXe7o2Xtg8MGiFVozH+8rFVJXlm91Fv1IpjoyKzEmtrEc2LwvzxRX0gD3BZApXJkDbM/H
	HrxBahdfWPKk1jTC1ph6zoAyY3rIYDvX2Sk47fs+ap1C4peSaizqu3dM+YhFReFJfgsIW66mXDJ
	ZLLxMl6nYPH0z/ChvCDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZcFfXzPlfY7e+cDD
	zKnTzUsgZBEjCNOXeIojn9TQ5wiPuVHGbcDbAq6FEUknJ/kEl7dB/CxWTRRu25FeHtsUoHuJuqS
	1nHpALBj/z12tMUFOirGFpHmeOKggktacoTy2w/FhXMjdQIJpg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108938

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Update datastore_simulator example with client
-Test and correct receiving more than one packet
-Remove unused FifoTransactionManager.
-Always set exclusive serial port access.
-Add server/client network stub, to allow test of network packets.
-Combine conftest to a central file
-Call on_reconnect_callback.
-Readd ModbusBaseClient to external API.
-Update README.rst
-minor fix for typo and consistency
-More coverage.
-Client coverage 100%.
-Run coverage in CI with % check of coverage.
-transport 100% coverage.
-contrib example: TCP drainage simulator with two devices
-Remove "pragma no cover".
-transport_serial -> serialtransport.
-Fix behavior after Exception response
-Correct expected length for udp sync client.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.6.3.bb => python3-pymodbus_3.6.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.6.3.bb => python3-pymodbus_3.6.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.4.bb
index 337fd0e19..4f53d01f3 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "862f64376ae201f979c91ca2398f0ed5df8f136b76491e0995edeebbd0fa8940"
+SRC_URI[sha256sum] = "6eee2c7eedb794317784c967096fa1fe42200357e9b5a349d838ee9159624fe2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


