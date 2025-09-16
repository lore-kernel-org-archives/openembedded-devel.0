Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEE4CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:24 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.15431.1758015742627541774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EFMkNukI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015743; x=1789551743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KSoa0NDDjuk3NQ7qHVAefPYbNgXm6Pd0UCtJFz3gLZ0=;
  b=EFMkNukIGLSMbjfuVQJfolHUrrFyhlWxJqsiGJ4js9VXc0URJqVZf/1n
   dRxG3fwoE9t2cuqmfCTyWbYO/wg8T/cVcbB3fyxuFa+Pet1z5ktjJNVnE
   g06pnNVamE/amdDeb6SOHeDzBqiRPSW56bNCp9+CdjnS9fzwteUSjbnK6
   Q+6xD0u9SMv1bNMUUaYe3v60WcU9bW0ujY9kSJxXFTTPZXnqKyPUPdVLm
   lJd1XWCEineopWOjbOeqLqCCJDjS1cL5IvCmQ43+SIubeLOEN6SlFFxcI
   ym9nzDt9K0vSDraLMrlFUcQo7AWdUIOA43jixsNrc3sEzaf/A+WWOYLJm
   g==;
X-CSE-ConnectionGUID: dwEpkVX0QwSLAw5AFmDlug==
X-CSE-MsgGUID: ZLUwMyriRhW0tzPjmrDW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212934974"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212934974"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:21 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 16FD11000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:21 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C22F9180050A
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 112B01003118;
	Tue, 16 Sep 2025 09:42:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1E931A008A;
	Tue, 16 Sep 2025 17:42:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 39/42] swagger-ui: upgrade 5.28.0 -> 5.29.0
Date: Tue, 16 Sep 2025 17:41:49 +0800
Message-ID: <20250916094152.1479-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119462

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.28.0.bb => swagger-ui_5.29.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.28.0.bb => swagger-ui_5.29.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.28.0.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.28.0.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.0.bb
index e4bee6e8a9..7ac04bf493 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.28.0.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.29.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "01e23904eec6075e032e07f3235607b463d9ecf3"
+SRCREV = "26e6d3cce2a49195681116c97318b2a38c06e21c"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


