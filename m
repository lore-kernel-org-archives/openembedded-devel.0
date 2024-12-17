Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E31E77187
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.77390.1734426114029431853
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HamfwFmn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426114; x=1765962114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1Y1VeQ4Iwz+ONn/qVePggs5NYMsc6hf7eM21rwQcTc0=;
  b=HamfwFmn4FIAV+WWlwQ1dyiCUAKJthafh4nvnCVceleLpzDMJWLZItBX
   SXrQi/qvWPv5PG2fFG82TF6ASyRVKi/q/k92mmXXIapwkiHsI1uPMDkx3
   c4JggLlu476FrQewWChSGqq+U3Yc/7o+i9dgJLElJttHvBKD/PaX9fZ2h
   innQrou0hqHlvLU/XYMlFr6sSjjf0TWGw6Ru9F2m5vV6AQlGLtkIdeBY6
   zFc2aUv6djxtFvDEilv6Ha48dVlAVej8aMYPOgK37OSiDkoL4LdFXLnUF
   FzGg0HxTMSSH0znJAuIaDJcPBBem8d5dtPATcIx+mkvpZErIXzWD4Oo37
   w==;
X-CSE-ConnectionGUID: CiPiKF+dT16Q6A0RXkbMSQ==
X-CSE-MsgGUID: 1Te2OYM2RTmzquPtruI+pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="163476816"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="163476816"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F5E7C2266
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ECB39D9003
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BE192007C3F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31B4B1A0071;
	Tue, 17 Dec 2024 17:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/17] libplist: upgrade 2.3.0 -> 2.6.0
Date: Tue, 17 Dec 2024 17:01:25 +0800
Message-Id: <1734426096-18300-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--0.866800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yTiEPRj9j9rvVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoghqh+u1IaR7ngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXRguvRSegQV/lt1+V/s05nCcYwJiObXcV3agG7FzQrwLntlYC9NP8qo0mgG/ZZW9kr07
	0CYjWK0voHYMqYEx56CDa613FvR1WAcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114354

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changes:
  * Revert back API change around PLIST_DATA to use char* again

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libimobiledevice/{libplist_2.3.0.bb => libplist_2.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.3.0.bb => libplist_2.6.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 81a3c26e04..7278299a08 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native python3targetconfig
 
-SRCREV = "b8fcc89b74c9128a13b07cc15a0ce25dca0cd97e"
+SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
 SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


