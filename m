Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1314CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 07:13:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.3542.1755760420909795830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 00:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTo2GR2I;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-245f3784edcso5729125ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755760420; x=1756365220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/FSyFGG65CoheIWarzEmXEZZ7bQ5fLJAsLMqmGuAiw=;
        b=RTo2GR2IC1xc/bL5cYCwp3XDzAhV9wP0hCoQedogytd5lyu+UsAxIWF+x5tguCyGOL
         Fa2EyOR4G9Yo3/lPvZUPS7xApNXkUUnr7ZJLBOmyxGmSmcphyLVHX7ACuwvyQR6frBX5
         qCxvnzdUBmiJ2a3Lrp2EbB+f9c8vZhRHVPrZps/xXKWv453cEUGUwqmaoktM1icMOVYa
         qiT8mL0grNdd1ZMDYMe7bsNrPoeZOcQxsShNG6pALgevBymkCm89bJnvl+Q69Zjr9jmF
         cmuZU0Xvg5RLyArT+e0LZj4yVIYpHiEwChpiiNatoY/+aP4aqHmMg5BknuHQ/AHnezT1
         luAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760420; x=1756365220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/FSyFGG65CoheIWarzEmXEZZ7bQ5fLJAsLMqmGuAiw=;
        b=S8+arA3Q10wfBIXY2BnIzuj3P1hTnhekqOF+XbFkDTOnU1Vl3mfYxXpApp1t1Wcy7c
         evGc7iF/Rztp7utmLOhX5M7T58mVGy8snjP29HAtQ8yEn7kUs2kcpTYllGwt6glV3DTN
         23DoU82IhbUTvIPNOFL0pXREMmV/M/3S95zWPmhXbPR4puLpB6sC/wrzb9lsPqKx4hLH
         ZYz/q33iKotuhnJAtyWa1EttXBDfMq3rEh6Nw2+4oeTsRQpZV1hiC87r4OhxSQ2sajSH
         ExJ1ncu3nJ+e1F/WH544o64Uhn6Aolh5hfcC9lefhCPFL5jYq9dOJJOCnrbMMEGhjwDx
         OJhQ==
X-Gm-Message-State: AOJu0YzVjlWSgB/nWiBVa/Gnx5rEIxxkin2qCAQUWtmoCtbG0PJvRh/p
	OEi+Jpeu9S9pnZU4E6sCNlV8NTwQurbKmgmQcsC7iG6X6soep043CNYt+GQC98oI
X-Gm-Gg: ASbGncsHkWAJ3b/P/frJmVdPVyaWpo/r/613VJpZRbsjVOwrpEboRvWIPvhDOuQQJY/
	oP+mHZxsgImcW36k4Mqj5GgHJf3xkcvhl8f7AObpTMQztgOErCUKYm9qC89IWbUsXpWP5jy/YCv
	J+P6q8cqcw4FoNvmnBZSCTpEb+9Im/ZSrPOy/X6QU/zjwCFR84XjdGsplxysVLsHbwmNoobBfLn
	RUWzl974Vbm/NsTBHhpQkA2ZCbKu3nMiJ1qLhS4SrYvhaUrJVRVG3awu6Itk6t+oU8aMv59PKvs
	0M3BCVW1dYh+QBA/dSorhOqjJH7V0aPuBzwdc/FVur2AKFKx0vuBRWv93ugMBrB4bhJ+e2xcJGd
	DJgoSVWGCaWGfC8xcBWsDBw==
X-Google-Smtp-Source: AGHT+IH63f11s1zBqq7JlI2QZa5ygvki3zl/jaC9cCOHTgfKkFTrCb6fHC5HkZqvAkZ7QCopWM5pIA==
X-Received: by 2002:a17:903:2344:b0:242:c66f:9f75 with SMTP id d9443c01a7336-245fede2467mr17658405ad.55.1755760419865;
        Thu, 21 Aug 2025 00:13:39 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33c5d7sm46464735ad.10.2025.08.21.00.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:13:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] abseil-cpp: Link with libatomic on riscv32
Date: Thu, 21 Aug 2025 00:13:34 -0700
Message-ID: <20250821071335.814796-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 07:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119047

64-bit builtins for atomics are not provided by compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
index 4afbba963a..d4e616a733 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
@@ -21,6 +21,9 @@ EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                  -DBUILD_TESTING=OFF    \
                  -DABSL_ENABLE_INSTALL=ON \
                 "
+#  riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_store_8
+#  >>> referenced by <recipe-sysroot>/usr/lib/libabsl_flags_internal.so.2505.0.0 (disallowed by --no-allow-shlib-undefined)
+LDFLAGS:append:riscv32 = " -latomic"
 
 SYSROOT_DIRS:append:class-nativesdk:mingw32 = " ${bindir}"
 

