Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF7C05052
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2711.1713318080805752771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RC54DNn7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318080; x=1744854080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+0gZrwSEoptGcYM83YWxOzsE9E+6n75aVgbyVEQFPFA=;
  b=RC54DNn7GlkytEz4GmfSi/UDAxJfkxYp6aJ7pwUOWjT6HR5wmOXtnWu6
   /NhJIvB0Wvqx0HTqTOUc5cdPr7gvK8TTtb2ZmNuqHoA6wssgPpjcDVa8P
   7Z2J4sgkiqfmDVYQENY9JEEm6XjMwFX/Awo/OZmC+PKAQKxnQTi1qd6Ra
   zGMYfp+7JeYpjG9DsNLIS9yNfqpd9NV6vcDpaKucFUXSMLxey6K7xq9Rz
   CjBHpkyLPxPCB9tx3erxxr2oZfXYCylWF6PoKQHWiLCRJBQWpO8PddrBV
   po8tp1Jyxpz2fWdU5vqTuqwPhAg9WaiW38exXwbvTwDbv/zntAO+oDs1I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135076017"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135076017"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:18 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 09EF0E4EBD
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3755816618
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3626200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D7071A0002;
	Wed, 17 Apr 2024 09:41:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/49] adw-gtk3: upgrade 5.2 -> 5.3
Date: Wed, 17 Apr 2024 09:40:14 +0800
Message-Id: <1713318061-17128-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-4.000800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzVgekt4VSKMfUt
	SCGaNXOr1XL9/hzZA0rWSVH9Vt1Vje1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ32S
	61JcPB8fn22EcSrQBne2m4eeglpGzCxH+nTDZ1NPdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtbXz2sWHadfugCXNfNSJsve0Oz5Xlu2XrkNqQ/lj9iT6X4qtllzPzWNfvV
	SFzJ3O+ZKO+NV8APG0q3hdr/9ow+AM1tSk6VVmuHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109988

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add gtk4 theme workflow
-Add create release workflow
-Fix repo name
-Increase padding of switches
-Sidebar border colors
-Add Debian repo info
-Update update-gtk4-theme.yml
-Update gtk4 theme

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.2.bb => adw-gtk3_5.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.2.bb => adw-gtk3_5.3.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.2.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.3.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.2.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.3.bb
index d10f5ad41..1ddc27765 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.2.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.3.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "8056d8701afbd9b985668916557159432e6ad824"
+SRCREV = "22a3b9374369640993e4a7ab84f8acc72318e501"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


