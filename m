Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51257D7237B
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 01:24:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31597.1769304255952034999
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 17:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DRkVC7ch;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso2371010a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 17:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769304255; x=1769909055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnibnAXyJHYJUwIv3hakYJIFeIb/FvtSaDUnJlr2PUU=;
        b=DRkVC7chFNLTCU7AztmD7JaMUUuDffpm0fULm1KnWScsax22O/A00W2HD9tNWAuC55
         LDgKEtY4IfAVgk9362qoPtPLldwvrUeTJ8xOuqpPEkNrqBfS1llkVRjk461jIOu1YGh0
         UOj2TcMBVoEDIxC8DHa34lH0RTTxHKLtunG1tsDx9FY9QKwuepdauYJSB/I9S18pbhie
         eP/YLOMXu3UKcWXjrJdsW2EtRsd3m97o/WQNDhoSU1HXnLpv5lBNq9dDXYjXha9E6DMj
         ZntJmdjumgJD4mfvNxpN10YBSf5VH/glMED70p6OjO/8B14xUqXeOcL7t3HNm6XlxcT6
         QDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769304255; x=1769909055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnibnAXyJHYJUwIv3hakYJIFeIb/FvtSaDUnJlr2PUU=;
        b=wuqAxwdT6m+bLWUoxw4Ym4D6Hk1QO2EcfVh4ODVOkiUKMAVRGsDJudCqIE0SCcfMtk
         R4hZTAde+KylkPDDfX9dJNneLjV1i/7ZEsZhvn/5d5YrBYVtQwW/l2WvL9Hg2ReSHXbi
         kgr+122q3JzEraPQeR7ELFNPPKXfJLve/9xRc26Nk8YzzTYF/ruNTkPoDB9iYJlvHpkB
         +TeHrntgqAobm4ths4xYq1VhJXWC7uufkBV8eXS3b1uiuCrmoUU2m0ID7hCGcstY+FCW
         24pNwbxRY3RuqIaqG2MhpVBTPRjUhZj/79hIlKYSmX9Z2VhtwnGhYfFjEndzdzsEuuj/
         c8ZQ==
X-Gm-Message-State: AOJu0Yw4tF57FD4Y3wC05GBW9QgPh8Cj5ZxGa70QwFdCOm7hS2P4DRzJ
	IDFa4X0R1DdILc57MoyUs8oiX2louHbSwB+O/t/PWH5R7JbdtlhHjkO+hUlfUR8I
X-Gm-Gg: AZuq6aI/ZzXCymqlqhG0OgDjpxG5t5U9MB+A1VrWGEftrBiVdLGUz5OI7MUeebNYAAk
	mJWaql0YZrrLjLYmsqur8XWpNqt+t7mWsff2lB6J3c5VqTyKpLSD39POWFGNDCn8NbeXCyfhWq3
	FIE8nqBguSGhhFc+p4n8YSRm9suN8rJmfezfb7zl8R9fmDytvJXjlJE6qEPI7jP+sNGvrFpKcmg
	XMEpFJ8vXiQXtasxXtGrug5v2Ovw1Knt1cNVazbm5ZaPfKyrQbIRpMU52IRj9E6rl2iAmtJPjVZ
	q39azDT7VJrmN5ks8PU9oivClU3dZIV4K/r7bHppxocvRmG01kLsbDeLWa3FPXr6BMMA/xAXZLf
	5cl/5LyLMBaEAfVzXp4b6zxpCZsQnRgFHdsauLQjqrOzjxaqdwyiOzEDZU3sJlPXyFl+LCKSDzj
	gTUyFBxlVZXgnfS49OnFZgpf01
X-Received: by 2002:a17:90b:38c7:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-353c3fe38d1mr362252a91.0.1769304255116;
        Sat, 24 Jan 2026 17:24:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536f3192d7sm2111265a91.7.2026.01.24.17.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 17:24:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2] python3-twisted: patch CVE-2024-41810
Date: Sun, 25 Jan 2026 14:24:02 +1300
Message-ID: <20260125012402.489953-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 01:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123829

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Though nvd[1] mentions commit[2] as part of the fix for CVE-2024-41671, but
it is actually a fix[3] for CVE-2024-41810.

Rename patch files accordingly.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-41671
[2] https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33
[3] https://nvd.nist.gov/vuln/detail/CVE-2024-41810

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{CVE-2024-41671-0002.patch => CVE-2024-41671.patch}     | 4 ++++
 .../{CVE-2024-41671-0001.patch => CVE-2024-41810.patch}     | 6 +++++-
 .../recipes-devtools/python/python3-twisted_24.3.0.bb       | 4 ++--
 3 files changed, 11 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0002.patch => CVE-2024-41671.patch} (98%)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0001.patch => CVE-2024-41810.patch} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671.patch
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671.patch
index 147c21d73d..5c0d7b6a77 100644
--- a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0002.patch
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671.patch
@@ -10,6 +10,10 @@ CVE: CVE-2024-41671
 Upstream-Status: Backport [https://github.com/twisted/twisted/commit/4a930de12fb67e88fefcb8822104152f42b27abc]
 
 Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+
+Dropped newsfragements change from  the original commit.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  src/twisted/web/http.py           |  21 +++--
  src/twisted/web/test/test_http.py | 122 ++++++++++++++++++++++++++----
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
index 1f6bf6bbfc..e41d9667f0 100644
--- a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-0001.patch
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.patch
@@ -5,11 +5,15 @@ Subject: [PATCH] Merge commit from fork
 
 Added HTML output encoding the "URL" parameter of the "redirectTo" function
 
-CVE: CVE-2024-41671
+CVE: CVE-2024-41810
 
 Upstream-Status: Backport [https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33]
 
 Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+
+Dropped newsfragements change from  the original commit.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  src/twisted/web/_template_util.py |  2 +-
  src/twisted/web/test/test_util.py | 39 ++++++++++++++++++++++++++++++-
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 272aecb8b0..691b80ac68 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -7,8 +7,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 
 SRC_URI += " \
-    file://CVE-2024-41671-0001.patch \
-    file://CVE-2024-41671-0002.patch \
+    file://CVE-2024-41671.patch \
+    file://CVE-2024-41810.patch \
 "
 
 SRC_URI[sha256sum] = "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"

