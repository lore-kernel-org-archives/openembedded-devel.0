Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D196C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 16:31:13 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.45382.1707928265913932724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 08:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41EGV4n7009311
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 10:31:05 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] opencv: Fix python3 package generation
Date: Wed, 14 Feb 2024 10:31:03 -0600
Message-Id: <1707928263-23194-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 16:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108743

From: Mark Hatle <mark.hatle@amd.com>

Resolves an issue where python3 package generation was failing to configure.

-- Cannot probe for Python/Numpy support (because we are cross-compiling OpenCV)
-- If you want to enable Python/Numpy support, set the following variables:
--   PYTHON2_INCLUDE_PATH
--   PYTHON2_LIBRARIES (optional on Unix-like systems)
--   PYTHON2_NUMPY_INCLUDE_DIRS
--   PYTHON3_INCLUDE_PATH
--   PYTHON3_LIBRARIES (optional on Unix-like systems)
--   PYTHON3_NUMPY_INCLUDE_DIRS

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta-oe/recipes-support/opencv/opencv_4.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
index 7c9624119..cf836d3ec 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
@@ -113,7 +113,7 @@ PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtu
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
+PACKAGECONFIG[python3] = "-DPYTHON3_INCLUDE_PATH=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
 PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"
-- 
2.34.1


