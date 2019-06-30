Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id D58837E6E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:19:41 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 62BE22204FB;
	Mon,  1 Jul 2019 09:19:41 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 09:19:17 +1200
Message-Id: <20190630211917.16433-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190630211917.16433-1-douglas.royds@taitradio.com>
References: <20190624062213.334-1-douglas.royds@taitradio.com>
	<20190630211917.16433-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH 2/2] packagegroup-meta-oe: RDEPENDS on googletest
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
X-List-Received-Date: Sun, 30 Jun 2019 21:19:42 -0000

The gtest and gmock projects were combined under googletest in 2015,
and the former gtest recipe has now been renamed to googletest.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e34cce4eb..9a6c1dec5 100644
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


