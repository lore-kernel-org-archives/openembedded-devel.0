Return-Path: <prvs=7652d1b30=Andreas.Obergschwandtner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 48A8E72EA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:42:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,274,1531778400"; d="scan'208";a="11945640"
From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Aug 2018 15:41:48 +0200
Message-ID: <20180822134148.3463-1-andreas.obergschwandtner@skidata.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex4srv.skidata.net (192.168.111.82)
Subject: [meta-java][PATCH v3] icedtea: disable error format-overflow for gcc 7
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
X-List-Received-Date: Wed, 22 Aug 2018 13:42:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As no patch has been found in debian and hotspot repo for this issue we
just disable this warning which was introduced with GCC 7.

Also known as: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881824

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
---
Changes v3:
   + fixed the format-overflow warnings by patching affected files
     in openjdk-7-hotspot.
Changes v2:
   + adapted by Richard Leitner to use the openjdk-build-helper class from
     André Draszik instead of our own in the java class.
     (Therefore it now depends on the "prepare for openjdk-8 build infra re-use"
     series from André)

 ...-hotspot-handle-gcc7-format-overflow.patch | 41 +++++++++++++++++++
 .../icedtea/openjdk-7-release-03b147.inc      |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-handle-gcc7-format-overflow.patch

diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-handle-gcc7-format-overflow.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-handle-gcc7-format-overflow.patch
new file mode 100644
index 0000000..27d41dd
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-handle-gcc7-format-overflow.patch
@@ -0,0 +1,41 @@
+# HG changeset patch
+# User Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
+# Date 1534928526 -7200
+#      Wed Aug 22 11:02:06 2018 +0200
+# Node ID 96d06a5c27f84a4d48cff0d927cf377866db894e
+# Parent  a456d0771ba0f6604b172f05f0b594178f7cc49c
+Handle format-overflow warning for GCC >= 7
+
+diff --git openjdk/hotspot/src/share/vm/adlc/output_c.cpp openjdk/hotspot/src/share/vm/adlc/output_c.cpp
+--- openjdk/hotspot/src/share/vm/adlc/output_c.cpp
++++ openjdk/hotspot/src/share/vm/adlc/output_c.cpp
+@@ -462,9 +462,11 @@
+   for (i = maxcycleused; i > 0; i /= 10)
+     cycledigit++;
+ 
+-  int maskdigit = 0;
+-  for (i = rescount; i > 0; i /= 10)
++  int maskdigit = 1;
++  for (i = rescount / 10; i > 0; i /= 10)
+     maskdigit++;
++  if (maskdigit > 10)
++    maskdigit = 10;
+ 
+   static const char * pipeline_use_cycle_mask = "Pipeline_Use_Cycle_Mask";
+   static const char * pipeline_use_element    = "Pipeline_Use_Element";
+diff --git openjdk/hotspot/src/share/vm/code/dependencies.cpp openjdk/hotspot/src/share/vm/code/dependencies.cpp
+--- openjdk/hotspot/src/share/vm/code/dependencies.cpp
++++ openjdk/hotspot/src/share/vm/code/dependencies.cpp
+@@ -429,6 +429,12 @@
+   Dependencies::write_dependency_to(log, dept, nargs, ciargs, witness);
+ }
+ 
++// disable format overflow checking for GCC versions > 7 because the lead to
++// a false positive in this case.
++// See https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
++#if defined (__GNUC__) && __GNUC__ >= 7
++#pragma GCC diagnostic ignored "-Wformat-overflow"
++#endif
+ void Dependencies::write_dependency_to(CompileLog* log,
+                                        DepType dept,
+                                        int nargs, ciObject* args[],
diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
index fe18ee5..484f124 100644
--- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
+++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
@@ -89,6 +89,7 @@ OPENJDK_PATCHES = " \
 	file://icedtea-x11_extension_cleanup.patch;apply=no \
 	file://icedtea-CVE-2014-1876-unpack.patch;apply=no \
 	file://icedtea-jdk-unzip.patch;apply=no \
+	file://icedtea-hotspot-handle-gcc7-format-overflow.patch;apply=no \
         "
 
 OPENJDK_HEADLESS_PATCHES = " \
@@ -111,6 +112,7 @@ export DISTRIBUTION_PATCHES = " \
 	patches/icedtea-x11_extension_cleanup.patch \
 	patches/icedtea-CVE-2014-1876-unpack.patch \
 	patches/icedtea-jdk-unzip.patch \
+	patches/icedtea-hotspot-handle-gcc7-format-overflow.patch \
 	${CLEAN_X11_DISTRIBUTION_PATCH} \
         "
 
-- 
2.17.1


