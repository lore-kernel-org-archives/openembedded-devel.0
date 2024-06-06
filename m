Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874ADC27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:21 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.9839.1717664832553913185
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ADX6awbL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664833; x=1749200833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xdhnFSQ9rmw+0c5yZyK5ayQXfpO1ZrAlycOgK9VDWRM=;
  b=ADX6awbLCZLzrMYFAoMIgslo+MyRLOCIly6yNboIEZnXYzh81y/IIIjM
   rR9cECVnh4DorsIiFv85YmbKSVQ+o/+obCcGdZ8b+afb/yseORivi3Lld
   UOKSAFacRsdp/YQX6GmgR/MK1EavkU3dNkAeQhz6ytQTvJOoQa4L9FVgN
   X3CSSFUtZPLNTzqpI2E3Qd12ObdEQ/3n1nTMtHvCgvN3Np1IRKUqpo31y
   z0EMganhhBARBvdrGnOr7f8FqCrDvlHZf9A+1B57CKMrhVTM/r6RrJTD3
   aQxBCOR09HK3bG0OLzk3QgYD1Ll2/S5HUag3ZaPhwDRxZhYAQC+INWKFb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="164091945"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="164091945"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C941D800D
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B4E2D8B00
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 186A220081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BAFED1A000A;
	Thu,  6 Jun 2024 17:07:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/36] pmdk: upgrade 2.0.0 -> 2.1.0
Date: Thu,  6 Jun 2024 17:06:33 +0800
Message-Id: <1717664795-13902-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.193500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrECF/8Y+iZ9YC5LPd7Bvbbxg
	LrBLgR3BGj3ZCIL3UrnqrT4uzWuVXVGrcTyHfARsZj7E6vHnuNY3l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYvL3NxFKQpq1TweK12oEGfueAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNe5+4KX96PVECx/v2KvyvFydAWZzV1f+tCrGSS8xbBGB20A0tLrI8tOJR2YgOLjpa89cd
	xYYRs5vZ9GUCENuwp0OUMc3HbC2CQQ5WMx/hWiMU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110743

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Introduces the new logging subsystem in the release build for all libraries
Introduces fuses against ill-considered use of NDCTL_ENABLE=n
Does not allow create PMEMOBJ pool without unsafe shutdown counter (USC) if not explicitly disabled.
Drops support for building without libpthread (NO_LIBPTHREAD build-time define)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/pmdk/{pmdk_2.0.0.bb => pmdk_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/pmdk/{pmdk_2.0.0.bb => pmdk_2.1.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_2.0.0.bb b/meta-oe/recipes-extended/pmdk/pmdk_2.1.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/pmdk/pmdk_2.0.0.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_2.1.0.bb
index aeda23690..100ff4200 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_2.0.0.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_2.1.0.bb
@@ -12,7 +12,7 @@ DEPENDS:append:libc-musl = " fts"
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/pmem/pmdk.git;branch=master;protocol=https"
-SRCREV = "ba92d6b469d52d16f26279bebaf317bbdbb3822c"
+SRCREV = "5705fdffa755d00b4dbb4d6c30eb49671436f961"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.34.1


