Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEED73567
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:55:51 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l2so31730799wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=brlZVWw2ukLYM93NejBcsHqeQEOtVEA6wFOp/GMR3yQ=;
	b=opi8ubuL6oIyo7ZY9ubjr9FCWyrU3j4qWebwWwCQIlLJe5ddGFN7bReCQevlpkcLf5
	b6Flo7kFs7WTA7H7EsOND760dAHQjwi3rFSYakHNE+8P0VGi6atS4GtQybRnvcgl4O6x
	rMtIwVgd/jccvvPivTutQKwRZRELq+W5AeerV0N16CkeVpcDELd6B0pWRNCRjGO5gCrT
	0lvI4Fq30Nstwc95QQ/CFBriZo/bu/tGF2/X/RL68ZJzSI0N99ZMK0zfnlVp8Qdv5mFi
	v6qDrOooloU6c9g98etdJo6rb7sTXT+HA8Hk51mN+HKiM7KqGSnl8RT/uraFAGiysXIk
	rPYw==
X-Received: by 10.194.122.196 with SMTP id lu4mr55208565wjb.154.1424123752188; 
	Mon, 16 Feb 2015 13:55:52 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id p1sm365956wib.23.2015.02.16.13.55.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:55:51 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 22:55:31 +0100
Message-Id: <1424123733-16696-5-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][PATCH 4/7] java-library: inherit allarch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Feb 2015 21:55:51 -0000

Use the allarch class to make every packages in the 'all' ARCH.
Recipes inheriting java-library which build additional packages which
don't belong in to all ARCH must manually setting PACKAGE_ARCH after
inheritting java-library.

This fixes the following error when building e.g. rhino for a second
machine of different architecture in the same build directory:
    ERROR: The recipe rhino is trying to install files into a
    shared area when those files already exist. Those files and their
    manifest location are:
       /.../ipk/all/librhino-java_1.7r4-r0_all.ipk
    Matched in manifest-armv7at2hf-vfp-rhino-package_write_ipk

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 classes/java-library.bbclass           | 8 +++++---
 recipes-core/libmatthew/libmatthew.inc | 1 +
 recipes-extended/rxtx/rxtx_2.2.0.bb    | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
index a74c8d3..144cd2f 100644
--- a/classes/java-library.bbclass
+++ b/classes/java-library.bbclass
@@ -7,8 +7,12 @@
 # starts with "lib" and/or ends with "-java". In case the "lib" prefix is part of
 # your package's normal name (e.g. liberator) the guessing is wrong and you have
 # to set JPN manually!
+#
+# package archs are set to all, if the recipe builds also packages which
+# can not be used for all archs, then set the PACKAGE_ARCH of that package
+# manually, see rxtx_xx.bb for an example.
 
-inherit java
+inherit java allarch
 
 # use java_stage for native packages
 JAVA_NATIVE_STAGE_INSTALL = "1"
@@ -35,8 +39,6 @@ DEPENDS_prepend = "virtual/javac-native fastjar-native "
 
 PACKAGES += "${JPN}"
 
-PACKAGE_ARCH_${JPN} = "all"
-
 FILES_${JPN} = "${datadir_java}"
 
 # File name of the libraries' main Jar file
diff --git a/recipes-core/libmatthew/libmatthew.inc b/recipes-core/libmatthew/libmatthew.inc
index b7e50bd..36622a8 100644
--- a/recipes-core/libmatthew/libmatthew.inc
+++ b/recipes-core/libmatthew/libmatthew.inc
@@ -8,6 +8,7 @@ DEPENDS = "virtual/java-native classpath-native classpath"
 S = "${WORKDIR}/libmatthew-java-${PV}"
 
 inherit java-library
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 # Some internal version numbers which change from time to time.
 # Allowing to override them makes this include file more
diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 85f55c0..0d5aa21 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -23,6 +23,7 @@ S = "${WORKDIR}/rxtx-2.2pre2"
 INSANE_SKIP_${PN} += "dev-so"
 
 inherit autotools-brokensep java-library
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 JARFILENAME = "RXTXcomm.jar"
 EXTRA_OEMAKE += "RXTX_PATH=${D}${libdir_jni} \
-- 
1.9.3


