Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7361C105A583
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:19 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18642.1773313213383106047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jkk+fs37;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313212; x=1804849212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tp540yBjBnaXo8aKcZRrPfqG4EJUaWxnV/dgGRXGXuI=;
  b=Jkk+fs37knHVWa/dFsoJoEGcMx9x/ivZmqsCL+YADEUUqivFP4Mbajmy
   9q1sfT2Yg2DigbMeZumQm0JMctGjbsKp1CJeRrt7dEz21ewoA5w5TwUv2
   WWE2Rejnc8vRGfP0gniShZESBrTY3arWsI6Y/FqiIrKuA9M0/EVg5lOK7
   QvemrLhH6Z6yqd8OBBBS4na6IBZBymRjXa7RpVp3kvBcLeyDRaQ5tgksO
   sHM1u0NnXpNrzcnFzmExKAoC+GYShnaqJNY3o1+hQrVox6oXb+jCxXdLo
   UKJ+ByYRtAQWYbtL2hUUYVvakVP+OU2Da6iTJNSuOgrdve0sEcvxlsFkI
   g==;
X-CSE-ConnectionGUID: DdsPNDCEQYu2sjakqYIKEQ==
X-CSE-MsgGUID: X6rDx3DaQR+3pprEsgWfZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232990232"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232990232"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:00:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4752E1C166D4
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:10 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EF29D861263
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0642F8288D9;
	Thu, 12 Mar 2026 11:00:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 62/64] swagger-ui: upgrade 5.31.2 -> 5.32.0
Date: Thu, 12 Mar 2026 18:59:38 +0800
Message-ID: <20260312105940.1900-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125163

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 oas32: add basic OpenAPI 3.2.0 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.31.2.bb => swagger-ui_5.32.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.31.2.bb => swagger-ui_5.32.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.31.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.31.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.0.bb
index 9495daf6ab..f1cf07d418 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.31.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "a398208d1723ce5dae956cb2a060864092d436c0"
+SRCREV = "1b33a5976d8f5e02d3bc40de1deae3a4a3642e36"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


