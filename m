Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7364CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 08:57:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20795.1694509023029340615
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 01:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cYg/4owk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7619f89624=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38C7Tf4l030707
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=zjy9X
	9bilFhnUVWCN476C3HciQQNJB8eYlhs+cVfg9s=; b=cYg/4owkoIPYvxNDWB2s4
	Z+wXqYrWss/4PsCYgLMWaIl4/9iECK/9sFClDlgi4Q2FkYjFGpLRxT15Xck6oZtC
	eq00WSg0mMrEnYT40opAxvHgI6Ow8ZIbhjJUliHHCFo3xgp2cdoQXw/UU5ZJQ5bW
	Elc8IGhRY53YbDaAU8XcMWsMAnFsPT8myn5K1Y34U+sOm2JHyDztksHOOdndarjA
	F2E5nHBZe8mD2HD3qkpgbK8i1MIxIGwjEH3gQUpEm3hY0Rq5PkvqNQ5OZV/GkGQD
	/W2G09IH6BF/4qRaq46xsHJJYCnwQyzu7URZ5a5yeX4HjMFQtkWRBfCR/BhffSx+
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0fp62f5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:57:02 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 12 Sep 2023 01:56:59 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][master][mickledore][PATCH 1/1] python3-appdirs: print ptest results in unified format
Date: Tue, 12 Sep 2023 08:56:47 +0000
Message-ID: <20230912085647.2661989-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: fER7XjNGcCCoFDVna6noqZ4GOYtJU5rr
X-Proofpoint-GUID: fER7XjNGcCCoFDVna6noqZ4GOYtJU5rr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309120075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104844

Update run-ptest script to print the output of python3-appdirs ptest results in
unified format

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-python/recipes-devtools/python/python3-appdirs/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
index 5287f3e03..b63c4de0d 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest | sed -e 's/\[100%\]//g' | sed -e 's/\.\.F/: FAIL/g' | sed -e 's/\.\.\./: PASS/g'
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.40.0


