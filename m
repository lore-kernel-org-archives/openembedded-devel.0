Return-Path: <prvs=7451dbc88=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id B3D9B6074F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:16:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,434,1526335200"; d="scan'208";a="11645935"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Aug 2018 11:16:57 +0200
Message-ID: <20180802091657.30254-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][master-next][PATCH] ca-certificates-java: add support for openjdk-7
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
X-List-Received-Date: Thu, 02 Aug 2018 09:16:41 -0000
Content-Type: text/plain

As this package should be fully comaptible with openjdk-7{-jre} add
support for it.

Furthermore depend on icedtea7-native instead of openjdk-8-native
because it should be availabe already. Otherwise openjdk-8-native would
be built only for this recipe if we use openjdk-7{-jre} only.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 2db1915..52443ed 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -14,7 +14,9 @@ DEPENDS = "virtual/javac-native fastjar-native"
 # We can't use virtual/javac-native, because that would create a
 # keystore that can't be read on the target (as virtual/javac-native
 # usually is either too old, or plain incompatible with this)
-PACKAGE_WRITE_DEPS += "openjdk-8-native"
+# Therefore we use icedtea7-native as it's a dependency for all our openjdk
+# versions and should therefore be available already.
+PACKAGE_WRITE_DEPS += "icedtea7-native"
 
 SRC_URI = "\
 	git://salsa.debian.org/java-team/ca-certificates-java.git \
@@ -33,7 +35,7 @@ JARFILENAME = "${BPN}.jar"
 
 python () {
     runtime = d.getVar("PREFERRED_RPROVIDER_java2-runtime") or ""
-    if not runtime in ("openjdk-8", "openjre-8"):
+    if not runtime in ("openjdk-8", "openjre-8", "openjdk-7-jre"):
         raise bb.parse.SkipRecipe("PREFERRED_RPROVIDER_java2-runtime '%s' unsupported" % runtime)
 }
 
-- 
2.11.0


