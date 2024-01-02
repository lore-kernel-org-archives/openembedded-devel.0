Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64CDC47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:02:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.24319.1704178932006673440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145060391"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145060391"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:02:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B274DCC15
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:02:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BBABF68B7
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:02:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AAEC6B4DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:02:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B670E1A0070;
	Tue,  2 Jan 2024 15:02:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] feh: upgrade 3.10.1 -> 3.10.2
Date: Tue,  2 Jan 2024 15:01:51 +0800
Message-Id: <1704178911-7769-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-4.658200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuMCqmhXL/EWtEQ
	LJPlYQqEopYWyJNulHjGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat0540uNdcZDLqeUhEz
	I3+mkzieOzi7rdvouW9sZPvxQgOeY5UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO0JC+
	VZi2gQEd3fSJ9r5X1OmPCIGcYDodV+l2VKujdzRkSyNNJfl41tIvcLTuKS5zFgx0CeZjuQJYn/+
	ioVX6vIv4tsZKbeyrVpcFNrq7wl3fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107992

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Fix crash in right-click / menu rendering code on some distributions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.10.1.bb => feh_3.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.10.1.bb => feh_3.10.2.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.10.1.bb b/meta-oe/recipes-graphics/feh/feh_3.10.2.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.10.1.bb
rename to meta-oe/recipes-graphics/feh/feh_3.10.2.bb
index 40145b873..2c38ce614 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.10.1.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.10.2.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "ec5e44d3cfe6f50f1c64f28a6f0225d958f4f4621726d9c2a04b5a32e5106d23"
+SRC_URI[sha256sum] = "5f94a77de25c5398876f0cf431612d782b842f4db154d2139b778c8f196e8969"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.34.1


