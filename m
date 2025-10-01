Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2BACCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 08:18:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.11753.1759306705202834232
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 01:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XLckEzG3;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7811a02316bso4010852b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 01:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759306704; x=1759911504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oNKInnfrIHzLDQSPgNQ7U6WUm2x5m1iRR+/V9C5nIg=;
        b=XLckEzG3XfSmEypt9JOE14vbj7Smiufkj5z8xk39AXrgZTj0LhDDkwHqsSKnBL6URn
         VOlcxDOhDOeV8a6LXxOagcePHwIweW8Ms/LjrcuqjjUAZ5+8uXuA6DsEXCNutethQDWo
         r/lCHug33388gqqWeolso5C8pLIM4ioeTrQKEAvgeqqJoNnHpjwjvIAQLbT7Jb4f0IbM
         5S86UCPbPc3F36Cw6iOTtJEHP1nNjGPgmSuRA2R6He3Aetsc5nwlLv8k9f279r4p8rkZ
         ymI1YlDgHW45LePtCbDj5R4anqMcfCOnNqySj6UltztR2velefAaTfFoSxibDBASJCfk
         1fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759306704; x=1759911504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oNKInnfrIHzLDQSPgNQ7U6WUm2x5m1iRR+/V9C5nIg=;
        b=AqlbErzo3fDRkzX6FXWzxIJhNHAXRDgokNMCbU+O5oghJyXjyqX9fZJbzQoTBFeZ5z
         jkUyM2v8uKXcq+4+aAxD4k9cwGjanWzT/VkJYHiDVwsP9jmqv8chQBBU9VLgFWlEEobU
         F1AgnT2yRa8DGDoemhvX5KqcLMBhm1m9r7T8Mojl2AwZE/AW1gWVS6nfEBdDL5dXaG2V
         sqpYBliRM09fhOu1/LkK23yeLJ8CAm8vZ9mxN7jlqUqCgA2T4kuwsEzemorqXMDog2kb
         jZF+N+CtZen2R/o1ocl6U9y5z/kklK0tW6wY9aULWy7hNogEoA04vSUwO/sFYi2l+RQQ
         9YbQ==
X-Gm-Message-State: AOJu0Yx/za5reQg1Njh7cBLQSAh/jqMyyX6rmJ//xaSVX2DNvV2HGOsy
	IJ1B70OZkbmA96K9pJzRtmEtJn3CprknLym8b0PRt5yz6MIDgGpmahCJ2UX5b+Cc
X-Gm-Gg: ASbGnctyFsGVGYL7+wJB795tOnEhnEbXT2p9pNHvOPK4MNtmLW7XtOrZxTL/sEBzBxq
	EaC4LREpKisDOShfsTdEHTGnSNT6kfvPamZEIMCCLXXBbfMAeR/XhoQLPQVJTcB6+Xp4+XktZKk
	y4OzFpjlIomJcxGmwQMTpY4Bb0SNA9sL7tfo494C894tVRzvo8cKX9kdcLVcB5MzgCzZpPm6gsr
	bbuIkO/SgNjaD+9N+g77P9rJ3/OTAV94IxZumAfyX0ZUMJEnFdfgyNNhcuhrJ5YkaTy8yenuVJQ
	dUfsx1CmM1DR5DtevIF7ZUvYW80B3FgZ+NBvLn62rKa5uFs/N3N3QNFJrSxyBicu2fe2/Rb0C6I
	NuVXgDJaN5xmopMTaJ/K4Obe/JLJaUvc71VkPGCOuUwnWsCqdnaVpgifIIDI7A+QGX3eWlvBDtc
	PAk2Q=
X-Google-Smtp-Source: AGHT+IGm5CxPE9CM+9tl8lUMqyx3+5WZF7I7Cusq9ygq8ekaP47PrlWQWGGFsSus4cRpt7AiWdI1OA==
X-Received: by 2002:a05:6a00:8d3:b0:776:138a:ec97 with SMTP id d2e1a72fcca58-78af4176ab3mr2736642b3a.28.1759306704111;
        Wed, 01 Oct 2025 01:18:24 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06af6sm15520381b3a.88.2025.10.01.01.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:18:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 2/2] mariadb: 11.4.8
Date: Wed,  1 Oct 2025 10:18:04 +0200
Message-ID: <20251001081804.422541-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001081804.422541-1-zboszor@gmail.com>
References: <20251001081804.422541-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 08:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120092

11.4.7 fixes a huge performance drop from 11.4.5 to 11.4.6.
https://mariadb.com/docs/release-notes/community-server/mariadb-11-4-series/mariadb-11.4.7-release-notes

11.4.8 fixes several crash problems and other issues.
https://mariadb.com/docs/release-notes/community-server/mariadb-11-4-series/mariadb-11.4.8-release-notes

Removed 0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
which is not applicable anymore, the code was rewritten.

Adapted 0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
to fix fuzz.

Add libxml2-native to DEPENDS in mariadb-native to fix the
do_configure failure with the new version.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...ive_11.4.6.bb => mariadb-native_11.4.8.bb} |  2 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
 ...ck-if-syscall-exists-before-using-it.patch | 40 -------------------
 ...Lists.txt-fix-gen_lex_hash-not-found.patch |  6 +--
 .../{mariadb_11.4.6.bb => mariadb_11.4.8.bb}  |  0
 5 files changed, 5 insertions(+), 46 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.6.bb => mariadb-native_11.4.8.bb} (92%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.6.bb => mariadb_11.4.8.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
similarity index 92%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
index 578357b480..ff48dcd806 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
@@ -3,7 +3,7 @@ inherit native
 
 PROVIDES += "mysql5-native"
 DEPENDS = "ncurses-native zlib-native bison-native libpcre2-native \
-gnutls-native fmt-native \
+libxml2-native gnutls-native fmt-native \
 "
 
 RDEPENDS:${PN} = ""
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 67dd687c02..53a24d14bc 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -15,7 +15,6 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://fix-arm-atomic.patch \
            file://0001-Fix-library-LZ4-lookup.patch \
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
-           file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://ssize_t.patch \
            file://sys_futex.patch \
            file://cross-compiling.patch \
@@ -26,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://riscv32.patch \
            file://0001-Remove-x86-specific-loop-in-my_convert.patch \
           "
-SRC_URI[sha256sum] = "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27831ec0414fb7df07"
+SRC_URI[sha256sum] = "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
deleted file mode 100644
index eddfdaaf77..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f9f019049a9bb09471e8303d4510afae07f225c8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Aug 2021 06:49:25 +0000
-Subject: [PATCH] aio_linux: Check if syscall exists before using it
-
-Return -ENOSYS if not implememented, fixes build on arches like RISCV32
-Fixes
-tpool/aio_linux.cc:63:20: error: '__NR_io_getevents' was not declared in this scope; did you mean 'io_getevents'?
-   63 |   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
-      |                    ^~~~~~~~~~~~~~~~~
-      |                    io_getevents
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tpool/aio_linux.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
-index 507c6b92..a6adf1af 100644
---- a/tpool/aio_linux.cc
-+++ b/tpool/aio_linux.cc
-@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
- */
- static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
- {
-+#ifdef __NR_io_getevents
-   int saved_errno= errno;
-   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
-                    min_nr, nr, ev, 0);
-@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
-     errno= saved_errno;
-   }
-   return ret;
-+#else
-+  return -ENOSYS;
-+#endif
- }
- 
- 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
index 1475bb1a51..7c73699b08 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -18,8 +18,8 @@ diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
 index 0195555e..507136cb 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -64,11 +64,18 @@ ${CMAKE_BINARY_DIR}/sql
- ${CMAKE_SOURCE_DIR}/tpool
+@@ -63,11 +63,18 @@
+ ${CMAKE_BINARY_DIR}/sql
  )
  
 -ADD_CUSTOM_COMMAND(
@@ -41,7 +41,7 @@ index 0195555e..507136cb 100644
  
  FIND_PACKAGE(BISON 2.4)
  
-@@ -405,11 +412,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
+@@ -405,11 +412,18 @@
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb
-- 
2.51.0


