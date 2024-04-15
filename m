Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA6EC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 09:07:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16689.1713172073843847010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 02:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qnp5WyJ7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48358a70a3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43F7IiI3003892
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 09:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=s//6E
	uV47ipK1Lgr+0NTVgPiNQPrpCV0hK0aMgVrFIk=; b=qnp5WyJ73ZlkABOltMVVW
	vM7xv5dUo7Vnm3qlzLCgook9cysicd3h6+Zz6EbjvzSwjkCLLyXSfe9ky5gB7TCz
	8J7Jq9h8L/OqcZ1A/ZDkLH38R/ux9o1FSsxGbmnXCU0cvVI6pMq7VsoKHhNJ2hiP
	q4XI2hl1u2jS2rUpZiaA8CAe5mosuu9cHv71kfb6UTiA30hL7OwZvcfOpONSXgdH
	Y6g/vp9dOJPQhjtxm0x995jx+Hnex1t0SUwyHORbaCTRnW67+NSZpcpx38Hdj+Bb
	+3wP+vxe/WI8Sc/Lj3hmElNp1ldlV69n5nGRrEMrJ9uAKLIZOr78+/XmReTiAdqs
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfh16he8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 09:07:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 15 Apr 2024 02:07:51 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 15 Apr 2024 02:07:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] c-ares: Improve the ptest output
Date: Mon, 15 Apr 2024 17:07:50 +0800
Message-ID: <20240415090750.2727038-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4ITo0SQrYosECO8m-NVjadxyCYfHNyja
X-Proofpoint-GUID: 4ITo0SQrYosECO8m-NVjadxyCYfHNyja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=969
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404150059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 09:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109953

From: Mingli Yu <mingli.yu@windriver.com>

Before the patch:
 # ./run-ptest
[snip]
[ DISABLED ] LibraryTest.DISABLED_ParseAReplyVariantCnameLast
[ RUN      ] LibraryTest.ParseAReplyErrors
[       OK ] LibraryTest.ParseAReplyErrors (4 ms)
[ RUN      ] LibraryTest.ParseAReplyAllocFail
[       OK ] LibraryTest.ParseAReplyAllocFail (0 ms)
[snip]

After the patch:
 # ./run-ptest
[snip]
SKIP:  LibraryTest.DISABLED_ParseAReplyVariantCnameLast
PASS:  LibraryTest.ParseAReplyErrors
PASS:  LibraryTest.ParseAReplyAllocFail
[snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/c-ares/c-ares/run-ptest | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
index 46572111b..66ffd5388 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/run-ptest
+++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
@@ -1,7 +1,3 @@
 #!/bin/sh
+./arestest --gtest_filter=-*.Live* --gtest_print_time=0 | sed -E  '/^\[ RUN/d ; s/\[       OK \]/PASS: / ; s/\[ DISABLED \]/SKIP: / ; s/\[ FAILED \]/FAIL: /'
 
-if ./arestest --gtest_filter=-*.Live*; then
-	echo "PASS: c-ares"
-else
-	echo "FAIL: c-ares"
-fi
-- 
2.25.1


