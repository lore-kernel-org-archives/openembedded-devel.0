Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.21114.1617388606820377074
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 11:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qRYr8Ecv;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id w10so2455605pgh.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Apr 2021 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/GjYQnqKuy0SVmu2snRSunAbW9zfCjPzuxRmD+JO02Y=;
        b=qRYr8EcvYzozzsZfDAWhVDJJ7g1mSHvjhKvc/sarX7WLGkypRNjt0L0G720P3OLIgz
         /D9/WLcVxi4IuEXoW2rRXjc3OMJYv37LGHsW/3JOwtve5JwDMTTv5ZXAol1PxBlueGyQ
         fKHb2rdP1RwHrZdu2+nF12I/sSVNXPtRk/kS04VApZW+zKbxGZFx18DNsm5LqChCUKcs
         wR39OoZ02KIGlli4uvvB6XNDyWSfNkZJd8McGO/yHAc82q958VwIJHfkj3GJsKpGLHpY
         hnc1R72a3MetsG2ucJ3GqYCo11mMsc5KpFC/prWc37n5oIvMZwsVYElmERhqUrmTe8xa
         B23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/GjYQnqKuy0SVmu2snRSunAbW9zfCjPzuxRmD+JO02Y=;
        b=MhLb8g98t+4Frf5LNv1wt4zmFkVIZZyc4ZEWVlvDYr96fmxBSGFifyMfBdkiCpEdEK
         kf0UjgcvhNEBneDEk36JNs7X/80F3ysaDR8J7b7YdOTChh52a/Z68tQeppTK+RbQemoU
         SHfq9zJtQVapk6lYhVtJKf4D+t1QTB3KoVVQ6+/jhFX9VkYaYZc+o7Vd762y3ewwdbQh
         oRDMcj6M/Y64gzOJDkillnfihWWzSC2FKTlNjE5x9RBBC1TNQTSd6X6/0dixzZKD+Zv+
         vsfywGLOP0DlkuJlS3h/vBgWPb5gnel3GQDGY2USS0sb8Gy9XDGdLfc3g7D2fQ5OiJ0j
         yT+g==
X-Gm-Message-State: AOAM531eZagYFNa370KHI8W4LbqXEkot6rwE9yJP2k3fMJCoyF0O5Bcv
	7BBrpOH4qnriw9zNsKVS/nzKdjOMN/5fFg==
X-Google-Smtp-Source: ABdhPJxucFLFWBwmRMg0tnyGbuxqqv9JETXopA5fC6WJKOyXHwnoC2+GdSz7qU4qhlMQs7ajLsZw5A==
X-Received: by 2002:a63:fc59:: with SMTP id r25mr12837061pgk.305.1617388605976;
        Fri, 02 Apr 2021 11:36:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:8564:e4a5:b7a6:9dee? ([2601:646:9200:a0f0:8564:e4a5:b7a6:9dee])
        by smtp.gmail.com with ESMTPSA id y66sm8685309pgb.78.2021.04.02.11.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 11:36:45 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] mariadb: upgrade 10.5.8 -> 10.5.9
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1617321042-66190-1-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3c266a67-d74d-8fc1-477b-c16ff4bdb7f3@gmail.com>
Date: Fri, 2 Apr 2021 11:36:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617321042-66190-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

This fails to build on riscv32 [1], I am still going to accept this 
patch but perhaps a followup to not use__NR_io_getevents  might be good 
help see [2]

[1] https://errors.yoctoproject.org/Errors/Details/575300/
[2] https://github.com/smuellerDD/libkcapi/pull/100


On 4/1/21 4:50 PM, wangmy wrote:
> refresh c11_atomics.patch
> remove 0001-stacktrace-t.c-make-the-test-conditional.patch since it is
> included in 10.5.9
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   ...ive_10.5.8.bb => mariadb-native_10.5.9.bb} |  0
>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
>   ...ktrace-t.c-make-the-test-conditional.patch | 38 -------------------
>   .../mysql/mariadb/c11_atomics.patch           | 16 ++++----
>   .../{mariadb_10.5.8.bb => mariadb_10.5.9.bb}  |  0
>   5 files changed, 9 insertions(+), 48 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.8.bb => mariadb-native_10.5.9.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.8.bb => mariadb_10.5.9.bb} (100%)
> 
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 1fbcb71427..67cfa54f02 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -20,11 +20,10 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>              file://fix-arm-atomic.patch \
>              file://0001-Fix-library-LZ4-lookup.patch \
>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
> -           file://0001-stacktrace-t.c-make-the-test-conditional.patch \
>             "
>   SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
>   
> -SRC_URI[sha256sum] = "eb4824f6f2c532cd3fc6a6bce7bf78ea7c6b949f8bdd07656b2c84344e757be8"
> +SRC_URI[sha256sum] = "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>   
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
> deleted file mode 100644
> index d8f672d744..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 966cbeb309f867ff4ac8e7f4462be4780e421700 Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Mon, 25 Jan 2021 19:01:06 -0800
> -Subject: [PATCH] stacktrace-t.c: make the test conditional
> -
> -Fixes:
> -/prj/tmp/work/cortexa57-poky-linux-musl/mariadb/10.5.8-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux-musl/../../libexec/aarch64-poky-linux-musl/gcc/aarch64-poky-linux-musl/10.2.0/ld.bfd: /usr/src/debug/mariadb/10.5.8-r0/mariadb-10.5.8/unittest/mysys/stacktrace-t.c:36: undefined reference to `my_safe_print_str'
> -
> -Upstream-Status: Submitted [https://jira.mariadb.org/browse/MDEV-24131]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - unittest/mysys/stacktrace-t.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/unittest/mysys/stacktrace-t.c b/unittest/mysys/stacktrace-t.c
> -index 8fa0db15b36..d8408f80d76 100644
> ---- a/unittest/mysys/stacktrace-t.c
> -+++ b/unittest/mysys/stacktrace-t.c
> -@@ -29,6 +29,7 @@ void test_my_safe_print_str()
> -   memcpy(b_stack, "LEGAL", 6);
> -   memcpy(b_bss, "LEGAL", 6);
> -
> -+#ifdef HAVE_STACKTRACE
> - #ifndef __SANITIZE_ADDRESS__
> -   fprintf(stderr, "\n===== stack =====\n");
> -   my_safe_print_str(b_stack, 65535);
> -@@ -48,6 +49,7 @@ void test_my_safe_print_str()
> -   fprintf(stderr, "\n===== (const char*) 1 =====\n");
> -   my_safe_print_str((const char*)1, 5);
> - #endif /*__SANITIZE_ADDRESS__*/
> -+#endif /*HAVE_STACKTRACE*/
> -
> -   free(b_heap);
> -
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> index 32c9818ab0..1c76ab3918 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> @@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>    3 files changed, 27 insertions(+), 1 deletion(-)
>   
>   diff --git a/configure.cmake b/configure.cmake
> -index bb3ad43..2ff4f19 100644
> +index 4fc324a9..23a2ea91 100644
>   --- a/configure.cmake
>   +++ b/configure.cmake
> -@@ -861,7 +861,25 @@ int main()
> +@@ -862,7 +862,25 @@ int main()
>      long long int *ptr= &var;
>      return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
>    }"
> @@ -48,10 +48,10 @@ index bb3ad43..2ff4f19 100644
>    IF(WITH_VALGRIND)
>      SET(HAVE_valgrind 1)
>   diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
> -index 6a3a1ef..e306ae7 100644
> +index 6aab788f..91b9c393 100644
>   --- a/mysys/CMakeLists.txt
>   +++ b/mysys/CMakeLists.txt
> -@@ -140,6 +140,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
> +@@ -154,6 +154,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
>     ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
>    DTRACE_INSTRUMENT(mysys)
>    
> @@ -63,10 +63,10 @@ index 6a3a1ef..e306ae7 100644
>      TARGET_LINK_LIBRARIES(mysys bfd)
>    ENDIF(HAVE_BFD_H)
>   diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> -index 4978d01..883a930 100644
> +index b9cd418f..d42e5017 100644
>   --- a/sql/CMakeLists.txt
>   +++ b/sql/CMakeLists.txt
> -@@ -220,6 +220,10 @@ ELSE()
> +@@ -222,6 +222,10 @@ ELSE()
>      SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
>    ENDIF()
>    
> @@ -74,9 +74,9 @@ index 4978d01..883a930 100644
>   +  TARGET_LINK_LIBRARIES(sql atomic)
>   +ENDIF()
>   +
> - IF(MSVC)
> + IF(MSVC OR CMAKE_SYSTEM_NAME MATCHES AIX)
>      SET(libs_to_export_symbols sql mysys dbug strings)
>      # Create shared library of already compiled object
>   --
> -2.17.1
> +2.25.1
>   
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
> 
> 
> 
> 
> 
