Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F2C105A580
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18859.1773313199008465378
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IXRPoi4S;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313204; x=1804849204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kiRQBERcFYROMIXJCMYlVRsflFFEmFF75aWhBUR95o=;
  b=IXRPoi4Sdg9uOQsTQsvbqyVepbCxyWqO8j/K4vUTivD1NM4t/eCd0mQH
   HW8IiIZSsYUsw7r4zUoP/+utRA6fh88EbFQUWGj3VQhcnb325TAVNbWdP
   Ma0gHhI/6KMcRJS34e0BljodhmwCAfLE2nFGXfjMkgz5jH6k9NOmT+tqo
   inU0mYAns+Q1I/b+tdu/U95xlfZ0VWq6mdPwM7IqRimo/+A/Vr4GaKn8B
   kpshgWyX5Q5gezAI7nCst1PIyabZEpGC56V2oIa3wsgNTU9PrqAckXs/C
   9xHz0Xkqt8eBMgOJeQUwqZMgyeq2BMbEEzgNng2YmPKNVXagt+hVsNVN4
   A==;
X-CSE-ConnectionGUID: /EyKO13YSlqxd45CLyGp/g==
X-CSE-MsgGUID: 6EpPNmkFS+CnFJ3l7nEDoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211990097"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211990097"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:00:04 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 060B21002B9C
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:04 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id AB7E5C00218
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id AC7C78288EA;
	Thu, 12 Mar 2026 11:00:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 59/64] python3-whitenoise: upgrade 6.11.0 -> 6.12.0
Date: Thu, 12 Mar 2026 18:59:35 +0800
Message-ID: <20260312105940.1900-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125159

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
========
- Drop Python 3.9 support.
- Fix potential unauthorised file access vulnerability in "autorefesh" mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-whitenoise_6.11.0.bb => python3-whitenoise_6.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-whitenoise_6.11.0.bb => python3-whitenoise_6.12.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.11.0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.12.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-whitenoise_6.11.0.bb
rename to meta-python/recipes-devtools/python/python3-whitenoise_6.12.0.bb
index 142c10aa83..dd8f189f98 100644
--- a/meta-python/recipes-devtools/python/python3-whitenoise_6.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.12.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"
 
 PYPI_PACKAGE = "whitenoise"
 
-SRC_URI[sha256sum] = "0f5bfce6061ae6611cd9396a8231e088722e4fc67bc13a111be74c738d99375f"
+SRC_URI[sha256sum] = "f723ebb76a112e98816ff80fcea0a6c9b8ecde835f8ddda25df7a30a3c2db6ad"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


