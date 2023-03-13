Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B90C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 05:34:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13412.1678685644922393701
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Mar 2023 22:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=To/dUOqd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2436428b6b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32D5BS8x016625
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 05:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=MMPqLBajVS0h6AbyEdBg/A/Jp+UhWr5ryXwedIr22fw=;
 b=To/dUOqdPcfhtCCfR3MzqGgl2Kpskv3v+1RK7CHqMRDgTpGY5TDKOKhwJtdfNxLnzz5T
 s2GFZiLbgnK8NQnj/1Qqt9joogExjS4sIqnzu2F+82OqdgaF2JJtsiWRAFanq9DphwVG
 nhXJCl74ZHdDF74y4nkDlau/0P6EgcaK2YIuHjgd//NJ7Hu0djNgu2miu2EbjtvhODvs
 9pVsltUWup0Gazxcr8PAvM6zv8XvE34e+KzdYlo/i7BwBH3r1m0h2EkiVU7tntIre3mh
 Fd/kvYCRWGqm3GApLJ+y6Ew90mLU87InGH1A+JJ+jExkNNJwpOGbcNrzkmw+P4tygE41 iA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8gma1fhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 05:34:03 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sun, 12 Mar 2023 22:34:02 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 12 Mar 2023 22:34:02 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] syslog-ng: upgrade 3.38.1 -> 4.0.1
Date: Mon, 13 Mar 2023 13:34:01 +0800
Message-ID: <20230313053401.477835-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6x2vot4B6hg4ZbaUO1sgVNCbGvLiqzMJ
X-Proofpoint-ORIG-GUID: 6x2vot4B6hg4ZbaUO1sgVNCbGvLiqzMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 05:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101510

From: Changqing Li <changqing.li@windriver.com>

* upgrade 3.38.1 to 4.0.1
* fix buildpath warning

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-Fix-buildpaths-warning.patch   | 55 +++++++++++++++++++
 ...syslog-ng_3.38.1.bb => syslog-ng_4.0.1.bb} |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-Fix-buildpaths-warning.patch
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.38.1.bb => syslog-ng_4.0.1.bb} (97%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-Fix-buildpaths-warning.patch b/meta-oe/recipes-support/syslog-ng/files/0001-Fix-buildpaths-warning.patch
new file mode 100644
index 000000000..c7bb4a64d
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/0001-Fix-buildpaths-warning.patch
@@ -0,0 +1,55 @@
+From d85a7a3ae2bb9f5267b2af43784633ae8f011f21 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 13 Mar 2023 09:50:15 +0800
+Subject: [PATCH] Fix buildpaths warning
+
+Fix buildpath warning:
+WARNING: syslog-ng-4.0.1-r0 do_package_qa: QA Issue: File /usr/include/syslog-ng/syslog-ng-config-64.h in package syslog-ng-dev contains reference to TMPDIR [buildpaths]
+WARNING: syslog-ng-4.0.1-r0 do_package_qa: QA Issue: File /usr/bin/syslog-ng-update-virtualenv in package syslog-ng contains reference to TMPDIR
+File /usr/bin/pdbtool in package syslog-ng contains reference to TMPDIR [buildpaths]
+WARNING: syslog-ng-4.0.1-r0 do_package_qa: QA Issue: File /usr/lib/syslog-ng/libdbparser.so in package syslog-ng-libs contains reference to TMPDIR [buildpaths]
+
+* SYSLOG_NG_PATH_TOPSRC_DIR is /yocto/build/tmp/work/core2-64-poky-linux/syslog-ng/4.0.1-r0,
+  which is used to get xsd dir in build SYSLOG_NG_PATH_TOPSRC_DIR/doc/xsd, 
+  which is not suitable for target, set it to "/source" for fixing this buildpath warning
+
+* SYSTEM_PYTHON is /yocto/build/tmp/hosttools/python3, set to python3
+  for target.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac                           | 2 +-
+ scripts/syslog-ng-update-virtualenv.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 79a1502..1ad6508 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1930,7 +1930,7 @@ AC_DEFINE_UNQUOTED(PYTHON_SYSCONF_MODULE_DIR, "$python_sysconf_moduledir", [Pyth
+ AC_DEFINE_UNQUOTED(PATH_LOGGENPLUGINDIR, "$loggenplugindir", [loggenplugin installation directory])
+ AC_DEFINE_UNQUOTED(MODULE_PATH, "$module_path", [module search path])
+ AC_DEFINE_UNQUOTED(JAVA_MODULE_PATH, "$java_module_path", [java module search path])
+-AC_DEFINE_UNQUOTED(PATH_TOPSRC_DIR, "$abs_topsrcdir", [self-defined top_srcdir path])
++AC_DEFINE_UNQUOTED(PATH_TOPSRC_DIR, "/source", [self-defined top_srcdir path])
+ AC_DEFINE_UNQUOTED(PACKAGE_NAME, "$PACKAGE_NAME", [package name])
+ 
+ 
+diff --git a/scripts/syslog-ng-update-virtualenv.in b/scripts/syslog-ng-update-virtualenv.in
+index ed85baf..b1a9e34 100755
+--- a/scripts/syslog-ng-update-virtualenv.in
++++ b/scripts/syslog-ng-update-virtualenv.in
+@@ -62,7 +62,7 @@ done
+ set -e
+ 
+ REQUIREMENTS_FILE=${python_moduledir}/requirements.txt
+-SYSTEM_PYTHON=@PYTHON@
++SYSTEM_PYTHON=python3
+ VENV_PYTHON=${python_venvdir}/bin/python
+ 
+ if [ "$display_prompt" -ne 0 ]; then
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
similarity index 97%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
index 182a253d3..4521593ed 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.38.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
@@ -22,10 +22,11 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://volatiles.03_syslog-ng \
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
+           file://0001-Fix-buildpaths-warning.patch \
 "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7"
+SRC_URI[sha256sum] = "c16eafe447191c079f471846182876b7919d3d789af8c1f9fe55ab14521ceb2c"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-- 
2.25.1


