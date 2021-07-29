Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.17456.1627601820908828631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KzkExgo+;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so11862688pjh.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GaiwRK64J4kZ9o0WQbiXAea46ytl93tZXF5n6B7rttI=;
        b=KzkExgo+jX3fzDoKO0SZ0VucGg9toerixHKoSW8M8G3rIwVm1lyLzBec5pZ15Tsjqf
         qmD2V5LGDbxKn/lW7U0nA0ddIZT6GElJYqREKsaPHQqIu7FepH1/86w4tF1/d8JIhoA5
         Od34GnbTwyBWwDp0wQkH4KPH+dGGHYfUMQOKn4L4IJvXOW9XMTL77hYJ8g61+Ep6WrBc
         7pqnDb/gMWst3++QueqT3CgXztdD1KM4PlCuc+eIGrvGQg9XEtY2bwaIXSM8nimPfo3e
         UVHxKiqqkKbV3bnA5IYry3HuasubMFU0nsIwMvJ8YW6Cu1xy3znhB3NONlvr3BlNan/h
         2PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaiwRK64J4kZ9o0WQbiXAea46ytl93tZXF5n6B7rttI=;
        b=C3uVFituCiUrUf58t7Klr6ZrbMGhcikz5XfXFkBO+u3vU8X7amgRNo85Dw35t6qCus
         FBDmJYhAzqH4p5cC+kxWhCCs0MG7y9NSgvC75pkk9xBxUvvB/gLkuSRNhkw4iCs0plq9
         hN2KqXHDsomlWtIFQV5Frn3SsfvwI0faFM6lzYlKDpLmyfON4IkV4tvpGGZqdOImkTXD
         CcruRYmHOPESSL0sPuqDhSIJagddztgUR48UUA2iIf12bv0T2heYiVT5WPvm+MMOm/Qg
         +9ohOKx2mmvXXLxKn2JfoH/MQ5S862R7wD7xFKw2z+8posIse+QFTNDHXsC+CBO5SfOe
         XY7A==
X-Gm-Message-State: AOAM532RTInkdXIkIq2cOvm9npdbOsesP71FlD4X2EYPV7gaUsN+KwML
	SOPfgK/6RJZSt9RBkr7qXfwq9SYnD1/THA==
X-Google-Smtp-Source: ABdhPJzLjl85MLzPYHlJVV/EaJUMxx1w49r81SkWcpjUDp2wx3a1UCL/I/XgsOYaz8amJRqeOsUZLQ==
X-Received: by 2002:a17:90a:f690:: with SMTP id cl16mr7847588pjb.164.1627601820352;
        Thu, 29 Jul 2021 16:37:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:00 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/15] mariadb: Use qemu to run cross-compiled binaries
Date: Thu, 29 Jul 2021 16:36:41 -0700
Message-Id: <48a84cb8a18b291cb8a00de96a66176ed340f94b.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

This way, mariadb does not depend on mariadb-native anymore.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6f05b2463a20f99d43c5a7db190dfe3490929247)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         | 27 ++++----
 .../mysql/mariadb/cross-compiling.patch       | 25 -------
 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 67 -------------------
 meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb  |  4 +-
 4 files changed, 15 insertions(+), 108 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 18b025070b..7b1f537fb4 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -12,7 +12,6 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://mysql-systemd-start \
            file://configure.cmake-fix-valgrind.patch \
            file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
-           file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://0001-disable-ucontext-on-musl.patch \
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
@@ -21,7 +20,6 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://sys_futex.patch \
-           file://cross-compiling.patch \
            file://ssize_t.patch \
            file://mm_malloc.patch \
           "
@@ -60,8 +58,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?= "enable"
 ALLOW_EMPTY_${PN}-setupdb ?= "1"
 FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db"
 
-EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} setupdb"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
@@ -95,6 +91,8 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DCAT_EXECUTABLE=`which cat` \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
+EXTRA_OECMAKE_prepend_class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper "
+
 # With Ninja it fails with:
 # make: *** No rule to make target `install'.  Stop.
 OECMAKE_GENERATOR = "Unix Makefiles"
@@ -117,12 +115,18 @@ do_generate_toolchain_file_append_class-native () {
     sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
 }
 
-do_compile_prepend_class-target () {
-    # These need to be in-tree or make will think they need to be built,
-    # and since we're cross-compiling that is disabled
-    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
-    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
+do_configure_prepend_class-target () {
+	# Write out a qemu wrapper that will be used by cmake
+	# so that it can run target helper binaries through that.
+	qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+	cat > ${WORKDIR}/qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+	chmod +x ${WORKDIR}/qemuwrapper
+}
 
+do_compile_prepend_class-target () {
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no', d)}" = "no" ]; then
         if ! [ -e ${B}/include/openssl/kssl.h ] ; then
             mkdir -p ${B}/include/openssl
@@ -132,11 +136,6 @@ do_compile_prepend_class-target () {
             echo "#endif" >>${B}/include/openssl/kssl.h
         fi
     fi
-    # workaround to handle out-of-source build from source package
-    yacc_files="sql_yacc.hh sql_yacc.cc sql_yacc_ora.hh sql_yacc_ora.cc"
-    for yacc_file in ${yacc_files}; do
-        cp ${S}/sql/${yacc_file} ${B}/sql/${yacc_file}
-    done
 }
 
 SYSROOT_PREPROCESS_FUNCS += "mariadb_sysroot_preprocess"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
deleted file mode 100644
index 0f4815b185..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-This is not needed for OE builds
-
-building failed since native does not generate import_executables.cmake
-In fact, our building system will export the needed commands
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -392,11 +392,6 @@ CHECK_PCRE()
- 
- CHECK_SYSTEMD()
- 
--IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
--  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
--  INCLUDE(${IMPORT_EXECUTABLES})
--ENDIF()
--
- #
- # Setup maintainer mode options. Platform checks are
- # not run with the warning options as to not perturb fragile checks
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
deleted file mode 100644
index 4cb0443392..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 23 Jul 2020 00:08:16 -0700
-Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
-
-Fix the below do_compile issue in cross-compiling env.
-| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql/lex_hash.h'.  Stop.
-| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sql/lex_token.h'.  Stop.
-
-Upstream-Status: Inappropriate [oe build specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
- 1 file changed, 20 insertions(+), 10 deletions(-)
-
-diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index 0dc3caa..616017b 100644
---- a/sql/CMakeLists.txt
-+++ b/sql/CMakeLists.txt
-@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
- ${CMAKE_SOURCE_DIR}/tpool
- )
- 
--ADD_CUSTOM_COMMAND(
--  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
--  COMMAND gen_lex_token > lex_token.h
--  DEPENDS gen_lex_token
--)
-+IF(NOT CMAKE_CROSSCOMPILING)
-+  ADD_CUSTOM_COMMAND(
-+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
-+   COMMAND gen_lex_token > lex_token.h
-+   DEPENDS gen_lex_token)
-+ELSE()
-+  ADD_CUSTOM_COMMAND(
-+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
-+   COMMAND gen_lex_token > lex_token.h)
-+ENDIF()
- 
- ADD_CUSTOM_COMMAND(
-   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
-@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
-   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
- ENDIF()
- 
--ADD_CUSTOM_COMMAND(
--  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
--  COMMAND gen_lex_hash > lex_hash.h
--  DEPENDS gen_lex_hash
--)
-+IF(NOT CMAKE_CROSSCOMPILING)
-+  ADD_CUSTOM_COMMAND(
-+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
-+   COMMAND gen_lex_hash > lex_hash.h
-+   DEPENDS gen_lex_hash)
-+ELSE()
-+  ADD_CUSTOM_COMMAND(
-+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
-+   COMMAND gen_lex_hash > lex_hash.h)
-+ENDIF()
- 
- MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Server)
- SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
index 8ae8241b05..57d7736ea3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
@@ -1,8 +1,8 @@
 require mariadb.inc
 
-EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
+inherit qemu
 
-DEPENDS += "mariadb-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
+DEPENDS += "qemu-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
 
 PROVIDES += "mysql5 libmysqlclient"
 
-- 
2.25.1

