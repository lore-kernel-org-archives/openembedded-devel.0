Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7CECA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:11 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8066.1756890242508481564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IW74P5Qo;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890242; x=1788426242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/QmqtIgHK1vFCzeDHqoYgnd9vAPzOiENhJIGqWyzXYU=;
  b=IW74P5Qo0xaDQkpw/R2jwQQ3mB79n7eH98K/Uh5bN83JEOz5RN9ZS9tE
   HiLgzou8QDc8XTs38j+IQGiWxrTnJ4HYBtC+Q3NaJBWOURMPFxLa4HcuZ
   beRp99ddAzx4VZnvf3Lydc9XtA8xC0vAPF/7/tPKDfXGU0ngOV2YBPT4G
   mEcArqjfQ8zzRNCOaBY5TVkALztPXscsdZ1+qDuvAEm+2DTeL1fnyGSHp
   GFqnx9McybNMcXuiou1HR6IGR8CCjaahlparqFszPoz2ufBeZ2kjCvPgw
   GkX3EU3QBaoLAvzN2/yGxqqP/7UbZ1oChMBw1Rxq/ege4ZHUdw/1txJdB
   Q==;
X-CSE-ConnectionGUID: vH1z3QIqTzS8zLTpqEqlIA==
X-CSE-MsgGUID: ORs0ejyBRROC895gD8He4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="198903400"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="198903400"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:04:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 000C71C00091
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id ABA6F115071D
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 8AC1C10023FF
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A702A1A0069;
	Wed,  3 Sep 2025 17:03:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 56/56] yyjson: upgrade 0.11.1 -> 0.12.0
Date: Wed,  3 Sep 2025 17:03:17 +0800
Message-ID: <20250903090317.2002-56-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119253

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../yyjson/{yyjson_0.11.1.bb => yyjson_0.12.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/yyjson/{yyjson_0.11.1.bb => yyjson_0.12.0.bb} (96%)

diff --git a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb b/meta-oe/recipes-support/yyjson/yyjson_0.12.0.bb
similarity index 96%
rename from meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
rename to meta-oe/recipes-support/yyjson/yyjson_0.12.0.bb
index 0655f225b4..703c2ab3ee 100644
--- a/meta-oe/recipes-support/yyjson/yyjson_0.11.1.bb
+++ b/meta-oe/recipes-support/yyjson/yyjson_0.12.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8ae1b99922935413d4c596f50b59545"
 
 SRC_URI = "git://github.com/ibireme/yyjson.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "9e24d6bcead647231f81173cc5c6bb6c097c00e4"
+SRCREV = "8b4a38dc994a110abaec8a400615567bd996105f"
 
 
 inherit cmake
-- 
2.43.0


