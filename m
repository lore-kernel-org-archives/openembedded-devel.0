Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC28C5DF9F
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:36 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.751.1787335353022060072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bBrsOznk;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1002405a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335352; x=1787940152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJv2Kp3J85FKYxFSgYZa+YvS6DF83PqF6PWxFmrIM8c=;
        b=bBrsOznkI184rJghuuHjnVG8peecNKPlXqP7sbn9UErDFG0t4XC2pflLtOfYB03QH+
         op/u6WzRCQvTubFLZBPB/T3qGLDiIOaUsq8Bc/3HTdJsklslQ3p2biIOVLAKFssOjsIL
         ExH+pw8I8kIXgAzOPwfxFCsC30zRJ1hfgpbQI/eOhOmofMXYH7iSvtogbf0OkhicJF+d
         7IkFUyWpxUORFKSSW163RckKvoJ+JoVt2J0NbRXsZjUVDy7vu11LMLHFZNeMRUYlSsdr
         LgchxM1ryIW/avSFryQ1xQ3zl/1XrXNVFb1MBS5waCj17AfojMUebeGfR2EZZvtjchxM
         R/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335352; x=1787940152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WJv2Kp3J85FKYxFSgYZa+YvS6DF83PqF6PWxFmrIM8c=;
        b=IayLysF2XFW4lLBvSqHM/AlmONIsmd/37T6wzfSLspfAoZ3AM8GCbUnAhp/CRGEA0h
         QxCoZVIAVOSQRLjHZF6tIM+Rv+rDJ655yqGo0hLGQnT/ZRrSQFMUN1s/m1HU9QBSCoTg
         onZm89ERe0P8dpN4b5Xo4APA0S/B42+QOQxKkiNi0FeA4iaNAN48wEcfbr7rK2TgMdCQ
         HEqPYCLfHOjnNrUanPmSMKyDsONUV8NHR5MGtCosYsAnDwk+f7F1c/7frUtbO9t1VyP2
         ddeAn1t+nIZFDJhpsLapcPT6Oz+vnSalSPdAK2rpTNDACT/nBniqbzxOHOX3fns2VMCf
         m6og==
X-Gm-Message-State: AFuF++mFKUGevZ6kEDNgZwK2E//ohZ9XYVpbjUQhEMQ4EKteX47cDgYo
	S8XCNgs1tJt+jZ8u+Zx+mU24+3F5x3VbsUjBuHozAW1QRO5j6Q+/5QcdvyPl3g==
X-Gm-Gg: AR+sD103WEPCqn5EeijOZF6FeFLmZGOLL7YiTMmEbu9hwfjrnD1afqFcdJ4TMwtMpbM
	LU6n+kf2vxnjobwKZevoBK2wFjX944j1aloCxyXMYLgvyXjrqPahUXjd12vpBkzLcxwXyomJ1F1
	WSLzjEu2KQGM5+/2W60UBXqrDYAqNRhQkT8N4LEEhqaOxjr/REHjGQtprIvrNcFf1Bw6kP3RkQn
	mT+ryUDLOqOCtEyRx1LrXRo4xad2Bzu/Q/ddR6FO8JwUWUdcpksxu4qRsqvMpxbxezUJDbD75Ca
	8D1YVMENLsSgbrxYkNin84zt2evPmI2HptahAVL/vJLimD2Sw3g9gFYRmLLhg9k3HwOZzZUhai2
	eF3e5fgo9ym3pAnXCeuhThW5InVh7JGbB+YgbvB/XoDGnk7FplrqrMU/jfty5FH+ks9zW3x8Gsa
	n9yMVQu0sPCvIR1Hyo/5jOGCO9UmO9M/jnO7f7XuarVvQMK/KfZZ1cgwpQCzvoPIMLtKqtIrHfA
	1usUc6PqqQN/rCdSEWJiF55vbtDeh6rDiqT20vIxs9f+ASxdS+71K1eF5eOdT/DqMgz/EzaMKY7
	RjcM+TCSQPxJF2Rc8ZoJXvkDWp3L7Rf6FFCCnl22yDgwUIPlcwbPcDkAIgrJe6L6X//TAAz+CU3
	cl7lCtETYFEx3zI70HAkVzEO9PK4mPtbysv1AwJaqgz/AxA==
X-Received: by 2002:a17:90b:5303:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-395c354cbffmr15168074a91.3.1787335352162;
        Fri, 21 Aug 2026 11:02:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 9/9] hunspell: keep ptest failure diagnostics instead of discarding them
Date: Fri, 21 Aug 2026 11:02:11 -0700
Message-ID: <20260821180211.423633-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129433

From: Khem Raj <raj.khem@gmail.com>

run-ptest ran each case as "./test.sh $test > /dev/null 2>&1", throwing
away the only thing that explains a failure: test.sh prints which check
failed and which words were misrecognised, e.g.

  Fail in base.good. Good words recognised as wrong:
  <words>

Without it a failing hunspell ptest reports a bare "FAIL: <name>" and
gives no way to tell a packaging problem from a real defect when the
suite runs on target.

Capture the output and print it, indented, under the FAIL line, and
take test.sh's exit status directly rather than reading $? inside the
else branch of the if that consumed it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/hunspell/files/run-ptest  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/hunspell/files/run-ptest b/meta-oe/recipes-support/hunspell/files/run-ptest
index d2671c9d4e..bccf23506f 100644
--- a/meta-oe/recipes-support/hunspell/files/run-ptest
+++ b/meta-oe/recipes-support/hunspell/files/run-ptest
@@ -16,15 +16,20 @@ for test in $tests; do
     if echo "$SKIP_TESTS" | grep -qw "$test"; then
         continue
     fi
-
-    if ./test.sh "$test" > /dev/null 2>&1; then
+
+    # Capture test.sh output rather than discarding it: on failure it
+    # reports which check failed and which words were misrecognised,
+    # which is the only usable diagnostic when running on target.
+    output=$(./test.sh "$test" 2>&1)
+    status=$?
+
+    if [ $status -eq 0 ]; then
         echo "PASS: $test"
+    elif [ $status -eq 3 ]; then
+        echo "SKIP: $test"
     else
-        status=$?
-        if [ $status -eq 3 ]; then
-            echo "SKIP: $test"
-        else
-            echo "FAIL: $test"
-        fi
+        echo "FAIL: $test"
+        # Indent so ptest-runner does not mistake diagnostics for results.
+        printf '%s\n' "$output" | sed 's/^/    /'
     fi
 done

