Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74700C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 02:55:18 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.4417.1646708117364857310
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 18:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2282tGWW017492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 7 Mar 2022 18:55:16 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 7 Mar 2022 18:55:14 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 7 Mar 2022 18:55:14 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] Revert "python3-ipy: drop recipe"
Date: Tue, 8 Mar 2022 10:55:11 +0800
Message-ID: <20220308025511.29796-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 02:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95877

From: Kai Kang <kai.kang@windriver.com>

This reverts commit df077258b61f20ec8fdf3978fa4a912d3a14eaf5.

Add python3-ipy back and inherit setuptools3-legacy.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 ++
 .../python/python3-ipy/run-ptest              |  3 ++
 .../python/python3-ipy_1.01.bb                | 32 +++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ipy/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-ipy_1.01.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 670361598..9626231bb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -189,6 +189,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-intelhex \
     python3-intervals \
     python3-ipaddress \
+    python3-ipy \
     python3-ipython \
     python3-ipython-genutils \
     python3-iso3166 \
@@ -498,6 +499,7 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-html2text-ptest \
     python3-inflection-ptest \
     python3-intervals-ptest \
+    python3-ipy-ptest \
     python3-iso3166-ptest \
     python3-jdcal-ptest \
     python3-jinja2-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
new file mode 100644
index 000000000..8e7b5b987
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -0,0 +1,32 @@
+SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses and networks"
+DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
+in a fashion similar to perl's Net::IP and friends. The IP class allows \
+a comfortable parsing and handling for most notations in use for IPv4 \
+and IPv6 Addresses and Networks."
+SECTION = "devel/python"
+HOMEPAGE = "https://github.com/autocracy/python-ipy"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
+
+SRC_URI[md5sum] = "d6cf83e7f418ebbd23324ba1c658b907"
+SRC_URI[sha256sum] = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
+
+inherit pypi setuptools3_legacy ptest
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
+	install -d ${D}${PTEST_PATH}/test/
+	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
+}
+
+PYPI_PACKAGE = "IPy"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


