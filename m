Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCCEE78BEB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 02:38:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6R2ckFK009334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Jul 2018 19:38:47 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 26 Jul 2018 19:38:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 27 Jul 2018 10:49:00 +0800
Message-ID: <1532659740-5130-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rsyslog: fix race in parallel builds
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
X-List-Received-Date: Fri, 27 Jul 2018 02:38:48 -0000
Content-Type: text/plain

If libgcry.la is built later than lmcry_gcry.la, there is a failure:
[snip]
|../aarch64-wrs-linux-libtool  --tag=CC   --mode=link aarch64-wrs-linux-gcc
-o lmcry_gcry.la lmcry_gcry_la-lmcry_gcry.lo libgcry.la -lgcrypt
|aarch64-wrs-linux-libtool:   error: cannot find the library 'libgcry.la'
or unhandled argument 'libgcry.la'
|Makefile:1049: recipe for target 'lmcry_gcry.la' failed
|make[2]: *** [lmcry_gcry.la] Error 1
[snip]

The LIBADD of lmcry_gcry.la contains libgcry.la, we should also add libgcry.la
to lmcry_gcry.la's DEPENDENCIES.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../rsyslog/fix-race-in-parallel-builds.patch      | 41 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch
new file mode 100644
index 0000000..a1efe4d
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/fix-race-in-parallel-builds.patch
@@ -0,0 +1,41 @@
+From 7f003e3a7d4d6dda1cbca1694b62754878c58df0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 27 Jul 2018 10:19:29 +0800
+Subject: [PATCH] fix race in parallel builds
+
+If libgcry.la is built later than lmcry_gcry.la, there is a failure:
+[snip]
+|../aarch64-wrs-linux-libtool  --tag=CC   --mode=link aarch64-wrs-linux-gcc
+-o lmcry_gcry.la lmcry_gcry_la-lmcry_gcry.lo libgcry.la -lgcrypt
+|aarch64-wrs-linux-libtool:   error: cannot find the library 'libgcry.la'
+or unhandled argument 'libgcry.la'
+|Makefile:1049: recipe for target 'lmcry_gcry.la' failed
+|make[2]: *** [lmcry_gcry.la] Error 1
+[snip]
+
+The LIBADD of lmcry_gcry.la contains libgcry.la, we should also add libgcry.la
+to lmcry_gcry.la's DEPENDENCIES.
+
+Upstream-Status: Submitted [https://github.com/rsyslog/rsyslog/pull/2882]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ runtime/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/runtime/Makefile.am b/runtime/Makefile.am
+index 56bc08e..5ada0c4 100644
+--- a/runtime/Makefile.am
++++ b/runtime/Makefile.am
+@@ -202,7 +202,7 @@ if ENABLE_LIBGCRYPT
+    libgcry_la_SOURCES = libgcry.c libgcry_common.c libgcry.h
+    libgcry_la_CPPFLAGS = $(RSRT_CFLAGS) $(LIBGCRYPT_CFLAGS)
+    pkglib_LTLIBRARIES += lmcry_gcry.la
+-   lmcry_gcry_la_DEPENDENCIES = librsyslog.la
++   lmcry_gcry_la_DEPENDENCIES = librsyslog.la libgcry.la
+    lmcry_gcry_la_SOURCES = lmcry_gcry.c lmcry_gcry.h
+    lmcry_gcry_la_CPPFLAGS = $(RSRT_CFLAGS) $(LIBGCRYPT_CFLAGS)
+    lmcry_gcry_la_LDFLAGS = -module -avoid-version \
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
index 386ad32..9737892 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
+           file://fix-race-in-parallel-builds.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.7.4


