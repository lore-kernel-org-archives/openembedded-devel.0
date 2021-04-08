Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.242.1617899820124317144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EapB/xJK;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id p2-20020a4aa8420000b02901bc7a7148c4so643556oom.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0eKxAKAya28oSv+99TClxwwl3NQuKcYv7+cEbjTjUqw=;
        b=EapB/xJKysSgDblwJ5skCiSsOg8VDDdYZd5AM1Ytmv1rzhnqz+2iOcBpIGtma2GPc6
         0+KCLvupBKDb0xiZg18BM3sU9m1Bwrgb06VPfI2K4zbrpk2AlMyNFFDMLrUwE7x+czwO
         L9l8kY+igL8Fhmx6KRr+gBfcdU0Yax5k87TJcbT8PV2i1ttONycGsbUUHvCnjK58Fo1H
         mfPXCqsSgdOsoqyzBgywHl1XBX+LgHVccwtSm9CvSe2K1VPitTw2/XeditkYlHDUOaGR
         r/X6jIwGWuOEtYB08nQ3mGcNryUAwDez5+rXazkkWnYtwcPc02+DYV+BmEKmV9XDkG00
         vyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0eKxAKAya28oSv+99TClxwwl3NQuKcYv7+cEbjTjUqw=;
        b=Jm7ipUCcx96/rPm5dgqbHKYkG3NCixH4Yfgdxcw/imIy8N6cYIb6/R7+y5tiq8iVvp
         olHp0U8XxEYeXKYzs1I3RCdlw9FX7Pcv9oF9Dn3501GiupaWFF0JY84cFICHzghCiB36
         J1G6OUpxD0usp7uMwqIT/BES/yCWjI/8BksbODPFJlG5eeAAMlxj7NXDFhJBLE1AUbH2
         QB42NpPXD0CMgBrUbLUsz7QFSLQrm7e96/2L3z+WCpDgLB55qhe3CYGSzT1ih/lClnVd
         QV4P0DnyiGogsx5PzF3svXyFKnAbrbh0IJ357sQbQCwwQyz8pqv2bsE3TM0N19AUCuMv
         7+Fw==
X-Gm-Message-State: AOAM533/YE8irgjVU+N7tFkK7XNrkBV4j4yirwCGUlsTDOLNUT1EoaZd
	B3FNcGvy84m9IB9268e2sZLOGFjm5LE=
X-Google-Smtp-Source: ABdhPJzoW/SWTSnxakg7zxZfGuzjSTm0IesBjWin3+bWB9mW/yS+Jap1JEBZqtRX5GI+qXUIr9TXXA==
X-Received: by 2002:a4a:aa82:: with SMTP id d2mr8298499oon.52.1617899819266;
        Thu, 08 Apr 2021 09:36:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:58 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 50/64] mariadb: upgrade 10.5.8 -> 10.5.9
Date: Thu,  8 Apr 2021 09:35:57 -0700
Message-Id: <b4c4086e69b6567dab5b01f2c299f0d491a8fdde.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

refresh c11_atomics.patch
remove 0001-stacktrace-t.c-make-the-test-conditional.patch since it is
included in 10.5.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e64cce442c14f026a5e43cd5d90416c9f81343a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ive_10.5.8.bb => mariadb-native_10.5.9.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 ...ktrace-t.c-make-the-test-conditional.patch | 38 -------------------
 .../mysql/mariadb/c11_atomics.patch           | 16 ++++----
 .../{mariadb_10.5.8.bb => mariadb_10.5.9.bb}  |  0
 5 files changed, 9 insertions(+), 48 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.8.bb => mariadb-native_10.5.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.8.bb => mariadb_10.5.9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 1fbcb71427e..67cfa54f02e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,11 +20,10 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
-           file://0001-stacktrace-t.c-make-the-test-conditional.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "eb4824f6f2c532cd3fc6a6bce7bf78ea7c6b949f8bdd07656b2c84344e757be8"
+SRC_URI[sha256sum] = "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
deleted file mode 100644
index d8f672d7444..00000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 966cbeb309f867ff4ac8e7f4462be4780e421700 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 25 Jan 2021 19:01:06 -0800
-Subject: [PATCH] stacktrace-t.c: make the test conditional
-
-Fixes:
-/prj/tmp/work/cortexa57-poky-linux-musl/mariadb/10.5.8-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux-musl/../../libexec/aarch64-poky-linux-musl/gcc/aarch64-poky-linux-musl/10.2.0/ld.bfd: /usr/src/debug/mariadb/10.5.8-r0/mariadb-10.5.8/unittest/mysys/stacktrace-t.c:36: undefined reference to `my_safe_print_str'
-
-Upstream-Status: Submitted [https://jira.mariadb.org/browse/MDEV-24131]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- unittest/mysys/stacktrace-t.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/unittest/mysys/stacktrace-t.c b/unittest/mysys/stacktrace-t.c
-index 8fa0db15b36..d8408f80d76 100644
---- a/unittest/mysys/stacktrace-t.c
-+++ b/unittest/mysys/stacktrace-t.c
-@@ -29,6 +29,7 @@ void test_my_safe_print_str()
-   memcpy(b_stack, "LEGAL", 6);
-   memcpy(b_bss, "LEGAL", 6);
- 
-+#ifdef HAVE_STACKTRACE
- #ifndef __SANITIZE_ADDRESS__
-   fprintf(stderr, "\n===== stack =====\n");
-   my_safe_print_str(b_stack, 65535);
-@@ -48,6 +49,7 @@ void test_my_safe_print_str()
-   fprintf(stderr, "\n===== (const char*) 1 =====\n");
-   my_safe_print_str((const char*)1, 5);
- #endif /*__SANITIZE_ADDRESS__*/
-+#endif /*HAVE_STACKTRACE*/
- 
-   free(b_heap);
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
index 32c9818ab0c..1c76ab39181 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
@@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 27 insertions(+), 1 deletion(-)
 
 diff --git a/configure.cmake b/configure.cmake
-index bb3ad43..2ff4f19 100644
+index 4fc324a9..23a2ea91 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -861,7 +861,25 @@ int main()
+@@ -862,7 +862,25 @@ int main()
    long long int *ptr= &var;
    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
  }"
@@ -48,10 +48,10 @@ index bb3ad43..2ff4f19 100644
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
 diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
-index 6a3a1ef..e306ae7 100644
+index 6aab788f..91b9c393 100644
 --- a/mysys/CMakeLists.txt
 +++ b/mysys/CMakeLists.txt
-@@ -140,6 +140,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
+@@ -154,6 +154,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
   ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
  DTRACE_INSTRUMENT(mysys)
  
@@ -63,10 +63,10 @@ index 6a3a1ef..e306ae7 100644
    TARGET_LINK_LIBRARIES(mysys bfd)  
  ENDIF(HAVE_BFD_H)
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 4978d01..883a930 100644
+index b9cd418f..d42e5017 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -220,6 +220,10 @@ ELSE()
+@@ -222,6 +222,10 @@ ELSE()
    SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
  ENDIF()
  
@@ -74,9 +74,9 @@ index 4978d01..883a930 100644
 +  TARGET_LINK_LIBRARIES(sql atomic)
 +ENDIF()
 +
- IF(MSVC)
+ IF(MSVC OR CMAKE_SYSTEM_NAME MATCHES AIX)
    SET(libs_to_export_symbols sql mysys dbug strings)
    # Create shared library of already compiled object
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
-- 
2.17.1

