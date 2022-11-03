Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A6FC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 00:17:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.14038.1667434664930357880
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 17:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lCdp1R81;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8306525b0b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A30000a005262
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Nov 2022 00:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=KhI+t8TzRejFMCCtGuRQKCIepqP5aA1ozJFpHhdlqU0=;
 b=lCdp1R81/CRrSyck+bB+hsoCgb9c4f5qXW3mdXR9xkn1pB3kba66Uh/7F/+EFwLcUqdK
 uhazGMChJ1ExD9QIDvhe2JnIXZ6EpnDvHJa4c1VMkU2onPAQm9ndKaSVizHp92JD4WEf
 +5eb+NILKzEcfJ/KbBk4+5ikCKhAZnrjCMbTSzsobE+qSxi1ahFFN5WTZx0IyddY1iOo
 LSb/C83Kl6Et4tznqL1dyQM5uZ6wIx5v9p90VVJM9cwsBedcYItc2Zjr20y3Z89gIvG1
 W9QYvbLBaO9eMlTfer86d7PfmFhgsPD8NvKEEd19NUPlhiaMHJUE+g79QWEAnKpoIoyY JA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c3uh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Nov 2022 00:17:44 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Nov 2022 17:17:42 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Nov 2022 17:17:42 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] nftables: use automake ptest output format
Date: Wed, 2 Nov 2022 17:17:42 -0700
Message-ID: <20221103001742.21508-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -DlfrwGUdMrFKCt3nhoEaKp50qPdiDpJ
X-Proofpoint-GUID: -DlfrwGUdMrFKCt3nhoEaKp50qPdiDpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030000
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Nov 2022 00:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99424

Make run-ptest use the correct libdir for multilib builds.

Log the ptest output to a date stamped file and append a test summary
to the end of the log.

Munge the log as it is produced to:
 - insert the expected automake keywords: PASS and FAIL.
 - remove escape sequences used for ANSI colours as well as movement commands

Add additional discrete tool dependencies to the nftables-ptest list since
the test suite does not work with the busybox versions.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-filter/nftables/nftables/run-ptest  | 17 ++++++++++++++++-
 .../recipes-filter/nftables/nftables_1.0.5.bb   |  4 +++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables/run-ptest b/meta-networking/recipes-filter/nftables/nftables/run-ptest
index 611b84485..27d780ace 100644
--- a/meta-networking/recipes-filter/nftables/nftables/run-ptest
+++ b/meta-networking/recipes-filter/nftables/nftables/run-ptest
@@ -1,2 +1,17 @@
 #!/bin/sh
-tests/shell/run-tests.sh -v
+
+NFTABLESLIB=@libdir@/nftables
+cd ${NFTABLESLIB}/ptest
+
+LOG="${NFTABLESLIB}/ptest/nftables_ptest_$(date +%Y%m%d-%H%M%S).log"
+tests/shell/run-tests.sh -v | sed  -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a ${LOG}
+
+passed=`grep PASS: ${LOG}|wc -l`
+failed=`grep FAIL: ${LOG}|wc -l`
+all=$((passed + failed))
+
+(   echo "=== Test Summary ==="
+    echo "TOTAL: ${all}"
+    echo "PASSED: ${passed}"
+    echo "FAILED: ${failed}"
+) | tee -a ${LOG}
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
index 1708786f4..c5a2968d1 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.5.bb
@@ -35,7 +35,7 @@ PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
 
-RDEPENDS:${PN}-ptest += " ${PN}-python make bash python3-core python3-ctypes python3-json python3-misc util-linux"
+RDEPENDS:${PN}-ptest += " ${PN}-python bash make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux"
 
 TESTDIR = "tests"
 
@@ -50,4 +50,6 @@ do_install_ptest() {
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}/${TESTDIR}
     sed -i 's#/usr/bin/python#/usr/bin/python3#' ${D}${PTEST_PATH}/${TESTDIR}/json_echo/run-test.py
     sed -i 's#/usr/bin/env python#/usr/bin/env python3#' ${D}${PTEST_PATH}/${TESTDIR}/py/nft-test.py
+    # handle multilib
+    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.35.1


