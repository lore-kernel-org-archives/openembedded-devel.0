Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 545 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Jun 2019 06:30:43 UTC
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 95B446C0C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 06:30:43 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 2077D1C0329;
	Mon, 24 Jun 2019 18:21:38 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2019 18:21:36 +1200
Message-Id: <20190624062136.32715-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] gtest: Googletest project is back under github.com/google/googletest
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

No longer under the Abseil project.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-oe/recipes-test/gtest/gtest_1.8.1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.1.bb b/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
index 23862c930..6e7ab92e5 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
+++ b/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Google's framework for writing C++ tests"
-HOMEPAGE = "https://github.com/abseil/googletest"
+HOMEPAGE = "https://github.com/google/googletest"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
@@ -9,9 +9,7 @@ PROVIDES += "gmock"
 
 S = "${WORKDIR}/git"
 SRCREV = "2fe3bd994b3189899d93f1d5a881e725e046fdc2"
-SRC_URI = "\
-    git://github.com/abseil/googletest.git;protocol=https; \
-"
+SRC_URI = "git://github.com/google/googletest.git"
 
 inherit cmake
 
-- 
2.17.1


