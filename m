Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35366CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 11:22:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3696.1762600953893164559
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 03:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNUmqsyD;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4711b95226dso14609865e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762600952; x=1763205752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYcqHAjwddP8EgII7cibm55TP/bCTdvJFJyjvCX6MRs=;
        b=ZNUmqsyDITnRxXMsbIU29DtOFLZhjOTpW2QrXXJDVBY8xkP4kGLCvHhRP9prGxa1my
         2GrvNw4LkWIkAcrSMIt5vu+28pkEmOJ3aiQRMqLsgLdW/UpGfDeCEvhwWSQH9Xst0vPX
         l8ilZI+MTH3y0Ddf20CGaMNN8i9/dvOP1G6H78INFJMLggIhKOHj+/LJ/OB/TriqBv1w
         CMOSqDo8tYxuP+U+Qv4qTWEMhkCmHHbG8rnDl+xMyd7YkWAJ2MKu7vXf6Hu+tvzMU0Ga
         Wy7MrTkDkiMVedf9P8Va4LoZmxboRjJf2QlptkV1N37UQI21d+26g0IeSvQsLcAz0Zhl
         FnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762600952; x=1763205752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYcqHAjwddP8EgII7cibm55TP/bCTdvJFJyjvCX6MRs=;
        b=OMOzRrxIG/i1S5za31Z/jU9wrsQWsnxaPN3X9G9Ou1UV1izvtgqpCLX0qmpB1VT+Uw
         3ZKUkjDwtilQYRJKO6AF3cKWFleVmZGZPfxahYTSoK9JUB3YRC86tYKrr4f7Kyq+vOcg
         EFCUEAeT0h+jyxE25Q/gdweNbaeb2mBENMb83grqJdsDit3mh1mAHPLwJ1jcNIiTNr6f
         4sqQaZ6s0CI/Qg5KRIKPDPU8L2neQLYPp7Gv0VfD2vy4abqLgUhOjcP3Q5ISTMbRIycS
         E1HSvMggKc56cZdlc0VqDybzyN4owGy9JeLiZyAXfyFoLhjwsNVIhzdYGi9LBfd467+o
         02og==
X-Gm-Message-State: AOJu0YzgQ8xrfQ9pkeFMYEFM4gR2F0xhfKaA9E3VtiZunZiv7LGJpfFu
	tSRJ2pugrEKeQ6duT3lmJDkvDEvUeUxHDMLP9DzwDf76ErY+1bq/zsLH+zcxVQbU
X-Gm-Gg: ASbGncsYRkAvzDXzssDy0OhMqCRXzg7V0uUBXkm1JrBdb+sBdhAMnEQpMfv72Iiv1u9
	MT1g3f6jKmRLPsjMb5poR2+By2+5c5BFWLakeSNoLKSgf1rkX61aydbTiRfG1jQ8auAdVIRhSc9
	QxIOz82+0Pv/Llqkb0bP2BjotHsykhp4EL/mv3oWVJNXnogbOSrPMZO4X+1VnWqOLEzO329uWQw
	I7Tj5Bs2kRu2xg33ovZP5odGR8fAQrmGbtOcYuXDQHcG6O2wMmh9XvBlrLMoEpEEhleF/i4Obx4
	iCzQY1I/Xjd1aaBFtiqJwkFa9TW7mJMOn1wegTH700TTld7UJLyc6YPxR+JmZ04YZfbpbnTG1Ae
	M2i1IfwAJE/ifZd1lFZoUEl7EC3uSItJZHkiKFJRc9QpOCcfZzGZV7XvmaEAn3yjQDOT9Fd/TmT
	BiEnnbq7Ie
X-Google-Smtp-Source: AGHT+IGRHMbQXiNfMj10eKY7UZUAtUinU74aqjIBjmKcqhIleSwcAls6l9390Um/5eijHh2q3GiC4g==
X-Received: by 2002:a05:600c:3104:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-47773293cb4mr20541335e9.34.1762600952116;
        Sat, 08 Nov 2025 03:22:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763b5359esm68934175e9.0.2025.11.08.03.22.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 03:22:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] mbedtls: update SRC_URI branch
Date: Sat,  8 Nov 2025 12:22:30 +0100
Message-ID: <20251108112230.1967268-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 11:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121380

Branch was renamed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index 950c1ff52d..b126aee7db 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28;tag=${BPN} \
            file://run-ptest \
           "
 

