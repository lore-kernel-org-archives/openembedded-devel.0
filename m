Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56042C30658
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.166843.1719305815138398035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=og5KbWUn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305817; x=1750841817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h0M+Kwiebp8niIGWyAxknghNE7tO3GcI/L98YE2R+Go=;
  b=og5KbWUngpvi/UMZleKcxz55pO7pFqTt0MwT5kriTQUYFF0OMUoT5LMf
   qbQKbNtbOyrGPQoL17aWEdKf+m+fDzS+UUAZdSj40NIJjXPF5VFBbIpVR
   O+DwklkgF7bhh8Kwny0HoagKk8aKBReBQb4+DwTrlLbdn1aXcNHvHTkE8
   3NnZBA3S5nq7yJ+ZpEMZ+eBZoq4RWp81p99QgKzghtKPtj1KSpP4MUxNr
   qo7v04DZWG6ABQI8ZFYxDu4c+jF7kCMsvzs4/9b3owHB74nMp+EU+x53Q
   fZuwO6wLO7FpOH3FwNZ30IHe58sm4GAe9ZCtgnQlIDiDHzti+BFYUhrBf
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164920893"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164920893"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F2FBD648E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB1F7D73B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F3ACE2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D1451A0002;
	Tue, 25 Jun 2024 16:56:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/57] gtkwave: upgrade 3.3.119 -> 3.3.120
Date: Tue, 25 Jun 2024 16:55:41 +0800
Message-Id: <1719305790-11484-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-2.107500-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFosir
	dQwFSTzqKiVY4AyDZ9x97G91giQ9lKZY4PxfRMWE72Rb2bEJC+0sUWjPAeWLoZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q23D7EeeyZCMxCE2NlBjIjcdmicEPU684Oyxs
	SRJfpzSSOK0EQG/QrRgDLqnrRlXrbIDt27MLDp0gGlEJORGTlJ+gtHj7OwNO2I3adjBtsMrELIN
	OKJaVg09k4i1KrMk8CVrAKG+oB7Vk7L9tO1OVCfMrFvxEEXMnKsM0zN2v53pUyx7SDPjqS6v6ip
	al0eAek2h621xUWo2/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add launchable tag in io.github.gtkwave.GTKWave.metainfo.xml.
- Fix memory leak on name in build_hierarchy_array().
- Fix memory leak in ptranslate/ttranslate.
- Fix case of missing newline at EOF for VCD loaders.
- Add escape handling state machine for vars in FST loader.
- Remove escape check on coalesce in FST loader.
- CreateFileMapping() warning fix for win32 compiles.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gtkwave/{gtkwave_3.3.119.bb => gtkwave_3.3.120.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.119.bb => gtkwave_3.3.120.bb} (94%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.120.bb
similarity index 94%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.120.bb
index 0b1b05404..b7807c885 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.120.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "eab3e09e7641115c07848bfb30f7dd0c3bbe2b8cbe45017e95e077dbba6ac038"
+SRC_URI[sha256sum] = "5da94863fb2e5d88cc019e2bfdc676022398113894b585d864e11ca8341b24d8"
 S = "${WORKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \
-- 
2.34.1


