Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F246BCCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:27:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.621.1760725648094255080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lzf5XuIz;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47114a40161so22564945e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 11:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760725646; x=1761330446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+D0Q1magy0adk7IIO/+34QO5eEliYSHsjEaEaFOuDVI=;
        b=Lzf5XuIzTflznn+O3uhMiJp1m6Pbkwr+1wymTRCzQjtwEzKC1SpglRVDKj1tZ/Ts/0
         XEkdEqkiwKz0/khrCClVjZS+nO0rFTVoY4Lr/tbwW+e8maxUkWMyngCQHanXz/053OOj
         Kq7cV9kB8ZeWr1juc2wV8dErpdyF/a8A4ELYbE2uLNces79ftG1971GZVQfRBhHolGpP
         C3LDQaPmaN9CogN85m2oSlMEeERQNJdLgvApP2ZXVyIx+Mcmxv4u+NvKjyTjRmT1SJ4T
         CLz1c8MVpy1r/1TFdv04L3ogNUO/QakzLhJZd40FkOxm8lnPL8Nah3mv+bn87pPEl+Hg
         Alng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760725646; x=1761330446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+D0Q1magy0adk7IIO/+34QO5eEliYSHsjEaEaFOuDVI=;
        b=LMQ310AUUwxuAp902wDVVL70xBe8YrQKfBeEVaq4LsSovnfsifL1rkKhf1OYEePtKN
         yak5QJvLwPuTA1U2q/KexJQOLZALDGiqTCfYg0XzR4ALfDtzCg0yS/874n2cpljafBY7
         Il+VuxOlcAubvs11FJ/O6qEqrokhCxeNmjAt1rirFUxkp765k8PLvWngN71TLMXPXVz1
         qvVapy6UWNit298RZV/KrC7AVEpMYOqYR0eH6sD8n/WOFDEMRq2C+6wstdW/CGGDd9Re
         lXAPpWV7J3EzFD+1ZY0MlLgBmuE/YjiAiuklmrl5ecPDaenaH9wNPTgDgeg9a4EZ4KNS
         WxAQ==
X-Gm-Message-State: AOJu0YypHnZM+aZZKB1S7uDclfmi74ERHsZUHHXLX85AXf32XS1NdQMm
	PFCHCaYdHK94iY2TW0zgH3KP/2ZTZlNGugT35zSVggNWcFnIfcU8h6OtIb8pfg==
X-Gm-Gg: ASbGncvNlDTInYnPQFPFmOdwzongyREdDBqSrxG+2Z3f9CN7ZoJJnszqdiVI5xg66Se
	gkv9MSmMIOzGH7tqtTFXFOlJmwEE/TmGUFKtYBq0jkpB9AtB+8RFc3UKwBpAWVhUlm88UAkxGaR
	zJjN96mAekVEHtXrSE9u09XxzOWynz+8mC2CFl1EHgLTR8W63fuA5GL0bsvQO+QxPxo94UqAvBh
	GBO3Ai0xa+oH8060S3NkwEwmKanLBZUCmDPCLczwvvTBGAp6SAU0iF/fOT1/eqgNevqzb/Lskms
	UcHkOSIA9mLYNqHHGKa3UFhbXglacIfjbS08H9DmJJk5DIe9S6SfC11actWZCLvRqlh4IOSAPGA
	jWXBKmzQf9iE06aWIfGEWqMHV3ctKW6HhmwpjTkQtv3MdLAbKffgUijGVsmqCgHJtuXfsOlUZx8
	F/P92XJmaV
X-Google-Smtp-Source: AGHT+IGdDPQbSsp5shUL2SJYYmXk7ovhIgKJVs2LDb0JaZvO3NHzRSuRbv/tAOnPWMV9/qfLQDzI5w==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id 5b1f17b1804b1-4711786c79emr42423195e9.6.1760725646045;
        Fri, 17 Oct 2025 11:27:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711c487dfesm62771655e9.17.2025.10.17.11.27.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:27:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libdbi-perl: fix ptests
Date: Fri, 17 Oct 2025 20:27:25 +0200
Message-ID: <20251017182725.2712919-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 18:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120771

Add missing runtime dependencies for the ptest package.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index c128cb7154..00f8181065 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -42,8 +42,7 @@ RDEPENDS:${PN}:class-target = " \
     perl-module-universal \
 "
 
-RDEPENDS:${PN}-ptest = " \
-    ${PN} \
+RDEPENDS:${PN}-ptest += " \
     perl-module-b \
     perl-module-benchmark \
     perl-module-cwd \
@@ -55,11 +54,14 @@ RDEPENDS:${PN}-ptest = " \
     perl-module-file-path \
     perl-module-lib \
     perl-module-perlio \
+    perl-module-perlio-encoding \
     perl-module-perlio-scalar \
     perl-module-perlio-via \
     perl-module-sdbm-file \
     perl-module-storable \
     perl-module-test-more \
+    perl-module-test2-ipc-driver \
+    perl-module-threads \
     perl-module-utf8 \
     "
 

