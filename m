Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F17C27C7A
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9821.1717664812798199327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pe4/gBGZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664812; x=1749200812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Eon6TIrd8XLy7PBqtRF7tfYRfq8JGK9XM4Su1ciF4KM=;
  b=Pe4/gBGZipk0N7xPnuiwnK44LHrTkugIuYxOB745bACxBTk/EkkLMwXt
   p14KWGKQkTlJBZEfqHn3v/wRQYrnCmw9fq8AorNeTltD7VC/ay/xxgzAj
   +vMkOWd+o7ZqI+jfdXWYrEd9T1fd++CSZFRbMhVX5vgWpH62HLta//Ks3
   j7pdkyk1wnttrWGWUTvwUo+zYXSJ0Oxa3a95p90Zf9As3bVPI+BoOX0Jp
   9Urp4n9wVOC3Gi4OpjD3DWPeGoZX7F9mx0cMJuOn6H+jRCR/Y6WwzbZOU
   rVoHtXNHTxmJNteWk2b9i1IqO2+0WL0VZDF99o0SSZm+yrUVbGYq4mpFG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="149566615"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="149566615"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:50 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 372EFE4458
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 81C6BD50B1
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A7F7401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BC33F1A000A;
	Thu,  6 Jun 2024 17:06:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/36] cglm: upgrade 0.9.2 -> 0.9.4
Date: Thu,  6 Jun 2024 17:06:03 +0800
Message-Id: <1717664795-13902-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-1.863000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrRpgtqnD1BD4vfU/riSJXkSmF
	OYJJbPqpOqcWBr0UnSufpS8fdiMxuTuZPz8QQL7+qhcdnP91eXFN8rmPQRlvK7oFQ8GRC1Pr7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0D2WXLXdz+ARCE2NlBjIjctE8mz+ry/JSsGH
	K/YO0c/+LzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAU4vxLn9ks74ntBLjvOrriN2xhf
	zXuDMMqnSWSS74lw84rqF5ZHt+bEzM8bEmN73NGPLIEZIqOIsdOVSUDAAay4c6HoqP49sgE7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110712

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Struct API glms_ray_at incorrect dir para
- dont use I macro defined in standard
- improve docs
- separate SSE and SSE2
- make Fasth math work both on SSE and SSE2, make -0.0f run on SSE + fast math
- make some failing test pass when fast math is on
- dont validate nan and inf on fast math
- add note to enable config where may not work is some environments
- alignment
- fix some doc typos & warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/cglm/{cglm_0.9.2.bb => cglm_0.9.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.9.2.bb => cglm_0.9.4.bb} (93%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.2.bb b/meta-oe/recipes-graphics/cglm/cglm_0.9.4.bb
similarity index 93%
rename from meta-oe/recipes-graphics/cglm/cglm_0.9.2.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.9.4.bb
index b503c6ed9..6fcc07d92 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.9.2.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
 SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
 # Tag v0.9.1
-SRCREV = "c8781615183ce3cb4f5d72caf70f2c01d7d4d2af"
+SRCREV = "1796cc5ce298235b615dc7a4750b8c3ba56a05dd"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


