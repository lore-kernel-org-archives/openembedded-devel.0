Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AC9CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:44:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.23174.1761230634825751767
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 07:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0/E6TTF;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47495477241so7676555e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230633; x=1761835433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=czn3CqucQIKaYG/lpZyPp8eBlAUjsEVUclg8qK1gs+k=;
        b=E0/E6TTFiDQV1HwMEX8fjaadzY0emEPHZ+BdjJhw1B3ywK9KylfSJL2NZBuCV6szTn
         WzbfFnltXNgxIzitHCRefs5PenRZW8yvSBdTCCYgfnk7s0r8uf3BFrzMk5+iIvxC6Non
         yINaMN7D+NZQs1rxxOXc8kzPjc27r1Pw3xsis4mQeHfw+beeaeKmu4gmdgnxhgB501bw
         keGdwwDzSFTpfxuDlezMCsJIxFcOgwPFNjYbzeo4mtT+I3afHcbn1FQ3XDSkvFS/+kj9
         diTJUgCfI9eaLskfem0mzLsiqSw9nONsV4lUXB5hne97uryYXI9adWd6mPy5tR+KQfuu
         FIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230633; x=1761835433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czn3CqucQIKaYG/lpZyPp8eBlAUjsEVUclg8qK1gs+k=;
        b=BWL+SOMwFA45jAr2yn7Cg6Bl97/xG5lsL3AXNqaYJ57PVfekEhWjkaEBunEVqRAi/8
         GEFpZ4SA+XrDTDCl83v7XDNqY8bMHaAKso3HLV8COh6UYwkGZzX2NL0iYGpY2tswlCp1
         2414NxmHZ2Y2Grr+XKioXazyIbY6a7xxNquC9PCo656gs8zTLXhxt3axvr7iRqoEbf1+
         7DNlv8ELxGC7rH0M0RrJKW4QHQwqGtlbaTjYOBMXEctsOAoj030+xQeEduTYHhm7PsdW
         QZgZZT/tVUPCSLBwGEECUo5rd/DJ52E9zhdpAILkJPOOpUFSFqa805FS1Oxtm+I6Dkyt
         Dr0g==
X-Gm-Message-State: AOJu0YyGDQC9yjy1R+mBvBl9o+K6o3BoLX7ImlQGO4xhMEg+Pwbq1/dd
	J4xbyEOJKsgqbszjy6ouEOT+3gDWnFjFxS6p8Ly+z5Bnx/ru/zzYfZChSeXMDg==
X-Gm-Gg: ASbGncsQYdmqGy8NF7qgyMLBXBxFZONsIR5X0CEtoszroNzg5a83uaLC5V43CkEsTon
	dYvG+h95BKFYNKIU7D73qnQDpMoeRDLL6ZSp7tbuaXoWrotTbazH+BJb9clDiK/EiOlpCeOTkVm
	m4RIV8pLSyI7AmtxsZrC8WKuMBUwRLT6RSFAl42icLGAYcWCTFGNLC5Od/PIhGWc65l0DzA5cAC
	B/3uUYEjV3PcFBc7gsWzz4BU7s40D0qXCf8jbTf+0L3Aho+Iny3UcSA+Yzs1Ys83oyY8KS0Equ4
	dDEkteCnd3f15qxGyRCbAr5qQdO8yOlrUDL+OwIsifA7XLZqVo8QBiZ8E/llcUQ4iDcNmDRFQFg
	uD9/pMX6ISsKfkc9HqiRUjRTNRefmJv9w60xez78oNm+eZF1tDoKTuXZylV938DviUN82uuxeKR
	zQV2D6RblE
X-Google-Smtp-Source: AGHT+IF6tiugm6LByEgqEua9Pw+LX/Be+DXEXHrbQzKH+C6Uzw4n7PqkSU+c4nXTBBzgtwjaKGSFfg==
X-Received: by 2002:a05:600c:4e4b:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-475cafae91fmr18933595e9.16.1761230632762;
        Thu, 23 Oct 2025 07:43:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccd88sm5278872f8f.36.2025.10.23.07.43.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:43:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
Date: Thu, 23 Oct 2025 16:43:50 +0200
Message-ID: <20251023144351.264756-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 14:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120934

Drop patch that was merged into this release.

Changelog: https://odbc.postgresql.org/docs/release.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...sure-to-call-AC_CHECK_HEADER_STDBOOL.patch | 45 -------------------
 ...c_16.00.0000.bb => psqlodbc_17.00.0006.bb} |  4 +-
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_16.00.0000.bb => psqlodbc_17.00.0006.bb} (92%)

diff --git a/meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch b/meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch
deleted file mode 100644
index 9cc5ad9b86..0000000000
--- a/meta-oe/recipes-dbs/psqlodbc/files/0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5bfa9f1cd0523a0cad70cacf5ecf8c1aeb06c4d0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Tue, 22 Apr 2025 17:47:02 +0000
-Subject: [PATCH] configure: make sure to call AC_CHECK_HEADER_STDBOOL
-
-before using ac_cv_sizeof_bool
-
-It was called after this conditional, so PG_USE_STDBOOL wasn't set
-even when it should be as shown in at the end of config.log:
-
-  ac_cv_header_stdbool_h=yes
-  ac_cv_sizeof_bool=1
-  ac_cv_type__Bool=yes
-  #define SIZEOF_BOOL 1
-  #define HAVE__BOOL 1
-  #define HAVE_STDBOOL_H 1
-
-* fixes:
-  https://github.com/postgresql-interfaces/psqlodbc/issues/110
-  https://github.com/postgresql-interfaces/psqlodbc/issues/94
-
-Upstream-Status: Submitted [https://github.com/postgresql-interfaces/psqlodbc/pull/112]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- configure.ac | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f35c825..ea363ca 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,9 +28,11 @@ AC_CHECK_SIZEOF([bool], [],
- #include <stdbool.h>
- #endif])
- 
-+AC_CHECK_HEADER_STDBOOL()
-+
- dnl We use <stdbool.h> if we have it and it declares type bool as having
- dnl size 1.  Otherwise, c.h will fall back to declaring bool as unsigned char.
--if test "$ac_cv_header_stdbool_h" = yes -a "$ac_cv_sizeof_bool" = 1; then
-+if test "$ac_cv_header_stdbool_h" = yes && test "$ac_cv_sizeof_bool" = 1; then
-   AC_DEFINE([PG_USE_STDBOOL], 1,
-             [Define to 1 to use <stdbool.h> to define type bool.])
- fi
diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
similarity index 92%
rename from meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
rename to meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
index dfd7f6a1e6..cead6789f4 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_17.00.0006.bb
@@ -19,11 +19,11 @@ HOMEPAGE = "https://odbc.postgresql.org/"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
 
-SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${PV}.tar.gz \
+PV_WITH_USCORE = "${@d.getVar('PV').replace('.', '_')}"
+SRC_URI = "git://github.com/postgresql-interfaces/psqlodbc.git;protocol=https;branch=main;tag=REL-${PV_WITH_USCORE} \
     file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
     file://psqlodbc-donot-use-the-hardcode-libdir.patch \
     file://psqlodbc-fix-for-ptest-support.patch \
-    file://0001-configure-make-sure-to-call-AC_CHECK_HEADER_STDBOOL.patch \
     file://run-ptest \
 "
 

