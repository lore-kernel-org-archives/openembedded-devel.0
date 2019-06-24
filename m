Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 96A4A7E4F1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 06:30:43 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 24C1C1C0673;
	Mon, 24 Jun 2019 18:22:16 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2019 18:22:13 +1200
Message-Id: <20190624062213.334-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 2/2] googletest: The gtest and gmock projects were combined under googletest in 2015
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
X-List-Received-Date: Mon, 24 Jun 2019 06:30:54 -0000

PROVIDES gmock and gtest for backwards-compatibility with existing DEPENDS.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 .../{gtest/gtest_1.8.1.bb => googletest/googletest_1.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/{gtest/gtest_1.8.1.bb => googletest/googletest_1.8.1.bb} (95%)

diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.1.bb b/meta-oe/recipes-test/googletest/googletest_1.8.1.bb
similarity index 95%
rename from meta-oe/recipes-test/gtest/gtest_1.8.1.bb
rename to meta-oe/recipes-test/googletest/googletest_1.8.1.bb
index 6e7ab92e5..362d69ff9 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.8.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
                     file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
-PROVIDES += "gmock"
+PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
 SRCREV = "2fe3bd994b3189899d93f1d5a881e725e046fdc2"
-- 
2.17.1


