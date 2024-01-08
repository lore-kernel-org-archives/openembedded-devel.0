Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DECC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:02:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7284.1704722533337785321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145305578"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145305578"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 23:02:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 11AFBD6475
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:02:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 31D4DD9C99
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:02:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C6224202DB1A6
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:02:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CB5F1A0072;
	Mon,  8 Jan 2024 22:02:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] traceroute: upgrade 2.1.3 -> 2.1.5
Date: Mon,  8 Jan 2024 21:58:28 +0800
Message-Id: <1704722308-31124-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-3.788800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNR+ovg8NDYPAr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DhKQh1LCmGBuCbuVI7hVbLDh9
	UBtN1P4h7X3rw2joxmz21HGsfcKEM5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbVCLDmupnLVKPXTZk3i2qcZaIEQqVIANVurKgFb17Sp7pJfb3iij8U/kVoROKHPKORqUF
	8ULNmNuaHiYDUJoR8am9KgIX84qe/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 14:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108164

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
Fix rfc5837 parsing 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../traceroute/{traceroute_2.1.3.bb => traceroute_2.1.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.1.3.bb => traceroute_2.1.5.bb} (94%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb
similarity index 94%
rename from meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb
index ed75ba34d..862cba91e 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.5.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/tracerou
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412"
+SRC_URI[sha256sum] = "9c6c260d96eaab51e3ce461b0a84fe87123ebc6dd6c9a59fab803f95b35a859e"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 LTOEXTRA += "-flto-partition=none"
-- 
2.34.1


