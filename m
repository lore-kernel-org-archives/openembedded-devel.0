Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4514060069
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:36:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7U3aqmb013795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:36:52 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 29 Aug 2018 20:36:51 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Aug 2018 20:36:49 -0700
Message-ID: <20180830033649.60425-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: update from 8.36 to 8.37
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2018 03:36:51 -0000
Content-Type: text/plain

Drop upstreamed patch:
   edce434db fix race in parallel builds

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../rsyslog/fix-race-in-parallel-builds.patch | 41 -------------------
 .../{rsyslog_8.36.0.bb => rsyslog_8.37.0.bb}  |  5 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.36.0.bb => rsyslog_8.37.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch
deleted file mode 100644
index a1efe4d4b..000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7f003e3a7d4d6dda1cbca1694b62754878c58df0 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 27 Jul 2018 10:19:29 +0800
-Subject: [PATCH] fix race in parallel builds
-
-If libgcry.la is built later than lmcry_gcry.la, there is a failure:
-[snip]
-|../aarch64-wrs-linux-libtool  --tag=CC   --mode=link aarch64-wrs-linux-gcc
--o lmcry_gcry.la lmcry_gcry_la-lmcry_gcry.lo libgcry.la -lgcrypt
-|aarch64-wrs-linux-libtool:   error: cannot find the library 'libgcry.la'
-or unhandled argument 'libgcry.la'
-|Makefile:1049: recipe for target 'lmcry_gcry.la' failed
-|make[2]: *** [lmcry_gcry.la] Error 1
-[snip]
-
-The LIBADD of lmcry_gcry.la contains libgcry.la, we should also add libgcry.la
-to lmcry_gcry.la's DEPENDENCIES.
-
-Upstream-Status: Submitted [https://github.com/rsyslog/rsyslog/pull/2882]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- runtime/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/runtime/Makefile.am b/runtime/Makefile.am
-index 56bc08e..5ada0c4 100644
---- a/runtime/Makefile.am
-+++ b/runtime/Makefile.am
-@@ -202,7 +202,7 @@ if ENABLE_LIBGCRYPT
-    libgcry_la_SOURCES = libgcry.c libgcry_common.c libgcry.h
-    libgcry_la_CPPFLAGS = $(RSRT_CFLAGS) $(LIBGCRYPT_CFLAGS)
-    pkglib_LTLIBRARIES += lmcry_gcry.la
--   lmcry_gcry_la_DEPENDENCIES = librsyslog.la
-+   lmcry_gcry_la_DEPENDENCIES = librsyslog.la libgcry.la
-    lmcry_gcry_la_SOURCES = lmcry_gcry.c lmcry_gcry.h
-    lmcry_gcry_la_CPPFLAGS = $(RSRT_CFLAGS) $(LIBGCRYPT_CFLAGS)
-    lmcry_gcry_la_LDFLAGS = -module -avoid-version \
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
index 13c1f56ee..fb151428f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
@@ -24,15 +24,14 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
-           file://fix-race-in-parallel-builds.patch \
 "
 
 SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "6846bb6d37af3ce067988dd2460d3a5d"
-SRC_URI[sha256sum] = "8a4b5beb92c6b308c3d14de2364c2788f62ef5d37ca0448144619edfe508ee70"
+SRC_URI[md5sum] = "e0942b4b88a13602a6b6352bf9f05091"
+SRC_URI[sha256sum] = "295c289b4c8abd8f8f3fe35a83249b739cedabe82721702b910255f9faf147e7"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.17.1


