Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0D4EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.7627.1690875729426700273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126603476"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126603476"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:07 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EEBBC3F82
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C69CD9689
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 205C810211;
	Tue,  1 Aug 2023 16:42:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] babeld: upgrade 1.12.2 -> 1.13.1
Date: Tue,  1 Aug 2023 15:41:21 +0800
Message-Id: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-2.210500-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrWfgivgcUPZNF44mD/VSmfWi9
	XMu3IBV85zZHownpG+1d6bYQL0xfRzkdZrWTFzcxA3KSB1+s3Ij0swHSFcVJ6NWM2x6EZ/S9zwq
	JMfGnjS3gK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq6RY0
	JyfRdA4l4Q/+3wuqBmtz9kIuTkBq4bcm3b1gDB8N0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtuVfc976pNypithyVA0Jzmm7kdXS5yTAk4DdfIqqrYAUG3uhhchP6B19uRiKeaEhdsLMP
	schl+JdI71AuxeD71P+jaa45WHcfmngb/R96nTHyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104162

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Implemented the per-interface option "probe-mtu", which automatically
    discards links with a mis-configured MTU.
  * Fixed a typo in the handing of the option "v4viav6".
  * Removed diversity support and related configuration file directives.
  * Optimised route redistribution.  We now install just the route that the
    kernel sent us rather than doing a full route dump on every change.
  * Added optional delay to daemon shutdown; see the configuration option
    "shutdown-delay-ms". 
  * Fixed compilation under BSD.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../babeld/{babeld_1.12.2.bb => babeld_1.13.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.12.2.bb => babeld_1.13.1.bb} (94%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.12.2.bb b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
similarity index 94%
rename from meta-networking/recipes-protocols/babeld/babeld_1.12.2.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
index 03db5fc0bf..a799ad197e 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.12.2.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
 SRC_URI = "gitsm://github.com/jech/babeld.git;protocol=https;branch=master"
-SRCREV = "a9fba0e19ebde96cdc4edd35c5363f9e8139ab35"
+SRCREV = "3d61ea1e843e2c5f9706c74d1adad4e1d24d44b9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


