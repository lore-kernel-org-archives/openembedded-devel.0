Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.12334.1619098418417515669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 06:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H6FAVKlm;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c17so31708151pfn.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6wcXOpqMxmwlGaFKq7I4lQdRE+NemokiyprQL7ova+c=;
        b=H6FAVKlmgxWUwj61xS9Dp/o/8fGBC7d56KiMa+p1tnP9A3m2a3D6LmCfXOsm/Figoe
         mEdaorFCXfZ42Uo/LULoZiTTQOJXZ6D5/bLc21dEn6+407xKau/USCFQdkNB6wEDKzux
         9O2fjPTSqSrrZ/G0uCxPhQPr8rh2QPmrL0dQWMWusXluc5XVO7dPtx5QeoIW4YUKShwW
         s3ZVDc6wbfN2nkXAszoFb4LOW8JJfevq2VTwewcFA9rJiLLv1cU1r8x5z0Gf86I2ahf8
         Tc72SADB8RWuJP+C8Y/CFaoHWq+mu5Z191KUXJRI/d7WJU3PxeSjd7wjewrOULG7l0w9
         H8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6wcXOpqMxmwlGaFKq7I4lQdRE+NemokiyprQL7ova+c=;
        b=C5DNUuWRLcoshq2pffEo0r3aqbxkn9vkuaBK45T4G/RNhgTK6y7KPyhbD4ShZsjc0c
         D0/5KOTdIZPdq2ZAtymMMWGF9ryulOFsr/9p20/aJpVYQ+iKXiOGLRzLn3/gqivj+kPO
         wDVAoqid/f5f/svCTDaaUnOuINNSnENBIcLmLRTJL2/o0STjiKhxhqd4P4XBxmW2Bn/l
         zZ7Z33rZwO+46+1V5JyjUM249S0vAiPl/6tTzBu1Ga9AMmDFCOJ8cJ/AqtPVtbtC5AoG
         h0lXGmFl6RFBGCmddwbhidNrD569XI5aSOJPAt8lez365+ZuD565Ov5kGsQGCB7MXsy7
         dinA==
X-Gm-Message-State: AOAM531fLLbtXSHEqi0+9P0PBjiVeHFuLcy4Y3JGcQbR120PlmuJu2Zd
	j8U4J5HasG079iqGkatqtYPioQhqJFmucA==
X-Google-Smtp-Source: ABdhPJya8qsEP1vc3Lp0M7xSPpntlfmjwFKLiBWg3WVLzslYnRmSk2C6ad3u03y0cv8qZyvDRZyySg==
X-Received: by 2002:a63:d552:: with SMTP id v18mr3573642pgi.313.1619098417684;
        Thu, 22 Apr 2021 06:33:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id gd1sm2376182pjb.49.2021.04.22.06.33.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:33:36 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 3/4] mariadb: upgrade 10.5.8 -> 10.5.9
Date: Thu, 22 Apr 2021 06:33:19 -0700
Message-Id: <20985dbd35c990b547bb98805e6df59a122bc0ff.1619098298.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619098298.git.akuster808@gmail.com>
References: <cover.1619098298.git.akuster808@gmail.com>

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
index 1fbcb71427..67cfa54f02 100644
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
index d8f672d744..0000000000
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
index 32c9818ab0..1c76ab3918 100644
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

