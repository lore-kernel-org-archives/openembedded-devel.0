Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73656CED25D
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 09:25:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12055.1728465915898840085
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 02:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00128846ac=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4996WfkL012730
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 09:25:15 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422ve8v95q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 09:25:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 02:25:13 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 02:25:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] asio: Add ptest support
Date: Wed, 9 Oct 2024 17:25:12 +0800
Message-ID: <20241009092512.3615190-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=CPp4XgrD c=1 sm=1 tr=0 ts=67064bfa cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=9MFcX9bQTZszHhRzqVUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GeO2SPvG2MqB2jibrz8d1Asmnj1YDPBW
X-Proofpoint-GUID: GeO2SPvG2MqB2jibrz8d1Asmnj1YDPBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_08,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410090062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 09:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112724

From: Mingli Yu <mingli.yu@windriver.com>

 # ./run-ptest
PASS: address
PASS: address_v4
PASS: address_v4_iterator
PASS: address_v4_range
PASS: address_v6
PASS: address_v6_iterator
PASS: address_v6_range
PASS: any_completion_executor
PASS: any_completion_handler
PASS: any_executor
PASS: any_io_executor
PASS: append
PASS: as_tuple
PASS: associated_allocator
PASS: associated_cancellation_slot
PASS: associated_executor
PASS: associated_immediate_executor
PASS: associator
PASS: async_result
[snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/asio/asio/run-ptest | 19 +++++++++++++++++++
 meta-oe/recipes-support/asio/asio_1.30.2.bb | 18 ++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest

diff --git a/meta-oe/recipes-support/asio/asio/run-ptest b/meta-oe/recipes-support/asio/asio/run-ptest
new file mode 100644
index 000000000..d37db0b31
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests=$(find * -type f -executable)
+
+rm -rf test.log
+
+for f in $tests
+do
+    if test -x ./"$f"; then
+        if ./"$f" > test.log 2>&1; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    fi
+done
diff --git a/meta-oe/recipes-support/asio/asio_1.30.2.bb b/meta-oe/recipes-support/asio/asio_1.30.2.bb
index 6930381ec..ae0baadc6 100644
--- a/meta-oe/recipes-support/asio/asio_1.30.2.bb
+++ b/meta-oe/recipes-support/asio/asio_1.30.2.bb
@@ -8,9 +8,11 @@ LICENSE = "BSL-1.0"
 
 DEPENDS = "openssl"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
+           file://run-ptest \
+"
 
-inherit autotools
+inherit autotools ptest
 
 ALLOW_EMPTY:${PN} = "1"
 
@@ -22,4 +24,16 @@ PACKAGECONFIG ??= "boost"
 
 PACKAGECONFIG[boost] = "--with-boost=${STAGING_LIBDIR},--without-boost,boost"
 
+TESTDIR = "src/tests"
+do_compile_ptest() {
+    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
+    oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    # copy executables
+    find ${B}/${TESTDIR}/unit -type f -executable -exec cp {} ${D}${PTEST_PATH}/tests/ \;
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


