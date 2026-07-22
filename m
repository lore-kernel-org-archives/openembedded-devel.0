Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068F4C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:25:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44637.1784715893156218874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jVfAw0jn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715893; x=1816251893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e6Os2G0M4cAoJkiu1RlBrDdp9sQdj6wJQ2Bv2QehRlc=;
  b=jVfAw0jnmYVKFbj8fZK2PgCZjAlEMFKEm2IoMXzB+v/0eTAOmBI9hiP4
   uDFRNcPQljOPcIL6rYtMEFURVDkBpzhTZMMo7G2Wvk1FSNeKwqDNUd78c
   WyIvWQ9NaTQ8gFkmAbsxB7KvZDC4oQd0fMtB88wPiDWTRVETDyyVo8i/m
   zUfTgJJuUbcym1ePPoLLLZerfekMukMtyWjcT0kQgupnjkizIGioNyNMa
   5fZih61LRBSTi2XwVjd06ikzA/9ws0AHYA9umbQ1SDSardEHvcrfqJN++
   LNyQG/PNpHlFOwr8IC/+8zBd70e2B0GkbTJwbo18KxpMPMck9hGr0+qFg
   g==;
X-CSE-ConnectionGUID: 2ZwX1hKRTpaUcCSMsfFxKg==
X-CSE-MsgGUID: d4NlW6TqSK6bLAj3he9wBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="227106964"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="227106964"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:51 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7B15A82008F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:51 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2BC4018000C7
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 3C84A4064B2;
	Wed, 22 Jul 2026 10:24:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 35/37] swagger-ui: upgrade 5.32.8 -> 5.32.9
Date: Wed, 22 Jul 2026 18:23:18 +0800
Message-ID: <20260722102320.1019-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128405

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.8.bb => swagger-ui_5.32.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.8.bb => swagger-ui_5.32.9.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb
index cd8b56cc01..8878f2ea00 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.8.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "4e0d3f88de7db0395a80ef0541ff428f0926d484"
+SRCREV = "08bb057df45fa778351ccea63dfedf848d5c5edf"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


