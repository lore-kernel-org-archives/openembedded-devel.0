Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17810E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 11:39:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11928.1734953991090708450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 03:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208778e7b9=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBP2Ct019962
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 11:39:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn89q6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 11:39:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 23 Dec 2024 03:39:48 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 23 Dec 2024 03:39:48 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][PATCH] asio: Add ptest support
Date: Mon, 23 Dec 2024 19:39:47 +0800
Message-ID: <20241223113947.2156639-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zsFl06cEOJghJ9MwuBhJ09koEyjH9LqB
X-Proofpoint-ORIG-GUID: zsFl06cEOJghJ9MwuBhJ09koEyjH9LqB
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=67694c06 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=BdRnEzEAbcPsRMKSITcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_05,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 11:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114467

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: 1274b0df3c126e72dcbfd4678d1c25aadb8607dc)

* remove duplicated SRC_URI
* refresh 0001-tests-Remove-blocking_adaptation.cpp.patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...tests-Remove-blocking_adaptation.cpp.patch | 45 +++++++++++++++++++
 meta-oe/recipes-support/asio/asio/run-ptest   | 19 ++++++++
 meta-oe/recipes-support/asio/asio_1.20.0.bb   | 21 +++++++--
 3 files changed, 81 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
 create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest

diff --git a/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch b/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
new file mode 100644
index 0000000000..1de0edc05c
--- /dev/null
+++ b/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
@@ -0,0 +1,45 @@
+From 3200dd761894f04f559c3a60b67178a9d40bf34c Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 10 Oct 2024 13:58:38 +0800
+Subject: [PATCH] tests: Remove blocking_adaptation.cpp
+
+The test failed to build with clang as below.
+../../../asio-1.30.2/src/tests/../../include/asio/execution/blocking_adaptation.hpp:216:13: error: call to 'query' is ambiguous
+  216 |             conditional_t<true, T, P>::query(static_cast<P&&>(p))
+      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+../../../asio-1.30.2/src/tests/../../include/asio/execution/blocking_adaptation.hpp:213:29: note: in instantiation of exception specification for 'query<asio::execution::detail::blocking_adaptation::allowed_t<>>' requested here
+  213 |       static constexpr auto query(P&& p)
+      |
+
+We can add the case back once the above build failure resolved then.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/tests/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
+index 7161698..25f3b08 100644
+--- a/src/tests/Makefile.am
++++ b/src/tests/Makefile.am
+@@ -51,7 +51,6 @@ check_PROGRAMS = \
+ 	unit/error \
+ 	unit/execution/any_executor \
+ 	unit/execution/blocking \
+-	unit/execution/blocking_adaptation \
+ 	unit/execution/bulk_execute \
+ 	unit/execution/bulk_guarantee \
+ 	unit/execution/connect \
+@@ -244,7 +243,6 @@ TESTS = \
+ 	unit/error \
+ 	unit/execution/any_executor \
+ 	unit/execution/blocking \
+-	unit/execution/blocking_adaptation \
+ 	unit/execution/bulk_execute \
+ 	unit/execution/bulk_guarantee \
+ 	unit/execution/connect \
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/asio/asio/run-ptest b/meta-oe/recipes-support/asio/asio/run-ptest
new file mode 100644
index 0000000000..d37db0b315
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
diff --git a/meta-oe/recipes-support/asio/asio_1.20.0.bb b/meta-oe/recipes-support/asio/asio_1.20.0.bb
index cedcf9fee0..5e7a6e2495 100644
--- a/meta-oe/recipes-support/asio/asio_1.20.0.bb
+++ b/meta-oe/recipes-support/asio/asio_1.20.0.bb
@@ -9,9 +9,12 @@ LICENSE = "BSL-1.0"
 
 DEPENDS = "openssl"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
+           file://0001-tests-Remove-blocking_adaptation.cpp.patch \
+           file://run-ptest \
+"
 
-inherit autotools
+inherit autotools ptest
 
 ALLOW_EMPTY:${PN} = "1"
 
@@ -19,10 +22,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=416f4cc4f79551b690babb14ef1a5799"
 
 SRC_URI[sha256sum] = "204374d3cadff1b57a63f4c343cbadcee28374c072dc04b549d772dbba9f650c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
-
 PACKAGECONFIG ??= "boost"
 
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
2.25.1


