Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE7BC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 11:18:32 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.19469.1716895110204897682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 04:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=szgNgt0p;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51fcb7dc722so654283e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716895108; x=1717499908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9XJzLdcxFIRwEcD+h5+4Ub6sY4pr/1dky+HlseMMhA=;
        b=szgNgt0pLiO4bsI8tX/K8Hqrwkncpp8A/Rni+0N8NftdebPaOcNPKJRqJApp5OKJxk
         M3o7vHmLjJt9TrdnATMca+s7pX0FvSs+47gQyYH4umtgjBJKjrW9xLiyqTsQbH6dJ2vu
         Tn3P98dhmz5vPjhqZ7DC0b5nbWvYhrFhyO2/MAZs2CQhF/dFfS2FlNtOoQTYPxGjcwjc
         bZAlz1RuoXLwUliDcZo6KrTe76Wu9lqguACrKIDN9LidVef6irX6mqxc0z8TCZdjre8y
         JXTRiwgca0mRZAYol3GFd91Qy5jQ1g9Kc6f6ERBCbXaa+9ddXReedz1PlIQDh/aFQ6eg
         BcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716895108; x=1717499908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9XJzLdcxFIRwEcD+h5+4Ub6sY4pr/1dky+HlseMMhA=;
        b=TXrB58If+TJD5lItmzhwr34Ri1moBJ4gwdzq27rzTG5Fp/n8EnKhbB7S/FpokMcgxv
         XYOoyNMNxpA8RIW0eBc/915t21bPP4XX1ubt658Hcd3CuBBZ/trfHd6pcxwNSzc+RcX/
         /MTknznx7f4dOTDcNKBzgQOSpxek+Gfho1tbSQt1tfHlEtP181oiXmQdXe4PDw8e3dhB
         TX7hLBDN4mOXxBazF587zIDy3tncmboDDWcyCOcpUscvFcE1vb95qqNSk13BqVSHRm/T
         mXFyG24lUrFox9/OD84yFGAe/Ap6xB9Kd3mzekU5aUmXKRjmnXTjpiXDVGeze20lhS2s
         3RWQ==
X-Gm-Message-State: AOJu0Yx6GTx/Xqv2bq5hrM/946LbcVvVUdytwvefZAGbLUbbL88NFQ9K
	dhfmDW1xnQCJsqXJuvMiwObGkk0qzbUPBgio6IDpIvqCNNlYyWIHtJQYt3OIu8RHzoQ2w/UwpKY
	W
X-Google-Smtp-Source: AGHT+IHgZUZ8QI+dAUFVGnqklP3M/6voDAjhMmI84p5Uup1WSUX3Nbf7nb4vT9vYccKZcCJOKRSyyg==
X-Received: by 2002:a05:6512:3194:b0:51f:23b8:d3c4 with SMTP id 2adb3069b0e04-52946483c5bmr4516785e87.27.1716895107850;
        Tue, 28 May 2024 04:18:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529711fb5edsm935860e87.257.2024.05.28.04.18.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:18:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] android-tools: fix adb/libssl-1.1 patch
Date: Tue, 28 May 2024 14:18:26 +0300
Message-Id: <20240528111826.4036084-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 11:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110588

GCC 14.0 being stricter regarding const pointers pointed out the issue
in the adb_libssl_11.diff. RSA_get0_key returns pointers to internal
data of an RSA key structure. As such, this data should use const
pointers, should not be allocated and, more importantly, should not be
freed. Update the patch to use const pointers, drop allocation and
freeing of the 'n' big number.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../android-tools/core/adb_libssl_11.diff             | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
index 177d69a97a3e..ddb41ea4b081 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
@@ -17,9 +17,10 @@ Upstream-Status: Pending
 +++ b/adb/adb_auth_host.c
 @@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
      BIGNUM* rem = BN_new();
-     BIGNUM* n = BN_new();
+-    BIGNUM* n = BN_new();
++    const BIGNUM* n;
      BIGNUM* n0inv = BN_new();
-+    BIGNUM* e = BN_new();
++    const BIGNUM* e;
  
      if (RSA_size(rsa) != RSANUMBYTES) {
          ret = 0;
@@ -32,7 +33,7 @@ Upstream-Status: Pending
      BN_set_bit(r, RSANUMWORDS * 32);
      BN_mod_sqr(rr, r, n, ctx);
      BN_div(NULL, rem, n, r32, ctx);
-@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
+@@ -96,11 +97,10 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
          BN_div(n, rem, n, r32, ctx);
          pkey->n[i] = BN_get_word(rem);
      }
@@ -41,3 +42,7 @@ Upstream-Status: Pending
  
  out:
      BN_free(n0inv);
+-    BN_free(n);
+     BN_free(rem);
+     BN_free(r);
+     BN_free(rr);
-- 
2.39.2


