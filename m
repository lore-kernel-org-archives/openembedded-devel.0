Return-Path: <daniel.klauer@gin.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A91FD3769
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 15:38:44 +0000 (UTC)
Received: from good-out-23.clustermail.de (good-out-23.clustermail.de [212.223.155.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48037.1772033908307644700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 07:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gin.de, ip: 212.223.155.3, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.14] (helo=frontend.clustermail.de)
	by smtpout-01.clustermail.de with esmtp (Exim 4.96)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1vvGy0-007sGW-0r;
	Wed, 25 Feb 2026 16:38:24 +0100
Received: from [62.157.191.2] (helo=GIN-GR-EXCH01.gin-domain.local)
	by frontend.clustermail.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1vvGy0-00CpYU-0H;
	Wed, 25 Feb 2026 16:38:24 +0100
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
 GIN-GR-EXCH01.gin-domain.local (10.160.128.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Feb 2026 16:38:23 +0100
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Anuj Mittal <anuj.mittal@oss.qualcomm.com>, Daniel Klauer
	<daniel.klauer@gin.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][whinlatter][PATCH] nbench-byte: Fix sysinfo generation in parallel build
Date: Wed, 25 Feb 2026 16:37:10 +0100
Message-ID: <20260225153710.1256698-1-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: GIN-GR-EXCH01.gin-domain.local (10.160.128.6) To
 GIN-GR-EXCH01.gin-domain.local (10.160.128.6)
X-EsetResult: clean, is OK
X-EsetId: 37303A2952B0055E60716A
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 15:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124653

The project Makefile uses a script (sysinfo.sh) to non-atomically generate
two .c files (sysinfo.c, sysinfoc.c) which are then included in the build.
Since the script always overwrites both .c files, the Makefile should only
invoke it once, not twice in parallel. Otherwise the .c files may be
corrupted and cause random build failures in parallel builds.

Requires at least GNU make 4.3, for Grouped Targets support [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html

Reviewed-by: Silvio Fricke <silvio.fricke@gin.de>
Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit add2d94ab7d4170cece4e20af829a7221c572d5f)
---
 ...sysinfo-generation-in-parallel-build.patch | 69 +++++++++++++++++++
 .../sysinfo.sh-Fix-typo-in-rm-command.patch   | 27 ++++++++
 .../nbench-byte/nbench-byte_2.2.3.bb          |  4 +-
 3 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
new file mode 100644
index 0000000000..b5f60b1c87
--- /dev/null
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
@@ -0,0 +1,69 @@
+From 26e13ce45ffeb2f233d1dd7e4321cb65ab10b0fb Mon Sep 17 00:00:00 2001
+From: Daniel Klauer <daniel.klauer@gin.de>
+Date: Fri, 6 Feb 2026 17:13:49 +0100
+Subject: [PATCH] Makefile: Fix sysinfo generation in parallel build
+
+sysinfo.sh non-atomically overwrites both sysinfo.c and sysinfoc.c,
+so it should only be invoked once, not twice in parallel.
+
+Requires at least GNU make 4.3, for Grouped Targets support [1].
+
+Should fix random build failures like this one:
+
+| NOTE: make -j 20 -e MAKEFLAGS=
+[...]
+| ./sysinfo.sh x86_64-gin-linux-gcc [...]
+| ./sysinfo.sh x86_64-gin-linux-gcc [...]
+[...]
+| x86_64-gin-linux-gcc [...] \
+| 	-c nbench0.c
+| In file included from nbench0.c:219:
+| sysinfo.c: In function 'main':
+| sysinfo.c:11:1: error: 'fer' undeclared (first use in this function)
+|    11 | fer);
+|       | ^~~
+| sysinfo.c:11:1: note: each undeclared identifier is reported only once for each function it appears in
+| sysinfo.c:11:4: error: expected ';' before ')' token
+|    11 | fer);
+|       |    ^
+|       |    ;
+| sysinfo.c:11:4: error: expected statement before ')' token
+| In file included from nbench0.c:317:
+| sysinfoc.c:5:4: error: expected ';' before ')' token
+|     5 | fer);
+|       |    ^
+|       |    ;
+| sysinfoc.c:5:4: error: expected statement before ')' token
+| make: *** [Makefile:115: nbench0.o] Error 1
+| make: *** Waiting for unfinished jobs....
+| ERROR: oe_runmake failed
+| WARNING: exit code 1 from a shell command.
+NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Failed
+
+[1] https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html
+Upstream-Status: Inactive-Upstream [lastrelease 2003, no vcs]
+Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
+---
+ Makefile | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index edd9ea2..66b2ddc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -95,10 +95,8 @@ DEFINES= -DLINUX $(NO_UNAME)
+ 
+ ##########################################################################
+ # For LINUX-like systems with gcc
+-sysinfoc.c: Makefile
+-	./sysinfo.sh $(CC) $(MACHINE) $(DEFINES) $(CFLAGS)
+-
+-sysinfo.c: Makefile
++# sysinfo.sh generates both sysinfo.c and sysinfoc.c
++sysinfo.c sysinfoc.c &: Makefile
+ 	./sysinfo.sh $(CC) $(MACHINE) $(DEFINES) $(CFLAGS)
+ 
+ ##########################################################################
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
new file mode 100644
index 0000000000..c6a37c3e56
--- /dev/null
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
@@ -0,0 +1,27 @@
+From 0019af6eb5188f5111a0f2008c0002b545382b67 Mon Sep 17 00:00:00 2001
+From: Daniel Klauer <daniel.klauer@gin.de>
+Date: Fri, 6 Feb 2026 17:14:53 +0100
+Subject: [PATCH] sysinfo.sh: Fix typo in rm command
+
+Upstream-Status: Inactive-Upstream [lastrelease 2003, no vcs]
+Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
+---
+ sysinfo.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysinfo.sh b/sysinfo.sh
+index 57754fe..1373699 100755
+--- a/sysinfo.sh
++++ b/sysinfo.sh
+@@ -61,7 +61,7 @@ if ($* hello.c -o hello) >/dev/null 2>&1; then
+   fi
+ fi
+ 
+-rm -f sysinfo.crm sysinfoc.c hello
++rm -f sysinfo.c sysinfoc.c hello
+ 
+ # this bombs out on Ultrix which expect "cut -d"
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index da03ebb291..538ff24c0a 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -10,7 +10,9 @@ SECTION = "console/utils"
 SRC_URI = "https://fossies.org/linux/misc/old/${BP}.tar.gz \
            file://nbench_32bits.patch \
            file://Makefile-add-more-dependencies-to-pointer.h.patch \
-           file://0001-Fix-build-error-with-gcc-15.patch"
+           file://0001-Fix-build-error-with-gcc-15.patch \
+           file://Makefile-Fix-sysinfo-generation-in-parallel-build.patch \
+           file://sysinfo.sh-Fix-typo-in-rm-command.patch"
 
 SRC_URI[sha256sum] = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed9101ac"
 
-- 
2.43.0


