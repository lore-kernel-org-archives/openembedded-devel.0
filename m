Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37935.1795594096472167972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d45QokKU;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38692f62b22so6065653eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594096; x=1796198896; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WenEHrxdpwhZEPRvWs73ZTl+pz2YIHcvIc3GOkxlVHw=;
        b=d45QokKUZZ5VC2DVPPkC4tFwOA3rhzZ8cYFc847m3vMhqWJtkHbEtDa4hQUcgKC134
         gwWfWNGMLHe4EVh18KV3lJ+LPwGogi6T7dnIaGqyuXQyn59TY4mEyJVa2V6WjZidcEqW
         WS1qWpeasHow5GGzAC/eX/ai0GYCRRT7m8uLZJBTdQbOcxIsotoMEs4iIE/X1wIprByB
         Uw2uQq8gjgJGyArh3PQ8TGFsWb1BxyP8cQU5VA2Bg071gfWxvyj7dhiFeHpZDCzvrhZh
         Vq5crS6diWGTSXtNWQbix2QvKgW1waLjRItdInapJ6SuBtZVxb4mE1syaGe6qIsDxmzn
         I+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594096; x=1796198896;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WenEHrxdpwhZEPRvWs73ZTl+pz2YIHcvIc3GOkxlVHw=;
        b=1wjmfN1KDDmUjHcpjBI22QYyUadyKE7hMbVO4oyXbLZ72Mwf7PCubkjO6NBbtXrVv4
         +0Li7NS/Dh/W5JHE/1isnB2FZ9Ehidix2H0Yv2o0eFrKnpQpggSGWpxcxNar7VhzPHLc
         SyGZ9qZUkeS0bYfkcqKwjHr84V/k1oL4yNZyHRqdoGMcl+KOc0WOgJYkFqGHeSQCt4OH
         mtZW2OxBDbm9jZKXTgYyARoDTOzxyGa2IfhaI3Ujvjje0XxyI1NkclDZsrEWB0xpcGJV
         3C/ueEYQrt7/KU3j1BlKMLG2L4gZRSWTu5tEuHOm6rXtF8qN6AB7TV4UBW+TMsWy6fpC
         sr8Q==
X-Gm-Message-State: APuU4Z95z/wvoJ+Y3WRRmXFVBVCL5zeBJqTDDPr6i9SnI8NWUMCG2NlQ
	hDKGDYQwoefr+6FqUQ3rTof06GhU/neoHtV1RiC0kkwCTBQXUG9sCHsjEh3XV4MB
X-Gm-Gg: AZFdTZfFyMuq5MeOQs2PhWLsgoA8iRQEJD5vcDJ0jlYtpn4qbsleumAe18Pe8I8TpNk
	Hjyxfmo481EEGy7JiMO7TCYr7wEriYe1hKCL9TzSA9AFpGZXie5yfuWXn20Dto6Oxl3jzrcOwYI
	LNWu7cdS9CBsQbIUCI9ah4QApjxBSgfKvZQ0ove207AREhfCDQ+3vR6zuRo65+2w/Or8JjHvuFq
	F6nv715hgmprMMANxoLWiXpw3MkUG1ubZ+Ha5XsfrKYkzCc75sLXhpXFe23pAJZkBMUZI6Bg450
	Q8D6ZJuoeB/mOeR8gEIq+ygayUdao4WSd2c5RiINvnMjom0nFjqrS4ftWa1/uEZiMH6F91CwjVF
	aG/mI6lzgSqSGE0aiXFjUZOmFd9tnDdxJn1JulIwgHmk+HHlCjVuzmRTEKK8jGEETHZlVj/fBPP
	FwfK7mLgTvj9/cG0G1zOsYeea/qbpi9AbpjzGsWm3bScFfkTuVFi41CbPciKxDgjU6BeFbLFz9Y
	IImOCftkSTDk4FsunpWfeocGkFkA+RkSO9EUmCIkaGGqGvb+9026DLAKvG78RMac2AA+ruiMJFK
	2aAkhcbnunogLvdvgxTqmjQjv7Phs2//npCcfRpZnlvmrdIxNOfbbSS4Pr5x/v7FngrPRy11riQ
	ETtXhxf9CWpPPfOYvfDsWEQSRo3oWjSShRmJvQue/cMu++LwIIqWd0GSOGTq/F3nL5TogDXIznE
	IV05H2sO493sdgjWrVaGnPiP+cay+atMMGLXWEMi6eoU9DeKGFrkELAc8JSZOeg5olxBSh61NJM
	oDYBCMlmNe2SNiqdf+Rvqs06gNK/YJ3iCt5SFPMct8VQs+Yn/DLDr9qGM1pTYQXRcTSHl6cxjKH
	8a3i
X-Received: by 2002:a05:693c:80c2:b0:35d:4185:5395 with SMTP id 5a478bee46e88-3856eb492ccmr18726572eec.16.1795594095604;
        Wed, 25 Nov 2026 00:08:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 26/55] mariadb: upgrade 11.4.13 -> 12.3.4
Date: Wed, 25 Nov 2026 00:06:42 -0800
Message-ID: <20261125080732.2419614-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133029
Content-Type: text/plain; charset="utf-8"

12.3 is the newest long-term support series (11.4 -> 11.8 -> 12.3).
- optimizer hints (join order, index, subquery, MAX_EXECUTION_TIME),
  SYS_REFCURSOR, triggers on multiple events, faster binary logging
- new reserved words CONVERSION and TO_DATE
- removed system variables big_tables, large_page_size and
  storage_engine; the server no longer depends on the Galera package
- the bundled Connector/C stays at 3.4 (libmariadb.so.3)
- 12.3.4 fixes CVE-2026-101802, CVE-2026-101796, CVE-2026-101794,
  CVE-2026-101775, CVE-2026-101747 and more (13 CVEs); 12.3.3
  fixed further CVEs, among them CVE-2026-92262 and CVE-2026-85748

Drop 0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch,
it is part of this release. Rebase
support-files-CMakeLists.txt-fix-do_populate_sysroot.patch and
0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch, refresh the
other patches to drop line offsets. Package the new
mariadb-plugin cmake files in libmysqlclient-dev, next to the server
headers. Point the upstream check at archive.mariadb.org and limit it
to the 12.3 LTS series instead of the GitHub tags page, which also
lists the short-term releases.

12.3 no longer installs server/private/config.h, so drop it from
oe_multilib_header.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ve_11.4.13.bb => mariadb-native_12.3.4.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  10 +-
 ...NCRYPT-and-KDF-return-NULL-with-Open.patch | 290 ------------------
 ...ck-if-syscall-exists-before-using-it.patch |   9 +-
 ...fine-__NR_futex-if-it-does-not-exist.patch |   4 +-
 ...Lists.txt-fix-gen_lex_hash-not-found.patch |   6 +-
 ...CMakeLists.txt-fix-reproducible-buil.patch |   3 -
 .../0001-support-reproducible-builds.patch    |   7 +-
 .../configure.cmake-fix-valgrind.patch        |   4 +-
 .../mysql/mariadb/cross-compiling.patch       |   4 +-
 .../mysql/mariadb/fix-arm-atomic.patch        |   4 +-
 .../recipes-dbs/mysql/mariadb/riscv32.patch   |   2 +-
 ...akeLists.txt-fix-do_populate_sysroot.patch |   5 +-
 .../recipes-dbs/mysql/mariadb/sys_futex.patch |   2 +-
 .../{mariadb_11.4.13.bb => mariadb_12.3.4.bb} |   0
 15 files changed, 27 insertions(+), 323 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.13.bb => mariadb-native_12.3.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.13.bb => mariadb_12.3.4.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.13.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_12.3.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.13.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_12.3.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 434d176774..08cf5d9eb5 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,11 +25,12 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://riscv32.patch \
            file://0001-support-reproducible-builds.patch \
            file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
-           file://0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch \
           "
-SRC_URI[sha256sum] = "1bb254b106d0a7ca871cfa18fa6e18d4b80a7430f9ec9d1571ec4271a13def96"
+SRC_URI[sha256sum] = "75aae4d48df905734e24a85b955bbcdc43f4b122b450bc4ad2bc92f5d1ac578d"
 
-UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
+UPSTREAM_CHECK_URI = "https://archive.mariadb.org/"
+# 12.3 is the current long-term support series
+UPSTREAM_CHECK_REGEX = "mariadb-(?P<pver>12\.3\.\d+)/"
 
 BINCONFIG_GLOB = "mysql_config"
 
@@ -168,7 +169,7 @@ mariadb_sysroot_preprocess () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h mysql/server/private/config.h
+    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h
 
     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${UNPACKDIR}/my.cnf ${D}/${sysconfdir}/
@@ -248,6 +249,7 @@ FILES:libmysqlclient-dev = " \
     ${libdir}/libmysqlclient.so \
     ${libdir}/libmariadb.so \
     ${sysconfdir}/aclocal \
+    ${datadir}/cmake/mariadb-plugin \
     ${bindir}/mysql_config"
 FILES:libmysqlclient-staticdev = "\
     ${libdir}/*.a"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch
deleted file mode 100644
index af9c596962..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-40287-AES_ENCRYPT-and-KDF-return-NULL-with-Open.patch
+++ /dev/null
@@ -1,290 +0,0 @@
-From c66dc27030154edf175e049473159c789abb9a43 Mon Sep 17 00:00:00 2001
-From: Vladislav Vaintroub <vvaintroub@gmail.com>
-Date: Wed, 9 Sep 2026 01:44:02 +0200
-Subject: [PATCH] MDEV-40287 AES_ENCRYPT() and KDF() return NULL with OpenSSL
- 4.0
-
-MyCTX used an EVP_CIPHER_CTX in a stack buffer instead of allocating it
-with EVP_CIPHER_CTX_new(). OpenSSL 4.0 rejects a context that was not
-created that way for ciphers that use an IV: EVP_CipherInit_ex() fails
-with "invalid iv length", so AES_ENCRYPT() and KDF() in CBC/CTR/GCM
-modes return NULL. ECB has no IV and still works, which is why only the
-non-ECB modes broke.
-
-Fix:
-Allocate the context with EVP_CIPHER_CTX_new()/EVP_CIPHER_CTX_free().
-Also remove check_openssl_compatibility() and the EVP_CIPHER_CTX_SIZE
-and EVP_CIPHER_CTX_init macros.
-
-Verified against OpenSSL 4.0.1: the mysys aes-t test fails on the
-CBC/CTR/GCM cases with the stack buffer and passes with
-EVP_CIPHER_CTX_new().
-
-No visible performance degradation: the extra allocation costs
-~12 ns/call (WolfSSL) and ~30 ns (OpenSSL) on Windows at a 30-byte
-payload, nothing at 16 KB, and nothing on Linux/glibc; sysbench OLTP
-over encrypted tables and redo log is unchanged.
-
-Assisted-by: Claude:claude-opus-4-8
-
-[Squashed with the "fixup!" commit 36c6e66b29bb from the same PR, which
-destroys the context in my_aes_crypt_init() when init() fails so the
-heap allocated EVP_CIPHER_CTX is not leaked. Rebased to 11.4.12.]
-
-Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/5652]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
-diff -urN a/include/ssl_compat.h b/include/ssl_compat.h
---- a/include/ssl_compat.h
-+++ b/include/ssl_compat.h
-@@ -24,12 +24,9 @@
- #define HAVE_OPENSSL11 1
- #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
- #define ERR_remove_state(X) ERR_clear_error()
--#define EVP_CIPHER_CTX_SIZE 200
- #define EVP_MD_CTX_SIZE 80
- #undef EVP_MD_CTX_init
- #define EVP_MD_CTX_init(X) do { memset((X), 0, EVP_MD_CTX_SIZE); EVP_MD_CTX_reset(X); } while(0)
--#undef EVP_CIPHER_CTX_init
--#define EVP_CIPHER_CTX_init(X) do { memset((X), 0, EVP_CIPHER_CTX_SIZE); EVP_CIPHER_CTX_reset(X); } while(0)
- 
- /*
-   Macros below are deprecated. OpenSSL 1.1 may define them or not,
-@@ -83,7 +80,6 @@
- #endif
- 
- #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
--#define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
- 
- #ifndef HAVE_WOLFSSL
- #define OPENSSL_init_ssl(X,Y)           SSL_library_init()
-@@ -97,13 +93,3 @@
- #ifndef TLS1_3_VERSION
- #define SSL_CTX_set_ciphersuites(X,Y) 0
- #endif
--
--#ifdef	__cplusplus
--extern "C" {
--#endif /* __cplusplus */
--
--int check_openssl_compatibility();
--
--#ifdef	__cplusplus
--}
--#endif
-diff -urN a/mysys_ssl/CMakeLists.txt b/mysys_ssl/CMakeLists.txt
---- a/mysys_ssl/CMakeLists.txt
-+++ b/mysys_ssl/CMakeLists.txt
-@@ -28,7 +28,6 @@
-     my_sha384.cc
-     my_sha512.cc
-     my_md5.cc
--    openssl.c
-    )
- 
- SET(MYSYS_SSL_SOURCES
-diff -urN a/mysys_ssl/my_crypt.cc b/mysys_ssl/my_crypt.cc
---- a/mysys_ssl/my_crypt.cc
-+++ b/mysys_ssl/my_crypt.cc
-@@ -27,29 +27,18 @@
- 
- #include <my_crypt.h>
- #include <ssl_compat.h>
--#include <cstdint>
--
--#define CTX_ALIGN 16
- 
- class MyCTX
- {
- public:
--  char ctx_buf[EVP_CIPHER_CTX_SIZE + CTX_ALIGN];
-   EVP_CIPHER_CTX* ctx;
-   MyCTX()
-   {
--#if CTX_ALIGN > 0
--    uintptr_t p= ((uintptr_t)ctx_buf + (CTX_ALIGN - 1)) & ~(CTX_ALIGN - 1);
--    ctx = reinterpret_cast<EVP_CIPHER_CTX*>(p);
--#else
--    ctx = (EVP_CIPHER_CTX*)ctx_buf;
--#endif
--
--    EVP_CIPHER_CTX_init(ctx);
-+    ctx= EVP_CIPHER_CTX_new();
-   }
-   virtual ~MyCTX()
-   {
--    EVP_CIPHER_CTX_reset(ctx);
-+    EVP_CIPHER_CTX_free(ctx);
-     ERR_remove_state(0);
-   }
- 
-@@ -57,6 +46,8 @@
-                    uint klen, const uchar *iv, uint ivlen)
-   {
-     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX));
-+    if (unlikely(!ctx))
-+      return MY_AES_OPENSSL_ERROR;
-     if (unlikely(!cipher))
-       return MY_AES_BAD_KEYSIZE;
- 
-@@ -115,9 +106,11 @@
-     DBUG_ASSERT(ivlen == 0 || ivlen == sizeof(oiv));
- 
-     int res= MyCTX::init(cipher, encrypt, key, klen, iv, ivlen);
-+    if (res)
-+      return res;
- 
-     EVP_CIPHER_CTX_set_padding(ctx, 0);
--    return res;
-+    return MY_AES_OK;
-   }
- 
-   /** Update last partial source block, stored in source_tail array. */
-@@ -213,10 +206,12 @@
-   {
-     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX_gcm));
-     int res= MyCTX::init(cipher, encrypt, key, klen, iv, ivlen);
-+    if (res)
-+      return res;
-     int real_ivlen= EVP_CIPHER_CTX_iv_length(ctx);
-     aad= iv + real_ivlen;
-     aadlen= ivlen - real_ivlen;
--    return res;
-+    return MY_AES_OK;
-   }
- 
-   int update(const uchar *src, uint slen, uchar *dst, uint *dlen) override
-@@ -298,8 +293,11 @@
-     new (ctx) MyCTX_nopad();
-   else
-     new (ctx) MyCTX();
--  return ((MyCTX*)ctx)->init(ciphers[mode](klen), flags & 1,
--                             key, klen, iv, ivlen);
-+  int res= ((MyCTX*)ctx)->init(ciphers[mode](klen), flags & 1,
-+                               key, klen, iv, ivlen);
-+  if (res)
-+    ((MyCTX*)ctx)->~MyCTX();
-+  return res;
- }
- 
- int my_aes_crypt_update(void *ctx, const uchar *src, uint slen,
-diff -urN a/mysys_ssl/openssl.c b/mysys_ssl/openssl.c
---- a/mysys_ssl/openssl.c
-+++ /dev/null
-@@ -1,98 +0,0 @@
--/*
-- Copyright (c) 2017, MariaDB Corporation.
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; version 2 of the License.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA */
--
--#include <my_global.h>
--#include <openssl/evp.h>
--#include <ssl_compat.h>
--
--/*
--  The check is only done for OpenSSL 1.1.x.
--  It could run for OpenSSL 1.0.x but it doesn't make much sense
--  and it hits this bug:
--  https://bugs.launchpad.net/ubuntu/+source/openssl/+bug/1594748
--*/
--
--#ifndef HAVE_OPENSSL11
--int check_openssl_compatibility()
--{
--  return 0;
--}
--#else
--#include <openssl/evp.h>
--
--static uint testing;
--static size_t alloc_size, alloc_count;
--
--static void *coc_malloc(size_t size
--#ifndef LIBRESSL_VERSION_NUMBER
--                        , const char *f __attribute__((unused)),
--                        int l __attribute__((unused))
--#endif
--)
--{
--  if (unlikely(testing))
--  {
--    alloc_size+= size;
--    alloc_count++;
--  }
--  return malloc(size);
--}
--
--static void *coc_realloc(void *addr, size_t num
--#ifndef LIBRESSL_VERSION_NUMBER
--                         , const char *file __attribute__((unused)),
--                         int line __attribute__((unused))
--#endif
--)
--{
--  return realloc(addr, num);
--}
--
--static void coc_free(void *addr
--#ifndef LIBRESSL_VERSION_NUMBER
--                     , const char *file __attribute__((unused)),
--                     int line __attribute__((unused))
--#endif
--)
--{
--  free(addr);
--}
--
--int check_openssl_compatibility()
--{
--  EVP_CIPHER_CTX *evp_ctx;
--  EVP_MD_CTX     *md5_ctx;
--
--  if (!CRYPTO_set_mem_functions(coc_malloc, coc_realloc, coc_free))
--    return 0;
--
--  testing= 1;
--  alloc_size= alloc_count= 0;
--  evp_ctx= EVP_CIPHER_CTX_new();
--  EVP_CIPHER_CTX_free(evp_ctx);
--  if (alloc_count != 1 || !alloc_size || alloc_size > EVP_CIPHER_CTX_SIZE)
--    return 1;
--
--  alloc_size= alloc_count= 0;
--  md5_ctx= EVP_MD_CTX_new();
--  EVP_MD_CTX_free(md5_ctx);
--  if (alloc_count != 1 || !alloc_size || alloc_size > EVP_MD_CTX_SIZE)
--    return 1;
--
--  testing= 0;
--  return 0;
--}
--#endif
-diff -urN a/sql/mysqld.cc b/sql/mysqld.cc
---- a/sql/mysqld.cc
-+++ b/sql/mysqld.cc
-@@ -3948,14 +3948,6 @@
-     exit(1);
-   }
- 
--#ifdef HAVE_OPENSSL
--  if (check_openssl_compatibility())
--  {
--    sql_print_error("Incompatible OpenSSL version. Cannot continue...");
--    exit(1);
--  }
--#endif
--
-   if (init_thread_environment() || mysql_init_variables())
-     exit(1);
- 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch
index ee0d1b37ae..6575c0ab6a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_libaio-Check-if-syscall-exists-before-using-it.patch
@@ -23,10 +23,10 @@ Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/tpool/aio_libaio.cc b/tpool/aio_libaio.cc
-index 2ce69384cde..60f558afa87 100644
+index a4df1fe9..e6522de3 100644
 --- a/tpool/aio_libaio.cc
 +++ b/tpool/aio_libaio.cc
-@@ -58,6 +58,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
+@@ -60,6 +60,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
  static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
    noexcept
  {
@@ -34,7 +34,7 @@ index 2ce69384cde..60f558afa87 100644
    int saved_errno= errno;
    int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
                     min_nr, nr, ev, 0);
-@@ -67,6 +68,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+@@ -69,6 +70,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
      errno= saved_errno;
    }
    return ret;
@@ -44,6 +44,3 @@ index 2ce69384cde..60f558afa87 100644
  }
  
  
--- 
-2.51.0
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
index bfcd45b64b..0aed6d80f3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/storage/innobase/log/log0sync.cc b/storage/innobase/log/log0sync.cc
-index 0de283ca..265ab691 100644
+index 7eb0eb83..a6fdabe8 100644
 --- a/storage/innobase/log/log0sync.cc
 +++ b/storage/innobase/log/log0sync.cc
 @@ -66,6 +66,9 @@ Note that if write operation is very fast, a) or b) can be fine as alternative.
@@ -31,4 +31,4 @@ index 0de283ca..265ab691 100644
 +#endif
  #endif
  
- #include <atomic>
+ #include <algorithm>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
index 7c73699b08..caf3ec963c 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -15,10 +15,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 22 insertions(+), 8 deletions(-)
 
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 0195555e..507136cb 100644
+index f570e8b6..1463ffd5 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -63,11 +63,18 @@
+@@ -63,11 +63,18 @@ ${SSL_INCLUDE_DIRS}
  ${CMAKE_BINARY_DIR}/sql
  )
  
@@ -41,7 +41,7 @@ index 0195555e..507136cb 100644
  
  FIND_PACKAGE(BISON 2.4)
  
-@@ -405,11 +412,18 @@
+@@ -441,11 +448,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch
index c34ec92415..36971afa62 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch
@@ -35,6 +35,3 @@ index 1538b6cc..cdccb2c5 100644
  
  set(MRN_ALL_SOURCES
    ${MRN_SOURCES}
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch
index 10e6f03df6..bb4494884d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-support-reproducible-builds.patch
@@ -17,10 +17,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 3a7c9d36..ac868072 100644
+index 1463ffd5..bd66a081 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -400,10 +400,10 @@ ELSE()
+@@ -435,10 +435,10 @@ ELSE()
    CONFIGURE_FILE(myskel.m4.in myskel.m4)
    BISON_TARGET(gen_mariadb_cc_hh ${CMAKE_CURRENT_BINARY_DIR}/yy_mariadb.yy
                                   ${CMAKE_CURRENT_BINARY_DIR}/yy_mariadb.cc
@@ -33,6 +33,3 @@ index 3a7c9d36..ac868072 100644
  ENDIF()
  
  IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
index 2841a59a73..3e9a5fd3ee 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
@@ -21,10 +21,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/configure.cmake b/configure.cmake
-index 61f30a75..3e730082 100644
+index c8d7396..cf6d20e 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -881,10 +881,9 @@ ENDIF()
+@@ -902,10 +902,9 @@ ENDIF()
  
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
index dc34c07d31..1db7b9a5ec 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
@@ -14,10 +14,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3828420c..ee38615a 100644
+index 810c9c27..2978974d 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -428,11 +428,6 @@ CHECK_LIBFMT()
+@@ -460,11 +460,6 @@ CHECK_LIBFMT()
  ADD_SUBDIRECTORY(tpool)
  CHECK_SYSTEMD()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
index 39b7fad983..bfedecd441 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
@@ -16,10 +16,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
-index e89dbfc0..acc6b48e 100644
+index 7f8f1b7..68656c8 100644
 --- a/storage/rocksdb/build_rocksdb.cmake
 +++ b/storage/rocksdb/build_rocksdb.cmake
-@@ -490,6 +490,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
+@@ -542,6 +542,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
  
  ADD_CONVENIENCE_LIBRARY(rocksdblib ${SOURCES})
  target_link_libraries(rocksdblib ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch b/meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch
index 24b86584e3..c49af2ecad 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/riscv32.patch
@@ -8,7 +8,7 @@ Upstream-Status: Submitted [https://github.com/MariaDB/server/pull/1981/files#r2
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/include/my_rdtsc.h
 +++ b/include/my_rdtsc.h
-@@ -226,7 +226,7 @@ static inline ulonglong my_timer_cycles(
+@@ -225,7 +225,7 @@ static inline ulonglong my_timer_cycles(
          "sub %0, zero, %0\n"
          "and %1, %1, %0\n"
          : "=r"(result_hi0), "=r"(result_lo), "=r"(result_hi1));
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
index 30c9e2452a..20ad1649c6 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
@@ -15,10 +15,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/support-files/CMakeLists.txt b/support-files/CMakeLists.txt
-index ee1d420e..a99c0605 100644
+index 26d9c1d..afa9011 100644
 --- a/support-files/CMakeLists.txt
 +++ b/support-files/CMakeLists.txt
-@@ -245,12 +245,5 @@ IF(UNIX AND NOT WITHOUT_SERVER)
+@@ -252,13 +252,6 @@ IF(UNIX AND NOT WITHOUT_SERVER)
        INSTALL(FILES rpm/enable_encryption.preset DESTINATION ${INSTALL_SYSCONF2DIR}
                COMPONENT IniFiles)
      ENDIF()
@@ -31,3 +31,4 @@ index ee1d420e..a99c0605 100644
 -                   COMPONENT SupportFiles)
    ENDIF(INSTALL_SYSCONFDIR)
  ENDIF()
+ 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
index 3840472213..3b77b38edb 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sys_futex.patch
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/storage/innobase/sync/srw_lock.cc b/storage/innobase/sync/srw_lock.cc
-index 28b586de..3ee71142 100644
+index 5a419373..cfcd5393 100644
 --- a/storage/innobase/sync/srw_lock.cc
 +++ b/storage/innobase/sync/srw_lock.cc
 @@ -226,6 +226,12 @@ void ssux_lock_impl<spinloop>::wake() noexcept { WakeByAddressSingle(&readers);
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.13.bb b/meta-oe/recipes-dbs/mysql/mariadb_12.3.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.13.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_12.3.4.bb
