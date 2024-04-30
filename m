Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8A3C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:53:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10596.1714467191174940613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 01:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D8Tc03lD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5850663722=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U70JEI019175
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 01:53:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=DOLgfxE0AdTQVvx2NBbQqWCHlvWChZ1yi73OFsGofoE=; b=
	D8Tc03lDleVsC/pavta4SxY5MU+S4HHx/jS9F09+lVGgtRfxPSmkhnsfZGvV3qxO
	srQl8xa7mHhB+aicwq9GcYcinPP+nU970/c2g3kVhEgcVNT9WpegRO/dY7XYrcVj
	+L6OZXZJzbIcIr49Q/8R4DPUp4qMHOT0/PoiDslZcH1p22kmyFO4WGaZFtP1hKU/
	U00hVAMdPs8//uqvuGcjMApzYLCl3nr7a80eiHV8hc6elS9Fh1ENA56A3Cfvrfup
	9qdchaDA9FzbfA/TybCGK7NbUb91tD2jyQ2tn/PknBAFjXaHroGMWJXQKH6c6pb2
	B0HLHanjbv4ctjVMcuGIpg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xs0vftw5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 01:53:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 30 Apr 2024 01:53:10 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 30 Apr 2024 01:53:09 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH] python3-pyyaml-include: Drop pytest --automake
Date: Tue, 30 Apr 2024 16:53:08 +0800
Message-ID: <20240430085308.1401971-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CA+chaQe=-D2t+T9j9=cppJLJZufhKuTiUuqDH0eC6+aCsbdt-w@mail.gmail.com>
References: <CA+chaQe=-D2t+T9j9=cppJLJZufhKuTiUuqDH0eC6+aCsbdt-w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HNFNg9qDy6h6-lNZIVL4UhYbbglQcHh8
X-Proofpoint-GUID: HNFNg9qDy6h6-lNZIVL4UhYbbglQcHh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 08:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110196

From: Mingli Yu <mingli.yu@windriver.com>

The python3-unittest-automake-output is not supported [1], so drop
"pytest --automake".

[1] https://lore.kernel.org/all/20240327072236.2221619-1-mingli.yu@windriver.com/T/#mda91919809cf156aba24f099bef65142067cd318

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/python/python3-pyyaml-include/run-ptest    | 2 +-
 .../recipes-devtools/python/python3-pyyaml-include_1.4.1.bb     | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
index 8d2017d39..3385d6893 100755
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest --automake
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
index 6768e959f..b60a0f9c8 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.4.1.bb
@@ -24,6 +24,5 @@ RDEPENDS:${PN} += " \
 "
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
-    python3-unittest-automake-output \
 "
 
-- 
2.25.1


