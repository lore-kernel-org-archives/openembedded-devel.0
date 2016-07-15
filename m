Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 44FBA6E660
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:38:09 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u6FEc57E031764
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:38:05 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.104])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u6FEc549030364;
	Fri, 15 Jul 2016 16:38:05 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 16:37:44 +0200
Message-Id: <1468593464-17303-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCHv2] poco: update to 1.7.3
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
X-List-Received-Date: Fri, 15 Jul 2016 14:38:10 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.7.1.bb => poco_1.7.3.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.7.1.bb => poco_1.7.3.bb} (94%)

diff --git a/meta-oe/recipes-support/poco/poco_1.7.1.bb b/meta-oe/recipes-support/poco/poco_1.7.3.bb
similarity index 94%
rename from meta-oe/recipes-support/poco/poco_1.7.1.bb
rename to meta-oe/recipes-support/poco/poco_1.7.3.bb
index 135d2aa..32f56d4 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.3.bb
@@ -12,15 +12,13 @@ inherit cmake ptest
 
 BBCLASSEXTEND = "native"
 
+SRCREV = "abc4742ebe6718530a2503fcc3f2554a6296ef5a"
 SRC_URI = " \
-    https://github.com/pocoproject/poco/archive/poco-${PV}-release.tar.gz \
+    git://github.com/pocoproject/poco.git \
     file://run-ptest \
    "
 
-SRC_URI[md5sum] = "a4b755d47303b20a0e2586f281d05a36"
-SRC_URI[sha256sum] = "6dbbc2018912ad9af6af96f605933ed91354a1e7423e5dbd04d8e9a2b2d15c05"
-
-S = "${WORKDIR}/poco-poco-${PV}-release"
+S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPOCO_UNBUNDLED=ON \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
-- 
2.1.4


