Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD609C88E63
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:55:01 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16782.1789257299490349853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HfFbXgpG;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2457751a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257299; x=1789862099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOmGF+M8fADD/CWXnemR/BXYtPfeD5EEqFbU98Y8JcY=;
        b=HfFbXgpGfyT/rO3hVu99LF8bRZ0TdExcSZFFKim/TSQ2/tZj350G40wCL20nICbxY9
         kqKtL6Ro1mmr7kEpmdm01pOx1unui1xW+k+aFdHIomLBQVLa3nw5B94UthPl6bfYWH/i
         1YIjm0AsfA6aHA/QDTqwRMzy+hZCeDMCCZV5ybLLJD09ONbpGDvfz6kCSWdhp1yUzrFH
         F4nQSsuuzmTeIuUVsG1b+gqSE0cv+7+5YE/CptyePZMRHZF8Rc5UERpnHRG0lbdAS7Yy
         0P6/4QFUxDLWHpQDejDDAX3OTfHVKic/EZaWusZC50YA3j0tgZmp23tBTAt90CUziV+5
         QdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257299; x=1789862099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOmGF+M8fADD/CWXnemR/BXYtPfeD5EEqFbU98Y8JcY=;
        b=W8m+as2fTXGC/GX6vjOIPQTY5wu51NBa9B5YYC9FAH/pIFe//teiOZkrCZrmCxGAf4
         /bgokDlLTC4id6YJxyUY3QLkQsLQI7FlflrLajhyiz5O2fV3lQIF4TLS7UkfNhOj6+LJ
         Sa2cjWRmV5qpozF/HR2Y3dpFXAAO5P9rSc5ec8lCnIukvPWAcqWS6TGU04NLamh60r5x
         gU46AKEY6Y066FZa3XJ27Ff5YjWTiw+xw0tC3LuSV1UQZlAnsdtFZzEAaKoDky668dif
         l5S/Ad0/d5XtBN5sWWRUlVx8BJRRM/OHNycoUSR6JlxOVmRbs0dQdTvbZdGMAf83HM7O
         hUPg==
X-Gm-Message-State: AFuF++nYZcrGXHMfjAKZOiyVH2bsmUwJa8o+M+yYkkP7VyM/383h7nCJ
	i8fe5Y1IetVD7VfYsXwP5q6Vt4UWVx6LI4KhSRkFok/Sni0m9icKw2LnF6srhg==
X-Gm-Gg: AYBFou2m7e4hkIYU7lWnHbbPSJMGA/K4EY/PYpiWeCk48rdzVQmd74SajqMT7jLhl2g
	Qi87qsi6YH8j28YBWaPCkKAbGHS1s2PtPKvfe4Oh+fWo4jF6qFV0HIJ48cwyvGHb4tOGLzHTAS7
	cBgCMF1dh1LMnFWf1U6IW2hL8k8sGlW3jfiPiiYIUbJUB/GFOEkxQj9k0ATUGNhu8hQ/Yrt88Td
	Yg4nIbMEd926+jrc7QXhKNBxJRLs+3+iTu3QRnTjJD4+gLuEbo7LcWu2jXrkCum4k+6byHqOkWR
	FA4DownzCUUjd6YAkjPCqftcQ7w44HLhO45ndWY5k9i3WD1nRqK8KPFAVvLy+m2Q0kAz+kenbbo
	tgMg4+QDK0RcmuNUF6N5qoOBqkqP7Wh5sbe56F3/Xl/qkdGMNmlVP2R0rkPLwVO5opYflJa/jGm
	NfRgpIlPeyU2arCGrBWf+1ODSWeow2n5pgkXDDHQKlLlxfampsXCghZCfi68GF5GZ0XsiYgcW9V
	bhJhVYuxhwKGsDc0EZqfe765Ct1hmjkL87NxG7e2oykv/OPlph1TVb2Wpujk5Qd7aIB2RlYG3L/
	J7isni8j8nZvmzA6KXh43CIWgqUnYHfdiZGL+Ssu5w9U5j6oUohYkfE7Hek+5PXGlnmn5ENQX7m
	rW2dODL+v/pf5nmKDwna7RqIihy0ZWsFtPq2SfMsYSmxeqCgC1EXUVSa4
X-Received: by 2002:a05:6a21:710c:b0:3d3:aed2:6f20 with SMTP id adf61e73a8af0-3db26f09602mr313459637.20.1789257298738;
        Sat, 12 Sep 2026 16:54:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm4524372eec.27.2026.09.12.16.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:54:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/6] openjpeg: fix run-ptest with busybox sed
Date: Sat, 12 Sep 2026 16:54:51 -0700
Message-ID: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129986

run-ptest piped ctest output through 'sed -u', which busybox sed does
not support, so the pipeline produced no output and the ptest image
reported "ptests which had no test results: ['openjpeg']".

Drop sed and classify ctest result lines in awk directly. This also
maps Timeout/Exception/Not Run results to FAIL; previously they were
printed as e.g. "Exception:: <name>" and ignored by the ptest parser.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest b/meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest
index a161244fbd..dc2ccf6c21 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest
@@ -1,4 +1,11 @@
 #!/bin/sh
 
 # Only run unit tests, exclude nonregression and conformance tests that need external data files
-ctest -E "(NR-|CONF-|ETS-|testjp2)" -V | sed -u 's/\*\*\*/ /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
+# ctest result lines look like: " 1/29 Test  #1: tte0 .....   Passed    0.01 sec"
+# anything other than Passed/Skipped/Disabled (Failed, Timeout, Exception, Not Run) is a FAIL
+ctest -E "(NR-|CONF-|ETS-|testjp2)" -V | awk '/Test +#[0-9]+:/ {
+    if ($0 ~ /Passed/) res = "PASS"
+    else if ($0 ~ /Skipped|Disabled/) res = "SKIP"
+    else res = "FAIL"
+    print res ": " $4; fflush()
+}'

