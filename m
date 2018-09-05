Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 713EC7942B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id b30-v6so1584103pla.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e+j3b0sQmcO3Cl9uyrXtBH0Br1H6BfEk/m4i9uIvHx4=;
	b=G8ZQZClJKk/Rxxpry7OL6DYBEyRSGao8bjj/lCVeRUZVQHT85qfKZYYkfr4jB34o8w
	7kqKzDJw64pyCQWWMNe6fmpQgS7rYxkVDryzeUzVjBxU4gCSOkbP/4XUkzWxfml//kI/
	0iCJjPWxnPrIAnCpvE8ynqDrKGUD60tofZz0Y9Mtc6ZL0q6DLGwcGFc5HU4mclYGrzhy
	KIrWWjyWA1siNm1hCNiTPCa6iZs7YQabbOP6wL5E/TusRg0GSRBIpYBIDG/+rrCuw54C
	0xWohQsGygASkEUGDjYpe8ghFlrWz+iLscvdX8GCPFiGnxcyPh98HDt0We5ZPdLaqHjC
	duNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e+j3b0sQmcO3Cl9uyrXtBH0Br1H6BfEk/m4i9uIvHx4=;
	b=T485UTn09duWvJPLv170sHPFWSK91YKtMXS0POtepvixFjBQyRfdr55zHB8PtTOz8D
	0wsopN83pU6xf9JZm4bzPcvAEt739G+YEwgxMUEsKikhw943crNI5fCcdbTwsYKBQiw2
	AzcDX8ESXmJ1+lrRfr/s2pBvmsIm8BBXx82JRA+k8T95HQlywpIPws/wt9VIF+xtHVji
	GAFeol9/T6P0HIT+r8gTBRv5R7jTBt19r0ieUIfa+9f4CWGE7+RVHpGjVtTGwAPB556Q
	g+HNgUumB2pf00Vnqi4p4KVGtmA0XfUJd3j8MXZKYsdlMOi6vUhfDzHhuON6yBEr1RAi
	usOw==
X-Gm-Message-State: APzg51Cdt6b+7I3T3/iY4WrtRkkdzI5bncggYI+la2MYknQSeHsX9IIG
	GaLPONToOw05YtVbynzqtT1N+JNx
X-Google-Smtp-Source: ANB0VdZ6raYacklBRyKpi/R3balEWKaFEIFMhccl3fNEfFW1yNKsYbvwOMSj0+gaF9QTiKUK94V/Lg==
X-Received: by 2002:a17:902:e109:: with SMTP id
	cc9-v6mr40647558plb.96.1536181360314; 
	Wed, 05 Sep 2018 14:02:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:21 -0700
Message-Id: <20180905210224.21225-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/12] liboauth: Fix build with openSSL 1.1.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2018 21:02:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../liboauth/0001-Support-OpenSSL-1.1.0.patch | 151 ++++++++++++++++++
 .../liboauth/liboauth_1.0.3.bb                |   4 +-
 2 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch

diff --git a/meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch b/meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch
new file mode 100644
index 0000000000..8691eae2b5
--- /dev/null
+++ b/meta-oe/recipes-support/liboauth/liboauth/0001-Support-OpenSSL-1.1.0.patch
@@ -0,0 +1,151 @@
+From c14d9bf71753a38df57cc6538b22ed389d2c2cb1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 4 Sep 2018 17:18:51 -0700
+Subject: [PATCH] Support OpenSSL 1.1.0
+
+Taken from https://github.com/x42/liboauth/issues/9
+
+Upstream-Status: Submitted[https://github.com/x42/liboauth/issues/9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/hash.c | 65 ++++++++++++++++++++++++++++++++++++------------------
+ 1 file changed, 44 insertions(+), 21 deletions(-)
+
+diff --git a/src/hash.c b/src/hash.c
+index 17ff5c8..e128826 100644
+--- a/src/hash.c
++++ b/src/hash.c
+@@ -362,6 +362,11 @@ looser:
+ #include "oauth.h" // base64 encode fn's.
+ #include <openssl/hmac.h>
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000
++#define EVP_MD_CTX_new EVP_MD_CTX_create
++#define EVP_MD_CTX_free EVP_MD_CTX_destroy
++#endif
++
+ char *oauth_sign_hmac_sha1 (const char *m, const char *k) {
+   return(oauth_sign_hmac_sha1_raw (m, strlen(m), k, strlen(k)));
+ }
+@@ -386,7 +391,7 @@ char *oauth_sign_rsa_sha1 (const char *m, const char *k) {
+   unsigned char *sig = NULL;
+   unsigned char *passphrase = NULL;
+   unsigned int len=0;
+-  EVP_MD_CTX md_ctx;
++  EVP_MD_CTX *md_ctx;
+ 
+   EVP_PKEY *pkey;
+   BIO *in;
+@@ -399,24 +404,31 @@ char *oauth_sign_rsa_sha1 (const char *m, const char *k) {
+     return xstrdup("liboauth/OpenSSL: can not read private key");
+   }
+ 
++	md_ctx = EVP_MD_CTX_new();
++	if (md_ctx == NULL) {
++		return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
++	}
++
+   len = EVP_PKEY_size(pkey);
+   sig = (unsigned char*)xmalloc((len+1)*sizeof(char));
+ 
+-  EVP_SignInit(&md_ctx, EVP_sha1());
+-  EVP_SignUpdate(&md_ctx, m, strlen(m));
+-  if (EVP_SignFinal (&md_ctx, sig, &len, pkey)) {
++	EVP_SignInit(md_ctx, EVP_sha1());
++	EVP_SignUpdate(md_ctx, m, strlen(m));
++	if (EVP_SignFinal (md_ctx, sig, &len, pkey)) {
+     char *tmp;
+     sig[len] = '\0';
+     tmp = oauth_encode_base64(len,sig);
+     OPENSSL_free(sig);
+     EVP_PKEY_free(pkey);
++    EVP_MD_CTX_free(md_ctx);
+     return tmp;
+   }
++  EVP_MD_CTX_free(md_ctx);
+   return xstrdup("liboauth/OpenSSL: rsa-sha1 signing failed");
+ }
+ 
+ int oauth_verify_rsa_sha1 (const char *m, const char *c, const char *s) {
+-  EVP_MD_CTX md_ctx;
++  EVP_MD_CTX *md_ctx;
+   EVP_PKEY *pkey;
+   BIO *in;
+   X509 *cert = NULL;
+@@ -437,13 +449,18 @@ int oauth_verify_rsa_sha1 (const char *m, const char *c, const char *s) {
+     return -2;
+   }
+ 
++	md_ctx = EVP_MD_CTX_new();
++	if (md_ctx == NULL) {
++		return -2;
++	}
++
+   b64d= (unsigned char*) xmalloc(sizeof(char)*strlen(s));
+   slen = oauth_decode_base64(b64d, s);
+ 
+-  EVP_VerifyInit(&md_ctx, EVP_sha1());
+-  EVP_VerifyUpdate(&md_ctx, m, strlen(m));
+-  err = EVP_VerifyFinal(&md_ctx, b64d, slen, pkey);
+-  EVP_MD_CTX_cleanup(&md_ctx);
++	EVP_VerifyInit(md_ctx, EVP_sha1());
++	EVP_VerifyUpdate(md_ctx, m, strlen(m));
++	err = EVP_VerifyFinal(md_ctx, b64d, slen, pkey);
++	EVP_MD_CTX_free(md_ctx);
+   EVP_PKEY_free(pkey);
+   xfree(b64d);
+   return (err);
+@@ -455,35 +472,41 @@ int oauth_verify_rsa_sha1 (const char *m, const char *c, const char *s) {
+  */
+ char *oauth_body_hash_file(char *filename) {
+   unsigned char fb[BUFSIZ];
+-  EVP_MD_CTX ctx;
++  EVP_MD_CTX *ctx;
+   size_t len=0;
+   unsigned char *md;
+   FILE *F= fopen(filename, "r");
+   if (!F) return NULL;
+ 
+-  EVP_MD_CTX_init(&ctx);
+-  EVP_DigestInit(&ctx,EVP_sha1());
++	ctx = EVP_MD_CTX_new();
++	if (ctx == NULL) {
++		return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
++	}
++	EVP_DigestInit(ctx,EVP_sha1());
+   while (!feof(F) && (len=fread(fb,sizeof(char),BUFSIZ, F))>0) {
+-    EVP_DigestUpdate(&ctx, fb, len);
++    EVP_DigestUpdate(ctx, fb, len);
+   }
+   fclose(F);
+   len=0;
+   md=(unsigned char*) xcalloc(EVP_MD_size(EVP_sha1()),sizeof(unsigned char));
+-  EVP_DigestFinal(&ctx, md,(unsigned int*) &len);
+-  EVP_MD_CTX_cleanup(&ctx);
++	EVP_DigestFinal(ctx, md,(unsigned int*) &len);
++	EVP_MD_CTX_free(ctx);
+   return oauth_body_hash_encode(len, md);
+ }
+ 
+ char *oauth_body_hash_data(size_t length, const char *data) {
+-  EVP_MD_CTX ctx;
++  EVP_MD_CTX *ctx;
+   size_t len=0;
+   unsigned char *md;
+   md=(unsigned char*) xcalloc(EVP_MD_size(EVP_sha1()),sizeof(unsigned char));
+-  EVP_MD_CTX_init(&ctx);
+-  EVP_DigestInit(&ctx,EVP_sha1());
+-  EVP_DigestUpdate(&ctx, data, length);
+-  EVP_DigestFinal(&ctx, md,(unsigned int*) &len);
+-  EVP_MD_CTX_cleanup(&ctx);
++	ctx = EVP_MD_CTX_new();
++	if (ctx == NULL) {
++		return xstrdup("liboauth/OpenSSL: failed to allocate EVP_MD_CTX");
++	}
++	EVP_DigestInit(ctx,EVP_sha1());
++	EVP_DigestUpdate(ctx, data, length);
++	EVP_DigestFinal(ctx, md,(unsigned int*) &len);
++	EVP_MD_CTX_free(ctx);
+   return oauth_body_hash_encode(len, md);
+ }
+ 
diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index 3311da5a8f..498764ac83 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=6266718a5241c045c8099d9be48817df \
 SECTION = "libs"
 DEPENDS = "curl openssl"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz \
+           file://0001-Support-OpenSSL-1.1.0.patch \
+           "
 SRC_URI[md5sum] = "689b46c2b3ab1a39735ac33f714c4f7f"
 SRC_URI[sha256sum] = "0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f"
 
-- 
2.18.0


