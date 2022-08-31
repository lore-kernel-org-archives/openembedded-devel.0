Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDA7ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 09:45:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23625.1661939121333162529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 02:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QVCnvjsn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6242fbc68e=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27V8pZtx011220
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=3gc+TlVYaotPGdw3c8pDSTqCRVjWTW9aYz0gp/XXF58=;
 b=QVCnvjsnJzgD/fiNXaGSzUKfRTDnJAazEvKeekBz1qrvh+Bn2zXGZ+md7NHp6+ZqqyGm
 SF7wUp8A6Ch7xmD3C0M2rLY8FidRDy8jh4mp9VgcRcMG6547gKwGBVOjTw7eqP+E/pxB
 1QDZ5pqBGTLGyPMFSHHAntfqiNrhUvkwj4WLK/ZvadS1YGtKfR+6jKo+0va9zZECAgHS
 gcRMlX65dW8l79CxTamxOrMfd0sZBKGE7nd6zkcIe55YBv7AK8nx2ni3xzH+jOt0ysyV
 wcGZ8EGRTCurSplx11nTK3ZVe4x/RCsHSv1BZhe9YNvudh9heF91WsF9lR/c646Wawf+ mQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89kj28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:45:20 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 31 Aug 2022 02:45:19 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 31 Aug 2022 02:45:18 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/2] python3-pyzmq: Add RDEPENDS for
 python3-pyzmq-ptest
Date: Wed, 31 Aug 2022 17:45:16 +0800
Message-ID: <20220831094517.2468260-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: h-l3jE6rh_2brT8slzxCeIiGYHBxD5mD
X-Proofpoint-GUID: h-l3jE6rh_2brT8slzxCeIiGYHBxD5mD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_05,2022-08-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=940
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208310048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Aug 2022 09:45:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98576

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  # ./run-ptest
  ./run-ptest: line 3: pytest: command not found

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
index 40cb22b5e..78545f5c3 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
@@ -30,6 +30,10 @@ RDEPENDS:${PN} += "\
         ${PYTHON_PN}-multiprocessing \
 "
 
+RDEPENDS:${PN}-ptest += "\
+        ${PYTHON_PN}-pytest \
+"
+
 RDEPENDS:${PN}-ptest += "\
         ${PN}-test \
 "
-- 
2.25.1


