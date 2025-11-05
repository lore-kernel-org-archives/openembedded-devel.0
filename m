Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1305ECCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2918.1762386269644363217
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cs3qBR4E;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386270; x=1793922270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CDGo9qj5UEnb4ueatOu9v6K0U3zqHKljfuR53ZnQEzA=;
  b=Cs3qBR4Eh6at69lyrth9EaE5Gs/MBZBQBVbDNxvF7KCaa5/zgLiSonuq
   EeyDA5FIU1InCvIPB21FJcRs/ojpSpZVxlkl8AEClsSscKkqr5iFAC17H
   zVoF1sU2J9IQs9LBNGi26Q/2lPRDj0rvhcm9SZSQs1QDChvOz+SFbPo/k
   BKkJ3JC4ubTT58T1SKKrBtT/aNsqSKuvB5P71U/QwtihCZCnP5nKihZ6L
   oe0MK1Y1N8swDyytx68Hb/hgFYTdXDguc6Pc8JNfQc5l5ctSUbKslkAmf
   S6glxbvnP+se5My4lFAk3U5Kp5BTBcqhbeKo1BQWx/HWVRySGnaDkDMVP
   A==;
X-CSE-ConnectionGUID: xofOKBc0Ra+p9mQTgnMDXQ==
X-CSE-MsgGUID: nxYoVx93Q961l6hmNnWNoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218262772"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218262772"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0EDAAC000AF
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:28 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B850FC00326
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 46CB7100310F;
	Wed,  5 Nov 2025 23:44:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 11/12] swagger-ui: upgrade 5.29.5 -> 5.30.0
Date: Thu,  6 Nov 2025 07:44:01 +0800
Message-ID: <20251105234402.423-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121350

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.29.5.bb => swagger-ui_5.30.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.29.5.bb => swagger-ui_5.30.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.5.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.5.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.0.bb
index cc7d5d52ce..033b53e248 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.5.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "04b9ad7b37f02bce0e1cb8c521e40b68585ccf9f"
+SRCREV = "9c1e7699a7ba433f66cabc7eefa18579acf58c85"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


