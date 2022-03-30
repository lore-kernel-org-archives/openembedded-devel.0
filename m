Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4A8C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 06:18:00 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.4074.1648621080079282581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 23:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22U6Hwgm004024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 23:17:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 29 Mar 2022 23:17:56 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 29 Mar 2022 23:17:55 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: increase MY_AES_CTX_SIZE
Date: Wed, 30 Mar 2022 14:17:54 +0800
Message-ID: <20220330061754.2782044-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 06:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96263

From: Mingli Yu <mingli.yu@windriver.com>

Rework the patch to fix the build failure with bundled openssl and
the missing part [1] already included in mariadb 10.8.x [2].

Add PACKAGECONFIG:remove:pn-mariadb = " openssl" to local.conf
 $ bitbake mariadb
 | /buildpath/mariadb/10.7.3-r0/mariadb-10.7.3/mysys_ssl/my_crypt.cc:18:
 | /buildpath/mariadb/10.7.3-r0/mariadb-10.7.3/mysys_ssl/my_crypt.cc: In member function 'virtual int MyCTX_nopad::init(const EVP_CIPHER*, int, const uchar*, uint, const uchar*, uint)':
 | /buildpath/mariadb/10.7.3-r0/mariadb-10.7.3/include/my_global.h:387:74: error: narrowing conversion of '-1' from 'int' to 'long unsigned int' [-Wnarrowing]
  387 |     typedef char compile_time_assert[(X) ? 1 : -1] _attribute_((unused)); \

[1] https://github.com/MariaDB/server/commit/7cd965af92db1e45d4568996808c6c942d3f0cc7
[2] https://github.com/MariaDB/server/commit/d42c2efbaa06a0307c2f0fd8fa87819ff50bbd7e

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../mysql/mariadb/mariadb-openssl3.patch      | 53 +++++++++++++++----
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch b/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
index db123e4a1..878675f30 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mariadb-openssl3.patch
@@ -1,4 +1,4 @@
-From c80991c79f701dac42c630af4bd39593b0c7efb4 Mon Sep 17 00:00:00 2001
+From 1626955f3a2107ec4c7fd927ebfa3c6c1d2b09b8 Mon Sep 17 00:00:00 2001
 From: Vladislav Vaintroub <wlad@mariadb.com>
 Date: Mon, 8 Nov 2021 18:48:19 +0100
 Subject: [PATCH] MDEV-25785 Add support for OpenSSL 3.0
@@ -29,19 +29,22 @@ Summary of changes
 
 Patch from Fedora https://src.fedoraproject.org/rpms/mariadb/raw/rawhide/f/mariadb-openssl3.patch
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/d42c2efbaa06a0307c2f0fd8fa87819ff50bbd7e]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- cmake/ssl.cmake                   |  19 ++++-
+ cmake/ssl.cmake                   |  21 +++++-
+ include/mysql/service_my_crypt.h  |   2 +-
  include/ssl_compat.h              |   3 +-
  mysql-test/lib/openssl.cnf        |   2 +-
  mysql-test/main/ssl_cipher.result |   6 +-
  mysql-test/main/ssl_cipher.test   |   2 +-
  mysys_ssl/my_crypt.cc             |  46 +++++++-----
  unittest/mysys/aes-t.c            | 121 ++++++++++++++++++++++--------
- 7 files changed, 141 insertions(+), 58 deletions(-)
-
+ 8 files changed, 143 insertions(+), 60 deletions(-)
 
+diff --git a/cmake/ssl.cmake b/cmake/ssl.cmake
+index a6793cf3..64c93ff9 100644
 --- a/cmake/ssl.cmake
 +++ b/cmake/ssl.cmake
 @@ -118,7 +118,7 @@ MACRO (MYSQL_CHECK_SSL)
@@ -88,6 +91,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      ELSE()
        IF(WITH_SSL STREQUAL "system")
          MESSAGE(FATAL_ERROR "Cannot find appropriate system libraries for SSL. Use WITH_SSL=bundled to enable SSL support")
+diff --git a/include/mysql/service_my_crypt.h b/include/mysql/service_my_crypt.h
+index 2a232117..bb038aaa 100644
+--- a/include/mysql/service_my_crypt.h
++++ b/include/mysql/service_my_crypt.h
+@@ -45,7 +45,7 @@ extern "C" {
+ /* The max key length of all supported algorithms */
+ #define MY_AES_MAX_KEY_LENGTH 32
+ 
+-#define MY_AES_CTX_SIZE 656
++#define MY_AES_CTX_SIZE 672
+ 
+ enum my_aes_mode {
+     MY_AES_ECB, MY_AES_CBC
+diff --git a/include/ssl_compat.h b/include/ssl_compat.h
+index 8dc12254..6db1baab 100644
 --- a/include/ssl_compat.h
 +++ b/include/ssl_compat.h
 @@ -24,7 +24,7 @@
@@ -107,6 +125,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
  #define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
  
+diff --git a/mysql-test/lib/openssl.cnf b/mysql-test/lib/openssl.cnf
+index b9ab37ac..7cd6f748 100644
 --- a/mysql-test/lib/openssl.cnf
 +++ b/mysql-test/lib/openssl.cnf
 @@ -9,4 +9,4 @@ ssl_conf = ssl_section
@@ -115,6 +135,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  [system_default_section]
 -CipherString = ALL:@SECLEVEL=1
 +CipherString = ALL:@SECLEVEL=0
+diff --git a/mysql-test/main/ssl_cipher.result b/mysql-test/main/ssl_cipher.result
+index 930d384e..66d817b7 100644
 --- a/mysql-test/main/ssl_cipher.result
 +++ b/mysql-test/main/ssl_cipher.result
 @@ -61,8 +61,8 @@ connect  ssl_con,localhost,root,,,,,SSL;
@@ -129,9 +151,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +1
  disconnect ssl_con;
  connection default;
+diff --git a/mysql-test/main/ssl_cipher.test b/mysql-test/main/ssl_cipher.test
+index 36549d76..d4cdcffb 100644
 --- a/mysql-test/main/ssl_cipher.test
 +++ b/mysql-test/main/ssl_cipher.test
-@@ -98,6 +98,6 @@ let $restart_parameters=--ssl-cipher=AES
+@@ -98,6 +98,6 @@ let $restart_parameters=--ssl-cipher=AES128-SHA;
  source include/restart_mysqld.inc;
  connect (ssl_con,localhost,root,,,,,SSL);
  SHOW STATUS LIKE 'Ssl_cipher';
@@ -139,6 +163,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
  disconnect ssl_con;
  connection default;
+diff --git a/mysys_ssl/my_crypt.cc b/mysys_ssl/my_crypt.cc
+index e512eee9..4d7ebc7b 100644
 --- a/mysys_ssl/my_crypt.cc
 +++ b/mysys_ssl/my_crypt.cc
 @@ -29,11 +29,7 @@
@@ -164,7 +190,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    MyCTX_nopad() : MyCTX() { }
    ~MyCTX_nopad() { }
-@@ -112,7 +109,7 @@ public:
+@@ -112,7 +109,7 @@ class MyCTX_nopad : public MyCTX
      compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX_nopad));
      this->key= key;
      this->klen= klen;
@@ -173,7 +199,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      if (ivlen)
        memcpy(oiv, iv, ivlen);
      DBUG_ASSERT(ivlen == 0 || ivlen == sizeof(oiv));
-@@ -123,26 +120,41 @@ public:
+@@ -123,26 +120,41 @@ class MyCTX_nopad : public MyCTX
      return res;
    }
  
@@ -223,7 +249,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        */
        uchar mask[MY_AES_BLOCK_SIZE];
        uint mlen;
-@@ -154,10 +166,10 @@ public:
+@@ -154,10 +166,10 @@ class MyCTX_nopad : public MyCTX
          return rc;
        DBUG_ASSERT(mlen == sizeof(mask));
  
@@ -237,6 +263,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      return MY_AES_OK;
    }
  };
+diff --git a/unittest/mysys/aes-t.c b/unittest/mysys/aes-t.c
+index 34704e06..cbec2760 100644
 --- a/unittest/mysys/aes-t.c
 +++ b/unittest/mysys/aes-t.c
 @@ -21,27 +21,96 @@
@@ -331,12 +359,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +    /* Compare with non-bytewise encryption result*/
 +    ok(dst_len == dst_len2 && memcmp(dst, dst2, dst_len) == 0,
 +       "memcmp bytewise  %s %u", mode_str, src_len);
-   }
++  }
 +  else
 +  {
 +    int dst_len_real= my_aes_get_size(mode, src_len);
 +    ok(dst_len_real= dst_len, "my_aes_get_size");
-+  }
+   }
 +  my_md5(md5, (char *) dst, dst_len);
 +  ok(dst_len == dlen, "md5 len");
 +  ok(memcmp(md5, hash, sizeof(md5)) == 0, "md5");
@@ -383,3 +411,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    DO_TEST_P(MY_AES_ECB, 200, '.', 208, "\xd8\x73\x8e\x3a\xbc\x66\x99\x13\x7f\x90\x23\x52\xee\x97\x6f\x9a");
    DO_TEST_P(MY_AES_ECB, 128, '?', 144, "\x19\x58\x33\x85\x4c\xaa\x7f\x06\xd1\xb2\xec\xd7\xb7\x6a\xa9\x5b");
    DO_TEST_P(MY_AES_CBC, 159, '%', 160, "\x4b\x03\x18\x3d\xf1\xa7\xcd\xa1\x46\xb3\xc6\x8a\x92\xc0\x0f\xc9");
+-- 
+2.25.1
+
-- 
2.25.1


