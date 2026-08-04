Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E40C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:17:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10293.1785820654476527818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CFh0auNC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820655; x=1817356655;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r9rijVs3MOd+v+vhFux/v6Us2IijsOQxEGtK/DH6q5E=;
  b=CFh0auNCzmXU3nl8UTdwbPCMrY7APFfCpta/cqIVHxhtuUyX4hkpy0z2
   gpmLWno809Mmlx3qzA+wxDa1XAEaKUCxqSHCXtl1jecIomo0kcp3c82Y5
   3/x4mZU5lZnMXy0CGKegKe4jEVLZ/0TCq/FS3R5n+Ep+1ggTKYst/vBl1
   Oct5TP2BMFg12H3pBzWnN+XH3OdyMcR4p6Qc5T6PuG8521WT2U1xgAFPX
   gl4loXJldxDGNRNMp51sUQeqRTnzao+BaMJr6yf7hpVmmpAgOmatZePJP
   v0uPPB85GhUoANnq3pDJJfovdcQzjFqHS0TTMqSDwluc1jOO89JP/ckIH
   A==;
X-CSE-ConnectionGUID: pbITtQXeRaqx83ePgT5oWw==
X-CSE-MsgGUID: k24mE7IfSXSaOBLdrlIaCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249616132"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249616132"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:17:32 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 57C9FC020CB
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:32 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0C779C170BB
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0ACE11800B2C;
	Tue,  4 Aug 2026 05:17:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/28] ctags: upgrade 6.2.20260726.0 -> 6.2.20260802.0
Date: Tue,  4 Aug 2026 13:16:59 +0800
Message-ID: <20260804051726.1489-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128706

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260726.0.bb => ctags_6.2.20260802.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260726.0.bb => ctags_6.2.20260802.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260726.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260802.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260726.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260802.0.bb
index 312d62ce1d..dff13380bf 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260726.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260802.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "d0e726cf667580bc5b3f6352d21029899686ae57"
+SRCREV = "069715e146372ce5513e1d51bff5543fc1e55150"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


