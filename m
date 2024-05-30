Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDC3C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:11:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.3994.1717060296327590026
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 02:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IQHaYKnV;
 spf=pass (domain: linaro.org, ip: 209.85.218.49, mailfrom: andre.draszik@linaro.org)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59cc765c29so52484766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717060295; x=1717665095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RSX7v88wlVWJTh1QiuvM9B8vFVjN8RL4A1h396YhpKo=;
        b=IQHaYKnVmhdM5M3EYw57EeZfThGcuv4Ui6Fy4asMcmcEQCj5Fgh+OAlKJYuu/qmFrH
         tK+OEgUWx5ZPyS0reMmoZCy/3U29Ok7ijE+aG6opN2Y0s+flMeRm9h6g6VVgsGoutGOT
         TBteJhttbDUBL7HAQpunuWCMDWmhyIpN0fLnyUSUhBd87mzp6uHNm+Iw24zh9urWjj9o
         4TRvRn88dxO0VhbkZfPqYAk2is2bMTJX4xipsxpP7k39ZsnQHJjjBOUOQuoB15p6bYvY
         /HX7pKtjl1xU/7CqgmeYanc9Sm8DDAHvQnntvWcDltVY68VjHhnZ6VrkIodBT5CHwtUw
         ILPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060295; x=1717665095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSX7v88wlVWJTh1QiuvM9B8vFVjN8RL4A1h396YhpKo=;
        b=c/yx7RoNu6yFMLa/z18z4jdMbA9NMigZgUZYcaosB6vGtS7cee3JTqkRIJ/iTZCpGj
         yl0+9ZEOoX+HOTuRk4raqV6haaYEsFsheVXmdWABywanzsRL4qzbOcM4IYQUk8IgzDzX
         t4TAo/oFfE1PUHXbRShyBuCs3UhaSuS58HOF+yqxVWGfzVDTq8vbGcL3eAqsw/uCwWSP
         wl9eAHYCyu8U7ZAvfg+2Hr6iBQOY3LCW8LA1Om+OZByBLOmT31Kz+VxV/upPxfm5yC9a
         Xde4kWXmi5o1Npo5M0/3CDjgGjQly2oPMLV6FVNqJL2TlasS0/dLxqB4dFQs9Jd4KNsR
         ZQZw==
X-Gm-Message-State: AOJu0YyOr7yCVsszKMddZmSPpRZvAEa8nRw7QRun0wtewhtoeZFhp6Sa
	dtRoHo5KghXs6oCIChd0awFtTDzj4U5Y5zmftMWFQCgWlr0j1Rk+1nUu9jbS5JVVdRwulwo3+4z
	3sEY=
X-Google-Smtp-Source: AGHT+IEQGKeubtOMd8xKW0M9OyKyLXwEHVxmo/lMSHmnoGykJFybmZu1tS3vvjXmCNCO4bbJG/TYsA==
X-Received: by 2002:a17:906:40ce:b0:a62:d348:8df4 with SMTP id a640c23a62f3a-a65e8e5d49amr95764666b.30.1717060294499;
        Thu, 30 May 2024 02:11:34 -0700 (PDT)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a629ecfabfbsm655797766b.178.2024.05.30.02.11.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 02:11:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] android-tools: fix adb OpenSSL patch (really make compatible with >= v1.1)
Date: Thu, 30 May 2024 10:11:32 +0100
Message-ID: <20240530091132.2978796-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110623

As per the inlined patch commit message, gcc 14 is highlighting a few
issues with the existing patch and it doesn't compile.

Update the patch to fix.

Note there are two recipes for android-tools in this layer - the recipe
here and another one in
meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools. A patch
for the alternative android-tools version had already been posted, so
this patch only deals with the remaining one.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../android-tools/core/adb_libssl_11.diff     | 68 ++++++++++++++-----
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
index 177d69a97a3e..5ba576fe84d4 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
@@ -1,29 +1,54 @@
-Description: adb: Make compatible with openssl 1.1
- OpenSSL version 1.1 brought some API changes which broke the build here,
- fix that by accessing rsa->n (and e) directly, using RSA_get0_key instead.
-Author: Chirayu Desai <chirayudesai1@gmail.com
-Last-Update: 2016-11-10
----
-Upstream-Status: Pending
+From 9fd6f6f234de245916ea9df4ca76fabeb99561a6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
+Date: Mon, 27 May 2024 10:54:08 +0100
+Subject: [PATCH] adb: (really) make compatible with openssl 1.1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
-This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
----
-Upstream-Status: Pending
+Compiling using gcc 14 results in the following:
+
+| .../android-tools/5.1.1.r37/git/system/core/adb/adb_auth_host.c:86:23: error: passing argument 2 of 'RSA_get0_key' from incompatible pointer type [-Wincompatible-pointer-types]
+|    86 |     RSA_get0_key(rsa, &n, &e, NULL);
+|       |                       ^~
+|       |                       |
+|       |                       BIGNUM ** {aka struct bignum_st **}
+| .../android-tools/5.1.1.r37/recipe-sysroot/usr/include/openssl/rsa.h:229:56: note: expected 'const BIGNUM **' {aka 'const struct bignum_st **'} but argument is of type 'BIGNUM **' {aka 'struct bignum_st **'}
+|   229 |                                         const BIGNUM **n, const BIGNUM **e,
+|       |                                         ~~~~~~~~~~~~~~~^
+| .../android-tools/5.1.1.r37/git/system/core/adb/adb_auth_host.c:86:27: error: passing argument 3 of 'RSA_get0_key' from incompatible pointer type [-Wincompatible-pointer-types]
+|    86 |     RSA_get0_key(rsa, &n, &e, NULL);
+|       |                           ^~
+|       |                           |
+|       |                           BIGNUM ** {aka struct bignum_st **}
+| .../android-tools/5.1.1.r37/recipe-sysroot/usr/include/openssl/rsa.h:229:74: note: expected 'const BIGNUM **' {aka 'const struct bignum_st **'} but argument is of type 'BIGNUM **' {aka 'struct bignum_st **'}
+|   229 |                                         const BIGNUM **n, const BIGNUM **e,
+|       |                                                           ~~~~~~~~~~~~~~~^
+
+Update the code to correct usage of the OpenSSL APIs.
 
- system/core/adb/adb_auth_host.c |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+Signed-off-by: André Draszik <andre.draszik@linaro.org>
 
+---
+Upstream-Status: Inappropriate (ancient version of android-tools)
+---
+ adb/adb_auth_host.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/adb/adb_auth_host.c b/adb/adb_auth_host.c
+index dd839001b5a3..a24e9bd89a7a 100644
 --- a/adb/adb_auth_host.c
 +++ b/adb/adb_auth_host.c
-@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
+@@ -73,7 +73,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa, RSAPublicKey *pkey)
+     BIGNUM* rr = BN_new();
+     BIGNUM* r = BN_new();
      BIGNUM* rem = BN_new();
-     BIGNUM* n = BN_new();
+-    BIGNUM* n = BN_new();
++    const BIGNUM* n = NULL, *e = NULL;
      BIGNUM* n0inv = BN_new();
-+    BIGNUM* e = BN_new();
  
      if (RSA_size(rsa) != RSANUMBYTES) {
-         ret = 0;
-@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
+@@ -82,7 +82,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa, RSAPublicKey *pkey)
      }
  
      BN_set_bit(r32, 32);
@@ -32,7 +57,7 @@ Upstream-Status: Pending
      BN_set_bit(r, RSANUMWORDS * 32);
      BN_mod_sqr(rr, r, n, ctx);
      BN_div(NULL, rem, n, r32, ctx);
-@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
+@@ -96,11 +96,10 @@ static int RSA_to_RSAPublicKey(RSA *rsa, RSAPublicKey *pkey)
          BN_div(n, rem, n, r32, ctx);
          pkey->n[i] = BN_get_word(rem);
      }
@@ -41,3 +66,10 @@ Upstream-Status: Pending
  
  out:
      BN_free(n0inv);
+-    BN_free(n);
+     BN_free(rem);
+     BN_free(r);
+     BN_free(rr);
+-- 
+2.45.1.288.g0e0cd299f1-goog
+
-- 
2.45.1.288.g0e0cd299f1-goog


