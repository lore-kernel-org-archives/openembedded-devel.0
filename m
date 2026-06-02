Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD33CD6E61
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21221.1780394912976876901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ScnUM3v0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394914; x=1811930914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x0dypRVkVR57h9qZA5RNj0qVG1hYwIwX9lm2wB4Z/Ow=;
  b=ScnUM3v0i2AgfrUSFElOjNB82+QrqvgyzVBSgqLaIYnVMqJoWTZkvqGU
   iaBPWbDwT14SLRrszC6whpYoiKJyDyTThKjTWLwGcmrNVXrtoXB7vysdE
   8RZ3i4seg1aAQxI5CtBn8DFNIYxBR1NKdSI1w9RtbzhMNR2IgOOj4zBc0
   8TjJzV97ZjFZ/dEQaOeKpfMO+tdiUBsIMde5Lu2Co1kNtIDpIjZdQMizO
   peuSxpqwav3YuYGiAn3AHTfMsio6Bt7glPh0HolAX0sEO8hcbWEWV7/SG
   XiCmgbCRoeAQZBNWyNVWpxTZ7cmNXIMn7Z2UpPvrmqI444PwrXE7E/yM0
   g==;
X-CSE-ConnectionGUID: 3rWjulgMS4O5xiasl+dlWw==
X-CSE-MsgGUID: iEHSUOSNSCGBsVD3RuyKsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242743061"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242743061"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:32 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 79CAB42A335
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:31 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 31198C00FF6
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4E8FC180051C;
	Tue,  2 Jun 2026 10:08:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/38] python3-coverage: upgrade 7.14.0 -> 7.14.1
Date: Tue,  2 Jun 2026 18:07:32 +0800
Message-ID: <20260602100755.2117-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127338

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix: the HTML report used typographic niceties to make file paths more
  readable by adding a small amount of space around slashes.
- Add a 3.16 PyPI classifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.14.0.bb => python3-coverage_7.14.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.14.0.bb => python3-coverage_7.14.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.14.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.14.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.14.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.14.1.bb
index df8d140b8b..100b5118d7 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "057a6af2f160a85384cde4ab36f0d2777bae1057bae255f95413cdd382aa5c74"
+SRC_URI[sha256sum] = "30c08f7d90415aa98b3c990385dea2939b0da55f38515e5b369b83655f8523be"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


