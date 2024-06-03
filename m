Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF855C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 05:47:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.76727.1717393623940571871
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 22:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6884dc6aeb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4534MbmJ004698
	for <openembedded-devel@lists.openembedded.org>; Sun, 2 Jun 2024 22:47:03 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwysafu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 22:47:03 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 22:47:02 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 2 Jun 2024 22:47:02 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-dasbus: Add ptest support
Date: Mon, 3 Jun 2024 13:47:01 +0800
Message-ID: <20240603054701.800398-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: O4NhP1Zuw3rdQ20vfqtWMj-RQ8D2ndeV
X-Proofpoint-ORIG-GUID: O4NhP1Zuw3rdQ20vfqtWMj-RQ8D2ndeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2405170001 definitions=main-2406030046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 05:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110668

From: Mingli Yu <mingli.yu@windriver.com>

 #./run-ptest
 PASS: tests/test_client.py:DBusClientTestCase.test_async_method
 PASS: tests/test_client.py:DBusClientTestCase.test_error
 PASS: tests/test_client.py:DBusClientTestCase.test_interface_proxy
 PASS: tests/test_client.py:DBusClientTestCase.test_introspect
 PASS: tests/test_client.py:DBusClientTestCase.test_invalid_method_result
 PASS: tests/test_client.py:DBusClientTestCase.test_method
 PASS: tests/test_client.py:DBusClientTestCase.test_property
 PASS: tests/test_client.py:DBusClientTestCase.test_signal
 PASS: tests/test_client.py:DBusClientTestCase.test_variant_type_factory
 [snip]
 ============================================================================
 Testsuite summary
 # TOTAL: 162
 # PASS: 162
 # SKIP: 0
 # XFAIL: 0
 # FAIL: 0
 # XPASS: 0
 # ERROR: 0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-dasbus/run-ptest           |  3 +++
 .../python/python3-dasbus_1.7.bb              | 19 ++++++++++++++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100755 meta-python/recipes-devtools/python/python3-dasbus/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 2e701dc15..bdcd658d9 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -17,6 +17,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-cachetools \
     python3-cbor2 \
     python3-click \
+    python3-dasbus \
     python3-dominate \
     python3-execnet \
     python3-flask \
diff --git a/meta-python/recipes-devtools/python/python3-dasbus/run-ptest b/meta-python/recipes-devtools/python/python3-dasbus/run-ptest
new file mode 100755
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dasbus/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
index 3efa96171..d1d294a28 100644
--- a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
@@ -5,11 +5,28 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
 SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=master \
+           file://run-ptest \
 "
 SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools3
+inherit setuptools3 ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+
+    # Remove the problematic cases
+    # https://github.com/dasbus-project/dasbus/issues/128
+    rm -rf ${D}${PTEST_PATH}/tests/lib_dbus.py
+    rm -rf ${D}${PTEST_PATH}/tests/test_dbus.py
+    rm -rf ${D}${PTEST_PATH}/tests/test_unix.py
+}
 
 RDEPENDS:${PN} = "python3-pygobject"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-unittest-automake-output \
+"
-- 
2.25.1


