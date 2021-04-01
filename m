Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.9297.1617321064226734309
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 16:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mD1EAiA1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617321061; i=@fujitsu.com;
	bh=rnH5j3IbsBgCVyEt4OrzbWhKbNhMpuOykm1ZX/IeTQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mD1EAiA1JfIp81U4aZ0XFMLGPjlOA0JlEWtyhCF7zQA48bAIZungLrtdGZuGwQWUy
	 mhk9g+UKiIkKfdeCLjGWJkT5Or9MDsubUtBAdXSXp7Y/wmAb2oFG/FUmTq/Jm9J9AM
	 vSqs2tTBKGArP+PXBZAzY71pmJrNx8+OH4S0leDg4Hl2cdKvVx8Ezko8C4514KIqTK
	 NcxqlolcT5T97FLrz+vRSdtizSo9tEEVcP9V2TKrTcheiwvaDZW8GX0xivZcXKFtEt
	 bkSJDTUIpWh0aXiIas2/65W8Cu9mma5cgJg6uniwiOrG1QT6iKzMnARPVqpjYWYc6f
	 PtY/KiJhVpwrQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id DA/BC-07430-46C56606; Thu, 01 Apr 2021 23:51:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MRopsSk5Z
  g0LNTweLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfj6YQJzwR69iu8vnjM3MO7T7GLk5BAS2Mok
  cXebcBcjF5B9nFFi3qo9bCAJNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQUcJV517
  gezWYDiz/b9BevlFXCS+PFgCguILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRlFi9uVmqP
  oqic4Px9kmMPLOQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hobGuoa6poZ6iVW6iXqppbr
  JqXklRYlASb3E8mK94src5JwUvbzUkk2MwPBKKWQ03sF48PUHvUOMkhxMSqK84oZpCUJ8Sfkp
  lRmJxRnxRaU5qcWHGGU4OJQkeFdHAeUEi1LTUyvSMnOAoQ6TluDgURLhPQ2S5i0uSMwtzkyHS
  J1iNObYeXrxImaOdz+BpBBLXn5eqpQ4r0o0UKkASGlGaR7cIFgMXmKUlRLmZWRgYBDiKUgtys
  0sQZV/xSjOwagkzGsIMoUnM68Ebt8roFOYgE5xvZEKckpJIkJKqoHJLX3qyomHBM1LJjr8ESw
  77HWAJ9xXdKffDk6OU9eWHH978ad/+sbHGw/OsNe1f3S+I2RNedPZA3H9bNm+K9k0sqWvJ5bd
  nO3IcyFyjlvp5mjZdUx6B9ZNupoc/2Xq+/PzeG95fLecm63NeHdv5JOe/Aqb3eZ9nNKHUkMt9
  DSsXuYE2DxxYFvMp1L3/Kew/fqFTA/WtPy3X9LmItU0lb2y/FjPdO43dxZecvjpccH7Yk1tjq
  nu0dP7Jyecc6w3/aDm0ZT/6npW8KM7n+y6GyKbDPae3mPgvqFywSvlP5bRS0O3b1D12LfywbN
  vmm+f1OXlvJURMqmK2rbb5f6EX9PckucvL32p07EoIYBnuUG9EktxRqKhFnNRcSIAhDXDZzwD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-26.tower-228.messagelabs.com!1617321059!519359!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15996 invoked from network); 1 Apr 2021 23:51:00 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-26.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 23:51:00 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 131NoruX021525
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Apr 2021 00:50:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 2 Apr 2021 00:50:51 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mariadb: upgrade 10.5.8 -> 10.5.9
Date: Fri, 2 Apr 2021 07:50:42 +0800
Message-ID: <1617321042-66190-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

refresh c11_atomics.patch
remove 0001-stacktrace-t.c-make-the-test-conditional.patch since it is
included in 10.5.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
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
2.25.1

