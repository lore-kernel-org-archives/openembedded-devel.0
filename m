Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.7765.1623318758219227178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 02:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FEn1DMoN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623318756; i=@fujitsu.com;
	bh=0Vd+SUeay6zcwSEHEwtERR6YywKVJIIOJJ8lHFK3E8s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FEn1DMoNfGZ74h3a/XguWx2JtJqocvaExPpdyWszcHtGrpp/Mj2V/WIc36tXOH5e6
	 egmJCPRmRxrS1COqR2L4yY3Oh+H1nUdcQw1MHpacbzsFbxUrsy/WFuCs7Fc+XO+lgn
	 RSplire61CAOlos4fswl6QPdACSfBbF04iP7aX6DgoIujsxrchLt7P/PqzD9TBQCX1
	 jZISLkfwEEVsQwj1zN4ktBTHT8/5LTevIlUVsGbGI+PtRTYc+shsBL5mHmDZz7gX4Z
	 kZnMu1RFue4uKJ7wegmc+14tpMFwWB08BUzz0j9xtYtYf3ltC+fcYLIlyur1Ybzfmc
	 ngMnoe0pjlxGA==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 8F/33-00056-4E0E1C06; Thu, 10 Jun 2021 09:52:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqvv4wcE
  Egx+/LSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxrL54yFnzTqXgyeR1jA+MGtS5GLg4hgdlM
  EtsW7mXqYuQEcvYwSrx7HgRiswnoSpx7vJYdxBYR0JdYOnsPM4gtLGAtMefvP1YQm0VAVWLzw
  qlAcQ4OXgF3ibUd8SBhCQEFiSkP34OV8woISpyc+YQFxGYWkJA4+OIFWLmEgKLE7OnyEOUVEj
  NmbGObwMgzC0nHLCQdCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpamusaGpvrJVbpJumlluq
  WpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgSGUErB0c4djL9efdA7xCjJwaQkytt+9WCCEF9Sfkpl
  RmJxRnxRaU5q8SFGGQ4OJQleq3tAOcGi1PTUirTMHGA4w6QlOHiURHj1gSEtxFtckJhbnJkOk
  TrFqCglzpt9HyghAJLIKM2Da4PF0CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryLQKbwZO
  aVwE1/BbSYCWixo/E+kMUliQgpqQYm5gapOxUOjxWK+A1/PpYq4fWc+jolYEFzwmNvCXkdJn6
  V94ds8s9M+sdXbzKZV+Dkkuikqdr/1qusDt38xkw4PyC376l+X8BOsycVPtd9ps1tjJ19LOHf
  Pp2K9GUPE71fpd6ffs3x76sJ3S/WF0h+efhyV7um55MJ69TXn+b/nBK4xlFS6lyjeaffGv+g+
  PgO4XMe+f9XMnZ6CiRWb6+2Pz1/ypPkBasNt4qw8TZebJrRbaVglzV7572TZlIXX8z/MnX6Yr
  9nFQvPLGtdNyt4kX3Lorgrz2WnGATLmmgtcYyLOza77td5v9hp/1ZP3bbNU+Pf0+/PvMP/JvP
  xB77aEF9c8TStVyzroyvTBpUbSizFGYmGWsxFxYkAaWydcBwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-285.messagelabs.com!1623318755!14368!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6656 invoked from network); 10 Jun 2021 09:52:35 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 09:52:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A9qZa1027262
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jun 2021 10:52:35 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 10:52:34 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] iozone3: upgrade 490 -> 492
Date: Fri, 11 Jun 2021 02:52:26 +0800
Message-ID: <1623351146-4726-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
parallelism.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../iozone3/iozone3/parallelism.patch         | 35 +++++++++++--------
 .../{iozone3_490.bb => iozone3_492.bb}        |  4 +--
 2 files changed, 23 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_490.bb => iozone3_492.bb} (97%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch b/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
index d5622ed2cf..48069ff141 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
@@ -10,20 +10,24 @@ Only fixed linux targets for now
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
+---
+ current/makefile | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
 
-
---- current/makefile.org	2016-12-06 02:19:10.367911020 +0000
-+++ current/makefile	2016-12-06 02:21:38.767911020 +0000
-@@ -167,7 +167,7 @@
+diff --git current/makefile current/makefile
+index 3a54701..7071427 100644
+--- current/makefile
++++ current/makefile
+@@ -171,7 +171,7 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
 -linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
 +linux:	iozone_linux.o fileop_linux.o pit_server.o
- 	$(CC)  -O3 $(LDFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
+ 	$(CC)  -O3 $(CFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
  		-lrt -o iozone
- 	$(CC)  -O3 -Dlinux fileop_linux.o -o fileop
-@@ -176,7 +176,7 @@
+ 	$(CC)  -O3 $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+@@ -180,7 +180,7 @@ linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
  #
  # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
  #
@@ -32,7 +36,7 @@ Upstream-Status: Pending
  	$(CC) -O3 $(LDFLAGS) iozone_linux-powerpc.o libasync.o \
  		libbif.o -lpthread  -lrt -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-ppc.o -o fileop
-@@ -184,7 +184,7 @@
+@@ -188,7 +188,7 @@ linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pi
  #
  # GNU 'C' compiler Linux build for sparc chip with threads, largefiles, async I/O 
  #
@@ -41,7 +45,7 @@ Upstream-Status: Pending
  	$(CC) -O3 $(LDFLAGS) iozone_linux-sparc.o libasync.o libbif.o \
  		-lpthread -lrt -o iozone
  	$(CC) -O3 -Dlinux fileop_linux.o -o fileop
-@@ -193,7 +193,7 @@
+@@ -197,7 +197,7 @@ linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
@@ -50,7 +54,7 @@ Upstream-Status: Pending
  	$(CC) -O3 $(LDFLAGS) iozone_linux-ia64.o libbif.o libasync.o \
  		-lrt -lpthread -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-ia64.o -o fileop
-@@ -202,7 +202,7 @@
+@@ -206,7 +206,7 @@ linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_ser
  #
  # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
  #
@@ -59,7 +63,7 @@ Upstream-Status: Pending
  	$(CC) -O3 -Dunix -DHAVE_ANSIC_C -DSHARED_MEM -DASYNC_IO \
  		-D_LARGEFILE64_SOURCE -Dlinux \
  		iozone_linux-powerpc64.o libasync.o libbif.o -lpthread \
-@@ -213,7 +213,7 @@
+@@ -217,7 +217,7 @@ linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc6
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O
  #
@@ -68,7 +72,7 @@ Upstream-Status: Pending
  	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
  		-lrt -lpthread -o iozone
  	$(CC) -O3 -Dlinux fileop_linux-arm.o -o fileop
-@@ -222,7 +222,7 @@
+@@ -249,7 +249,7 @@ endif
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
@@ -77,7 +81,7 @@ Upstream-Status: Pending
  	$(CC)  -O3 $(LDFLAGS) iozone_linux-AMD64.o libbif.o libasync.o \
  		-lrt -lpthread -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-AMD64.o -o fileop
-@@ -231,7 +231,7 @@
+@@ -258,7 +258,7 @@ linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_
  #
  # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
  #
@@ -86,7 +90,7 @@ Upstream-Status: Pending
  	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390.o \
  		libbif.o libasync.o -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-s390.o -o fileop
-@@ -240,7 +240,7 @@
+@@ -267,7 +267,7 @@ linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_serv
  #
  # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
  #
@@ -95,3 +99,6 @@ Upstream-Status: Pending
  	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390x.o \
  		libbif.o libasync.o -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-s390x.o -o fileop
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_492.bb
similarity index 97%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_492.bb
index 1d2e53a319..a68a27c970 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_492.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://0001-let-system-headers-provide-pread64.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "95cb73dfdd58a0dfa42804f016dbb83c"
-SRC_URI[sha256sum] = "5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145ad4fed"
+SRC_URI[md5sum] = "228f54482c01d1c04c571a9414cd20e5"
+SRC_URI[sha256sum] = "322981e168f32bd39f54772b82b2906d598d958c37e954e75742e71baf58bb9b"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.25.1

