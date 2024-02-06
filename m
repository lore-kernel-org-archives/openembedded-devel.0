Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2600EC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:11:44 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.16625.1707203502691636755
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Er4OoSEK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707203503; x=1738739503;
  h=from:to:cc:subject:date:message-id;
  bh=F0T3MYCYLLNXOirp2PqhNVXYWdGgx9u/o0nfnuKr9nY=;
  b=Er4OoSEK/l73pj9FWD89ycvXQOexqf2L95pRgOFmCtV9Xo9Qi8gIE7eU
   F4qq/T4Yc+SGjRoSFclIkC76ROJW9UO7VygIUNSYar/HYGa6FipqOwPet
   ReEq4bLPN6GJ7oLtZs/Jh+sMh1iSFK3uRlcfXk4qCqUkSGzr2Jjgvd0FB
   Xyd6EQswPo5UZAVQfgum7S9oPygBt56eFv0ODmfndSjQadLenwHvmpaN1
   NqYP3zEhzQwNqDNlYU2Z1lrnssRH5LETtGZcrMerMGDnZj88WwhHDaRe7
   Gx9+vNhqOiMUgHmeqDfczAkWLHDvvZcJK1ct4cPWmr/swOaAQPWW+sgCN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148528425"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148528425"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:11:41 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FB152274B4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:11:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BD2D058B5D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:11:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F9052007912F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:11:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE3FD1A009A;
	Tue,  6 Feb 2024 15:11:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] geos: upgrade 3.12.0 -> 3.12.1
Date: Tue,  6 Feb 2024 15:02:40 +0800
Message-Id: <1707202960-4260-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-0.930000-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+7N2IdiDgmM9SH
	nJDq2yhMraob308tFzflquFQUveoZZ5J+7N3Y1PFOi2Z4ChFwXW6G/3hYXpyaeTpBuL72LoPZlj
	9F1etQo0XPuR5vfaVz3VUSbHuxOT/9zYU6zlEINt/ODLXjcZ5ndXLiEcLf+DIsrDwfHQQaK2/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IVKDZlLBSf8qwN+CmNIOQU3rixttRG+E/OBbptjxI6rdaPFj
	JEFr+olKE0Je8DR/D4Es/H1wMyspk2PpYDcSQM8+gtHj7OwNO1FwNIqCPogbdWopje4QMUzG8Q1
	L6++iRLhGtoru+ZMn8f7WWJM25vEdz7WgCDwkC/fAdHbQc5y5lTqS/TvM9lTwmLifEgfEUM6yjn
	o653scvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108589

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Remove undefined behaviour in use of null PrecisionModel
- Explicitly set endianness for some tests so that output matches expected
- Fix IncrementalDelaunayTriangulator to ensure triangulation boundary is convex
- Improve scale handling for PrecisionModel
- Fix PreparedLineStringDistance for lines within envelope and polygons
- Fix error in CoordinateSequence::add when disallowing repeated points
- Fix InteriorPointPoint to handle empty elements
- Skip over testing empty distances for mixed collections.
- Fix TopologyPreservingSimplifier endpoint handling to avoid self-intersections
- Build warnings with Visual Studio
- Fix CMake on Windows with Visual Studio

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/geos/{geos_3.12.0.bb => geos_3.12.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geos/{geos_3.12.0.bb => geos_3.12.1.bb} (88%)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/recipes-navigation/geos/geos_3.12.1.bb
similarity index 88%
rename from meta-oe/recipes-navigation/geos/geos_3.12.0.bb
rename to meta-oe/recipes-navigation/geos/geos_3.12.1.bb
index 0382e6bdf..461652a5a 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.12.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "d96db96011259178a35555a0f6d6e75a739e52a495a6b2aa5efb3d75390fbc39"
+SRC_URI[sha256sum] = "d6ea7e492224b51193e8244fe3ec17c4d44d0777f3c32ca4fb171140549a0d03"
 
 inherit cmake pkgconfig binconfig
 
-- 
2.34.1


