Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AF2C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9830.1717664821953039349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ow4tdlmy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664827; x=1749200827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OEvviM0IX3jvnbXB0x4JMWtnFlz0mMbsR28k8uu3k04=;
  b=Ow4tdlmy818T7wmhe+6Hxex9fcpmvyFE0YFxWYGANtEKYfRpAPjMvppS
   vy8rhfYNP6iAzvhYrkJIYro8q6Si+cp4ysWkd3HfItJqvmj5P6ZYAZSFB
   tqGRDpyW/pG8P00QgeOZyc0cV1ckM/xoBGEeGNQO/QPZZEQgtEgyOLGRP
   ZJFBWaDjGiwa/dqxU/AvSSPDiNxDLshrgEY4zkFARMuJGJP/Ed8HBQo1S
   x87iuS5s9JpTQlOROQOHEQSMIKoghhdig16Lc+Nvb4E3yLH46r+Kk4OEg
   hIuEQkrAqwRBI1oGToGlWUbhG+Ce710p24Q76gye8yybk1CdIFMy23yGB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="150462600"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="150462600"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:06 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 806D6D647E
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C81E6D7487
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D8FD401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EED1B1A000A;
	Thu,  6 Jun 2024 17:07:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 28/36] mercurial: upgrade 6.5 -> 6.6.3
Date: Thu,  6 Jun 2024 17:06:27 +0800
Message-Id: <1717664795-13902-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-0.444900-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOxl9HNVJWpcngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDWOvG6VW4FmOV+lyO6A6X8iZUbP3H6mUvhxET2gmFz4rid6eFzs68zwh+5rmKV1klxWgC
	15U0E1zNHbfUsNVDsz0x41bvVzw1Ho4DGSOCid9FPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110735

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mercurial/{mercurial_6.5.bb => mercurial_6.6.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_6.5.bb => mercurial_6.6.3.bb} (92%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
similarity index 92%
rename from meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
index 2451a36be..89e6744dc 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.6.3.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} = "python3 python3-modules"
 inherit python3native python3targetconfig
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "a5603d0d395ebf67fe5d27abbb3bd37fcc01871ecf394c793672d2c1e68be7e7"
+SRC_URI[sha256sum] = "f75d6a4a75823a1b7d713a4967eca2f596f466e58fc6bc06d72642932fd7e307"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.34.1


