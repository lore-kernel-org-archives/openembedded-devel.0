Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997B4E75448
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117718.1766567686108210875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xh+Vmkat;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567685; x=1798103685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3c2YDnRHffCG5k3RvgH0iSdoa75FWCYNx7DgZpYIxqA=;
  b=Xh+Vmkat4aOqxp3mOBfWR06jCzBVJxNI7dWAU61XsofeRHtB4AYPNNdk
   LhYogRp4Eg43aVth0jp9Ud/AFQ/la1N97/S1QdZ1GneEXYmPSN4p1Q8Vi
   bZgyFjiwEIkZ6XKss8+VKKyeok36r7RZRIVBrwvxBb/WJ5FCszo4f7X6V
   PftJDe6jcQQHM3FuWjPsmcahpWFa0gEiPOpqD7lUc3d4sZXGsFqQxrnvh
   r8nGHbZnTHoJDmFAF+5CP9SwP7CtfRo6gVGuCnLIrkIcSGFc2Sybjl1Ww
   NpfZNR1dCx2pbzEI2OSNUMIEKtbhfWHAUZsgGKLgVCH1DwQunSHOX93mf
   g==;
X-CSE-ConnectionGUID: OjTvzPisRTSqcRRC0XPy+w==
X-CSE-MsgGUID: 3ehvfRy9TjC+YqsRi2Fngg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="212367974"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="212367974"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:44 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 97C871C000B2
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:44 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 483871803239
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9EFB82000761;
	Wed, 24 Dec 2025 09:14:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/28] python3-tornado: upgrade 6.5.3 -> 6.5.4
Date: Wed, 24 Dec 2025 17:13:02 +0800
Message-ID: <20251224091304.974-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122876

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes
~~~~~~~~~
- The "in" operator for "HTTPHeaders" was incorrectly case-sensitive, causing
  lookups to fail for headers with different casing than the original header name.
  This was a regression in version 6.5.3 and has been fixed to restore the intended
  case-insensitive behavior from version 6.5.2 and earlier.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tornado_6.5.3.bb => python3-tornado_6.5.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.3.bb => python3-tornado_6.5.4.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
index fedd2700a7..9b43d98e1c 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "16abdeb0211796ffc73765bc0a20119712d68afeeaf93d1a3f2edf6b3aee8d5a"
+SRC_URI[sha256sum] = "a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


