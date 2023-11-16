Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D394C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:47:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2412.1700120851281599014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139856011"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139856011"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:47:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 713F7E05A3
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:47:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B2799C8BFD
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:47:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D956F70B02;
	Thu, 16 Nov 2023 16:47:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.21.0 -> 1.22.0
Date: Thu, 16 Nov 2023 15:46:52 +0800
Message-Id: <1700120812-21410-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--3.577900-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrWQ3R4k5PTnBFms6YEs23D9F8
	e0i2JFlZ9tZKhO0OBniUQWt7uSfhDD4xnGicftABGXGu0jdPFGQW4OwYi14vlxRBxWB4uaWE9CW
	UOiHYPrIlPPLsWDHSz4krinmMF3EWLxEFvMLiU9+4u3nS+3EEDgT2OEnoCt488vJ7Gotm2YBtjZ
	WMxmYEJKyHEQoVzplBl/ZqERfMFvftWteqKqfAdfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkN9ku
	tSXDwfHmuyFTRySne4MMV3HqxQ6epcLewwAa76fdXu122+iJtpV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNemt4LDBvQqHIkb/jgZFiWGoI7hfsFAyRqbnVVBKTcdTM4BshhYHQTjjgC9
	bwqQF7DYMx9WkK73MBvlT/ZMgUMCKvXCohjApqmOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 07:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106776

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-ares_reinit() is now implemented to re-read any system configuration and
 immediately apply to an existing ares channel
-The adig command line program has been rewritten and its format now more
 closely matches that of BIND's dig utility
-The new DNS message parser and writer functions have now been made public
-RFC9460 HTTPS and SVCB records are now supported
-RFC6698 TLSA records are now supported
-The server list is now internally dynamic and can be changed without impacting
 existing queries
-Hosts file processing is now cached until the file is detected to be changed
 to speed up repetitive lookups of large hosts files
-Internally all DNS messages are now written using the new DNS writing functions
-EDNS is now enabled by default
-Internal cleanups in function prototypes
-Randomize retry penalties to prevent thundering herd issues when dns servers
 throttle requests
-Fix Windows build error for missing if_indextoname()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.21.0.bb => c-ares_1.22.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.21.0.bb => c-ares_1.22.0.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.21.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.22.0.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.21.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.22.0.bb
index d334e111c..6f6030fcf 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.21.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.22.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https"
-SRCREV = "71f8e16e5091952c60fb72b2d990db7724c3e8f5"
+SRCREV = "9706649cd940b00a20373c0c079ae281beb470fb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.34.1


