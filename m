Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7411CC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 07:28:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46411.1695022083010507088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 00:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JWBTqK9c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7625354a6b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38I5fNMa009538
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 07:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=S2fkz
	/eEpzEx0KZmd66zYpERoEuN0T0yTDDvnFTwoBw=; b=JWBTqK9cw2oSD6NiygqPo
	c2apgQMOO7Y/r+xlYG+Poj021EnIkfPkswrp53LmCikFbKbEVQLpSeIw2Umiiq5e
	MQCMJzughYYMXtrFrr+NCxBn7+PeKOdCpaLii7f9QY4n5BKmo8hdYTFIgsOAjMp7
	v0knxA2Mv9RtuZE4gmrvOJNP9wV7raFpxWnOyPYQCqGyEfhzxAjEhFh4KOp2wGAp
	NBIFHVrR1/vyn8LMPBonNhO+Vzz3P/lcoWm1VLKPSbRIHvwXFszaX3F3wApqfbL/
	J0cLMr4mPfTPxjqpgkkwMMtWReNigysBQwc/e4OY8b0Sx32VE2Dtjq2CLEbxS4Rr
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t51jx992x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 07:28:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 18 Sep 2023 00:28:00 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 00:27:59 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minifi-cpp: Remove the buildpath issue
Date: Mon, 18 Sep 2023 15:27:59 +0800
Message-ID: <20230918072759.106442-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ucyAzVOeQoau7L_dO39tSEo8fVNoWjfa
X-Proofpoint-ORIG-GUID: ucyAzVOeQoau7L_dO39tSEo8fVNoWjfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309180064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 07:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104923

From: Mingli Yu <mingli.yu@windriver.com>

Don't override CFLAGS and just append the "-fPIC" to CFLAGS to make
sure -fdebug-prefix-map option passed to compiler to fix the below
issue:
  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/minificontroller in package minifi-cpp-dbg contains reference to TMPDIR
  File /usr/bin/.debug/minifi in package minifi-cpp-dbg contains reference to TMPDIR [buildpaths]

Pass the OPENSSLDIR to avoid introducing the build path to fix the
below issue:
  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/minificontroller in package minifi-cpp contains reference to TMPDIR
  File /usr/bin/minifi in package minifi-cpp contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...SPUUID.cmake-Pass-CFLAGS-to-compiler.patch | 33 +++++++++++++++++++
 ...1-CMakeLists.txt-Pass-the-OPENSSLDIR.patch | 31 +++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  5 +++
 3 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
new file mode 100644
index 000000000..a0265eaa3
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
@@ -0,0 +1,33 @@
+From ab031c2b1f8c03e23a8dc8a95c9c9e9b8ce397b2 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 15 Sep 2023 11:32:11 +0800
+Subject: [PATCH] BundledOSSPUUID.cmake: Pass CFLAGS to compiler
+
+Make sure -fdebug-prefix-map options are passed to compiler to fix the
+below warning:
+  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/.debug/minificontroller in package minifi-cpp-dbg contains reference to TMPDIR
+File /usr/bin/.debug/minifi in package minifi-cpp-dbg contains reference to TMPDIR [buildpaths]
+
+Upsteam-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ cmake/BundledOSSPUUID.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
+index 0cf4bac0..ec57ef51 100644
+--- a/cmake/BundledOSSPUUID.cmake
++++ b/cmake/BundledOSSPUUID.cmake
+@@ -37,7 +37,7 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
+     ENDFOREACH(BYPRODUCT)
+ 
+     # Build project
+-    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure CFLAGS=-fPIC CXXFLAGS=-fPIC --host=${HOST_SYS}
++    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure CXXFLAGS=-fPIC --host=${HOST_SYS}
+         --with-cxx --without-perl --without-php --without-pgsql
+         --prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install)
+     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch
new file mode 100644
index 000000000..158fed559
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch
@@ -0,0 +1,31 @@
+From 0c5735a0a02e15c3eae94d25fb8756285d121ddb Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 15 Sep 2023 10:59:05 +0800
+Subject: [PATCH] CMakeLists.txt: Pass the OPENSSLDIR
+
+Fixes:
+  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/minificontroller in package minifi-cpp contains reference to TMPDIR
+  File /usr/bin/minifi in package minifi-cpp contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 215a4ef4..6fe8101f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -75,6 +75,7 @@ set(PASSTHROUGH_CMAKE_ARGS -DANDROID_ABI=${ANDROID_ABI}
+                            -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=${CMAKE_FIND_ROOT_PATH_MODE_LIBRARY}
+                            -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=${CMAKE_FIND_ROOT_PATH_MODE_INCLUDE}
+                            -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
++                           -DOPENSSLDIR=${OPENSSLDIR}
+ 						   ${OPENSSL_PASSTHROUGH}
+                            -G${CMAKE_GENERATOR})
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 0986fdec0..b75a33695 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -35,6 +35,8 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;branch=master;protocol=ht
             file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
             file://0001-Fix-the-constness-issues-around-autovector-iterator_.patch \
             file://0002-Fix-build-with-clang-17.patch \
+            file://0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch \
+            file://0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
@@ -65,7 +67,10 @@ EXTRA_OECMAKE += " \
     -DDISABLE_PYTHON_SCRIPTING=ON \
     -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
     -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines --file-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+    -DOPENSSLDIR=${sysconfdir}/libressl \
     "
+
+CFLAGS:append = " -fPIC"
 EXTRA_OECMAKE:append:toolchain-clang = " -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
 LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
 
-- 
2.25.1


