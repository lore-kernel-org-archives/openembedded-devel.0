Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F343CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 19:09:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5812.1762456161388661861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Nov 2025 11:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lPL6POgs;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477632b0621so8627575e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 11:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762456159; x=1763060959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80LCQ0wlf+2te8HsdfB+HLTEJeg1tPGwqAHOpnL+vqU=;
        b=lPL6POgsGRj0cZEyu2WzSUAGhCrzvwf0JIJvDSee/KXHLn3bhOp8qrOyeITbeYFT5d
         wp2eDnM8+jXx8+Oo4R8N7Z5Pl+Op2SwuEV6H4YF8SCtqbidP91csbU2tlKfcymbJM1+O
         FKxfcRWU79gLCZow3sTJaJNpfnRmYapsMSsoPnl8xr4BZOxQDJQjyZfU67D4IrzTHw2l
         b4JvgKBCsIyitoxw47aHmI8nM2lJfdSTa/xMKteihksu+7MPulXSSt3s4/7QxZlXfpJO
         Ft+TCXar28oqir5DK5nekHaMALt8N4WJNc7KlJO+SX1/ElGdgK0ZVG3mgVXManIZHG0f
         /qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456159; x=1763060959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80LCQ0wlf+2te8HsdfB+HLTEJeg1tPGwqAHOpnL+vqU=;
        b=J5SKZMxkpzrLATxH9wUFCMKxApqHsSuth4O5/yFza2dcQXI9Y2POACvgblZ8892hLq
         Gv0u/6fRuCKmrEHbxojVCe7eBtoot7wb1t8ZC0mPdSjEAN1Fn/cLgSdbvhuZMGhEKfYC
         kczzjLEycTYnHMnW+/ke0t9vEUOFrH3YaCeiDGBjQ3D040/F7MEfLQYPkN9H7dCBaDfa
         KHN9030pfssaYyJr485mIH7yUQtrvk/yRX/kPAXiS/Ax985pJyudv+fnCK1uCm4umsiQ
         G1+vTpZGe0QDRFH0MldGz4vOQ6mDVEDEh+qxTZiqeZozTDQEpxLqvQnOQQL2ha4rULPO
         qseQ==
X-Gm-Message-State: AOJu0Yy0bwdWIHOdvC9WOwi7a2oGhxggCGMfph+jjS+VZzRKTHRkx40a
	s9jUuzxWjDPjeboQk8vM78Nec9lG+bbKS3y/bR7WFDvOaSoubtApS1JajJtEWTeZ
X-Gm-Gg: ASbGncvdrEqEK214A811AegvJYhrEu0P7IgGh+ZpvEHQ5X4WOyKmCTKzd7BluweognU
	vmqAhFU8CUg5+I8e0wZEcW7xd7AU6HTYOCvZn09Whut2gX316hZ4XcdazO2N0hwNZ3D3W3qyVUj
	yy4lcPLF8Z+xHqGBZkyXWzIE9eGV2PjCdxuH8yjouQ2SQfny4oyVbU+eAC594yhF4A8E2Ecnpk5
	ojR6M3KFWDryAvljSRfO5+/NNjHO/s2WB8or3Ci9CMPl36IkYeTYnKpxhmrSVLUUnBrVE2rNEX5
	Ga+hSSfvCBF14RDdjj6ScVNWbypxu/vUcosFln1LviJBojLcPOYB+49x2c6LtObRSKVPdjqt74k
	xF1p2EQvqdqHtwZ0Fv243Uiwln7PKqAGnoEERoDMqiI0bEbvWxLuqKBYUlN+GRmm/GBtLMbZRCp
	Mxlu7VdLNiBrBXx+slpjTCab2zNY5AS8VFLDmZK54P1fgNOfwxdVNrickL15J3ESL2cwW7jOBEb
	ndU3o8/KKiesDZKnsbdEOYDP2xLpQ8SWKxbVM1zUHAf3ysS4RZAbsOJ99g5eQ==
X-Google-Smtp-Source: AGHT+IHgPNu1xwqWIQ0CWkFGjTd08thXUa7TL72gLwGtQA+1Mnjj8hyb5+f7lap4qng3E/xx0ioGzQ==
X-Received: by 2002:a05:600c:c491:b0:477:2f7c:3140 with SMTP id 5b1f17b1804b1-4776bcc9cdbmr4052445e9.37.1762456159386;
        Thu, 06 Nov 2025 11:09:19 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679e06csm624187f8f.47.2025.11.06.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:09:18 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-rich-toolkit: add new recipe (version 0.15.1)
Date: Thu,  6 Nov 2025 20:09:11 +0100
Message-ID: <20251106190911.7800-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 19:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121364

- added ptest (fast)

  START: ptest-runner
  2025-11-06T18:42
  BEGIN: /usr/lib/python3-rich-toolkit/ptest
  ============================================================================
  Testsuite summary
  # TOTAL: 12
  # PASS: 12
  # SKIP: 0
  # XFAIL: 0
  # FAIL: 0
  # XPASS: 0
  # ERROR: 0
  PASS: tests/test_tagged_style.py:test_print_line
  PASS: tests/test_tagged_style.py:test_can_print_strings
  PASS: tests/test_tagged_style.py:test_can_print_strings_with_tag
  PASS: tests/test_tagged_style.py:test_can_print_renderables
  PASS: tests/test_tagged_style.py:test_can_print_multiple_renderables
  PASS: tests/test_tagged_style.py:test_progress_handles_multiple_lines
  PASS: tests/test_toolkit.py:test_print_line
  PASS: tests/test_toolkit.py:test_can_print_strings
  PASS: tests/test_toolkit.py:test_can_print_renderables
  PASS: tests/test_toolkit.py:test_can_print_multiple_renderables
  PASS: tests/test_toolkit.py:test_handles_keyboard_interrupt
  PASS: tests/test_toolkit.py:test_ignores_keyboard_interrupt
  DURATION: 12
  END: /usr/lib/python3-rich-toolkit/ptest
  2025-11-06T18:42
  STOP: ptest-runner
  TOTAL: 1 FAIL: 0

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index f0411f269f..f9a477c47c 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -82,6 +82,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-rapidjson \
     python3-requests-file \
     python3-requests-toolbelt \
+    python3-rich-toolkit \
     python3-schedule \
     python3-semver \
     python3-serpent \
-- 
2.47.3


