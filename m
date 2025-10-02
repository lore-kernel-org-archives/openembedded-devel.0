Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B91CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 10:49:06 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.5450.1759402141343154418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 03:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJeQj9ey;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781997d195aso689639b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759402140; x=1760006940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oNKInnfrIHzLDQSPgNQ7U6WUm2x5m1iRR+/V9C5nIg=;
        b=lJeQj9eyrC94TcCIREBQnzQfIy+Fj8uTFI3WfhW0GbpyQuyhXgN/UgU54g5Y7czKxm
         Ajam4UuJzxy3IaLTr86MCfvv3PcoE2bIShweEeJKqcraEVZPEVyYdBC+Y8q8Lky89jC4
         gIfESX07T1XWOAWxats9ZC2DHRMCl5czfm/glEYtiiaY+wbc7BaYdSJii5NZ7NMrBrWO
         RyZ+w3WqovbUrSJ1h+MaCFEvu3cPUm31IIqYCd0rvZTbZ5x03B9xpBwvr3SCFi5J4LuN
         yijCwBHACA/wBrPS5u4Evcfmcwqtul+svCsTWHzEwN/9BJ5V+H127czjPV+6QOUnZ600
         93aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759402140; x=1760006940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oNKInnfrIHzLDQSPgNQ7U6WUm2x5m1iRR+/V9C5nIg=;
        b=GZzV3FmznezHEofT1Ut9ioN2agWH5nCJRABUN3Ez3t1ezNaDOeq/KXwRWHcSku+L0v
         YrRkVNCU9h6mM7glSRNj+qCphw2UWzSn3+G1PDlZu5YHvvPH3do8I0LFCZFPEeJrb5T5
         nPCiTdLD9BV8fbAcQmFboXyXyCie0bNWGiR3EZS5WaXbA/i0y7hnmjV6hGkQRStk6kgM
         epsWnxXCblMwebROiAKeZYPRQes6yp85k9KudQG8S9dfQrEFCsG6AH/B1S3hgK89xHz7
         uRi3EmNnFZq8Op2oZTZ7nfotojVgIeoy55VPkgP2pmHQHClAXVrs3XJ9Ri07K8o194XV
         H9DQ==
X-Gm-Message-State: AOJu0YyZBlZd2fP6tOfZUyLlZT0KvFtIgzUxiWVvK6vW28e7de+joz5N
	/0vwUU7iZNErf92n5lHMekxOGYE+UtO3bGyybLe5Fz7SKSgQnH1IRBryRYv2WzZ8
X-Gm-Gg: ASbGncsEmr3gSAIG++Xthh3SAaZXSf/HXI63rwIemMkWa6tdgeoz+N6pgy0pmLg5tN1
	zpcs43cxoEHBQ45EiP8otdamMg1vSzJ2CeFM0pnofsFsGwN/uif/a2hAbr1P1Zvkupb4apT15dD
	KQZhOgsh2uozF4RQVWzlYDROR5YGd3sEbkGZDN0PycKIom3bvqYtNxxm6AdpNtMkMLsooVzPJxm
	3kshUtwDgFnmPyVPpbzZudRvi+oQqfw8LcI2vPRjam38yaVrR5eGQr1PMxUcuUjK+T8K1aQQqtI
	NRyhtpD9X7tqGkNSelVPDrVf4qxaCpse+N/wDZ/OK/hsrecDqzlqY9tPP5i4TzMjIMTh3amiQkS
	PxGMyG5NiOLMMagf0j71GJF51WAU46OG30a9XtlZ+H6E8FDl8hzL86OAaT161HH/X8M6X
X-Google-Smtp-Source: AGHT+IEkBdM8otCZ1S3C+YJ0JB3ZizmcHQ1r9b752+hHCvO78KJxnMKWExKDBIjS8DOnxvVgWIRvrw==
X-Received: by 2002:a17:90b:314e:b0:335:228c:6f1f with SMTP id 98e67ed59e1d1-339a6e95d23mr9623163a91.12.1759402140312;
        Thu, 02 Oct 2025 03:49:00 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebdac1sm4803568a91.9.2025.10.02.03.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:48:59 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] mariadb: 11.4.8
Date: Thu,  2 Oct 2025 12:48:47 +0200
Message-ID: <20251002104847.1472184-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002104847.1472184-1-zboszor@gmail.com>
References: <20251002104847.1472184-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120167

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


