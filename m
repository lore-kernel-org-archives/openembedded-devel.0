Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48A4C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:25:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.28261.1701159906092027569
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120585513"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120585513"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:25:03 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CE61AE8D32
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:25:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06F26BF495
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:25:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 233582005019B;
	Tue, 28 Nov 2023 17:25:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tomoyo-tools: upgrade 2.5.0 -> 2.6.1
Date: Tue, 28 Nov 2023 16:23:33 +0800
Message-Id: <1701159813-27956-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28024.006
X-TMASE-Result: 10--4.675500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorbD4
	LI9c0Yeivqbgr4tKCQvmn3xyPJAJoi0y1C9MdqPQYu9YuaJ9+CrfVqwz+CynaV42zm1Zi+MJHxe
	1N77pOFOEZazhtGkI+nk48PxckV+kHxPMjOKY7A9wK7mZ44aKbmDtghTFNbDXKrauXd3MZDWXox
	PUvR8GJryrkbXIniEj2/xPfbLu3cI0SX5hav6/x+0JmdN/iUu0Y6pP/0Um72E7Iv0HhM4D7IFbx
	8U+D2KhMnD2cV3K8e3yvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107076

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{tomoyo-tools_2.5.0.bb => tomoyo-tools_2.6.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-security/tomoyo-tools/{tomoyo-tools_2.5.0.bb => tomoyo-tools_2.6.1.bb} (81%)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
similarity index 81%
rename from meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
rename to meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
index 2fcdb6bd6..86acdc7aa 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
@@ -5,8 +5,8 @@ being useful purely as a system analysis tool."
 HOMEPAGE = "http://tomoyo.sourceforge.jp/"
 SECTION = "System Environment/Kernel"
 
-SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${BP}-20170102.tar.gz"
-SRC_URI[sha256sum] = "00fedfac5e514321250bbe69eaccc732c8a8158596f77a785c2e3ae9f9968283"
+SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910.tar.gz"
+SRC_URI[sha256sum] = "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42fd311c4022b78010a"
 
 S = "${WORKDIR}/${BPN}"
 
-- 
2.34.1


