Return-Path: <prvs=696aff75f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 6603876059
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 22:49:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,224,1526335200"; d="scan'208";a="10858884"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jun 2018 00:49:03 +0200
Message-ID: <20180614224904.21590-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180614224904.21590-1-richard.leitner@skidata.com>
References: <20180614224904.21590-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 1/2] openjdk-8: fix build for gcc8.x
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
X-List-Received-Date: Thu, 14 Jun 2018 22:49:16 -0000
Content-Type: text/plain

Currently oe-core/YoctoProject migrated to gcc8.x. This update broke our
openjdk-8 and openjre-8 build. This patch avoids this problem by disabling
the problematic gcc warnings and errors.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-8-release-16xbyy.inc   |  1 +
 .../patches-openjdk-8/hotspot_fix_gcc8x_build.patch | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index bd4a349..7ca0997 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -16,6 +16,7 @@ PATCHES_URI = "\
     file://0008-jdk-use-correct-include-for-signal.patch \
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
+    file://hotspot_fix_gcc8x_build.patch \
 "
 # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
diff --git a/recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch b/recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch
new file mode 100644
index 0000000..1a406f2
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/hotspot_fix_gcc8x_build.patch
@@ -0,0 +1,21 @@
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Thu, 14 Jun 2018 23:42:11 +0200
+Subject: [PATCH] openjdk-8: hotspot: fix gcc8 compilation
+
+As oe-core/yocto-project master migrated to gcc8.x we need to support this.
+Therefore disable following gcc warnings/errors which caused the build to fail:
+  + stringop-overflow
+  + return-type
+---
+
+--- a/hotspot/make/linux/makefiles/gcc.make
++++ b/hotspot/make/linux/makefiles/gcc.make
+@@ -197,7 +197,7 @@
+ endif
+ 
+ # Compiler warnings are treated as errors
+-WARNINGS_ARE_ERRORS = -Werror
++WARNINGS_ARE_ERRORS = -Werror -Wno-stringop-overflow -Wno-error=return-type
+ 
+ ifeq ($(USE_CLANG), true)
+   # However we need to clean the code up before we can unrestrictedly enable this option with Clang
-- 
2.11.0


