Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4D3CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 08:04:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9999.1762416283440413372
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Nov 2025 00:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpMSnV9x;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711810948aso4136055e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 00:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762416282; x=1763021082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTcv59ZSL5wWUsPnnBD2Z46mfO5Im6AnaA95JqRkGng=;
        b=mpMSnV9xThIH26xGF8ZW+KgQanLfMm56SmmU7c+vIyWkXbC3uh/Sg+0wuI9pSbUQLc
         fGMA3M9VyBLuYHDkByYnf6Br4CO/yc+3L2ViGed95lqKAp4phXHs1SJA6mSl+Q1jC6Ho
         VRS7fl6ReE3GBrVn++wppb1X+0m9CnkgxpIjXZmRiIeKg69v9MrP/ShAxj8b1uCq1Lfj
         EoEZ6006A2BbI+QXVuUEtbZHyNx/vFQXOal7Ve80Hx+ewd6+bHLzy3ghMuCJFJft1Nxm
         MwNps+HoNCARIxSth61EtK8/U/Run8W7WxaBlpcKwjG9XjKzvIC2tLBjFkefHn8kGxLQ
         ofSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762416282; x=1763021082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTcv59ZSL5wWUsPnnBD2Z46mfO5Im6AnaA95JqRkGng=;
        b=Vlb36SmgkwyJr3DTkojJO7cafT6dzL0+TAP7w3/+JKORNOMKDvYMdBXqcOPJZTnd9e
         3bnXlemZPxmS3poF/4D0IugpbvLnbwu14YKxvX4E1+RVTsanTzIk5OEwTqTd69v5gBW3
         Vfk2rvCzZ2ojHjw3FFel8xa/MLh6Y6zeH8cO8sw0zvgASxPb852QLl717pqKJOTiYrDN
         nxeMZAf647xvHDffWFXcJel87ePAP66TWryl/oLmGKPiYQHCy85S6zW4nmmMM/wR3i1F
         YJOrqyOZnDGTen+HvNroUdDK8NpABYchxtvezivuosG/Xsp5hAVez6DNaXdjQ9UeoRvO
         PASw==
X-Gm-Message-State: AOJu0YyHMJHB1Q4NMUeIpCQS+atPdSlHVx8wH/1uJ5hMcbOrcg89rDpA
	ClCAhvmfKjf3NgAP3fA+pEvDIkkPFVBUBPUMmAntZ8xXl1PExnux9GuvXUIZm0kF
X-Gm-Gg: ASbGncsdmkSiYVAEbnDnWy7OJUYfqKy+eYVxwFAgVKB3XR2xAeG0I6/DofLBSBMg+W+
	RZYaRqC8I3DTaxaBsQUfmhWNTaFleSectPVV9ct7xOX/bWJhXSDswldUpUDB/YIgzap7XLu/4Hl
	QJ7DIZaIxnQSQpomk8hJmEpQQqFPzJJVG3YojsimNJx7Go/Sj+2wSDtfZJiKgLzEZE8Vy0g34js
	n8m0L/fI4c9H5G+JxOn+BbLGt4kVohVHXV+ZeZfJY83q4k4feNLWRntnutNEDHjt+HaQyrCyY9U
	FC6KFEGZMhIJzlVnNzW9tIVRs/X+VFGHVSLg9prbjJ0acskCySCaqe3ksFX8otUdtOVhHsC512G
	zy8BZ7o4bF/N1uh9k3j64MhMUdFQPUSDZtquLgY4CRyRyIvsIM04/cfFupft1vdur1w2DZoGpug
	==
X-Google-Smtp-Source: AGHT+IEnSgl6jiFhn9qOcs8IrQBQTi8PEABrtkx8PDsty5bajs/3C6gIAxF2syO8Mn+CFbAQSuEFEg==
X-Received: by 2002:a05:600c:4509:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-4775cdd1d21mr46554085e9.18.1762416281614;
        Thu, 06 Nov 2025 00:04:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce329afsm90281845e9.16.2025.11.06.00.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 00:04:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nikhil.r@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH] inotify-tools: add PASS/FAIL status to run-ptest script
Date: Thu,  6 Nov 2025 09:04:37 +0100
Message-ID: <20251106080438.1617193-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 08:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121359

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
index c45b75e387..d0ccfd7b67 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/run-ptest
@@ -7,9 +7,9 @@ status=$?
 
 # Exit with the test’s result code
 if [ $status -eq 0 ]; then
-    echo "All tests passed successfully."
+    echo "PASS: All tests passed successfully."
 else
-    echo "Some tests failed. See output above for details."
+    echo "FAIL: Some tests failed. See output above for details."
 fi
 
 exit $status

