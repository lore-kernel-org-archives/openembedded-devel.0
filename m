Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA0CC41513
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13838.1719816255859812887
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KcyH4B1H;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816255; x=1751352255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qrqNtoEl43PAH27o81f2pv0fmX/RgaIFvvsun6mRHVo=;
  b=KcyH4B1HaE8+XCvPVbcgwVxxmTn6IYnVHZjsB4OQ5PiLdmPCgGGca+DZ
   DsZFwrW3rv1DQkVR1MC9Gf8R03Iu4VjQ4U83yfylY53yiWI/4XuRYub+d
   9OcfRl2TV3kq8Ir+CLd9UOzD7viyad2ge9HtSWGH+9WxHC/rk+Yz9wcuM
   dHZ7DmhMntjrnVVYepkLFvnwHG4HciMJnWCSaEhk9y+vnfDAOOL62P+lo
   TBshg8zuFgotrmBK/2oIu08m+6yItTOxiCtHCokyEGt3F5eAUcxVzAXD3
   c+YcqwYpoAUt0+/e2Y1Ibw/tljDlqzC/INkXIKuQiPNsg9AgflOnuxaNS
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144351912"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144351912"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38E23C3F84
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71C36D3F0F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E80B020071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 972831A000A;
	Mon,  1 Jul 2024 14:44:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/25] feh: upgrade 3.10.2 -> 3.10.3
Date: Mon,  1 Jul 2024 14:43:39 +0800
Message-Id: <1719816242-11839-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10-3.222600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytVOsgxE4qlJfQP
	7Gc63USFTp3SpzyrfU3cM+vxiw23KVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVUowu
	jpd11c5hlFSORUVE4XiWjHpTVFePUkfRhdidsajODGx/OQ1GV8mVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3Kg2oNsglTQCraZuLXJmDG1WBpPP8T1tLegIus13ygyA5KBAnu1ufm9Izjt64Gt409HikX
	rnJOFl/V3vsfgmoWCLPqJuNVWte1bIlR0CP+9uuvukFcYgGbHWubInJ6UnEoYlgGwbvE/hr
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111169

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix feh not respecting aspect ratio of thumbnails that are smaller than
  --thumb-width and --thumb-height
* Fix --no-recursive behaving like --recursive
* Fix rotation by 180° corrupting images
* Speed up --sort=size and --sort=mtime by caching stat(2) calls

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.10.2.bb => feh_3.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.10.2.bb => feh_3.10.3.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.10.2.bb b/meta-oe/recipes-graphics/feh/feh_3.10.3.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.10.2.bb
rename to meta-oe/recipes-graphics/feh/feh_3.10.3.bb
index 2c38ce614..5ab333c60 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.10.2.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.10.3.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5f94a77de25c5398876f0cf431612d782b842f4db154d2139b778c8f196e8969"
+SRC_URI[sha256sum] = "5426e2799770217af1e01c2e8c182d9ca8687d84613321d8ab4a66fe4041e9c8"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.34.1


