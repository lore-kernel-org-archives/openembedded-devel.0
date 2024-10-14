Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF897CFC513
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.50485.1728896159019919912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ru6gV6JA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896160; x=1760432160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EDjLfK6S1XnJoN7NazWqZKWXXDYOYBWRMh+3ugGVoiA=;
  b=ru6gV6JA/+Qi9f2D5BXM/FhEd3fvho/7rt93n82PesybTstM6wVTIA1V
   ABivhEYpr4FNrUMC4ZHI60V7VfMKVsJX1Dbks82ZgRQFm+7FFtsuQCQWj
   I9aP9RH91ZNgJGyeIf2gIX97ymgs/WRgVqUudnoQ1ih3I/bWxZfpTd8Dx
   2UNNHZBgUkWgvyzKsfFxa0bE4TBr9AOMQa+NrJtvrJGrolBf9vrn2ByCg
   4Z4ub0xZ2dNgTgckkuZQFEI0j4oD2BUvcTe6dJRvnVa11UwLC78qzeo+q
   ZSkKQn/vAJ/rSpDdNYaqzjvIIFLBJ2X6VuKRaIzp8ES5t+Akj0e1vIpEe
   w==;
X-CSE-ConnectionGUID: hkJfZ/ulSGm2F+Gu+KbSJg==
X-CSE-MsgGUID: wY32obimTOGHQ4TTvbKRZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176739233"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176739233"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 94F47D29EA
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D89E3D7749
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F6BC200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1AD3F1A01ED;
	Mon, 14 Oct 2024 16:55:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/54] gnome-console: upgrade 47.0 -> 47.1
Date: Mon, 14 Oct 2024 16:54:25 +0800
Message-Id: <1728896115-2944-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.708200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTSz0JdEAJbTfKapXkCLRBT4/
	Ax9M2YkYKblw5AV0O1kNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl3SnHvydN6NLdhe
	Os3VwtZ+Wqc7iWjI8pdwrx2kjaXrWr78SC5iivxwURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2mZ3
	96Gt5Hhbw3XkF4oyn+xZ00dwxvdA897Lca0eS5k4p5cGKNHZcC3etxXiPKvdKcYk4JYiMj9rRkn
	BK9UDQJ5yYr7V8qrcH4ijnHqOIZPfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112855

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Some minor build issues on certain platforms have been ironed out

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-console_47.0.bb => gnome-console_47.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-console/{gnome-console_47.0.bb => gnome-console_47.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
rename to meta-gnome/recipes-gnome/gnome-console/gnome-console_47.1.bb
index 8785ca013..fd1e98a99 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.1.bb
@@ -18,7 +18,7 @@ DEPENDS = " \
     vte \
 "
 SRC_URI += "file://0001-include-locale.h-for-setlocale.patch"
-SRC_URI[archive.sha256sum] = "487ec0de0a24f12ef6f778e4aee98d744a9dcc921c9e7df98b2d9f410b00ef52"
+SRC_URI[archive.sha256sum] = "d3f600b45b51716691aee92870332e9c9a8ca89d553565f3131d9e28074725d0"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
-- 
2.34.1


