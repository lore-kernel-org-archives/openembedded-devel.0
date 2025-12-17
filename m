Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285E4D64099
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:13:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10710.1765962806636648673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=naMb7b/L;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso35581515e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 01:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765962805; x=1766567605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTrOAp8qxmh7TB/zuC1+QWoR83HkMx7LH5hkvej1SoI=;
        b=naMb7b/LI4Xj6g4oieIhERZ+hBb6ujm0lARDSEFnWAlbH7dCxE+vWOHHjl/WK54iWz
         fM2xq4QN6P+aPfx9rmNnTH0nHr/i7kCPuN6YfjqEiPqyCvkS3LWvuwQx0/NOGD7LRx8C
         yU9eaf0sOG2Ey0+ljkQSqDLL/t8CtGj3ZnrKTSdK5pqDW0CQvnncezgV7K+PEaWSpn0b
         dD/GcwZiZ19SQck7izOZOQ/IkhwA3pR8qQOOnhRUA+qId3YdUmTw1MK7U+4RgLa9EDL3
         AvGGcOhKKKOoGxPPiNomhvdcSCWV/D4K7ZiDyHGuL1+/6SvXiGDEHzWBGCB68qIMufB2
         kfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765962805; x=1766567605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTrOAp8qxmh7TB/zuC1+QWoR83HkMx7LH5hkvej1SoI=;
        b=uwDWvjcomGeF1CH51lacUOxocUmJ3JLYgXFrkA2VrG9aeqiPAwCp8HQN5PAPSydELN
         a0Il3L324HnnYYagze1oGwELw3D2LmYRHrbfIOi1p0eZrLU/01kzJg1p5wuo/2pVfBtE
         3HLmRuximXm1qSblSqUiw6minShYb3PRaaFwFGShgz4ijjcQxTiI5IUPvY5KRF3z5W7u
         lq0AAM8ArTDx3ic3TQTqXZ/5JN/+9gvp5uQPcazhan8rZBuy87/zcUQnFo1mQi7eX9rV
         ydR3fIKE7l/woen5zYpQlGsX7d6qkC9MIV14NLQFzfUDLjDkSVf2K/OPLr3ZYIWk7Zf3
         5kIw==
X-Gm-Message-State: AOJu0Yx9BoEiy/n3FgxaftBT3qqyV4G39z7FoH64m1+FNzbxvJjODbfk
	MZtS6kHGQgWEosgGfVIIGTkhV6Whm58zXsYKduBwEapgPziMT87PFi0cECmc7Q==
X-Gm-Gg: AY/fxX7MZoYc9YnnR0xjiy0vmh3iHRN1XzEvSkOZVoUj4NP9hOj02EQqeJDc5P6OX1t
	0yywzOMAocs75+JxgQGdyL0BdL8c0yHh7qdRTtHFacNYgI03zklPV3RsdSrATjW+Gjn1KcUYnLY
	HDsX2DGH3xfqLQm3yT2TTvtlAScpM7/254/545TQr28hCLuowxc5Ks4c1DYAJJhMwMfbH9uqy1Z
	65zIjHHXsYMhu82qBArvsw1qglr2f3E562wORh/X3BOcDRWA0rZESZNGuhxQYb4F7h32V6bbmGu
	wQWDbQdrEc2kkCcWitueNXF1BA4VK32EAlS5auvNyPcIvSl1tMOv6XoErn4Vrq/Xx3Ftv6cI2VX
	Qm4A+7PkUx/JK/sHcaNy2V4vBh7rN1ef+IqQYjCoSX80aC0dffXkLJ+Rxnw2dQEXk0Ik0yAl/Zu
	AlxtH5UQQj
X-Google-Smtp-Source: AGHT+IGhwHuSBcdrD4cKP/oE5VuiTqAPaB9FWfvoqCBkOuwZc4wHr3EEs5WMoISwV1NewYuz1TEl7w==
X-Received: by 2002:a05:600c:c3db:20b0:47a:7fd0:9f01 with SMTP id 5b1f17b1804b1-47a900bd6c4mr169094955e9.16.1765962804635;
        Wed, 17 Dec 2025 01:13:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1e1b19sm28794805e9.7.2025.12.17.01.13.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:13:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] zsync-curl: update to latest revision
Date: Wed, 17 Dec 2025 10:13:23 +0100
Message-ID: <20251217091323.3473514-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 09:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122721

Drop the incorporated patches.

Shortlog:
https://github.com/probonopd/zsync-curl/compare/00141c2806ccc4ddf2ff6263ee1612d19c0b713f...e0a7bbbcc137cf99d3cf05060496d57b72ce6a81

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zsync/zsync-curl/fixes.patch              | 115 ------------------
 .../zsync/zsync-curl/make.patch               |  50 --------
 .../recipes-extended/zsync/zsync-curl_git.bb  |   6 +-
 3 files changed, 2 insertions(+), 169 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/zsync/zsync-curl/fixes.patch
 delete mode 100644 meta-oe/recipes-extended/zsync/zsync-curl/make.patch

diff --git a/meta-oe/recipes-extended/zsync/zsync-curl/fixes.patch b/meta-oe/recipes-extended/zsync/zsync-curl/fixes.patch
deleted file mode 100644
index 1ec4993a1c..0000000000
--- a/meta-oe/recipes-extended/zsync/zsync-curl/fixes.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-Upstream-Status: Submitted [https://github.com/probonopd/zsync-curl/pull/41]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/src/configure.ac b/src/configure.ac
-index 10de8c4..6488140 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -9,7 +9,6 @@ AC_CONFIG_MACRO_DIR([autotools])
- AC_CANONICAL_HOST
- 
- AM_INIT_AUTOMAKE([dist-bzip2 no-dist-gzip foreign check-news -Woverride -Wobsolete -Wportability -Wsyntax -Wunsupported])
--AM_MAINTAINER_MODE
- 
- dnl --- Check for programs
- AC_PROG_CC
-@@ -23,6 +22,7 @@ AS_IF([test "x$enable_profile" = "xyes"], [
-    ZS_CFLAGS="${ZS_CFLAGS} -pg" ])
- 
- dnl --- Header files, typedefs, structures, libraries
-+AC_USE_SYSTEM_EXTENSIONS
- AC_C_CONST
- AC_HEADER_STDC
- # string.h, memory.h, stdlib.h both included in the default header checks
-@@ -55,10 +55,6 @@ case $host_os in
-        host_os_mingw32=yes
-        LIBS="${LIBS} -lwsock32"
-        ;;
--   *)
--       AC_DEFINE([_XOPEN_SOURCE], 600, [Enable POSIX extensions if present])
--       AC_DEFINE([_BSD_SOURCE],1, [Enable BSD extensions if present])
--       ;;
- esac
- AM_CONDITIONAL([MINGW32], test "x$host_os_mingw32" = "xyes")
- 
-diff --git a/src/librcksum/Makefile.am b/src/librcksum/Makefile.am
-index f4fce72..47754eb 100644
---- a/src/librcksum/Makefile.am
-+++ b/src/librcksum/Makefile.am
-@@ -1,4 +1,4 @@
--
-+AM_CPPFLAGS = "-I$(top_srcdir)"
- 
- noinst_LIBRARIES = librcksum.a
- 
-diff --git a/src/librcksum/md4.h b/src/librcksum/md4.h
-index e90603a..0ed7485 100644
---- a/src/librcksum/md4.h
-+++ b/src/librcksum/md4.h
-@@ -18,11 +18,8 @@
- 
- #include "zsglobal.h"
- 
--#ifdef HAVE_INTTYPES_H
--#include <inttypes.h>
--#else
-+#include <stdint.h>
- #include <sys/types.h>
--#endif
- 
- #define	MD4_BLOCK_LENGTH		64
- #define	MD4_DIGEST_LENGTH		16
-diff --git a/src/libzsync/Makefile.am b/src/libzsync/Makefile.am
-index 0a6ae85..33a5951 100644
---- a/src/libzsync/Makefile.am
-+++ b/src/libzsync/Makefile.am
-@@ -1,3 +1,4 @@
-+AM_CPPFLAGS = "-I$(top_srcdir)"
- 
- noinst_LIBRARIES = libzsync.a
- 
-diff --git a/src/libzsync/sha1.h b/src/libzsync/sha1.h
-index 3946505..87f3794 100644
---- a/src/libzsync/sha1.h
-+++ b/src/libzsync/sha1.h
-@@ -11,11 +11,8 @@
- 
- #include "config.h"
- 
--#ifdef HAVE_INTTYPES_H
--#include <inttypes.h>
--#else
-+#include <stdint.h>
- #include <sys/types.h>
--#endif
- 
- #define	SHA1_BLOCK_LENGTH		64
- #define	SHA1_DIGEST_LENGTH		20
-diff --git a/src/libzsync/zmap.c b/src/libzsync/zmap.c
-index f052dba..030b2a5 100644
---- a/src/libzsync/zmap.c
-+++ b/src/libzsync/zmap.c
-@@ -28,9 +28,6 @@
- #include <string.h>
- #include <sys/types.h>
- #include <arpa/inet.h>
--#ifdef HAVE_INTTYPES_H
--#include <inttypes.h>
--#endif
- 
- #ifdef WITH_DMALLOC
- # include <dmalloc.h>
-diff --git a/src/make.c b/src/make.c
-index 191b527..ba7f3a9 100644
---- a/src/make.c
-+++ b/src/make.c
-@@ -28,9 +28,6 @@
- #include <time.h>
- 
- #include <arpa/inet.h>
--#ifdef HAVE_INTTYPES_H
--#include <inttypes.h>
--#endif
- 
- #include <sys/types.h>
- #include <sys/stat.h>
diff --git a/meta-oe/recipes-extended/zsync/zsync-curl/make.patch b/meta-oe/recipes-extended/zsync/zsync-curl/make.patch
deleted file mode 100644
index ef19b5e85e..0000000000
--- a/meta-oe/recipes-extended/zsync/zsync-curl/make.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 3b9d64cf3c33ad235ed444f8715732e509ab023f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 9 Jun 2021 16:11:25 +0100
-Subject: [PATCH] Build zsyncmake
-
-No point having the zsync client without the server-side tool.
-
-Closes #42
----
- .gitignore      | 1 +
- src/Makefile.am | 5 ++++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/.gitignore b/.gitignore
-index 36f7bd8..728658e 100644
---- a/.gitignore
-+++ b/.gitignore
-@@ -22,3 +22,4 @@ src/librcksum/md4test
- src/libzsync/sha1test
- stamp-h1
- zsync_curl
-+zsyncmake_curl
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 5f8ff73..ffa2280 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -4,13 +4,16 @@ ACLOCAL_AMFLAGS = -I autotools
- 
- SUBDIRS = librcksum zlib libzsync doc
- 
--bin_PROGRAMS = zsync_curl
-+bin_PROGRAMS = zsync_curl zsyncmake_curl
- 
- zsync_curl_SOURCES = client.c http.c http.h url.c url.h progress.c progress.h base64.c format_string.h zsglobal.h
- zsync_curl_LDADD = libzsync/libzsync.a librcksum/librcksum.a zlib/libinflate.a $(LIBOBJS)
- 
- EXTRA_zsync_curl_SOURCES = getaddrinfo.h
- 
-+zsyncmake_curl_SOURCES = make.c makegz.c makegz.h format_string.h
-+zsyncmake_curl_LDADD = libzsync/libzsync.a librcksum/librcksum.a zlib/libinflate.a zlib/libdeflate.a -lm
-+
- # From "GNU autoconf, automake and libtool" Vaughan, Elliston, 
- # #  Tromey and Taylor, publisher New Riders, p.134
- # # They made me do it! :-)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
index 5227b834f9..e624b26941 100644
--- a/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
+++ b/meta-oe/recipes-extended/zsync/zsync-curl_git.bb
@@ -5,10 +5,8 @@ DEPENDS = "curl"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://src/COPYING;md5=71c0ac4d86266533509aa0825b8d323c"
 
-SRC_URI = "git://github.com/probonopd/zsync-curl;protocol=https;branch=master \
-           file://fixes.patch \
-           file://make.patch"
-SRCREV = "00141c2806ccc4ddf2ff6263ee1612d19c0b713f"
+SRC_URI = "git://github.com/probonopd/zsync-curl;protocol=https;branch=master"
+SRCREV = "e0a7bbbcc137cf99d3cf05060496d57b72ce6a81"
 
 PV = "0.6.2+git"
 

