Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF4AC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:18:38 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44663.1784715512291342481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nif9/puD;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381216921aaso11605406a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784715512; x=1785320312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLLc8iJu4Pg5RhkdQcBZ1OkwZyQZn3a1f1stHto1G58=;
        b=nif9/puDBkb8ryPpHSJ2ir5icfzv7rUEtmLKizm5CN2ba2G47fJnMcyFzLK1/GICtD
         KMGTI/d6uBoU5saUZ2O89F4fIs3omH+IRDKdMaF3ID0cBrp/5LAJs0p8d916rgpWOjYu
         AanqWx9L/L8o2hZQqQluyjm4iwd3I/Ebb/bRWzYPPTo1A4aMHBQKSuSs/sJiCBtpBgP9
         hBl2dpMixCAXJQPCQB0w3BUJhTBVmX9AiOGUQu/bw/GyWqssP9QYGM57hoR+YCkTXMhw
         +lVjcM6N52gYWfO/8v/jX1izSVw8+h2IBB4mk01FYG7VQ2WNgNUenDgJ+DtIwUvPptAl
         4IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715512; x=1785320312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLLc8iJu4Pg5RhkdQcBZ1OkwZyQZn3a1f1stHto1G58=;
        b=ieuMoi9D+Hqz4a1P6/GqcvUgSOz/liH65vhCAjD0Iap2NumHmFGXFYCEBD1YJGMlvn
         Vr/WBHEmHfjYblzHMqAWzm8SGBfSLThOMghsqDESaM6IXyOYhZWTRmwb1BVUaa3wAOLW
         fbT7KwqfwTWnfGURPCj7MDk/Ff5A7NrJYldVuBtjr8zXWwv56B7cyfT9fG7chpel0zKJ
         wRR4VQSbkolFGT4FirqHkqWaPlxSUDa9sbDuAzcJ7xw3UeysqfuaA/FJkSPRnA4Li93x
         ntyKlVJfg1pa8KAE224cEcG/MLMZboU9Ql5k6+0ramN0X7tOANwW/DR8utQK1T0lD3mB
         45gg==
X-Gm-Message-State: AOJu0YwK/UnUlwouhXIW+5JB1Yub+z9WMM8XqEayKaYpqg5/errqIls1
	h/eoy4CXhoXWtGa5Ocm4RNrzpCnEWB4o+R0BpGEYZpSjitPYX+OJZc3S5XdfTk5E
X-Gm-Gg: AR+sD10xayXyzAkB3RePr41btD+1PSxjtLYdXcxMYKM93gmRPrjHh+HMJr6V+bb6Hn5
	KpJYFj678cCFexGYuzosSKQ+QZ2Hx7/TIRiFRM36SqTWWtn66+HZyI0sgS54OHxieAz7aWm0tZe
	D/ZYWwWogU5KAZelueptOFAyly2d+OgsfNocxwywkTnU6PHguSRTnLwlXNuMVn+lf6rccH2oh5a
	JwurXLDpkP11WzF559UGFgIlCWwsZoGVd8mTTk/czdMcfoclXWMc/YgHVOOTsjG0oBVFx2YzJ8j
	edvPp4alibBrxM6AxQBzyFeWDP5Bvhhq0U0MzVGv6OGTLfGk2sYeiInQ7OmybacDwMAaou+E+2m
	mLZajlW5hVu48yrZKUi35/jAB1Win+Bx8U7AT0Yh6Z8QBareT5zzu3JWFYA1tn1upwRj7AQ4CQS
	cN6fdRSICnRRSL3OM=
X-Received: by 2002:a05:6a20:9630:b0:3bf:6c08:fba4 with SMTP id adf61e73a8af0-3c3ad9744e7mr24709955637.56.1784715511720;
        Wed, 22 Jul 2026 03:18:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm7808659eec.12.2026.07.22.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:18:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/4] monocypher: upgrade 4.0.2 -> 4.0.3
Date: Wed, 22 Jul 2026 22:18:12 +1200
Message-ID: <20260722101812.625240-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722101812.625240-1-ankur.tyagi85@gmail.com>
References: <20260722101812.625240-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128370

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed timing leak vulnerability in EdDSA/Ed25519 signatures.
- Various minor documentation fixes.
- Various minor build system fixes.
- Various minor compiler warning fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 25cfd0324c734a6d7550629fd0e8ab751d0d3adb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb} (85%)

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
similarity index 85%
rename from meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
rename to meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
index 813c6ec4c8..3e06b294bf 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.3.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-2-Clause | CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=ff30a1c41dfd9e6fa559a9e45ee98302"
 
 SRC_URI = "https://monocypher.org/download/${BPN}-${PV}.tar.gz"
-SRC_URI[sha512sum] = "bf275d4c53ff94af6cdc723a4e002e9f080f4d1436c86c76bb37870b34807f1d7b32331d8ff8a1aeb369e946f3769021e03e63efac25b82efc5abf54dc084714"
+SRC_URI[sha512sum] = "40904ada5c7ee4f7741733e38b69a30a4b0561cbffba5ffe7c2dce16136d540251ec0d9056ff606510d3b5b708fb8a40db7e0870d4a0b2dc17ba2bfb880f8965"
 
 MIRRORS = "https://.*/.* https://github.com/LoupVaillant/Monocypher/releases/download/${PV}/${BPN}-${PV}.tar.gz "
 

