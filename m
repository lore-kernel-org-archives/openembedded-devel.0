Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657E1CD13DF
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18195.1777549673902744723
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fr19DAMq;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35fb7c1a455so270472a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549673; x=1778154473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+0Bn+RWyUa476aGbla3asixkIFsbYQO20lniCp+Lh0=;
        b=fr19DAMqweKM3svz1IwwcAwOn3EG74xH6+rh8bjy2G1khDE0KPKgIhceKyHA1+zLlK
         XT4cN+Fzstm1+YyCiXKNCKkEftOLbwMIn73AukC1ZSwBsYd0aHkwXw3HPksdX7Iycbv2
         itDjm3ekieALygXYnUGTCfg6qtpSRASR2Q1c52ViufE9aMQuVBrfAOOyAKKi9wqkUP4V
         xeFYbhOjqwshknq4yiQxuL4i7jvgoebIQAk5wYG7tO9MWGP9mk5W94sersrzv5pe4cAY
         dtFvnAQRj4rL1ACK0dMbu41cjGdRMnpNAZiDZMrwZIHQvDMCNvM5dhzU3fWvEU0dcCje
         qNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549673; x=1778154473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+0Bn+RWyUa476aGbla3asixkIFsbYQO20lniCp+Lh0=;
        b=Wo3BkSKkuf0a9dX+1B4onAi3dOpGnpTR7ig6dEe6UWMj86ggx1tVqZw/TYqmq+aX80
         zJwEvC62nCxXMObkxUAjHUy7YMEUZKYSx8lD8J9+zmzzv40K3/NhE6SD5HeuPSXVGSr0
         06kokr5E6n5xQr51YjnwDRsgyI3HVRUK976RQBeO5zWoI1arqKiQJXzH/KHQVehRMacB
         lmDrLxrGAiMAEL7w53d1qlHkpuSOYfYO1UwFnp2IFHkqSHfyCL0jj1kM6XipgnEO5rK1
         oTn77n2q0wPf2O2raeJwUdHhnlnw01kMTuiU/C2Ko/hG/gk4oUVuVg1gQen/eUtXs2Uz
         0jNQ==
X-Gm-Message-State: AOJu0YysSgmmLECkZVw9kSaAe/J4eyA6njGgufUqpRy3SAaUsN06n/r6
	XYwW1Wl5AbTByl+GVsBe+Fh+wOy1OoK0OLFSWw/V77Mp5WJNQS/Ka8js4k2/I2jS
X-Gm-Gg: AeBDieue3e4em1TrouQoRQ1A8Ad7l0F6TJYi1HcfmvCMtWwxTZXsG/as6fygHhz+o7P
	2V7PCOpJ8eZxfI+qNu/1sM0juvBT623LnI0tNPPTdWxvM03btvxDD3KNX/G0DXzde22zzMcLdWb
	0GraUl14lr4NQ2Jj+eCgUTYPYiaOUIz4pTq1RIt2m+jLzwZx+prUZl3PN4GV3XfaQNmeRhTsNcB
	3VfOFOvDUCB1H/Ni2BcUfGQR/x60DjWcyHbuMnAjK5vLbz7EHsY2QrtStOh7x7licMfYv6/gLxz
	01ot89/5I+NCqxWHvdy23gjAok+H7qJ83h9ZEBOkUooynLSHyA/az3hLniW26k2haTn/XfFamZ1
	4UWHV0vnCGV7Og/Cz0W9U5hIl2ejCmFNb1Ue+pFNNzlkAvOvBlJTlaTbeDM7jQRC8cuUuMY9+nT
	TCD6cMGBgGdTh2kAStkPEslQ3HR4N6vkPg1a31OgDGpiVuhEM=
X-Received: by 2002:a17:90b:2d04:b0:364:7a37:4066 with SMTP id 98e67ed59e1d1-364c30f0b62mr2813077a91.14.1777549673053;
        Thu, 30 Apr 2026 04:47:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 20/24] wolfssl: patch CVE-2026-5392
Date: Thu, 30 Apr 2026 23:46:43 +1200
Message-ID: <20260430114649.4184890-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126754

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit from the PR[1] mentioned in the nvd[2]

[1]https://github.com/wolfSSL/wolfssl/pull/10039
[2]https://nvd.nist.gov/vuln/detail/CVE-2026-5392

Dropped unit test changes during the backport.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-5392.patch         | 33 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5392.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5392.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5392.patch
new file mode 100644
index 0000000000..a442ea326b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5392.patch
@@ -0,0 +1,33 @@
+From 02c53b7cb22ba520d1b9a061476a1066eef45a42 Mon Sep 17 00:00:00 2001
+From: Anthony Hu <anthony@wolfssl.com>
+Date: Fri, 20 Mar 2026 21:32:14 -0400
+Subject: [PATCH] Add bounds check in PKCS7 streaming indefinite-length
+ end-of-content parsing
+
+(cherry picked from commit 6721bde8e0f4074b76c1ea5e8987b8c2a746b3fa)
+
+CVE: CVE-2026-5392
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/6721bde8e0f4074b76c1ea5e8987b8c2a746b3fa]
+
+Dropped unit test changes during the backport.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index a8545ba0a..92dab5080 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -6485,6 +6485,10 @@ static int PKCS7_VerifySignedData(wc_PKCS7* pkcs7, const byte* hashBuf,
+                 word32 sz = (word32)pkcs7->stream->cntIdfCnt * ASN_INDEF_END_SZ;
+                 localIdx = idx;
+                 for (i = 0; i < sz; i++) {
++                    if (localIdx + i >= pkiMsg2Sz) {
++                        ret = ASN_PARSE_E;
++                        break;
++                    }
+                     if (pkiMsg2[localIdx + i] == 0)
+                         continue;
+                     else {
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 0567105cab..7597c8390d 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -30,6 +30,7 @@ SRC_URI = " \
     file://CVE-2026-1005.patch \
     file://CVE-2026-3580.patch \
     file://CVE-2026-5188.patch \
+    file://CVE-2026-5392.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

