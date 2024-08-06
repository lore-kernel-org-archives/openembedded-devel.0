Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BF4C5473B
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2884.1722934017920301362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bkf2mGRl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9GJRDlI/8wwZYbCD+HvVboVqKmxVi9WdWXbsKgND56A=;
  b=bkf2mGRlwEqlYpbWP5QteUTK4Q2VuaORzQX8lEF1/Ncp41qeur5xCEGv
   KEgG+xVOlWnq64X/RcDb0323WWN58BPjAp7bFd3dEStYuSdNmtVMVwCwx
   naST5dVNBpbUBWROsbNkynhVEQi1QRsjfGIgQXqxdn6MdGKuGGuVfHws9
   cB+US6XGNfw5EFzob5Zx2Cw2iQ3ujAt313XjvXouzMt2yveRsZsUUTUKs
   0lkVdMyzVJYG83PzwrUcrqNWni8gAd7dwBBLvFG4VrPRNjKuYQi9hIp3+
   Kfps3E17Qz/nj5xEyX+64eVLAAazst3cyNfzmgtJ726FnFQglvEwitINN
   w==;
X-CSE-ConnectionGUID: q/ACogxhRSWk+SEaPX5vMw==
X-CSE-MsgGUID: rSbdLbJEQYaHTKnYA1qftA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="171895517"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="171895517"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9078DC9440
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8472D50E4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 681882007955E
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 332091A000D;
	Tue,  6 Aug 2024 16:46:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/60] leptonica: upgrade 1.82.0 -> 1.84.1
Date: Tue,  6 Aug 2024 16:45:47 +0800
Message-Id: <1722933994-32549-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.051300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFV0ieHN50/kH6nHbeBu5Lnmd2Wz0X3OaLf67wpKrIJNBe4t
	0yVpGKXkTCIhZaX006HDbV1bIWhh2HxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDVtlN
	iPa5BG1jt1vobvXYHzGAE+3W3LR/gouB25/UZeNbBShXZrDGDEeDJcqncXVjo7msDjgljdZqvI6
	pn+94X7UBm783zsvnNS7x6j4tOOhVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111531

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../leptonica/{leptonica_1.82.0.bb => leptonica_1.84.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.82.0.bb => leptonica_1.84.1.bb} (89%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.82.0.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.84.1.bb
similarity index 89%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.82.0.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.84.1.bb
index daf1f873a..89a35116c 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.82.0.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.84.1.bb
@@ -7,7 +7,7 @@ UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
-SRC_URI[sha256sum] = "155302ee914668c27b6fe3ca9ff2da63b245f6d62f3061c8f27563774b8ae2d6"
+SRC_URI[sha256sum] = "2b3e1254b1cca381e77c819b59ca99774ff43530209b9aeb511e1d46588a64f6"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
2.34.1


