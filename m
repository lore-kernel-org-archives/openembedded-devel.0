Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91757C369A3
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.47784.1743412322650854718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=maP9jSl/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412322; x=1774948322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m0dswilBz9peR7pfAaeKS7FdlrmSXCxgguZWQwOLRa8=;
  b=maP9jSl/ReVLrItB1GoOFmRqGQQdFltTgDfmHU4+3QQqIQQzTaAA9BfM
   QG8S46l8Psz0Dx/79hZvs1sQLdNfKSIEljxgVM4YQm6toB3800vwFX93m
   j0mPA1hqR73mI63Sfroc/5M5JuamK0Lr79j70KAN700bIWKp5o2P9mFjj
   6CoM5oQZBTGZrSA/wN2SYrS/RpDYiMnft2jN/XfDk8/MH/W3j0Kjj7y4k
   O7DoKYP/V3Brdv3ldy5MuwrAURtMStUHujy/bzoJSj09U1XNLtNkGRdDY
   jYD+deSdibXOXFNRI5qgnVo8Fl0MdARObsFiC45DDR49XC/vpb591Cb/H
   g==;
X-CSE-ConnectionGUID: zlx4aMKITmS6NETZ3jY4jg==
X-CSE-MsgGUID: NtpAb9uBTxq+hYXM+rKvtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="195278858"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="195278858"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 249F0D6EA5
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DDD6AF310
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9E9251A0078;
	Mon, 31 Mar 2025 17:11:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/26] python3-humanize: upgrade 4.12.1 -> 4.12.2
Date: Mon, 31 Mar 2025 17:11:33 +0800
Message-Id: <1743412308-21887-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116410

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.12.1.bb => python3-humanize_4.12.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.12.1.bb => python3-humanize_4.12.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb b/meta-python/recipes-devtools/python/python3-humanize_4.12.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.12.2.bb
index ef2a5dabcd..d5dddce857 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.12.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "1338ba97415c96556758a6e2f65977ed406dddf4620d4c6db9bbdfd07f0f1232"
+SRC_URI[sha256sum] = "ce0715740e9caacc982bb89098182cf8ded3552693a433311c6a4ce6f4e12a2c"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


