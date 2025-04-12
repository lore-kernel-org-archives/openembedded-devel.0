Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A229CC369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:28 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.12744.1744471828142157148
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNtPo/0L;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ad51f427054so2187221a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471827; x=1745076627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4wvEk8BW/zyjiIIJu5z9hH1LS/q3QTobDG7obXGEfes=;
        b=JNtPo/0LKmSeK41UWvalAPXtNyuxqCMEVHVbv0CemV/5u49QHJCZAmD4VGnJd7jpJF
         ce+gzhPDD6w1+RVsQFp/5iciHUrmh1ce0Df4pPYxvf1+v1t8OZRlyCkJsAwdf9szh/tR
         +Zmr4YilX4J6n2Z6ug8VtDzlMnZHtGkvbNh/QSvo5JqNTl7PXXamedilYXOyzG0aiSv3
         0MCXHlrg46az2eRCdbSQ92dTVffGHemD3tVX4hHB/KdwbAF3utX7gehMf1bfiuM2TCvo
         lFCighQn+9kgCGtKCmjx8Rjwu9diwkiivYHlfBTm2qPU9v5o01Nz6c73DT2VSJSIr8HN
         ty6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471827; x=1745076627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wvEk8BW/zyjiIIJu5z9hH1LS/q3QTobDG7obXGEfes=;
        b=quCzhlZQAGqIqXCUSICWpRjfqhR2uTc5DwEkgvn96gUCmfBFsmyT/ofx5rrGwJqtCf
         J/SQgCU6XjNRIL1VK6AC6YzK/A0XooW2Buy7Xct02ZX/IWJxglQiwT9SEsPO013x0Rc+
         Hs+2SNDjBSHmkSJVGBe5gPWJyX+qjRwvlVRLgFqrywa7pEpGv4WnGRP4Oe3qkEGaDsHJ
         GUEm8uGE1fGdDRu/dV5jWbWcTOkgYWEZB3iO9iKLHz/KcLI4uTW8jCRIXmOjdnqi3HrZ
         Twhbw9trJWED0e9elzgjGe5l8CqBI4htqVIwu9XkDdxnVsiX+lbVb8wkc6dIS+bxGsaS
         NQmw==
X-Gm-Message-State: AOJu0YxaiKh9q70AFOtVkMb0Kbbd+JT4TK4vvNsHYmsa1sPhHtxMStPR
	kiuuajXAGRYpwlOcnjlGrdLY+VL+Nfi/kLy+9/CO6EFKY+Fxb+4UsClN3g+S
X-Gm-Gg: ASbGncsGwIKPE7nVd2rcNaBYm3FqLgjgF9KdBB48fwEIoyyN4UTwdkkwPSimdaqnP/i
	OTFfQw2S7K6SI+F5T9yhAskN7XMfBToPNtJHAkrpmSTrBmzS+fjCfUccdapUaZ8ENwehiEVeWri
	GE4dfi/exXBIZXq3vd5wfvxc88dwwu11cFvlHCxohNh3oRTi3bUf8I3fCqvOKapVrWfq8evw8eo
	8hfVSitb0YRcqONR/ysTl2Wd5HYmnnNUCEXSHauJLg5cKTfMbOzwrQHApYayIPsItrBq3w2WtaV
	Oe67AX9wYVl8Eh96i47LPVRTc4Jk24gb
X-Google-Smtp-Source: AGHT+IGC4Q4Bq4mYWud+85bSyrGHBOoRZiN8OlfdsGrN0YJkpi+1Zv8VyndmWx1cFFge0IPsj77tsQ==
X-Received: by 2002:a17:90b:2b8f:b0:2f8:4a3f:dd2d with SMTP id 98e67ed59e1d1-3082367346cmr10422244a91.15.1744471826876;
        Sat, 12 Apr 2025 08:30:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/8] ptest-packagelists-meta-python: Move passing tests out of PTESTS_PROBLEMS_META_PYTHON
Date: Sat, 12 Apr 2025 08:30:15 -0700
Message-ID: <20250412153022.2343322-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116813

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc      | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 05cf0332c8..f6a8129793 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-ansicolors \
     python3-asgiref \
     python3-aspectlib \
+    python3-betamax \
     python3-bleak \
     python3-blinker \
     python3-breathe \
@@ -21,7 +22,9 @@ PTESTS_FAST_META_PYTHON = "\
     python3-click \
     python3-dasbus \
     python3-dominate \
+    python3-dnspython \
     python3-execnet \
+    python3-fastjsonschema \
     python3-fastnumbers \
     python3-flask \
     python3-flexcache \
@@ -71,6 +74,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pytoml \
     python3-pyyaml-include \
     python3-pydbus \
+    python3-pyzmq \
     python3-pyzstd \
     python3-rapidjson \
     python3-requests-file \
@@ -121,9 +125,6 @@ PTESTS_SLOW_META_PYTHON = "\
 "
 
 PTESTS_PROBLEMS_META_PYTHON = "\
-    python3-betamax \
-    python3-dnspython \
-    python3-fastjsonschema \
     python3-pyasyncore \
-    python3-pyzmq \
+    tftpy \
 "

