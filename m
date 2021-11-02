Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395ADC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 00:54:25 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.3184.1635814463484940475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 17:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A20sLlW022159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 1 Nov 2021 17:54:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 17:54:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 1 Nov 2021 17:54:20 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mozjs: fix powerpc compile failure
Date: Tue, 2 Nov 2021 08:52:53 +0800
Message-ID: <20211102005253.38996-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 00:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93761

From: Changqing Li <changqing.li@windriver.com>

powerpc disable jit by default and also have compile failure:
WasmFrame.cpp:57:76: error: static assertion failed: Aligned after pushing DebugFrame

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
index f308b4863..cc2673e74 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
   protected:
  #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
 +    (defined(JS_CODEGEN_NONE) && \
-+     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__)) || \
++     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__) || defined(__powerpc__)) || \
      defined(JS_CODEGEN_X86) || defined(__wasi__)
    // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame is only
    // 4-byte aligned, so we add another word to get up to 8-byte
-- 
2.17.1


