Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB97FC87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:34:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.13444.1754296450367403498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OVyfY3S7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296449; x=1785832449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/IjE/mNkfusU/zIJkMBc9gOMjUpBlJIFqyadSaeZBac=;
  b=OVyfY3S7O4CglcrtUU3z33SYfg+c/WySqn5SOd7Kei0p4maN+iUZ3N4W
   0m/G2iJGmLdZvyLX/QDmlON8geT6172US0adv6oj/gyds/PXux8syWzwu
   4UllAYB2X2B7Ju+F808xOMsi6hFrXmAoF8rYj1z/gsEcCn55MTSjW4VMD
   eoxqLZcsy8MF2PUway0esU988/4MO3kEYFqwidPLsV4aDMZj5IvvCnh1V
   6gsuTHcG0ttuLhJE7wqzleYsZpn0TtL/sVZ0+3TMY0hayhy3pVLk6rmGg
   J+d4imHTQeqqNzAUoZlLvonWIkao5+1kAfmyJPVRKXHOavesykz0k6suh
   Q==;
X-CSE-ConnectionGUID: NBHi7PqWScSM0bwK/7ypvQ==
X-CSE-MsgGUID: BLNuZ4fHQIOjddSSI8iD8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="196325422"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="196325422"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:34:01 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D9FD9820405
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 533B0844BEC
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:34:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A25C1A0090;
	Mon,  4 Aug 2025 16:33:59 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/18] xgamma: upgrade 1.0.7 -> 1.0.8
Date: Mon,  4 Aug 2025 16:33:40 +0800
Message-ID: <20250804083340.1649-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118851

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xgamma_1.0.7.bb => xgamma_1.0.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xgamma_1.0.7.bb => xgamma_1.0.8.bb} (80%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.8.bb
similarity index 80%
rename from meta-oe/recipes-graphics/xorg-app/xgamma_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/xgamma_1.0.8.bb
index dc9cbadb4c..1f1a9b51bf 100644
--- a/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xgamma_1.0.8.bb
@@ -12,4 +12,4 @@ DEPENDS += "libxxf86vm"
 BBCLASSEXTEND = "native"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "1c79dae85a8953a15f4fe5c2895a033307b43b8613456c87ec47b374b113bc8f"
+SRC_URI[sha256sum] = "98f9f69e53a11c354a6637ea5c3d7699ceb5c5b1f8ad6f0a14d9931e5a10d079"
-- 
2.43.0


