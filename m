Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C52CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:33 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6897.1791371303825710516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ut3hkF8f;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1665646a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371303; x=1791976103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87icczuVx0PnOzB17Ty32bcPSPGGS2EbvCg3mzFAYC0=;
        b=Ut3hkF8fVvZR37lulkHuCQgljhYOSvvcgEJUNtsVOgAVROpaL9a+FHHdCdOF8RgOz7
         LKV3bdkc8ArXXIRSLq6LV7tTqheqjy3b/SEHh2VeS8Pv3HQ3U9uFIE0fOMLslJsYKg4U
         xIB/iOpY78mVg0lYpTXwyOkEzq03PtI5LYjO6sBLvBGVmw+UzYs7U0NcFsQ/qzKIFv12
         k6QGtPMjcPUqVaV0zsmyk4bVyeBEuChw6s5fNyo4oMWPzPvwU/QMH+MJOJ1s0hoki3qO
         d6+ipB7cGPMx265M5XhN6z7zgUODswNDZAjW0niWCtzypHxt133U5MrS3McIlNfUXGvC
         5VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371303; x=1791976103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=87icczuVx0PnOzB17Ty32bcPSPGGS2EbvCg3mzFAYC0=;
        b=Ik7rlR/xaykiA15V4ywG/lT/qkpHYzEQB6uWBV6Dayun6Va8Yywwy+Rr2crLFCEiWG
         6N5J1UnjbqLnGlVTwYHwML5BWADwQiAi1g4Sr3B8zJnonKJgg0Dkeoa5PM5on8FOZTcQ
         4LkG+Kvkdx7KgvgbrF1Q44FJYlZXlJlDYe8OSRMQoB7s4xXTfdJjE0ERHvRD2wHWFUXh
         OVpPDBDGuLHJp7YLHFZJkV0a+RV9vyan1srnmB6KJBAZnMrj7psYlCCDE91UHVgJoTjP
         dbqlh2RHzFP3h/MZlGghMMB2b5drPqb51SBcN7uzdl7SVGc3d0HFCpUEimxmfOU54m/P
         GwWQ==
X-Gm-Message-State: AFq9FYKdRkx/3CF/TZJlaRaNxwPElOAIO2J88DSihdCNQaVrg0y/LonH
	9qMjWzwa1ColZB8N2ZfmP0+NcnVd8QEhJtlRpQ142uYDwuHDcOEmOhI3IMtcDq1H
X-Gm-Gg: AYBFou1AHJOcOA21UsvXsNKulpBPOklIfM3HjClx5ha5ukML9M5Dwj5Y/jAaC4f/iaN
	8AZFYJgzSfNQvhyIsWihklPHObY3EiKtsRYGkHdIiXnm8LGji3c8l3Z5YpZO6SI8oVAQbcqIPyp
	KIb7NnCwonbnKCaAqik1Klj3uIVqp4fuay3ZjnEpkS7Ir61Zzahcn1UA7UOsLNRVs8RLj/OnxuN
	G7iqMKFaJWVnBJkbpwMiGUYZsjqbBssxFebMiKS9Z2Z5t1LlFIps1SxWOI5Z+r/E+qC6K7nhqtN
	OeaDciHia8/bdvG1HLIYV9YVCtQuvtHj8EgIliZ8V1iEb8DYCzRiOY0KD5T5Mwrqco6kTy9PRfC
	H7ypG5XD6vaw/Y0AOZpqZm6E4aVYfxf4g80f9mikiDXtRj6D61qTQ95otoREKsmMhRF9JWEEByd
	d9+Ag+WgR2R8naLoqUwQL2qnMV9RtEs5guWxcV25pzphKERfJAsTJemIyDhT92I81agRsTZU9Jz
	+QsVOECtShT8MAXxPEwSHk=
X-Received: by 2002:a17:90b:2648:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3a8a08514damr1570714a91.15.1791371303149;
        Wed, 07 Oct 2026 04:08:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 12/15] smarty: upgrade 5.8.4 -> 5.8.5
Date: Thu,  8 Oct 2026 00:07:37 +1300
Message-ID: <20261007110740.3179543-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130654

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/smarty-php/smarty/releases/tag/v5.8.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.4.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.5.bb
index dcb7c85a80..83f428d388 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "94a27cbbc7820198d7adc17a2be8d457fb267753"
+SRCREV = "0ae663525dcbc9e996feb2a867e43bc85f960938"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

