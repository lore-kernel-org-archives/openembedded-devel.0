Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CE9C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 15:19:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.23713.1748531958657296320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 08:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMj+NNEJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234bfe37cccso14216885ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748531958; x=1749136758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XpE8jZvvr2Kv2X33fFQiudqJ98ki3LXafloY0Q0P324=;
        b=gMj+NNEJ2oJS7Mmwq0Pz/pKQ9jBtezSBynYzw7PQdSkh2d+frqY6v35cXRG82+tBze
         tiOypUJeYOBKmcAH2SCnzyrXyPS7GQFObC+PxNIraZtZPd2/H80JL0N5P8XbrXB+iSFR
         ZuivI/YtsE4fwHE/6yzwaccHW3+zE275ndlcSnZvtTDe1TgS6YwEBnGRz2vExpED8Q+8
         a6tqjrjN6spBvR9f7Kv6BqmZrVrvkLTsD6PYkKfViv1VIvVEwr9T1kwCdNmlVNtDOq8T
         K4P2rY5zld5UB8sPBZMgK8gPNnQ2C1Ipec4Dyi9+mFCbBXZwqIOQtXUCIGY2sWOdO3ZX
         J5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748531958; x=1749136758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpE8jZvvr2Kv2X33fFQiudqJ98ki3LXafloY0Q0P324=;
        b=j//AIxinqg9Frddla7QkBQyxxhpe1bJPpNh1y0DjyeA0qXpQSYaOlRiQ1eU7G7h5cd
         XGeistfYqr/qlUrJzfYmQ3Un9fYnloJeHJJHHyikzPNM/qB2ey0OVK5kKpLM1UXMKVl2
         b369z162tZQkNcf7LDJEbGnvzPtDCtonYRaM6CPzx0cemznj+87x8F/NH0elVfjJUtcD
         xBHr3cwR3s8oQCe3Pm+sqYxv781dBGGyChHsZXqtfDA5tzKWSNuzM4ojEIIW65hrKUK+
         /8UbDwrHgGyX/RlwmUERRToiIeUJjzzDCaa+OUtxmwklcRtb7rkGBkt0TUxthBKTFx2t
         pC/w==
X-Gm-Message-State: AOJu0YwGl3pkT0jg7WUN+4OMul9ltBxFXbsOrmYFbGysXiulxiblUMpg
	LFgYpfXw3pCgHGndnXrHSvF53oTLIGituEF32KbV3DOiJQ03ikEXFKJF4LjU+d8O
X-Gm-Gg: ASbGncsEuKas8+//h5zU0rGgEbOzWK3MC88Ujn7CGQQhj3mw52D0SVOGrbzVDTpgBig
	MyNRgs77+Si+D4peNIsvgJ37j3miimQnaFPn9FTxrXPOy8qCXUixzKGbjNEsEC4h2i17Kbt7pw8
	iZUraUrywoR5yUMZoaghUZNkJVDOFky3OvmVTtAf1eucYQdjU4IsCNGBLKQ3dAMpuo3GA1PG+Xd
	TMtNwG07WeiFy2ieueo+b042ot44D6CIrxCN7zWi5JsLnPEt3W0E6bHvQljeSRO4kXKOXJScHhP
	NHk8KBhDNvT3o6WGuVwHn5ETAKuUBRFNQb7khZQTd8s=
X-Google-Smtp-Source: AGHT+IHzn+aAkFX9Dm+5HFYDZ2eADTBPJaKNWKufUv+yXWvfP/LuamNZM3obIsm/Y4gUpjStf/tB4g==
X-Received: by 2002:a17:902:e845:b0:235:2e0:aa9 with SMTP id d9443c01a7336-235289fca05mr375935ad.14.1748531957603;
        Thu, 29 May 2025 08:19:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdcab7sm13637195ad.60.2025.05.29.08.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 08:19:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] wolfssl: Use the return value from unit.test as pass/fail indicator
Date: Thu, 29 May 2025 08:19:14 -0700
Message-ID: <20250529151914.3835492-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 15:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117656

Using a string search for Fail is not going to work always e.g.
when all tests are passing it still prints a summary string with string
"Fail" in it which points to 0, however the logic here catches that and
counts it as 1 failure and marks the return value as 1 and ptest runner
interprets that as failure

Pass the return value from unit.test which should be 0 on all passes
or non zero otherwise.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/wolfssl/files/run-ptest            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/run-ptest b/meta-networking/recipes-connectivity/wolfssl/files/run-ptest
index ff66f4ef6c..fd260d441a 100644
--- a/meta-networking/recipes-connectivity/wolfssl/files/run-ptest
+++ b/meta-networking/recipes-connectivity/wolfssl/files/run-ptest
@@ -8,7 +8,9 @@ echo "Wolfssl ptest logs are stored in ${temp_dir}/${log_file}"
 
 ./test/unit.test > "$temp_dir/$log_file" 2>&1  
 
-echo "Test script returned: $?"
+ret=$?
+
+echo "Test script returned: $ret"
 
 MAGIC_SENTENCE=$(grep "unit_test: Success for all configured tests." $temp_dir/$log_file)
 
@@ -21,4 +23,4 @@ else
 fi
 NUM_FAILS=$(grep -c "Failed" $temp_dir/$log_file)
 
-exit $NUM_FAILS
+exit $ret

