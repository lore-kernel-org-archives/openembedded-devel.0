Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BF7ED7BBA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:40 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15989.1776163238016945631
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NwGHLWfW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163237; x=1807699237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YAHx05KxaE4Z5d+A69A1apF2eXRnFhZTEg04rM36CGU=;
  b=NwGHLWfWn/mYNZXZhl4iUWvNHq9iXHbBhpURNUp5TnrEolHbhxyY/+Bl
   15rj9g7H7YTlNGDeld2if7JCgewg5VOyyJxEyIDo+11aJYfZTv4R7j6KG
   iw2mRAeuN7C9fUpfnpW9KKc2F3C62zAqpaeE635ie6uuKmGlx4yk0wmzj
   k4Pe5uawIc5SGQKj30Tn47UGejkZU2fFHnFBrxJN0kiPEcjGBJI2JXiCo
   D+dyHDlKpyY4qjTmoqFURNIZWxQlBx2GUKYlLdnJJSbAGKbypdHQrdKlR
   lA8AqbV/QXiCNShq4hNvoSBPmG34Q3xisVpSj3Wp953/mTg3qD9ngKiNI
   w==;
X-CSE-ConnectionGUID: WsTW9xbmQfid8djG2GpgJw==
X-CSE-MsgGUID: eJX+kBS4SuqsK6c+H4RQbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="225584017"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="225584017"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 939F01000346
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:36 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3AD4A180716C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8167814001CD;
	Tue, 14 Apr 2026 10:40:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/32] python3-rich: upgrade 14.3.3 -> 15.0.0
Date: Tue, 14 Apr 2026 18:38:38 +0800
Message-ID: <20260414103845.1728-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126329

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_14.3.3.bb => python3-rich_15.0.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_14.3.3.bb => python3-rich_15.0.0.bb} (88%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.3.3.bb b/meta-python/recipes-extended/python-rich/python3-rich_15.0.0.bb
similarity index 88%
rename from meta-python/recipes-extended/python-rich/python3-rich_14.3.3.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_15.0.0.bb
index a2af61840f..2ab3b2fdbc 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_14.3.3.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_15.0.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b"
+SRC_URI[sha256sum] = "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


