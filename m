Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2E3C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:04:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.7351.1704722667906375658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145720102"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145720102"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 23:04:25 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BF71D6479
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:04:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BF987D9C99
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:04:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 54EE8202CA247
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:04:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10E181A0072;
	Mon,  8 Jan 2024 22:04:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] zenity: upgrade 4.0.0 -> 4.0.1
Date: Mon,  8 Jan 2024 22:03:45 +0800
Message-Id: <1704722625-31271-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28108.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28108.000
X-TMASE-Result: 10--12.734000-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeU7FaDt0Ph3eOCG
	89wh97wnJNe/yL58XWfmxW/PTt1cU6jpzy1lPvv7PPov5T+l6PFN8rmPQRlvKzABh2rVVNejO5G
	gDUtVs9TC6WewxLMF+LKwxc3xyHYmATh1ufKMwlr8dMpK2wMYwsE5XPQnBzGXkZQXc2Em7eL5r/
	N0c4ndad175zSDPs2MeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8h+ICquNi0WJN53X
	NVsYVDf5HinR7TtJdmwV30mzf4xCOCDQE3O43NmftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 14:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108167

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
  - Bump webkit2gtk requirement in README
  - about: The licence is LGPL2.1+, not GPL
  - entry: Calculate number of --entry-text's properly
  - test: Add entry test in response to issue #75
  - question: fix option --default-cancel
  - calendar: Fix off-by-one in day
  - test: Add test for --calendar

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/zenity/{zenity_4.0.0.bb => zenity_4.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_4.0.0.bb => zenity_4.0.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_4.0.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/zenity/zenity_4.0.0.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
index a151f3ca4..50e5eaa79 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_4.0.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 GTKIC_VERSION = "4"
 
-SRC_URI[archive.sha256sum] = "0b8c8def18dab05cc49bd464b90ca7f945ae52ff5e09242da702a15d94d3e8dd"
+SRC_URI[archive.sha256sum] = "0c2f537813b10f728470d9d05d6c95713db2512f9c95096e1e85b1a6739605e6"
 
 PACKAGECONFIG ?= "webkitgtk"
 PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
-- 
2.34.1


