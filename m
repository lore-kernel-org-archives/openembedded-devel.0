Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B18FF65CBA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 02:36:32 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p66so18242090pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 18:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5WJ45P4QAMYiw1qogtLIuT5hIgR1/GDHcOrowjKe3KY=;
	b=duLeAllR1nWCFOUGQlPx4OObqvKezPgYSzr9GlYYyt+vH3kjKow/uuz+UtB4wGlrBH
	0DuOSEmu/hWmDH5eZf93DSgrbe81cCz/kkoDKz0SeLycZaP/jPVccLTlAU6SeoK/E79D
	lK3U1rutP2M4U8RSPwY+4oQBKmbyXPV7s8nA1abwdX9y9DZtKCf5OZNbIMsc9mLp2m+m
	JF9w3oy2FHFph8mYhdK5oXtJeH7igFBhcvarLhMxVp3eu+3ElQaQ9DBc/n3vbaDyOzIv
	I6+1TGckHiD9VJDwvdK6kIX9XpfafZ3zzhDdZcw6CSxqoNSxX88+QT0k2Tx7OAhaQ1Xw
	U4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5WJ45P4QAMYiw1qogtLIuT5hIgR1/GDHcOrowjKe3KY=;
	b=hE74J3aJRnXzY4wzHkkxm/Da9nQiPbqAIjSqGC3le4UjA83QY5DJMQgCq13IufInfa
	I/tFei/qF3STNm6S9E20XeuCvxk+fcxfWSvZSHicv+ZiiFOyNdxjGjEqZO0Ag5Zs6l1u
	eK6sgPBGvxO+5pBZ+AxkSgfTZ3aJRrNTcWeZGqtVinNxwmHvy0VbrqM168yvZPFh6tyU
	L4Ks5kb0ytHDxs817K7D9zy6n0buOG2kJ8thmmH9WVjUoD/QjZB+t1owzO7CQbBmX2WX
	fhHEZkCiilsEFo92Fbjdkt7pVvg0l04ceULBCoGb6L0wGARHFgnOxXNPXoXAtPLPqi2d
	4WPg==
X-Gm-Message-State: AKaTC02mmGF/6rldU7n7+YNxcHXYg5OPAmjXer1xKnsmjA+rXCdQpZK+fxeV3duFGmYH7w==
X-Received: by 10.99.170.79 with SMTP id x15mr108152110pgo.14.1480991794218;
	Mon, 05 Dec 2016 18:36:34 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	64sm30357837pfu.17.2016.12.05.18.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 18:36:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2016 18:36:25 -0800
Message-Id: <20161206023625.12901-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161206023625.12901-1-raj.khem@gmail.com>
References: <20161206023625.12901-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] iozone3: Fix parallel build problem
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
X-List-Received-Date: Tue, 06 Dec 2016 02:36:32 -0000

ibasync.o and libbif.o are built twice once wrongly
without CFLAGS, clang catches this since it does not specify
-DHAVE_ANSIC_C and clang flags bunch of errors.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../iozone3/iozone3/parallelism.patch              | 97 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/iozone3/iozone3_465.bb   |  2 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch b/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
new file mode 100644
index 0000000..d5622ed
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
@@ -0,0 +1,97 @@
+remove libasync.o and libbif.o from deps
+
+there are no implicit rules to build them and they get wrong CFLAGS
+when compiled with implicit rule.
+
+They are built as part of iozone_linux.o target anyway
+
+Only fixed linux targets for now
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+
+
+--- current/makefile.org	2016-12-06 02:19:10.367911020 +0000
++++ current/makefile	2016-12-06 02:21:38.767911020 +0000
+@@ -167,7 +167,7 @@
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
++linux:	iozone_linux.o fileop_linux.o pit_server.o
+ 	$(CC)  -O3 $(LDFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
+ 		-lrt -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux.o -o fileop
+@@ -176,7 +176,7 @@
+ #
+ # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
+ #
+-linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pit_server.o
++linux-powerpc: iozone_linux-powerpc.o fileop_linux-ppc.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-powerpc.o libasync.o \
+ 		libbif.o -lpthread  -lrt -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-ppc.o -o fileop
+@@ -184,7 +184,7 @@
+ #
+ # GNU 'C' compiler Linux build for sparc chip with threads, largefiles, async I/O 
+ #
+-linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server.o
++linux-sparc: iozone_linux-sparc.o fileop_linux.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-sparc.o libasync.o libbif.o \
+ 		-lpthread -lrt -o iozone
+ 	$(CC) -O3 -Dlinux fileop_linux.o -o fileop
+@@ -193,7 +193,7 @@
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_server.o
++linux-ia64:	iozone_linux-ia64.o fileop_linux-ia64.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-ia64.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-ia64.o -o fileop
+@@ -202,7 +202,7 @@
+ #
+ # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
+ #
+-linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
++linux-powerpc64: iozone_linux-powerpc64.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
+ 	$(CC) -O3 -Dunix -DHAVE_ANSIC_C -DSHARED_MEM -DASYNC_IO \
+ 		-D_LARGEFILE64_SOURCE -Dlinux \
+ 		iozone_linux-powerpc64.o libasync.o libbif.o -lpthread \
+@@ -213,7 +213,7 @@
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O
+ #
+-linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o pit_server.o
++linux-arm:	iozone_linux-arm.o fileop_linux-arm.o pit_server.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC) -O3 -Dlinux fileop_linux-arm.o -o fileop
+@@ -222,7 +222,7 @@
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+ #
+-linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_server.o
++linux-AMD64:	iozone_linux-AMD64.o fileop_linux-AMD64.o pit_server.o
+ 	$(CC)  -O3 $(LDFLAGS) iozone_linux-AMD64.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-AMD64.o -o fileop
+@@ -231,7 +231,7 @@
+ #
+ # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
+ #
+-linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_server.o
++linux-S390:	iozone_linux-s390.o fileop_linux-s390.o pit_server.o
+ 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390.o \
+ 		libbif.o libasync.o -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-s390.o -o fileop
+@@ -240,7 +240,7 @@
+ #
+ # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
+ #
+-linux-S390X:	iozone_linux-s390x.o libbif.o libasync.o fileop_linux-s390x.o pit_server.o
++linux-S390X:	iozone_linux-s390x.o fileop_linux-s390x.o pit_server.o
+ 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390x.o \
+ 		libbif.o libasync.o -o iozone
+ 	$(CC)  -O3 -Dlinux fileop_linux-s390x.o -o fileop
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
index 67ce885..2864a4d 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dca
     file://iozone.c;beginline=260;endline=266;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
 "
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
+    file://parallelism.patch \
     file://copyright.txt \
 "
 SRC_URI[md5sum] = "c924e5e46fb1cf8145f420e8e57eb954"
@@ -21,6 +22,7 @@ S = "${WORKDIR}/${BPN}_${PV}/src/current/"
 #
 EXTRA_OEMAKE_powerpc = "linux-powerpc CC='${CC}' GCC='${CC}'"
 EXTRA_OEMAKE_powerpc64 = "linux-powerpc64 CC='${CC}' GCC='${CC}'"
+EXTRA_OEMAKE_x86-64 = "linux-AMD64 CC='${CC}' GCC='${CC}'"
 EXTRA_OEMAKE_arm = "linux-arm CC='${CC}' GCC='${CC}'"
 EXTRA_OEMAKE = "linux CC='${CC}' GCC='${CC}'"
 
-- 
2.10.2


