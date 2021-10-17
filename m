Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53533C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 21:22:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.27893.1634505740796867112
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=puXpoSr0;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so8476693wma.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UfLHoXpIbEt8HFop2KldqeWfFX90QlLbo32VHvdeGw=;
        b=puXpoSr0ewvI1G8EkulOhdt8nxtjbHB/6rs8HLCi6AZGe7FPNy0GPlApmrNAQ24kND
         LzXK9IXnVIiUMYMubIn0+chdfndi9gnyuPwqEImKP3VYa4Fs8IXCvvT6SypaxEuXG2hy
         aj7LuVzg5w3PjnjwJErtvwZMD8ondXUQaXwqnA9nnE4UBZXRWmRlbDLO1V7cfozXUv6P
         y0rTxISkLlf2KyNDdKGEaOHmsTuTB+vrM79RomMdXFB0kaRe3yxtqJ6QCJ++u0VEWqO3
         o9Vc1GP6m7OeK8em/funCeKhQBwwGfG9VGa/P61O1ULhNpm1W5GV0NDEk8CoyOYmwryS
         sPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UfLHoXpIbEt8HFop2KldqeWfFX90QlLbo32VHvdeGw=;
        b=KWsPcPQfDZRN/oySGspMKKoMeQAAsZo+TLQ2O8j2Oj0cYvgVeQqDi2iyj0sOZlMYSh
         sS5pCEh5vSF3SnNM+9L+ZAxO6ZfTWoeUPRANIFKnScws2v4KR7f+MsEXgHuR81/TR5YG
         eQFUgUPmqWJw1oEi8o17E1awdiYNwMLFAOO2q+hH38efudjDOr2HISf4D5NhD+Q6TLk2
         AMf3ZgFNHfiFIPAhGCeXgIfowQ+RgAMv03IfDqQdbH8pEDa9g5c3P00MCh6wdN8iG326
         c7fD2VJnDh7YM0HnqK+VPQlnC9p4EwOewitLPtaDMef5ohBmVeuDbs/RKxVJg7uwxYZN
         OdGg==
X-Gm-Message-State: AOAM5307hUtSjt+kyFMQeKizT+iyVJsCD+2svI5dnOEmMYMQJkTg5u93
	Yt27hwoulPeilT80PfxICIFoRpaRj94=
X-Google-Smtp-Source: 
 ABdhPJxVQCDY2abBZh3uDs987w+ZracQJ/eBJ6FBQuwnWa2c1Js/L1UKs3dE2sVKLBDTmDCfihWGcA==
X-Received: by 2002:a1c:3b86:: with SMTP id
 i128mr40607579wma.132.1634505739250;
        Sun, 17 Oct 2021 14:22:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 l16sm10996704wmj.33.2021.10.17.14.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 14:22:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-cryptography: fix build with openssl-3
Date: Sun, 17 Oct 2021 23:22:15 +0200
Message-Id: <20211017212215.1852270-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Oct 2021 21:22:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93409

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...me-more-constants-we-don-t-need-5361.patch | 25 +++++++++++++
 ...or-we-don-t-use-in-cryptography-or-p.patch | 32 +++++++++++++++++
 ...erties-for-all-openssl-versions-5589.patch | 36 +++++++++++++++++++
 .../python/python-cryptography_2.8.bb         |  3 ++
 4 files changed, 96 insertions(+)
 create mode 100644 recipes-devtools/python/python-cryptography/0001-remove-some-more-constants-we-don-t-need-5361.patch
 create mode 100644 recipes-devtools/python/python-cryptography/0002-remove-every-error-we-don-t-use-in-cryptography-or-p.patch
 create mode 100644 recipes-devtools/python/python-cryptography/0003-define-OAEP-properties-for-all-openssl-versions-5589.patch

diff --git a/recipes-devtools/python/python-cryptography/0001-remove-some-more-constants-we-don-t-need-5361.patch b/recipes-devtools/python/python-cryptography/0001-remove-some-more-constants-we-don-t-need-5361.patch
new file mode 100644
index 0000000..ef5a597
--- /dev/null
+++ b/recipes-devtools/python/python-cryptography/0001-remove-some-more-constants-we-don-t-need-5361.patch
@@ -0,0 +1,25 @@
+From 513720d786816eb66296f8701b1377afc9e151f4 Mon Sep 17 00:00:00 2001
+From: Paul Kehrer <paul.l.kehrer@gmail.com>
+Date: Thu, 30 Jul 2020 09:44:31 -0500
+Subject: [PATCH] remove some more constants we don't need (#5361)
+
+these are gone in 3.0 anyway and were removed in that draft PR
+---
+ src/_cffi_src/openssl/crypto.py | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/_cffi_src/openssl/crypto.py b/src/_cffi_src/openssl/crypto.py
+index d8835442..1a6dbbcd 100644
+--- a/src/_cffi_src/openssl/crypto.py
++++ b/src/_cffi_src/openssl/crypto.py
+@@ -23,10 +23,6 @@ static const int OPENSSL_CFLAGS;
+ static const int OPENSSL_BUILT_ON;
+ static const int OPENSSL_PLATFORM;
+ static const int OPENSSL_DIR;
+-static const int CRYPTO_MEM_CHECK_ON;
+-static const int CRYPTO_MEM_CHECK_OFF;
+-static const int CRYPTO_MEM_CHECK_ENABLE;
+-static const int CRYPTO_MEM_CHECK_DISABLE;
+ """
+ 
+ FUNCTIONS = """
diff --git a/recipes-devtools/python/python-cryptography/0002-remove-every-error-we-don-t-use-in-cryptography-or-p.patch b/recipes-devtools/python/python-cryptography/0002-remove-every-error-we-don-t-use-in-cryptography-or-p.patch
new file mode 100644
index 0000000..e7b4e20
--- /dev/null
+++ b/recipes-devtools/python/python-cryptography/0002-remove-every-error-we-don-t-use-in-cryptography-or-p.patch
@@ -0,0 +1,32 @@
+From 9e5b84a9c0acc5f1e503495fd615439d82085188 Mon Sep 17 00:00:00 2001
+From: Paul Kehrer <paul.l.kehrer@gmail.com>
+Date: Mon, 27 Jul 2020 06:31:41 -0500
+Subject: [PATCH] remove every error we don't use in cryptography or pyopenssl
+ (#5355)
+
+* remove every error we don't use in cryptography or pyopenssl
+
+sorry external consumers, carrying things we don't use and don't have
+downstream tests for has become too much of a burden
+
+* re-add a constant we need for tests for now
+
+* pyopenssl needs these three
+
+MJ: remove only EVP_R_KEYGEN_FAILURE to fix build with openssl-3
+---
+ src/_cffi_src/openssl/err.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/_cffi_src/openssl/err.py b/src/_cffi_src/openssl/err.py
+index d4033f5a..f573bdf3 100644
+--- a/src/_cffi_src/openssl/err.py
++++ b/src/_cffi_src/openssl/err.py
+@@ -66,7 +66,6 @@ static const int EVP_R_DIFFERENT_KEY_TYPES;
+ static const int EVP_R_INITIALIZATION_ERROR;
+ static const int EVP_R_INPUT_NOT_INITIALIZED;
+ static const int EVP_R_INVALID_KEY_LENGTH;
+-static const int EVP_R_KEYGEN_FAILURE;
+ static const int EVP_R_MISSING_PARAMETERS;
+ static const int EVP_R_NO_CIPHER_SET;
+ static const int EVP_R_NO_DIGEST_SET;
diff --git a/recipes-devtools/python/python-cryptography/0003-define-OAEP-properties-for-all-openssl-versions-5589.patch b/recipes-devtools/python/python-cryptography/0003-define-OAEP-properties-for-all-openssl-versions-5589.patch
new file mode 100644
index 0000000..eafec49
--- /dev/null
+++ b/recipes-devtools/python/python-cryptography/0003-define-OAEP-properties-for-all-openssl-versions-5589.patch
@@ -0,0 +1,36 @@
+From 5df5945d7b613ffef80f50c3febac86358c93cc3 Mon Sep 17 00:00:00 2001
+From: Paul Kehrer <paul.l.kehrer@gmail.com>
+Date: Thu, 26 Nov 2020 11:52:47 -0600
+Subject: [PATCH] define OAEP properties for all openssl versions (#5589)
+
+In 3.0 these aren't macros so we can't test this way. All our supported
+OpenSSLs have these bindings now and LibreSSL does not.
+---
+ src/_cffi_src/openssl/rsa.py | 10 +++-------
+ 1 file changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/src/_cffi_src/openssl/rsa.py b/src/_cffi_src/openssl/rsa.py
+index 216e633a..e2fbc422 100644
+--- a/src/_cffi_src/openssl/rsa.py
++++ b/src/_cffi_src/openssl/rsa.py
+@@ -60,17 +60,13 @@ int EVP_PKEY_CTX_set_rsa_oaep_md(EVP_PKEY_CTX *, EVP_MD *);
+ CUSTOMIZATIONS = """
+ static const long Cryptography_HAS_PSS_PADDING = 1;
+ 
+-#if defined(EVP_PKEY_CTX_set_rsa_oaep_md)
++#if !CRYPTOGRAPHY_IS_LIBRESSL
+ static const long Cryptography_HAS_RSA_OAEP_MD = 1;
+-#else
+-static const long Cryptography_HAS_RSA_OAEP_MD = 0;
+-int (*EVP_PKEY_CTX_set_rsa_oaep_md)(EVP_PKEY_CTX *, EVP_MD *) = NULL;
+-#endif
+-
+-#if defined(EVP_PKEY_CTX_set0_rsa_oaep_label)
+ static const long Cryptography_HAS_RSA_OAEP_LABEL = 1;
+ #else
++static const long Cryptography_HAS_RSA_OAEP_MD = 0;
+ static const long Cryptography_HAS_RSA_OAEP_LABEL = 0;
++int (*EVP_PKEY_CTX_set_rsa_oaep_md)(EVP_PKEY_CTX *, EVP_MD *) = NULL;
+ int (*EVP_PKEY_CTX_set0_rsa_oaep_label)(EVP_PKEY_CTX *, unsigned char *,
+                                         int) = NULL;
+ #endif
diff --git a/recipes-devtools/python/python-cryptography_2.8.bb b/recipes-devtools/python/python-cryptography_2.8.bb
index d56e85f..40d5e69 100644
--- a/recipes-devtools/python/python-cryptography_2.8.bb
+++ b/recipes-devtools/python/python-cryptography_2.8.bb
@@ -65,6 +65,9 @@ FILES:${PN}-dbg += " \
 "
 
 SRC_URI += " \
+    file://0001-remove-some-more-constants-we-don-t-need-5361.patch \
+    file://0002-remove-every-error-we-don-t-use-in-cryptography-or-p.patch \
+    file://0003-define-OAEP-properties-for-all-openssl-versions-5589.patch \
     file://run-ptest \
 "
 
-- 
2.32.0


