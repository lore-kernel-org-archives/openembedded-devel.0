Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CEAFB5178
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 01:26:34 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70089.1775525187324626692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 18:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fHOYhYLm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775525187; x=1807061187;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=914qGYAWhHiG1L9VtVhEm+Ep5Wpqv6+TXTAbAl4FHmw=;
  b=fHOYhYLml9TMEJdlRTJwI9epph3WFuciGUKTGtBq80iMb3TYJJcfXHw1
   r9zSG4RS3mXo9noWqdRLB4zE7e4g8JFsO4KDAcdWouf8wfOl3Vw+JfiNW
   3WmWcMqeKjqqOssvBrHqr9H0/4df75h4yA8RLrRcTl6OnEqMuBHgiVHux
   l/yxUFH1BChG48wBuJC82cqPLk8ev5jV4L7HFBpiwnxT/kTOS+tAHOrd0
   teNVb30j55okCo98KO0e1vHQEBEVDPQqpTYTvSSxHJxva/NQ6u3fBdP90
   rPIuM1Nb7UIWHBSAZLMTKIP37rH215mAeGpkWjMB7sW5dzIWUaK4CpmH8
   g==;
X-CSE-ConnectionGUID: HRgIX51WRZCpmPfc6qFngQ==
X-CSE-MsgGUID: xIq1jaL2QRWRSeRIgLSuXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="223941631"
X-IronPort-AV: E=Sophos;i="6.23,164,1770562800"; 
   d="scan'208";a="223941631"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 10:26:25 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7959742A321
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 01:26:25 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 244E91C00149
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 01:26:25 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DE494831038
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Apr 2026 01:26:22 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] [oe][meta-networking][PATCH] linux-atm: Add kernel-module as RRECOMMENDS
Date: Tue,  7 Apr 2026 09:26:17 +0800
Message-ID: <20260407012617.20699-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 01:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126069

Runtime command line atmtcp depends on kernel module atmtcp,
so add it as RRECOMMENDS.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index b43900a94d..fd18ed7386 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -4,6 +4,7 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-only & LGPL-2.0-only"
 
 DEPENDS = "flex flex-native"
+RRECOMMENDS:${PN} = "kernel-module-atm-tcp"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.gz \
            file://link-with-ldflags.patch \
-- 
2.43.0


