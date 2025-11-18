Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1302CEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:28 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8407.1763456959102180826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LUi0Cuj+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456959; x=1794992959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4PguzHkmvnFTAps2sPBlz4RHz1cgYjfPgJFuie9lhM4=;
  b=LUi0Cuj+wzSp+IJhOH4SuAYh7bzuoEnbVvbOg95QB5bTUp+rJ+mC5iDk
   MP/MxmXkA6vAlMqdRcJA5IRB6IwGNU2dWEi7EmT8F/eyFeFs3Dk/OkzF1
   zFrbFfUIK/F7fD8xfFIftYC9WeWSbNPzVjJNEzVu5cZ9L4pN2pxzNpwmq
   v1DFZI6GQCZtiT9Krwe1yyXbKUmYaXo4phKP2Uv+Avv4qJ567fKOUx8lQ
   kWnDf9sBfcADlAJiV16K88aHSoT1JU3gIfkSumrhFEsIAxvO4Wx7LIgzy
   O1/wWZkU4m0CNzAiCeWvzFqrZ0b613gSQRMzXtA83xY3zocIAVx3Ffn8V
   g==;
X-CSE-ConnectionGUID: jfksqApAQHayWDsO8mpNOQ==
X-CSE-MsgGUID: enAQtnhKSb6VdeL6dqm/tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219006578"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219006578"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:18 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 99F431C1C723
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:17 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 548F6C0246A
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EC8C0140024E;
	Tue, 18 Nov 2025 09:09:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/29] python3-asttokens: upgrade 3.0.0 -> 3.0.1
Date: Tue, 18 Nov 2025 17:08:32 +0800
Message-ID: <20251118090846.1484-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121826

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: http changed to https

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-asttokens_3.0.0.bb => python3-asttokens_3.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_3.0.0.bb => python3-asttokens_3.0.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.0.bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-asttokens_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
index 16256535de..81eab1d5c7 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
@@ -1,13 +1,13 @@
 SUMMARY = "The asttokens module annotates Python abstract syntax trees (ASTs)"
 HOMEPAGE = "https://github.com/gristlabs/asttokens"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d9b931fa23ab1cacd0087f9e2ee12c0"
 
 PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "0dcd8baa8d62b0c1d118b399b2ddba3c4aff271d0d7a9e0d4c1681c79035bbc7"
+SRC_URI[sha256sum] = "71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


