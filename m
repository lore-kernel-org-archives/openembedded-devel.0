Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82195CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 07:27:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28580.1727594866963616204
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 00:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00029a088b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T7FTvp011767
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 00:27:46 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xd33rusp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 00:27:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 00:27:45 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 29 Sep 2024 00:27:44 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-python][PATCH] python3-setproctitle: Add new recipe
Date: Sun, 29 Sep 2024 15:27:44 +0800
Message-ID: <20240929072744.1929825-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=deDS3mXe c=1 sm=1 tr=0 ts=66f90172 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=n2KDJuY0-AfYFSkBNCMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: S41N0ArZCh8tKl7C1Jvd3JHPpNct6LAl
X-Proofpoint-ORIG-GUID: S41N0ArZCh8tKl7C1Jvd3JHPpNct6LAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-29_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409290055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 07:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112549

From: Mingli Yu <mingli.yu@windriver.com>

A Python module to customize the process title.
 # ./run-ptest
PASS: tests/module_test.py::test_no_import_side_effect
PASS: tests/module_test.py::test_version
PASS: tests/module_test.py::test_c_extension_built
PASS: tests/setproctitle_test.py::test_runner
PASS: tests/setproctitle_test.py::test_init_getproctitle
PASS: tests/setproctitle_test.py::test_setproctitle
tests/setproctitle_test.py::test_setproctitle_darwin SKIPPED (Mac on...)
PASS: tests/setproctitle_test.py::test_prctl
PASS: tests/setproctitle_test.py::test_getproctitle
PASS: tests/setproctitle_test.py::test_kwarg
PASS: tests/setproctitle_test.py::test_environ
PASS: tests/setproctitle_test.py::test_issue_8
PASS: tests/setproctitle_test.py::test_large_cmdline
PASS: tests/setproctitle_test.py::test_weird_args
PASS: tests/setproctitle_test.py::test_weird_path
PASS: tests/setproctitle_test.py::test_embedded
PASS: tests/setproctitle_test.py::test_embedded_many_args
PASS: tests/setproctitle_test.py::test_noenv
PASS: tests/setproctitle_test.py::test_large_env
PASS: tests/setproctitle_test.py::test_clear_segfault
PASS: tests/setproctitle_test.py::test_fork_segfault
PASS: tests/setproctitle_test.py::test_thread_fork_segfault
PASS: tests/setthreadtitle_test.py::test_thread_title_unchanged
PASS: tests/setthreadtitle_test.py::test_set_thread_title
PASS: tests/setthreadtitle_test.py::test_set_threads_title

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...0001-conftest.py-Make-embed-avaiable.patch | 45 +++++++++++++++++++
 .../python/python3-setproctitle/run-ptest     |  4 ++
 .../python/python3-setproctitle_1.3.3.bb      | 34 ++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch b/meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch
new file mode 100644
index 000000000..5de07de03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch
@@ -0,0 +1,45 @@
+From ce7430f6252ce69af0699dc376662b5b1dc00b96 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 27 Sep 2024 10:56:32 +0000
+Subject: [PATCH] conftest.py: Make --embed avaiable
+
+Though --embed exists in the help message as below.
+ $ /usr/bin/python3.10-config --help
+ Usage: /usr/bin/python3.10-config [--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--help|--abiflags|--configdir|--embed
+
+ # https://github.com/dvarrazzo/py-setproctitle/issues/142
+ But has_embed which indicates if the help includes "--embed"
+ provides a wrong check as beow.
+ >>> import subprocess
+ >>> subprocess.check_output(["/usr/bin/python3.10-config", "--help"])
+Usage: /usr/bin/python3.10-config [--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--help|--abiflags|--configdir|--embed]
+ b''
+ >>> help = subprocess.check_output(["/usr/bin/python3.10-config", "--help"])
+ >>> has_embed = b"--embed" in help
+
+So make sure --embed avaiable to fix the gap.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/conftest.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tests/conftest.py b/tests/conftest.py
+index 6e15988..b01e2bd 100644
+--- a/tests/conftest.py
++++ b/tests/conftest.py
+@@ -84,8 +84,7 @@ def pyconfig():
+ 
+     def pyconfig_func(opt):
+         cmdline = [pyconfexe, f"--{opt}"]
+-        if has_embed:
+-            cmdline.append("--embed")
++        cmdline.append("--embed")
+         bout = sp.check_output(cmdline)
+         out = bout.decode(
+             sys.getfilesystemencoding()  # sounds like a good bet
+-- 
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
new file mode 100644
index 000000000..8bedb66d4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+# https://github.com/dvarrazzo/py-setproctitle/issues/141
+pytest -k 'not test_unicode' -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
new file mode 100644
index 000000000..01e9d21cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
@@ -0,0 +1,34 @@
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
+    file://0001-conftest.py-Make-embed-avaiable.patch \
+    file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    packagegroup-core-buildessential \
+    procps-ps \
+    python3-dev \
+    python3-multiprocessing \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
+
+INSANE_SKIP:${PN}-ptest = "dev-deps"
-- 
2.34.1


