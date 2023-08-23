Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABEDEE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 09:47:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7800.1692784048778963201
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 02:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kV/Ml2aB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=759984bec9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N9Side020231
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 02:47:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=4hDEX
	SZJYMnBrp2AwblTj3gasQ/rgQgxvxWR+5pL5t4=; b=kV/Ml2aBiO3A61ao2KFy0
	HXWJW5rkZDb2/V8nLKco+UsgNj4xxAVx2jiyh0GrY+M5i0wlX0ZcOuL++DjT+i4y
	V5mdX5aIcGMEorDEVOT42r3noU5Uts+n1oJvFr+HdQY9dDsB/+tZQIFncz/BMpua
	4VjoUDcHmQ+o4gZ77R+qhQZJpEfW2QFA6xwvoMBz7ATm0ibttl7qhSDsa3PJ30LP
	w5Nimyv+L5nuw3Hwn8Dx2/9NQl8wPHXUpses66YeivrgTPX72uId/vJ2U3sRCdXw
	4XxQDw9L91sZlVL1sOuEnzKVPA8jYyezMFNP8xstx72uIK9ru+DLN/iqKkJ39vwd
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dgm28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 02:47:28 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 02:47:26 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-python][PATCH 1/1] python3-pyroute2: fix ptest failure
Date: Wed, 23 Aug 2023 09:47:08 +0000
Message-ID: <20230823094708.1500785-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 7IwHIGHpRjYKf1WkfGy-wwteG9lGm9tM
X-Proofpoint-GUID: 7IwHIGHpRjYKf1WkfGy-wwteG9lGm9tM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=879 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2308230089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 09:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104533

The ptest fails after python3-pyroute2 is upgraded to 0.7.9.

Fixes:
=================================================
tests/test_unit/test_iproute_match/test_match.py:10: in <module>
with open('test_unit/test_iproute_match/links.dump', 'r') as f:
E   FileNotFoundError: [Errno 2] No such file or directory:
'test_unit/test_iproute_match/links.dump'

with open(sample, 'r') as buf:
E       FileNotFoundError: [Errno 2] No such file or directory:
'test_unit/test_nlmsg/gre_01.dump'
=================================================

root@qemux86-64:~# ptest-runner python3-pyroute2
START: ptest-runner
2023-08-22T10:31
BEGIN: /usr/lib/python3-pyroute2/ptest
============================= test session starts ==============================
platform linux -- Python 3.11.4, pytest-7.4.0, pluggy-1.2.0
rootdir: /usr/lib/python3-pyroute2/ptest
collected 103 items

PASS: tests/test_unit/test_addr_pool.py::test_alloc_aligned
PASS: tests/test_unit/test_addr_pool.py::test_alloc_odd
---

---
PASS: tests/test_unit/test_requests/test_route.py::test_empty_target[explicit-ipv4-newdst]
PASS: tests/test_unit/test_requests/test_route.py::test_empty_target[split-ipv4-newdst]

============================= 103 passed in 0.33s ==============================
DURATION: 0
END: /usr/lib/python3-pyroute2/ptest
2023-08-22T10:31
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
index 263acd06c..39fbd1a00 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
@@ -35,4 +35,6 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    sed -e  "s|'test_unit|'tests/test_unit|g" -i  ${D}${PTEST_PATH}/tests/test_unit/test_nlmsg/test_marshal.py \
+    ${D}${PTEST_PATH}/tests/test_unit/test_iproute_match/test_match.py
 }
-- 
2.40.0


