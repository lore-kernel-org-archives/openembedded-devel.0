Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC0C570031
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 01:53:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u451rd0R025581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 May 2016 18:53:40 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 18:53:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 May 2016 09:52:01 +0800
Message-ID: <1462413121-12399-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] lmbench: avoid gcc optimize-away multiplication
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
X-List-Received-Date: Thu, 05 May 2016 01:53:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Change expression used in do_integer_mul and do_uint64_mul
benchmarks so GCC doesn't optimize-away the loops,

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-avoid-gcc-optimize-away-the-loops.patch   | 79 ++++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
new file mode 100644
index 0000000..2d8a246
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-the-loops.patch
@@ -0,0 +1,79 @@
+[PATCH] avoid gcc optimize-away the loops
+
+Upstream-Status: pending
+
+Change expression used in do_integer_mul and do_uint64_mul
+benchmarks so GCC doesn't optimize-away the loops, other
+things are same:
+-               TEN(r *= s;); r -= t;
++               i = 0;
++               while ( i++ < 10)
++                       r *= s;
++               r -= t;
+
+and TEN is macro:
+	#define TEN(a) a a a a a a a a a a
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ src/lat_ops.c | 30 +++++++++++++++++++++++++-----
+ 1 file changed, 25 insertions(+), 5 deletions(-)
+
+diff --git a/src/lat_ops.c b/src/lat_ops.c
+index d343ff3..457072b 100644
+--- a/src/lat_ops.c
++++ b/src/lat_ops.c
+@@ -126,11 +126,23 @@ do_integer_mul(iter_t iterations, void* cookie)
+ 	struct _state *pState = (struct _state*)cookie;
+ 	register int r = pState->N + 37431;
+ 	register int s = pState->N + 4;
+-	register int t = r * s * s * s * s * s * s * s * s * s * s - r;
++	register int t = r;
++	int i = 0;
++
++	while ( i++ < 10)
++		t *= s;
++	t -= r;
+ 
+ 	while (iterations-- > 0) {
+-		TEN(r *= s;); r -= t;
+-		TEN(r *= s;); r -= t;
++		i = 0;
++		while ( i++ < 10)
++			r *= s;
++		r -= t;
++
++		i = 0;
++		while ( i++ < 10)
++			r *= s;
++		r -= t;
+ 	}
+ 	use_int(r);
+ }
+@@ -207,13 +219,21 @@ do_int64_mul(iter_t iterations, void* cookie)
+ 	register int64 r = (int64)pState->N + 37420;
+ 	register int64 s = (int64)pState->N + 4;
+ 	register int64 t;
++	int i = 0;
+ 
+ 	r += (int64)(pState->N + 6)<<32;
+ 	t = r * s * s * s * s * s * s * s * s * s * s - r;
+ 
+ 	while (iterations-- > 0) {
+-		TEN(r *= s;); r -= t;
+-		TEN(r *= s;); r -= t;
++		i = 0;
++		while ( i++ < 10)
++			r *= s;
++		r -= t;
++
++		i = 0;
++		while ( i++ < 10)
++			r *= s;
++		r -= t;
+ 	}
+ 	use_int((int)r);
+ }
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 24cd0b0..7585436 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://use-base_libdir-instead-of-hardcoded-lib.patch \
            file://lmbench_result_html_report.patch \
            file://fix-lmbench-memory-check-failure.patch \
+           file://0001-avoid-gcc-optimize-away-the-loops.patch \
 "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
-- 
2.8.1


