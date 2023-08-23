Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5772DEE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:41:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8467.1692787294537156238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cB6fmaUk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75991bd149=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37NAfXnr014947;
	Wed, 23 Aug 2023 10:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=riPQACx/NMAXhbDwiZxBtIRQjbO2UO6jsRUdHPJeufU=; b=
	cB6fmaUkrFgudJTeRmckF0MwGkZoz6ZN6lRfr2NWHT2iAZ/sgLDjRt+by8AQCTR3
	tvfGTKIAYZzP3gXVv4p/r/xktFGs2mAs1R5WOnCstKn8zkUJG1j+6JJgN0YsneZA
	NyE8vhN+kCrd+NGzlaeTVB+JAb8CrgAy+eizbed8FGFXWGtihM2i1R4GYfkOo94p
	CpPEysW+cLiGvEcx8tns/HT5pXRCD+ap7MS2XbN4uBm0cmpdfCxY28/tiJSkk0QI
	gUZMRna4Wknbx/gpz66cnpIt4ZFNKX7nbM7vGgWIX90NQiSORfKQsCKeHb5xALRa
	yXl2Tu4s1rYTC1HAZ+gakA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mgmuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Aug 2023 10:41:33 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 03:41:30 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH v2 2/2] Introduce python3-trustme to fix ptest error of python3-requests-toolbelt
Date: Wed, 23 Aug 2023 10:41:10 +0000
Message-ID: <20230823104110.1949022-2-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230823104110.1949022-1-narpat.mali@windriver.com>
References: <20230823104110.1949022-1-narpat.mali@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: JEEACc2IMAC8FkLosZaFtk3Cp2tP1JNF
X-Proofpoint-GUID: JEEACc2IMAC8FkLosZaFtk3Cp2tP1JNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 10:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104534

From: Narpat Mali <narpat.mali@windriver.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Cherry-picked the upstream master commit:
https://git.openembedded.org/meta-openembedded/commit/?id=a4b6e3ee894047cd13c5d2b7bfc67f0093899537

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
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
index fdeb83c42a..c2481eb307 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -373,6 +373,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
+    python3-service-identity \
     python3-sh \
     python3-sijax \
     python3-simpleeval \
@@ -408,6 +409,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-trafaret-config \
     python3-traitlets \
     python3-transitions \
+    python3-trustme \
     python3-twine \
     python3-twisted \
     python3-twitter \
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
index c39950ab5d..7191a3e6c1 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
@@ -21,6 +21,7 @@ RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-betamax \
 	${PYTHON_PN}-mock \
 	${PYTHON_PN}-multiprocessing \
+        ${PYTHON_PN}-trustme \
 "
 
 do_install_ptest() {
diff --git a/meta-python/recipes-devtools/python/python3-service-identity/run-ptest b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-service-identity/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
new file mode 100644
index 0000000000..0210a5de22
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
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trustme/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
new file mode 100644
index 0000000000..641512c46c
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
2.40.0


