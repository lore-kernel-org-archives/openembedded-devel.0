Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD284CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4828.1761099782447904978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tdI/xOum;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099783; x=1792635783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PPwPHhDrAwvqP/YDUPyvt3wgoEGDkCRlrF1xaHPOzc0=;
  b=tdI/xOumzmD/0XIoZ27K4yEFm0JCUu50zv+zOaZ98hhC+pG6T1+vSKhM
   yTBVLyUbq58HfUiGIjFA/b0hkG8aHFz+DzK2Va2NATrAnKU+Fp92r/2aa
   x1EoLQHJZ4fDgphNeMG7VKCFnQB/v2pdFkLFW5OayTT6z3eRmlfZl7F5p
   Uu68PyP8dwn9UlfzIsXdAFfULwqRNVgW415wHcTH6zpU4ircAIPpIHNGM
   IGCOIqwKpjOFe6NcGIV5HWRizN/FA2qxzCC8RJhg+U9hebV9dYKYur0Au
   d0cd4wgcXN666doxje86zpGHiHAfr1KJt+rcBwtqTJjvKcJb5y1LQd4VQ
   A==;
X-CSE-ConnectionGUID: TanDE5qZQ9KqXTcjdATdjA==
X-CSE-MsgGUID: zeW3yfsjTAiFuDCeh0qNng==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216654696"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216654696"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:02 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B82881C000F0
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:02 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 72AB91C00174
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D9D8A82C0DD;
	Wed, 22 Oct 2025 02:22:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/29] python3-coverage: upgrade 7.10.7 -> 7.11.0
Date: Wed, 22 Oct 2025 10:22:11 +0800
Message-ID: <20251022022227.226-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120862

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Dropped support for Python 3.9, declared support for Python 3.15 alpha.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.10.7.bb => python3-coverage_7.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.10.7.bb => python3-coverage_7.11.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.10.7.bb b/meta-python/recipes-devtools/python/python3-coverage_7.11.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.10.7.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.11.0.bb
index e3b7ffb7db..6b188c727f 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.10.7.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "f4ab143ab113be368a3e9b795f9cd7906c5ef407d6173fe9675a902e1fffc239"
+SRC_URI[sha256sum] = "167bd504ac1ca2af7ff3b81d245dfea0292c5032ebef9d66cc08a7d28c1b8050"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


