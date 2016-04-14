Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 4D24060088
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 10:29:39 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u3EATbL2001374
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 12:29:37 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.78.53])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u3EATbt3001708;
	Thu, 14 Apr 2016 12:29:37 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2016 12:29:28 +0200
Message-Id: <1460629768-2328-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] gtest, gmock: allow building gtest-native and gmock-native
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
X-List-Received-Date: Thu, 14 Apr 2016 10:29:40 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-test/gmock/gmock_1.7.0.bb | 2 +-
 meta-oe/recipes-test/gtest/gtest_1.7.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/gmock/gmock_1.7.0.bb b/meta-oe/recipes-test/gmock/gmock_1.7.0.bb
index bd5cf4e..a537f4c 100644
--- a/meta-oe/recipes-test/gmock/gmock_1.7.0.bb
+++ b/meta-oe/recipes-test/gmock/gmock_1.7.0.bb
@@ -20,4 +20,4 @@ ALLOW_EMPTY_${PN}-dbg = "1"
 
 RDEPENDS_${PN}-dev += "${PN}-staticdev"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-test/gtest/gtest_1.7.0.bb b/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
index 9f148d5..edeeab6 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
+++ b/meta-oe/recipes-test/gtest/gtest_1.7.0.bb
@@ -20,4 +20,4 @@ ALLOW_EMPTY_${PN}-dbg = "1"
 
 RDEPENDS_${PN}-dev += "${PN}-staticdev"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


