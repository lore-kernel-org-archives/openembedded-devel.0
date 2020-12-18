Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6500.1608276050424216426
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102706561"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 15:20:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DA47F4CE600B
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 15:20:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:20:31 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] vblade: upgrade 24 -> 25
Date: Sat, 19 Dec 2020 03:20:28 +0800
Message-ID: <1608319228-4675-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DA47F4CE600B.AA29D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

gcc-10.patch
Removed since this is included in 25.

Refresh the following patch:
cross.patch
makefile-add-ldflags.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/vblade/files/cross.patch  |  4 +-
 .../recipes-daemons/vblade/files/gcc-10.patch | 85 -------------------
 .../vblade/files/makefile-add-ldflags.patch   |  2 +-
 .../vblade/{vblade_24.bb => vblade_25.bb}     |  3 +-
 4 files changed, 4 insertions(+), 90 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/vblade/files/gcc-10.patch
 rename meta-networking/recipes-daemons/vblade/{vblade_24.bb => vblade_25.bb} (95%)

diff --git a/meta-networking/recipes-daemons/vblade/files/cross.patch b/meta-networking/recipes-daemons/vblade/files/cross.patch
index d2eb15614..f3dc31c93 100644
--- a/meta-networking/recipes-daemons/vblade/files/cross.patch
+++ b/meta-networking/recipes-daemons/vblade/files/cross.patch
@@ -8,8 +8,8 @@ diff -urN vblade-19.old//makefile vblade-19//makefile
 @@ -9,8 +9,6 @@
  mandir = ${sharedir}/man
  
- O=aoe.o bpf.o ${PLATFORM}.o ata.o
--CFLAGS += -Wall -g -O2
+ O=aoe.o bpf.o ${PLATFORM}.o ata.o dat.o
+-CFLAGS += -Wall -g -O2 -fno-common
 -CC = gcc
  
  vblade: $O
diff --git a/meta-networking/recipes-daemons/vblade/files/gcc-10.patch b/meta-networking/recipes-daemons/vblade/files/gcc-10.patch
deleted file mode 100644
index 9a42aa369..000000000
--- a/meta-networking/recipes-daemons/vblade/files/gcc-10.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From af17efc862b9acfd63ce2ecb21f75ed890a93a5d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20K=C3=B6lbl?= <koelblandreas@freenet.de>
-Date: Thu, 9 Jul 2020 14:29:18 +0200
-Subject: [PATCH] Fix linkage of global identifiers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Align the code to the standard and modern compilers.
-
-Upstream-Status: Submitted [https://github.com/OpenAoE/vblade/pull/15]
-Signed-off-by: Andreas Kölbl <koelblandreas@freenet.de>
----
- dat.c    | 12 ++++++++++++
- dat.h    | 19 ++++++++++---------
- makefile |  7 +++++--
- 3 files changed, 27 insertions(+), 11 deletions(-)
- create mode 100644 dat.c
-
---- /dev/null
-+++ b/dat.c
-@@ -0,0 +1,12 @@
-+/* dat.c: Global memory for vblade AoE target */
-+#include "dat.h"
-+
-+int	shelf, slot;
-+ulong	aoetag;
-+uchar	mac[6];
-+int	bfd;		// block file descriptor
-+int	sfd;		// socket file descriptor
-+vlong	size;		// size of vblade
-+vlong	offset;
-+char	*progname;
-+char	serial[Nserial+1];
---- a/dat.h
-+++ b/dat.h
-@@ -1,4 +1,5 @@
- /* dat.h: include file for vblade AoE target */
-+#include <sys/types.h>
- 
- #define	nil	((void *)0)
- /*
-@@ -163,12 +164,12 @@ enum {
- 	Nserial= 20,
- };
- 
--int	shelf, slot;
--ulong	aoetag;
--uchar	mac[6];
--int	bfd;		// block file descriptor
--int	sfd;		// socket file descriptor
--vlong	size;		// size of vblade
--vlong	offset;
--char	*progname;
--char	serial[Nserial+1];
-+extern int	shelf, slot;
-+extern ulong	aoetag;
-+extern uchar	mac[6];
-+extern int	bfd;		// block file descriptor
-+extern int	sfd;		// socket file descriptor
-+extern vlong	size;		// size of vblade
-+extern vlong	offset;
-+extern char	*progname;
-+extern char	serial[Nserial+1];
---- a/makefile
-+++ b/makefile
-@@ -8,7 +8,7 @@ sbindir = ${prefix}/sbin
- sharedir = ${prefix}/share
- mandir = ${sharedir}/man
- 
--O=aoe.o bpf.o ${PLATFORM}.o ata.o
-+O=aoe.o bpf.o ${PLATFORM}.o ata.o dat.o
- 
- vblade: $O
- 	${CC} ${LDFLAGS} -o vblade $O
-@@ -25,6 +25,9 @@ ata.o : ata.c config.h dat.h fns.h makef
- bpf.o : bpf.c
- 	${CC} ${CFLAGS} -c $<
- 
-+dat.o : dat.c
-+	${CC} ${CFLAGS} -c $<
-+
- config.h : config/config.h.in makefile
- 	@if ${CC} ${CFLAGS} config/u64.c > /dev/null 2>&1; then \
- 	  sh -xc "cp config/config.h.in config.h"; \
diff --git a/meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch b/meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
index a74452db6..71af47ac7 100644
--- a/meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
+++ b/meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
@@ -9,7 +9,7 @@ index 98008da..c328ba7 100644
 --- a/makefile
 +++ b/makefile
 @@ -11,7 +11,7 @@ mandir = ${sharedir}/man
- O=aoe.o bpf.o ${PLATFORM}.o ata.o
+ O=aoe.o bpf.o ${PLATFORM}.o ata.o dat.o
  
  vblade: $O
 -	${CC} -o vblade $O
diff --git a/meta-networking/recipes-daemons/vblade/vblade_24.bb b/meta-networking/recipes-daemons/vblade/vblade_25.bb
similarity index 95%
rename from meta-networking/recipes-daemons/vblade/vblade_24.bb
rename to meta-networking/recipes-daemons/vblade/vblade_25.bb
index 09ba8cfd9..647abbfd2 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_24.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_25.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/aoetools/files/vblade/"
 
-SRCREV = "a7f48bda5bf1646f6450601049bf4b74053adbb3"
+SRCREV = "5f1a0ba8b9815e3f08a3e2635a17f78bbf2a5b10"
 SRC_URI = "git://github.com/OpenAoE/vblade \
            file://cross.patch \
            file://makefile-add-ldflags.patch \
-           file://gcc-10.patch \
            file://${BPN}.conf \
            file://${BPN}.init \
            file://${BPN}.service \
-- 
2.25.1



