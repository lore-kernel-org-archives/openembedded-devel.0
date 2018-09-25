Return-Path: <prvs=799a3c764=Andreas.Obergschwandtner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 056A2745A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 08:55:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,301,1534802400"; 
   d="scan'208";a="1682141"
From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Sep 2018 10:55:38 +0200
Message-ID: <20180925085538.24188-1-andreas.obergschwandtner@skidata.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex4srv.skidata.net (192.168.111.82)
Subject: [meta-java][PATCH] openjdk-8-native: hotspot: handle format-overflow error for gcc >= 7
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
X-List-Received-Date: Tue, 25 Sep 2018 08:55:59 -0000
Content-Type: text/plain

fixed the format-overflow warnings by patch affected files in
openjdk-8-hotspot

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
---
 .../hotspot-handle-gcc7-format-overflow.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch

diff --git a/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch b/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
new file mode 100644
index 0000000..83626b3
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/hotspot-handle-gcc7-format-overflow.patch
@@ -0,0 +1,25 @@
+# HG changeset patch
+# User Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
+# Date 1537519446 -7200
+#      Fri Sep 21 10:44:06 2018 +0200
+# Node ID 213da2c3ee54a558abd30b0230afa40d4b4e7f83
+# Parent  80ee2541504ec08d65da9d968a18a00a69858ce0
+Handle format error for GCC >= 7
+
+diff --git a/hotspot/src/share/vm/adlc/output_c.cpp b/hotspot/src/share/vm/adlc/output_c.cpp
+--- a/hotspot/src/share/vm/adlc/output_c.cpp
++++ b/hotspot/src/share/vm/adlc/output_c.cpp
+@@ -436,9 +436,11 @@
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
+   static const char* pipeline_use_cycle_mask = "Pipeline_Use_Cycle_Mask";
+   static const char* pipeline_use_element    = "Pipeline_Use_Element";
-- 
2.17.1


