Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F678C04FE0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7632.1690875733988055746
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114849237"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114849237"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 00E74D500B
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 49369D3F1E
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C5A3710211;
	Tue,  1 Aug 2023 16:42:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] mdio-tools,mdio-netlink: Upgrade recipes to 1.3.0
Date: Tue,  1 Aug 2023 15:41:31 +0800
Message-Id: <1690875717-21608-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--2.009200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhJrri3hfrKUxqzGfgakLdjaaEANKbBJN12g2I0XqZvY2opb
	wG9fIuITCC8aAmGeO6m04MnVL1Uks39JXYBaBfzuxLSsi9FKAT3BOVz0Jwcxl7SwC3zqzycUHVY
	j66eqnnk3lq3YEgY6JmFp9qfciji9rWL/xQJnm46eAiCmPx4NwGmRqNBHmBve38LauI2fxt4qtq
	5d3cxkNcy2BSF0xksCvMNxW3ajg8LsABrDVVun7Rb4gkyuFI0T0GmrCbkb4/Owgr+44G3zJAYEK
	w5qiY3oOa21QAqQx9sx6UcU+oijqPzs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104172

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Primarily widen the gamut of supported kernel versions, now supporting
all kernels from 5.2 and onwards.

Added
------
    mvls: Support for 88E6320/88E6321

Changed
--------
    mdio-netlink: Adapt to the upstream C22/C45 refactor.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mdio-tools/{mdio-netlink_1.2.0.bb => mdio-netlink_1.3.0.bb} | 0
 meta-networking/recipes-support/mdio-tools/mdio-tools.inc       | 2 +-
 .../mdio-tools/{mdio-tools_1.2.0.bb => mdio-tools_1.3.0.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mdio-tools/{mdio-netlink_1.2.0.bb => mdio-netlink_1.3.0.bb} (100%)
 rename meta-networking/recipes-support/mdio-tools/{mdio-tools_1.2.0.bb => mdio-tools_1.3.0.bb} (100%)

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.2.0.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.0.bb
similarity index 100%
rename from meta-networking/recipes-support/mdio-tools/mdio-netlink_1.2.0.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.0.bb
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
index 46d0c1b4f1..942b2d482d 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -5,4 +5,4 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
-SRCREV = "0dbfca13a094d20d736153c63161cf11b9ccf2d3"
+SRCREV = "42c91efa63ef81992cdcc01e698cf3bc7764bbc3"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.2.0.bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.0.bb
similarity index 100%
rename from meta-networking/recipes-support/mdio-tools/mdio-tools_1.2.0.bb
rename to meta-networking/recipes-support/mdio-tools/mdio-tools_1.3.0.bb
-- 
2.34.1


