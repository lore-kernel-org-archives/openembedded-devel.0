Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D575C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:05:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.76211.1703574341879317881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="123395454"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="123395454"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:05:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A05EDC646
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:05:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AEA7FD605E
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:05:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 362C32005019B
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:05:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E58DD1A0072;
	Tue, 26 Dec 2023 15:05:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.34.0 -> 1.35.1
Date: Tue, 26 Dec 2023 15:04:59 +0800
Message-Id: <1703574299-12902-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.005
X-TMASE-Result: 10--0.533800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45tRaF9dDGxRGaDCzqDR7DPZqp573tpzEI4Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJKLDMhoqoO0WeIAdL6HrUB16HFKjaoMQreXB
	gy1gT6K56wczsXZ8sq9INbyQmV/tn65wmcK6k9Yc++2neMoh9SJp2qbzP6qpH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107792

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libqmi/{libqmi_1.34.0.bb => libqmi_1.35.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.34.0.bb => libqmi_1.35.1.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb
index 2cb843a4a..87d354602 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.34.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit meson pkgconfig bash-completion gobject-introspection
 
-SRCREV = "3f07d6e5b4677558543b3b4484ea88ad92257e92"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-34"
+SRCREV = "7bb160c70ecd4d8f47ae5c228a85c6a6cf4e4bdd"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


