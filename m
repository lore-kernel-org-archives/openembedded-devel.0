Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13DDC27C43
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.12685.1716860966004007114
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FLwfE3lC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860966; x=1748396966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Mh1AClOADjMsPppgkkhGcDSRd/B0TWD6eotCFahr/i4=;
  b=FLwfE3lCTwkvANaja2JwLSCSQL2FKsIJgPk8rkXR5QE+Xpi4lxW6vfYo
   Mh12L58eOyNJIlFOyHT73RvvCfUaanaigYwfrslptymD2UT7DOeSL9AqZ
   Lpqgiwhw/JGvpf8zc6uSjE6jdoVX/cMvppxd+NkQR9NBy6jKli/BG+mHI
   zmJ6dUYWbbDuN69zS1BerY5tiZZWUneTgTO2tPO0jYFddSz43k356oNP8
   WQnZzx6sPagJIPglCEO0Ghqpx4k+hKeqFxZU5FDR+fAkkHkAmPI3eTTHR
   yOLSye41v4OjjL+C3GwB33XQEDPuP5dkwA7Zqqn7aneFCRSSOaPMjWBZn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="162370504"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="162370504"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C12ACA1E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D0BEDBF4B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65A8B41063
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 136B71A000A;
	Tue, 28 May 2024 09:49:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 11/40] nautilus: upgrade 46.1 -> 46.2
Date: Tue, 28 May 2024 09:47:52 +0800
Message-Id: <1716860901-863-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-2.155300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr5bMmdOYs/G/IPbn2oQhptY3E
	akIoHWNdHyHoadGDu+fQQxIbVlM8FZV3eQoqkpPnA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYlxD8VfJsTjmyGOiXr1rOL60CVXYvqmAUXcF/0kiqyh4Stxxn32stFgl2F
	OhQ0H97rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLNhLB7spdKxKslZi
	Wj2/Nx0TCoLWCeb4aLROhYnO1t7rLrKmhZmuASiRkGnXxwd70Ny8JJQ/CtpQlPaYwzl6EfSqo6w
	v6XDbGyIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110546

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Don't treat future dates as "Today"
- Fix crashes
- Prevent freeze on Audio/Video properties
- Don't irreversibly hide sidebar with touch gesture
- Don't expose unreadable symbol to screen reader
- Fix search selection performance
- Fix sorting on grid view

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_46.1.bb => nautilus_46.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_46.1.bb => nautilus_46.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_46.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_46.2.bb
index 4092ff9dd..30e0681ae 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_46.2.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "cc1a5fdf1dd72f92e9e3f3c7ad263709a0de5391a895be9344f6a67f43887bd7"
+SRC_URI[archive.sha256sum] = "6ee8c99019b9e3447f6918d68232a20deca89e5525c05805432b7d8840ca71fa"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.34.1


