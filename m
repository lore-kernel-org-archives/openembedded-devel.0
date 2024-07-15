Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B78EC52D70
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.33786.1721034178267353362
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tC2Dva9t;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034178; x=1752570178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HmWTTa5KYTkPSLobWoPFNwKexj4VS1VNl1c3G9sdyqs=;
  b=tC2Dva9tRmZD1yn6rd3yPyvK45Z4iRABbVtWr9igtdqC920C2sumqEpi
   p7/5MX9a+0nRfCWDBH7mLc+br+4CgOuxs5fZScl5sxix82HRerFprqC3W
   rOmHbcjldrFsLvyjgwUEY5Hr+vKCQfLV/cj2nFl+p0eHqCV/54R/j8SWf
   i+OVNXDO3PaDCCWdEHg36z9U8Kvw+pS4MaO2GcD4HH8J7ji5bgALWWccg
   HThIOw4nZqt9+qDPi19JVoJh+WHMugbWmmxFaEqG/NP6FtuwgE6FTALrO
   VWfhUHEEWhex+57m+y0jw2ZKhTqdXe0/fmGmLYaHP3CR2ij3NGhKTiBaj
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145800152"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145800152"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9C14CD6DF
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32CE6EA42
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC5A76BE58
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CD611A000A;
	Mon, 15 Jul 2024 17:02:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/38] imlib2: upgrade 1.12.2 -> 1.12.3
Date: Mon, 15 Jul 2024 17:01:59 +0800
Message-Id: <1721034151-540-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--5.292100-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwYdZqQlzVQvCia
	SqRpkfBtrOI+jXSxGUJ/6kMd15bGDE7UHashjhuhGqSG/c50XgNa4WbtOovh4Z+9KccEt4MqE30
	6PBkcOcu2rwVjsoIsWzRYg4cC1sv+B6eh+olhsrBwVI/K7LcRBEld5Rsl9tmXB/FMznsE8cMJ54
	+edfoO41LFNpfGeNnixTq+ZVXbVzhaQiLka9EcSk7nLUqYrlslFIuBIWrdOePfUZT83lbkENb2e
	7N2CFQyOjZrXRc9lVQwG976HzCdRh8TzIzimOwPur1QVFMnSQrEQdG7H66TyH4gKq42LRYkiwGy
	0giPYKhc4oJHi+v8B8jbuRe/dpcy1o+qE3yg2EN+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111327

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Y4M loader: add support for full range color
- Y4M loader: add support for 10-bit 4:2:0
- XPM loader: Fix potential segv on malformed file
- imlib2_load: Add crc32 printout
- test: Corrections for for libjxl-0.10
- XPM loader: Fix some color table parsing errors
- XPM loader: Major overhaul
- test_load_2: Add full range color y4m image
- test_load_2: Add some more y4m test images
- Some cleanups in asm code
- Add endbr32/64 instruction at the start of asm functions
- Add missing CET (Control-flow Enforcement Technology) bits in asm code
- imlib2_view: Use poll(), not select()
- imlib2_view: Minor cleanup
- imlib2_view: Enable an alternate background color set (red/green)
- imlib2_view: Optionally disable final anti-aliased rendering
- imlib2_view: Rename scaling variables
- imlib2_view: Optionally scale on input
- imlib2_view: Enable specifying border
- Y4M loader: Fix frame size calculation for 10-bit 4:2:0 format
- imlib2_view: Enable specifying background checkerboard colors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 87e7ed4a6..8e5febd7a 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-PV = "1.12.2"
-SRCREV = "a860e34b19af6b0a73d86ddc0e4829145e18fa6e"
+PV = "1.12.3"
+SRCREV = "143c60194c0948aac484d37bb23c59edea2ccf19"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.34.1


