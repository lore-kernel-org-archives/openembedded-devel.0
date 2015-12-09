Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52A496072C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 07:15:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB97F2dC013656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Dec 2015 23:15:03 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 8 Dec 2015 23:15:02 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Dec 2015 15:15:08 +0800
Message-ID: <1449645308-25141-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java] [PATCH] antlr/cup: inherit java-bootstrap-components
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
X-List-Received-Date: Wed, 09 Dec 2015 07:15:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This should be part of the following commit but missed:
commit 04d5d0bf414c05ca59618d77f17ff9898aa1c566
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Tue Dec 8 14:51:50 2015 +0100

    meta-java: rely on well known bootstrap-path

    Instead of potential circular depending virtual/javac-native (even this
    recipe provides such a useable java-native), rely on well known path
    via cacao-native to build up to icedtea7-native in reliable manner.

    virtual/javac-native should be used by parts not belonging to the bootstrap
    phase.

    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Maxin B. John <maxin.john@intel.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/antlr/antlr_2.7.7.bb | 2 +-
 recipes-core/cup/cup_0.10k.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/antlr/antlr_2.7.7.bb b/recipes-core/antlr/antlr_2.7.7.bb
index 9d9d2d4..cff9535 100644
--- a/recipes-core/antlr/antlr_2.7.7.bb
+++ b/recipes-core/antlr/antlr_2.7.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=361934e706423915b4d9f413ad37fb65"
 SRC_URI = "http://www.antlr2.org/download/${BP}.tar.gz"
 SRC_URI_append_class-native = " file://runantlr"
 
-inherit java-library
+inherit java-library java-bootstrap-components
 
 do_configure_class-native() {
     sed -i -e"s|@JAR_FILE@|${STAGING_DATADIR_JAVA_NATIVE}/antlr.jar|" ${WORKDIR}/runantlr
diff --git a/recipes-core/cup/cup_0.10k.bb b/recipes-core/cup/cup_0.10k.bb
index 2a957f9..f2f254e 100644
--- a/recipes-core/cup/cup_0.10k.bb
+++ b/recipes-core/cup/cup_0.10k.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=2c9db91c00f38e52cfc8e67bafaa7c
 RDEPENDS_${PN} = "java2-runtime"
 RDEPENDS_${PN}_virtclass-native = ""
 
-inherit java-library
+inherit java-library java-bootstrap-components
 
 SRC_URI = "http://www.cs.princeton.edu/~appel/modern/java/CUP/java_${BPN}_v10k.tar.gz \
 	   file://cup \
-- 
2.3.5


