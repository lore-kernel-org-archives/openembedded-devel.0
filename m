Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D3DC48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:23:54 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.17266.1707207825511613894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g/MCLbWh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707207826; x=1738743826;
  h=from:to:cc:subject:date:message-id;
  bh=AU5HphcSrXag9Ctd5PkNWca7X9ATverYe5utoBLge7I=;
  b=g/MCLbWhq6h6Vo08oUzcLRAFoWFmyWwKa7+hMdikiAkgCm7ycHGUDhe3
   HczSfURs5uG5VumwXLhVJHBD7ICTDA51mg81uLjBXzKySx1fdpzWAB4JY
   d4SskTAYEEGguKEkMg1T92+PatgPQwti9V3w06WZ/7KwrG9Y2DvVNXxFL
   4p1Ml2dn6v5TTEkeoXWobG+brn4VrOJ5IcO1qlm9ojzXYqd37AZ7kXjmU
   gU9HKdeKrPRnGANqFQk6ZsOH2nJZqyoNIpPU4pkDjT40UKg10GnKSNMZb
   hPXnUReaMjS3LOFaLtYzggZ4XiJTiOYjpsfHIKJVJWsbb8UmY4ElBCYtB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148536743"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148536743"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:23:44 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FC351F7200
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:23:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3F8CD6227
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:23:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3828920096421
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:23:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB5FE1A006A;
	Tue,  6 Feb 2024 16:23:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sanlock: upgrade 3.9.0 -> 3.9.1
Date: Tue,  6 Feb 2024 16:23:17 +0800
Message-Id: <1707207797-5511-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.832800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIjoXTYf2xFF08HitdqBBn7HEDUAqZUZM7g02I3oyGU8A91mbLHzEBrZ28
	gEzxS4tLmLhyPuJTma3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6/pT
	/Vg0aVnOEf7NJeeeuh3nhRixbQ+2VRDlvacAXyQGurzGL788+YQxMAvCAXkKML7rJdyQ2k4RcKp
	WBpvdzdUopNyM4euIaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108607

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_3.9.0.bb => sanlock_3.9.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.9.0.bb => sanlock_3.9.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
index fa1c6c7ec..9f8dbc813 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
           "
-SRCREV = "23766f9119b7c06b463110aeb9b969a742f0fe23"
+SRCREV = "90156f382c2508cc7dc4dc32f8247d3e1291b318"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


