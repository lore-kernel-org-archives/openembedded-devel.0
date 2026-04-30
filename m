Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F915CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:54 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18194.1777549671760805787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QQYO9qpE;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so348627a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549671; x=1778154471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZNRNiWw43az27w3U/5l1+sG/tsO59mSRCNeov8iIqc=;
        b=QQYO9qpET96Udx5pshep40AinIZ6sb3ZN9NO+9oXCC2HxBez7SnYDck9SIwV2vQ/P4
         5q1Y8k8UTgMaueC+A4WUrirmSiFelp3+NQTmaD7ixDGcDK+j5tQwGGGCCtTNNO7bIc3j
         az6uWwwB2kfUzSRQG+t81rsnEyfTpS7KdJyzQR74CKb7GUlkTDdGT7BoMkfUkR3wDMGi
         dQNvxXN2LuG850oCDgm7ARBirDrjlj/Ta6VB37MgrrlOpsz7aN/xz3X7RRSRHqAeCwfK
         Nc/EiIbUQbtcsiehbzXWNIfG7ibooTHRWCDz5pZAjTqW9FXbImlcWcjZsnzQmL9rufM6
         Chew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549671; x=1778154471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ZNRNiWw43az27w3U/5l1+sG/tsO59mSRCNeov8iIqc=;
        b=GLSF0Ikan3ke4EI6j/8x/WVJbIpxVvdAZhqDCZpYBnEfEBfhd9KyfdJGGfRV+uZjNF
         SB/SStxtWRI/qpbRSAL8A2OqZgVbaN4OAa2aSPt96OOdRBAse19H0zOpNembiHmOacAp
         e4mpNtgh0IcVWuGGiGLKTm5DcNJgXy4EQBMLyZ3e6LmP33O6RFUVjQdB1ApLzqcC0K/d
         qgVcd40X/GNv1d1dF0keKqbOl2+Ek0wQ7JtVpc5YFHHDFZ0CR3RgxcYHr7JntwxT8pmN
         HxBShQtD2ty92vB61eApiAzO4vngRPtc4LjjbxAtX5KO7OIvaSE7+WjdZA8ltgv56POw
         QBzw==
X-Gm-Message-State: AOJu0YyBVfgf4fePpkeJpPzIZDIgButJ8Xg3D1BOq7WwQKkef6LiaELq
	4lU43mSMzwzNuMJBZl2zFfeAiut68s1L4wTWj02aqAKKHHRwlra4guuWwvA4KMoB
X-Gm-Gg: AeBDiet8lsthPCY9QsHC48md3aecUpswDyfZv9r49YZ+ofwLBIcQxk0TPWh44iEWZ/q
	hlg3Hop8B0vcG1hZZccwqw5iCmECcnenupml/Z8DRLHKXLpbnZKkeWqApsVYzn1VjAPaUDY0dgE
	GILOhKRrSqByTPQjf5PIV8N/L2F+pWcb25oJaFdh1zVTBsdfRjNjeHqwr01m5tBVHjFMwyyN2Lh
	G0+dI9WJB8Qn2bzZ2GrGg/ELsX7dAQraXlbWVUB/dugK0Z+2SAQFkiMWbhv8YDVwB+uuFgJDpIR
	Oiy/0mbqgUUqWrC6YECeGLPt2mKf+i1QzPjgfFCJNFikXRJNAHHpLHai6TwbDcdeL1tsTwRXsQl
	jUhp2JwXvnFD4AsBc7HdxNhnN6wE6l2Cop3zFRs23zuKLj881excYnEkj8CaTI+XuXd6TafzNJJ
	b1o7118NhQFlwlOacWqZTbPcmFfvySwCkIr5Fcp0BnVIls4cw=
X-Received: by 2002:a17:90a:da90:b0:35f:c5cd:cc5 with SMTP id 98e67ed59e1d1-364c314aedemr2599460a91.24.1777549670956;
        Thu, 30 Apr 2026 04:47:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 19/24] wolfssl: patch CVE-2026-5188
Date: Thu, 30 Apr 2026 23:46:42 +1200
Message-ID: <20260430114649.4184890-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126753

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/10024
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-5188

Dropped unit test changes during the backport.
---
 .../wolfssl/files/CVE-2026-5188.patch         | 101 ++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5188.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5188.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5188.patch
new file mode 100644
index 0000000000..3c4de09188
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5188.patch
@@ -0,0 +1,101 @@
+From 928e64ee08438203cc966d122bb9736361bd6fc7 Mon Sep 17 00:00:00 2001
+From: Eric Blankenhorn <eric@wolfssl.com>
+Date: Fri, 20 Mar 2026 08:16:47 -0500
+Subject: [PATCH] Fix DecodeAltNames length check
+
+(cherry picked from commit 6446bb21155e80a41538d1f815a6cf5a5a0cc0f8)
+
+CVE: CVE-2026-5188
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/6446bb21155e80a41538d1f815a6cf5a5a0cc0f8]
+
+Dropped unit test changes during the backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/asn.c | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/wolfcrypt/src/asn.c b/wolfcrypt/src/asn.c
+index af74678c5..b00568534 100644
+--- a/wolfcrypt/src/asn.c
++++ b/wolfcrypt/src/asn.c
+@@ -19769,6 +19769,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+ 
+             AddAltName(cert, dnsEntry);
+ 
++            if (strLen > length) {
++                return ASN_PARSE_E;
++            }
+             length -= strLen;
+             idx    += (word32)strLen;
+         }
+@@ -19810,6 +19813,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+             dirEntry->next = cert->altDirNames;
+             cert->altDirNames = dirEntry;
+ 
++            if (strLen > length) {
++                return ASN_PARSE_E;
++            }
+             length -= strLen;
+             idx    += (word32)strLen;
+         }
+@@ -19845,6 +19851,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+             emailEntry->next = cert->altEmailNames;
+             cert->altEmailNames = emailEntry;
+ 
++            if (strLen > length) {
++                return ASN_PARSE_E;
++            }
+             length -= strLen;
+             idx    += (word32)strLen;
+         }
+@@ -19924,6 +19933,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+ 
+             AddAltName(cert, uriEntry);
+ 
++            if (strLen > length) {
++                return ASN_PARSE_E;
++            }
+             length -= strLen;
+             idx    += (word32)strLen;
+         }
+@@ -19970,6 +19982,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+             }
+             AddAltName(cert, ipAddr);
+ 
++            if (strLen > length) {
++                return ASN_PARSE_E;
++            }
+             length -= strLen;
+             idx    += (word32)strLen;
+         }
+@@ -20018,6 +20033,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+ 
+             AddAltName(cert, rid);
+ 
++            if (strLen > length) {
++                return ASN_PARSE_E;
++            }
+             length -= strLen;
+             idx    += (word32)strLen;
+         }
+@@ -20035,6 +20053,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+                 return ASN_PARSE_E;
+             }
+             /* Consume the rest of this sequence. */
++            if ((int)((word32)strLen + idx - lenStartIdx) > length) {
++                return ASN_PARSE_E;
++            }
+             length -= (int)(((word32)strLen + idx - lenStartIdx));
+ 
+             if (GetObjectId(input, &idx, &oid, oidCertAltNameType, sz) < 0) {
+@@ -20087,6 +20108,9 @@ static int DecodeAltNames(const byte* input, word32 sz, DecodedCert* cert)
+                 WOLFSSL_MSG("\tfail: unsupported name length");
+                 return ASN_PARSE_E;
+             }
++            if ((int)((word32)strLen + idx - lenStartIdx) > length) {
++                return ASN_PARSE_E;
++            }
+             length -= (int)((word32)strLen + idx - lenStartIdx);
+             idx += (word32)strLen;
+         }
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 671bae1e59..0567105cab 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://CVE-2025-7394-6.patch \
     file://CVE-2026-1005.patch \
     file://CVE-2026-3580.patch \
+    file://CVE-2026-5188.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

