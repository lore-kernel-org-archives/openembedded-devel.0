Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB129CCD183
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 13:34:25 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.24331.1760880857689606984
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 06:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rw6N0cOv;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3d50882cc2so656093466b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760880856; x=1761485656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/MAcM+c5Q27t90EDTFuoKcKjcs9sBZm09dKBBdMH3I=;
        b=Rw6N0cOvadkyId1cCprDax0OHJOWkmq6sLC6n1KR+lvvtjGSYLPhofV+rV01v/SsjG
         UxRSodm3HpyAVM13H9t8Z+XCoTYwvkAMctLr5JzUVobQfJlcDPhM9cYImZOZnzUZIXU5
         UT6gGrrFMnMpZllJf/stvZD8X1V7xqmGKIqvHmKDyGxAfTRbqcLEWnxqHAp8R53SKHCZ
         9Dh5/8NAkqIfLMmv8Qn3b2nfsKYOV4O2+8BZ7AbsCxBoJFzAIwBHfWxMCElY9DiL8NCr
         xuwKRwVZlcbC+myVQt49+5Km03LvdVaTlu8Taph19ag62km3cb/RW36WiroEZBIIIozd
         4y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760880856; x=1761485656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/MAcM+c5Q27t90EDTFuoKcKjcs9sBZm09dKBBdMH3I=;
        b=DUpxHVy3obnqiPuE/ImbR88YHzwGD5LO6GGL42PAaPIrfVPlKBjxs0vtPhAfMfE++8
         x6XYSCm6Twudv9CLLjPh0/v/LVxTXMcjge+yUjzbn95jSXDAAM/UhIxgwSJzOuLhQwtr
         1maaxTkxIwamq4X9bv+mlkklB9w9YPIgbywpVSJYnJoZ6dezCoUfH9ciPolDmk9aAd07
         0RVvWRTspecj1ZG2NS1bO7ehzXn9qgUODmYWlpGjFCd9gA3J/WzswYuPj5cCU1mO7XD4
         O0dUTFDwTQG/ctK2IsdfBYH9arH3Xe/LM2vxG1eRLMgzWB1Dlp/1U0Xx7B8sSi92nnjB
         iJ8A==
X-Gm-Message-State: AOJu0YyOij8EiXu8LuEqZXEWKulf2V+0+zALvHbvx9VZCEhB1VVHpMgp
	eLhC0yjKlo7ZNuCohOn8f9d+ej3BaaMc+cU3shCKfTgjbHThI+hq29G83tNsFA==
X-Gm-Gg: ASbGncuGMrn4imKYqOflmLh+nj9cDr3cEI2/KfrGKJYtsV02eldAWT6hmbfo8vssFej
	XT3MfCZJxR+gHB+VVHwueLQ/nR6eJYa4KE/2WVQ/RFgjRtHbw+V8rxVk99WC9iTFuvfSUcinw0K
	JJbEhH6fRgAti0F7zPVfgUulvZce5PwbMLXX/eB+BrI3dVdWl+uS2DOOos9RvsJyJMqfrHf0uXU
	kpNRUJByZ/IKEGMxDYs5AwZp7xh7QSeaCWYbPhQ/tTjAK2yy5Cu9DRtNv9029KoLRXnR4vu3ZL4
	mbG+CMF92C7/f7s6MNBMaABB0eg8lWM794TSSJoK9l9ttsLKNQWmJ8mnsgF/futXkO53gTPuI60
	NRtU0HIrRpeVoN8AdRjz2hrFBVHnwoHh7VEWE0nSvdigZjD+zVZ45bjL6teFwANP1YnmpWu3GXw
	==
X-Google-Smtp-Source: AGHT+IHsWshTyqKgdVcJ1DoNu3lhSUxlDp/is2gy3pWR1X0p6574k1aLO/KJBtOlfpXoIwpfNhlP9A==
X-Received: by 2002:a17:907:3d43:b0:b04:25e6:2dbe with SMTP id a640c23a62f3a-b647482d8e4mr1146654566b.63.1760880855748;
        Sun, 19 Oct 2025 06:34:15 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb52603fsm518084166b.57.2025.10.19.06.34.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 06:34:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-ujson: fix run-ptest script
Date: Sun, 19 Oct 2025 15:34:14 +0200
Message-ID: <20251019133414.1018768-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 13:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120792

The current script doesn't execute any tests. This patch fixes the
run-ptest script.

This is mostly a backport of e183db0c8f0b6ef605731769aeefed3e4f0a0093.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index b1539453a6..b63c4de0d9 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 tests/test_ujson.py
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'

