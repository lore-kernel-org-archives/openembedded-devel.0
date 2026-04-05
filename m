Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C96E88D96
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34419.1775393388244389464
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Svzxwdb6;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ab39b111b9so13056415ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393387; x=1775998187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPq2fiunv/nikCAV0qSNEONRjCmo7cP7lQbstYsblZg=;
        b=Svzxwdb6dvDdPv3HhY7+fyUFYTaa6GhgkckD6XGC0eCIqjZ64TQq53Es0d90mIrHUP
         c6vR6S8ejKXhFHB8IDUovWRUs/5FJNRCg5s0tF1zl+ufONrhs0ZJCYWDx5xtuM+NATzU
         ea5Qd6vonOJIX9Fn0N43PLKETkdOtXV8j2E0mIXM8ZylliqBQGvNamRhfVwQFwdKLtkI
         J+VXOvzmk49tjrnQ/PeZ2EuKS0N3X9TA0k6Nn5K4pMXijT8nyTCGB1QlR/nMWKQO27Yb
         uRyvc24sCUVSgzTpX4DmoubihXxkvoSeCLxeyRV5Ppz1+F+P3spqWcE8Td4r99EOYOIU
         8k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393387; x=1775998187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPq2fiunv/nikCAV0qSNEONRjCmo7cP7lQbstYsblZg=;
        b=GDtOtc95dVwwbkOwBbYTpa0dgldAAn26auXMUX8/tIi5U+/8ontiXqVPNtLVt7ahSA
         skbyV7Krlu5wygYkuZ3+pTFjiLJ+zXUAf7exUWjZCqJ7P3J992v+XKFLXOK7FRz4nI1N
         DD9wADbb//5oqDkbQyw376lrfo8XOnATCQMIeAV5ROobBwXrdSeJG6SMk89nWHhxnnI2
         E/l7GRl3vixpBABqy7fi6+VzknBbd1UO2Y3id/e5actGdK35eXgINGOTMCU/RZ2mnvKC
         20VZzTx1KsnxUl/x2KrSj3iq8qJ8TIS6h1y0DbCL2ZrWSzZQihyv8Z1k3/JLRjr+8Qkg
         Jk1g==
X-Gm-Message-State: AOJu0YyUQWtJLQ+03orngFggKdHGX8sR6qmkHTY+o4VpEUXx6OxD84vh
	uMxYmGdZEVxFErb5z7LXNycsdbk6AIyM5105fe+GcDxVX9Um3oQZVEdI1O2pyfH9CM8=
X-Gm-Gg: AeBDieuOGAo5BR6cOsziKnFkTkdbMcR8DRiL+uke8H/g5uwthui5KFDcPFa/pvxXBES
	h6xTKn9mj+9w6ug1Ax4nJ0H47EIIjg7N6KaxoEyLwUXUD5uH83LCqNjpKjGqYeV7Ig1utHdGZ+d
	KSfLGDX47POp+6RZebK0Xsx1Phg2dITFKl9fHTNL0cx+fM7z3syC0pSrC3EbQML0xVKyIp3FHIH
	pyqpe1fI/M6VrsleERvRk/PRvLZy1Mgv+jmGg7i4lO1ZHXBSUp3dDRJViu+2xNuRzH+r2nOwlL3
	nKNXtg6C8jSxn7QlxU1oxWr+wkZROre8DoSuTYVnjM47k87mpDGA8v55yZuf6RrUzBdXgy2aTO9
	z/E+eiCsF0Dd7M7hJnG/giv5kjmllefiGwltIWpu2mC9EAGhzcbK2zM/bnmvWjkM8QG9Jl8XQd9
	zXhdHFsGGBmvnkyfZzVUvDrAroHdJj/spSAX0=
X-Received: by 2002:a17:903:384f:b0:2b2:4194:9521 with SMTP id d9443c01a7336-2b28176a5d6mr100076185ad.25.1775393387427;
        Sun, 05 Apr 2026 05:49:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 8/14] wolfssl: patch CVE-2026-4395
Date: Mon,  6 Apr 2026 00:49:10 +1200
Message-ID: <20260405124916.2881008-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126007

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-4395

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-4395.patch         | 31 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4395.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4395.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4395.patch
new file mode 100644
index 0000000000..1289e169c4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4395.patch
@@ -0,0 +1,31 @@
+From 6a60f44e056f55f3cdc9d11384e5a5d5d0b1d628 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Mon, 16 Mar 2026 15:34:18 -0700
+Subject: [PATCH] Check raw pubkey length in wc_ecc_import_x963 before copying
+ to it for KCAPI case.
+
+(cherry picked from commit ddc177b669cff9d3c7e1b51751f9df73062b872a)
+
+CVE: CVE-2026-4395
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/ddc177b669cff9d3c7e1b51751f9df73062b872a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/ecc.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/wolfcrypt/src/ecc.c b/wolfcrypt/src/ecc.c
+index 1fd30cfd9..dcef45a1c 100644
+--- a/wolfcrypt/src/ecc.c
++++ b/wolfcrypt/src/ecc.c
+@@ -10784,7 +10784,10 @@ int wc_ecc_import_x963_ex(const byte* in, word32 inLen, ecc_key* key,
+             XMEMCPY(key->pubkey_raw, (byte*)in, inLen);
+     }
+ #elif defined(WOLFSSL_KCAPI_ECC)
+-    XMEMCPY(key->pubkey_raw, (byte*)in, inLen);
++    if (inLen <= (word32)sizeof(key->pubkey_raw))
++        XMEMCPY(key->pubkey_raw, (byte*)in, inLen);
++    else
++        err = BAD_FUNC_ARG;
+ #endif
+ 
+     if (err == MP_OKAY) {
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 992591fb90..a700e8a820 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2026-3230.patch \
     file://CVE-2026-3547.patch \
     file://CVE-2026-4159.patch \
+    file://CVE-2026-4395.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

