Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175CCCDD57A
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11425.1726716751774462316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qQeTnAs8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716751; x=1758252751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vodzXF9ViaVq1+7bZ0fMwFq0+ZI2CFKpYKNfCinWiGY=;
  b=qQeTnAs8I686aRqusTnHBNKzY0Z5kG4rgCv8zWadBKBEnmXwfXSU1j+i
   94PMgeHqGntUWNveF36d3VQZs/1X/5jwwy/QAXOmxO5rk3ivUOiZbjtw9
   n2H0GNHBJuEenx+VJfDRB9y717T06UEPSfUHDXMthOdRtDsN0+x92R4G2
   4vWBbnMIBt/4ociIF553Sxzp+2DxPbBFDYZxdbUKKSdgNqmAwfe3fI2Hx
   BbyhHYvb5KvLzStgxxQ3fCFHVaurcQoBN5JmJDA1i2uG6lOQrDQNWt5Z2
   3/yu1wF6NHHtbQ2oflPgIbHviY1/h4wD3TJUCSGoldpHiI1C3WmkY1bF6
   w==;
X-CSE-ConnectionGUID: exYjdbJTSnqpmSjqgLHUdg==
X-CSE-MsgGUID: 90f+zXY1Qju9YTEYUNjxPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174296107"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174296107"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 05576CC156
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D168D8BBE
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB15120086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 71CC21A000A;
	Thu, 19 Sep 2024 11:32:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/28] gnome-backgrounds: upgrade 46.0 -> 47.0
Date: Thu, 19 Sep 2024 11:31:48 +0800
Message-Id: <1726716733-14548-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--1.990800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrmZiw53dqSN/C1bR90F5zy/ua
	SP/CbKNhZ9nUvuZj6VlS/NtZ5e6UJT13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKQ11mw48K93s3PhwfmFb3pieAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNRmMVWQN9sThnkQRFNBVCUQRyu3XnpXaNTIfOWM7YdLgGrLKAuJ0nd/svBGIgM/BQ91h2
	4KAO7JF8Kh/aaYVbPbJlN8V8GNU5A3c16/xWjPxU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112364

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- default: adjusted optics
- lcd,lcd-rainbow: nostalgia pixels
- map: geometric vectors
- pills: shading improvements
- sheet: curvy curtain
- swoosh: classic gradients
- symbolic-soup: noisier than usual

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-backgrounds_46.0.bb => gnome-backgrounds_47.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_46.0.bb => gnome-backgrounds_47.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
index d938ae94c..8774750e9 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_47.0.bb
@@ -6,7 +6,7 @@ SECTION = "x11/gnome"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "4ddd3ac439a4a067876805921bb75f4d3c8b85a218d47c276dddde8928443c2e"
+SRC_URI[archive.sha256sum] = "874a4a39c4261736f6a854722833400b612441c4681aa5982d90b15abc9c91fd"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.34.1


