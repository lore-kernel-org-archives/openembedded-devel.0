Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A10CD6E67
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21499.1780394932875666119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g0whloG3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394933; x=1811930933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XAnwKLYe3hTk2PVKJzY0oPt7hEMEXIy/PpP16cQ0HCQ=;
  b=g0whloG3YC7pvSpx7ShM2NrbDmwzASioGHlM0DE/xpXuS7Cquqs21RUN
   OeQCzVvxktalHfkJd12GSYMNVN4DJhsi305dfg4yFS3PUPKNshMMebQmN
   zyC/X74R1BlNDBWO68jszBDdNRzWkLvGxhKPWki4DE4E9OHvHqdFxV4HO
   vevbUYUCnry1yCLie+fqRbnA0Z5GMvcq+nxkILiJr0hRLP0fGh79YOn7J
   HDd1Aqvi9RC1wHt62A5iCNgKaXJUd+PPaOdGYQeKo1nljsclSvITWwJUE
   L3nps0jaV9krxZTXzFPJwBZZ3vWvb4jsBuNahnFGaGeQHAMOfQjIH23ZU
   g==;
X-CSE-ConnectionGUID: qz54aCDET9CqnxpX4eBcZA==
X-CSE-MsgGUID: bVYb/yLASSOLN9BhlcaOCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="240840728"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="240840728"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:51 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 371233D07
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:51 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D852DC03847
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id ECB4F180051C;
	Tue,  2 Jun 2026 10:08:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/38] python3-serpent: upgrade 1.42 -> 1.43
Date: Tue,  2 Jun 2026 18:07:44 +0800
Message-ID: <20260602100755.2117-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127350

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed multiple bugs in serialization and parsing (complex number edge cases, custom types etc)
- Changed java maven publishing method

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-serpent_1.42.bb => python3-serpent_1.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-serpent_1.42.bb => python3-serpent_1.43.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-serpent_1.42.bb b/meta-python/recipes-devtools/python/python3-serpent_1.43.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-serpent_1.42.bb
rename to meta-python/recipes-devtools/python/python3-serpent_1.43.bb
index c165a02caa..1b73bea437 100644
--- a/meta-python/recipes-devtools/python/python3-serpent_1.42.bb
+++ b/meta-python/recipes-devtools/python/python3-serpent_1.43.bb
@@ -2,7 +2,7 @@ SUMMARY = "Serialization based on ast.literal_eval"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d7c28f460fafe7be454fcdcac0b60263"
 
-SRC_URI[sha256sum] = "8ea082b01f8ba07ecd74e34a9118ac4521bc4594938d912b808c89f1da425506"
+SRC_URI[sha256sum] = "62dc242fd4ea2a50339f4f5aaaf6ecc55605ee74770d7eb2031e760d90a0d114"
 
 inherit pypi ptest-python-pytest setuptools3
 
-- 
2.43.0


