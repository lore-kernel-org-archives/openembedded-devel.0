Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4163CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17249.1777546246945321106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JTrwUD/d;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546247; x=1809082247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pJrS5X+3a+4JslnmYzW+QDB9Vvmn5C1UE7zpYN7v5LA=;
  b=JTrwUD/d+omRREbykwOZpphCyhRsUacwN/IMsNbEWnr1a+9oVTEIrii9
   jC/anUlMpXrKNXsDxsf5+vqp59h1ZXT4aLoxzS4ZAiKt7CLVvt+VaRySU
   +nC/jTXtnwyaiQotmweyA0I+Z/wfXLYEA8e3V/nmJNcjP9YE9JnrSHpNC
   b8+lkpRb4JpDDXjJOcNMkwZ374dqqGRCDHBCgDfIjOIwz0ivZaxdGaVAb
   zjR2h24HhurUiM6dVxMpvQ/h5GkmSixoc4xlI2gerVoFUupDkgd75fXlL
   FrblgLme1Tlx2G+f6MlzbPsQgWQfrnsSlqCSlmyaXBi+80mbPf8U1NIoU
   A==;
X-CSE-ConnectionGUID: yrf8FwdgSYSe6Te3p43Q1Q==
X-CSE-MsgGUID: /yfOM0rpSHaa11p+dybtqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226101029"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226101029"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:45 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 85C53C00415
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:45 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3E2E11801FE6
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CFE111801542;
	Thu, 30 Apr 2026 10:50:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/64] python3-sentry-sdk: upgrade 2.57.0 -> 2.58.0
Date: Thu, 30 Apr 2026 18:49:07 +0800
Message-ID: <20260430104924.1106-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126718

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.57.0.bb => python3-sentry-sdk_2.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.57.0.bb => python3-sentry-sdk_2.58.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.57.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.58.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.57.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.58.0.bb
index 94fc007b84..d752b7cca7 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.58.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "4be8d1e71c32fb27f79c577a337ac8912137bba4bcbc64a4ec1da4d6d8dc5199"
+SRC_URI[sha256sum] = "c1144d947352d54e5b7daa63596d9f848adf684989c06c4f5a659f0c85a18f6f"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


