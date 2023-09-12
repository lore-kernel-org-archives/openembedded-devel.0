Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB0ECA0ED4
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 08:52:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20751.1694508738955100145
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Sep 2023 01:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SNeRx+jl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7619f89624=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C8aofE029354
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 01:52:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=zjy9X
	9bilFhnUVWCN476C3HciQQNJB8eYlhs+cVfg9s=; b=SNeRx+jlvVevbWAI8sBVS
	Rs676oLIbwmjCtppZuRfFU5yh+xlOs6JE8JdBgjEXcLF7q3wuhTgvYO+0koFZard
	Pcp8YZ0p87zZB5J4x+EnSlTDtNbWWf8DPmg/KcicjmP+1XDdB+k4oRB8LfCdGsJT
	zCuLbM2k3o2dFCUoaEAr/B2/yTDrAPOmo0QOqPscSlbF5R9cKrwJQd9Jn3awfxc3
	YM88u83gFyV2Ko9gvhoYVJ3jCHnxMz/FAcLG7KjSMGPThT5C3MYQIibkj0Z2D/9T
	FXv6Lj6knM2t4DWvBtFPCjUnqY9rtu81s1D2K2mb6jKb1uW3Nda9BxET+8N68q5j
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0m00aaee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 01:52:18 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 12 Sep 2023 01:52:16 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][mickledore][PATCH 1/1] python3-appdirs: print ptest results in unified format
Date: Tue, 12 Sep 2023 08:52:02 +0000
Message-ID: <20230912085202.2660212-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: iUW_mdtVo4JF-h_uKzs2YAROpm-z1EKz
X-Proofpoint-ORIG-GUID: iUW_mdtVo4JF-h_uKzs2YAROpm-z1EKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=940
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309120075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Sep 2023 08:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104842

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


