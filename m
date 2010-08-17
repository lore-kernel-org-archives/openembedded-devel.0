Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlRhl-0007SI-Oz
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 21:20:24 +0200
Received: by qyk11 with SMTP id 11so1083092qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 12:19:45 -0700 (PDT)
Received: by 10.229.11.34 with SMTP id r34mr78810qcr.292.1282072784916;
	Tue, 17 Aug 2010 12:19:44 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r1sm9119865qcq.34.2010.08.17.12.19.43
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 12:19:44 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 14:19:42 -0500
Message-Id: <1282072782-11487-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] quilt: disable packaged staging on native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Aug 2010 19:21:08 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/quilt/quilt-native.inc |    3 +++
 recipes/quilt/quilt_0.48.bb    |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/quilt/quilt-native.inc b/recipes/quilt/quilt-native.inc
index 10d8183..f422b63 100644
--- a/recipes/quilt/quilt-native.inc
+++ b/recipes/quilt/quilt-native.inc
@@ -6,6 +6,9 @@ RDEPENDS_${PN} = "diffstat-native patch-native bzip2-native util-linux-native"
 FILESPATHPKG =. quilt-${PV}
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
+# Several packages fail to patch when using quilt from packaged staging
+PSTAGING_DISABLED_virtclass-native = "1"
+
 inherit autotools native
 
 PATCHTOOL = "patch"
diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
index 0a066df..99dc2a2 100644
--- a/recipes/quilt/quilt_0.48.bb
+++ b/recipes/quilt/quilt_0.48.bb
@@ -1,6 +1,6 @@
 require quilt-package.inc
 
-PR="r1"
+PR="r2"
 
 SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
 SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
-- 
1.5.6.4



