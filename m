Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B7EC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:38:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.6740.1704721113738081265
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="124232689"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="124232689"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:38:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 59589D7AC6
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:38:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27F9AD4C1B
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:38:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A6A146B4CD
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:38:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 59B011A0072;
	Mon,  8 Jan 2024 21:38:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] webkitgtk3: upgrade 2.42.3 -> 2.42.4
Date: Mon,  8 Jan 2024 21:38:05 +0800
Message-Id: <1704721085-30411-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--3.298200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxl9HNVJWpc6nHbeBu5LnnVBDonH99+Vo/BcXs85d6rGyQ
	B1oR95AovvgdKVdcSxXk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4dq0
	n9Snn3koa048aa0O5y7mxsqDwVhk1icjBunI6n/UWV6Ef62zYOJsZfcUdjEda06XTqcUJLC8VEj
	TaUibjqk6vCUZZMt9aCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108147

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkitgtk/{webkitgtk3_2.42.3.bb => webkitgtk3_2.42.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.3.bb => webkitgtk3_2.42.4.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
index 6149a7ac4..3c6b7db81 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "0a1a4630045628b3a6fe95da72dc47852cff20d66be1ac6fd0d669c88c13d8e2"
+SRC_URI[sha256sum] = "52288b30bda22373442cecb86f9c9a569ad8d4769a1f97b352290ed92a67ed86"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


