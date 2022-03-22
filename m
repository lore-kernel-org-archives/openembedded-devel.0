Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688D5C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:48:37 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.14138.1647974916534187596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pegIGtPs;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id s11so15214453qtc.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2irImzCKCX1QGdO+b4L/7iO30yBodbMDLSjLjiDYop8=;
        b=pegIGtPsEciVO4q9ET4EyX+TBI5rERFVxVj6TpQoxRUsPVTJcw/q5ubrmvqeB4FgV8
         VW97TZ5keBH7XtdXhK4iMbyTCf8nUW2199MW1CbTFwABIcL0xJL9sJNWYAT0c2GFtbiw
         mri6RQwFms/RgtSyRmTSOdnpdTzFlVio9Ti6iRx0CfQk6CHGTqBAPWu6kgvFqieQEZ2M
         h5mqevF7JTBC4AiWucy5AM77+o/Dgdh3vLcYSfJjMv1Il1SFWqHZra86G0xBFCijAyR7
         /oT881ytWlNMgnvHHEeogVtuo61STJWr48qzXmB7vxu/NJjH/u79B9iXzijxGaSN2CEW
         9rxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2irImzCKCX1QGdO+b4L/7iO30yBodbMDLSjLjiDYop8=;
        b=d8P949qyzZuLzSeW2rjPzTt4uzpm4QMd3FITBIBHQ+32s/Er/vxev0J8g28MoV7/JU
         QvtQ/3Nyp+lNKG8d9fbnRqnko88CyMPshOJLMOjgqdrvyYkNocxqGHFnV1YULyTixvyM
         t2/JHo4g+sQXTYbkrwvZ+tZW/EJSGDs0jnWYs12noWXNlE6SxksUo4xd3lZ6fUyDeowF
         y/dc3XtoZy/aY6UEPIR40hyBIkCZg+8kf6ty2DOquo3Nqwr3SN6zkY6oXsURxurLmznQ
         EGluBwQ8aJaXmoQKHY6gkUVIbOsiKOXvYV6txKnLyzPPqNnt+OCnnR34H4xeBmz6nXY7
         HDdA==
X-Gm-Message-State: AOAM532B5GtgaD/rbATMsk8q1ko1rNnKpxTn9TlEv+BAwzQ/zdPFXbBd
	32DHXMdaLl3+gW0nPwQV2USSYIQJ+YP5150ardg=
X-Google-Smtp-Source: 
 ABdhPJx9e5C1bTwrlYO6yiDybFrzAoct5hx/EzPk35Gwu3BUUQAGO67cVCm6pIh7c+QtsxNsmqvvNm/O0gOF3+cBdp4=
X-Received: by 2002:ac8:5842:0:b0:2e1:aa10:e7cd with SMTP id
 h2-20020ac85842000000b002e1aa10e7cdmr21527564qth.330.1647974915202; Tue, 22
 Mar 2022 11:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220322044520.1776430-1-mingli.yu@windriver.com>
In-Reply-To: <20220322044520.1776430-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Mar 2022 11:48:09 -0700
Message-ID: 
 <CAMKF1sr=9KbHJL9xRU1HQ5GZj0RkBYOQAPPnN8CqEP0MtxZFdQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.7.3
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 18:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96153

this fails with clang https://errors.yoctoproject.org/Errors/Details/653031/
the reason is its missing dependency on lzo and clang tries to use its
copy from native sysroot which in itself is not right
but adding the missing dependency atleast fixes the problem.

On Mon, Mar 21, 2022 at 9:45 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove two patches which are already included in new version and rebase
> one patch to new version and add lzo rdepends to fix below qa issue. [1]
> ERROR: mariadb-10.7.3-r0 do_package_qa: QA Issue: /usr/lib64/plugin/provider_lzo.so contained in package mariadb-server requires liblzo2.so.2()(64bit), but no providers found in RDEPENDS:mariadb-server? [file-rdeps]
>
> Add gnutls to depends to fix below error and fmt to depends [2]
>  | Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>
> [1] https://github.com/MariaDB/server/commit/bf8b699f649b7f947e8ad8eeeb48c3d5f973be39
> [2] https://github.com/MariaDB/server/commit/284ed643369dec9ff600bf4b2a2d9457986eda6e
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ive_10.6.4.bb => mariadb-native_10.7.3.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   6 +-
>  .../mariadb/0001-Fix-library-LZ4-lookup.patch |  17 +-
>  ...EV-25785-Add-support-for-OpenSSL-3.0.patch | 381 ------------------
>  .../mysql/mariadb/c11_atomics.patch           |  82 ----
>  .../{mariadb_10.6.4.bb => mariadb_10.7.3.bb}  |   3 +-
>  6 files changed, 13 insertions(+), 476 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.6.4.bb => mariadb-native_10.7.3.bb} (100%)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.6.4.bb => mariadb_10.7.3.bb} (91%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.6.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.6.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index a14c263d8..7f78da1fd 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -12,7 +12,6 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>             file://mysql-systemd-start \
>             file://configure.cmake-fix-valgrind.patch \
>             file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
> -           file://c11_atomics.patch \
>             file://fix-arm-atomic.patch \
>             file://0001-Fix-library-LZ4-lookup.patch \
>             file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
> @@ -20,11 +19,10 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>             file://ssize_t.patch \
>             file://mm_malloc.patch \
>             file://sys_futex.patch \
> -           file://0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch \
>            "
>  SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
>
> -SRC_URI[sha256sum] = "75bf9b147a95d38160d01a73b098d50a1960563b46d16a235971fff64d99643c"
> +SRC_URI[sha256sum] = "da286919ffc9c913282202349709b6ba4ebcd342815e8dae0aa6b6bd8f515cd4"
>
>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>
> @@ -203,7 +201,7 @@ RDEPENDS:${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
>  RDEPENDS:${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
>      perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
>      perl-module-file-copy perl-module-file-temp perl-module-posix \
> -    ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysql-perl"
> +    ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysql-perl lzo"
>  RDEPENDS:${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
>      perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
>      perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
> index 0cf0560e1..6d9352fe8 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
> @@ -1,30 +1,31 @@
> -From 1d7612b063eb1fc7bf97bc27b13e1de596748aa1 Mon Sep 17 00:00:00 2001
> +From f15fbdf1244ca9ce01c5507660a86d685ed88bcf Mon Sep 17 00:00:00 2001
>  From: Sumit Garg <sumit.garg@linaro.org>
> -Date: Wed, 8 Jan 2020 04:58:30 +0000
> +Date: Mon, 21 Mar 2022 15:08:40 +0800
>  Subject: [PATCH] Fix library LZ4 lookup.
>
>  Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>  ---
>   cmake/FindLZ4.cmake | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
>  diff --git a/cmake/FindLZ4.cmake b/cmake/FindLZ4.cmake
> -index e97dd63e2b0..2f4694e727c 100644
> +index eebd859..094241c 100644
>  --- a/cmake/FindLZ4.cmake
>  +++ b/cmake/FindLZ4.cmake
>  @@ -1,5 +1,10 @@
> --find_path(LZ4_INCLUDE_DIR NAMES lz4.h)
> +-find_path(LZ4_INCLUDE_DIRS NAMES lz4.h)
>  -find_library(LZ4_LIBRARIES NAMES lz4)
>  +find_path(LZ4_INCLUDE_DIR
> -+  NAMES       lz4.h
> ++  NAMES    lz4.h
>  +  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
>  +
>  +find_library(LZ4_LIBRARIES
>  +  NAMES lz4
>  +  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
>
> - include(FindPackageHandleStandardArgs)
> - FIND_PACKAGE_HANDLE_STANDARD_ARGS(
> + if(LZ4_INCLUDE_DIRS AND EXISTS "${LZ4_INCLUDE_DIRS}/lz4.h")
> +   file(STRINGS "${LZ4_INCLUDE_DIRS}/lz4.h" LZ4_H REGEX "^#define LZ4_VERSION_[MR]")
>  --
> -2.17.1
> +2.25.1
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch
> deleted file mode 100644
> index ab6811c0f..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-25785-Add-support-for-OpenSSL-3.0.patch
> +++ /dev/null
> @@ -1,381 +0,0 @@
> -From 1b238e343506b43825092941d4cd294d9b866bef Mon Sep 17 00:00:00 2001
> -From: Vladislav Vaintroub <wlad@mariadb.com>
> -Date: Mon, 8 Nov 2021 18:48:19 +0100
> -Subject: [PATCH] MDEV-25785 Add support for OpenSSL 3.0
> -
> -Summary of changes
> -
> -- MD_CTX_SIZE is increased
> -
> -- EVP_CIPHER_CTX_buf_noconst(ctx) does not work anymore, points
> -  to nobody knows where. The assumption made previously was that
> -  (since the function does not seem to be documented)
> -  was that it points to the last partial source block.
> -  Add own partial block buffer for NOPAD encryption instead
> -
> -- SECLEVEL in CipherString in openssl.cnf
> -  had been downgraded to 0, from 1, to make TLSv1.0 and TLSv1.1 possible
> -   (according to https://github.com/openssl/openssl/blob/openssl-3.0.0/NEWS.md
> -   even though the manual for SSL_CTX_get_security_level claims that it
> -   should not be necessary)
> -
> -- Workaround Ssl_cipher_list issue, it now returns TLSv1.3 ciphers,
> -  in addition to what was set in --ssl-cipher
> -
> -- ctx_buf buffer now must be aligned to 16 bytes with openssl(
> -  previously with WolfSSL only), ot crashes will happen
> -
> -- updated aes-t , to be better debuggable
> -  using function, rather than a huge multiline macro
> -  added test that does "nopad" encryption piece-wise, to test
> -  replacement of EVP_CIPHER_CTX_buf_noconst
> -
> -Upstream-Status: Backport [https://github.com/MariaDB/server/commit/1b238e343506b43825092941d4cd294d9b866bef]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - cmake/ssl.cmake                   |   8 ++
> - include/ssl_compat.h              |   3 +-
> - mysql-test/lib/openssl.cnf        |   2 +-
> - mysql-test/main/ssl_cipher.result |   6 +-
> - mysql-test/main/ssl_cipher.test   |   2 +-
> - mysys_ssl/my_crypt.cc             |  46 +++++++-----
> - unittest/mysys/aes-t.c            | 121 ++++++++++++++++++++++--------
> - 7 files changed, 133 insertions(+), 55 deletions(-)
> -
> -diff --git a/cmake/ssl.cmake b/cmake/ssl.cmake
> -index 7c2488be8bd..1bd46bc0f39 100644
> ---- a/cmake/ssl.cmake
> -+++ b/cmake/ssl.cmake
> -@@ -139,6 +139,13 @@ MACRO (MYSQL_CHECK_SSL)
> -       SET(SSL_INTERNAL_INCLUDE_DIRS "")
> -       SET(SSL_DEFINES "-DHAVE_OPENSSL")
> -
> -+      # Silence "deprecated in OpenSSL 3.0"
> -+      IF((NOT OPENSSL_VERSION) # 3.0 not determined by older cmake
> -+         OR NOT(OPENSSL_VERSION VERSION_LESS "3.0.0"))
> -+        SET(SSL_DEFINES "${SSL_DEFINES} -DOPENSSL_API_COMPAT=0x10100000L")
> -+        SET(CMAKE_REQUIRED_DEFINITIONS -DOPENSSL_API_COMPAT=0x10100000L)
> -+      ENDIF()
> -+
> -       SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
> -       SET(CMAKE_REQUIRED_LIBRARIES ${SSL_LIBRARIES})
> -       SET(CMAKE_REQUIRED_INCLUDES ${OPENSSL_INCLUDE_DIR})
> -@@ -152,6 +159,7 @@ MACRO (MYSQL_CHECK_SSL)
> -                           HAVE_X509_check_host)
> -       SET(CMAKE_REQUIRED_INCLUDES)
> -       SET(CMAKE_REQUIRED_LIBRARIES)
> -+      SET(CMAKE_REQUIRED_DEFINITIONS)
> -     ELSE()
> -       IF(WITH_SSL STREQUAL "system")
> -         MESSAGE(FATAL_ERROR "Cannot find appropriate system libraries for SSL. Use WITH_SSL=bundled to enable SSL support")
> -diff --git a/include/ssl_compat.h b/include/ssl_compat.h
> -index 9f4b6be8d95..affa9f2a448 100644
> ---- a/include/ssl_compat.h
> -+++ b/include/ssl_compat.h
> -@@ -24,7 +24,7 @@
> - #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
> - #define ERR_remove_state(X) ERR_clear_error()
> - #define EVP_CIPHER_CTX_SIZE 176
> --#define EVP_MD_CTX_SIZE 48
> -+#define EVP_MD_CTX_SIZE 72
> - #undef EVP_MD_CTX_init
> - #define EVP_MD_CTX_init(X) do { memset((X), 0, EVP_MD_CTX_SIZE); EVP_MD_CTX_reset(X); } while(0)
> - #undef EVP_CIPHER_CTX_init
> -@@ -74,7 +74,6 @@
> - #endif
> -
> - #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
> --#define EVP_CIPHER_CTX_buf_noconst(ctx) ((ctx)->buf)
> - #define EVP_CIPHER_CTX_encrypting(ctx)  ((ctx)->encrypt)
> - #define EVP_CIPHER_CTX_SIZE             sizeof(EVP_CIPHER_CTX)
> -
> -diff --git a/mysql-test/lib/openssl.cnf b/mysql-test/lib/openssl.cnf
> -index b9ab37ac3a1..7cd6f748af2 100644
> ---- a/mysql-test/lib/openssl.cnf
> -+++ b/mysql-test/lib/openssl.cnf
> -@@ -9,4 +9,4 @@ ssl_conf = ssl_section
> - system_default = system_default_section
> -
> - [system_default_section]
> --CipherString = ALL:@SECLEVEL=1
> -+CipherString = ALL:@SECLEVEL=0
> -diff --git a/mysql-test/main/ssl_cipher.result b/mysql-test/main/ssl_cipher.result
> -index 930d384eda9..66d817b7b41 100644
> ---- a/mysql-test/main/ssl_cipher.result
> -+++ b/mysql-test/main/ssl_cipher.result
> -@@ -61,8 +61,8 @@ connect  ssl_con,localhost,root,,,,,SSL;
> - SHOW STATUS LIKE 'Ssl_cipher';
> - Variable_name Value
> - Ssl_cipher    AES128-SHA
> --SHOW STATUS LIKE 'Ssl_cipher_list';
> --Variable_name Value
> --Ssl_cipher_list       AES128-SHA
> -+SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
> -+VARIABLE_VALUE like '%AES128-SHA%'
> -+1
> - disconnect ssl_con;
> - connection default;
> -diff --git a/mysql-test/main/ssl_cipher.test b/mysql-test/main/ssl_cipher.test
> -index 36549d76d02..d4cdcffb276 100644
> ---- a/mysql-test/main/ssl_cipher.test
> -+++ b/mysql-test/main/ssl_cipher.test
> -@@ -98,6 +98,6 @@ let $restart_parameters=--ssl-cipher=AES128-SHA;
> - source include/restart_mysqld.inc;
> - connect (ssl_con,localhost,root,,,,,SSL);
> - SHOW STATUS LIKE 'Ssl_cipher';
> --SHOW STATUS LIKE 'Ssl_cipher_list';
> -+SELECT VARIABLE_VALUE like '%AES128-SHA%' FROM INFORMATION_SCHEMA.SESSION_STATUS WHERE VARIABLE_NAME='Ssl_cipher_list';
> - disconnect ssl_con;
> - connection default;
> -diff --git a/mysys_ssl/my_crypt.cc b/mysys_ssl/my_crypt.cc
> -index e512eee9066..4d7ebc7bd27 100644
> ---- a/mysys_ssl/my_crypt.cc
> -+++ b/mysys_ssl/my_crypt.cc
> -@@ -29,11 +29,7 @@
> - #include <ssl_compat.h>
> - #include <cstdint>
> -
> --#ifdef HAVE_WOLFSSL
> - #define CTX_ALIGN 16
> --#else
> --#define CTX_ALIGN 0
> --#endif
> -
> - class MyCTX
> - {
> -@@ -100,8 +96,9 @@ class MyCTX_nopad : public MyCTX
> - {
> - public:
> -   const uchar *key;
> --  uint klen, buf_len;
> -+  uint klen, source_tail_len;
> -   uchar oiv[MY_AES_BLOCK_SIZE];
> -+  uchar source_tail[MY_AES_BLOCK_SIZE];
> -
> -   MyCTX_nopad() : MyCTX() { }
> -   ~MyCTX_nopad() { }
> -@@ -112,7 +109,7 @@ class MyCTX_nopad : public MyCTX
> -     compile_time_assert(MY_AES_CTX_SIZE >= sizeof(MyCTX_nopad));
> -     this->key= key;
> -     this->klen= klen;
> --    this->buf_len= 0;
> -+    this->source_tail_len= 0;
> -     if (ivlen)
> -       memcpy(oiv, iv, ivlen);
> -     DBUG_ASSERT(ivlen == 0 || ivlen == sizeof(oiv));
> -@@ -123,26 +120,41 @@ class MyCTX_nopad : public MyCTX
> -     return res;
> -   }
> -
> -+  /** Update last partial source block, stored in source_tail array. */
> -+  void update_source_tail(const uchar* src, uint slen)
> -+  {
> -+    if (!slen)
> -+      return;
> -+    uint new_tail_len= (source_tail_len + slen) % MY_AES_BLOCK_SIZE;
> -+    if (new_tail_len)
> -+    {
> -+      if (slen + source_tail_len < MY_AES_BLOCK_SIZE)
> -+      {
> -+        memcpy(source_tail + source_tail_len, src, slen);
> -+      }
> -+      else
> -+      {
> -+        DBUG_ASSERT(slen > new_tail_len);
> -+        memcpy(source_tail, src + slen - new_tail_len, new_tail_len);
> -+      }
> -+    }
> -+    source_tail_len= new_tail_len;
> -+  }
> -+
> -   int update(const uchar *src, uint slen, uchar *dst, uint *dlen)
> -   {
> --    buf_len+= slen;
> -+    update_source_tail(src, slen);
> -     return MyCTX::update(src, slen, dst, dlen);
> -   }
> -
> -   int finish(uchar *dst, uint *dlen)
> -   {
> --    buf_len %= MY_AES_BLOCK_SIZE;
> --    if (buf_len)
> -+    if (source_tail_len)
> -     {
> --      uchar *buf= EVP_CIPHER_CTX_buf_noconst(ctx);
> -       /*
> -         Not much we can do, block ciphers cannot encrypt data that aren't
> -         a multiple of the block length. At least not without padding.
> -         Let's do something CTR-like for the last partial block.
> --
> --        NOTE this assumes that there are only buf_len bytes in the buf.
> --        If OpenSSL will change that, we'll need to change the implementation
> --        of this class too.
> -       */
> -       uchar mask[MY_AES_BLOCK_SIZE];
> -       uint mlen;
> -@@ -154,10 +166,10 @@ class MyCTX_nopad : public MyCTX
> -         return rc;
> -       DBUG_ASSERT(mlen == sizeof(mask));
> -
> --      for (uint i=0; i < buf_len; i++)
> --        dst[i]= buf[i] ^ mask[i];
> -+      for (uint i=0; i < source_tail_len; i++)
> -+        dst[i]= source_tail[i] ^ mask[i];
> -     }
> --    *dlen= buf_len;
> -+    *dlen= source_tail_len;
> -     return MY_AES_OK;
> -   }
> - };
> -diff --git a/unittest/mysys/aes-t.c b/unittest/mysys/aes-t.c
> -index 34704e06749..cbec2760941 100644
> ---- a/unittest/mysys/aes-t.c
> -+++ b/unittest/mysys/aes-t.c
> -@@ -21,27 +21,96 @@
> - #include <string.h>
> - #include <ctype.h>
> -
> --#define DO_TEST(mode, nopad, slen, fill, dlen, hash)                    \
> --  SKIP_BLOCK_IF(mode == 0xDEADBEAF, nopad ? 4 : 5, #mode " not supported")     \
> --  {                                                                     \
> --    memset(src, fill, src_len= slen);                                   \
> --    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT,              \
> --                    src, src_len, dst, &dst_len,                        \
> --                    key, sizeof(key), iv, sizeof(iv)) == MY_AES_OK,     \
> --      "encrypt " #mode " %u %s", src_len, nopad ? "nopad" : "pad");     \
> --    if (!nopad)                                                         \
> --      ok (dst_len == my_aes_get_size(mode, src_len), "my_aes_get_size");\
> --    my_md5(md5, (char*)dst, dst_len);                                   \
> --    ok(dst_len == dlen && memcmp(md5, hash, sizeof(md5)) == 0, "md5");  \
> --    ok(my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,              \
> --                    dst, dst_len, ddst, &ddst_len,                      \
> --                    key, sizeof(key), iv, sizeof(iv)) == MY_AES_OK,     \
> --       "decrypt " #mode " %u", dst_len);                                \
> --    ok(ddst_len == src_len && memcmp(src, ddst, src_len) == 0, "memcmp"); \
> -+
> -+/** Test streaming encryption, bytewise update.*/
> -+static int aes_crypt_bytewise(enum my_aes_mode mode, int flags, const unsigned char *src,
> -+                 unsigned int slen, unsigned char *dst, unsigned int *dlen,
> -+                 const unsigned char *key, unsigned int klen,
> -+                 const unsigned char *iv, unsigned int ivlen)
> -+{
> -+  /* Allocate context on odd address on stack, in order to
> -+   catch misalignment errors.*/
> -+  void *ctx= (char *)alloca(MY_AES_CTX_SIZE+1)+1;
> -+
> -+  int res1, res2;
> -+  uint d1= 0, d2;
> -+  uint i;
> -+
> -+  if ((res1= my_aes_crypt_init(ctx, mode, flags, key, klen, iv, ivlen)))
> -+    return res1;
> -+  for (i= 0; i < slen; i++)
> -+  {
> -+    uint tmp_d1=0;
> -+    res1= my_aes_crypt_update(ctx, src+i,1, dst, &tmp_d1);
> -+    if (res1)
> -+      return res1;
> -+    d1+= tmp_d1;
> -+    dst+= tmp_d1;
> -+  }
> -+  res2= my_aes_crypt_finish(ctx, dst, &d2);
> -+  *dlen= d1 + d2;
> -+  return res1 ? res1 : res2;
> -+}
> -+
> -+
> -+#ifndef HAVE_EncryptAes128Ctr
> -+const uint MY_AES_CTR=0xDEADBEAF;
> -+#endif
> -+#ifndef HAVE_EncryptAes128Gcm
> -+const uint MY_AES_GCM=0xDEADBEAF;
> -+#endif
> -+
> -+#define MY_AES_UNSUPPORTED(x)  (x == 0xDEADBEAF)
> -+
> -+static void do_test(uint mode, const char *mode_str, int nopad, uint slen,
> -+                    char fill, size_t dlen, const char *hash)
> -+{
> -+  uchar key[16]= {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6};
> -+  uchar iv[16]= {2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7};
> -+  uchar src[1000], dst[1100], dst2[1100], ddst[1000];
> -+  uchar md5[MY_MD5_HASH_SIZE];
> -+  uint src_len, dst_len, dst_len2, ddst_len;
> -+  int result;
> -+
> -+  if (MY_AES_UNSUPPORTED(mode))
> -+  {
> -+    skip(nopad?7:6, "%s not supported", mode_str);
> -+    return;
> -+  }
> -+  memset(src, fill, src_len= slen);
> -+  result= my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_ENCRYPT, src, src_len,
> -+                       dst, &dst_len, key, sizeof(key), iv, sizeof(iv));
> -+  ok(result == MY_AES_OK, "encrypt %s %u %s", mode_str, src_len,
> -+     nopad ? "nopad" : "pad");
> -+
> -+  if (nopad)
> -+  {
> -+    result= aes_crypt_bytewise(mode, nopad | ENCRYPTION_FLAG_ENCRYPT, src,
> -+                                src_len, dst2, &dst_len2, key, sizeof(key),
> -+                                iv, sizeof(iv));
> -+    ok(result == MY_AES_OK, "encrypt bytewise %s %u", mode_str, src_len);
> -+    /* Compare with non-bytewise encryption result*/
> -+    ok(dst_len == dst_len2 && memcmp(dst, dst2, dst_len) == 0,
> -+       "memcmp bytewise  %s %u", mode_str, src_len);
> -+  }
> -+  else
> -+  {
> -+    int dst_len_real= my_aes_get_size(mode, src_len);
> -+    ok(dst_len_real= dst_len, "my_aes_get_size");
> -   }
> -+  my_md5(md5, (char *) dst, dst_len);
> -+  ok(dst_len == dlen, "md5 len");
> -+  ok(memcmp(md5, hash, sizeof(md5)) == 0, "md5");
> -+  result= my_aes_crypt(mode, nopad | ENCRYPTION_FLAG_DECRYPT,
> -+                       dst, dst_len, ddst, &ddst_len, key, sizeof(key), iv,
> -+                       sizeof(iv));
> -+
> -+  ok(result == MY_AES_OK, "decrypt %s %u", mode_str, dst_len);
> -+  ok(ddst_len == src_len && memcmp(src, ddst, src_len) == 0, "memcmp");
> -+}
> -
> --#define DO_TEST_P(M,S,F,D,H) DO_TEST(M,0,S,F,D,H)
> --#define DO_TEST_N(M,S,F,D,H) DO_TEST(M,ENCRYPTION_FLAG_NOPAD,S,F,D,H)
> -+#define DO_TEST_P(M, S, F, D, H) do_test(M, #M, 0, S, F, D, H)
> -+#define DO_TEST_N(M, S, F, D, H) do_test(M, #M, ENCRYPTION_FLAG_NOPAD, S, F, D, H)
> -
> - /* useful macro for debugging */
> - #define PRINT_MD5()                                     \
> -@@ -53,25 +122,15 @@
> -     printf("\"\n");                                     \
> -   } while(0);
> -
> --#ifndef HAVE_EncryptAes128Ctr
> --const uint MY_AES_CTR=0xDEADBEAF;
> --#endif
> --#ifndef HAVE_EncryptAes128Gcm
> --const uint MY_AES_GCM=0xDEADBEAF;
> --#endif
> -
> - int
> - main(int argc __attribute__((unused)),char *argv[])
> - {
> --  uchar key[16]= {1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6};
> --  uchar iv[16]=  {2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7};
> --  uchar src[1000], dst[1100], ddst[1000];
> --  uchar md5[MY_MD5_HASH_SIZE];
> --  uint src_len, dst_len, ddst_len;
> -
> -   MY_INIT(argv[0]);
> -
> --  plan(87);
> -+  plan(122);
> -+
> -   DO_TEST_P(MY_AES_ECB, 200, '.', 208, "\xd8\x73\x8e\x3a\xbc\x66\x99\x13\x7f\x90\x23\x52\xee\x97\x6f\x9a");
> -   DO_TEST_P(MY_AES_ECB, 128, '?', 144, "\x19\x58\x33\x85\x4c\xaa\x7f\x06\xd1\xb2\xec\xd7\xb7\x6a\xa9\x5b");
> -   DO_TEST_P(MY_AES_CBC, 159, '%', 160, "\x4b\x03\x18\x3d\xf1\xa7\xcd\xa1\x46\xb3\xc6\x8a\x92\xc0\x0f\xc9");
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> deleted file mode 100644
> index 1c76ab391..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Vicen=C8=9Biu=20Ciorbaru?= <vicentiu@mariadb.org>
> -Date: Thu, 23 Jul 2020 00:02:21 -0700
> -Subject: [PATCH] Link with libatomic to enable C11 atomics support
> -
> -   Some architectures (mips) require libatomic to support proper
> -   atomic operations. Check first if support is available without
> -   linking, otherwise use the library.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - configure.cmake      | 20 +++++++++++++++++++-
> - mysys/CMakeLists.txt |  4 ++++
> - sql/CMakeLists.txt   |  4 ++++
> - 3 files changed, 27 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.cmake b/configure.cmake
> -index 4fc324a9..23a2ea91 100644
> ---- a/configure.cmake
> -+++ b/configure.cmake
> -@@ -862,7 +862,25 @@ int main()
> -   long long int *ptr= &var;
> -   return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
> - }"
> --HAVE_GCC_C11_ATOMICS)
> -+HAVE_GCC_C11_ATOMICS_WITHOUT_LIBATOMIC)
> -+IF (HAVE_GCC_C11_ATOMICS_WITHOUT_LIBATOMIC)
> -+  SET(HAVE_GCC_C11_ATOMICS True)
> -+ELSE()
> -+  SET(OLD_CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES})
> -+  LIST(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")
> -+  CHECK_CXX_SOURCE_COMPILES("
> -+  int main()
> -+  {
> -+    long long int var= 1;
> -+    long long int *ptr= &var;
> -+    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
> -+  }"
> -+  HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+  IF(HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+    SET(HAVE_GCC_C11_ATOMICS True)
> -+  ENDIF()
> -+  SET(CMAKE_REQUIRED_LIBRARIES ${OLD_CMAKE_REQUIRED_LIBRARIES})
> -+ENDIF()
> -
> - IF(WITH_VALGRIND)
> -   SET(HAVE_valgrind 1)
> -diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
> -index 6aab788f..91b9c393 100644
> ---- a/mysys/CMakeLists.txt
> -+++ b/mysys/CMakeLists.txt
> -@@ -154,6 +154,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
> -  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
> - DTRACE_INSTRUMENT(mysys)
> -
> -+IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+  TARGET_LINK_LIBRARIES(mysys atomic)
> -+ENDIF()
> -+
> - IF(HAVE_BFD_H)
> -   TARGET_LINK_LIBRARIES(mysys bfd)
> - ENDIF(HAVE_BFD_H)
> -diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> -index b9cd418f..d42e5017 100644
> ---- a/sql/CMakeLists.txt
> -+++ b/sql/CMakeLists.txt
> -@@ -222,6 +222,10 @@ ELSE()
> -   SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
> - ENDIF()
> -
> -+IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+  TARGET_LINK_LIBRARIES(sql atomic)
> -+ENDIF()
> -+
> - IF(MSVC OR CMAKE_SYSTEM_NAME MATCHES AIX)
> -   SET(libs_to_export_symbols sql mysys dbug strings)
> -   # Create shared library of already compiled object
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.6.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
> similarity index 91%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.6.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
> index 04dfb4223..16ecb0493 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.6.4.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
> @@ -2,7 +2,8 @@ require mariadb.inc
>
>  inherit qemu
>
> -DEPENDS += "qemu-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
> +DEPENDS += "qemu-native bison-native boost libpcre2 curl openssl ncurses \
> +            zlib libaio libedit libevent libxml2 gnutls fmt"
>
>  PROVIDES += "mysql5 libmysqlclient"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96125): https://lists.openembedded.org/g/openembedded-devel/message/96125
> Mute This Topic: https://lists.openembedded.org/mt/89946308/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

