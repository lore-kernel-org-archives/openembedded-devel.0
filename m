Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D12C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:27:44 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.16735.1707204456908678938
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I1rr2XNn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707204458; x=1738740458;
  h=from:to:cc:subject:date:message-id;
  bh=JyUlcxRvXxYeM+WZ28Gp7IQdZTQWnPz99Q/xl51/k04=;
  b=I1rr2XNnaLkW7JjGaBhdgnpZUOOkXLXDQlOvgHTcHq6vIOmSUgbDc7rJ
   MIvLvEPjgMn6hDU5THwDLadYrCsOEl1YoTZQ8LpaSWVRqFoDtlOxr3d65
   RNxBHA4zLC1jlzbvJErQ7HSWZ4lesMjbpYXegqg2ZlPMdOaVQlYjJiI3K
   dwelDCitm2OTwQ0tsbm3jV0OwJcV7oWGtyhLQKxVaSGDwlW3uYQsiUUCT
   iSl+SNO5WZbr9PvzQmoqOqLGRzEZUHi9CcssAIRZO8BklShL8Fy79OIsL
   NbrGm8m1uKB+uZBbPaQuF6/fsylqnWAypUU5CZ5V4I5b2H6RxHAaUnChC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148550245"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148550245"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:27:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 20DA41DDD4F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:27:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BA7326521F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:27:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA63A20093574
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:27:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 678541A009A;
	Tue,  6 Feb 2024 15:27:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nanomsg: upgrade 1.2 -> 1.2.1
Date: Tue,  6 Feb 2024 15:26:51 +0800
Message-Id: <1707204411-4675-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-0.602000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjIgofMgahPreoH
	78fyjH+uq3UV6iO5sqDov4MY2WSEP+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4nF03j9r9uDD2qjKAYV8LUZvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJMlkIx10t2gkGMbwWPDUojXYsb0AqLlmzKuzSksMfz281cY
	Y4iLoX3B+HlafgVAUmwQchNkZrN/TpkV9AvAKnAgRmTTF+vcs5Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108597

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed #1105 which caused a SIGBUS on some some platforms due misaligned accesses.
-Fixed a problem when using absolute CMake target directories.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nanomsg/{nanomsg_1.2.bb => nanomsg_1.2.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.bb => nanomsg_1.2.1.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
index fdb781180..c250ea877 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 SECTION = "libs/networking"
 
 SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master"
-SRCREV = "a081f1720f576d3e72ddce14e159ba90384e5b92"
+SRCREV = "fc3f684a80151a3319446fc96083a9ff384ee4fe"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


