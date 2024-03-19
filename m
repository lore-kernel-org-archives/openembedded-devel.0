Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4CBC54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:47:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8231.1710827222870193608
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j91aRs1A;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827222; x=1742363222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YivC4y79ubwLu2wqCYNy0N8XXMVREHXLJsS9sUEcvUM=;
  b=j91aRs1AzdbjC3GbT8Qj/NpQlFY8owmQOHV97Irjo7BoIA2JcUBuxvKT
   AEOna4geLLD9VapPXSuxDUuYsnb455nsl0I4xV1cBpq90Z/yKC8JsOaWC
   hTKerQ2jXrM+eLWnfte3QLGDPlCUV0eWhGQP7Doy/SWbGhkbZCov+pfbc
   v830ZkKZC35X2pbNO4dFoEusUUaw8uKIpBssRLiiSgzrWlyZkBVYhT3dX
   ilX8gh/zAGkWL4UDH8JO7YimEto2y/1nlwjWA0AzJhrDmMCU8q+bj6koe
   Lvne6b0jp9KQN6cgsICnpHUH5WQRlh5+6eElN1tpKq7JBh1ujUV3wIPVm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="141150256"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="141150256"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DFA1BC6817
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F784D2BB3
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A455D2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 49DD51A006B;
	Tue, 19 Mar 2024 13:46:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 50/50] xrefresh: upgrade 1.0.7 -> 1.1.0
Date: Tue, 19 Mar 2024 13:45:39 +0800
Message-Id: <1710827139-30056-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-1.868000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwwAYdq1VTXo/X8
	2GxUGSz7qqLZNRhM8FP2PVpozRoH1x2P280ZiGmRNcwCMbCA8ajVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIlWLxOr7iITdD0Kx3AfsqGRG443Qtal3vdezv+xM1K4W6GK
	f1hR55GOr0AGqwAq1YoFxffqPFRQnAd9uvzjWb8xHz476dYqrVLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109467

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add -help option
-Adding in a '-delay ms' parameter to optionally prolong refreshx
gitlab CI: stop requiring Signed-off-by in commits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xrefresh_1.0.7.bb => xrefresh_1.1.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrefresh_1.0.7.bb => xrefresh_1.1.0.bb} (80%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.0.bb
similarity index 80%
rename from meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.0.bb
index 6f6ad73e6..12d05b130 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.1.0.bb
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dad633bce9c3cd0e3abf72a16e0057cf"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "a9f1d635f2f42283d0174e94d09ab69190c227faa5ab542bfe15ed9607771b1e"
+SRC_URI[sha256sum] = "29ed592d5ece35a3029004d8c46f3002f92970870a96c11e38baf7f1122b8b5f"
 SRC_URI_EXT = "xz"
-- 
2.34.1


