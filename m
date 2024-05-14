Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A010FC25B79
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.10783.1715677828800285236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ki+8NiJe;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677828; x=1747213828;
  h=from:to:cc:subject:date:message-id;
  bh=dboHlmf8u7OZGkOZIsyLfHnadWFuBet6xdybBf6BJkQ=;
  b=ki+8NiJex3ubIObaTS0nKbMvQs7H1+kyQAbwmgvR59f4NBuh2WHq3cuB
   doAVZO5BoT5+AAat77b+lc2ZpcSbzsySpvKccj34EvhJIBJxLKx7pyScr
   x2wUdEt1DNgNb1RLnA3EJEy1zjrG8ylr+qJR3kMvYnoPhtXgx/5hYSHX9
   Wz2AR0bz1puQ1Qzp0pnlxQiyKhI9yvqcfndlDG2cws2NhaIp/dUgJYeXs
   Nbh7xfDnWVB8+WTHJ2odD0VhF4ZKnb28L8mTfTZjnKuv9aTRyc+3o8C3o
   eLOuUayFzvmDjuGLvvTnjNRkAHUZaO8kExsLj58fpOqkh8ORDKieY1MGJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137077595"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137077595"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 013F1D994D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 42FD0D0D99
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A25BE20076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31F0F1A000B;
	Tue, 14 May 2024 17:10:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/44] dool: upgrade 1.3.1 -> 1.3.2
Date: Tue, 14 May 2024 17:09:34 +0800
Message-Id: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--0.872000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxYC5LPd7BvbRuN
	dBIs94gP3eSQrynh0LV/OIVI64uT8dvE2OCxj8lNHWRJEfGP5nkbbhhV65kaY/H96zhMF86nqBa
	NO8tKb8YILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFQQ0EgzIoPRoHmOTZNdeMUjL8
	WDWZGeou0B0MT8S0EkgDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLOvwzhW1qkZb87Td
	AqEjTgUZfL5COfBRf+lM+BHNvvtlUFAk0liVR7OiUPrnWleFDYpT8imHFt3j2E6JmqgICg/AKuj
	jK1QWmqIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110348

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Publish on PyPI
-Add a new --dstat option to emulate old functionality
-Remove code paths for Python 2.x as we're 100% Python 3.x now (and have been for a long time)
-Add documentation about bits vs bytes to refer tickets to when we get questions
-Fixes for long names on --top-io-adv plugin
-The --freespace plugin can now optionally take a comma separate list of mount points now

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/dool/{dool_1.3.1.bb => dool_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/dool/{dool_1.3.1.bb => dool_1.3.2.bb} (93%)

diff --git a/meta-oe/recipes-support/dool/dool_1.3.1.bb b/meta-oe/recipes-support/dool/dool_1.3.2.bb
similarity index 93%
rename from meta-oe/recipes-support/dool/dool_1.3.1.bb
rename to meta-oe/recipes-support/dool/dool_1.3.2.bb
index b20f8b401..f7e403018 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.1.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.2.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell pyth
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
           "
 
-SRCREV = "30847c748483bc088549486292232d805b086b1f"
+SRCREV = "b2862905be841232c9e36ce1e059d3fe34ef0cdf"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


