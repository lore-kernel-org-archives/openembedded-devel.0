Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A54C433FE
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 08:56:36 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3994.1637571395562802454
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 00:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AM8uYcH002955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 00:56:34 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 22 Nov 2021 00:56:33 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 22 Nov 2021 00:56:33 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: Fix openssl 3.x compatibility
Date: Mon, 22 Nov 2021 16:54:08 +0800
Message-ID: <20211122085408.19113-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 08:56:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94089

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix the below mariadb crash issue which related to
compatibility with openssl 3.x.

 # mysql_install_db --basedir=/usr
 Installing MariaDB/MySQL system tables in '/var/lib/mysql' ...
 /usr/bin/mysql_install_db: line 525:   430 Aborted                 "$mysqld_bootstrap" $defaults $defaults_group_suffix "$mysqld_opt" --bootstrap $silent_startup "--basedir=$basedir" "--datadir=$ldata" --log-warnings=0 --enforce-storage-engine="" "--plugin-dir=${plugindir}" $args --max_allowed_packet=8M --net_buffer_length=16K

 Installation of system tables failed!  Examine the logs in
/var/log/mysqld.log or /var/lib/mysql for more information.
 [snip]

 # cat /var/log/mysqld.log
 [snip]
 Thread pointer: 0x55e203ab6d98
 Attempting backtrace. You can use the following information to find out
 where mysqld died. If you see no messages after this, something went
 terribly wrong...
 stack_bottom = 0x7ffd0c35dd18 thread_stack 0x49000
 /usr/sbin/mariadbd(my_print_stacktrace+0x2e)[0x55e2027e533e]
 /usr/sbin/mariadbd(handle_fatal_signal+0x478)[0x55e20233eac8]
 libc_sigaction.c:0(__restore_rt)[0x7fbdf353b8f0]
 nptl/pthread_kill.c:46(__pthread_kill_internal)[0x7fbdf3586693]
 posix/raise.c:27(__GI_raise)[0x7fbdf353b846]
 stdlib/abort.c:81(__GI_abort)[0x7fbdf35267a3]
 posix/libc_fatal.c:161(__GI___libc_fatal)[0x7fbdf357ae50]
 debug/fortify_fail.c:25(__GI___fortify_fail)[0x7fbdf3613c4a]
 :0(__stack_chk_fail_local)[0x7fbdf3613c14]
 /usr/sbin/mariadbd(+0xacc8b5)[0x55e20253f8b5]
 mysys_ssl/my_md5.cc:92(my_md5)[0x55e202203533]
 /usr/sbin/mariadbd(_Z17mysql_create_viewP3THDP10TABLE_LIST21enum_view_create_mode+0x9e1)[0x55e2021f44b1]
 /usr/sbin/mariadbd(_Z21mysql_execute_commandP3THDb+0x2249)[0x55e202131f79]
 /usr/sbin/mariadbd(_Z11mysql_parseP3THDPcjP12Parser_state+0x1d8)[0x55e202135098]
 sql/table.cc:5635(TABLE_LIST::calc_md5(char const*))[0x55e20213546e]
 sql/sql_class.h:1219(Query_arena::memdup(void const*, unsigned long))[0x55e202073dee]
 nptl/libc_start_call_main.h:58(__libc_start_call_main)[0x7fbdf352751b]
 csu/libc-start.c:128(call_init)[0x7fbdf35275cc]
 /usr/sbin/mariadbd(_start+0x25)[0x55e2020686b5]
 [snip]

[1] https://github.com/MariaDB/server/commit/1b238e343506b43825092941d4cd294d9b866bef

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   1 +
 ...EV-25785-Add-support-for-OpenSSL-3.0.patch | 381 ++++++++++++++++++
 2 files changed, 382 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 81a785932..51e6ddbf7 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://ssize_t.patch \
            file://mm_malloc.patch \
            file://sys_futex.patch \
+           file://0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch
new file mode 100644
index 000000000..ab6811c0f
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch
@@ -0,0 +1,381 @@
+From 1b238e343506b43825092941d4cd294d9b866bef Mon Sep 17 00:00:00 2001
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
+   (according to https://github.com/openssl/openssl/blob/openssl-3.0.0/NEWS.md
+   even though the manual for SSL_CTX_get_security_level claims that it
+   should not be necessary)
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
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/1b238e343506b43825092941d4cd294d9b866bef]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ cmake/ssl.cmake                   |   8 ++
+ include/ssl_compat.h              |   3 +-
+ mysql-test/lib/openssl.cnf        |   2 +-
+ mysql-test/main/ssl_cipher.result |   6 +-
+ mysql-test/main/ssl_cipher.test   |   2 +-
+ mysys_ssl/my_crypt.cc             |  46 +++++++-----
+ unittest/mysys/aes-t.c            | 121 ++++++++++++++++++++++--------
+ 7 files changed, 133 insertions(+), 55 deletions(-)
+
+diff --git a/cmake/ssl.cmake b/cmake/ssl.cmake
+index 7c2488be8bd..1bd46bc0f39 100644
+--- a/cmake/ssl.cmake
++++ b/cmake/ssl.cmake
+@@ -139,6 +139,13 @@ MACRO (MYSQL_CHECK_SSL)
+       SET(SSL_INTERNAL_INCLUDE_DIRS "")
+       SET(SSL_DEFINES "-DHAVE_OPENSSL")
+ 
++      # Silence "deprecated in OpenSSL 3.0"
++      IF((NOT OPENSSL_VERSION) # 3.0 not determined by older cmake
++         OR NOT(OPENSSL_VERSION VERSION_LESS "3.0.0"))
++        SET(SSL_DEFINES "${SSL_DEFINES} -DOPENSSL_API_COMPAT=0x10100000L")
++        SET(CMAKE_REQUIRED_DEFINITIONS -DOPENSSL_API_COMPAT=0x10100000L)
++      ENDIF()
++
+       SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
+       SET(CMAKE_REQUIRED_LIBRARIES ${SSL_LIBRARIES})
+       SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
+@@ -152,6 +159,7 @@ MACRO (MYSQL_CHECK_SSL)
+                           HAVE_X509_check_host)
+       SET(CMAKE_REQUIRED_INCLUDES)
+       SET(CMAKE_REQUIRED_LIBRARIES)
++      SET(CMAKE_REQUIRED_DEFINITIONS)
+     ELSE()
+       IF(WITH_SSL STREQUAL "system")
+         MESSAGE(FATAL_ERROR "Cannot find appropriate system libraries for SSL. Use WITH_SSL=bundled to enable SSL support")
+diff --git a/include/ssl_compat.h b/include/ssl_compat.h
+index 9f4b6be8d95..affa9f2a448 100644
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
+@@ -74,7 +74,6 @@
+ #endif
+ 
+ #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
+-#define EVP_CIPHER_CTX_buf_noconst(ctx) ((ctx)->buf)
+ #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
+ #define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
+ 
+diff --git a/mysql-test/lib/openssl.cnf b/mysql-test/lib/openssl.cnf
+index b9ab37ac3a1..7cd6f748af2 100644
+--- a/mysql-test/lib/openssl.cnf
++++ b/mysql-test/lib/openssl.cnf
+@@ -9,4 +9,4 @@ ssl_conf = ssl_section
+ system_default = system_default_section
+ 
+ [system_default_section]
+-CipherString = ALL:@SECLEVEL=1
++CipherString = ALL:@SECLEVEL=0
+diff --git a/mysql-test/main/ssl_cipher.result b/mysql-test/main/ssl_cipher.result
+index 930d384eda9..66d817b7b41 100644
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
+diff --git a/mysql-test/main/ssl_cipher.test b/mysql-test/main/ssl_cipher.test
+index 36549d76d02..d4cdcffb276 100644
+--- a/mysql-test/main/ssl_cipher.test
++++ b/mysql-test/main/ssl_cipher.test
+@@ -98,6 +98,6 @@ let $restart_parameters=--ssl-cipher=AES128-SHA;
+ source include/restart_mysqld.inc;
+ connect (ssl_con,localhost,root,,,,,SSL);
+ SHOW STATUS LIKE 'Ssl_cipher';
+-SHOW STATUS LIKE 'Ssl_cipher_list';
++SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
+ disconnect ssl_con;
+ connection default;
+diff --git a/mysys_ssl/my_crypt.cc b/mysys_ssl/my_crypt.cc
+index e512eee9066..4d7ebc7bd27 100644
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
+@@ -112,7 +109,7 @@ class MyCTX_nopad : public MyCTX
+     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX_nopad));
+     this->key= key;
+     this->klen= klen;
+-    this->buf_len= 0;
++    this->source_tail_len= 0;
+     if (ivlen)
+       memcpy(oiv, iv, ivlen);
+     DBUG_ASSERT(ivlen == 0 || ivlen == sizeof(oiv));
+@@ -123,26 +120,41 @@ class MyCTX_nopad : public MyCTX
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
+@@ -154,10 +166,10 @@ class MyCTX_nopad : public MyCTX
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
+diff --git a/unittest/mysys/aes-t.c b/unittest/mysys/aes-t.c
+index 34704e06749..cbec2760941 100644
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
++  }
++  else
++  {
++    int dst_len_real= my_aes_get_size(mode, src_len);
++    ok(dst_len_real= dst_len, "my_aes_get_size");
+   }
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
+-- 
+2.17.1
+
-- 
2.17.1


