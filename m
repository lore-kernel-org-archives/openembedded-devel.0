Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4D4C369CB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 02:39:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20338.1745721571120806011
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 19:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6212614de0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53R1oZmN030251
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 02:39:30 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq196py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 02:39:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 26 Apr 2025 19:39:29 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 26 Apr 2025 19:39:28 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2 1/2] python3-pykickstart: Add ptest support
Date: Sun, 27 Apr 2025 10:39:26 +0800
Message-ID: <20250427023927.2504776-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680d98e2 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=eRiDgX-SG9BNaS81xyEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ble3y49lOF3aEkaN39M4EJUqKKE74Yc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDAxOCBTYWx0ZWRfX3bJ9+tCKH7Pj vlKT7X2ShU27Sumy1ECndz7L2XUtObULGrx/yoldp2rFenWoQjYF2WoufgIpx3HGiLDjPm6dGVl sjDja/bWn7Hdr4mwITqY7qDUsqbsidYJJdti0AruKqXtOvNNulCYOqOzHh+ZnZ+wx0HvyTItMNB
 fiZ4o99JwYwsOjcBBGyChJXWvLPpnyK1vbdrDUBLbHjYbOqiyvlmTQxDTCfY1+JuHZgAewDY9Bw 43k3seN4NVE7nrJ9wV+Fo6UmF46dcttR/5RDn00USdPKB4wlTLhRIugL7LtCYB2KrF8D/1u4Cst 8nAdOxbKt203at5cFXOmeyIn8nnw1d6mxymbOUCQTUNDiur2zeuNdynHc8q+acXG1SucxtP2DbA
 qoT0/vUdgBbL+TOBpyL4fFm7LeAvbYMMICGgcaveL0t6sIKMCc7jvMrrN6QIb7Ni3JL55dvN
X-Proofpoint-GUID: ble3y49lOF3aEkaN39M4EJUqKKE74Yc-
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504270018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 02:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117155

From: Mingli Yu <mingli.yu@windriver.com>

 # ./run-ptest
PASS: tests/commands/test_authconfig.py:FC3_TestCase.runTest
PASS: tests/commands/test_authconfig.py:F28_TestCase.runTest
PASS: tests/commands/test_authconfig.py:F35_TestCase.runTest
PASS: tests/commands/test_authselect.py:F28_TestCase.runTest
PASS: tests/commands/test_autopart.py:AutoPart_TestCase.runTest
PASS: tests/commands/test_autopart.py:FC3_TestCase.runTest
PASS: tests/commands/test_autopart.py:F9_TestCase.runTest
PASS: tests/commands/test_autopart.py:F12_TestCase.runTest
[snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python-pykickstart/files/run-ptest         |  3 +++
 .../python3-pykickstart_3.63.bb                | 18 +++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100755 meta-python/recipes-extended/python-pykickstart/files/run-ptest

diff --git a/meta-python/recipes-extended/python-pykickstart/files/run-ptest b/meta-python/recipes-extended/python-pykickstart/files/run-ptest
new file mode 100755
index 0000000000..289e68b054
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake --deselect tests/test_packages.py::AddGroupsAndEnvironment_TestCase --deselect tests/commands/test_reboot.py::Reboot_TestCase
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
index bd20c69980..c701e361b7 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
@@ -4,18 +4,34 @@ LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d"
 
-inherit python_setuptools_build_meta
+inherit python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} = "python3 \
                   python3-requests \
                   python3-six \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests
+    for file in `grep -Rl unittest.main ${D}${PTEST_PATH}/tests/`; do
+        dirname=`dirname $file`
+        basename=`basename $file`
+        [ $basename != "__init__.py" ] && mv $file ${dirname}/test_${basename}
+    done
+}
+
 SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=master;tag=r${PV} \
            file://0001-support-authentication-for-kickstart.patch \
            file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
+           file://run-ptest \
            "
 SRCREV = "6e0d1238cb4696a9040072a5a28a706e5775c552"
 
-- 
2.34.1


