Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72E0CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19064.1779190898011427146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XlmYZOYC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190898; x=1810726898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qOZ+73qIhyZc5iQy3zawsmw2ZWfZRg0qqlUwv7T2BD0=;
  b=XlmYZOYCgwx8b73S0FvXGPYf4RqX0CTYD2RWJNoj9SQW36+dkxAaDpZI
   sPvUjqEvHmBRqLUgNDzWna6lO4dXLfaQimVCTdkKVWLQvhmYY0Xz9oC6H
   +bP4uMTA87hk/IRNGTHsRxtDSelZc3VEJzL5AttfPLyFLi5Qsmi3vff5L
   29tNKRkpfKquLjSH71dqpMh8HzaWE8BkYcCieO/yZKlq8YAnFzLYNag7o
   XN9L+55tIkYOC7XCt3Q3P0unmd+uy5NEYrkTPMV+B+nSFKkOrKiOo/0XC
   wCoyHI2J30Pmaw9dA1nCHZo01nDCperXxmFdoCj9qkoGiEzjMML8nXDoA
   A==;
X-CSE-ConnectionGUID: u5flymjtR46j4drHDYYM/w==
X-CSE-MsgGUID: oz2cBk8nQjmHQvOAd6aBmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="240515163"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="240515163"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:36 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 89F24C00093
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:36 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 435AF14042E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id E10EA4066C7;
	Tue, 19 May 2026 11:41:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/38] uriparser: upgrade 1.0.1 -> 1.0.2
Date: Tue, 19 May 2026 19:39:20 +0800
Message-ID: <20260519113921.655-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127099

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
* Fixed: [CVE-2026-44927]
    Stop truncating 'ptrdiff_t' to 'int'
* Fixed: [CVE-2026-44928]
    Fix 'EqualsUri' with regard to '.absolutePath'
* Fixed: Fix OOM related memory leak in 'CopyUriMm'
* Improved: Simplify internal function 'CompareRange' into 'RangeEquals'
* Improved: Make function 'RangeEquals' use size_t' internally
* Soname: 3:2:2 - see https://verbump.de/ for what these numbers do

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uriparser/{uriparser_1.0.1.bb => uriparser_1.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.1.bb => uriparser_1.0.2.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
index 987c28744b..d4be4b14c8 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "5a3b7c491a1e9033d86b9c00a947bafc46407187938578daf799a4155cb7c88a"
+SRC_URI[sha256sum] = "963554c32d40fb6cba5644f1ba63e6dd7a182b2948bd71ee448c532f53b07f1e"
 
 inherit cmake github-releases ptest
 
-- 
2.43.0


