Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D642CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 02:51:32 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6247.1762397484538440900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 18:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kLwfppKe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762397484; x=1793933484;
  h=from:to:subject:date:message-id;
  bh=EWeqLzJjl5KWQ3UhLh3OlIHPrxdKjcJ9Q3e1kXnfTP8=;
  b=kLwfppKesRXZ3UhzirouxAR01oLdRjQMQ5JcVaCpbCqQ4XJdvwGfVcfP
   tS/v6nkAbsRR/VodI+A54PMPh5eYfshxp/LzYqK86lpbMZSFtyPqKiSTa
   olUV2cXnvT6CDEZeIl6pi/LWOrUS4jJa5jAp0Lsi1CYImlR97ebHKBb1T
   pUn/5is0mv08gr5jYRHJ7Z27UQEXLJyCRf1NZYU+mIVPCno6wXDNPCzr2
   koXw1PcYG0y9vJoC+p280HJISc1W4KVUSNsRlNqEnWGQtRmJtG8YGF8n4
   JdOO4SG1ZqAeXhcT9NOF26BFBZsAMi8XGXthlUFXxXsJSp7HMMY/bTx0D
   g==;
X-CSE-ConnectionGUID: vwEfOTuIS+K1L2gL+lbRFA==
X-CSE-MsgGUID: 0hjEtfsnSfSeIbt2sbmzVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218876693"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218876693"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 11:51:22 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B385B1002BBE
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Nov 2025 02:51:22 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6BC2D8D207A
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Nov 2025 02:51:22 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7793882E5A5
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Nov 2025 02:51:20 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] freeradius: multilib-header fix for freeradius/features.h
Date: Thu,  6 Nov 2025 10:51:11 +0800
Message-Id: <20251106025111.3027-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 02:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121355

Fix following conflicts when enabling multilib.

Error: Transaction test error:
  file /usr/include/freeradius/features.h conflicts between attempted installs of freeradius-dev-3.2.8-r0.x86_64_v3 and lib32-freeradius-dev-3.2.8-r0.core2_32

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.2.8.bb          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
index 2de6ce5bae..9b05968638 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
@@ -195,6 +195,7 @@ do_install() {
     oe_multilib_header freeradius/autoconf.h
     oe_multilib_header freeradius/missing.h
     oe_multilib_header freeradius/radpaths.h
+    oe_multilib_header freeradius/features.h
 }
 
 # This is only needed when we install/update on a running target.
-- 
2.43.0


