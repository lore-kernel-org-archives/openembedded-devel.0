Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15896.1794916149723792708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bU+iX6Jh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: vaibjind@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NGEw721418
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WfI57Lo7kHS
	VrkDSF0MMt/Qsk05DQiewnRiofZrXNic=; b=bU+iX6Jh42P4IS39qXq9DjEGv6O
	qn4HfzdUGAQ7yy7xMd5A5A91PIWarYgKCgPRaTS1jBS22kuLnFRiP9F214BwVTTY
	NNHDHGf+VeveW+EHH9gPS66Acyj8N7ANAB6IhebuaxYv47cxjbHoTHpcXEewIZpu
	zn+t/r92cxTflQRqEnsWVuyq+O4aRUrwaGBbFd/oLAyu7XRmvUcRT59VzSQkrvdn
	WUtvqk4+rwD4wRG+dTdsuLLJyh1byBoximSS/9bwll4vHryUZ4QxOuuh22rExW3P
	LL7SEmFGvL/M88B9nwTbHULe+apvmPWLxfBR/YAwKR05BQ/jnENHW6DucSg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc8scc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:08 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBn5Wl2678946;
	Tue, 17 Nov 2026 11:49:05 GMT
Received: from hu-devc-hyd-u22-a.qualcomm.com (hu-vaibjind-hyd.qualcomm.com [10.147.244.121])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AHBn5032678940
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:49:05 +0000 (GMT)
Received: by hu-devc-hyd-u22-a.qualcomm.com (Postfix, from userid 4734334)
	id AB39C657; Tue, 17 Nov 2026 17:19:04 +0530 (+0530)
From: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com, Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Subject: [wrynose][PATCH 1/2] tiobench: update to latest upstream version
Date: Tue, 17 Nov 2026 17:19:01 +0530
Message-Id: <20261117114902.577356-2-vaibjind@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117114902.577356-1-vaibjind@qti.qualcomm.com>
References: <20261117114902.577356-1-vaibjind@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX6kX9joVUi3PZ
 Upn0k8umO87tBqdEX8qOiyusxZczdE5gKHvmgFg27OiTvLXCknSMelLFarw3sDXOOh+56lv7AhS
 YULjsfKmAMxPgmfVmU3P8L6uWTvDZ/I=
X-Proofpoint-ORIG-GUID: K15Ud2QchpKC3RggrdleKOLUJHmFOb0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfXyRA3d7L4Fovj
 zRdq4y38KGS++U+rCE3hDru6k65Qpz/fzLKma6Gklr94oCdksp2YiRQnVvHfCEmSOJmsTgsWh8p
 I5L393tmnTLNC6f+zermaNs3xdmOmoMLxTw6a+uqVQOdnFE1hkkkFsQPnv4t5fYdeRby0wfm0QQ
 eKwdHfV449h1JlZbOIA5ZWxiyHqf4HcVt5WgxWTF398jVpn0/3t3/GkAaSrZtS3SPzKewJ7Z64u
 HtKgjIcZlHqHaYz+CjjETL8lbGPhe3py7VeffMvMnHni2RqwQGKuwdfHHsdAxwKRZsVuEOrVKqK
 rC68dSd8QHAeeXOq5yHYmVrwg0mur/0+B2+ugFSqfJhEivo3ko1ioc9y+LMCOZkPB0+W8tYxg4y
 HwPFWMTm/044ifuaVo0wgy57YJD5Ybor2RnmIO90akzbaTAkEjJlip0qrAc2jL23DET96NsOthk
 dqiWpzOgeZmSENJCsyg==
X-Proofpoint-GUID: K15Ud2QchpKC3RggrdleKOLUJHmFOb0H
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc3f34 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=FP58Ms26AAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=alK4_DS-AAAA:8 a=pGLkceISAAAA:8 a=jAfPOIUMAAAA:8 a=1KMKwfVFCaF6WlZRONgA:9
 a=rOCknGvZllDBBwZ8Yz5I:22 a=zXANBZobTCHVkT8vCtSf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132584
Content-Type: text/plain; charset="utf-8"

Update tiobench from the legacy 0.3.3 SourceForge release to the
actively maintained upstream at github.com/mkuoppal/tiobench, pinned
to 11c965c8 (35 commits past v0.4.2). Picks up Clang build support,
random I/O test enhancements and cache handling updates.

Remove obsolete downstream patches, now fixed upstream:

  avoid-glibc-clashes.patch        - helper renamed to tt_aligned_alloc
  0001-Specify-printf-formats.patch - format specifiers fixed
  0001-Drop-inline-of-crc32-*.patch - crc32 inlining fixed
  tiobench-makefile.patch          - CC?= and LDFLAGS now upstream

Pass CFLAGS via EXTRA_OEMAKE. The upstream Makefile hardcodes
CFLAGS=-O2 -Wall and oe_runmake does not pass -e, so OE flags never
reached the compiler, losing -g (empty -dbg package), the hardening
flags, -ffile-prefix-map and the tune flags. DEFINES is separate, so
-DUSE_LARGEFILES is unaffected.

Install from do_install() rather than the upstream install target,
which has no DESTDIR support and installs tiosum.pl and README, both
long gone from the tree. COPYING is dropped from docdir as licenses
are handled by the license manifest.

Trim RDEPENDS to perl and perl-module-getopt-long; tiobench.pl only
uses warnings, strict and Getopt::Long, and strict is RPROVIDED by
perl. Data::Dumper and Term::ProgressBar are only reachable via the
opt-in --dump and --progress flags. Drop the redundant PV, already
set by the recipe filename.

Runtime validated on IQ-9075 EVK with tiotest and tiobench.pl across
multiple benchmark configurations, including tiobench.pl --help on an
image carrying only the trimmed RDEPENDS.

Build tested with gcc against glibc on aarch64 (armv8-2a).

Signed-off-by: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit dadc43246de3ceff7cae38d3caa09ffd032d94ff)
Signed-off-by: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
---
 ...rc32-function-to-fix-build-using-GCC.patch | 30 ----------
 .../0001-Specify-printf-formats.patch         | 49 ----------------
 .../tiobench-0.3.3/avoid-glibc-clashes.patch  | 57 -------------------
 .../tiobench-0.3.3/tiobench-makefile.patch    | 49 ----------------
 .../tiobench/tiobench_0.3.3.bb                | 28 ---------
 .../tiobench/tiobench_0.4.2+git.bb            | 23 ++++++++
 6 files changed, 23 insertions(+), 213 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
 delete mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch
deleted file mode 100644
index 5aebb956c1..0000000000
--- a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5429ab90eb33eb243fa7b9cd247e0490d72b9da5 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 9 Sep 2015 15:04:45 +0000
-Subject: [PATCH] Drop 'inline' of crc32 function to fix build using GCC 5.2
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- crc32.h |   1 -
- crc32.o | Bin 748 -> 2056 bytes
- 2 files changed, 1 deletion(-)
-
-diff --git a/crc32.h b/crc32.h
-index 62b3433..8fc62b6 100644
---- a/crc32.h
-+++ b/crc32.h
-@@ -18,7 +18,6 @@
- #ifndef CRC32_H
- #define CRC32_H
- 
--inline 
- unsigned long crc32( const void* const buffer, 
- 		      unsigned long length, 
- 		      unsigned long crc);
-
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch
deleted file mode 100644
index cfd34f02a0..0000000000
--- a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/0001-Specify-printf-formats.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b08e61ef64eece23ce8ffa2784cd3c4f70b6169e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jun 2017 08:08:56 -0700
-Subject: [PATCH] Specify printf formats
-
-Fixes
-tiotest.c:555:4: error: format not a string literal and no format arguments [-Werror=format-security]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tiotest.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tiotest.c b/tiotest.c
-index 6b3d0c3..3e6166a 100644
---- a/tiotest.c
-+++ b/tiotest.c
-@@ -91,7 +91,7 @@ inline void checkIntZero(int value, char *mess)
- {
- 	if (value <= 0) 
- 	{
--		printf(mess);
-+		printf("%s",mess);
- 		printf("Try 'tiotest -h' for more information.\n");
- 		exit(1);
- 	}
-@@ -101,7 +101,7 @@ inline void checkLong(long value, char *mess)
- {
- 	if (value < 0) 
- 	{
--		printf(mess);
-+		printf("%s", mess);
- 		printf("Try 'tiotest -h' for more information\n");
- 		exit(1);
- 	}
-@@ -552,7 +552,7 @@ void do_test( ThreadTest *test, int testCase, int sequential,
- 		if(args.debugLevel > 4)
- 		{
- 			printf("Created %d threads\n", i);
--			fprintf(stderr, debugMessage);
-+			fprintf(stderr, "%s",  debugMessage);
- 			fflush(stderr);
- 		}
- 	
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch
deleted file mode 100644
index 321d299837..0000000000
--- a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From: Otavio Salvador <otavio@ossystems.com.br>
-Subject: [PATCH] Avoid aligned allocation function name clashes
-
-glibc added new methods for aligned allocation and it clashes with the
-local version used by 'tiobench'. To fix it, we prefix the methods
-with '_'.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- tiotest.c |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tiotest.c b/tiotest.c
-index 38f54e7..6b3d0c3 100644
---- a/tiotest.c
-+++ b/tiotest.c
-@@ -31,7 +31,7 @@ static const char* versionStr = "tiotest v0.3.3 (C) 1999-2000 Mika Kuoppala <mik
- */
- ArgumentOptions args;
- 
--static void * aligned_alloc(ssize_t size)
-+static void * _aligned_alloc(ssize_t size)
- {
- 	caddr_t a;
- 	a = mmap((caddr_t )0, size, 
-@@ -41,7 +41,7 @@ static void * aligned_alloc(ssize_t size)
- 	return a;
- }
- 
--static int aligned_free(caddr_t a, ssize_t size)
-+static int _aligned_free(caddr_t a, ssize_t size)
- {
- 	return munmap(a, size);
- }
-@@ -281,7 +281,7 @@ void initialize_test( ThreadTest *d )
- 		pthread_attr_setscope(&(d->threads[i].thread_attr),
- 				      PTHREAD_SCOPE_SYSTEM);
- 
--		d->threads[i].buffer = aligned_alloc( d->threads[i].blockSize );
-+		d->threads[i].buffer = _aligned_alloc( d->threads[i].blockSize );
- 		if( d->threads[i].buffer == NULL )
- 		{
- 			perror("Error allocating memory");
-@@ -383,7 +383,7 @@ void cleanup_test( ThreadTest *d )
- 	{
- 		if (!args.rawDrives)
- 		unlink(d->threads[i].fileName);
--		aligned_free( d->threads[i].buffer, d->threads[i].blockSize );
-+		_aligned_free( d->threads[i].buffer, d->threads[i].blockSize );
- 		d->threads[i].buffer = 0;
- 	
- 		pthread_attr_destroy( &(d->threads[i].thread_attr) );
--- 
-1.7.7
-
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
deleted file mode 100644
index f820c7e337..0000000000
--- a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Adapt tiobench to OE
-Author: Ludovic Desroches <ludovic.desroches@atmel.com>
-
-Upstream-Status: Inappropriate [not author]
-
-Index: Makefile
-===================================================================
---- a/Makefile	2011-05-26 07:48:46.341400974 +0200
-+++ b/Makefile	2011-05-30 06:32:38.091401358 +0200
-@@ -1,8 +1,9 @@
- # Makefile for tiotest
- 
--CC=gcc
-+CC?=gcc
- #CFLAGS=-O3 -fomit-frame-pointer -Wall
- CFLAGS=-O2 -Wall
-+LDFLAGS?=
- 
- #DEFINES=-DUSE_MMAP 
- #-DUSE_MADVISE
-@@ -14,16 +15,16 @@
- 
- #DEFINES=
- 
--LINK=gcc
-+LINK?=$(CC)
- EXE=tiotest
- PROJECT=tiobench
- # do it once instead of each time referenced
- VERSION=$(shell egrep "tiotest v[0-9]+.[0-9]+" tiotest.c | cut -d " " -f 7 | sed "s/v//g")
- DISTNAME=$(PROJECT)-$(VERSION)
- INSTALL=install
--PREFIX=/usr/local
-+PREFIX?=/usr/local
- BINDIR=$(PREFIX)/bin
--DOCDIR=/usr/local/doc/$(DISTNAME)
-+DOCDIR=$(PREFIX)/share/doc/$(DISTNAME)
- 
- all: $(EXE)
- 
-@@ -34,7 +35,7 @@
- 	$(CC) -c $(CFLAGS) $(DEFINES) tiotest.c -o tiotest.o
- 
- $(EXE): tiotest.o crc32.o
--	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread
-+	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread $(LDFLAGS)
- 	@echo
- 	@echo "./tiobench.pl --help for usage options"
- 	@echo
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
deleted file mode 100644
index 98914836ed..0000000000
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Threaded I/O tester"
-HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-
-
-SRC_URI = "\
-    http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${BP}.tar.gz \
-    file://tiobench-makefile.patch \
-    file://avoid-glibc-clashes.patch \
-    file://0001-Drop-inline-of-crc32-function-to-fix-build-using-GCC.patch \
-    file://0001-Specify-printf-formats.patch \
-"
-SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
-
-EXTRA_OEMAKE = "PREFIX=${D}/usr"
-
-do_install() {
-    oe_runmake install
-}
-
-RDEPENDS:${PN} = "\
-    perl \
-    perl-module-exporter-heavy \
-    perl-module-getopt-long \
-    perl-module-overload \
-    perl-module-strict \
-"
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
new file mode 100644
index 0000000000..b42982686c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Threaded I/O tester"
+HOMEPAGE = "https://github.com/mkuoppal/tiobench"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+
+SRC_URI = "git://github.com/mkuoppal/tiobench.git;protocol=https;branch=master"
+
+SRCREV = "11c965c8c0f37927423fb4ea590df6c093cf2f1e"
+
+EXTRA_OEMAKE = "PREFIX=${prefix} CFLAGS='${CFLAGS}'"
+
+do_install() {
+    install -Dm 0755 ${S}/tiotest ${D}${bindir}/tiotest
+    install -Dm 0755 ${S}/tiobench.pl ${D}${bindir}/tiobench.pl
+
+    install -d ${D}${docdir}/${BPN}
+    install -m 0644 ${S}/README.md ${S}/BUGS ${S}/ChangeLog ${S}/TODO ${D}${docdir}/${BPN}
+}
+
+RDEPENDS:${PN} += "\
+    perl \
+    perl-module-getopt-long \
+"
-- 
2.34.1

