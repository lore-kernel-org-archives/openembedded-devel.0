Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7781CE78499
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 22:23:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129118.1766615035457439011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 14:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaRsBBf+;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso33139685e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 14:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766615034; x=1767219834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=884uKVM4RQif42/Qs8JdnJDKAZ/E/WZZuF9i10cLlzU=;
        b=BaRsBBf+tQ+x6sOn/1Oz3npYkNAAE9aUj/z8AotqyLDP9zqKT8m3gfycwUbGwopEDG
         Bdtupo9Q9qobKnVMhKDcS9ZMXXCN0p9WkorqjX0bGk809t+Z+BP+ncWD+8qDOW6Y7NiF
         KP4g+zoNM7TriJ3qRE/FpvxTWORhboFRUlvVZc+2qchis/U+GQUj2XQOtButtpBMfxPN
         ubK8Scfd7Ks1IPOF6GP1Cr1c+E1ps7zTdcYmM/b0VIDeqTjVvo+6LGCo22+BQxbKiRu3
         BGpFeQcn3UA6xGjBu0Xjgu2f2HGCnLrrOkeCvY8F/yoVd/kvfl57YgOAFOpUsy+5SflV
         +1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766615034; x=1767219834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=884uKVM4RQif42/Qs8JdnJDKAZ/E/WZZuF9i10cLlzU=;
        b=ONHRKr2GYlhEF5kUcCMNkkRNfmb7FRSFcurEzxg/jgfgUuoHItkFpneSpD5hDxSOzH
         Z79xTI5MHI43X98sCEHxqD/iCsRSRhed2MXu5nFjZLE0ApreqNZa2esU/ELjxSYBcK/T
         2t1u3gerAv22NSPJsY0gmg9a15j/PiyDhW0CtwSSs39FrLT97436IsVpoGMZCapVGAGI
         DC6Ldb1zMUCDfnCt/gTLI1NZo3rPuaTgy/8Bz4shDtuey1L4uKyQJbsprWnxB1nax7WQ
         mA1+U8FWw7Ep2F4+A80ET3phZB6ejPfxedTqhrH+phQKHAha90/DEsEvC4sP5TRW98sO
         UzuQ==
X-Gm-Message-State: AOJu0YyrvBCxQuG0Sik4pp1Ry9D+tgtVRUKzYniatXwvzuLXH7vvWa22
	bMiN0Xc9edAMBIobf3WNpBHC1gLUsBmm/JS9m8cdU4rCf0acu1y9enO0a4LYUw==
X-Gm-Gg: AY/fxX4qrtGBWtCpeoILqJXyLVSlEntMKFScc4IXDwLuksunsXm2Xe96kWiCDS1kPFl
	3IZlqnXE1BSNbsKoz7hlAIUrFpFsxzb0ANEvwxERltXYN7MVv1aUSXVTdotasqwDLx5EsYpnc21
	ZfD1IlfHspJx3UWZtlnrgClwyGu7tLstXJSQgc8DgPv7RhBmQTD3toUVCdGPXq/mPseFBfWHNq2
	Ks/aGS1+SZ3sPQlSJmi89SBpWCagAP3WQQ8t+MWiQUx4PkS5XjPXX6W8ZHh0vVy4lwl8iiuMHjv
	N8zFlEOcW0oD/DYGmzzsCUa1S5ZBsoYcrbxS4yiqwBrnJnQV+pZsdvKPcSAq0NLhMxn6O80jFpH
	//C7cJURqqe60PkIhiQNsBedXs8EBblNpQBw144RsnrcH1wBx91t2k0OM1OpF8H1XUTz6lLZ529
	NjgpDCESKL
X-Google-Smtp-Source: AGHT+IHMAaz5sy1fyb+0R0hO3UiTKYi2Eozw0mogNA22U0FUQ46p3SX9NcAiyJmqcZTZtx31BF2jQA==
X-Received: by 2002:a05:600c:35c4:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-47d195869e7mr225495155e9.28.1766615033712;
        Wed, 24 Dec 2025 14:23:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm323775965e9.3.2025.12.24.14.23.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:23:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 1/2] vorbis-tools: upgrade 1.4.2 -> 1.4.3
Date: Wed, 24 Dec 2025 23:23:51 +0100
Message-ID: <20251224222352.2993909-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 22:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122908

From: Vijay Anusuri <vanusuri@mvista.com>

Refreshed gettext.patch
Dropped 0001-ogginfo-Include-utf8.h-for-missing-utf8_decode.patch & CVE-2023-43361.patch
Dropped patches fixed in newer version
Dropped md5sum

Changelog:
https://gitlab.xiph.org/xiph/vorbis-tools/-/blob/release-1.4.3/CHANGES

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 37a17c25cc38e8207db96b106c0de88dd3977df7)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...g-include-utf8.h-to-codec_skeleton.c.patch | 28 ---------
 .../vorbis-tools/CVE-2023-43361.patch         | 57 -------------------
 .../vorbis-tools/vorbis-tools/gettext.patch   | 44 ++++++++------
 ...s-tools_1.4.2.bb => vorbis-tools_1.4.3.bb} |  4 +-
 4 files changed, 29 insertions(+), 104 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
 rename meta-multimedia/recipes-multimedia/vorbis-tools/{vorbis-tools_1.4.2.bb => vorbis-tools_1.4.3.bb} (79%)

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
deleted file mode 100644
index db7d142543..0000000000
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 68c5a33685f5b86e7f18f239ceb8861484fee552 Mon Sep 17 00:00:00 2001
-From: Petter Reinholdtsen <pere@debian.org>
-Date: Sun, 6 Apr 2025 07:53:53 +0200
-Subject: [PATCH] Added missing include "utf8.h" to codec_skeleton.c.
-
-Patch from Sebastian Ramacher <sramacher@debian.org> and Debian.
-
-Upstream-Status: Backport [https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/68c5a33685f5b86e7f18f239ceb8861484fee552]
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- ogginfo/codec_skeleton.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
-index a27f8da..0709860 100644
---- a/ogginfo/codec_skeleton.c
-+++ b/ogginfo/codec_skeleton.c
-@@ -25,6 +25,7 @@
- #include <ogg/ogg.h>
- 
- #include "i18n.h"
-+#include "utf8.h"
- 
- #include "private.h"
- 
--- 
-GitLab
-
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
deleted file mode 100644
index 69286907fa..0000000000
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 5bb47f58582c15c2413564b741d1d95e7b566aa8 Mon Sep 17 00:00:00 2001
-From: Ralph Giles <giles@thaumas.net>
-Date: Sun, 17 Sep 2023 11:49:12 -0700
-Subject: [PATCH] oggenc: Don't assume the output path ends in a file name.
-
-oggenc attempts to create any specified directories in the output
-file path if they don't exist. The parser was assuming there was
-a final filename after the last directory separator, and so would
-try to read off the end of the argument if it was a bare directory
-such as `./` or `outdir/`. It also did not handle more than one
-consecutive separator. This corrects both issues.
-
-Thanks to Frank-Z7 (Zeng Yunxiang) at Huazhong University of Science
-and Technology (cse.hust.edu.cn) for the report.
-
-Fixes CVE-2023-43361.
-
-Upstream-Status: Backport [https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/5bb47f58582c15c2413564b741d1d95e7b566aa8]
-CVE: CVE-2023-43361
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- oggenc/platform.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/oggenc/platform.c b/oggenc/platform.c
-index 6d9f4ef..d50ad99 100644
---- a/oggenc/platform.c
-+++ b/oggenc/platform.c
-@@ -136,18 +136,22 @@ int create_directories(char *fn, int isutf8)
- {
-     char *end, *start;
-     struct stat statbuf;
--    char *segment = malloc(strlen(fn)+1);
-+    const size_t fn_len = strlen(fn);
-+    char *segment = malloc(fn_len+1);
- #ifdef _WIN32
-     wchar_t seg[MAX_PATH+1];
- #endif
- 
-     start = fn;
- #ifdef _WIN32
--    if(strlen(fn) >= 3 && isalpha(fn[0]) && fn[1]==':')
-+    // Strip drive prefix
-+    if(fn_len >= 3 && isalpha(fn[0]) && fn[1]==':') {
-         start = start+2;
-+    }
- #endif
- 
--    while((end = strpbrk(start+1, PATH_SEPS)) != NULL)
-+    // Loop through path segments, creating directories if necessary
-+    while((end = strpbrk(start + strspn(start, PATH_SEPS), PATH_SEPS)) != NULL)
-     {
-         int rv;
-         memcpy(segment, fn, end-fn);
--- 
-GitLab
-
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
index dd03fa9524..5044427a95 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/gettext.patch
@@ -3,18 +3,40 @@ Fix build with gettext 0.20.x
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+---
+ Makefile.am  | 4 ++--
+ configure.ac | 3 +--
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 62c36d7..201c69c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,8 +2,8 @@
+ 
+ AUTOMAKE_OPTIONS = foreign dist-zip
+ 
+-SUBDIRS = po intl include share win32 @OPT_SUBDIRS@ tests
+-DIST_SUBDIRS = po intl include share win32 ogg123 oggenc oggdec ogginfo \
++SUBDIRS = po include share win32 @OPT_SUBDIRS@ tests
++DIST_SUBDIRS = po include share win32 ogg123 oggenc oggdec ogginfo \
+ 	vcut vorbiscomment m4 tests
+ 
+ EXTRA_DIST = config.rpath README AUTHORS COPYING CHANGES
+diff --git a/configure.ac b/configure.ac
+index 6751ec8..67746ce 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -34,7 +34,7 @@
+@@ -34,7 +34,7 @@ CFLAGS="$cflags_save"
  AC_PROG_LIBTOOL
  
- ALL_LINGUAS="be cs da en_GB eo es fr hr hu nl pl ro ru sk sv uk vi"
+ ALL_LINGUAS="be cs da de en_GB eo es fr hr hu id ka nb nl pl ro ru sk sl sr sv uk vi "
 -AM_GNU_GETTEXT
 +AM_GNU_GETTEXT([external])
  
  dnl --------------------------------------------------
  dnl System checks
-@@ -397,7 +397,6 @@
+@@ -413,7 +413,6 @@ AC_CONFIG_FILES([
  Makefile
  m4/Makefile
  po/Makefile.in
@@ -22,16 +44,6 @@ Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
  include/Makefile
  share/Makefile
  win32/Makefile
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,8 +2,8 @@
- 
- AUTOMAKE_OPTIONS = foreign dist-zip
- 
--SUBDIRS = po intl include share win32 @OPT_SUBDIRS@
--DIST_SUBDIRS = po intl include share win32 ogg123 oggenc oggdec ogginfo \
-+SUBDIRS = po include share win32 @OPT_SUBDIRS@
-+DIST_SUBDIRS = po include share win32 ogg123 oggenc oggdec ogginfo \
- 	vcut vorbiscomment m4
- 
- EXTRA_DIST = config.rpath README AUTHORS COPYING CHANGES
+-- 
+2.43.0
+
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.3.bb
similarity index 79%
rename from meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
rename to meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.3.bb
index 33a212de8e..778b848534 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.3.bb
@@ -12,11 +12,9 @@ DEPENDS = "libogg libvorbis"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://gettext.patch \
-           file://0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch \
-           file://CVE-2023-43361.patch \
           "
 
-SRC_URI[sha256sum] = "db7774ec2bf2c939b139452183669be84fda5774d6400fc57fde37f77624f0b0"
+SRC_URI[sha256sum] = "a1fe3ddc6777bdcebf6b797e7edfe0437954b24756ffcc8c6b816b63e0460dde"
 
 inherit autotools pkgconfig gettext
 

