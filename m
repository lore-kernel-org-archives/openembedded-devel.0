Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E71D2D8CF
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6887.1769507070609131346
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rp0oX7zm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507070; x=1801043070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2y39XjagiwvJck+gusVqdPoiRW0qxt5rSTpKLpzs1JM=;
  b=Rp0oX7zmuomBxQ2DQ3HXCvUaYQMdd0EQGSb6+z5/cTPgk34M7WDkJ1pc
   6cqHJfEsuSKG0FpqcTMIdy9r0PBHgMYQ57AusjB4AN/ISFRl3y5xDjY9I
   s2qWEn/V/54pYP8F/IHMTB78jbWKy1T3SCyyz8B4IkQC9MTgOpgElWTzS
   Gf7xzz3lqV09UEZ479fikOtIQkmO5bnLV29NMMUbuoSowvBzQqgP94CtJ
   Mp8iZQ8x7snahHnwlIdLQbtXpFyAlx7kjxFbjULh48J0/gA4AtjnAmHpp
   z4GU7H2QfOAvBfHMNd01YKiR5btv1tc24vnl7nugl3uUZrsFst3RYqDlP
   A==;
X-CSE-ConnectionGUID: +Q2wPPViREyd1YU+k61Gkw==
X-CSE-MsgGUID: GjSFSXXmTAafeEq9HQntZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="215857504"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="215857504"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:29 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 08EBA407544
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:29 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AED47C026D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2ED0E2000239;
	Tue, 27 Jan 2026 09:44:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/25] python3-marshmallow: upgrade 4.2.0 -> 4.2.1
Date: Tue, 27 Jan 2026 17:43:34 +0800
Message-ID: <20260127094339.1081-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123924

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-marshmallow_4.2.0.bb => python3-marshmallow_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.2.0.bb => python3-marshmallow_4.2.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.2.1.bb
index 006f91838c..b35c3f74ee 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.2.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "908acabd5aa14741419d3678d3296bda6abe28a167b7dcd05969ceb8256943ac"
+SRC_URI[sha256sum] = "4d1d66189c8d279ca73a6b0599d74117e5f8a3830b5cd766b75c2bb08e3464e7"
 
 CVE_PRODUCT = "marshmallow"
 
-- 
2.43.0


