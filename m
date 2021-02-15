Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.25552.1613351621771913474
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eQMzToGA;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id d2so2923829pjs.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tmmfLoXKFtpqH+a/NsWX80EitBemG7cJ5WDM72gOYYc=;
        b=eQMzToGAEigOMZOXzDop4DSgquC99BKurbaAKJOKwp1J64EqApPnC64KlPP9wVF8UQ
         J+RIEP9a/x7hUC6j+K+ZSxEmTslJyb7mzzlZrHudhLZCu0QonRC6l2LD8zpOTijh1P6q
         i/kJRSt4jQ8vjayC3uQYuLyOIuuzdLOazOB4UIHr/bOCSwOxvmX2Dq8LN7MN+mrThCar
         kmEH3tBLqE97KEq5rmyZ2+AeQR3QCnfpYhnzCO3xHP9p8Xr39Q76KUreFZYkjOcS1CWt
         sCS+PvDSk1OP0vL4NmaaMIdmFDFzTM9qFTnj3CtljWWGPE2qyej433EBnVf70KI8oRuO
         8Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tmmfLoXKFtpqH+a/NsWX80EitBemG7cJ5WDM72gOYYc=;
        b=KoWO8M4FM6GUFDueOzRy2fED5WZzGSG0GocbJzc9FkC8u//07q+5C8Wtjys5XMZD/f
         vMk8+ItGh9gIBKNJAAbhTdZ92XDxRQWGqwY4J1KC4qfRkkjed1Z9y6yeIKVASpp/hxul
         ATMiqHGjBaMw5FMuw4W3yFc/5EexOddE8Z102ggf1p1EbXf0GNoJ4vMNdJ53YLvX9Uiv
         XZisN7Ccl9ih6tjKLPu/jZIZvPvBOORQ4RfQaUYlCd8YvoiGEeOHu1KFZZ3+oR7delnr
         lIsxZstHg9n98+b+5eyj1EW4qrY8MVud8c1ypjjw9yiXdv7jrC66Qcyreksj7V7Vxi+t
         Xxjw==
X-Gm-Message-State: AOAM531+l8IAyBVZasH0oLcA9L8SjmeqNgJyrCQywa3z/8yvEwMjQZmO
	hbWszpzdLWMBzsIwo+DcKNZmBBITFTXkpg==
X-Google-Smtp-Source: ABdhPJy+n2iDjzCrqzEQQ2jRLwoCoFV0gf5NSQ+4WKSRDSzt8ba2CJJ71U9z6ZJ6zoOBVmSUP+35vw==
X-Received: by 2002:a17:90a:b28a:: with SMTP id c10mr13702150pjr.39.1613351621168;
        Sun, 14 Feb 2021 17:13:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:40 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 08/15] mariadb: upgrade to 10.5.8
Date: Sun, 14 Feb 2021 17:13:22 -0800
Message-Id: <3ebf00ee3afeff4672a3c67820f0befbe23f09c1.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
CVE-2020-14812
CVE-2020-14765
CVE-2020-14776
CVE-2020-14789
CVE-2020-28912 (MDEV-24040)

Rebase c11_atomics.patch to avoid fuzz warnings and add
a patch to fix below build error on musl.
/prj/tmp/work/cortexa57-poky-linux-musl/mariadb/10.5.8-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux-musl/../../libexec/aarch64-poky-linux-musl/gcc/aarch64-poky-linux-musl/10.2.0/ld.bfd: /usr/src/debug/mariadb/10.5.8-r0/mariadb-10.5.8/unittest/mysys/stacktrace-t.c:36: undefined reference to `my_safe_print_str'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 486d0fa33ec6dc41f198445180135ccccb897ce1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ive_10.5.6.bb => mariadb-native_10.5.8.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 ...ktrace-t.c-make-the-test-conditional.patch | 38 +++++++++++++++++++
 .../mysql/mariadb/c11_atomics.patch           | 14 +++----
 .../{mariadb_10.5.6.bb => mariadb_10.5.8.bb}  |  0
 5 files changed, 47 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb => mariadb-native_10.5.8.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f6c32270b7..27eede6c30 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,8 +20,9 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-stacktrace-t.c-make-the-test-conditional.patch \
           "
-SRC_URI[sha256sum] = "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74edfaf6013c45c4"
+SRC_URI[sha256sum] = "eb4824f6f2c532cd3fc6a6bce7bf78ea7c6b949f8bdd07656b2c84344e757be8"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
new file mode 100644
index 0000000000..d8f672d744
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-stacktrace-t.c-make-the-test-conditional.patch
@@ -0,0 +1,38 @@
+From 966cbeb309f867ff4ac8e7f4462be4780e421700 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 25 Jan 2021 19:01:06 -0800
+Subject: [PATCH] stacktrace-t.c: make the test conditional
+
+Fixes:
+/prj/tmp/work/cortexa57-poky-linux-musl/mariadb/10.5.8-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux-musl/../../libexec/aarch64-poky-linux-musl/gcc/aarch64-poky-linux-musl/10.2.0/ld.bfd: /usr/src/debug/mariadb/10.5.8-r0/mariadb-10.5.8/unittest/mysys/stacktrace-t.c:36: undefined reference to `my_safe_print_str'
+
+Upstream-Status: Submitted [https://jira.mariadb.org/browse/MDEV-24131]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ unittest/mysys/stacktrace-t.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/unittest/mysys/stacktrace-t.c b/unittest/mysys/stacktrace-t.c
+index 8fa0db15b36..d8408f80d76 100644
+--- a/unittest/mysys/stacktrace-t.c
++++ b/unittest/mysys/stacktrace-t.c
+@@ -29,6 +29,7 @@ void test_my_safe_print_str()
+   memcpy(b_stack, "LEGAL", 6);
+   memcpy(b_bss, "LEGAL", 6);
+ 
++#ifdef HAVE_STACKTRACE
+ #ifndef __SANITIZE_ADDRESS__
+   fprintf(stderr, "\n===== stack =====\n");
+   my_safe_print_str(b_stack, 65535);
+@@ -48,6 +49,7 @@ void test_my_safe_print_str()
+   fprintf(stderr, "\n===== (const char*) 1 =====\n");
+   my_safe_print_str((const char*)1, 5);
+ #endif /*__SANITIZE_ADDRESS__*/
++#endif /*HAVE_STACKTRACE*/
+ 
+   free(b_heap);
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
index 36217f9aae..32c9818ab0 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
@@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 27 insertions(+), 1 deletion(-)
 
 diff --git a/configure.cmake b/configure.cmake
-index a355214..6ee595f 100644
+index bb3ad43..2ff4f19 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -865,7 +865,25 @@ int main()
+@@ -861,7 +861,25 @@ int main()
    long long int *ptr= &var;
    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
  }"
@@ -48,11 +48,11 @@ index a355214..6ee595f 100644
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
 diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
-index 3d8a20e..42f1441 100644
+index 6a3a1ef..e306ae7 100644
 --- a/mysys/CMakeLists.txt
 +++ b/mysys/CMakeLists.txt
-@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
-  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
+@@ -140,6 +140,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
+  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
  DTRACE_INSTRUMENT(mysys)
  
 +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
@@ -63,10 +63,10 @@ index 3d8a20e..42f1441 100644
    TARGET_LINK_LIBRARIES(mysys bfd)  
  ENDIF(HAVE_BFD_H)
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 616017b..53575f6 100644
+index 4978d01..883a930 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -219,6 +219,10 @@ ELSE()
+@@ -220,6 +220,10 @@ ELSE()
    SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
-- 
2.17.1

