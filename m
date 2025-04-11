Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65592C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:55:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20252.1744358124978869231
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 00:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6196f9f2c6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6eTXl002732
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 07:55:24 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8r06j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 07:55:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 11 Apr 2025 00:55:22 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 11 Apr 2025 00:55:22 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-pyzmq: Upgrade 25.1.2 -> 26.3.0
Date: Fri, 11 Apr 2025 15:55:21 +0800
Message-ID: <20250411075521.1957056-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tRb1E1LG9j9L20u7v2t_qv0W-v_7H_b6
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f8caeb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=1lW08O06AAAA:8 a=t7CeM3EgAAAA:8 a=k-42gJp3AAAA:8 a=yW6Q_lniKyZ9exFFkeUA:9
 a=br5T-ReF7M96G-ahcXgn:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: tRb1E1LG9j9L20u7v2t_qv0W-v_7H_b6
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504110049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 07:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116797

From: Mingli Yu <mingli.yu@windriver.com>

* LICENSE update:
  pyzmq no longer ships an LGPL core, it is BSD-only [1].

  The LICENSE.BSD is renamed to LICENSE.md [2].

* The new version switches to scikit-build-core backend and build
  with cmake.

[1] https://github.com/zeromq/pyzmq/commit/2f461c578b0cf188652e3ada843094cb5d24a02a
[2] https://github.com/zeromq/pyzmq/commit/1f4bc04f433b34f95dd703d6fe018042a65e2903

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-pyzmq/club-rpath-out.patch | 29 ------------
 ...yzmq_25.1.2.bb => python3-pyzmq_26.3.0.bb} | 44 ++++++++++---------
 2 files changed, 23 insertions(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch
 rename meta-python/recipes-devtools/python/{python3-pyzmq_25.1.2.bb => python3-pyzmq_26.3.0.bb} (42%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch
deleted file mode 100644
index 61aeaca5fa..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From efae4e08d13e0958d929ea524e21c0a210b31982 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Fri, 22 Jan 2021 11:41:12 +0200
-Subject: [PATCH] setup.py: Adjust _add_rpath
-
-Fix error: unrecognized command-line option '-R'
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-
----
- setup.py | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index b634d94..7f6a2f1 100755
---- a/setup.py
-+++ b/setup.py
-@@ -235,9 +235,6 @@ def _add_rpath(settings, path):
-     """
-     if sys.platform == 'darwin':
-         settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
--    else:
--        settings['runtime_library_dirs'].append(path)
--
- 
- def settings_from_prefix(prefix=None):
-     """load appropriate library/include settings from ZMQ prefix"""
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
similarity index 42%
rename from meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
index 39b754dd5d..c7225aa259 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_26.3.0.bb
@@ -1,19 +1,35 @@
 SUMMARY = "PyZMQ: Python bindings for ZMQ"
 DESCRIPTION = "This package contains Python bindings for ZeroMQ. ZMQ is a lightweight and fast messaging implementation."
 HOMEPAGE = "https://zeromq.org/bindings:python"
-LICENSE = "BSD-3-Clause & LGPL-3.0-only"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "\
-    file://LICENSE.BSD;md5=1787206f198344195a671b60326c59dc \
-    file://LICENSE.LESSER;md5=0e99bfbdd8b9d33b0221986fe3be89ed \
+    file://LICENSE.md;md5=1787206f198344195a671b60326c59dc \
 "
 
-DEPENDS = "python3-packaging-native python3-setuptools-scm-native zeromq"
+DEPENDS = "python3-packaging-native \
+           python3-setuptools-scm-native \
+           python3-scikit-build-core-native \
+           cmake-native \
+           ninja-native \
+           zeromq \
+"
+
+PEP517_BUILD_OPTS = "--skip-dependency-check \
+                     -Ccmake.define.PYZMQ_LIBZMQ_RPATH=OFF \
+                     -Ccmake.define.PYZMQ_NO_BUNDLE=ON \
+                     -Ccmake.define.CMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ONLY \
+                     -Ccmake.define.CMAKE_FIND_ROOT_PATH_MODE_PROGRAM=ONLY \
+                     -Ccmake.define.CMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
+                     -Ccmake.define.CMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
+                     -Ccmake.define.CMAKE_FIND_ROOT_PATH="${STAGING_DIR_NATIVE}" \
+                     -Ccmake.build-type="RelWithDebInfo" \
+"
 
 SRC_URI:append = " \
-    file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0efd26056bf7eda0226"
+
+SRC_URI[sha256sum] = "f1cd68b8236faab78138a8fc703f7ca0ad431b17a3fcac696358600d4e6243b3"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 
@@ -38,21 +54,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-unixadmin \
 "
 
-do_compile:prepend() {
-    echo [global] > ${S}/setup.cfg
-    echo zmq_prefix = ${STAGING_DIR_HOST} >> ${S}/setup.cfg
-    echo have_sys_un_h = True >> ${S}/setup.cfg
-    echo skip_check_zmq = True >> ${S}/setup.cfg
-    echo libzmq_extension = False >> ${S}/setup.cfg
-    echo no_libzmq_extension = True >> ${S}/setup.cfg
-}
-
-do_install:append() {
-        sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${PYTHON_SITEPACKAGES_DIR}/zmq/utils/config.json
-        sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${PYTHON_SITEPACKAGES_DIR}/zmq/utils/compiler.json
-}
-
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/zmq/tests/* ${D}${PTEST_PATH}/tests/
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.34.1


