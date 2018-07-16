Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3EF75125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 05:36:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6G5a39n002554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2018 22:36:03 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 15 Jul 2018 22:36:02 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jul 2018 22:36:02 -0700
Message-ID: <20180716053602.14820-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] bonnie++: Upgrade to 1.04
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
X-List-Received-Date: Mon, 16 Jul 2018 05:36:03 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../bonnie/{bonnie++_1.03e.bb => bonnie++_1.04.bb}         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-benchmark/bonnie/{bonnie++_1.03e.bb => bonnie++_1.04.bb} (73%)

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
similarity index 73%
rename from meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
rename to meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
index 2c1217e34..d7583f076 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.04.bb
@@ -4,11 +4,10 @@ SECTION = "benchmark/tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
 
-SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
-           file://gcc-4.3-fixes.patch \
+SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}_${PV}.tgz \
 "
-SRC_URI[md5sum] = "750aa5b5051263a99c6c195888c74968"
-SRC_URI[sha256sum] = "cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb"
+SRC_URI[md5sum] = "1414aab86e2db1b4691bd4be82031012"
+SRC_URI[sha256sum] = "507bd2ce5360c7c98b91b0fdc2bed5c9320b5c9699f7d4a3d1c86b256896c15e"
 
 inherit autotools-brokensep
 
-- 
2.17.1


