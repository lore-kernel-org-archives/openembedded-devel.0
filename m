Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D277B7D735
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 11:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yykV6Y7lz7K
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 13:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557230195;
	bh=aoTJKk4SWweBnGCvQ1fhirWi6GtLurR5wvxqmJ4MR8I=;
	h=From:To:Subject:Date:From;
	b=OX3BomJem0DvFDypOP7hqfR7B7G1d0dsvsXtD7zX/AQZLWMzYb21xm5ZdrGP424ng
	NbMOqRff7YoR8znQw/PXR1jGCFgElouIJN2d9vi4HuMOUuaB+HaUkhMGiVonIYKvPE
	XsCEHtYdUIq3Js31+uveFax72huNTdvjv8Psa3S0VwhtuLHcSzaBiE2LQthfy16kuS
	gIyLpwVnux5xEKYHA9d+OoDfefZf7EdKpvte7hpjlIL58Tjk6Mbc3akcyy71t54B1A
	uK1iI/tAHU5oTPQRX/lum8tk/MH7K/u1mTXe3MXlQSBgBerHBqRSOPDDyYbgTJZ5GO
	JvCFIk3d3fPv0YZFpdxO9pqJOV4JKcDuFLajCNvpqFb4Qtdm2bHBWjKNxZAvYKPBRE
	j25lLiMVaLEVFq8QzSWteIsjoaVUGhtOcEdp4k3D3SO0SWzcP7y+Efh/yOwx4Dp6Me
	jFvIKRCQsqNgUdowGMraQHTWbUSn6gid70ST1GbMLMr+atMImhW3EX+m6fnmG8/dcR
	LJnRAKi7j7DFrOlS24Z0yW/UxJhxZLUfvl/3G4eu3yuCA2vxltG+15cpFM6mSXgRjj
	ywhRpL2vK6g+0of7Qi0V5Hn2KXPe4lFTbKSWdR9Qhgseao7GHTIMwKASUVEaPsqK4t
	HKY4/BT/OYGczs2dDO6wAGKA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 14:56:28 +0300
Message-Id: <20190507115630.30368-10-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] cogl: remove -Werror=maybe-uninitialized workaround
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
X-List-Received-Date: Tue, 07 May 2019 11:56:34 -0000

This should now also be covered by the
   DEBUG_OPTIMIZATION_append = " -Wno-error=maybe-uninitialized"

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...lling.c-fix-may-be-used-uninitialize.patch | 35 -------------------
 meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb |  2 --
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch b/meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch
deleted file mode 100644
index 479a0ff4b5..0000000000
--- a/meta/recipes-graphics/cogl/cogl-1.0/test-backface-culling.c-fix-may-be-used-uninitialize.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a51f61d675a0e7d6649182c6a1325ceab8342df2 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 4 Jan 2016 22:47:29 -0800
-Subject: [PATCH] test-backface-culling.c: fix may be used uninitialized error
-
-Fixed when gcc -O:
-test-backface-culling.c:206:7: error: 'cull_front' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|        validate_part (framebuffer,
-|        ^
-| cc1: some warnings being treated as errors
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- tests/conform/test-backface-culling.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tests/conform/test-backface-culling.c b/tests/conform/test-backface-culling.c
-index e90c2f5..7c45592 100644
---- a/tests/conform/test-backface-culling.c
-+++ b/tests/conform/test-backface-culling.c
-@@ -164,7 +164,8 @@ validate_result (CoglFramebuffer *framebuffer, int y_offset)
- 
-   for (draw_num = 0; draw_num < 16; draw_num++)
-     {
--      CoglBool cull_front, cull_back;
-+      CoglBool cull_front = FALSE;
-+      CoglBool cull_back = FALSE;
-       CoglPipelineCullFaceMode cull_mode;
- 
-       if (USE_LEGACY_STATE (draw_num))
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
index 432025233b..8e61c19f5d 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.4.bb
@@ -1,7 +1,5 @@
 require cogl-1.0.inc
 
-SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
-"
 SRC_URI[archive.md5sum] = "31755015a865c4af51ac84f6e53af8ab"
 SRC_URI[archive.sha256sum] = "5217bf94cbca3df63268a3b79d017725382b9e592b891d1e7dc6212590ce0de0"
 
-- 
2.17.1


