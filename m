Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B4FC7EE32
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2112.1685951608819877749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="119448619"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="119448619"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 99D75DDC63
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:24 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7191D501A
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E00532FC85E5;
	Mon,  5 Jun 2023 16:53:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xwd: upgrade 1.0.8 -> 1.0.9
Date: Mon,  5 Jun 2023 15:52:59 +0800
Message-Id: <1685951589-29920-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-2.524800-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrC//1TMV5chPuaxAtXRNprEsw
	gej8gTmBzIO4dXAjcKoHMSexFgmXDh8Tk9GCGwwdEhGH3CRdKUVd6Qtc34VCorqln+jYe7ZhyPZ
	WszY8usAwH5gPcpNPxu4ATLndji0uK6km+od/UDyfrLSY2RbRpEyQ5fRSh265muWdE9A1QOy32E
	+eVtGs7Pu0HEWlaGvJ/7XTrlYjb7gv+0FNnM7lDbnHu4BcYSmtAUDqlLFoMeaBbptjxI6rdaPFj
	JEFr+oldywMrbEEeHuNo+PRbWqfRMZW5ai5WKly9yDM423aaNqguEeuiF8koGYl5LpBbmPgMyzv
	V/9qR9ohmJBHNJW7nJ7s+yDoDoHQK91FFyxHXjGNvsIoJD1UNETBpRKX/DQS/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103115

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Make -help & -version work without requiring an open display
list.c: Stop building functions that are never called
Delete commented-out local copy of list function prototypes
Variable scope reduction as recommended by cppcheck
Remove unnecessary casts from malloc() and free() calls
Handle -Wcomma warnings from clang
Remove unused macros
gitlab CI: stop requiring Signed-off-by in commits
Build xz tarballs instead of bzip2
gitlab CI: add a basic build test
Fix spelling/wording issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xwd_1.0.8.bb => xwd_1.0.9.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwd_1.0.8.bb => xwd_1.0.9.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.8.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.9.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/xwd_1.0.8.bb
rename to meta-oe/recipes-graphics/xorg-app/xwd_1.0.9.bb
index 44b9c80d73..4a05a4437a 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.8.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.9.bb
@@ -7,4 +7,5 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0cdb783e9a0198237371fdaa26a18bf"
 DEPENDS = "libxmu libxkbfile"
 
-SRC_URI[sha256sum] = "fbaa2b34163714fe7be22b60920ea4683f63b355babb1781aec2e452a033031b"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "dc121b84947eb4a3d1131bff1e9844cfa2124d95b47b35f9932340fa931fbd3f"
-- 
2.34.1


