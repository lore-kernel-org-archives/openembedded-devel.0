Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633EFEDE989
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:28:39 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2207.1695108509006508112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120908525"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120908525"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:28:26 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A164C68E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:28:24 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4565FD5EA6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:28:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B5CE686F10;
	Tue, 19 Sep 2023 16:28:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] boost-sml: upgrade 1.1.8 -> 1.1.9
Date: Tue, 19 Sep 2023 15:28:06 +0800
Message-Id: <1695108486-6756-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10-1.065900-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yfx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkH4q
	tYI9sRE/KqrQ7lLcMnwGFBbDeVn4ha7Kv+wYXRsg3QqJN4m15UF9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I8ZW5ai5WKlyUELw5zAEETLm7d8+dAmNnP+d2qYnPOPz6xFZGA7x6RJXFR
	6pwL59sSuAGIyHtlysYLYz6bdzhp7dgE78VEZvSIrtg9i0pUkR/r/b+dmSKFo6AH9/PcRd1xUpP
	R4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104958

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/boost-sml/boost-sml_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
index 18dc8851af..378be1a8eb 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 DEPENDS += "boost qemu-native"
 
-PV = "1.1.8"
+PV = "1.1.9"
 
 SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
-SRCREV = "8eb63a8b77bb662075dd36b316e53f75e605fd0f"
+SRCREV = "751b6f10b73c086e0e8850a7ef5b5aea2136831b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


