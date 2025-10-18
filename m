Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D38CCD195
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 13:04:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.5472.1760792693390070172
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 06:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbfV2Ukb;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso2254297f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760792692; x=1761397492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QgepKbEAIEQeZQyy7OrxCyHnuLQVQCwcuzpHv9lwVDA=;
        b=jbfV2UkbSPPF6LTRVmTb9MRJuiMeG65A83zMx5UjAFdM/p2q/JV2kVhpwTQD3cPgm/
         6xTJoN6ytM6XJBaPro4tOr7rkdBU4EGbVDdhUG4g2aOa5HEtzsxIwFH0dsqSpHNrUMAO
         Mb/m7sOC6hkKXNijXfV2bddfgR3runtmBDh+RrOUYAo80h1lpnsRHSyrc2vjzxqRjxwm
         NJA/Fqua0NKOfzs/0Ea3L2eaadtc9L7QRnEwrA78eZblBNKz1KeX6FWt2XPeREmOnik0
         AMb7Iivwr1gl81XbT7cGILuIKB6J6Z4Q88KRK2H4tDYu5ftU504heDijaOpeEF4MZjzj
         xPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760792692; x=1761397492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgepKbEAIEQeZQyy7OrxCyHnuLQVQCwcuzpHv9lwVDA=;
        b=BpSOM/cgVqYXb/HGFVNoLaiwLh0sLxui3RWlu8Xt3WFw20f3UnCuHgh26qeLYhkbbH
         RYGponXq6ZB6tz/WVrloWdg9Il5jToxNYVt5l+oyWN60AAjGwlqOK7Sjwlb/bA4Go/LE
         6J0J8bpXVnTxO+l0ViAVf/Mm0Q9Wogl2fqaky+xwHyEQtDi5ahAvrWXWTJuCFFXA8IGQ
         +dFrqpzxHIAu87NOhephv4V7zp6MhOMvODCMqRWCIJ+7qBzZurkhKVTW1aD6oywEcwlJ
         waJ8jhcSKeB/2E0DXXl3qAPCO5rKHJNe8oCNmDzk8rZNh1jVqN9a7c0Q0lFEC6QKqY2F
         VHAg==
X-Gm-Message-State: AOJu0YyluSs/qnlLgQ/pTqeTzMT2yd3SqIZccvDu64bhPmQEe9BsG2/g
	yEOcIhm5asVLm+ibTeZrYAqdnVd1ISyjNjjlTB0ccDMmQIu93+X+iSiTxClomA==
X-Gm-Gg: ASbGnctcpTS2N1aDFUrTj8oViYBjTam+D1zuS1lr4+JQv3/QU87aFH65axKcVR9xDuB
	6m4VK8EaIlbWZDql1+W7fkBi7mS9C0jjqRqZpJKNOlNSY/Bc6yd1hZ76B7+7pgRzFjY8rWiF9v0
	9IPRveuRVcja9qzrXz5ZnwYf79Oio1Lthe7u1GFVYKKm8bz+9Qgb2edW08TJGGT2nd++BcrSJow
	Nqvo5R9AB+9ndDf6iCQj2och44DMGOn3bNDd9XInY9zAcLWzvysk2eyOEz2pFACpABk+6yJKqgw
	dERfxZ4F3uTYSRRhnjXRU2Vz8hX6wix/CWMN17z5OhVEJtwYsOHFVuUzYGT5PBOqDSjtWeLHO2U
	S7z2inq0KjJONsvxXsIiBWv8tOkEYok0A+scQhS6IIYGda216B9sUpOiz+V+h7WeSSvB01enbDA
	==
X-Google-Smtp-Source: AGHT+IH4qTPj5Vb4hVSlona8a8UKJdXi5i8lOxF2GpM+Ne7HUtrC840oew5kuy9oAA0q/qvyA2jyPQ==
X-Received: by 2002:a5d:5886:0:b0:410:f600:c35e with SMTP id ffacd0b85a97d-426fb6a7055mr7317555f8f.8.1760792691758;
        Sat, 18 Oct 2025 06:04:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a9a9sm4917591f8f.29.2025.10.18.06.04.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 06:04:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] sdbus-c++: fix ptest script output
Date: Sat, 18 Oct 2025 15:04:49 +0200
Message-ID: <20251018130449.1382400-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 13:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120786

The run-ptest script had incorrect output: instead of PASS/FAIL, it
is outputting OK/FAILED - that cannot be interpreted by the logparser.

This patch sets the correct run-ptest output.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-core/sdbus-c++/sdbus-c++-1.0.0/run-ptest | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.0.0/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.0.0/run-ptest
index f6ade0c7e4..48354c2f85 100755
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.0.0/run-ptest
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.0.0/run-ptest
@@ -5,11 +5,11 @@ set -o pipefail
 SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
 
 ${SCRIPTPATH}/../tests/sdbus-c++-unit-tests 2>&1 | \
-sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
-sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
-awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}'
+sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/PASS: \1 /' | \
+sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAIL: \1 /' | \
+awk '{if ($1 == "PASS:" || $1 == "FAIL:") {print $0}}'
 
 ${SCRIPTPATH}/../tests/sdbus-c++-integration-tests 2>&1 | \
-sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/OK: \1 /' | \
-sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAILED: \1 /' | \
-awk '{if ($1 == "OK:" || $1 == "FAILED:") {print $0}}' 
+sed -r 's/^\[\s+OK\s+\] (.*) \([0-9]+\sms\)$/PASS: \1 /' | \
+sed -r 's/^\[\s+FAILED\s+\] (.*) \([0-9]+\sms\)$/FAIL: \1 /' | \
+awk '{if ($1 == "PASS:" || $1 == "FAIL:") {print $0}}' 

