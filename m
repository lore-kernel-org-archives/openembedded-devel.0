Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEB77E95C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 12:49:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45cnJQ3wS5z5c
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 14:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561985382;
	bh=dX42TBN5lX8qTl10m+ZQgMO/MhyYPfb4sQfHQsreL0E=;
	h=From:To:Subject:Date:From;
	b=Z8FB/HDr6p/Q6AsEoCANG10ibMW0F+HTUvN9eUhwrZc7tQcB2+ep5F0AwviliuEJv
	5AgWLFZ6Ebe/9zq+ULBXzzL2E/lmEtt5wABlcFRUVrjAeae6v4MVRxCV0sR4WNcyVK
	LbVuieqf7wd4baqKHa0KJIaw9faGZAErS7JFRjwuNSRL50MxgRnFSDFAXWp2adVCXi
	jCGDOFSwNVrKA6ADkHfIOYhjyoUtjWKWKosHJQj5zlaywBPTmPI+rvOrAoCBlN3CQN
	HH0yqxNDoiedBYp8wo0y/IgWmRptjdHfw8srYXLhRara7tcrYXrtHKWKqiisMrlEIm
	mI5wZ4o/wGHx4ZFQgua2C7V8KnUHT2lt3OaCnL8hjsHjrdhYTRBz6CP+zAlly/kzVl
	ZuesGJ4ETno9oI10kL6BzvszRHiR6USaoElq810HY9o1O9POlOadJRlWugNYQOZFc2
	NTsJwPMEajOvMfMGM8U7OSiYV7T7XQDAxb4YeLa/azarsv7+jnYo4Vmstk6yCixux3
	aPasDykbkx3a0EflUNbveLrQCGKu0IOGBHgrjvK/E3lX87Qj2d1hn/pd6+gkIUBnHd
	CzFX7oN9rW2N0aPJX8xf9pGjEN3rg0HJ7mOCJP2hKL2oA6BFuYCG2n68IVNswhztpB
	bAc2TFvoqyHVM4BvojAebIwI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 15:49:41 +0300
Message-Id: <20190701124941.22365-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] packagegroup-meta-oe-test: Follow gtest -> googletest rename
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
X-List-Received-Date: Mon, 01 Jul 2019 12:49:42 -0000

gtest has been renamed to googletest.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e7246b2c5..619c217b7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -265,7 +265,7 @@ RDEPENDS_packagegroup-meta-oe-support-egl ="\
 
 RDEPENDS_packagegroup-meta-oe-test ="\
     catch2 cppunit cunit cxxtest evtest fb-test \
-    fwts gtest pm-qa stress-ng testfloat \
+    fwts googletest pm-qa stress-ng testfloat \
     "
 RDEPENDS_packagegroup-meta-oe-test_remove_libc-musl = "pm-qa"
 RDEPENDS_packagegroup-meta-oe-test_remove_arm = "fwts"
-- 
2.17.1


