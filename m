Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E7DC4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 08:00:04 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.9184.1635235203431239245
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 01:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19Q7xucO022283
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 26 Oct 2021 01:00:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19Q7xkFK021130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:55 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 00:59:52 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 00:59:51 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 00:59:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][hardknott][PATCH 5/7] jemalloc: improve the ptest output
Date: Tue, 26 Oct 2021 15:58:35 +0800
Message-ID: <20211026075837.39670-5-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026075837.39670-1-mingli.yu@windriver.com>
References: <20211026075837.39670-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 08:00:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93588

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


