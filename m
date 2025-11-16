Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF500CEBF88
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 01:10:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1222.1763255414468302527
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 17:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OH1L74RS;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3438231df5fso3719616a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 17:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763255413; x=1763860213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnaRlJnqb+EC8l+VdDCUIxu565P/lrMaAxxflB1eBvY=;
        b=OH1L74RSOdy8eV7HDEKi/uIGZiHeU/MuSRtMcF35sXhgYQPe8bnihLnJQsQ3noaqti
         CArZ5vcANOtCUsdG4peVN9bl68PbSMr2qteF+HZLvmAEgujyCwAGLrsqGRwpHUSKIHK/
         LXYOp/AtQm1KuvDhpBZTLHNmNtuz7no6oahoyq8zsQ1npYz2FaqpErydDssWJ/Y09jn2
         VH603XbFM5Z3ggFBd3FVSChysAbN2WolNC0GEdSaPMu0c2+elO4HggxobfMjby8tEkIY
         YFjvHjY00bKBIY0qzjN29zHtguOEGigakxbwP/PKDTO8QmMQDQvFG8sDKdkX5CzvVDvS
         pu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763255413; x=1763860213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnaRlJnqb+EC8l+VdDCUIxu565P/lrMaAxxflB1eBvY=;
        b=KWSRlcu5aueK4Ax+hN2A3a168s0I96SlbHhjgR7X7PFIQH4QYFi2Gv+cAVorQcoHkZ
         uKO1gXCzfiWbti3iKMtMpWqWEDrtp9Qj+prs1Midrv1rdyDdNX8kYVvW2VRuii9K0rQu
         Raa16DENB8cEjwDe50mWxAVNAYXEv/2TFAVcD3Od821lOlUFp/LheUx5qy7dAWmA675P
         o1pgRJWWPXs5zTD33Pmr+s1/l6Bjy3pJr7Fu/G/87Z9vOvK8g/nRcs1aJsLjIX9kkuOu
         L33ftxgOPAMRlCtXK3yLqgu2fwOJnedfaCDRdMoA/BsMDloTKWUcizjDpYQ3/RnZE7I+
         NtGw==
X-Gm-Message-State: AOJu0YwThsbu+UpLmviCLbc4kXA4Vp/smEmJBYIiELqmQBzCanNJKAFr
	8kCiwwdKasq0TM5UsDHmCqNvI03Pf+43l6+XaaFKsLdDNX/9jWQh7W9TNRoi9SaD/3c=
X-Gm-Gg: ASbGncsGX771NsB2J3OJo1zdZozUpNmNEqzAMJZ2eWzdFY2A2kO8wkXjxiOTTAEUkSW
	Oojk0Jnr3GLPq90APGEVE7UrrWIxoba42lQSGvcLYMVuxuwJWXJYTHa/Fj0QoNM12Tz6tyFj0gM
	PkKb3V+UkESh6zpWyXPb+JNZrfZ06dKZQG08gML+Spw0wIReN8fTw4jxHyJaaT3Kr5QjDGL/5S8
	oTF5bbbmmyOc+956LaZm4QAT8sjA7A8q+olz8+5yofLbTL2pdHXKdwQ+9oiPexaVybF4xxdflXq
	FPbOZ66Cfl2gGU2YE85NmQdQTBUzbX775Qvs6PP0ey2pqUmb3BqGlbFpQ0D3gpg9cPnGWZ+iBci
	pufbMP+RO1h+sRS050MjjNgHMEoiZBP+2oicqsLXRw6d9yzpMp4iYptmszSQWm02tJKEaGebQlK
	Z3V6+cVOBQTNHzVOzAyzM1NXWFUNbBsA2H47H2CoZpa0JkA33lCBy9GUBWl/eWvPmNCnA2Y1+s3
	un3tMHNpviKYRlmCenmTw==
X-Google-Smtp-Source: AGHT+IFoLPpY3iDfhNC3zi7mtckkSYBHLe0wctzLhUOF8xhnfds9srd3HPGkPENxdV413+m/5GK35g==
X-Received: by 2002:a05:7022:ef01:b0:11b:9386:7ecd with SMTP id a92af1059eb24-11b938682efmr2357773c88.42.1763255413362;
        Sat, 15 Nov 2025 17:10:13 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm28842460c88.1.2025.11.15.17.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 17:10:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] googlebenchmark: Disable c2y extentions diagnostics
Date: Sat, 15 Nov 2025 17:10:10 -0800
Message-ID: <20251116011010.924811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 01:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121748

clang-22 now finds __COUNTER__ and it complains

| sources/googlebenchmark-1.9.4/src/benchmark.cc:15:
| sources/googlebenchmark-1.9.4/include/benchmark/benchmark.h:1461:30: error: '__COUNTER__' is a C2y extension [-Werror,-Wc2y-extensions]
|  1461 | #if defined(__COUNTER__) && (__COUNTER__ + 1 == __COUNTER__ + 0)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
index 4558aa13d6..7f6755d51e 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
@@ -7,13 +7,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main;tag=v${PV}"
 SRCREV = "eddb0241389718a23a42db6af5f0164b6e0139af"

-
 EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=yes \
     -DBENCHMARK_ENABLE_TESTING=no \
     -DCMAKE_BUILD_TYPE=Release \
 "

+# Needed with glibc 2.43 which also defines __COUNTER__ now
+CXXFLAGS += "-Wno-c2y-extensions"
+
 inherit cmake

 FILES:${PN}-dev += "${libdir}/cmake"

