Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48447C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:04:40 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.76565.1703574276968504796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="144094785"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="144094785"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:04:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DDB04DC648
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:04:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 18F64D605E
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:04:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D81E2005019B
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:04:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 574321A0072;
	Tue, 26 Dec 2023 15:04:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libmbim: upgrade 1.31.1 -> 1.31.2
Date: Tue, 26 Dec 2023 15:03:39 +0800
Message-Id: <1703574219-12847-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10--0.533800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45tRaF9dDGxRGaDCzqDR7DPZqp573tpzEIwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFJUGD7FLAoialKq6D7GPqJiSia
	62+HM5NOuMo6HEjYqR6+IrPJzi83uadsRhKbzm37puyhm/oaSslY/imrbl12lgExkIYkY5r+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107791

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.31.1.bb => libmbim_1.31.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.31.1.bb => libmbim_1.31.2.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.1.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.31.1.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
index 7001d3e36..b7bb399e2 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.1.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.31.2.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit meson pkgconfig bash-completion gobject-introspection
 
-SRCREV = "db0f5a09d4d29145620b81df0fdd8f4786a8fb59"
+SRCREV = "9c0309fcd3142411c921c14f7dd675cac086bab6"
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


