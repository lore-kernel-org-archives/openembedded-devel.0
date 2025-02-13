Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557B0C021AA
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:56:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.5708.1739429796123219262
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sUH9FCp3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739429796; x=1770965796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=knLOF3yv5uNYRFX2uU+vg07WEk5lCS1Pz4eyKwOhVUc=;
  b=sUH9FCp36pbf1OhIh2ybnvS7Z72ImkfP9h5MeWJtix7aR8KCRQnnN1qJ
   70L+oz34RgmXmgspZiUkTNgquz+Q4mJISfotB5F3wpIpYz9k+POVtwMiL
   6H7N+McuwE10Ik59PDJxj+NrDl3nNG3ntNRhxXmRImLKHc0ig/pgT2ELX
   KGNMOOFGWErpZSgaR7OpRnGUA2ou9m41PLpeoXesmIGUGR3bWQJF62Qhh
   SAWXz+hVCtJHexJOtkGw9QeOEbV8bhhxCcb32EKwY0DdsPhnD7BLW6tcR
   LLyvO4prps0ViWBrBXG8k5xuQkWu0J4zE2M3nGao1vpv+NCNuto3j6d7W
   g==;
X-CSE-ConnectionGUID: VOdM2Ls+QqCrEWLuWBm8Eg==
X-CSE-MsgGUID: +T9sVa9GQRiLKbQ012Bqbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="190041244"
X-IronPort-AV: E=Sophos;i="6.13,282,1732546800"; 
   d="scan'208";a="190041244"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 15:56:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E632DDBB80
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 15:56:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A8A3DBDB60
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 15:56:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 495551A000B;
	Thu, 13 Feb 2025 14:56:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] ttf-takao: update SRC_URI
Date: Thu, 13 Feb 2025 14:56:24 +0800
Message-Id: <1739429785-11694-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739429785-11694-1-git-send-email-wangmy@fujitsu.com>
References: <1739429785-11694-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 06:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115452

From: Wang Mingyu <wangmy@fujitsu.com>

Upstream repository url changed.

Fixes unsuccessful fetch warning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
index be0e544ccc..156dc983d7 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
@@ -9,7 +9,7 @@ SECTION = "User Interface/X"
 LICENSE = "IPA"
 LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
 
-SRC_URI = "https://launchpad.net/${BPN}/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
+SRC_URI = "https://launchpad.net/takao-fonts/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
 SRC_URI[sha256sum] = "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29fafdc46133fc3552f"
 
 S = "${WORKDIR}/TakaoFonts_00303.01"
-- 
2.43.0


