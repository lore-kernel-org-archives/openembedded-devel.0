Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3E476D494
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2019 09:25:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2E9PrSC002460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 02:25:54 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 14 Mar 2019 02:25:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 17:25:50 +0800
Message-ID: <1552555551-37865-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] opencv: fix installed-vs-shipped QA WARNING
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
X-List-Received-Date: Thu, 14 Mar 2019 09:25:54 -0000
Content-Type: text/plain

While baselib = 'lib64', there is a installed-vs-shipped QA WARNING
...
WARNING: QA Issue: opencv: Files/directories were installed but not shipped in any package:
  /usr/lib64/site-packages/cv2/load_config_py2.py
  /usr/lib64/site-packages/cv2/config.py
...

Drop unnecessary LIB_SUFFIX setting to fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/opencv/opencv_3.4.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
index d299c59..fa6e06a 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.5.bb
@@ -74,8 +74,6 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-    ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-    ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
-- 
2.7.4


