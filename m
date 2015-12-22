Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6853B70016
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 00:36:53 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id e126so171588346ioa.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8t1jio8yRNJuYTZtk2w9+ODBh3aqhuUWTvkzlzJ32Dg=;
	b=L2y9H2JMGfol4VLTojyoGwyyEHSBI12kTXoepo1SDLxegzZEWNSDKGH/5SqmpwKgiR
	AorqqRKAEVPzpmiVYKEB7l2SOHuN9s++r77bZR+wvdpFZYT6T3+I/w6X9vEraVlZI7jT
	qaz3hHIvNHj5CPh9KfEaXUeiPbGJfcjSpSpvU8DWpqVhJEoImCn4lbcmocKaHHoq48re
	z1Brhia2C13BXPw5w7xMmU4lWj73El/XvMJU13xmrXz7rlLZ1qpVoad93yufGXiAQRKP
	B+HT0Gbyqt4q0CQsRU2JTi+evGhQE6Mcs3/OmMnQyH0T8BKxUwGZYzXZh6ScKqFK5LRm
	YFLw==
X-Received: by 10.107.135.217 with SMTP id r86mr22297343ioi.164.1450744614033; 
	Mon, 21 Dec 2015 16:36:54 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id d9sm9184283igx.5.2015.12.21.16.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Dec 2015 16:36:52 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Dec 2015 16:36:35 -0800
Message-Id: <1450744595-8679-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450744595-8679-1-git-send-email-armccurdy@gmail.com>
References: <1450744595-8679-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 3/3] opencv: support machines based on oe-core tune-corei7.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Dec 2015 00:36:53 -0000

oe-core tune-corei7.inc enables -msse4.2 (rather than -msse3, which is
only enabled by tune-core2.inc). Add test for -msse4.2 to ensure that
SSE is enabled for machines based on tune-corei7.inc (also add a test
for -msse4.1 for completeness).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 2 ++
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 508655e..a74853c 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -28,6 +28,8 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
                  -DWITH_1394=OFF \
                  -DCMAKE_SKIP_RPATH=ON \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index 8ffe1cf..1948a16 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -27,6 +27,8 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
                  -DWITH_1394=OFF \
                  -DCMAKE_SKIP_RPATH=ON \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
-- 
1.9.1


