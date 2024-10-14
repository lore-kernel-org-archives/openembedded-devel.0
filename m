Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248FECFC51B
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.50351.1728896186753350115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bF7WOype;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896187; x=1760432187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wCmEYMO9K9BuchT+TmV32uezGb919+Q4r8A/fDpw3bI=;
  b=bF7WOypel8FhBlllwgFL0psgwJYeFyfxhUpBSyCAkbzST/WRSt5APd0C
   9TqLT+WPY7FrtRrOQn1EKPnsCri4caxgoxH1el7rPuSyB13S2tRb7da34
   1us6S5KnrZIYKPOv7p6ZXsG3E6utPUQO4g4WxtCcUKtaW0UbIlzTjQLDo
   m0qD6xFtYotmEzzE4qL1TKSUwJzImCnA4AVl4LZ211XZrwaSmnNxBqlOP
   kWT/cJb8mCCOZRI9B42Ylv0HVhUkYJGvbPukFkfLwu9Isk0lU6YPkQY0i
   KPhEygGSFOrtngx6WhOexV600OipYlFZ80kbBCNjt/yw0B3PaDt+LghQ4
   Q==;
X-CSE-ConnectionGUID: bTt7eVBNSxC+obzgq33xMA==
X-CSE-MsgGUID: /yYns0umSieexTG9BUporw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155665626"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155665626"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:25 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B0831C68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 00CF5D3F00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 811476B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2EED61A01ED;
	Mon, 14 Oct 2024 16:56:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 54/54] xwud: upgrade 1.0.6 -> 1.0.7
Date: Mon, 14 Oct 2024 16:55:15 +0800
Message-Id: <1728896115-2944-54-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--3.424200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrXLILvyEBT84kt9BigJAcVr+t
	q1VA6JMRt/w+sxk1xuNU+/f9Sgofe7xTpz2zW+LJExdS7WFvZWtMkOX0UoduuZrlnRPQNUDst9h
	PnlbRrOz7tBxFpWhryf+1065WI2+4L/tBTZzO5Q25x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLlQb89pODkB+s8zwAhZRWD8mQb+K8F4PigovRxRvH9u78O+
	331NdxS+YpXJb/SiEWpbMm9zFtKE7/4vK1KNgS5ngH0gzFEHyRLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112904

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Accept --help & --version as aliases to -help & -version
- Replace strcpy+strcat calls with snprintf
- Call free() instead of XFree() on pointers returned by malloc()
- Add missing checks for malloc failure
- gitlab CI: stop requiring Signed-off-by in commits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xwud_1.0.6.bb => xwud_1.0.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwud_1.0.6.bb => xwud_1.0.7.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.7.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-app/xwud_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xwud_1.0.7.bb
index 1be0b5cd7..27138f23f 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.7.bb
@@ -9,4 +9,4 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=31e8892c80b7a0c1c5f37c8e8ae6d794"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe"
+SRC_URI[sha256sum] = "e55cbedab36d7a5f671abf8e594888afc48caa116d51d429ea53ea317ec0c61e"
-- 
2.34.1


