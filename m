Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4031.1795027995963921155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 10:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hamqL/dG;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild13.wrs.com, ip: 205.220.166.238, mailfrom: prvs=5782bbdee7=kpaturi@oak-lpgbuild13.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGrVR3163677
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 10:53:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=GWbadE/TO
	dNSXorsjR42hlrppA4K1fZkYnztXc3MeLA=; b=hamqL/dG4FnTTHrbz9ellXDgO
	/jBIAagez0Fc2e6nOIklcoDI6KVmrdYD54WJTpw2lUptjOAnXoLCscvxM1gnX63n
	sUa9z/w1JsfLhBb/oWhvDVlrf9fQQJM7sXN9J5g0XANVAzr565WBaC9ifdq4c9KV
	Z47Fu/W4py0yH+J4IOkw7P2fwCE22kOhYk1RALAiwVFIopvdFfyBIbeIasVxsl8C
	bxHjQxlgKNPfbUXo+TKcDhnRhRVNDLu2/pMBL0aSulLB/VDf4BiR9fFQdcN4aBCz
	hdh8iGh5cAZ3vORSppwCSGxtau0bkE53n7i+8lE9re6jZTFSyDwg05gRfrOXQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvdjj0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 10:53:14 -0800 (PST)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Wed, 18 Nov 2026 10:53:14 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 18 Nov 2026 10:53:13 -0800
Received: from oak-lpgbuild13.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Nov 2026 10:53:13 -0800
Received: by oak-lpgbuild13.wrs.com (Postfix, from userid 1762445479)
	id B08D54BC015D; Wed, 18 Nov 2026 18:53:13 +0000 (UTC)
From: Kanksha Paturi <Kanksha.Paturi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Sumanth Gavini <sumanth.gavini@windriver.com>,
        Randy MacLeod
	<randy.macleod@windriver.com>,
        Kanksha Paturi <Kanksha.Paturi@windriver.com>
Subject: [meta-oe][PATCH 1/1] nodejs: fix 32-bit x86 build failure in bundled histogram
Date: Wed, 18 Nov 2026 18:53:11 +0000
Message-ID: <20261118185311.3267019-1-Kanksha.Paturi@windriver.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL2l2ghE c=1 sm=1 tr=0 ts=6afdf41a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8 a=-LCu6K_DAAAA:8 a=t7CeM3EgAAAA:8
 a=ylqlWe3miekRSeEZbMYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX91ZPt/EiuHc8
 3Qi7EIM9Uw53TenvyYS0JYDH1Dpa22yHrau5Fnb/qfQ97u/UnejN/q5BK2NS6lgd3k/ELRI5daK
 AGniDla0Zq3DQcw6k64bS1HOFsKFVuOXriCluT3uf94VHQykFEypTlcnzgBx+QOXIwmGd8EZvRn
 XApE+tQ+Ic/ipZyJ8p+DGvUfWr3kCTzRHgtGrXkbvRvJnUdPlltDErXfG4b8Mg+4fY5au0wdwc5
 E3+GV9Dxt/OBLsXtSmI7bl1NtCfjwYhKSpBA6gdAEhwZcgmss+IOy5T25T3IBXE+BkV1H+CjVj5
 PesRrww5/Vvka0bqQQ7XSgN1n+nqF7w4wJMrGMH4OI15cSMbzbXFV7pbEjXXEP6GDw2nvecVLh0
 8fOuMhlOfXvc3PG6rvFI6mDzXym6V1kA8RF5bRjdn5ac24XMvUZ6+0KD4T6QSEsucJQcWY+N0EY
 0rQ7S0U/yg7dpI5WHxQ==
X-Proofpoint-ORIG-GUID: mQ55T4CjKw6S0sTAxbpHSpRsK_qzY8ao
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfXyYixw5yqiPIO
 4RhgzNlVn8h9lFhyJbKkllKr9nzqe7U9hnsf6dE1odBIVPMzraIPOjbBaYhnGi3QMV3w9EEURuE
 rfsIMEjPh3HQuzWyTsq4NnWrU3egDz/8JOHzlHwFDtoI8tnh8rHG
X-Proofpoint-GUID: mQ55T4CjKw6S0sTAxbpHSpRsK_qzY8ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 18:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132662
Content-Type: text/plain; charset="utf-8"

hdr_histogram enables AVX2 code on 32-bit x86, but it uses
_mm_extract_epi64(), which only exists on 64-bit x86. nodejs fails to
build for qemux86.

Backport the AVX2 dispatch guard from nodejs commit 1271bb44 (histogram
0.12.0) to limit that code to x86_64. Only the guard is backported, not
the whole update.

https://github.com/nodejs/node/commit/1271bb448ae46ca67ad6306b43e3aab2c5b36d3c

Signed-off-by: Kanksha Paturi <Kanksha.Paturi@windriver.com>
---
 ...ram-restrict-avx2-dispatch-to-x86_64.patch | 44 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_24.22.3.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch
new file mode 100644
index 0000000000..9f5ea60212
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch
@@ -0,0 +1,44 @@
+From 059887c4e51ff49dd8d944eb6ca732a6cfd3043f Mon Sep 17 00:00:00 2001
+From: Kanksha Paturi <Kanksha.Paturi@windriver.com>
+Date: Tue, 10 Nov 2026 17:24:56 +0000
+Subject: [PATCH] deps: histogram: restrict AVX2 dispatch to x86_64
+
+The bundled hdr_histogram enables its AVX2 dispatch on 32-bit x86, but
+the AVX2 path uses _mm_extract_epi64(), which only exists on 64-bit
+x86. Building for 32-bit x86 (qemux86) fails with:
+
+  hdr_histogram.c:740: error: implicit declaration of function
+  '_mm_extract_epi64'
+
+Only the AVX2 dispatch guard is backported from the histogram 0.12.0
+update, not the whole commit.
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/1271bb448ae46ca67ad6306b43e3aab2c5b36d3c]
+
+Signed-off-by: Kanksha Paturi <Kanksha.Paturi@windriver.com>
+---
+ deps/histogram/src/hdr_histogram.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/deps/histogram/src/hdr_histogram.c b/deps/histogram/src/hdr_histogram.c
+index a34de2c1b2..7a1531a71e 100644
+--- a/deps/histogram/src/hdr_histogram.c
++++ b/deps/histogram/src/hdr_histogram.c
+@@ -34,9 +34,14 @@
+ #  define HDR_UNLIKELY(x) (x)
+ #endif
+
+-/* Runtime-dispatched AVX2 path: keep the rest of this TU at the project's
+-   baseline ISA so the shipped binary does not silently require AVX2. */
+-#if (defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)) \
++/* Runtime-dispatched AVX2 path; rest of TU stays at baseline ISA so the binary
++   doesn't silently require AVX2. 64-bit x86 + GCC/Clang only:
++     - 32-bit x86: _mm_extract_epi64 unavailable in 32-bit codegen.
++     - _MSC_VER: __builtin_cpu_supports's __cpu_model isn't linked under MSVC;
++       clang-cl also defines __x86_64__/__clang__ so this exclusion is load-bearing.
++     - __INTEL_COMPILER: ICC classic. */
++#if !defined(HDR_DISABLE_AVX2) \
++    && defined(__x86_64__) \
+     && (defined(__GNUC__) || defined(__clang__)) && !defined(__INTEL_COMPILER) && !defined(_MSC_VER)
+ #  define HDR_HAS_AVX2_DISPATCH 1
+ #  include <immintrin.h>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
index f9b4eea38e..166d1b018f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0008-custom-env.patch \
            file://0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch \
            file://0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch \
+           file://0012-histogram-restrict-avx2-dispatch-to-x86_64.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
