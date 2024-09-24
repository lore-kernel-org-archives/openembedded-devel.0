Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6A9CF9C72
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 05:17:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7019.1727155032690880099
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 22:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99972f2181=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O3GIvp001990
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 05:17:12 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hg4w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 05:17:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 22:17:10 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 22:17:09 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-setproctitle: Add new recipe
Date: Tue, 24 Sep 2024 13:17:09 +0800
Message-ID: <20240924051709.1651709-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZH1qDE-H5fGabMarE7W9lytyRDoM3Qh9
X-Authority-Analysis: v=2.4 cv=bas5U/PB c=1 sm=1 tr=0 ts=66f24b57 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=o1yVQ1u4XMgHfVsStkgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZH1qDE-H5fGabMarE7W9lytyRDoM3Qh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_19,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409240034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 05:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112468

From: Mingli Yu <mingli.yu@windriver.com>

A Python module to customize the process title.
 # ./run-ptest
PASS: tests/module_test.py:test_no_import_side_effect
PASS: tests/module_test.py:test_version
PASS: tests/module_test.py:test_c_extension_built
PASS: tests/setproctitle_test.py:test_runner
PASS: tests/setproctitle_test.py:test_init_getproctitle
PASS: tests/setproctitle_test.py:test_setproctitle
SKIP: tests/setproctitle_test.py:test_setproctitle_darwin # SKIP Mac only test
PASS: tests/setproctitle_test.py:test_prctl
PASS: tests/setproctitle_test.py:test_getproctitle
PASS: tests/setproctitle_test.py:test_kwarg
PASS: tests/setproctitle_test.py:test_environ
PASS: tests/setproctitle_test.py:test_issue_8
PASS: tests/setproctitle_test.py:test_large_cmdline
PASS: tests/setproctitle_test.py:test_weird_args
PASS: tests/setproctitle_test.py:test_weird_path
PASS: tests/setproctitle_test.py:test_embedded
PASS: tests/setproctitle_test.py:test_embedded_many_args
PASS: tests/setproctitle_test.py:test_noenv
PASS: tests/setproctitle_test.py:test_large_env
PASS: tests/setproctitle_test.py:test_clear_segfault
PASS: tests/setproctitle_test.py:test_fork_segfault
PASS: tests/setproctitle_test.py:test_thread_fork_segfault
PASS: tests/setthreadtitle_test.py:test_thread_title_unchanged
PASS: tests/setthreadtitle_test.py:test_set_thread_title
PASS: tests/setthreadtitle_test.py:test_set_threads_title
SKIP: tests/test_win32.py:test_setproctitle # SKIP Windows only test
SKIP: tests/test_win32.py:test_setthreadtitle # SKIP Windows only test
============================================================================
Testsuite summary
 # TOTAL: 27
 # PASS: 24
 # SKIP: 3
 # XFAIL: 0
 # FAIL: 0
 # XPASS: 0
 # ERROR: 0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-setproctitle/run-ptest     |  4 +++
 .../python/python3-setproctitle_1.3.3.bb      | 28 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 92e64908b..e500843e8 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -67,6 +67,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-semver \
     python3-serpent \
     python3-service-identity \
+    python3-setproctitle \
     python3-simpleeval \
     python3-smpplib \
     python3-soupsieve \
diff --git a/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
new file mode 100644
index 000000000..e29e57ee3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+# https://github.com/dvarrazzo/py-setproctitle/issues/141
+pytest --automake -k 'not test_unicode'
diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
new file mode 100644
index 000000000..dcae6b468
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A Python module to customize the process title"
+DESCRIPTION = "The setproctitle module allows a process to change its \
+title (as displayed by system tools such as ps, top or MacOS Activity \
+Monitor)."
+HOMEPAGE = "https://github.com/dvarrazzo/py-setproctitle"
+BUGTRACKER = "https://github.com/dvarrazzo/py-setproctitle/issues"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=86d2d41b5f4f023f43466f8cb7adebaa"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI[sha256sum] = "c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae"
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


