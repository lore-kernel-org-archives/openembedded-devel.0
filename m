Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.13729.1595946697724458798
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 07:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iHBUQR+/;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id mt12so4263075pjb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=OvTfMwbTbmBxSbc1Zc/DcSANspvsIvaESrwy1Yhg+TA=;
        b=iHBUQR+/L49tPjcf/SgsFupRrND8soMu6gm5rO6HVPlxRWvhd0fq+sg2aEDe1/WPLG
         0nSAkXRFufahWkIeLnedcR2y+PqJt/YsKtywMcqnyhEIhN86CRW6zibYSzIxBNbdPfeE
         6yjMncZ0V5+GIf0WRF92jkcSpmiLyxTqmtvPSYieS2fwkYRL4i8q/GfPnYE8IgbVRHNL
         o9j5AUJ+wOm2cIKPxaR4R7Mkww90lNdi13Yxe4mKyzy2W4P+x0z5UI2eRvLCSbZnfGgL
         RW74MLtcQP8l2tYnAMiN9W/pzK8apAzphtfYY2slUbAwIaiN31gXhSQUllBG17K2QHbr
         shDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=OvTfMwbTbmBxSbc1Zc/DcSANspvsIvaESrwy1Yhg+TA=;
        b=cw6LhxsdesBQBnbt0pFfg8ojoJ0A6FAH5iZa0htAsDYkCDJi4O4IAAVSbimTPCs6h4
         PlY/VyyaCLccESQKhmDEqWHUGlCsqthz5JMtJrsORvSxrgTGT7aqlunHpK2abD2FGGBC
         r3LVSykH5n5BXR4PHsCduYXyDSg0Gz3qZYyTUSRMrDa7j8qx4uWtUFrM2eXk7t0SqU9J
         c9Zdr12KC001/uvIAWcQGbx72eSntmco4kY+BYnEhx83Z0ieqUTqRlzP7HzwoUJNP4K8
         f+R498u6PWUyAT15HQW9YZEWy+yYqXWZwpTmbxIN3SqTMfNxU+irtQAx4ot2PIMuMe35
         Ckyw==
X-Gm-Message-State: AOAM530vOxzzyR7sSECxNB+9JcLbN+NC03XoIZUofD8npxOucL6cXOAZ
	nzUnIqspwr9iM5p730ONSNjdqer1KGw=
X-Google-Smtp-Source: ABdhPJxd75//q7ZFIvtv2HMq9s1/PMHAFiuIextxtGDTPJ56Pm4ByJIKkzJjIVggbGSS+LhEN0VDyA==
X-Received: by 2002:a17:90a:3d49:: with SMTP id o9mr5181163pjf.156.1595946693742;
        Tue, 28 Jul 2020 07:31:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8df1:f28:d14a:8296? ([2601:202:4180:a5c0:8df1:f28:d14a:8296])
        by smtp.gmail.com with ESMTPSA id z20sm3226506pjr.43.2020.07.28.07.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 07:31:32 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v3] mariadb: upgrade to 10.5.4
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <CAMKF1srMOdhSyWxhBxDKSkaUfTUzfeDA6m=2SB-LttecR6xs-A@mail.gmail.com>
 <20200728083603.75632-1-mingli.yu@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <a1f87e75-190a-f400-ccae-f9140cfd4172@gmail.com>
Date: Tue, 28 Jul 2020 07:31:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728083603.75632-1-mingli.yu@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------CFDFB80DF50D295063CDDA18"
Content-Language: en-US

--------------CFDFB80DF50D295063CDDA18
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Mingli,


On 7/28/20 1:36 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Remove one backported patch
> * Remove SRC_URI[md5sum]
> * Rebase two patches to fix fuzz warnings
> * Add curl depends to fix below error:
>   | ./mariadb-10.5.4/storage/maria/libmarias3/libmarias3/marias3.h:26:10: fatal error: curl/curl.h: No such file or directory
>
> * update the pam_user_map.so install logic as below commit introduced in this new
>   mariadb version
>   236aed3f5f0 MDEV-21656: Wrong directory for pam_user_map.so JIRA:https://jira.mariadb.org/browse/MDEV-17292
>
> * Backport a patch to fix the undefined reference to `crc32c_arm64' on arm64

What are the difference between the patch versions?
-armin

>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ve_10.4.12.bb => mariadb-native_10.5.4.bb} |  0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         | 13 +++--
>  ...-breakage-from-lock_guard-error-6161.patch | 32 -------------
>  ...DB-undefined-reference-to-crc32c_arm.patch | 48 +++++++++++++++++++
>  .../mysql/mariadb/c11_atomics.patch           | 37 +++++++++-----
>  ...Lists.txt-fix-gen_lex_hash-not-found.patch | 26 +++++-----
>  .../{mariadb_10.4.12.bb => mariadb_10.5.4.bb} |  2 +-
>  7 files changed, 97 insertions(+), 61 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb => mariadb-native_10.5.4.bb} (100%)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb => mariadb_10.5.4.bb} (87%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 95f5acba1..58f573e5e 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -18,11 +18,10 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>             file://c11_atomics.patch \
>             file://clang_version_header_conflict.patch \
>             file://fix-arm-atomic.patch \
> -           file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
>             file://0001-Fix-library-LZ4-lookup.patch \
> +           file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch \
>            "
> -SRC_URI[md5sum] = "97d7c0f508c04a31c138fdb24e95dbc4"
> -SRC_URI[sha256sum] = "fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb69434fcde735aa208"
> +SRC_URI[sha256sum] = "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf110359f4f68b37154c72"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>  
> @@ -169,8 +168,12 @@ do_install() {
>          mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
>      fi
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
> -        mv ${D}/lib/security ${D}/${libdir}
> -        rmdir --ignore-fail-on-non-empty ${D}/lib
> +        pam_so=$(find ${D} -name pam_user_map.so)
> +        if [ x"${pam_so}" != x ]; then
> +            pam_dir=$(dirname ${pam_so})
> +            mv ${pam_dir} ${D}/${libdir}
> +            rmdir --ignore-fail-on-non-empty ${pam_dir%security}
> +        fi
>      fi
>  }
>  
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
> deleted file mode 100644
> index 87c70617a..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
> -
> -Summary:
> -This change fixes a source issue that caused compile time error which
> -breaks build for many fbcode services in that setup. The size() member
> -function of channel is a const member, so member variables accessed
> -within it are implicitly const as well. This caused error when clang
> -fails to resolve to a constructor that takes std::mutex because the
> -suitable constructor got rejected due to loss of constness for its
> -argument. The fix is to add mutable modifier to the lock_ member of
> -channel.
> -
> -Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
> -
> -Differential Revision: D18967685
> -
> -Pulled By: maysamyabandeh
> -
> -Upstream-Status: Backport
> -
> -fbshipit-source-id:698b6a5153c3c92eeacb842c467aa28cc350d432 
> ---- a/storage/rocksdb/rocksdb/util/channel.h
> -+++ b/storage/rocksdb/rocksdb/util/channel.h
> -@@ -60,7 +60,7 @@ class channel {
> - 
> -  private:
> -   std::condition_variable cv_;
> --  std::mutex lock_;
> -+  mutable std::mutex lock_;
> -   std::queue<T> buffer_;
> -   bool eof_;
> - };
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
> new file mode 100644
> index 000000000..1856c1af7
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
> @@ -0,0 +1,48 @@
> +From d88ea260882ca414e940cd6af225617f00503f71 Mon Sep 17 00:00:00 2001
> +From: Krunal Bauskar <krunalbauskar@gmail.com>
> +Date: Mon, 27 Jul 2020 18:38:10 +0800
> +Subject: [PATCH] MDEV-23137: RocksDB: undefined reference to crc32c_arm64
> +
> +RocksDB fails to build on arm64: undefined reference to
> +            `crc32c_arm64(unsigned int, unsigned char const*, unsigned int)'
> +
> +MariaDB uses storage/rocksdb/build_rocksdb.cmake to compile RocksDB.
> +Said cmake missed adding crc32c_arm64 compilation target so if
> +machine native architecture supported crc32 then complier would enable
> +usage of function defined in crc32c_arm64 causing the listed error.
> +
> +Added crc32c_arm64 complition target.
> +
> +closes #1642
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + storage/rocksdb/build_rocksdb.cmake | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
> +index 3f3dca7e990..7d2252c5f77 100644
> +--- a/storage/rocksdb/build_rocksdb.cmake
> ++++ b/storage/rocksdb/build_rocksdb.cmake
> +@@ -442,6 +442,16 @@ else()
> +       util/crc32c_ppc.c
> +       util/crc32c_ppc_asm.S)
> +   endif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
> ++  # aarch
> ++  if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
> ++    CHECK_CXX_COMPILER_FLAG("-march=armv8-a+crc+crypto" HAS_ARMV8_CRC)
> ++    if(HAS_ARMV8_CRC)
> ++      message(STATUS " HAS_ARMV8_CRC yes")
> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+crc+crypto -Wno-unused-function")
> ++      list(APPEND ROCKSDB_SOURCES
> ++        util/crc32c_arm64.cc)
> ++    endif(HAS_ARMV8_CRC)
> ++  endif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
> + endif()
> + SET(SOURCES)
> + FOREACH(s ${ROCKSDB_SOURCES})
> +-- 
> +2.17.1
> +
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> index 169986130..36217f9aa 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> @@ -1,7 +1,7 @@
> -Author: Vicențiu Ciorbaru <vicentiu@mariadb.org>
> -Date:   Fri Dec 21 19:14:04 2018 +0200
> -
> -   Link with libatomic to enable C11 atomics support
> +From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Vicen=C8=9Biu=20Ciorbaru?= <vicentiu@mariadb.org>
> +Date: Thu, 23 Jul 2020 00:02:21 -0700
> +Subject: [PATCH] Link with libatomic to enable C11 atomics support
>  
>     Some architectures (mips) require libatomic to support proper
>     atomic operations. Check first if support is available without
> @@ -9,10 +9,18 @@ Date:   Fri Dec 21 19:14:04 2018 +0200
>  
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + configure.cmake      | 20 +++++++++++++++++++-
> + mysys/CMakeLists.txt |  4 ++++
> + sql/CMakeLists.txt   |  4 ++++
> + 3 files changed, 27 insertions(+), 1 deletion(-)
>  
> +diff --git a/configure.cmake b/configure.cmake
> +index a355214..6ee595f 100644
>  --- a/configure.cmake
>  +++ b/configure.cmake
> -@@ -926,7 +926,25 @@ int main()
> +@@ -865,7 +865,25 @@ int main()
>     long long int *ptr= &var;
>     return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
>   }"
> @@ -39,10 +47,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   IF(WITH_VALGRIND)
>     SET(HAVE_valgrind 1)
> +diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
> +index 3d8a20e..42f1441 100644
>  --- a/mysys/CMakeLists.txt
>  +++ b/mysys/CMakeLists.txt
> -@@ -78,6 +78,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings
> -  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO} ${CRC32_LIBRARY})
> +@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
> +  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
>   DTRACE_INSTRUMENT(mysys)
>   
>  +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> @@ -52,9 +62,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   IF(HAVE_BFD_H)
>     TARGET_LINK_LIBRARIES(mysys bfd)  
>   ENDIF(HAVE_BFD_H)
> +diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> +index 616017b..53575f6 100644
>  --- a/sql/CMakeLists.txt
>  +++ b/sql/CMakeLists.txt
> -@@ -178,6 +178,10 @@ ELSE()
> +@@ -219,6 +219,10 @@ ELSE()
>     SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
>   ENDIF()
>   
> @@ -62,6 +74,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +  TARGET_LINK_LIBRARIES(sql atomic)
>  +ENDIF()
>  +
> - 
> - IF(MSVC AND NOT WITHOUT_DYNAMIC_PLUGINS)
> - 
> + IF(MSVC)
> +   SET(libs_to_export_symbols sql mysys dbug strings)
> +   # Create shared library of already compiled object
> +-- 
> +2.17.1
> +
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> index afc1be47b..4cb044339 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> @@ -1,6 +1,6 @@
> -From 796464015bffe6e0beca9e1c355b223512803c3e Mon Sep 17 00:00:00 2001
> +From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Wed, 27 Feb 2019 23:01:00 -0800
> +Date: Thu, 23 Jul 2020 00:08:16 -0700
>  Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>  
>  Fix the below do_compile issue in cross-compiling env.
> @@ -10,18 +10,17 @@ Fix the below do_compile issue in cross-compiling env.
>  Upstream-Status: Inappropriate [oe build specific]
>  
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> -
>  ---
>   sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
>   1 file changed, 20 insertions(+), 10 deletions(-)
>  
>  diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> -index c6910f46..bf51f4cb 100644
> +index 0dc3caa..616017b 100644
>  --- a/sql/CMakeLists.txt
>  +++ b/sql/CMakeLists.txt
> -@@ -50,11 +50,16 @@ ${WSREP_INCLUDES}
> - 
> - 
> +@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
> + ${CMAKE_SOURCE_DIR}/tpool
> + )
>   
>  -ADD_CUSTOM_COMMAND(
>  -  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> @@ -39,9 +38,9 @@ index c6910f46..bf51f4cb 100644
>  +   COMMAND gen_lex_token > lex_token.h)
>  +ENDIF()
>   
> - ADD_DEFINITIONS(-DMYSQL_SERVER -DHAVE_EVENT_SCHEDULER)
> - 
> -@@ -370,11 +375,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
> + ADD_CUSTOM_COMMAND(
> +   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
> +@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
>     ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>   ENDIF()
>   
> @@ -61,5 +60,8 @@ index c6910f46..bf51f4cb 100644
>  +   COMMAND gen_lex_hash > lex_hash.h)
>  +ENDIF()
>   
> - MYSQL_ADD_EXECUTABLE(mysql_tzinfo_to_sql tztime.cc COMPONENT Server)
> - SET_TARGET_PROPERTIES(mysql_tzinfo_to_sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
> + MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Server)
> + SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
> +-- 
> +2.17.1
> +
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
> similarity index 87%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
> index c0b53379d..220b904b2 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
> @@ -2,7 +2,7 @@ require mariadb.inc
>  
>  EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
>  
> -DEPENDS += "mariadb-native bison-native openssl ncurses zlib libaio libedit libevent libxml2"
> +DEPENDS += "mariadb-native bison-native curl openssl ncurses zlib libaio libedit libevent libxml2"
>  
>  PROVIDES += "mysql5 libmysqlclient"
>  
>
> 


--------------CFDFB80DF50D295063CDDA18
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Mingli,<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/28/20 1:36 AM, Yu, Mingli wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200728083603.75632-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

* Remove one backported patch
* Remove SRC_URI[md5sum]
* Rebase two patches to fix fuzz warnings
* Add curl depends to fix below error:
  | ./mariadb-10.5.4/storage/maria/libmarias3/libmarias3/marias3.h:26:10: fatal error: curl/curl.h: No such file or directory

* update the pam_user_map.so install logic as below commit introduced in this new
  mariadb version
  236aed3f5f0 MDEV-21656: Wrong directory for pam_user_map.so JIRA:<a class="moz-txt-link-freetext" href="https://jira.mariadb.org/browse/MDEV-17292">https://jira.mariadb.org/browse/MDEV-17292</a>

* Backport a patch to fix the undefined reference to `crc32c_arm64' on arm64</pre>
    </blockquote>
    <br>
    What are the difference between the patch versions?<br>
    -armin<br>
    <br>
    <blockquote type="cite"
      cite="mid:20200728083603.75632-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 ...ve_10.4.12.bb =&gt; mariadb-native_10.5.4.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         | 13 +++--
 ...-breakage-from-lock_guard-error-6161.patch | 32 -------------
 ...DB-undefined-reference-to-crc32c_arm.patch | 48 +++++++++++++++++++
 .../mysql/mariadb/c11_atomics.patch           | 37 +++++++++-----
 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 26 +++++-----
 .../{mariadb_10.4.12.bb =&gt; mariadb_10.5.4.bb} |  2 +-
 7 files changed, 97 insertions(+), 61 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb =&gt; mariadb-native_10.5.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb =&gt; mariadb_10.5.4.bb} (87%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 95f5acba1..58f573e5e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,11 +18,10 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gzfile://c11_atomics.patch\file://clang_version_header_conflict.patch\file://fix-arm-atomic.patch\-file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch\file://0001-Fix-library-LZ4-lookup.patch\+file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch\">"https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
-           file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
+           file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch \
           "</a>
-SRC_URI[md5sum] = "97d7c0f508c04a31c138fdb24e95dbc4"
-SRC_URI[sha256sum] = "fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb69434fcde735aa208"
+SRC_URI[sha256sum] = "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf110359f4f68b37154c72"
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/MariaDB/server/releases">"https://github.com/MariaDB/server/releases"</a>
 
@@ -169,8 +168,12 @@ do_install() {
         mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
-        mv ${D}/lib/security ${D}/${libdir}
-        rmdir --ignore-fail-on-non-empty ${D}/lib
+        pam_so=$(find ${D} -name pam_user_map.so)
+        if [ x"${pam_so}" != x ]; then
+            pam_dir=$(dirname ${pam_so})
+            mv ${pam_dir} ${D}/${libdir}
+            rmdir --ignore-fail-on-non-empty ${pam_dir%security}
+        fi
     fi
 }
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
deleted file mode 100644
index 87c70617a..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
-
-Summary:
-This change fixes a source issue that caused compile time error which
-breaks build for many fbcode services in that setup. The size() member
-function of channel is a const member, so member variables accessed
-within it are implicitly const as well. This caused error when clang
-fails to resolve to a constructor that takes std::mutex because the
-suitable constructor got rejected due to loss of constness for its
-argument. The fix is to add mutable modifier to the lock_ member of
-channel.
-
-Pull Request resolved: <a class="moz-txt-link-freetext" href="https://github.com/facebook/rocksdb/pull/6161">https://github.com/facebook/rocksdb/pull/6161</a>
-
-Differential Revision: D18967685
-
-Pulled By: maysamyabandeh
-
-Upstream-Status: Backport
-
-fbshipit-source-id:698b6a5153c3c92eeacb842c467aa28cc350d432 
---- a/storage/rocksdb/rocksdb/util/channel.h
-+++ b/storage/rocksdb/rocksdb/util/channel.h
-@@ -60,7 +60,7 @@ class channel {
- 
-  private:
-   std::condition_variable cv_;
--  std::mutex lock_;
-+  mutable std::mutex lock_;
-   std::queue&lt;T&gt; buffer_;
-   bool eof_;
- };
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
new file mode 100644
index 000000000..1856c1af7
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
@@ -0,0 +1,48 @@
+From d88ea260882ca414e940cd6af225617f00503f71 Mon Sep 17 00:00:00 2001
+From: Krunal Bauskar <a class="moz-txt-link-rfc2396E" href="mailto:krunalbauskar@gmail.com">&lt;krunalbauskar@gmail.com&gt;</a>
+Date: Mon, 27 Jul 2020 18:38:10 +0800
+Subject: [PATCH] MDEV-23137: RocksDB: undefined reference to crc32c_arm64
+
+RocksDB fails to build on arm64: undefined reference to
+            `crc32c_arm64(unsigned int, unsigned char const*, unsigned int)'
+
+MariaDB uses storage/rocksdb/build_rocksdb.cmake to compile RocksDB.
+Said cmake missed adding crc32c_arm64 compilation target so if
+machine native architecture supported crc32 then complier would enable
+usage of function defined in crc32c_arm64 causing the listed error.
+
+Added crc32c_arm64 complition target.
+
+closes #1642
+
+Upstream-Status: Backport
+
+Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ storage/rocksdb/build_rocksdb.cmake | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
+index 3f3dca7e990..7d2252c5f77 100644
+--- a/storage/rocksdb/build_rocksdb.cmake
++++ b/storage/rocksdb/build_rocksdb.cmake
+@@ -442,6 +442,16 @@ else()
+       util/crc32c_ppc.c
+       util/crc32c_ppc_asm.S)
+   endif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
++  # aarch
++  if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
++    CHECK_CXX_COMPILER_FLAG("-march=armv8-a+crc+crypto" HAS_ARMV8_CRC)
++    if(HAS_ARMV8_CRC)
++      message(STATUS " HAS_ARMV8_CRC yes")
++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+crc+crypto -Wno-unused-function")
++      list(APPEND ROCKSDB_SOURCES
++        util/crc32c_arm64.cc)
++    endif(HAS_ARMV8_CRC)
++  endif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
+ endif()
+ SET(SOURCES)
+ FOREACH(s ${ROCKSDB_SOURCES})
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
index 169986130..36217f9aa 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
@@ -1,7 +1,7 @@
-Author: Vicențiu Ciorbaru <a class="moz-txt-link-rfc2396E" href="mailto:vicentiu@mariadb.org">&lt;vicentiu@mariadb.org&gt;</a>
-Date:   Fri Dec 21 19:14:04 2018 +0200
-
-   Link with libatomic to enable C11 atomics support
+From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vicen=C8=9Biu=20Ciorbaru?= <a class="moz-txt-link-rfc2396E" href="mailto:vicentiu@mariadb.org">&lt;vicentiu@mariadb.org&gt;</a>
+Date: Thu, 23 Jul 2020 00:02:21 -0700
+Subject: [PATCH] Link with libatomic to enable C11 atomics support
 
    Some architectures (mips) require libatomic to support proper
    atomic operations. Check first if support is available without
@@ -9,10 +9,18 @@ Date:   Fri Dec 21 19:14:04 2018 +0200
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
+---
+ configure.cmake      | 20 +++++++++++++++++++-
+ mysys/CMakeLists.txt |  4 ++++
+ sql/CMakeLists.txt   |  4 ++++
+ 3 files changed, 27 insertions(+), 1 deletion(-)
 
+diff --git a/configure.cmake b/configure.cmake
+index a355214..6ee595f 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -926,7 +926,25 @@ int main()
+@@ -865,7 +865,25 @@ int main()
    long long int *ptr= &amp;var;
    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
  }"
@@ -39,10 +47,12 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
+diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
+index 3d8a20e..42f1441 100644
 --- a/mysys/CMakeLists.txt
 +++ b/mysys/CMakeLists.txt
-@@ -78,6 +78,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings
-  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO} ${CRC32_LIBRARY})
+@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
+  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
  DTRACE_INSTRUMENT(mysys)
  
 +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
@@ -52,9 +62,11 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
  IF(HAVE_BFD_H)
    TARGET_LINK_LIBRARIES(mysys bfd)  
  ENDIF(HAVE_BFD_H)
+diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
+index 616017b..53575f6 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -178,6 +178,10 @@ ELSE()
+@@ -219,6 +219,10 @@ ELSE()
    SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
  ENDIF()
  
@@ -62,6 +74,9 @@ Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 +  TARGET_LINK_LIBRARIES(sql atomic)
 +ENDIF()
 +
- 
- IF(MSVC AND NOT WITHOUT_DYNAMIC_PLUGINS)
- 
+ IF(MSVC)
+   SET(libs_to_export_symbols sql mysys dbug strings)
+   # Create shared library of already compiled object
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
index afc1be47b..4cb044339 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -1,6 +1,6 @@
-From 796464015bffe6e0beca9e1c355b223512803c3e Mon Sep 17 00:00:00 2001
+From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
-Date: Wed, 27 Feb 2019 23:01:00 -0800
+Date: Thu, 23 Jul 2020 00:08:16 -0700
 Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
 
 Fix the below do_compile issue in cross-compiling env.
@@ -10,18 +10,17 @@ Fix the below do_compile issue in cross-compiling env.
 Upstream-Status: Inappropriate [oe build specific]
 
 Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
-
 ---
  sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
  1 file changed, 20 insertions(+), 10 deletions(-)
 
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index c6910f46..bf51f4cb 100644
+index 0dc3caa..616017b 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -50,11 +50,16 @@ ${WSREP_INCLUDES}
- 
- 
+@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
+ ${CMAKE_SOURCE_DIR}/tpool
+ )
  
 -ADD_CUSTOM_COMMAND(
 -  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
@@ -39,9 +38,9 @@ index c6910f46..bf51f4cb 100644
 +   COMMAND gen_lex_token &gt; lex_token.h)
 +ENDIF()
  
- ADD_DEFINITIONS(-DMYSQL_SERVER -DHAVE_EVENT_SCHEDULER)
- 
-@@ -370,11 +375,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
+ ADD_CUSTOM_COMMAND(
+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
+@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
  
@@ -61,5 +60,8 @@ index c6910f46..bf51f4cb 100644
 +   COMMAND gen_lex_hash &gt; lex_hash.h)
 +ENDIF()
  
- MYSQL_ADD_EXECUTABLE(mysql_tzinfo_to_sql tztime.cc COMPONENT Server)
- SET_TARGET_PROPERTIES(mysql_tzinfo_to_sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
+ MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Server)
+ SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
similarity index 87%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
index c0b53379d..220b904b2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native bison-native openssl ncurses zlib libaio libedit libevent libxml2"
+DEPENDS += "mariadb-native bison-native curl openssl ncurses zlib libaio libedit libevent libxml2"
 
 PROVIDES += "mysql5 libmysqlclient"
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CFDFB80DF50D295063CDDA18--
