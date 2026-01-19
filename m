Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79198D29C58
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 17:55:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40589.1768845309766171381
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 09:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f6ON4ya6;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so42566665e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 09:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845308; x=1769450108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8R9Ys0pdF1QTg3vd2lupIvqAYJl4YbCxs1IWmbPids=;
        b=f6ON4ya6Y24loi0emwkEVLUjQ2fwISD8FTVk+NpMpwIGkvgn4bXsjGnsapMl3Gc7jV
         WCJtklfxxXonDIFp5NRE/pgUTsXBP1CcXF/sEpUBSV9QbqQLx+x2Vg2woEIRLpdcZCIU
         P/J8JXFvzOL79kA+ODUozn97A6Nf/JsEf32ERdwDtE+pmT8stKebRm38h8O36i/isVUw
         HLgcfUcAsNLLCnLxyQFjppegBf3adeEUWSWg6BH4w9ztK25LpJJ3zVSeKuH7oueF3w+3
         y+atTBzgr4AqnvuTs1ucOxqDX5Yn5JTeI2kJUjJs/85Tlq580Ab1nQ1x0a5Qwa58INJr
         gRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845308; x=1769450108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K8R9Ys0pdF1QTg3vd2lupIvqAYJl4YbCxs1IWmbPids=;
        b=M7yACyodkivGY5NLAUAYUDbJP6T2pOjmi3spzB3yW7avWLcKgw8/QrAaz+zxreyiX2
         A+kBMV9OssFzJHzYIygQo0FbOomj6175Hf5ef3jFMuu3e/UV/i4I99RtsnFBpyq3RGpB
         bEkbIJJuic0u7V2pgmeq1uSaBnaoe6tPalKKPWHuk54rYyUBMzyT8GWtwqtThxamQFb9
         vA4PctQ4225Q6G7nGrJqQFHpQVeeepOydGiW51hVeOfXtwfcgZENU8Bw+KVraknbKaSm
         tTCl4IY7luAG9TBesoPkkqr4kCMlZwojz0O0NUsJZ6Z5JzsDYFB+qz4vNfBJIoTG5q3N
         yiwA==
X-Gm-Message-State: AOJu0Yz2UavNE3izrupQWHXfubO/bFPhqUnuZIOn8lBlWy8AvBJ4Dmtg
	cnuRkDxnbaCWL53raT/ybRWTg/1QXXNdnr9Cj97HP88jANbSCJlp0NMbopzWHg==
X-Gm-Gg: AY/fxX7n4EE173mQ3m5u4NrEcD/co3s1Bwee3m2Bembq/TuBfRZKh+fKtv/GeDuHNiB
	OQoIEp14BxWw4YBdxUzHM2YKnEZhY5ERe/yfZLz/PDUX5kWAecUu5SF9VEP6iz1prQ1bFyqwDqp
	oUz2Yhwbq0DBXkeLMGANmA6YM7BLDCDcjwUHNEvakTdZ6hsFh50blODpBUcndYveLOANzse9whQ
	lcr8vWMhFn/BBhuhA4bm4EjsdHhxyQrkF3iwYvK3keqUO7aAwWF6WZBts+Zu7j6D47z3Bc9+tvA
	CdGDItQ46f0I5uSdKSda+cW4SYZKn2Cr2YlcP0Z5axQCGtYyBRX+eew1sVjU9ySKQZ+sDgzd9Et
	yd2A9tb07RClga2rCFLheJIbdAxfTJ67sIdgE0cSmXj3AOB8YnSOAz5C4UeM1lsTwuXoscNo8kR
	NT9RgKENp4
X-Received: by 2002:a05:600c:1394:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-4801e358880mr142150035e9.37.1768845308120;
        Mon, 19 Jan 2026 09:55:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8795f1sm204201785e9.6.2026.01.19.09.55.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:55:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/4] python3-lief: upgrade 0.17.1 -> 0.17.2
Date: Mon, 19 Jan 2026 18:55:04 +0100
Message-ID: <20260119175505.777598-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119175505.777598-1-skandigraun@gmail.com>
References: <20260119175505.777598-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 17:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123646

Contains fix for CVE-2025-15504

Changelog:
- Differentiate Mach-O FAT magic bytes and Java class
- Fix MinGW compilation for some configuration
- Fix alignment issue when rebuilding PE relocations
- Fix infinite loop when processing v2 dynamic relocation
- Ensure that added DYN ELF sections are properly aligned
- Fix GnuHash null dereference
- Fix strong performance issue when parsing certain Mach-O

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-lief_0.17.1.bb => python3-lief_0.17.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.17.1.bb => python3-lief_0.17.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb b/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
index de6390d210..e7de6b6d3b 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9ab5db472ff936b441055522f5000547"
 SECTION = "libs"
 
-SRCREV = "fe54643fe3d7a699c68b164dae87afb1eb059342"
+SRCREV = "aa2b617f47c2f75fca9ff00b146dabbaf1b9f422"
 SRC_URI = " \
     git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.17.x;tag=${PV} \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \

