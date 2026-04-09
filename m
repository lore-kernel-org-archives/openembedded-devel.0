Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D119BEA3C3B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128831.1775730832615685151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TIFZqY7a;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730838; x=1807266838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=opl3RMcxH4o0wrW7TnbJkHqhx8aFyqGniqsNaGpE05o=;
  b=TIFZqY7axWqW6b9rhhhc7DFOA8wG+nnHdbXCVGlR7CI2KDaaSKIb6adb
   G8aj/OtYuOs95x3aeSqQhaKPc+JERY9dogALtRNNVG8JTRObHOhFmb1DH
   6j5a8xQSp0a/45HjLeNUyQHHtegZeLF1zigIEaxvan+PbUhJcDV/X8mE9
   3as0pS1G+QJ76HpVQsZzk5k5iA1FWAip5jmDtPszPNNBaRn+ps+desx2e
   s/lTJdYv6Gv18DlhUvvJnhxb1BZ0f/XSd72V7Fog5YUfyhwO9NBC8w0zN
   1WBkk5I1CTEpUlgHgtSwsOoT7EjRtQs04vymnSgwLoEnw7TwgkeCwZzIX
   Q==;
X-CSE-ConnectionGUID: pjlDdBVlSuOt3pASbWLd/Q==
X-CSE-MsgGUID: SFYMvJEZTzOl74MefcD70Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="240796139"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="240796139"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:57 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 04E8842A337
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:57 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ABED21C002CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 1DFE3403B5E;
	Thu,  9 Apr 2026 10:33:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/37] python3-faker: upgrade 40.12.0 -> 40.13.0
Date: Thu,  9 Apr 2026 18:32:05 +0800
Message-ID: <20260409103223.1574-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126168

From: Wang Mingyu <wangmy@fujitsu.com>

Fix: Ensure deterministic locale selection in multi-locale mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.12.0.bb => python3-faker_40.13.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.12.0.bb => python3-faker_40.13.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.12.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.13.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.12.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.13.0.bb
index 2f3ec72c02..97f0e6e8f6 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.13.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "58b5a9054c367bd5fb2e948634105364cc570e78a98a8e5161a74691c45f158f"
+SRC_URI[sha256sum] = "a0751c84c3abac17327d7bb4c98e8afe70ebf7821e01dd7d0b15cd8856415525"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


