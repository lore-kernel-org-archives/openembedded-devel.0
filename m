Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6FFC02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 14:55:40 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.53238.1737989736206140207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 06:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jyZdE4Xo;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50REtYx01806120
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 08:55:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737989734;
	bh=siSIAFsWF4XenN4PtGrM9mwr4bJGBFGKdzbxDNHJX+c=;
	h=From:To:Subject:Date;
	b=jyZdE4XokIaz6luDXx0K7WzIBpngwzQ7H7Yqb5du/dUMHKRGXUPHiwHPQlvRCelpF
	 2ZnWtBnFs6QKXcm2td5EpATwkcTqEJ1Y8ivVhbYZ/TLsuYjsCVpqmjkqskWkLkidxQ
	 aDa24nx5JEA1xarW9BcLcCWUaR3ZJLx69LWbxFbE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50REtYEI008530
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2025 08:55:34 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 08:55:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 08:55:33 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50REtXZk094492;
	Mon, 27 Jan 2025 08:55:33 -0600
From: <a-christidis@ti.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [master][PATCH] opencl-cts: add recipe
Date: Mon, 27 Jan 2025 08:55:33 -0600
Message-ID: <20250127145533.1510728-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115109

From: Antonios Christidis <a-christidis@ti.com>

This recipe provides the opecl-cts suite.  This is a pre-release version
v2024-08-08, which I have tested to work with opencl-headers version v2024.05.08
. The pre-release version was picked due to incompatibility issues with other
versions of headers.

The recipe also includes a patch, to allow it to compile and build properly.
Further information below.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../files/0001-Ignore-Compiler-Warnings.patch | 37 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 26 +++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb

diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
new file mode 100644
index 000000000..2515c7f16
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -0,0 +1,37 @@
+From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Fri, 17 Jan 2025 15:05:39 -0600
+Subject: [PATCH] Ignore Compiler Warnings
+
+
+Within the cmake build system, the compiler -Werror flag is enabeled.  This
+turns all warnings into errors and doens't allow the system to compile
+correctly.  Change the system to ignore the 3 warning rules that show up when
+compiling.
+
+Upstream-Status: Inappropriate [oe specific - compilation errors due to cross-compiling]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5cfef6b3..71b6ddb4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
+     add_cxx_flag_if_supported(-Wno-error=cpp) # Allow #warning directive
+     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
+     add_cxx_flag_if_supported(-Wno-error=asm-operand-widths) # Issue #784
+-
++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
+     # -msse -mfpmath=sse to force gcc to use sse for float math,
+     # avoiding excess precision problems that cause tests like int2float
+     # to falsely fail. -ffloat-store also works, but WG suggested
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
new file mode 100644
index 000000000..f6f4e9466
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
@@ -0,0 +1,26 @@
+SUMMARY = "OpenCL CTS"
+DESCRIPTION = "OpenCL CTS test suite"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pkgconfig cmake
+
+DEPENDS += "opencl-headers opencl-icd-loader"
+RDEPENDS:${PN} += "python3-core python3-io"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+	   file://0001-Ignore-Compiler-Warnings.patch"
+
+SRCREV = "a406b340913f622da089b00f284a597656c10239"
+
+EXTRA_OECMAKE:append = " -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
+
+do_install() {
+        install -d ${D}${bindir}/opencl_test_conformance
+        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
+        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
+	 find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
+        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
+}
-- 
2.34.1


