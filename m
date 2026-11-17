Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16025.1794916150352550206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gMSKON7E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: vaibjind@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAK2lC3457899
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=krDICuIVy9O
	wx2vNPysQqmXCNY0Q8PBuL/+qRfODk1s=; b=gMSKON7Ez2+1Ym/d6YHpY7yVjh0
	8OB+eL39069vWlqCbW1QaXRYcnIbuj/k4/UOpCHo/ewRLNA7VZVBxO7RHyt6LVbP
	zY5nHzih0eHbOt+pf3opGBFpBcDomUh42CnahFP5qimuy8z7Mw920TpPtgsRApcJ
	snd6HVfNJ2JBNqREgHw61jofDe/0X7rZIjNfHcjx49ejtzbH2Xpr1vuAcgfkORvP
	s0ND79A/NuERR2RHBDRjgMF0+d6hQrws5g0279yFoQi5cCGqhuOT0Ncv5wG7Lzi+
	0ypREJ56y6+M0vip4KqUN227TSnUolk6ykgYkPjiiS6oXKbJvweJDsPxUUQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh9hy9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:08 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBn6RX2678958;
	Tue, 17 Nov 2026 11:49:06 GMT
Received: from hu-devc-hyd-u22-a.qualcomm.com (hu-vaibjind-hyd.qualcomm.com [10.147.244.121])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AHBn6CB2678952
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:49:06 +0000 (GMT)
Received: by hu-devc-hyd-u22-a.qualcomm.com (Postfix, from userid 4734334)
	id 3F70765B; Tue, 17 Nov 2026 17:19:05 +0530 (+0530)
From: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com, Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Subject: [wrynose][PATCH 2/2] tiobench: Allow large file support with musl
Date: Tue, 17 Nov 2026 17:19:02 +0530
Message-Id: <20261117114902.577356-3-vaibjind@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117114902.577356-1-vaibjind@qti.qualcomm.com>
References: <20261117114902.577356-1-vaibjind@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: H51cCuMat_foBUoYb45t9EqxrSFmhegc
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc3f35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=-TmCsF24s4zJGDMKLFMA:9
X-Proofpoint-GUID: H51cCuMat_foBUoYb45t9EqxrSFmhegc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX1yxL9wqQMNRu
 3ha4rWJKTao50b1ZjntbtCuR8p5yufzy95rCS1RsTyEDJEVqo6AHkW3gGe+s8Wqb0gBVy0LVRo7
 lW4LWf19WjAc2bKOam1bccfVFeUzGPY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX2bh2Gzqg5Jih
 QcqqIzAJRqXi/gFuSE1u9lBP+8cZ4BwGIiN7LsRik/azWohdA95MO8s9Kh3W/wVIUMXeAn6TwoM
 dloaEFBw5ntmWjXXLGK4l05+BB3kc5K2o4/NIsldiROHkPmQ9w28wH0EdwSlGlSoWQuoBnhGLMy
 q7+iB5EOXm6ddSqbM9KfcqeQdcrylA2R9LNFg7uy3CkR5zPbQ3WOQVOin9v8UZ+klf3LgqPqI+1
 Cqu5HpZv7FvSmh/TR3yP0OHq0BuI4Wh8DRzWxA8Ozmnt5ruAURAw+dJliItH7Ic9ZCl/jPPA7Xc
 1zoTuCklKmiN9RKeQ/IbqmaeUdwHejK343aAvhB6JCrY9fi6B1xsyL2tydnZ2OCPuAy7y+eSpQ7
 n6i8ld7CHyii7UZkAcyyHHcz5ClwARxV2jn5jLDRezHzsiRcDgQ7OpaUDODzWJVpadaPFZAYg6/
 1L0ofhlE7mrW8dw8hXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 11:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132585
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

USE_LARGEFILES requires _LFS64_LARGEFILE, which musl does not define
because its off_t is always 64-bit, so the build fails on musl:

  ./constants.h:36:2: error: no large file support available, remove -DLARGEFILES from makefile

Add a patch that only requires a 64-bit off_t in that case. It also
replaces the %L length modifier on integer conversions with the standard
%ll, which musl's printf requires.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4ef0b50bcd671b81396689dd8b554b6bf2908fb8)
Signed-off-by: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
---
 ...1-Allow-large-file-support-with-musl.patch | 90 +++++++++++++++++++
 .../tiobench/tiobench_0.4.2+git.bb            |  4 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch b/meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch
new file mode 100644
index 0000000000..632553c066
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench/0001-Allow-large-file-support-with-musl.patch
@@ -0,0 +1,90 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 19:00:00 -0700
+Subject: [PATCH] Allow large file support with musl
+
+USE_LARGEFILES requires the libc to define _LFS64_LARGEFILE and errors
+out otherwise. musl does not define it: its off_t is always 64-bit and
+lseek64(), mmap64() and friends are aliases of the plain interfaces.
+So the build fails on musl:
+
+  ./constants.h:36:2: error: no large file support available, remove -DLARGEFILES from makefile
+
+When _LFS64_LARGEFILE is missing, only require a 64-bit off_t.
+
+Also replace the %L length modifier on integer conversions with the
+standard %ll. %L is only defined for long double, and musl's printf
+rejects it with integer conversions.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ constants.h       | 9 +++++++--
+ test_largefiles.c | 6 +++---
+ tiotest.c         | 2 +-
+ 3 files changed, 11 insertions(+), 6 deletions(-)
+
+--- a/constants.h
++++ b/constants.h
+@@ -33,7 +33,12 @@
+ 
+ #ifdef USE_LARGEFILES
+ #ifndef _LFS64_LARGEFILE
+-#error no large file support available, remove -DLARGEFILES from makefile
++/*
++ * musl does not define _LFS64_LARGEFILE: its off_t is always 64-bit and
++ * the *64 interfaces are plain aliases, so only require a 64-bit off_t.
++ */
++_Static_assert(sizeof(off_t) >= 8,
++	"no large file support available, remove -DLARGEFILES from makefile");
+ #endif
+ #endif
+ 
+@@ -83,7 +88,7 @@
+ #define TIO_ftruncate  ftruncate64
+ #define TIO_pread      pread64
+ #define TIO_pwrite     pwrite64
+-#define OFFSET_FORMAT  "0x%Lx"
++#define OFFSET_FORMAT  "0x%llx"
+ #else
+ typedef off_t          TIO_off_t;
+ #define TIO_lseek      lseek
+--- a/tiotest.c
++++ b/tiotest.c
+@@ -1411,7 +1411,7 @@
+ 
+ 			if(crc != d->bufferCrc)
+ 			{
+-				fprintf(stderr, "Thread(%lu) consistency check failed at offset %Lu\n", d->myNumber, (long long unsigned int)offset);
++				fprintf(stderr, "Thread(%lu) consistency check failed at offset %llu\n", d->myNumber, (long long unsigned int)offset);
+ 				return -1;
+ 			}
+ 		}
+--- a/test_largefiles.c
++++ b/test_largefiles.c
+@@ -57,7 +57,7 @@
+         exit(1);
+     }
+ 
+-    printf( xstr(TIO_ftruncate) "()'ing large test file to size %Lx\n", LARGEFILE_SIZE);
++    printf( xstr(TIO_ftruncate) "()'ing large test file to size %llx\n", LARGEFILE_SIZE);
+     rc = TIO_ftruncate(fd, LARGEFILE_SIZE); /* pre-allocate space */
+     if(rc != 0) 
+     {
+@@ -67,7 +67,7 @@
+ 
+     for(offset = (TIO_off_t)0; offset + CHUNK_SIZE <= LARGEFILE_SIZE; offset += CHUNK_SIZE) {
+ 
+-        printf(xstr(TIO_lseek) "()ing to offset %Lx\n", offset);
++        printf(xstr(TIO_lseek) "()ing to offset %llx\n", offset);
+         offset_ret = TIO_lseek(fd, offset, SEEK_SET);
+         if (offset_ret != offset) {
+             perror("Error " xstr(TIO_lseek) "()ing");
+@@ -105,7 +105,7 @@
+         }
+         data = 0;
+ 
+-        printf(xstr(TIO_mmap) "()ing chunk of size %Lx at offset %Lx\n", CHUNK_SIZE, offset);
++        printf(xstr(TIO_mmap) "()ing chunk of size %llx at offset %llx\n", CHUNK_SIZE, offset);
+         file_loc = TIO_mmap((caddr_t )0, CHUNK_SIZE,
+                  PROT_READ | PROT_WRITE, MAP_SHARED, fd, (TIO_off_t)offset);
+         if (file_loc == MAP_FAILED) {
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
index b42982686c..c773a8cc53 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.4.2+git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/mkuoppal/tiobench"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "git://github.com/mkuoppal/tiobench.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/mkuoppal/tiobench.git;protocol=https;branch=master \
+           file://0001-Allow-large-file-support-with-musl.patch \
+           "
 
 SRCREV = "11c965c8c0f37927423fb4ea590df6c093cf2f1e"
 
-- 
2.34.1

