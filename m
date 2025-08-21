Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA17CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 07:25:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3654.1755761106267845170
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 00:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n5DmhMgC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328e38336=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L528x41868249
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 07:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fRnxAuABHby5FpcsjTS/
	GVjDevDhWkxQGiQw4cGRf2M=; b=n5DmhMgCLwiJ97aOQ9Jzv56DSnDYe9wypbZ4
	xOj1Sdpgejh2HHth7WxAzNRxOpH/kYCIiLfTWhe88RBwLZ0DLwOat1p4pN/uE1mB
	lIF+xqTUK14HPNZ0C3UylKLlrUQfPSLWI4/ZpLn8Nk8qVQ4rkdwgcVRnJfWsSF6V
	7lEdLhGgg8Ytqu93UTTa92TLr/cT0FiEgiLarfQ/+jvz/xphkJxsMfFI0CCSfqBk
	9ALe/5+wrWoFOmGD1XP8keym9Pr593y/KySwO+JRKIb5CiL1DAE/jH52eXdazdpA
	yOGBgwAgrIv3t3kZm3k390Jha0rzyo0rNNm6u0JI/zeK3nqKxQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjs201-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 07:25:05 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 00:24:41 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 00:24:40 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] openvpn: change ptest output format
Date: Thu, 21 Aug 2025 15:25:02 +0800
Message-ID: <20250821072502.4137334-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA1NiBTYWx0ZWRfX21feYLjzEYKL
 k7PWlpKddC1U6Nvl5v5jWutKmx0tDfohaSv3pZ+sAXaYKl026SYpvGpdTnmOr4sZzKdJF9FzOl9
 Q1cTPgrFMbG85dKWkVPaU3F+dXPAQXxGaspgOmqlqdRdGcEIx08zhpzAFg9pPIJeKN51CZhGpkU
 JMoT0kapRj22XwjbuGVfoFFvwMlnJkKSLV4BzkZXJD67pLKw1XNzzPCACBmHDQBYMacQiaAAXiF
 eDSXk9TvWbTuhTWLRrCeHKktGO4hQl8l5EmIi9HBKJIyGRMd1FNgktg7eAMomJyeECAT6o6eYIP
 8j1zs7g8u+Ccf1214Eg74cGmh7Fg0HDmwtYJZ6PvwKwlQNtFO+qSCu6Dg5yyn7YWZ8haWAgIrjm
 khjPpUN7JOcXj7GALI8CbstVHS+C6A==
X-Proofpoint-ORIG-GUID: 5hm_ayLL-gNzs49UlCMvv-n5uKxNuSG6
X-Proofpoint-GUID: 5hm_ayLL-gNzs49UlCMvv-n5uKxNuSG6
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a6c9d1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=G0X9Gb4pawF0VkgNkrMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 07:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119049

From: Jiaying Song <jiaying.song.cn@windriver.com>

The format selected is the automake "simple test" format: "result: testname".

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-support/openvpn/openvpn/run-ptest            | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/run-ptest b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
index 5b187d9086..572e969ade 100644
--- a/meta-networking/recipes-support/openvpn/openvpn/run-ptest
+++ b/meta-networking/recipes-support/openvpn/openvpn/run-ptest
@@ -1,5 +1,8 @@
 #!/bin/sh
-for x in `find ./ -name Makefile`;
-do
-	make -C `dirname ${x}` -k runtest-TESTS
+
+find ./ -name Makefile | while read -r x; do
+    make -C "$(dirname "${x}")" -k runtest-TESTS | sed \
+        -e 's/^\(\[       OK \].*\)$/PASS: \1/' \
+        -e 's/^\(\[  FAILED  \].*\)$/FAILED: \1/' \
+        -e 's/^\(\[  SKIPPED \].*\)$/SKIPPED: \1/'
 done
-- 
2.34.1


