Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AADC25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.9756.1717664830964561522
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UbzsdyaY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664831; x=1749200831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CQYesxFrGD6m+r3a9RnFKfO+b/HWLQpsEnqCshoHVYA=;
  b=UbzsdyaYmsSDaM+xh/uUHxnR30am50TscBfJ9VWx12LvP7T/9lBLdooh
   gFCotaFVOxEeTc1zeFvsn2TTmnajFAhPieaomQRfX5x2PVkwcoMNlWFt9
   OOLSQHaaspwHh9ZEYuLZ3j2Ah6EKVq7Q0zslpcrQdTk5pGivVPaYoePRp
   scf3HxQjuNrQ/IVYIr77X/o7clV0+oWae4vYjjkLmkssd+UAlP5MEd6OP
   T3Byzasj0sHivwZoBzv2BHSN66g2o2PGXK0oCvO70WsbulV4af5u4me5K
   u5U8rSxYeuK6WznN8/7xVSU75L5Z5BEWPwYnVNAWMQ3yVxKMlwUqJRs9I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162136686"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162136686"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16315D500B
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BDD1CFFA5
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E854A20081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 969A61A000A;
	Thu,  6 Jun 2024 17:07:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 32/36] openfortivpn: upgrade 1.22.0 -> 1.22.1
Date: Thu,  6 Jun 2024 17:06:31 +0800
Message-Id: <1717664795-13902-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--3.455200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yS2LzK6SyftmKopamxf5EWSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNtw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUo8T
	MutQL6LSE97yr4g+GPoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzZ5ZcAx/ID0WrPx
	3ZhpCugPvIhopPFEuPUbqlCVyIXUSKYkqQD4rvhQ0AGMOzuQzsn+13pfxpJB1MfAQmR9oL6Zbob
	7ckI1QsiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110741

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
 do not advertise we talk compressed HTTP

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{openfortivpn_1.22.0.bb => openfortivpn_1.22.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.22.0.bb => openfortivpn_1.22.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
index 568593b2d..b69a7e235 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.0.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.22.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
 SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master"
-SRCREV = "82e4401162fc65efad8267f4cb3287c6ab6fc088"
+SRCREV = "388fa98f639ef91733461de50b06dd57f1ffb099"
 
 DEPENDS = "openssl"
 
-- 
2.34.1


