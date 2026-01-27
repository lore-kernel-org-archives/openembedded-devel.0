Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240CCD2D8DE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:45:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7159.1769507140548051942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fwWrRlYQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507140; x=1801043140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5F3XP4RWNgOWWR5dJnoKcMKY7U91HqRPzaxSWH9ZkVQ=;
  b=fwWrRlYQAlbcSxX/zRvbn+BIh4KT+x0N0F2JwMY/xty8Wn1HtxxPTNOv
   E4O24T5azUTHzQyO3VAaVoUQfFpEkN5frSm8FjLdj71odYW8jF8eW9EJl
   0MGlkDSmblrXcqI5c8yVkPHCMmsyQPQvC3XQZCJN4QDKOJGs5BeXM9xeU
   lXjvV5l/3TiqtOZ40AjE1rKzGd+0A7LWurWfjuboJvTfYotcoUZ5gXEAu
   Seb/XR2K1Z8v2WYj7R9lylCiNjnNtH9gPMs219Lf9pk3OeCW0yAxWihu8
   0jsd8nTjC6AYGtZYYcxHhEltnh0hMVFTJ0uK3hKg3ExN0w+hsoctRmuR6
   A==;
X-CSE-ConnectionGUID: LdzBmpQOSH+PvdCwbcvCKA==
X-CSE-MsgGUID: PbXCZ5bbRDSA5LZS590Gzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227903231"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="227903231"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:08 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CFFFF1C00099
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:08 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 83075C026C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 0DAC120000E3;
	Tue, 27 Jan 2026 09:44:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/25] python3-cachetools: upgrade 6.2.4 -> 6.2.5
Date: Tue, 27 Jan 2026 17:43:26 +0800
Message-ID: <20260127094339.1081-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123932

From: Wang Mingyu <wangmy@fujitsu.com>

Licensse-Update: copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-cachetools_6.2.4.bb => python3-cachetools_6.2.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.2.4.bb => python3-cachetools_6.2.5.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.2.4.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.2.5.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.2.5.bb
index 51a9f29ff5..d87b85fb89 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.2.5.bb
@@ -6,7 +6,7 @@ Python 3 Standard Library @lru_cache function decorator."
 SECTION = "devel/python"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "82c5c05585e70b6ba2d3ae09ea60b79548872185d2f24ae1f2709d37299fd607"
+SRC_URI[sha256sum] = "6d8bfbba1ba94412fb9d9196c4da7a87e9d4928fffc5e93542965dca4740c77f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


