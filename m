Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66B8C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5776.1785218832732840986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VSl3w8XD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218833; x=1816754833;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0xOvTWp1dJYCyl2qmzD02SNyUZF5kH440UbKu6A0chY=;
  b=VSl3w8XD3jDD3I5MC85GMKrylGXE6WoTlGp1FOiPxAGd51fYA9PRlp55
   KdFQxn6nfii6gDi3vDEz5aCAOr9X0O7i+Vx1Kz8EkIHWBTtGZUbuLBzOX
   8EYn/oVyEcTMQSJmb9FfNo0Wm6Bm+Jy+KiC2aLxZtM76n4M64GljKN2gY
   9zYDgdYe4s2EYFvfiBtMNIjEnJU9TPfoZs0W4smiPTKnNQ2ZXhu99W3fz
   5kv2N+xBhtKrIGli2otFM8V/eSDWon+AH4STFMn5PoRNMUXD0PFgOmsou
   Ca06FRnqgEJP7klh6vvZodcXBJSPMmn6IhhqS6vZ5RjMmvIXuCOFLLQj5
   A==;
X-CSE-ConnectionGUID: zwfVpQMsRKW+q/b9y3elog==
X-CSE-MsgGUID: KQZIzLDJRnWYgbWbx4ZR7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248766212"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248766212"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 10B261002BA9
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:11 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BEA4A831C5F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 2904810005F1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:08 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-httpx2: upgrade 2.4.0 -> 2.9.1
Date: Tue, 28 Jul 2026 14:06:30 +0800
Message-ID: <20260728060645.819-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128487

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-httpx2_2.4.0.bb => python3-httpx2_2.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx2_2.4.0.bb => python3-httpx2_2.9.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.4.0.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.9.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-httpx2_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-httpx2_2.9.1.bb
index 35f9d91c84..ed067f73db 100644
--- a/meta-python/recipes-devtools/python/python3-httpx2_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.9.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "The next generation HTTP client."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=166cfc32dc0986f87a7e950553b52e5e"
 
-SRC_URI[sha256sum] = "32e0734b61eb0824b3f56a9e98d6d92d381a3ef12c0045aa917ee63df6c411ef"
+SRC_URI[sha256sum] = "1932a768737e3666291582833da748cc4e563c337cf96706fccc04fa6e58764a"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


