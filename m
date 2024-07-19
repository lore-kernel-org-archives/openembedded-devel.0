Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A947C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 07:31:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14021.1721374253511974095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 00:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7930af0af0=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J6SfWY008888
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 07:30:52 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erhj1atw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 07:30:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 00:30:51 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 00:30:50 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][master][meta-networking][PATCH] nftables: change ptest output format
Date: Fri, 19 Jul 2024 15:30:49 +0800
Message-ID: <20240719073049.4053122-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3jpDOSigpM-w2HkwQOvGuSvQfzZYko2_
X-Proofpoint-GUID: 3jpDOSigpM-w2HkwQOvGuSvQfzZYko2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407190058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 07:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111412

From: Jiaying Song <jiaying.song.cn@windriver.com>

This change adds a simple format for the skip results.
The format selected is the automake "simple test" format:
"result: testname"

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-filter/nftables/nftables/run-ptest            | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables/run-ptest b/meta-networking/recipes-filter/nftables/nftables/run-ptest
index 32ddf9f455..55e801f67c 100644
--- a/meta-networking/recipes-filter/nftables/nftables/run-ptest
+++ b/meta-networking/recipes-filter/nftables/nftables/run-ptest
@@ -5,14 +5,18 @@ cd ${NFTABLESLIB}/ptest || exit 1
 
 LOG="${NFTABLESLIB}/ptest/nftables_ptest_$(date +%Y%m%d-%H%M%S).log"
 NFT=nft
-tests/shell/run-tests.sh -v | sed -E '/I: \[OK\]/ s/^/PASS: / ; /W: \[(CHK DUMP|VALGRIND|TAINTED|DUMP FAIL|FAILED)\]/ s/^/FAIL: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a "${LOG}"
+tests/shell/run-tests.sh -v | sed -E '/I: \[OK\]/ s/^/PASS: / ; /W: \[(CHK DUMP|VALGRIND|TAINTED|DUMP FAIL|FAILED)\]/ s/^/FAIL: / ; /I: \[SKIPPED\]/ s/^/SKIP: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a "${LOG}"
 
 passed=$(grep -c PASS: "${LOG}")
 failed=$(grep -c FAIL: "${LOG}")
-all=$((passed + failed))
+skiped=$(grep -c SKIP: "${LOG}")
+
+all=$((passed + failed + skiped))
 
 (   echo "=== Test Summary ==="
     echo "TOTAL: ${all}"
     echo "PASSED: ${passed}"
     echo "FAILED: ${failed}"
+    echo "SKIPED: ${skiped}"
+    echo "===================="
 ) | tee -a "${LOG}"
-- 
2.25.1


