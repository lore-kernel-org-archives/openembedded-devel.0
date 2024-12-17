Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4913DE7718C
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.77388.1734426112249572980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xa/Cfsrr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426115; x=1765962115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1EWoN8SzTg3kZ3C5IRSiikBkqbYdmWfItA18U8WNVaM=;
  b=Xa/CfsrrRptuN86epKa29R0dqY8lX2pLTXpsgLNfeVbmFWh+FucJcnIq
   elVg1TuClmWvZTCm08XzsLp/pPucQi+5HcIlu4yNogKBQzCyVS03xW8Qe
   ftGwtFzSu253rX4V5PojKItXmQcIKswOFkyBGCbf4awNaIxnuCg3Wjpo1
   PcHQ3G1jYq1h3ytYsQ9cn4QY3/wPnwanDO42kKu7KDzFO3BQa5gvkhZOf
   jf4JnXXHuc/oLmjL4PaRU7T17xHoZcEOs9uNUUf/LvS5/QXYm0kvQHJDR
   D8AuLMgb537WRtUaS22SdbBdPsPVmORzcd5ADjl/EqdIQvuCxWNjH2SHT
   g==;
X-CSE-ConnectionGUID: AkPGRHLXSiyg9w6U4XwT0g==
X-CSE-MsgGUID: rcwyoR12Q6CX5JVCK8bH3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="183207108"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="183207108"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AE1A0E8526
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74C0FCFF84
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D038347B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9E6C1A0071;
	Tue, 17 Dec 2024 17:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 08/17] localsearch: upgrade 3.8.1 -> 3.8.2
Date: Tue, 17 Dec 2024 17:01:27 +0800
Message-Id: <1734426096-18300-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--5.336800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIgofMgahPrYOj
	DpJ85Gax3WhgsWJsCXANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2qm7
	+5vwHBSX6lerqXBslM9nTS0vd3g3dGVb/LG9fKnlZNYSHk3Zr0X0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtz0QGbyqjebCwv+9732vW3kEtlY/J8WSODwi7FD0+gMhvg+pdT/wtfw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114353

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
 Fix database inconsistency resulting from some patterns of folder
 updates, and possible resulting CPU churn.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../tracker/{localsearch_3.8.1.bb => localsearch_3.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.8.1.bb => localsearch_3.8.2.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.8.1.bb b/meta-gnome/recipes-gnome/tracker/localsearch_3.8.2.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/tracker/localsearch_3.8.1.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.8.2.bb
index c80d6dd102..bcc5a30501 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.8.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.8.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "a7b24a4f07805df7543a4dd023684fcde5ee699ca00eb5b09123a049d3aeccd8"
+SRC_URI[archive.sha256sum] = "cda69195f6845357a8d91c023670efe92238f4d138a1ef7a1401f45a2a8403ce"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.43.0


