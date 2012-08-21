Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3ft2-0007Bh-Gb
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 06:16:16 +0200
Received: by pbcwy7 with SMTP id wy7so8917811pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=5y69r49sUDionp43ComAwSzbz5rlZ8TOhEB63cXH2Ho=;
	b=OgZr0c6bmOTHjNbmkTcMK+OsLMCJ9xjjT8UXZ6bhl+Ktez0ZLr7OT1Gc6tzLWPq8XO
	4xa1y+mN4O4/YqEMIgVN6QLJK1RJK04PUBm8NnkJhatVqrNCVQ+bUR5Xx41EXxqA9Ck5
	ExNGK8qhX5tSNMmP0/9Xmabqe1+bxh/TjVUlAqYGHs+Sb/LaBAYsbB/IzaXNL7uhgTe6
	RbmQfmi6C6rh36qvow74H/C1CN22zDSQ2PmceL5++JPHLRYoI63s48g+2ir4o52Ih+l2
	CB2lTm005YmYFhNQDf422WOINVHYsQSe4TVr2GMm2mVXzG92z+G8gD2a9bJx/S6d1kH4
	PF3w==
Received: by 10.66.78.69 with SMTP id z5mr34876868paw.14.1345521852400;
	Mon, 20 Aug 2012 21:04:12 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm526674pbc.39.2012.08.20.21.04.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:04:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:03:32 -0700
Message-Id: <1345521816-2364-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
References: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java/openjdk-7.0][PATCH 3/7] llvm2.8: Fix build break discovred by unanchored regexp fix in bitbake
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
X-List-Received-Date: Tue, 21 Aug 2012 04:16:16 -0000

commit 23bd5300b4a99218a15f4f6b0ab4091d63a602a5 fixed a bug
in bitbake which exposed this latent problem where we were using

EXTRA_OECMAKE_append-arm it was being treated as
EXTRA_OECMAKE_append before the above mentioned fix and hence
all was fine but after this fix behavior changed and
it was just EXTRA_OECMAKE_append-arm and was causing build
breaks

| ../../lib/libLLVMTransformUtils.so: undefined reference to
`llvm::CallGraphNode::removeCallEdgeFor(llvm::CallSite)'
| ../../lib/libLLVMTransformUtils.so: undefined reference to
`llvm::CallGraph::getOrInsertFunction(llvm::Function const*)'
| ../../lib/libLLVMTransformUtils.so: undefined reference to
`llvm::CallGraphLinkVar'
| ../../lib/libLLVMScalarOpts.so: undefined reference to
`llvm::createInstructionCombiningPass()'
| collect2: error: ld returned 1 exit status
| make[2]: *** [bin/llc] Error 1
| make[2]: Leaving directory
`/work/yocto/poky/build/tmp/work/x86_64-poky-linux/llvm2.8-2.8-r2.1/llvm-2.8/build'
| make[1]: *** [tools/llc/CMakeFiles/llc.dir/all] Error 2
| make[1]: *** Waiting for unfinished jobs....

It also fixes the llvm-mc build for arm architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Conflicts:

	recipes-core/llvm/llvm2.8_2.8.bb
---
 recipes-core/llvm/llvm2.8/llvm-mc_disable.patch |   12 ------------
 recipes-core/llvm/llvm2.8_2.8.bb                |    6 ++----
 2 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 recipes-core/llvm/llvm2.8/llvm-mc_disable.patch

diff --git a/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch b/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
deleted file mode 100644
index fddc674..0000000
--- a/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: llvm-2.8/tools/CMakeLists.txt
-===================================================================
---- llvm-2.8.orig/tools/CMakeLists.txt	2010-08-24 11:16:51.000000000 +0200
-+++ llvm-2.8/tools/CMakeLists.txt	2011-12-21 16:47:47.718508763 +0100
-@@ -14,7 +14,6 @@
- add_subdirectory(opt)
- add_subdirectory(llvm-as)
- add_subdirectory(llvm-dis)
--add_subdirectory(llvm-mc)
- 
- add_subdirectory(llc)
- add_subdirectory(llvm-ranlib)
diff --git a/recipes-core/llvm/llvm2.8_2.8.bb b/recipes-core/llvm/llvm2.8_2.8.bb
index 3459885..72ef29a 100644
--- a/recipes-core/llvm/llvm2.8_2.8.bb
+++ b/recipes-core/llvm/llvm2.8_2.8.bb
@@ -4,7 +4,7 @@ require llvm.inc
 LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += " \
             file://30may-llvm2.8-pr399-ppc-arm.patch \
@@ -12,11 +12,9 @@ SRC_URI += " \
             file://add-unistd.patch \
            "
 
-SRC_URI_append_arm = " file://llvm-mc_disable.patch "
-
 LLVM_RELEASE = "2.8"
 
-EXTRA_OECMAKE_append-arm = " -DBUILD_SHARED_LIBS:BOOL=OFF "
+EXTRA_OECMAKE += " -DBUILD_SHARED_LIBS:BOOL=OFF "
 
 SRC_URI[md5sum] = "220d361b4d17051ff4bb21c64abe05ba"
 SRC_URI[sha256sum] = "25addb742f1c6cc12877ed0ee924dda962d848368ee095be8e48342ae613d43b"
-- 
1.7.9.5



