Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780D7CCD183
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 01:25:40 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1105.1760059539552696756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 18:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5jwVf6J;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-330a4d4359bso1351813a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760059539; x=1760664339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/8k8FyGzzjzBbRw9AYTyWvJZpLg+7M1LKmhtP0sU50=;
        b=S5jwVf6JnSLnmjtKXs0GH9Ta4AcvHBJ41onK7tC58Kc4QHGnzhqB8HjymDafaSj5+P
         8yh6VOwq2d79UGpKZuTmc7fVfClgfpS4FXJurAIatvS4x0MjaTknFlZJmsJd1hWuxK8m
         nc9R3kt/YN11u7zJ0ycnBQ+cFGvJGM+QqM6X0wKIJm+k6eh/frzWlz5wSbJUED6Mr5/M
         z8KNCVd0mOp/dQKk0TADiikOlB/m4cB8+y3k04uFYPpeC8oq1Ht741nXoI/nFbvrbMED
         ZDdpaYGMmywFsmUA2Hg1nohvtEsGk+xbzku40CLHMZUbSEzH7lYnfqXDFxZVtIyNp8lw
         /yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760059539; x=1760664339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/8k8FyGzzjzBbRw9AYTyWvJZpLg+7M1LKmhtP0sU50=;
        b=p+IPH5m/SPueRKAuBEgMcvI20GmJTKjQaUXGNRkwB4v4qnuq8XIJgYPnBkrNEk/uxu
         krcZNYgiFlztTNdGWJQ/Q7lH3T6PkLyKUoiZdgljwBsl6IIPm7jXZ2zCKCugn5z01B+M
         CnDuQJB4yB5xFlsJ2MX8B+broKPoGjDdQpF0k9VHNRI6LFVZmvbJ/wdKRd3QdG81bdUZ
         IN1/Y3J5urcPJZZwfXkcscDeJoNYDlJKnE/iOaP4QKzwyfjAOO4xKLVbG17BBPYLr7Ol
         cx7/QD3w88UYbE7nvSIrGeuWoByWpYtOiUdx/FnooA1FgMNKPENf+smwzIilZIiqBpmR
         89Eg==
X-Gm-Message-State: AOJu0YybwG2aM5H+Uz2m3psJYEFB1shi6STO7MXDiHRjaqRgxqFSmvfK
	xvLM8Di1i3N+u+y/o6OCqcyztWI/5R1n1m8a+sfnYKg7KopwY1fgCmJjlTbsfA==
X-Gm-Gg: ASbGncuki6SPHMIRHIU2NjnnbNNsBAnHFCqSMn9GofmD9y4u9NDiBP6vJaj5PwUwc08
	WR/q5TnOu9GHmZ0x1nAvxaX+roLcTv9Xa8hPP0/i+00cHRpimKePY1WtsYlekWei131e2fuqodO
	BKEqHM5NwtcRWCBULSpMJqBElZSoM1TuaNKkWaH8NHJBg9acsppKaQO6jzRgV2GRO9m77fYZYRb
	TvJHAnanu8D17GIPg59B9AxrJBNvkAKw9U4d2he/6k+5p5iqvaTLuWv3hS1DzcVqrgfyOXpZLoo
	vtL9a3B92lnkoko5QSTKUpmYTUxYpKJH/P621Qqf81UVnBSUWGVr1sQjGjwNJJVh+5oR/6B079a
	0hVRzq+/LUKvXSrE10gpZAgGuEEI2ZCN70E1vzuDzU5u3iQSTApXVqzzoRUiR
X-Google-Smtp-Source: AGHT+IEKNLwIrxpBLQmCyjAwVE94yp1DIWYoMhRWBmDj7mYAh3ymyD972U8hqxgj6keV6GJNuKVbvQ==
X-Received: by 2002:a17:90b:3b8c:b0:32e:3552:8c79 with SMTP id 98e67ed59e1d1-33b513cf79cmr12860053a91.29.1760059538706;
        Thu, 09 Oct 2025 18:25:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52953666sm3726876a91.2.2025.10.09.18.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 18:25:38 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 2/3] libraw: patch CVE-2025-43963
Date: Fri, 10 Oct 2025 14:25:12 +1300
Message-ID: <20251010012513.4143937-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010012513.4143937-1-ankur.tyagi85@gmail.com>
References: <20251010012513.4143937-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 01:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120464

Details https://nvd.nist.gov/vuln/detail/CVE-2025-43963

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libraw/libraw/0002-CVE-2025-43963.patch   | 40 +++++++++++++++++++
 .../recipes-support/libraw/libraw_0.21.2.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch b/meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch
new file mode 100644
index 0000000000..d571164781
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch
@@ -0,0 +1,40 @@
+From 975393c804bc321fd4bc709c3c221733dac2d80a Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Thu, 6 Feb 2025 21:01:58 +0300
+Subject: [PATCH] CVE-2025-43963
+
+check split_col/split_row values in phase_one_correct
+
+CVE: CVE-2025-43963
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964]
+
+(cherry picked from commit be26e7639ecf8beb55f124ce780e99842de2e964)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index 1a1bdfb3..f89aecce 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -348,7 +348,8 @@ int LibRaw::phase_one_correct()
+           off_412 = ftell(ifp) - 38;
+         }
+       }
+-      else if (tag == 0x041f && !qlin_applied)
++      else if (tag == 0x041f && !qlin_applied && ph1.split_col > 0 && ph1.split_col < raw_width
++		&& ph1.split_row > 0 && ph1.split_row < raw_height)
+       { /* Quadrant linearization */
+         ushort lc[2][2][16], ref[16];
+         int qr, qc;
+@@ -432,7 +433,8 @@ int LibRaw::phase_one_correct()
+         }
+         qmult_applied = 1;
+       }
+-      else if (tag == 0x0431 && !qmult_applied)
++      else if (tag == 0x0431 && !qmult_applied && ph1.split_col > 0 && ph1.split_col < raw_width 
++		&& ph1.split_row > 0 && ph1.split_row < raw_height)
+       { /* Quadrant combined - four tile gain calibration */
+         ushort lc[2][2][7], ref[7];
+         int qr, qc;
diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index 67e1494f85..36b783b310 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
 SRC_URI = " \
     git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https \
     file://0001-CVE-2025-43961-CVE-2025-43962.patch \
+    file://0002-CVE-2025-43963.patch \
 "
 SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
 S = "${WORKDIR}/git"

