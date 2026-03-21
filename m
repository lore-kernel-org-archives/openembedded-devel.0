Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CCC109449B
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 20:39:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18656.1774125576875152195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 13:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PbawqQ7C;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so28517005e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774125575; x=1774730375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XlC2om8uKag+VLwHKNEAo7+VXH3wPesUihytTV1vVIY=;
        b=PbawqQ7CqGKAF1IGVxeZwFjS97Uj7jFzR5bZpEuVsbHIWonFan/KZFGCYRua2JbmfB
         rXqVuH/mrO0Jpuz7mK1gdxRZezxmiv4fk79XmmXvSnoJlG8fIxKDpWfPK8vCxCrKLMMN
         z7wQojvIY6W7M1o+AchOapqayJ3l6LPLXhmP0dQoaARmfldpQb5+iM+bfvOYf8rcvalq
         RZdKXRFNq/I1ne2dMMmcJuXqG+DFfBPLqJw1dwXk6KdY30XrrK7IWZkFf2pyytnOy8OZ
         uUn73i5FBIUBYsAynjSgf2mdUX6uJzGqvx3+rhYfatp0rkFyELxYf5mq2Wx7zHnzW0vs
         n6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774125575; x=1774730375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlC2om8uKag+VLwHKNEAo7+VXH3wPesUihytTV1vVIY=;
        b=kGhHMW3TQJQ6VLE3GygHKep1YJX3y96ThCGM8lceZW87VEdnyrQKqf/FQy+L7uOFSW
         16blC+5a4I2LBVmrrpI/s6DyXMyxyOQIWKdY+FGAnGTs4Elqkh1txBUDS+HcRWBZHrJs
         MYuQcMjS/WxKfoB1+SnXWnc60VDYG8K9onzuFnsuoxiKnCagqEiQnhJDKnDilezxhD3j
         YJhfflInGfGP25LqAMTFvolMG8Wc8kdy2NyY+GvZEnMbyQp0XrmW0ERxHWtoupFM+sQG
         LWzm66UzoiaTz2TrwILam8WBibDbcKVVNo6pJ9UxKSuXFoxQDqG4dUgv0bd5ErAN1Gxx
         2CrA==
X-Gm-Message-State: AOJu0Yz1R32A3YeYgz4fvX8X2vooPj4qaxy21CerJEd6wrcmg0fWeaHz
	qKRX8jBu8BbX97KkG4FpQQfq+sD5FH6oEhz7jaGynX3GWLs7mbDLKWxKasll0w==
X-Gm-Gg: ATEYQzwDyWn25+qTyjvSyX6N0YvmEOEfpR9Vua4e1nYAaJoICgtB09PWMscVU+OtzTp
	2ajReRDKgPRU4/8dB1AEukEmJe9oTFq5Rd/wwbaP6X1Su1olPu9eq3MbIcGcTbtrQDpLrbjbRzv
	yd9CkEnVpg/gcYgCzAuVAObqYY/eMW2EKJS99tcsQmA2mTAuYY/CTvsBFL2DsJpRqgJj091dbqM
	lreSDYk7G50JpiQdAi6k1Aa7Nausmp/TJSdrZTATjg1veLKL+gBrL5U7oyRO/MHgUagV6mLDDjk
	hGNA4DDIsrXIjxTF2k1YPppzrvu5MWnvFXC0HWA06ldqBhtTj84mQtcCnX/7L/pkKO6HlU9IdP0
	yxY9X4KppjCO044BNgik+H1qd0b7j9FbYpCFX9KyYcVnjLGJIrUKDQRX2vjoWR5HQYaWbX5wv/0
	6d8meMxynlAaIB0gO3a8ZXUZDgc3wxRcw=
X-Received: by 2002:a05:600c:35c4:b0:485:3f1c:d8a4 with SMTP id 5b1f17b1804b1-486fedb2551mr122221865e9.9.1774125574943;
        Sat, 21 Mar 2026 13:39:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7e2665sm186123545e9.6.2026.03.21.13.39.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 13:39:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] mariadb: upgrade 10.11.12 -> 10.11.16
Date: Sat, 21 Mar 2026 21:39:33 +0100
Message-ID: <20260321203933.366585-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 20:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125471

10.11 is an LTS version of MariaDB. This upgrade is part of that commitment.

Release notes:
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.16
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.15
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.14
https://mariadb.com/docs/release-notes/community-server/10.11/10.11.13

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...iadb-native_10.11.12.bb => mariadb-native_10.11.16.bb} | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                     | 2 +-
 ...io_linux-Check-if-syscall-exists-before-using-it.patch | 8 ++++----
 ...01-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch | 6 +++---
 .../mysql/{mariadb_10.11.12.bb => mariadb_10.11.16.bb}    | 0
 5 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb => mariadb-native_10.11.16.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb => mariadb_10.11.16.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.16.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.16.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f0cec75568..be310ef80a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
           "
-SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
+SRC_URI[sha256sum] = "e4f9f2035d38345464ae8abaeaf68380d1ceadbafb4e84744ed2ed5b7aab64e7"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
index aba9b9d966..1f6ae13102 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
@@ -18,13 +18,13 @@ Upstream-Status: Pending
  tpool/aio_linux.cc | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
+diff --git a/tpool/aio_libaio.cc b/tpool/aio_libaio.cc
 index 4abc213..da75411 100644
---- a/tpool/aio_linux.cc
-+++ b/tpool/aio_linux.cc
+--- a/tpool/aio_libaio.cc
++++ b/tpool/aio_libaio.cc
 @@ -58,6 +58,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
- */
  static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
+   noexcept
  {
 +#ifdef __NR_io_getevents
    int saved_errno= errno;
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
index 456a2bad64..cb8a2a3d2d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -18,8 +18,8 @@ diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
 index 241b482..27a3991 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -60,11 +60,18 @@ ${CMAKE_BINARY_DIR}/sql
- ${CMAKE_SOURCE_DIR}/tpool
+@@ -61,11 +61,18 @@ ${CMAKE_BINARY_DIR}/sql
+ ${CMAKE_BINARY_DIR}/sql
  )
  
 -ADD_CUSTOM_COMMAND(
@@ -41,7 +41,7 @@ index 241b482..27a3991 100644
  
  FIND_PACKAGE(BISON 2.4)
  
-@@ -372,11 +379,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
+@@ -394,11 +401,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
  
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.16.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.16.bb

