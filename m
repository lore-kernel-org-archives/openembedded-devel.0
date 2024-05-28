Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997EBC25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.12850.1716860962738437083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eIKKT/IH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860962; x=1748396962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Pkifv2gpwCtUCJlHjb3x4gfqBsF9uDher8nhu/E1idM=;
  b=eIKKT/IHatDYXjWT+ZJth++LmFQ4IZ5AY1luFd5VsOllkoGc7IXMkt07
   Twfyr0kT5BGpfeC7BZbLXZTdhlSjlSHjH7EkedzoQnR2aYKgJc4bQzQr6
   ucZBl7D0qTVgAjWYTlhD8SnE35jai6h0cb2Hs2MVBghjP0I4xerfG37Mp
   1eePzESJQLaq+yszxxDcoJRJ5EpCsusz6Y9O2PbT/6M5ZLPFR1wuhm3cY
   29d6q06OQzHbdkKSrCDS1/JfsI7bUhk70gfPgb9JyjcgTsO5ri9FLXJE6
   8+2Tcbqd3XGoA0TcdJTNJmj+2INTWR+pzDWV3D98bkLNiscfuxDPhoRXE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139360143"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139360143"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 38F20DB3C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A97BD7B6C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D74A2007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B07451A000A;
	Tue, 28 May 2024 09:49:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 10/40] msgraph: upgrade 0.2.1 -> 0.2.2
Date: Tue, 28 May 2024 09:47:51 +0800
Message-Id: <1716860901-863-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--1.812700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqw2IB8TTQDNxE+R
	25DV/fo6mOG6gAhSq4CYpL1Mc22p5CupJvqHf1A8uce7gFxhKa1UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmibAGOCaWkxjvQ0D4MTphfBARryDXHx6oXF0dfZ5kV9l87eK
	BFNfX9iiW0Qe8VYXBBLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07aLm7
	9W+wVod14IdsS40T2Uk/rM92HTAv+gjZRajh1pucEL7Wl0HD3MMDGzw7jDAF0ra3Xyoxmcn5/s1
	OEqif8I015yF7REPlxLs0eC9kPfD8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110545

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Add remote copy and move functions
 * Drop Authorization header during download
 * Fix browsing shared files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../msgraph/{msgraph_0.2.1.bb => msgraph_0.2.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/msgraph/{msgraph_0.2.1.bb => msgraph_0.2.2.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.2.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
rename to meta-gnome/recipes-gnome/msgraph/msgraph_0.2.2.bb
index 9b4a8a035..a4b434950 100644
--- a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 inherit gnomebase gobject-introspection gi-docgen features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "e0e59eaa8ae3e0a48ec0a6c2fed0470856a709248e9212b6a1d037de5792ecbb"
+SRC_URI[archive.sha256sum] = "12cc954f750bb137ace8500fe9355d26e6e00ef6ccaab2950e9d360e92758335"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


