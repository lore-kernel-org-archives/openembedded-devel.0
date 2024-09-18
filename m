Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EE5CCD1A0
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 11:28:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12745.1726658931815632165
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 04:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9991ddb9ec=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I6Tqme027249
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 04:28:51 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n5s4kuu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 04:28:51 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 04:28:50 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 04:28:49 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] mbedtls: upgrade 3.6.0 -> 3.6.1
Date: Wed, 18 Sep 2024 11:28:45 +0000
Message-ID: <20240918112845.1215050-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: g0cA_HqJuCjvHgEC7Yt9WnGqaKDomLI_
X-Proofpoint-GUID: g0cA_HqJuCjvHgEC7Yt9WnGqaKDomLI_
X-Authority-Analysis: v=2.4 cv=C8+7yhP+ c=1 sm=1 tr=0 ts=66eab973 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=8hB5-h17Vu8DU5hV58wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_09,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409180074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 11:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112356

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.1

Security fixes:
CVE-2024-45157
CVE-2024-45158
CVE-2024-45159

* According to commit[1], install data_files into framework directory
  for ptest.

[1] https://github.com/Mbed-TLS/mbedtls/commit/9c4dd4ee6fe570b6a50a275d78b7d140fec0e02f

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../mbedtls/{mbedtls_3.6.0.bb => mbedtls_3.6.1.bb}       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.0.bb => mbedtls_3.6.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
index 92a2de82a..29c96f19a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
@@ -23,12 +23,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
 	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
 	file://run-ptest"
 
-SRCREV = "2ca6c285a0dd3f33982dd57299012dacab1ff206"
-SRCREV_framework = "750634d3a51eb9d61b59fd5d801546927c946588"
+SRCREV = "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+SRCREV_framework = "94599c0e3b5036e086446a51a3f79640f70f22f6"
 SRCREV_FORMAT .= "_framework"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -76,7 +76,8 @@ sysroot_stage_all:append() {
 
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/tests
+	install -d ${D}${PTEST_PATH}/framework
 	cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
 	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
-	cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
+	cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/framework/
 }
-- 
2.40.0


