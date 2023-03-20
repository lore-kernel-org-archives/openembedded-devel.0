Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBAAC6FD1F
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:00:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5860.1679281247153718081
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Mar 2023 20:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=puwXIV+I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=244390f4a0=yue.tao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K2LjF7026264
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 20:00:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=n1Lp//rwh/JhWZyDvwYm4htw59V/YXnrX1jUtKM6QLE=;
 b=puwXIV+IW6CYueK2Q1CUNfOcPsYLszmaQ4JOkShAakhwkemHrAKt4u/CP1pOTtVKGwmN
 M4wFvDWvykwXuiMEylBKY9IjyMWAyGPpLwsHJRJpbYtOSrYr1WlsLGhlRdoZtnDPE9QW
 jxgSVpvnKrcFSuA0MOiq0VcFbznC/ecOk2OIEWxOxXXrJPP/dCeviL97irWySgOQgUEM
 b5Mgp/LH6wl6/zE6604TMHhYRxAfu+HdKVXo7imaXtPBnBaXMb4C0UIPzZSyhh3iO9C+
 LGY8TQrgklBC8D/nZHF9DU/2rA8g5r8xiHQVfy9ZBB7+6430J9D55FVkpou4RJQTv6Pm yQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd8k4s9j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 20:00:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sun, 19 Mar 2023 20:00:45 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 19 Mar 2023 20:00:44 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [meta-python][PATCH] Introduce python3-trustme to fix ptest error of python3-requests-toolbelt
Date: Mon, 20 Mar 2023 10:59:58 +0800
Message-ID: <20230320025958.970-1-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PkWHncRYR9d0w_GMYJBGIjS7w-arJH_U
X-Proofpoint-GUID: PkWHncRYR9d0w_GMYJBGIjS7w-arJH_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-19_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 03:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101600

From: Yue Tao <Yue.Tao@windriver.com>

The ptest fails after python3-requests-toolbelt is upgraded
to 0.10.1.

=======================================================
Hint: make sure your test modules/packages have valid Python names.
Traceback:
../../python3.11/importlib/{}init{}.py:126: in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
tests/test_x509_adapter.py:20: in <module>
    import trustme
E   ModuleNotFoundError: No module named 'trustme'
=======================================================

The commit b93b4067ea "Fix x509 tests by using trustme" of
python3-requests-toolbelt introduces the trustme in test_x509_adapter.py.

Introducing python3-trustme to fix ptest error of python3-requests-toolbelt,
also introducing python3-service-identity, which is requested by python3-trustme's
ptest.

The ptest passes of all the three packages.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 ++
 .../python3-requests-toolbelt_0.10.1.bb       |  1 +
 .../python/python3-service-identity/run-ptest |  3 +++
 .../python/python3-service-identity_21.1.0.bb | 25 +++++++++++++++++
 .../python/python3-trustme/run-ptest          |  3 +++
 .../python/python3-trustme_0.9.0.bb           | 27 +++++++++++++++++++
 6 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-service-identity/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-trustme/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2428674c4..4965e69e0 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -394,6 +394,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
+    python3-service-identity \
     python3-setuptools-declarative-requirements \
     python3-setuptools-scm-git-archive \
     python3-sh \
@@ -431,6 +432,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-trafaret-config \
     python3-traitlets \
     python3-transitions \
+    python3-trustme \
     python3-twine \
     python3-twisted \
     python3-twitter \
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
index b2678952c..b1399c3ed 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
@@ -21,6 +21,7 @@ RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-betamax \
 	${PYTHON_PN}-mock \
 	${PYTHON_PN}-multiprocessing \
+	${PYTHON_PN}-trustme \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
new file mode 100644
index 000000000..0210a5de2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "The tools for verifying whether a certificate is valid for the intended purposes."
+HOMEPAGE = "https://pypi.org/project/service-identity"
+AUTHOR = "Hynek Schlawack"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
+
+SRC_URI[md5sum] = "5e5c195d8fcedc72f9068be2ad9b5a13"
+SRC_URI[sha256sum] = "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
+}
diff --git a/meta-python/recipes-devtools/python/python3-trustme/run-ptest b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
new file mode 100644
index 000000000..641512c46
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "A utility provides a fake certificate authority (CA)"
+HOMEPAGE = "https://pypi.org/project/trustme"
+AUTHOR = "Nathaniel J. Smith"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
+
+SRC_URI[md5sum] = "0e4d698e5aecaf8306cf440bf3dcbbe0"
+SRC_URI[sha256sum] = "5e07b23d70ceed64f3bb36ae4b9abc52354c16c98d45ab037bee2b5fbffe586c"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-service-identity \
+	${PYTHON_PN}-pyasn1-modules \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
+}
-- 
2.17.1


