Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9EFD29F9F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:33:04 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.40154.1730874775709442830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g3WLihGj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874776; x=1762410776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zzKUdysX5mytcIo1lGIooBSFLZ1StPLzDxJLWoxamj8=;
  b=g3WLihGjUoJw2gzEpqeGl7YjvisIooTDhvKjLpORn1W6Gpecz6QqrSAu
   UL+lMQWWetvNEnVDsmKVlt2Uyhkbxl8mfV7MX+yhRxTR+jBVW5gvHRJE7
   oxNCiRAG7q1BvpY/iUqaw6/UwcdgJatvMRAejzlw+FAT0kUMOgs6jGPIm
   TkmEix/s0hirHyfeYnuhkKSqYCi5lCP2mf9HI0saNF0vjUzA337NsiyDr
   tJ+3ZL8AJ0jV+BAZG+9YO8qn0K499NrihY+Jp7HtQKqJugCG4S2U7PgHQ
   LQDv7HU+Ip+QPg8pJIaLyWJygdZeE+TxgnlAQ9gK6SWDdcE30EY5QYxiw
   g==;
X-CSE-ConnectionGUID: JpAIm5hPTDW/F48Ml0LWig==
X-CSE-MsgGUID: G3AXpI/0T0a0v+4H+TG4Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="181534212"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="181534212"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:32:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7117ADB172
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A49BD50E8
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28D736B5E7
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:32:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CCBEF1A01E9;
	Wed,  6 Nov 2024 14:32:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/46] python3-zeroconf: upgrade 0.135.0 -> 0.136.0
Date: Wed,  6 Nov 2024 14:30:57 +0800
Message-Id: <1730874660-2364-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-6.303700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbys8fOhOxCEdUWdv
	IBM8UuLSxmH4vckL1LUNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSz/0XMJYfpi/YX7AlQI2uSFlwV2iaAfSWcURSScn+QSXt0H8LFZNFG7hqz53n/yPnrab1
	MXVm3wfo6P5ez7mN1toa4VBKBV2FxwEMnSuB6IivYJc8E2d84IYTw93vDaQU9VLg9paBt175B13
	YIFfUO7OaNVYuxObQk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113727

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: License changed to  LGPL-2.1-or-later

Changelog:
===========
- fix: update python-semantic-release to fix release process
- fix: add ignore for .c file for wheels
- fix: correct typos
- feat: use SPDX license identifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-zeroconf_0.135.0.bb => python3-zeroconf_0.136.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.135.0.bb => python3-zeroconf_0.136.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.135.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.135.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
index e72e12512..a9bbdb4bf 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.135.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
 HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "9424551ef5a8d91fa8296bb1791e83b31afcd17a336a071928d4a978d7b96b72"
+SRC_URI[sha256sum] = "7a82c7bd0327266ef9f04a5272b0bb79812ddcefccf944320b5f3519586bbc82"
 
 DEPENDS += "python3-cython-native"
 
-- 
2.34.1


