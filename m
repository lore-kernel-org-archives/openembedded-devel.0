Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64203E6401F
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:49:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34418.1775393385483078249
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hi5UdiDy;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b23fcf90b2so30970945ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393385; x=1775998185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2tOEYEQGp3/vHKMcLKmR74jNUYSyhKr+5pgcz7+sGI=;
        b=hi5UdiDyom9ja53ry+ax7+1RI525X0XBVdRZFCh3C29kk6MmKTbh5ALEUrrZcftfBN
         HZV/tfPCHTQx0U7BP08n3obAe0k+EtRgFT6gg9DoeNokCQCq364RSWrTXhDSs6d/fFaY
         7xTeIzPcG7smoKAeUIAFNnFNpznzE7etNQIS0oKc4yzt4RZ8pTyZZZoq0FQoJWrozKw6
         rUVEp3FUU9Uk+hg0S10x1xFVnMrwWiCJ1C/l0J4Zi2yl3qUu4iTj+40j/mlDvmqRdBNH
         jEahB6Mzuf5DT3KULFNz7s3SqraF2djrZY80TN4j4veM8xLVXb0yJAYgRrzt5Ss0TiJl
         oidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393385; x=1775998185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2tOEYEQGp3/vHKMcLKmR74jNUYSyhKr+5pgcz7+sGI=;
        b=BHJIkCSPY5eu71hiFMtU6NRsnMoEyBMISX+NaBxSE/FCvTEvkyXKVsvKyAkTU7jmi8
         FzTSgB2tnuOiU4tRlXiT9HmaFcykVThBtKzU5yX4y+2fbDRv37SqKIc6QdNt5lweI+b5
         19YriVDvR9eAuLqgcGw/lAwDk+5c0HV29vQBiHPQKaneiLXMvQtlUNXEWYJq/d9+6cFV
         s0WdLrdGCuvvKX+ilmNsZp9Bx4dDD6NseTKWA9anhsKDZC9omyyob4GDFDkrJhX78fzc
         B4o7LkvGIqXBXTILbEmYmvECOoimu9KUOz36R9Ut2rThMgUuIMOLBrF4OFSr+jWkbGVo
         X8xA==
X-Gm-Message-State: AOJu0Yxvi9p/KZcTNVDfhZVmna4qG7s3nRPaV6BddGO5Ynop8K//SKTZ
	jBumLRyLplO9R+5lio/Nx3OWSMQIuoWIb1978t8W6OWWIfnCxtluhVWbWjEEJjikoM4=
X-Gm-Gg: AeBDievWmEgNsEqatqzAfgX3xfw7kk1gdcz43FUB6DzD7Z9WgzKuGrDM7cjsUo4rABs
	pogF2FxpIoqOh358BL7j4DAbBcjUdLJ2vA0EiDAa6F4YqzK9F4n+/aTKJOaRcsie74ztjwIlDNj
	8c/BKMSJKd8MYip2nknOMytfiQpOycSQMsxNu8R/V4vYj9aOi7W0UDp7CJX8VhWVKptDye9+4Ml
	GAkmEg+96la8A2qz5vZLnUOj3ice3243s0Isy99jNGl/9dm0vqpVkSaFzYA3ts82uv0t4Z9XiiO
	Im/iJCphOk2HINo9b5E3q1vP2c8tKH0xc/mRjUOIIdaEvHOgjumODvSEs0Cxsbdf+tZDRFRR/7E
	QIpqIHT0rgzk27zoPY6FbKrPzwxUiESzUmhrqQrLasFV2EVBN2gEguDUlQN+mUc2RDcoKgX4yu7
	RcdUsBYKVf7EE4is/7gYE5i3UB9mUDvneJ8OY=
X-Received: by 2002:a17:903:1984:b0:2b2:4c58:5ba7 with SMTP id d9443c01a7336-2b2818014c8mr102628815ad.30.1775393384682;
        Sun, 05 Apr 2026 05:49:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:49:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 7/14] wolfssl: patch CVE-2026-4159
Date: Mon,  6 Apr 2026 00:49:09 +1200
Message-ID: <20260405124916.2881008-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126006

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-4159

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/files/CVE-2026-4159.patch         | 32 +++++++++++++++++++
 .../wolfssl/wolfssl_5.8.0.bb                  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4159.patch

diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4159.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4159.patch
new file mode 100644
index 0000000000..982cbd09af
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-4159.patch
@@ -0,0 +1,32 @@
+From 4de19e3894e81eeaf3079b1270813d0a2b7fe69c Mon Sep 17 00:00:00 2001
+From: Josh Holtrop <josh@wolfssl.com>
+Date: Tue, 10 Mar 2026 17:26:28 -0400
+Subject: [PATCH] Avoid one-byte read outside of allocated encrypted content
+ buffer in wc_PKCS7_DecodeEnvelopedData()
+
+(cherry picked from commit d37b51c3cef6897e117364ab8b1a257e52a634c0)
+
+CVE: CVE-2026-4159
+Upstream-Status: Backport [https://github.com/wolfSSL/wolfssl/commit/d37b51c3cef6897e117364ab8b1a257e52a634c0]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ wolfcrypt/src/pkcs7.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/wolfcrypt/src/pkcs7.c b/wolfcrypt/src/pkcs7.c
+index 4ba96c90d..e65ddd493 100644
+--- a/wolfcrypt/src/pkcs7.c
++++ b/wolfcrypt/src/pkcs7.c
+@@ -12853,6 +12853,12 @@ WOLFSSL_API int wc_PKCS7_DecodeEnvelopedData(wc_PKCS7* pkcs7, byte* in,
+             /* use cached content */
+             encryptedContent = pkcs7->cachedEncryptedContent;
+             encryptedContentSz = (int)pkcs7->cachedEncryptedContentSz;
++
++            if (encryptedContentSz <= 0) {
++                ret = BUFFER_E;
++                break;
++            }
++
+             padLen = encryptedContent[encryptedContentSz-1];
+ 
+             /* copy plaintext to output */
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
index 1f5b051d16..992591fb90 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.0.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2026-3229-3.patch \
     file://CVE-2026-3230.patch \
     file://CVE-2026-3547.patch \
+    file://CVE-2026-4159.patch \
 "
 
 SRCREV = "b077c81eb635392e694ccedbab8b644297ec0285"

