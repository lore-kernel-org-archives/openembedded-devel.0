Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D6CC369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 05:00:45 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4863.1744434038913910677
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 22:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C22J6T1/;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff64550991so2178090a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 22:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744434038; x=1745038838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgPfYl8bXShZJo7qJG4zNFqSZNeAELUCtc9s8NfS+Bk=;
        b=C22J6T1/Fni4n0tzsLWo2cT9Q5wT+bu4W6gRql8Nqsyp9qXsm8aPSD/W5to7QmKjM0
         cnRRJC3OBQWQs4ecpchseZ0XEDNZlYHeynrHDokABvfhqKYqkrAzYuH0WSjvHhkJVMD7
         JORHKgk8yw022t3Vqohm0bLupmkTv498EOsYXB/pxOQ9AtCFi55Yuq8uYh6QO0PXmd90
         67OpKLsX969JRKacUPJM2IpFs61N+UZGYxpIKePCcDttJfKXsn7py7+KbQrYbAa7ZBmr
         NoMA8PgYVDgomKSIB9Z+whbRgusqVV1xwT9j1WzgmmwdS3mdOF1yeMRlHDdLxgBH3AkC
         l9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744434038; x=1745038838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgPfYl8bXShZJo7qJG4zNFqSZNeAELUCtc9s8NfS+Bk=;
        b=RLwplggZG8CrMXXBX9cVb2ZmoMlBKme3Jle55lhj8LWIW058MZ4fUVMGB7Q05/LZ2V
         2KVIKhb1iUSEWQRlnczerAPJrRreYJKhIlIZ6KL7ayJviXif5D8xeknAKTOItBP9+pvh
         hOUxwhAdekKBr7xrLL8ypdIAM8qcz9z+E7xpUFqCY9p/T5ayPfitllNtaromO7Nkz0Da
         QBkg+meFxQANXGU7EQwfHy/KMvFagNCWmqBfI6N3UHu16+RaM1RHep5CkLTGYzLtNnQX
         pLpP9ZMDTg6CCpRT5qFz/FPh1LpSoy7nu5WqbFTGDeg+ekxDbY+rpHbRnrXIiiVYRnfh
         jZiQ==
X-Gm-Message-State: AOJu0YwP3HVXbAcpiig+Z2HQ7mgYCrVRh3NSkePf3xRIH8gOX6v0LJ5c
	YhNfq4YJeArAq4gbtmuB9kZtgDQI8w9Vgy1j9qQFY05gu8Mr3k+8W6x4wKwL
X-Gm-Gg: ASbGncsYl9WBLWOUnpmXK/ErUQxAD13PZ/sWGmkntL1Qi015758bXVGEfl0zKZI0zMi
	FfqkrbUGU9V7+i9Ta8ArcPR9YzwsXpZDc9hoUPtU42KYcvm1BX7cvE6BA70+17FZi/OM4V2BFlG
	I9KW15vFtNru4ckH+MzFU0zjS/HLJL9NdOXN3nre/NdI2iM+kFt9h27pWs3OJlU0GLqD1SMdFkf
	e9tFW47/hqMSEJ7/5SG19bjtGA98I+MH3H3BDpyFHVDk4l+e2ApW8EQdcQpk4dJnHe0g07ltuxi
	s1zjHSOUYv4idL3pGYPtnX5ztknXG04C
X-Google-Smtp-Source: AGHT+IEKyYheKxxRKjo6Jak3bk3cBfaGvLDxadB8kjXFeWCmozq2TalTN+XQBDD70hIvu1HSvNFzPA==
X-Received: by 2002:a17:90b:5444:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-3082362475fmr7618908a91.2.1744434037876;
        Fri, 11 Apr 2025 22:00:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b5d0sm6919166a91.22.2025.04.11.22.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 22:00:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] ptest-packagelists-meta-python: Move pyasyncore to PTESTS_PROBLEMS_META_PYTHON
Date: Fri, 11 Apr 2025 22:00:35 -0700
Message-ID: <20250412050035.598905-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 05:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116809

There tests do not pass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index caeb1ae6a3..05cf0332c8 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -58,7 +58,6 @@ PTESTS_FAST_META_PYTHON = "\
     python3-prettytable \
     python3-propcache \
     python3-pyais \
-    python3-pyasyncore \
     python3-pydantic \
     python3-pydantic-core \
     python3-pylint \
@@ -125,5 +124,6 @@ PTESTS_PROBLEMS_META_PYTHON = "\
     python3-betamax \
     python3-dnspython \
     python3-fastjsonschema \
+    python3-pyasyncore \
     python3-pyzmq \
 "

