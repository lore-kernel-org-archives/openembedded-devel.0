Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142A4D6ACC2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37702.1766048657334931601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hvtJbwI4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048657; x=1797584657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oZLRajdbDHo6j7ffNNYz/x7ML1JGnV5/z65rnCLuUQ8=;
  b=hvtJbwI4dTXBoRil8bzDP6tCJdkVJzmjCXaawSbq2q0UN0Nku0QYSu4w
   EgQpCFqmjiLAvBNUN7dPU6aPlanHJczfoQMiNBkLlmfV2wNvJug7UHfZS
   WtKqP/y6LXDUnUoGz4MBaM7/MvCp4plCmAIuYDYVdKAdXJAgXF4BVp86v
   zWNpB6HZ/hT6zWbiPKzMwmhyWcWTFAeimpT6BweBr6LOcCy216im2zItl
   0+91Z+oHi7qRgDltcUd4xqiUrEtUL40g6rla3c8mGH9ismBVoD48YCI9m
   wtFaVQRa0NWHvU93kHV0sHeRTzyMqhMieEKbR1MdoBIDticJDqAVgGCt7
   w==;
X-CSE-ConnectionGUID: ZJkjwPbFRIKgZdvfd/u2yA==
X-CSE-MsgGUID: k24MhJPZQrGWsjir8NBK/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="210514176"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="210514176"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:15 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9F04A820C01
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5669C8D9FE7
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C9638101B4BD;
	Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/20] python3-matplotlib: upgrade 3.10.7 -> 3.10.8
Date: Thu, 18 Dec 2025 17:03:39 +0800
Message-ID: <20251218090346.735-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122747

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Properly allow freethreaded mode in the MacOS backend
- Better error handling for MacOS backend

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-matplotlib_3.10.7.bb => python3-matplotlib_3.10.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.10.7.bb => python3-matplotlib_3.10.8.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.7.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.10.7.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
index b5b5250a56..c92af94732 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.8.bb
@@ -22,7 +22,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Do-not-download-external-dependency-tarballs-via-mes.patch \
             file://0001-Change-types-for-width-height-to-match-definitions-i.patch \
             "
-SRC_URI[sha256sum] = "a06ba7e2a2ef9131c79c49e63dad355d2d878413a0376c1727c8b9335ff731c7"
+SRC_URI[sha256sum] = "2299372c19d56bcd35cf05a2738308758d32b9eaed2371898d8f5bd33f084aa3"
 
 inherit pypi pkgconfig python3targetconfig meson ptest-python-pytest
 
-- 
2.43.0


