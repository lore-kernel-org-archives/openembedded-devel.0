Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D215C5478A
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.37318.1708333362255109373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o3NQXydu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333365; x=1739869365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o//u9WFEE3AjAcVPmJSkQfF3hC6qKTvy2MVQo2JnaB8=;
  b=o3NQXyduJQauQBlUESzQJYPT76MCjOmCGzlQoz5bKcIsEohh+zge8XqR
   v1+vfh7SoInNOwgt4uGXU5VOuGdJLhXjSeTnUvwQmQE6Urj6dUkK8zQLP
   1EJ2wDyCcWQZe24lTGNz87VEUV7LGVg1raw/hIckHzzWu+2s+MzPk4KBF
   /E/nuD7uKuzzqsdHixhTDTfP8ZJ8hJGoflxuz8UhYe3O15asgf6jU22tg
   M+dNO/CC+n4Ym9phsC2NF3H2MnQYD1LVWX2SBaWupt00qc7OsOAkET4wQ
   KPD3v18xxE16YbKT24919zCJ8GLyTKiMekvdnP+mS4BwD0IP+JtN04wnO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149230097"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149230097"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:44 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 17DF74DA5D9
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F09FD7795
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A79B622CADB
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 538E31A006B;
	Mon, 19 Feb 2024 17:02:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/23] libmanette: upgrade 0.2.6 -> 0.2.7
Date: Mon, 19 Feb 2024 17:02:12 +0800
Message-Id: <1708333346-17704-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--3.340600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfOt5s9kBup6GJZ9
	IbzcSt3i5ZHdquAwKoGX9moRF8wW9+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4rhX/lUQGcewhKtME2+Ce8nQ0D4MTphfBK4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcoDPOmEhYBKr7nTpkrLpftPuHjdswfT3cR91F
	xrFzvgprhGc4RMnyHtnxV1yoT6lVvhyJHgpoLiYg3UkSOVrCBKdl7iXwZdht/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108853

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Allow building as a static library
* ManetteMappingManager:
 - Strip leading and trailing spaces from mappings
* ManetteMonitor
 - Always use file backend in Flatpak
 - Skip non-evdev devices
 - Fix object construction
* Various cleanups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmanette/{libmanette_0.2.6.bb => libmanette_0.2.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmanette/{libmanette_0.2.6.bb => libmanette_0.2.7.bb} (87%)

diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb
similarity index 87%
rename from meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
rename to meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb
index 5509b0bb0..db0542269 100644
--- a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libevdev libgudev"
 
 SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
-SRC_URI[sha256sum] = "63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac"
+SRC_URI[sha256sum] = "cddd5c02a131072c19c6cde6f2cb2cd57eae7dacb50d14c337efd980baa51a51"
 
 inherit meson pkgconfig gobject-introspection ptest vala
 
-- 
2.34.1


