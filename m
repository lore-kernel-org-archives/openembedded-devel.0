Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315BDC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44774.1784715816481446129
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K/UXLjzt;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715819; x=1816251819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I7m5kG4rRoLttKaTfRlzzhJHl6KOfgX9vwGNP3FNe24=;
  b=K/UXLjzt00PgR2SyXvrCad/EK9zKnPVh0vZv8MZBkznAiC+dXByh+Yya
   gFLseypJ/7sab9Wh6kP6QByXBbfWW2qmE4CcpQiXQoOgYQsEGAn8mv+M8
   75HLV7HPDSlBFi+Wq/65Fu77k5IJqooA+PX9gT+8v827juTTyxoDjeL1q
   1qSTPp/eSlsUugrtacaXF/ek4rrYw6yWH/BEZuh32D2unCJzHQQOl1JSW
   M/7QnCy0IC6zNg5gpG7aNlJ1a61GdS9qfjoOwXpZHKTfxpHguuM2DfRNv
   RRkjZxlS4ZpzdBIacjh8HvWLdwsh6+WTH+Z8Y7wN+ziTBK6YQIP+B3reJ
   w==;
X-CSE-ConnectionGUID: yTOi6iWDRZq9dWf+JbCDmA==
X-CSE-MsgGUID: 6UHCsm3LQ8+MFFdCUsJN5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="225933564"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="225933564"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B954882008F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:33 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 6E02DC170BE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 868AB4028B3;
	Wed, 22 Jul 2026 10:23:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/37] libcppconnman: upgrade 1.0.0 -> 2.0.0
Date: Wed, 22 Jul 2026 18:22:47 +0800
Message-ID: <20260722102320.1019-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128374

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcppconnman_1.0.0.bb => libcppconnman_2.0.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libcppconnman/{libcppconnman_1.0.0.bb => libcppconnman_2.0.0.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_1.0.0.bb b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_2.0.0.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libcppconnman/libcppconnman_1.0.0.bb
rename to meta-oe/recipes-connectivity/libcppconnman/libcppconnman_2.0.0.bb
index bd1686e9a9..7aa7e465ef 100644
--- a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_1.0.0.bb
+++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_2.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
 SECTION = "libs"
 
 SRC_URI = "git://github.com/amarula/libcppconnman.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "84fa99d3ba0908ff9debd9191c4eddabf08079d4"
+SRCREV = "7452cf8859a4eee59da1fd8f8b1aa6177073c009"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


