Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E820CC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3375.1787132237574596314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s0bNSwH7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132237; x=1818668237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S285AzR8VHE5ISstUxAY/VagiDaa3xQBui2a48XfWtg=;
  b=s0bNSwH7QywLCOZbcCO42XsV8MAr7TUOALesfY3JSg7Nhag2L6tzWOf0
   ZCAjrK3y64QXIqrSyWMAGXZ2q2mLqn/6duLNznSaMNVadfOJkszDaAJbM
   JLUe5gL3Uzhy3FKmGK1ZA2S70I0/9OYVZKzAkoCs1grKpkiV83DPddLDH
   9okAXNpawKXO0NQ+aNaLQz6jYo6NINEjOJWNU8Lr6U01KTDXUmVkKQj07
   3b8LThSL0x+FBAMRzalt4wn+0tX32FdXXf1Tpe1X37Nz0ZPV0iOEB203s
   euY+mucnF64aCfbIDN19whHLAUxRVwavVfZUtbBsH1zqKr2A7qW1FgHLi
   Q==;
X-CSE-ConnectionGUID: 7/lgPV6aS22qPkbTYBvK3A==
X-CSE-MsgGUID: utn13nZdQrqep+IjIdofYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239835479"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239835479"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:15 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E31473042
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:15 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 957431000104
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8D8D61801C0F;
	Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 65/70] python3-xxhash: upgrade 3.8.1 -> 4.0.0
Date: Wed, 19 Aug 2026 17:35:09 +0800
Message-ID: <20260819093514.1101-65-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129335

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
===========
- Breaking change: Drop support for Python 3.8, require Python >= 3.9
- Breaking change: Remove deprecated xxhash.VERSION_TUPLE
- Breaking change: The input keyword argument is renamed to data in
  constructors and one-shot functions. update() additionally gains a data
  keyword argument (it accepted no keyword arguments before).
- Breaking change: str input is no longer accepted and raises TypeError:
  Strings must be encoded before hashing; encode to bytes before hashing
- Upgrade xxHash from v0.8.2 to v0.8.3. Note: on GCC/Clang source builds that
  target AVX2 (e.g. -march=x86-64-v3), upstream v0.8.3 autovectorizes
  XXH64_update() and makes the xxh64 streaming path about 2x slower. The shipped
  wheels are built for baseline x86-64 and are unaffected. Source builds can work
  around it by adding -fno-tree-vectorize to the compiler flags.
- Add per-object locking for thread safety, with sub-interpreter and
  free-threaded (no-GIL) Python support. The GIL is now released only while
  hashing inputs larger than 64 KiB; previously update() released it
  unconditionally and one-shot functions always held it.
- Speed up hash constructors by switching them to tp_vectorcall.
- Build pyodide wasm32 wheels
- Add s390x big-endian test job
- Add Python 3.15 classifier
- CI: shard the PyPI upload into parallel groups and create the GitHub Release
  automatically

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xxhash_3.8.1.bb => python3-xxhash_4.0.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.8.1.bb => python3-xxhash_4.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.8.1.bb b/meta-python/recipes-devtools/python/python3-xxhash_4.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_4.0.0.bb
index 4416949f2f..52efce26db 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_4.0.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "xxhash is a Python binding for the xxHash library by Yann Collet."
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=82f3295151c5e61043a4a201c031a5ee"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6a4f6d709b13927e4d5e9ff13cf8956"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "b0de4bf3aa66363552d52c6a89003c479911f12098cd48a53d44a0f7a25f7c46"
+SRC_URI[sha256sum] = "6b4040b26c73c75e6c12273b0ae237f9235f39cce5fabb683a64e9f20d09df8b"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


