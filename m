Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CDFC88E56
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:55:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16611.1789257302853952023
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RU1aqqBb;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2244149a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257302; x=1789862102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqgrlRW2ik/xZWSZD8hCXRMhLp4py2p/gOs3RbpbB+s=;
        b=RU1aqqBbyxxZ5ZICiAYJaN2nOrQjX80VMIrfoRtS8F5qqIwXB6KwlaglkGnKSPxxf3
         cYkdRcOOAIVwsx7QDvdus7TY0tEUapHTRPdLT69jI1KTeDSHCgdyK5gE79z7sU3gBRPE
         6b8SEoIH3QV6qV93o9pdIGEivjjwyAX1HpJ+7zz0+dHNQkJYVEEYRloRBhmtfsr5GPD2
         KZ7odSpcsHXgvn8LJ6RZKGTuloc3Vt1TC4x4L05IDHZqiK3gQrSyMneYXM91knTTj5OX
         B5Xj8nQUj0rKq9Uju7YC+9yaMF2I77IIB6kpWb4o/SEmp6AQ0hS6+y9sS6wAWM555Kwa
         9YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257302; x=1789862102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sqgrlRW2ik/xZWSZD8hCXRMhLp4py2p/gOs3RbpbB+s=;
        b=pRvdA98iuqIUpwZl65Itqv6l8uLs/aEH7hRAw7m+1pjoiHMbtqFIp3Ilc3AjnO0JOE
         o8/oJ2Hkrnf36gsbk/71xYOk+FLbwG/TJgZJe3YPmC85uVhNYVebiyQRDvD23q9pqqTv
         Zwh5AnLPrv6SMHOsvsepv+1Lxd+IebA5kuveguPJSJQModda9J8kWgqY6eo3I147EI1g
         dTP6GpvFR4QulFhICG1e5mx9UCx3X5/aQLVv6Udcj4sy6ELOwv6t8znLmNXI61vUOcV7
         moa6rT8phfURZXIwcTtMlmILknh+RyUjv4A0b9a6u858QqjnFhDMQVZSmaVcPAYiRQK4
         JB9w==
X-Gm-Message-State: AFuF++kH5nFOblcbCiHm9qspCPU4HBwOL7KjB96P72/Jem7lba6QHrGV
	yv2UwmuMZdlzU77mUnStsME4tF+qum4ETTW549b76k/tZJmsh/QwZo36VTtMnw==
X-Gm-Gg: AYBFou23Bc5EGtYOT1Qik61O5ls8C7weArAHfFAxsfEhQNowYwVULTH+GvvphUUfDlR
	tXjuJIQy7UTw4T7Sj2ZDhH6ne0wCYV4Ia/bf2K6n3ht4UZwkcMIRm05hyBVNdCuhurJr4Kehwlo
	RB9PxZn3Vm97aoK/ex7f7rbLpj5eoccdu6XPLAQ84elObWpbBks/nJkbINSvWXVK76ieV7PTFPI
	vvpPGU4CBXlp9m0DEWvkGMpA0xdzDf0OsjhkaizuhI+BGsyHCtOzpNWnuCGaem8Dfrr5aIrvvJe
	Qlnj9JOxTX2uZxhtfdWRb+M1aLNLnxihDShvY3N3KrUQ5YaNuKy32PlwbISdXENdDkUToO8FlPq
	yyBxp+P3hhfZ4XeRT0Ej0sPZJSHq9N9kPsChSsBwwZ6LXuAAH0gbS2lLDhT/p3Iodluo2IXNPoL
	h0BL//RgjLu8ZOt+RmaBQdjI6JAuSXWW5iSFMepAo5H7qXs2FqRUxyiDPKtxzWRhywbI2eMABE1
	WNQdT0LXMPU+wMdKJEmA/GPTx8MPUsCFJ5gxi9fMgIsPhYl+3X86jJFfm/5Nbzjio3iyJVAmo1g
	CWJ+OWrtjQowqjWcdoVkIB2mznDtNOjFCNxh2o/Wsk8hSFS88VKecGDIvfKY5pwH7pIRJf/A1DT
	35rD6NCwppG74T2QEB8bxQTpN4vGkd1IMeV+IdeTbcaTBtqJTc/y/Kw8h4VlpETiypi8=
X-Received: by 2002:a17:90b:384f:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39d9c1c016bmr18889265a91.12.1789257302070;
        Sat, 12 Sep 2026 16:55:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm4524372eec.27.2026.09.12.16.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:55:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/6] mariadb: fix AES CBC/CTR/GCM with OpenSSL 4.0
Date: Sat, 12 Sep 2026 16:54:54 -0700
Message-ID: <20260912235456.2358617-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
References: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129989

The aes and mf_iocache unit tests (mariadb-ptest) fail with OpenSSL 4.0
for every AES mode that uses an IV, while ECB keeps working.

MyCTX in mysys_ssl/my_crypt.cc keeps the EVP_CIPHER_CTX in a stack
buffer and initializes it with memset() + EVP_CIPHER_CTX_reset().
OpenSSL 3.x reset() ended in its legacy path with ctx->iv_len = -1, but
OpenSSL 4.0 removed that path and returns early when no cipher is set,
leaving iv_len at 0. EVP_CipherInit_ex() then hands IV length 0 to the
provider, which fails with "ossl_cipher_generic_initiv: invalid iv
length", so AES_ENCRYPT(), encrypted temporary files etc. break.

Backport the proposed upstream fix, which allocates the context with
EVP_CIPHER_CTX_new()/EVP_CIPHER_CTX_free() and drops the stack buffer
hack together with check_openssl_compatibility().

Upstream: https://jira.mariadb.org/browse/MDEV-40287
          https://github.com/MariaDB/server/pull/5652

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   1 +
 ...NCRYPT-and-KDF-return-NULL-with-Open.patch | 290 ++++++++++++++++++
 2 files changed, 291 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index c10b0ac9a5..1cf90c8f93 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -26,6 +26,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
            file://c21bb11be28ae9b2432b2a661bf38a197cf9514d.patch \
+           file://0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch \
           "
 SRC_URI[sha256sum] = "5ab7883db519bfcebfdd2aac09bc5544a12ce328f39edd46d0bf01690615ef6c"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch
new file mode 100644
index 0000000000..af9c596962
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch
@@ -0,0 +1,290 @@
+From c66dc27030154edf175e049473159c789abb9a43 Mon Sep 17 00:00:00 2001
+From: Vladislav Vaintroub <vvaintroub@gmail.com>
+Date: Wed, 9 Sep 2026 01:44:02 +0200
+Subject: [PATCH] MDEV-40287 AES_ENCRYPT() and KDF() return NULL with OpenSSL
+ 4.0
+
+MyCTX used an EVP_CIPHER_CTX in a stack buffer instead of allocating it
+with EVP_CIPHER_CTX_new(). OpenSSL 4.0 rejects a context that was not
+created that way for ciphers that use an IV: EVP_CipherInit_ex() fails
+with "invalid iv length", so AES_ENCRYPT() and KDF() in CBC/CTR/GCM
+modes return NULL. ECB has no IV and still works, which is why only the
+non-ECB modes broke.
+
+Fix:
+Allocate the context with EVP_CIPHER_CTX_new()/EVP_CIPHER_CTX_free().
+Also remove check_openssl_compatibility() and the EVP_CIPHER_CTX_SIZE
+and EVP_CIPHER_CTX_init macros.
+
+Verified against OpenSSL 4.0.1: the mysys aes-t test fails on the
+CBC/CTR/GCM cases with the stack buffer and passes with
+EVP_CIPHER_CTX_new().
+
+No visible performance degradation: the extra allocation costs
+~12 ns/call (WolfSSL) and ~30 ns (OpenSSL) on Windows at a 30-byte
+payload, nothing at 16 KB, and nothing on Linux/glibc; sysbench OLTP
+over encrypted tables and redo log is unchanged.
+
+Assisted-by: Claude:claude-opus-4-8
+
+[Squashed with the "fixup!" commit 36c6e66b29bb from the same PR, which
+destroys the context in my_aes_crypt_init() when init() fails so the
+heap allocated EVP_CIPHER_CTX is not leaked. Rebased to 11.4.12.]
+
+Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/5652]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff -urN a/include/ssl_compat.h b/include/ssl_compat.h
+--- a/include/ssl_compat.h
++++ b/include/ssl_compat.h
+@@ -24,12 +24,9 @@
+ #define HAVE_OPENSSL11 1
+ #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
+ #define ERR_remove_state(X) ERR_clear_error()
+-#define EVP_CIPHER_CTX_SIZE 200
+ #define EVP_MD_CTX_SIZE 80
+ #undef EVP_MD_CTX_init
+ #define EVP_MD_CTX_init(X) do { memset((X), 0, EVP_MD_CTX_SIZE); EVP_MD_CTX_reset(X); } while(0)
+-#undef EVP_CIPHER_CTX_init
+-#define EVP_CIPHER_CTX_init(X) do { memset((X), 0, EVP_CIPHER_CTX_SIZE); EVP_CIPHER_CTX_reset(X); } while(0)
+ 
+ /*
+   Macros below are deprecated. OpenSSL 1.1 may define them or not,
+@@ -83,7 +80,6 @@
+ #endif
+ 
+ #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
+-#define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
+ 
+ #ifndef HAVE_WOLFSSL
+ #define OPENSSL_init_ssl(X,Y)           SSL_library_init()
+@@ -97,13 +93,3 @@
+ #ifndef TLS1_3_VERSION
+ #define SSL_CTX_set_ciphersuites(X,Y) 0
+ #endif
+-
+-#ifdef	__cplusplus
+-extern "C" {
+-#endif /* __cplusplus */
+-
+-int check_openssl_compatibility();
+-
+-#ifdef	__cplusplus
+-}
+-#endif
+diff -urN a/mysys_ssl/CMakeLists.txt b/mysys_ssl/CMakeLists.txt
+--- a/mysys_ssl/CMakeLists.txt
++++ b/mysys_ssl/CMakeLists.txt
+@@ -28,7 +28,6 @@
+     my_sha384.cc
+     my_sha512.cc
+     my_md5.cc
+-    openssl.c
+    )
+ 
+ SET(MYSYS_SSL_SOURCES
+diff -urN a/mysys_ssl/my_crypt.cc b/mysys_ssl/my_crypt.cc
+--- a/mysys_ssl/my_crypt.cc
++++ b/mysys_ssl/my_crypt.cc
+@@ -27,29 +27,18 @@
+ 
+ #include <my_crypt.h>
+ #include <ssl_compat.h>
+-#include <cstdint>
+-
+-#define CTX_ALIGN 16
+ 
+ class MyCTX
+ {
+ public:
+-  char ctx_buf[EVP_CIPHER_CTX_SIZE + CTX_ALIGN];
+   EVP_CIPHER_CTX* ctx;
+   MyCTX()
+   {
+-#if CTX_ALIGN > 0
+-    uintptr_t p= ((uintptr_t)ctx_buf + (CTX_ALIGN - 1)) & ~(CTX_ALIGN - 1);
+-    ctx = reinterpret_cast<EVP_CIPHER_CTX*>(p);
+-#else
+-    ctx = (EVP_CIPHER_CTX*)ctx_buf;
+-#endif
+-
+-    EVP_CIPHER_CTX_init(ctx);
++    ctx= EVP_CIPHER_CTX_new();
+   }
+   virtual ~MyCTX()
+   {
+-    EVP_CIPHER_CTX_reset(ctx);
++    EVP_CIPHER_CTX_free(ctx);
+     ERR_remove_state(0);
+   }
+ 
+@@ -57,6 +46,8 @@
+                    uint klen, const uchar *iv, uint ivlen)
+   {
+     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX));
++    if (unlikely(!ctx))
++      return MY_AES_OPENSSL_ERROR;
+     if (unlikely(!cipher))
+       return MY_AES_BAD_KEYSIZE;
+ 
+@@ -115,9 +106,11 @@
+     DBUG_ASSERT(ivlen == 0 || ivlen == sizeof(oiv));
+ 
+     int res= MyCTX::init(cipher, encrypt, key, klen, iv, ivlen);
++    if (res)
++      return res;
+ 
+     EVP_CIPHER_CTX_set_padding(ctx, 0);
+-    return res;
++    return MY_AES_OK;
+   }
+ 
+   /** Update last partial source block, stored in source_tail array. */
+@@ -213,10 +206,12 @@
+   {
+     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX_gcm));
+     int res= MyCTX::init(cipher, encrypt, key, klen, iv, ivlen);
++    if (res)
++      return res;
+     int real_ivlen= EVP_CIPHER_CTX_iv_length(ctx);
+     aad= iv + real_ivlen;
+     aadlen= ivlen - real_ivlen;
+-    return res;
++    return MY_AES_OK;
+   }
+ 
+   int update(const uchar *src, uint slen, uchar *dst, uint *dlen) override
+@@ -298,8 +293,11 @@
+     new (ctx) MyCTX_nopad();
+   else
+     new (ctx) MyCTX();
+-  return ((MyCTX*)ctx)->init(ciphers[mode](klen), flags & 1,
+-                             key, klen, iv, ivlen);
++  int res= ((MyCTX*)ctx)->init(ciphers[mode](klen), flags & 1,
++                               key, klen, iv, ivlen);
++  if (res)
++    ((MyCTX*)ctx)->~MyCTX();
++  return res;
+ }
+ 
+ int my_aes_crypt_update(void *ctx, const uchar *src, uint slen,
+diff -urN a/mysys_ssl/openssl.c b/mysys_ssl/openssl.c
+--- a/mysys_ssl/openssl.c
++++ /dev/null
+@@ -1,98 +0,0 @@
+-/*
+- Copyright (c) 2017, MariaDB Corporation.
+-
+- This program is free software; you can redistribute it and/or modify
+- it under the terms of the GNU General Public License as published by
+- the Free Software Foundation; version 2 of the License.
+-
+- This program is distributed in the hope that it will be useful,
+- but WITHOUT ANY WARRANTY; without even the implied warranty of
+- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+- GNU General Public License for more details.
+-
+- You should have received a copy of the GNU General Public License
+- along with this program; if not, write to the Free Software
+- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA */
+-
+-#include <my_global.h>
+-#include <openssl/evp.h>
+-#include <ssl_compat.h>
+-
+-/*
+-  The check is only done for OpenSSL 1.1.x.
+-  It could run for OpenSSL 1.0.x but it doesn't make much sense
+-  and it hits this bug:
+-  https://bugs.launchpad.net/ubuntu/+source/openssl/+bug/1594748
+-*/
+-
+-#ifndef HAVE_OPENSSL11
+-int check_openssl_compatibility()
+-{
+-  return 0;
+-}
+-#else
+-#include <openssl/evp.h>
+-
+-static uint testing;
+-static size_t alloc_size, alloc_count;
+-
+-static void *coc_malloc(size_t size
+-#ifndef LIBRESSL_VERSION_NUMBER
+-                        , const char *f __attribute__((unused)),
+-                        int l __attribute__((unused))
+-#endif
+-)
+-{
+-  if (unlikely(testing))
+-  {
+-    alloc_size+= size;
+-    alloc_count++;
+-  }
+-  return malloc(size);
+-}
+-
+-static void *coc_realloc(void *addr, size_t num
+-#ifndef LIBRESSL_VERSION_NUMBER
+-                         , const char *file __attribute__((unused)),
+-                         int line __attribute__((unused))
+-#endif
+-)
+-{
+-  return realloc(addr, num);
+-}
+-
+-static void coc_free(void *addr
+-#ifndef LIBRESSL_VERSION_NUMBER
+-                     , const char *file __attribute__((unused)),
+-                     int line __attribute__((unused))
+-#endif
+-)
+-{
+-  free(addr);
+-}
+-
+-int check_openssl_compatibility()
+-{
+-  EVP_CIPHER_CTX *evp_ctx;
+-  EVP_MD_CTX     *md5_ctx;
+-
+-  if (!CRYPTO_set_mem_functions(coc_malloc, coc_realloc, coc_free))
+-    return 0;
+-
+-  testing= 1;
+-  alloc_size= alloc_count= 0;
+-  evp_ctx= EVP_CIPHER_CTX_new();
+-  EVP_CIPHER_CTX_free(evp_ctx);
+-  if (alloc_count != 1 || !alloc_size || alloc_size > EVP_CIPHER_CTX_SIZE)
+-    return 1;
+-
+-  alloc_size= alloc_count= 0;
+-  md5_ctx= EVP_MD_CTX_new();
+-  EVP_MD_CTX_free(md5_ctx);
+-  if (alloc_count != 1 || !alloc_size || alloc_size > EVP_MD_CTX_SIZE)
+-    return 1;
+-
+-  testing= 0;
+-  return 0;
+-}
+-#endif
+diff -urN a/sql/mysqld.cc b/sql/mysqld.cc
+--- a/sql/mysqld.cc
++++ b/sql/mysqld.cc
+@@ -3948,14 +3948,6 @@
+     exit(1);
+   }
+ 
+-#ifdef HAVE_OPENSSL
+-  if (check_openssl_compatibility())
+-  {
+-    sql_print_error("Incompatible OpenSSL version. Cannot continue...");
+-    exit(1);
+-  }
+-#endif
+-
+   if (init_thread_environment() || mysql_init_variables())
+     exit(1);
+ 

