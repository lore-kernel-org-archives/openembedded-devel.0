Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352ABC7EE37
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.6189.1684997791271623627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117813312"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117813312"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C1C59C68E7
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DA67D3F37
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C8A02007CA83;
	Thu, 25 May 2023 15:56:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] grilo: upgrade 0.3.15 -> 0.3.16
Date: Thu, 25 May 2023 14:56:11 +0800
Message-Id: <1684997777-2061-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--2.350000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuwZuykSn6+/ES3
	N7Ud/ZNyNCFxe2F2fwuysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG2fAC
	YDlYCW/p8f0NPaF474vBRlLev884crWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQJK8mZDiJD6yk2Re9EXG1ZbkhVYjTcCfjBvOs0v7OjiDEh7tl+mq9XXkkjecXXXDkOAC
	ENB0YeE9mHb4I4zZQL4OXJD8x8dCfK+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102808

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* !94 Fix usage of depcreated GSimpleAsyncResult
* !95 Build updates. Meson requirement is now 0.62.
* !96 Fix build on Darwin

* Updated translations
  * Turkish
  * Georgian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/grilo/{grilo_0.3.15.bb => grilo_0.3.16.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo_0.3.15.bb => grilo_0.3.16.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb
rename to meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
index 526a8593d..e86f75f0c 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -11,7 +11,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc gettext vala
 
-SRC_URI[archive.sha256sum] = "f352acf73665669934270636fede66b52da6801fe20f638c4048ab2678577b2d"
+SRC_URI[archive.sha256sum] = "884580e8c5ece280df23aa63ff5234b7d48988a404df7d6bfccd1e77b473bd96"
 
 GIR_MESON_OPTION = "enable-introspection"
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
-- 
2.34.1


