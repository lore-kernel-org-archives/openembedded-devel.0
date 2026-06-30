Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B0AC44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16874.1782811380585679927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GhYjYISl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811380; x=1814347380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hlmE6JqNC0ZzQq7K8OeP6wESIySAIPsxZG51rtlzsVw=;
  b=GhYjYISlYqwMyZNewyIU0DS5J9fGW80bsVmc+73/2ZOabqTTocXXM+Ll
   klULLdxDneU3tq7/FRKjui7PmdsGE/VG8kKTnjtP6cD66TZ5dtFy4xKB5
   A83t+Z7r1nXzXE1xG7FJs3iWieRt7iDN6hBNoQSRyb/uWlYToZyU6Dg+f
   6MxUsyaddrlMx4L26TlT+Zn2/6xsMhevAd71UgrtyUK7wdZ1AUj0anRBq
   IpZYFKQtrrh5d+TwNNAek/OHIXIQrzisPKKuVc48fkfmuNP2pYBZd0HjW
   0f6X79Vuo1A3Z5fbZCNvR1GAjY+OW9k8/Agv8I7dDCV07zoXWLR4znpmh
   Q==;
X-CSE-ConnectionGUID: mGWpIuk8Rt2oj56mXtHrHQ==
X-CSE-MsgGUID: TwuJzbHxRiazujTteUsX6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245262369"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245262369"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1985B42A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:59 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C1F8F101D683
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id ECC0E826FEE;
	Tue, 30 Jun 2026 09:22:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/37] python3-xxhash: upgrade 3.7.0 -> 3.8.0
Date: Tue, 30 Jun 2026 17:21:59 +0800
Message-ID: <20260630092206.322-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127973

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix memory leak in copy() and new() when memory allocation fails (rare edge
  case)
- Fix seed/reset state initialization in xxh32 and xxh64 (unlikely to affect
  normal usage)
- Replace Py_BuildValue with PyLong_FromUnsignedLong/LongLong for performance
- Update README examples to use bytes literals
- Add CodSpeed performance benchmarks and CI workflow
- Build aarch64/armv7l on native Arm runners; test against Python 3.15.0-beta.2
- Speed up module-level one-shot digest(), intdigest(), and hexdigest()
  functions by switching them to METH_FASTCALL.
- Keep one-shot argument handling consistent with hash constructors, including
  positional and keyword input/seed arguments, duplicate argument errors, and
  oversized seed wrapping.
- Fix error handling in the xxh3_128 integer digest path so allocation failures
  are reported cleanly.
- Fix Python 3.8 builds by adding a PyModule_AddType compatibility fallback
  with correct reference counting.
- Correct type stubs for xxh64_digest(), xxh64_hexdigest(), and
  xxh64_intdigest(), they were incorrectly aliased to xxh3_64 functions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xxhash_3.7.0.bb => python3-xxhash_3.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.7.0.bb => python3-xxhash_3.8.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.7.0.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.8.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.8.0.bb
index 57755cce74..d33da2a57a 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.8.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=82f3295151c5e61043a4a201c031a5ee"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "6cc4eefbb542a5d6ffd6d70ea9c502957c925e800f998c5630ecc809d6702bae"
+SRC_URI[sha256sum] = "d72b2204f37840b0f16f34192c09b994b97bd25823d723d47a1eddfacf06eb43"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


