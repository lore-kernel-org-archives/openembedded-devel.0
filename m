Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 90FE575D4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:03 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yy13so23099707pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=gHPnkcjmhHlqbX3O4ryZOzb5IvIELIGk/5EZOKeqPkE=;
	b=xEJxEuS3aP0obQ/cVojFl7kZHK+eKcPazfEqm9slWVGjsFRrQeNAI1x5hhebHIKKh9
	HGpuqNZBsfHtCQDzkGlNH+vz9lgnfnTdfan5QjvpeFsknpnRo8aPOR5u3LphT55j1tR2
	/Z+0XduPpnQpvl6Sqv1L44iBjj8EyWiwfJg989rX4a5tg8LodN30A7ncCqBsS8ffcyOw
	AIl0JM5Kx3IswlHn7EqPVcr510V+JgrC+R33hLz4bxEMZUPVpccWt3xLpPkOnyGn3ZIV
	QhtNTEcmbUEHhQpeKwq0OLJVzWXkplVNdyOvivJZ1LL4Z/AVz3rLwazBhoZi+/ze9d5f
	bp/w==
X-Received: by 10.66.101.36 with SMTP id fd4mr172665710pab.76.1452387604358;
	Sat, 09 Jan 2016 17:00:04 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	x18sm13764345pfa.65.2016.01.09.16.59.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id E8983FCC843; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:34 -0800
Message-Id: <95e274a63d02e03dd9156c7d9d60ffb14b381e0d.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 11/22] opencv: support machines based on oe-core tune-corei7.inc
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:04 -0000

From: Andre McCurdy <armccurdy@gmail.com>

oe-core tune-corei7.inc enables -msse4.2 (rather than -msse3, which is
only enabled by tune-core2.inc). Add test for -msse4.2 to ensure that
SSE is enabled for machines based on tune-corei7.inc (also add a test
for -msse4.1 for completeness).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


