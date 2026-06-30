Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12021C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17242.1782811354103276966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rAncmhyb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811359; x=1814347359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VE6TNss9PcgN1KI5FK2oqaQ6p6do089z23eei6ykRV4=;
  b=rAncmhybyulcLNMhtg5zhLc3ekl/wZUCF/S9fmzyknfT+uKTBnuUPORf
   EBANNoTpiI+19Uomf/opflodKNSZrDUWrKEuKVE7zhSKZlWVYR+moQgjo
   YaBblPUb85jvcoqV+QZIkLOSQ9zlueqO6afQvU60qqACd7tgj25kV/xum
   PPLxPPa0GDEMOgYI2w5M8BCTSRGfgYiogXA6ygNybgGfThBTT4+KNwSs2
   aUZtJTdNg/0QNiTQlS2zf1MSM4F0OzM3qtawgnH5g/rnGG2QYl4urasrn
   xSqfSSgu19dM59/hQ5FhVeQWUIuookJZCSnqvl71gHJpKFxMkiTxFOSzz
   Q==;
X-CSE-ConnectionGUID: HWxan/oNQXaOUbHSH13JNQ==
X-CSE-MsgGUID: VP3b1OJvStuuJRjUygr8IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233776230"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233776230"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B1FD61C000A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 68A8C1804141
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7C25C82DDC3;
	Tue, 30 Jun 2026 09:22:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/37] python3-gmpy2: upgrade 2.3.0 -> 2.3.1
Date: Tue, 30 Jun 2026 17:21:46 +0800
Message-ID: <20260630092206.322-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127960

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gmpy2_2.3.0.bb => python3-gmpy2_2.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.3.0.bb => python3-gmpy2_2.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.3.0.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
index 841d87097d..bf35e57076 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 DEPENDS += "gmp mpfr libmpc python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "2d943cc9051fcd6b15b2a09369e2f7e18c526bc04c210782e4da61b62495eb4a"
+SRC_URI[sha256sum] = "313f35e9fe6b9ddf72759b14dac25166fe5757c970403e4bbf87a70ab2be07df"
 
 SRC_URI += "file://0001-Avoid-do_configure-requires-check-error.patch"
 
-- 
2.43.0


