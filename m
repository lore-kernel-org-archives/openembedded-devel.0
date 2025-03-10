Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB702C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 08:39:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33044.1741595969310829746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 01:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164ebc232=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A60dPC021384
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 08:39:28 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b411vb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 08:39:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Mar 2025 01:39:27 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 10 Mar 2025 01:39:26 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH] python3-ecdsa: Add ptest support
Date: Mon, 10 Mar 2025 16:39:25 +0800
Message-ID: <20250310083925.3263371-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cea540 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=_xNh0AYJ_ZwcpeIJGaQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DfgAFFswYZYNG9H18GF7lkHVYEFWm0dY
X-Proofpoint-GUID: DfgAFFswYZYNG9H18GF7lkHVYEFWm0dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503100067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 08:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115824

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix the test warning.

root@intel-x86-64:/usr/lib64/python3-ecdsa/ptest# ./run-ptest
============================= test session starts ==============================
platform linux -- Python 3.10.16, pytest-7.1.1, pluggy-1.0.0
rootdir: /usr/lib64/python3-ecdsa/ptest
plugins: hypothesis-6.39.5
collected 1601 items

PASS: tests/test_curves.py::TestParameterEncoding::test_compare_curves_with_different_generators
PASS: tests/test_curves.py::TestParameterEncoding::test_compare_with_different_object
PASS: tests/test_curves.py::TestParameterEncoding::test_decode_malformed_explicit_garbage_after_ECParam
PASS: tests/test_curves.py::TestParameterEncoding::test_decode_malformed_garbage_after_prime
PASS: tests/test_curves.py::TestParameterEncoding::test_decode_malformed_named_curve
PASS: tests/test_curves.py::TestParameterEncoding::test_decode_malformed_unknown_field_type
PASS: tests/test_curves.py::TestParameterEncoding::test_decode_malformed_unknown_version_number
PASS: tests/test_curves.py::TestParameterEncoding::test_decoding_explicit_from_openssl
PASS: tests/test_curves.py::TestParameterEncoding::test_decoding_well_known_from_explicit_params
PASS: tests/test_curves.py::TestParameterEncoding::test_decoding_with_incorrect_valid_encodings
PASS: tests/test_curves.py::TestParameterEncoding::test_default_encode_for_custom_curve
PASS: tests/test_curves.py::TestParameterEncoding::test_encoding_to_explicit_compressed_params
PASS: tests/test_curves.py::TestParameterEncoding::test_encoding_to_explicit_params
PASS: tests/test_curves.py::TestParameterEncoding::test_from_pem
[snip]
PASS: tests/test_pyecdsa.py::test_RFC4754_vectors[ECDSA-384]
PASS: tests/test_pyecdsa.py::test_RFC4754_vectors[ECDSA-521]
PASS: tests/test_rw_lock.py::RWLockTestCase::test_many_writers_priority
PASS: tests/test_rw_lock.py::RWLockTestCase::test_readers_nonexclusive_access
PASS: tests/test_rw_lock.py::RWLockTestCase::test_writer_priority
PASS: tests/test_rw_lock.py::RWLockTestCase::test_writers_exclusive_access

======================= 1601 passed in 270.57s (0:04:30) =======================

[1] https://github.com/tlsfuzzer/python-ecdsa/commit/50c1fa44f35b9d383ffbc3e045a94419f6c347d1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...convention-for-testing-that-no-warni.patch | 82 +++++++++++++++++++
 .../python/python3-ecdsa/run-ptest            |  3 +
 .../python/python3-ecdsa_0.17.0.bb            | 22 ++++-
 3 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa/0001-use-recommended-convention-for-testing-that-no-warni.patch
 create mode 100755 meta-python/recipes-devtools/python/python3-ecdsa/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa/0001-use-recommended-convention-for-testing-that-no-warni.patch b/meta-python/recipes-devtools/python/python3-ecdsa/0001-use-recommended-convention-for-testing-that-no-warni.patch
new file mode 100644
index 0000000000..3dae4b06fe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ecdsa/0001-use-recommended-convention-for-testing-that-no-warni.patch
@@ -0,0 +1,82 @@
+From 50c1fa44f35b9d383ffbc3e045a94419f6c347d1 Mon Sep 17 00:00:00 2001
+From: Hubert Kario <hubert@kario.pl>
+Date: Thu, 23 Feb 2023 23:03:24 +0100
+Subject: [PATCH] use recommended convention for testing that no warnings were
+ raised
+
+Upstream-Status: Backport [https://github.com/tlsfuzzer/python-ecdsa/commit/50c1fa44f35b9d383ffbc3e045a94419f6c347d1]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/ecdsa/test_der.py | 30 ++++++++++++------------------
+ 1 file changed, 12 insertions(+), 18 deletions(-)
+
+diff --git a/src/ecdsa/test_der.py b/src/ecdsa/test_der.py
+index 0ca5bd7..833d12d 100644
+--- a/src/ecdsa/test_der.py
++++ b/src/ecdsa/test_der.py
+@@ -144,26 +144,22 @@ class TestEncodeBitstring(unittest.TestCase):
+ 
+     def test_new_call_convention(self):
+         """This is how it should be called now."""
+-        warnings.simplefilter("always")
+-        with pytest.warns(None) as warns:
++        # make sure no warnings are raised
++        with warnings.catch_warnings():
++            warnings.simplefilter("error")
+             der = encode_bitstring(b"\xff", 0)
+ 
+-        # verify that new call convention doesn't raise Warnings
+-        self.assertEqual(len(warns), 0)
+-
+         self.assertEqual(der, b"\x03\x02\x00\xff")
+ 
+     def test_implicit_unused_bits(self):
+         """
+         Writing bit string with already included the number of unused bits.
+         """
+-        warnings.simplefilter("always")
+-        with pytest.warns(None) as warns:
++        # make sure no warnings are raised
++        with warnings.catch_warnings():
++            warnings.simplefilter("error")
+             der = encode_bitstring(b"\x00\xff", None)
+ 
+-        # verify that new call convention doesn't raise Warnings
+-        self.assertEqual(len(warns), 0)
+-
+         self.assertEqual(der, b"\x03\x02\x00\xff")
+ 
+     def test_explicit_unused_bits(self):
+@@ -203,22 +199,20 @@ class TestRemoveBitstring(unittest.TestCase):
+         self.assertEqual(rest, b"")
+ 
+     def test_new_call_convention(self):
+-        warnings.simplefilter("always")
+-        with pytest.warns(None) as warns:
++        # make sure no warnings are raised
++        with warnings.catch_warnings():
++            warnings.simplefilter("error")
+             bits, rest = remove_bitstring(b"\x03\x02\x00\xff", 0)
+ 
+-        self.assertEqual(len(warns), 0)
+-
+         self.assertEqual(bits, b"\xff")
+         self.assertEqual(rest, b"")
+ 
+     def test_implicit_unexpected_unused(self):
+-        warnings.simplefilter("always")
+-        with pytest.warns(None) as warns:
++        # make sure no warnings are raised
++        with warnings.catch_warnings():
++            warnings.simplefilter("error")
+             bits, rest = remove_bitstring(b"\x03\x02\x00\xff", None)
+ 
+-        self.assertEqual(len(warns), 0)
+-
+         self.assertEqual(bits, (b"\xff", 0))
+         self.assertEqual(rest, b"")
+ 
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest b/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest
new file mode 100755
index 0000000000..3385d68939
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ecdsa/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
index 177019ccc2..5d407b513e 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
@@ -3,13 +3,33 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 
+SRC_URI += "\
+           file://0001-use-recommended-convention-for-testing-that-no-warni.patch \
+           file://run-ptest \
+"
+
 DEPENDS += "python3-pip python3-pbr"
 
 PYPI_PACKAGE = "ecdsa"
 SRC_URI[sha256sum] = "b9f500bb439e4153d0330610f5d26baaf18d17b8ced1bc54410d189385ea68aa"
 
-inherit pypi setuptools3 python3native
+inherit pypi setuptools3 python3native ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/src/ecdsa/* ${D}${PTEST_PATH}/tests/
+}
 
 RDEPENDS:${PN} += "python3-six python3-gmpy2 python3-pbr"
 
+RDEPENDS:${PN}-ptest += " \
+    python3-hypothesis \
+    python3-pytest \
+"
+
+do_install:append() {
+	rm -fr ${D}${libdir}/python*/site-packages/ecdsa/__pycache__
+	rm ${D}${PYTHON_SITEPACKAGES_DIR}/ecdsa/test_*.py
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


