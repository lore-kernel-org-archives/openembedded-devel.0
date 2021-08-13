Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.30862.1628815669479369644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Aug 2021 17:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17D0lmQu017267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Aug 2021 17:47:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 12 Aug 2021 17:47:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 12 Aug 2021 17:47:47 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] jemalloc: improve the ptest output
Date: Fri, 13 Aug 2021 08:44:54 +0800
Message-ID: <20210813004454.41877-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Previouly we only show the output of each text program, actually
each test program includes serveral test cases. Improve the ptest
script to show the output of each test case.

Before:
 # ./run-ptest
 [snip]
 PASS: tests/integration/MALLOCX_ARENA
 PASS: tests/integration/aligned_alloc
 [snip]

After:
 # ./run-ptest
 [snip]
 PASS: test_MALLOCX_ARENA (non-reentrant)
 PASS: test_MALLOCX_ARENA (libc-reentrant)
 PASS: test_MALLOCX_ARENA (arena_new-reentrant)
 PASS: test_alignment_errors (non-reentrant)
 PASS: test_alignment_errors (libc-reentrant)
 PASS: test_alignment_errors (arena_new-reentrant)
 PASS: test_oom_errors (non-reentrant)
 PASS: test_oom_errors (libc-reentrant)
 PASS: test_oom_errors (arena_new-reentrant)
 PASS: test_alignment_and_size (non-reentrant)
 PASS: test_alignment_and_size (libc-reentrant)
 PASS: test_alignment_and_size (arena_new-reentrant)
 PASS: test_zero_alloc (non-reentrant)
 PASS: test_zero_alloc (libc-reentrant)
 PASS: test_zero_alloc (arena_new-reentrant)
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/jemalloc/files/run-ptest    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/files/run-ptest b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
index ea9d80cbb..b351f947e 100644
--- a/meta-oe/recipes-devtools/jemalloc/files/run-ptest
+++ b/meta-oe/recipes-devtools/jemalloc/files/run-ptest
@@ -5,13 +5,15 @@ for dir in tests/* ; do
 	cd $dir
 	for atest in * ; do
 		if [ \( -x $atest \) -a \( -f $atest \) ] ; then
-			./$atest > ${atest}.stdout 2> ${atest}.stderr
-			if [ $? = 0 ] ; then
-				echo "PASS: $dir $atest"
-				rm ${atest}.stdout ${atest}.stderr
-			else
-				echo "FAIL: ${dir}/${atest}"
-			fi
+			rm -rf tests.log
+			./$atest > tests.log 2>&1
+			sed -e '/: pass/ s/^/PASS: /g' \
+			    -e '/: skip/ s/^/SKIP: /g' \
+			    -e '/: fail/ s/^/FAIL: /g' \
+			    -e 's/: pass//g' \
+			    -e 's/: skip//g' \
+			    -e 's/: fail//g' \
+			    -e '/^--- pass:/d' tests.log
 		fi
 	done
 	cd $saved_dir
-- 
2.17.1

