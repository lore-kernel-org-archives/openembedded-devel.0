Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F8EE7C4F1
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 20:07:50 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4935.1696450060702241294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 13:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HcFqJcTF;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c5cd27b1acso1299105ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696450060; x=1697054860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yrck50+6iusDAlQlRp5vnpKyhvG3jlGjIMcZbYB8xFw=;
        b=HcFqJcTFcyqXVKUrUJ7cSrs4Nhoah14KmcCtQ0/33bPzgEpaWwYOiK2f0yv0MIVEOE
         47N5ul74C3Yf/K5BOImE5mOt8mPx3QHRXqJ1fH9EQBkUdkB3bOLVWAkh9x67igAc+HKG
         YAWxqMOgaD1BpVyymN7we5A6rR8HYT+ufvmjfbIEJMfhC3kOkzqhyCSOhqTQVAhCfFwe
         dQG+NSts/l5+4guzhPV+hoWhYTPYnI+ND2rYqsfhdpXum6iRXKCRMyokNDfONrads9fF
         33mlWWB8LNiV1k3QEwiL14cmGNn6fv8Xeff1qT4CDoS/pLCHKvs53VDIwgksw1aWA7Wv
         DvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696450060; x=1697054860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yrck50+6iusDAlQlRp5vnpKyhvG3jlGjIMcZbYB8xFw=;
        b=Qv11ikzIE3DrQ6tvAz1kFreK7ZTZP8wQiFuwsdl5b/otfGnhck0OF0y31/wjGxBf3U
         WciVhX+x7SiaLGZh8PqPruiM/LLq5aF4LiAR9ya9xfvJSVn2SQ8u7vu4aKWPsVbEoeZ2
         QBjPisLM1x4gd/mL11Wn6eyl1rVYEoBLFiodBAcLh7xF0Eb5XMVDMRVDiPx2DgGIYXpy
         vOtMHSkynzuIpGzasfC40tjOdNr2J/6m8uqFBk1QbsYxfrO0e/wOX1AqAHWIgA7lAyW6
         xrYe3aOmtVXxhlt6bX5fqLEZB9G7A+dqGUBbM+N2WfQe99vuRZpNBdHI+517d9D8QZ60
         IozA==
X-Gm-Message-State: AOJu0YxLcasTm/HOc5kPjbrCNdyXQ3PU1xzaOzntoto1UA07jtnLfc8d
	6pXwt3++cQyrIerGRmaR50KMxU+z+RysXg==
X-Google-Smtp-Source: AGHT+IFGq1eOlr63zymJAiEilaHqa5Z8pM+WG1bvR+M60M2dUmOyezLmWctyc2Pdk7aVv50XqjN5CQ==
X-Received: by 2002:a17:903:120f:b0:1c7:5f03:8562 with SMTP id l15-20020a170903120f00b001c75f038562mr3721274plh.30.1696450059798;
        Wed, 04 Oct 2023 13:07:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001c73d829fb7sm4176878plg.15.2023.10.04.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 13:07:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minicoredumber: Fix ptest reporting
Date: Wed,  4 Oct 2023 13:07:36 -0700
Message-ID: <20231004200736.173557-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 20:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105342

Fixes
     AssertionError:-
     ptests which had no test results:
     ['minicoredumper']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/minicoredumper/files/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/run-ptest b/meta-oe/recipes-kernel/minicoredumper/files/run-ptest
index fbddc0774d..6746132ce6 100644
--- a/meta-oe/recipes-kernel/minicoredumper/files/run-ptest
+++ b/meta-oe/recipes-kernel/minicoredumper/files/run-ptest
@@ -6,7 +6,7 @@ echo expecting Segmentation fault with core dump ...
 minicoredumper_demo 6 & sleep 3 && minicoredumper_demo
 
 if ls /var/crash/ | grep minicoredumper; then
-	echo SUCCESS
+	echo "PASS: minicoredumper"
 else
-	echo FAIL
+	echo "FAIL: minicoredumper"
 fi
-- 
2.42.0


