Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173BED1A44A
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 07:53:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6392.1728719631451152190
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 00:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0015263500=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C70ROn007804
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 07:53:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427eb1g7ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 07:53:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 12 Oct 2024 00:53:49 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 12 Oct 2024 00:53:48 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] libtoml11: Add new recipe
Date: Sat, 12 Oct 2024 15:53:46 +0800
Message-ID: <20241012075347.1549781-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0ZfCdwIHtOu8u40MLsXcc-uSWU56-B6h
X-Authority-Analysis: v=2.4 cv=ce6ArWDM c=1 sm=1 tr=0 ts=670a2b0e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=04dWyBGaVZGExWfY-bUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0ZfCdwIHtOu8u40MLsXcc-uSWU56-B6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-12_04,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410120054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 07:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112822

From: Mingli Yu <mingli.yu@windriver.com>

toml11 is a feature-rich TOML language library for C++11/14/17/20 [1].

 # ./run-ptest
PASS: test_comments
PASS: test_datetime
PASS: test_error_message
PASS: test_find
PASS: test_find_or
PASS: test_format_floating
PASS: test_format_integer
PASS: test_format_table
PASS: test_get
PASS: test_get_or
PASS: test_literal
PASS: test_location
PASS: test_parse_array
PASS: test_parse_boolean
PASS: test_parse_datetime
[snip]

[1] https://github.com/ToruNiina/toml11

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...issing-zero-initialization-to-region.patch | 34 ++++++++++++++++
 .../libtoml11/files/run-ptest                 | 12 ++++++
 .../libtoml11/libtoml11_4.2.0.bb              | 39 +++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
 create mode 100755 meta-oe/recipes-devtools/libtoml11/files/run-ptest
 create mode 100644 meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb

diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch b/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
new file mode 100644
index 000000000..b779d493a
--- /dev/null
+++ b/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-initialization-to-region.patch
@@ -0,0 +1,34 @@
+From 9c7cef94a551cfdbbe2cce262c29221e22643d84 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ale=C5=A1=20Mat=C4=9Bj?= <amatej@redhat.com>
+Date: Mon, 19 Aug 2024 06:35:03 +0200
+Subject: [PATCH] fix: add missing zero initialization to region
+
+Fixes below error:
+
+/build/tmp-glibc/work/core2-64-wrs-linux/libtoml11/1_4.2.0-r0/git/include/toml11/fwd/../fwd/../fwd/region_fwd.hpp:49:5: error: '<unnamed>.toml::detail::region::first_' is used uninitialized [-Werror=uninitialized]
+   49 |     region(region&&)      = default;
+      |     ^~~~~~
+
+Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/9c7cef94a551cfdbbe2cce262c29221e22643d84]
+
+---
+ include/toml11/fwd/region_fwd.hpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/toml11/fwd/region_fwd.hpp b/include/toml11/fwd/region_fwd.hpp
+index b40317d..26f1a9b 100644
+--- a/include/toml11/fwd/region_fwd.hpp
++++ b/include/toml11/fwd/region_fwd.hpp
+@@ -34,7 +34,8 @@ class region
+     // a value that is constructed manually does not have input stream info
+     region()
+         : source_(nullptr), source_name_(""), length_(0),
+-          first_line_(0), first_column_(0), last_line_(0), last_column_(0)
++          first_(0), first_line_(0), first_column_(0), last_(0), last_line_(0),
++          last_column_(0)
+     {}
+ 
+     // a value defined in [first, last).
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/libtoml11/files/run-ptest b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
new file mode 100755
index 000000000..9bc480aa7
--- /dev/null
+++ b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+for atest in test_* ; do
+    rm -rf tests.log
+    ./${atest} > tests.log 2>&1
+    if [ $? = 0 ] ; then
+        echo "PASS: ${atest}"
+    else
+        echo "FAIL: ${atest}"
+    fi
+done
diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
new file mode 100644
index 000000000..758e258a5
--- /dev/null
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "TOML for Modern C++"
+DESCRIPTION = "toml11 is a feature-rich TOML language library for \
+               C++11/14/17/20."
+
+HOMEPAGE = "https://github.com/ToruNiina/toml11"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
+
+PE = "1"
+
+SRCREV = "cc0bee4fd46ea1f5db147d63ea545208cc9e8405"
+SRCREV_json = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
+SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
+
+SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
+           git://github.com/nlohmann/json;destsuffix=git/tests/extlib/json;name=json;branch=develop;protocol=https \
+           git://github.com/doctest/doctest;destsuffix=git/tests/extlib/doctest;name=doctest;branch=master;protocol=https \
+           file://0001-fix-add-missing-zero-initialization-to-region.patch \
+           file://run-ptest \
+"
+SRCREV_FORMAT = "json_doctest"
+
+S = "${WORKDIR}/git"
+
+inherit cmake ptest
+
+EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
+                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
+"
+
+ALLOW_EMPTY:${PN} = "1"
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
+}
-- 
2.34.1


