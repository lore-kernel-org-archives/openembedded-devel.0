Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC73C3ABC3
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 17:30:29 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.15060.1746898221196051805
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 May 2025 10:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKFkVMSM;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70b51b9de1fso432227b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746898220; x=1747503020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G889YwThrAxW8CPYA4whj5V/mvEzVOtalbfz0f44cNc=;
        b=dKFkVMSMI4DsZnqVkXE6h8oScFEU0dAfUQcNvGE0fJXWCihT2u/jFsZ+Qs652u2ONC
         4Mx9LAS2bbHDRlC33lf9jAmpfvysddRcC9nvFu8g/xapdKZWdlmpNCZVKcJiTU3u27DZ
         AqsC5Qu3V+ykTWprFjC5WlijDca1p89zrU6ip/LvzYYw5qUwMJMO1GVZ5A+p27BbtsuW
         AGrn26BG90mH4/BAF6QyLO1x/pO4s+Q6Us9izB40PNtekfnvxPymTAxHaJAHX7ARm00m
         oANN4MZkSfSORLNZsuTjU4erA4FTAT16Iizvg1j8G/GqBEognRUf8u1ONh22aaSjM20S
         kIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746898220; x=1747503020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G889YwThrAxW8CPYA4whj5V/mvEzVOtalbfz0f44cNc=;
        b=YfrWMFMGOVAhzA66g5uEZwccm3cv7dElw/KehSKKvHhSGAqq/KxH4Bbt0kRa3XIvLg
         dnN54jOdooMEI4ep9EavriAUdLA5uJATWhgWq3TxGbgFofJ6ZaaFNIwmRs5TQq5gPFE8
         eLZtCk4QM+5C3PiccqkuU9yBkoWfsBwDbq49GA3xgJ1LMSR+Xxr2g5QE44sdFFC/D9cM
         aAX+BDxWce0KuRYOGO2tOzH551wskVbyRFb4xlv1ZNmKF2mT1lWBNYnsbH79z9ofHPUq
         bP7pr64+zkmnKVUAYTmtHrX+3votBEGjQTJ+/wUAt4SaZSKBgBwGmkGkYEGo6Bd8LIxW
         uRKg==
X-Gm-Message-State: AOJu0YzzEHBYIQwk6Fbb7Usv6ebztBMRxbNZeHwtrH+2z5jVHBBH8ice
	EE+VWWB1DHlXkcE8fjPlSxA+3oxxnhMQI1cXNk4Q1UXb3nYCj6kZvjMg7MmG
X-Gm-Gg: ASbGncvNUTkqLy6wLXRIruZuSu2JMpzD3CbFA9bP+PN3yP+0DgsF0mrXW8pxH4b1ETF
	raU7F+OBkn0nUw/33NfyNumCy6n8e1oZElAxP1z7Ckmakgumk7eCy0kkrxDFK5yoLuHlYnkJ9kC
	T+uiWt8CzTojS2LTv79zDriK0xqNAzlcoNo0THRpAC4BQbtTCY4rl7wRUvjLJT3Ex83HaAbgl7b
	wXdYciarcdjvOkfEpEDN8Fay97t6ofpsKIVp3J1I2IQ6HKvM/I7ZH0NGiPUXT8/og3ff+V7NNPR
	IbNpwbh81s6YLhYd9KmSE2c7XjUqip2hheiAVVjRCTOTeKkBuv4A4tHr
X-Google-Smtp-Source: AGHT+IE5LAigz4IN0t3XgI3GTSPJae+m3eihIuYprCXUTQkqLUX7kBd+D3zoTeFV6fbIZ+UQ1Okx+Q==
X-Received: by 2002:a05:690c:6303:b0:707:48a7:ea74 with SMTP id 00721157ae682-70a3fa44dd2mr101783647b3.22.1746898219857;
        Sat, 10 May 2025 10:30:19 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70a3d8b83a5sm11620757b3.36.2025.05.10.10.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 10:30:19 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] libjson-perl: upgrade 4.04000 -> 4.05000
Date: Sat, 10 May 2025 13:30:10 -0400
Message-ID: <20250510173010.23448-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 17:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117380

  https://github.com/makamaka/JSON/releases/tag/4.05

  - removed VERSION section in pod (GH#52, abraxxa++)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl/{libjson-perl_4.04000.bb => libjson-perl_4.05000.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libjson-perl_4.04000.bb => libjson-perl_4.05000.bb} (91%)

diff --git a/meta-oe/recipes-devtools/perl/libjson-perl_4.04000.bb b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
similarity index 91%
rename from meta-oe/recipes-devtools/perl/libjson-perl_4.04000.bb
rename to meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
index f0e296118e..407ba39140 100644
--- a/meta-oe/recipes-devtools/perl/libjson-perl_4.04000.bb
+++ b/meta-oe/recipes-devtools/perl/libjson-perl_4.05000.bb
@@ -11,7 +11,7 @@ DEPENDS += "perl"
 
 SRC_URI = "git://github.com/makamaka/JSON.git;protocol=https;branch=master"
 
-SRCREV = "396a57d11aae4015e56f72924f80ac023a26f050"
+SRCREV = "39bc0e567c202762a575fed2844ebdb941c3ca09"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


