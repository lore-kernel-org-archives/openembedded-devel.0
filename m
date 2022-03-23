Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B149C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 05:17:03 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.5718.1648012622246173638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 22:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b/DLLyEU;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id t5so638922pfg.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 22:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJ0uCVCYu13bYE45FS9ku58dYPm6XVBBUh/9Bjro0SI=;
        b=b/DLLyEU4C7OPfSmKKEFlUiARAc6HylxktbTq6j224UyIcmmRb7xU9RidEfhOFVa0J
         DQ3u8M3iCj9di7rCi53Ms98yCsZXUDhFRFmD7J/4uolkTiLD7yokdiMLA9OPyiBUqFJ4
         09Q3xkBJ6dPKj6SrFG43xcCXuC7ZavjUZhwMor8WJE01o1GiKX24A6+4MrK7atA9dgrG
         LCr8hxdfic9+fRCQgvn7kPYfdNiEu0EMu7p525HjnAtknD8QCqKzf16gXICW82nfz4b6
         ltDyVfxDlkSssgZZjzds3ARDXk4bKTmzOAxweGM3hrflwmcnjdylbeXdXldWnVg6XKnK
         ch6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJ0uCVCYu13bYE45FS9ku58dYPm6XVBBUh/9Bjro0SI=;
        b=5460OON/sQd39pwdDJp4Be0fhx4iLw0Svn/b2Z/+qBVTNKIwxdPyjnT1fJ90pjGTwT
         lf3/3/teFZ+9YbPSbBDpJCYRL1DByI99bMDiPKsJjxtNqvH8oif20yo0HtceDaqtn09X
         2JBE4EbN6GIRrRWLYofYxYhvcjbF28oeEMKaI0Q+s4rHnefNumlQN0GzDjYPVuK72gyr
         GIxuBp3j7MKssarSXO8xzXqHvGL1nEXQWit+3LrCO1RHDd1WObu/zyI5UrcL1GzR9f9M
         sX4wYf2j5K8iqbKANW/m5rfN5rXggV9PNi+5VDBd5ieiyStr/yj42WR5j1ETkAbpSHPI
         8DZA==
X-Gm-Message-State: AOAM531Z1jINcIGusVwLtklyl7TwRe8CHETL7iY0GoTv9ptCPxrGfSuv
	F7kI1STvAZvy46kIDooKioy/UROJm0Bj6Q==
X-Google-Smtp-Source: 
 ABdhPJzitYB2a04IezMMh148Y/sal3GvfkKSfCkym/FqN/u27qvbHI6fXMko/lKVWsq+PV5cd4JUlQ==
X-Received: by 2002:a63:4417:0:b0:382:add8:71cb with SMTP id
 r23-20020a634417000000b00382add871cbmr7461327pga.605.1648012621202;
        Tue, 22 Mar 2022 22:17:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u126-20020a637984000000b0038147b4f53esm18237358pgc.93.2022.03.22.22.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 22:17:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [meta-oe][PATCH] mariadb: Enable openSSL and use as default SSL
 option
Date: Tue, 22 Mar 2022 22:16:58 -0700
Message-Id: <20220323051658.4065181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 05:17:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96157

cmakery fails to detect openSSL and falls back to use wolfSSL which is
bundled with mariadb, therefore fix openSSL support fixes from fedora

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   4 +-
 .../mysql/mariadb/mariadb-openssl3.patch      | 385 ++++++++++++++++++
 meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb   |   2 +-
 3 files changed, 389 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7f78da1fd3..02ca5f96f2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://ssize_t.patch \
            file://mm_malloc.patch \
            file://sys_futex.patch \
+           file://mariadb-openssl3.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
@@ -60,12 +61,13 @@ FILES:${PN}-setupdb = "${sysconfdir}/init.d/install_db \
                        ${bindir}/mysql-systemd-start \
                        "
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
 PACKAGECONFIG[zstd] = "-DWITH_ROCKSDB_ZSTD=ON,-DWITH_ROCKSDB_ZSTD=OFF,zstd"
+PACKAGECONFIG[openssl] = "-DWITH_SSL='system',-DWITH_SSL='bundled',openssl"
 
 # MariaDB doesn't link properly with gold
 # https://mariadb.atlassian.net/browse/MDEV-5982
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch b/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
new file mode 100644
index 0000000000..db123e4a10
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
@@ -0,0 +1,385 @@
+From c80991c79f701dac42c630af4bd39593b0c7efb4 Mon Sep 17 00:00:00 2001
+From: Vladislav Vaintroub <wlad@mariadb.com>
+Date: Mon, 8 Nov 2021 18:48:19 +0100
+Subject: [PATCH] MDEV-25785 Add support for OpenSSL 3.0
+
+Summary of changes
+
+- MD_CTX_SIZE is increased
+
+- EVP_CIPHER_CTX_buf_noconst(ctx) does not work anymore, points
+  to nobody knows where. The assumption made previously was that
+  (since the function does not seem to be documented)
+  was that it points to the last partial source block.
+  Add own partial block buffer for NOPAD encryption instead
+
+- SECLEVEL in CipherString in openssl.cnf
+  had been downgraded to 0, from 1, to make TLSv1.0 and TLSv1.1 possible
+
+- Workaround Ssl_cipher_list issue, it now returns TLSv1.3 ciphers,
+  in addition to what was set in --ssl-cipher
+
+- ctx_buf buffer now must be aligned to 16 bytes with openssl(
+  previously with WolfSSL only), ot crashes will happen
+
+- updated aes-t , to be better debuggable
+  using function, rather than a huge multiline macro
+  added test that does "nopad" encryption piece-wise, to test
+  replacement of EVP_CIPHER_CTX_buf_noconst
+
+Patch from Fedora https://src.fedoraproject.org/rpms/mariadb/raw/rawhide/f/mariadb-openssl3.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/ssl.cmake                   |  19 ++++-
+ include/ssl_compat.h              |   3 +-
+ mysql-test/lib/openssl.cnf        |   2 +-
+ mysql-test/main/ssl_cipher.result |   6 +-
+ mysql-test/main/ssl_cipher.test   |   2 +-
+ mysys_ssl/my_crypt.cc             |  46 +++++++-----
+ unittest/mysys/aes-t.c            | 121 ++++++++++++++++++++++--------
+ 7 files changed, 141 insertions(+), 58 deletions(-)
+
+
+--- a/cmake/ssl.cmake
++++ b/cmake/ssl.cmake
+@@ -118,7 +118,7 @@ MACRO (MYSQL_CHECK_SSL)
+     ENDIF()
+     FIND_PACKAGE(OpenSSL)
+     SET_PACKAGE_PROPERTIES(OpenSSL PROPERTIES TYPE RECOMMENDED)
+-    IF(OPENSSL_FOUND AND OPENSSL_VERSION AND OPENSSL_VERSION VERSION_LESS "3.0.0")
++    IF(OPENSSL_FOUND)
+       SET(OPENSSL_LIBRARY ${OPENSSL_SSL_LIBRARY})
+       INCLUDE(CheckSymbolExists)
+       SET(SSL_SOURCES "")
+@@ -139,9 +139,20 @@ MACRO (MYSQL_CHECK_SSL)
+       SET(SSL_INTERNAL_INCLUDE_DIRS "")
+       SET(SSL_DEFINES "-DHAVE_OPENSSL")
+ 
++      FOREACH(x INCLUDES LIBRARIES DEFINITIONS)
++        SET(SAVE_CMAKE_REQUIRED_${x} ${CMAKE_REQUIRED_${x}})
++      ENDFOREACH()
++
++      # Silence "deprecated in OpenSSL 3.0"
++      IF((NOT OPENSSL_VERSION) # 3.0 not determined by older cmake
++         OR NOT(OPENSSL_VERSION VERSION_LESS "3.0.0"))
++        SET(SSL_DEFINES "${SSL_DEFINES} -DOPENSSL_API_COMPAT=0x10100000L")
++        SET(CMAKE_REQUIRED_DEFINITIONS -DOPENSSL_API_COMPAT=0x10100000L)
++      ENDIF()
++
+       SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
+       SET(CMAKE_REQUIRED_LIBRARIES ${SSL_LIBRARIES})
+-      SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
++
+       CHECK_SYMBOL_EXISTS(ERR_remove_thread_state "openssl/err.h"
+                           HAVE_ERR_remove_thread_state)
+       CHECK_SYMBOL_EXISTS(EVP_aes_128_ctr "openssl/evp.h"
+@@ -150,8 +161,10 @@ MACRO (MYSQL_CHECK_SSL)
+                           HAVE_EncryptAes128Gcm)
+       CHECK_SYMBOL_EXISTS(X509_check_host "openssl/x509v3.h"
+                           HAVE_X509_check_host)
+-      SET(CMAKE_REQUIRED_INCLUDES)
+-      SET(CMAKE_REQUIRED_LIBRARIES)
++
++      FOREACH(x INCLUDES LIBRARIES DEFINITIONS)
++        SET(CMAKE_REQUIRED_${x} ${SAVE_CMAKE_REQUIRED_${x}})
++      ENDFOREACH()
+     ELSE()
+       IF(WITH_SSL STREQUAL "system")
+         MESSAGE(FATAL_ERROR "Cannot find appropriate system libraries for SSL. Use WITH_SSL=bundled to enable SSL support")
+--- a/include/ssl_compat.h
++++ b/include/ssl_compat.h
+@@ -24,7 +24,7 @@
+ #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
+ #define ERR_remove_state(X) ERR_clear_error()
+ #define EVP_CIPHER_CTX_SIZE 176
+-#define EVP_MD_CTX_SIZE 48
++#define EVP_MD_CTX_SIZE 72
+ #undef EVP_MD_CTX_init
+ #define EVP_MD_CTX_init(X) do { memset((X), 0, EVP_MD_CTX_SIZE); EVP_MD_CTX_reset(X); } while(0)
+ #undef EVP_CIPHER_CTX_init
+@@ -77,7 +77,6 @@
+ #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
+ #endif
+ 
+-#define EVP_CIPHER_CTX_buf_noconst(ctx) ((ctx)->buf)
+ #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
+ #define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
+ 
+--- a/mysql-test/lib/openssl.cnf
++++ b/mysql-test/lib/openssl.cnf
+@@ -9,4 +9,4 @@ ssl_conf = ssl_section
+ system_default = system_default_section
+ 
+ [system_default_section]
+-CipherString = ALL:@SECLEVEL=1
++CipherString = ALL:@SECLEVEL=0
+--- a/mysql-test/main/ssl_cipher.result
++++ b/mysql-test/main/ssl_cipher.result
+@@ -61,8 +61,8 @@ connect  ssl_con,localhost,root,,,,,SSL;
+ SHOW STATUS LIKE 'Ssl_cipher';
+ Variable_name	Value
+ Ssl_cipher	AES128-SHA
+-SHOW STATUS LIKE 'Ssl_cipher_list';
+-Variable_name	Value
+-Ssl_cipher_list	AES128-SHA
++SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
++VARIABLE_VALUE like '%AES128-SHA%'
++1
+ disconnect ssl_con;
+ connection default;
+--- a/mysql-test/main/ssl_cipher.test
++++ b/mysql-test/main/ssl_cipher.test
+@@ -98,6 +98,6 @@ let $restart_parameters=--ssl-cipher=AES
+ source include/restart_mysqld.inc;
+ connect (ssl_con,localhost,root,,,,,SSL);
+ SHOW STATUS LIKE 'Ssl_cipher';
+-SHOW STATUS LIKE 'Ssl_cipher_list';
++SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
+ disconnect ssl_con;
+ connection default;
+--- a/mysys_ssl/my_crypt.cc
++++ b/mysys_ssl/my_crypt.cc
+@@ -29,11 +29,7 @@
+ #include <ssl_compat.h>
+ #include <cstdint>
+ 
+-#ifdef HAVE_WOLFSSL
+ #define CTX_ALIGN 16
+-#else
+-#define CTX_ALIGN 0
+-#endif
+ 
+ class MyCTX
+ {
+@@ -100,8 +96,9 @@ class MyCTX_nopad : public MyCTX
+ {
+ public:
+   const uchar *key;
+-  uint klen, buf_len;
++  uint klen, source_tail_len;
+   uchar oiv[MY_AES_BLOCK_SIZE];
++  uchar source_tail[MY_AES_BLOCK_SIZE];
+ 
+   MyCTX_nopad() : MyCTX() { }
+   ~MyCTX_nopad() { }
+@@ -112,7 +109,7 @@ public:
+     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX_nopad));
+     this->key= key;
+     this->klen= klen;
+-    this->buf_len= 0;
++    this->source_tail_len= 0;
+     if (ivlen)
+       memcpy(oiv, iv, ivlen);
+     DBUG_ASSERT(ivlen == 0 || ivlen == sizeof(oiv));
+@@ -123,26 +120,41 @@ public:
+     return res;
+   }
+ 
++  /** Update last partial source block, stored in source_tail array. */
++  void update_source_tail(const uchar* src, uint slen)
++  {
++    if (!slen)
++      return;
++    uint new_tail_len= (source_tail_len + slen) % MY_AES_BLOCK_SIZE;
++    if (new_tail_len)
++    {
++      if (slen + source_tail_len < MY_AES_BLOCK_SIZE)
++      {
++        memcpy(source_tail + source_tail_len, src, slen);
++      }
++      else
++      {
++        DBUG_ASSERT(slen > new_tail_len);
++        memcpy(source_tail, src + slen - new_tail_len, new_tail_len);
++      }
++    }
++    source_tail_len= new_tail_len;
++  }
++
+   int update(const uchar *src, uint slen, uchar *dst, uint *dlen)
+   {
+-    buf_len+= slen;
++    update_source_tail(src, slen);
+     return MyCTX::update(src, slen, dst, dlen);
+   }
+ 
+   int finish(uchar *dst, uint *dlen)
+   {
+-    buf_len %= MY_AES_BLOCK_SIZE;
+-    if (buf_len)
++    if (source_tail_len)
+     {
+-      uchar *buf= EVP_CIPHER_CTX_buf_noconst(ctx);
+       /*
+         Not much we can do, block ciphers cannot encrypt data that aren't
+         a multiple of the block length. At least not without padding.
+         Let's do something CTR-like for the last partial block.
+-
+-        NOTE this assumes that there are only buf_len bytes in the buf.
+-        If OpenSSL will change that, we'll need to change the implementation
+-        of this class too.
+       */
+       uchar mask[MY_AES_BLOCK_SIZE];
+       uint mlen;
+@@ -154,10 +166,10 @@ public:
+         return rc;
+       DBUG_ASSERT(mlen == sizeof(mask));
+ 
+-      for (uint i=0; i < buf_len; i++)
+-        dst[i]= buf[i] ^ mask[i];
++      for (uint i=0; i < source_tail_len; i++)
++        dst[i]= source_tail[i] ^ mask[i];
+     }
+-    *dlen= buf_len;
++    *dlen= source_tail_len;
+     return MY_AES_OK;
+   }
+ };
+--- a/unittest/mysys/aes-t.c
++++ b/unittest/mysys/aes-t.c
+@@ -21,27 +21,96 @@
+ #include <string.h>
+ #include <ctype.h>
+ 
+-#define DO_TEST(mode, nopad, slen, fill, dlen, hash)                    \
+-  SKIP_BLOCK_IF(mode == 0xDEADBEAF, nopad ? 4 : 5, #mode " not supported")     \
+-  {                                                                     \
+-    memset(src, fill, src_len= slen);                                   \
+-    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT,              \
+-                    src, src_len, dst, &dst_len,                        \
+-                    key, sizeof(key), iv, sizeof(iv)) == MY_AES_OK,     \
+-      "encrypt " #mode " %u %s", src_len, nopad ? "nopad" : "pad");     \
+-    if (!nopad)                                                         \
+-      ok (dst_len == my_aes_get_size(mode, src_len), "my_aes_get_size");\
+-    my_md5(md5, (char*)dst, dst_len);                                   \
+-    ok(dst_len == dlen && memcmp(md5, hash, sizeof(md5)) == 0, "md5");  \
+-    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,              \
+-                    dst, dst_len, ddst, &ddst_len,                      \
+-                    key, sizeof(key), iv, sizeof(iv)) == MY_AES_OK,     \
+-       "decrypt " #mode " %u", dst_len);                                \
+-    ok(ddst_len == src_len && memcmp(src, ddst, src_len) == 0, "memcmp"); \
++
++/** Test streaming encryption, bytewise update.*/
++static int aes_crypt_bytewise(enum my_aes_mode mode, int flags, const unsigned char *src,
++                 unsigned int slen, unsigned char *dst, unsigned int *dlen,
++                 const unsigned char *key, unsigned int klen,
++                 const unsigned char *iv, unsigned int ivlen)
++{
++  /* Allocate context on odd address on stack, in order to
++   catch misalignment errors.*/
++  void *ctx= (char *)alloca(MY_AES_CTX_SIZE+1)+1;
++
++  int res1, res2;
++  uint d1= 0, d2;
++  uint i;
++
++  if ((res1= my_aes_crypt_init(ctx, mode, flags, key, klen, iv, ivlen)))
++    return res1;
++  for (i= 0; i < slen; i++)
++  {
++    uint tmp_d1=0;
++    res1= my_aes_crypt_update(ctx, src+i,1, dst, &tmp_d1);
++    if (res1)
++      return res1;
++    d1+= tmp_d1;
++    dst+= tmp_d1;
++  }
++  res2= my_aes_crypt_finish(ctx, dst, &d2);
++  *dlen= d1 + d2;
++  return res1 ? res1 : res2;
++}
++
++
++#ifndef HAVE_EncryptAes128Ctr
++const uint MY_AES_CTR=0xDEADBEAF;
++#endif
++#ifndef HAVE_EncryptAes128Gcm
++const uint MY_AES_GCM=0xDEADBEAF;
++#endif
++
++#define MY_AES_UNSUPPORTED(x)  (x == 0xDEADBEAF)
++
++static void do_test(uint mode, const char *mode_str, int nopad, uint slen,
++                    char fill, size_t dlen, const char *hash)
++{
++  uchar key[16]= {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6};
++  uchar iv[16]= {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7};
++  uchar src[1000], dst[1100], dst2[1100], ddst[1000];
++  uchar md5[MY_MD5_HASH_SIZE];
++  uint src_len, dst_len, dst_len2, ddst_len;
++  int result;
++
++  if (MY_AES_UNSUPPORTED(mode))
++  {
++    skip(nopad?7:6, "%s not supported", mode_str);
++    return;
++  }
++  memset(src, fill, src_len= slen);
++  result= my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT, src, src_len,
++                       dst, &dst_len, key, sizeof(key), iv, sizeof(iv));
++  ok(result == MY_AES_OK, "encrypt %s %u %s", mode_str, src_len,
++     nopad ? "nopad" : "pad");
++
++  if (nopad)
++  {
++    result= aes_crypt_bytewise(mode, nopad | ENCRYPTION_FLAG_ENCRYPT, src,
++                                src_len, dst2, &dst_len2, key, sizeof(key),
++                                iv, sizeof(iv));
++    ok(result == MY_AES_OK, "encrypt bytewise %s %u", mode_str, src_len);
++    /* Compare with non-bytewise encryption result*/
++    ok(dst_len == dst_len2 && memcmp(dst, dst2, dst_len) == 0,
++       "memcmp bytewise  %s %u", mode_str, src_len);
+   }
++  else
++  {
++    int dst_len_real= my_aes_get_size(mode, src_len);
++    ok(dst_len_real= dst_len, "my_aes_get_size");
++  }
++  my_md5(md5, (char *) dst, dst_len);
++  ok(dst_len == dlen, "md5 len");
++  ok(memcmp(md5, hash, sizeof(md5)) == 0, "md5");
++  result= my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,
++                       dst, dst_len, ddst, &ddst_len, key, sizeof(key), iv,
++                       sizeof(iv));
++
++  ok(result == MY_AES_OK, "decrypt %s %u", mode_str, dst_len);
++  ok(ddst_len == src_len && memcmp(src, ddst, src_len) == 0, "memcmp");
++}
+ 
+-#define DO_TEST_P(M,S,F,D,H) DO_TEST(M,0,S,F,D,H)
+-#define DO_TEST_N(M,S,F,D,H) DO_TEST(M,ENCRYPTION_FLAG_NOPAD,S,F,D,H)
++#define DO_TEST_P(M, S, F, D, H) do_test(M, #M, 0, S, F, D, H)
++#define DO_TEST_N(M, S, F, D, H) do_test(M, #M, ENCRYPTION_FLAG_NOPAD, S, F, D, H)
+ 
+ /* useful macro for debugging */
+ #define PRINT_MD5()                                     \
+@@ -53,25 +122,15 @@
+     printf("\"\n");                                     \
+   } while(0);
+ 
+-#ifndef HAVE_EncryptAes128Ctr
+-const uint MY_AES_CTR=0xDEADBEAF;
+-#endif
+-#ifndef HAVE_EncryptAes128Gcm
+-const uint MY_AES_GCM=0xDEADBEAF;
+-#endif
+ 
+ int
+ main(int argc __attribute__((unused)),char *argv[])
+ {
+-  uchar key[16]= {1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6};
+-  uchar iv[16]=  {2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7};
+-  uchar src[1000], dst[1100], ddst[1000];
+-  uchar md5[MY_MD5_HASH_SIZE];
+-  uint src_len, dst_len, ddst_len;
+ 
+   MY_INIT(argv[0]);
+ 
+-  plan(87);
++  plan(122);
++
+   DO_TEST_P(MY_AES_ECB, 200, '.', 208, "\xd8\x73\x8e\x3a\xbc\x66\x99\x13\x7f\x90\x23\x52\xee\x97\x6f\x9a");
+   DO_TEST_P(MY_AES_ECB, 128, '?', 144, "\x19\x58\x33\x85\x4c\xaa\x7f\x06\xd1\xb2\xec\xd7\xb7\x6a\xa9\x5b");
+   DO_TEST_P(MY_AES_CBC, 159, '%', 160, "\x4b\x03\x18\x3d\xf1\xa7\xcd\xa1\x46\xb3\xc6\x8a\x92\xc0\x0f\xc9");
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
index 8667417b12..c800c4c56c 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 inherit qemu
 
-DEPENDS += "qemu-native bison-native boost libpcre2 curl openssl ncurses \
+DEPENDS += "qemu-native bison-native boost libpcre2 curl ncurses \
             zlib libaio libedit libevent libxml2 gnutls fmt lzo"
 
 PROVIDES += "mysql5 libmysqlclient"
-- 
2.35.1


