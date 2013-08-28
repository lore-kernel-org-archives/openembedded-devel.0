Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 572176BC09
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:34:56 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id lb1so5853330pab.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 23:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4SBZNoNBTEAtU47xJXYY1LYzRl/z1w0l8N+YwYg+Pk4=;
	b=fmeqTtdMuYiF4takFixZB94CntGDzGturiR6/OHx4olwycRFrbZbxd4dzohfWpq9NP
	hpmSzLfxIlv////dE1M1bxVgyZ2c0BkNgC93Rq6i+qIe+wJn2VJl5Wa7S9WqGxZqqHwT
	e9WDnrA5MB5x46+TKbSDUDb/iI/Ycuew7TV0A7OVMmHFAD0MgA2ctn942ur624nc+azI
	2qTEf3slx8XnMoOaHTLt0QRdIcw2aNKPFXRDFm2ZHy9i4kay3iX4THwQAmht81bjjFTG
	zIArFjjl31/QcuR7YFCIMRv1S9ezJO4dhEaa7VoVS0q9m5w9eyzFcn1q9X+kPXPcxV8Y
	AtxA==
X-Received: by 10.68.254.166 with SMTP id aj6mr368369pbd.193.1377671697243;
	Tue, 27 Aug 2013 23:34:57 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ct4sm20021614pbb.41.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 23:34:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Aug 2013 23:34:10 -0700
Message-Id: <1377671650-16398-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [toolchain-layer][PATCH] gcc-4.6: Update to match gcc restructing in OE-Core
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
X-List-Received-Date: Wed, 28 Aug 2013 06:34:58 -0000

The include file infra in gcc recipes recieved an overhaul
on OE-Core. This patch matches the toolchain layer recipes
to use the new include files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb    | 19 -------------------
 toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb |  8 +-------
 .../recipes-devtools/gcc/gcc-runtime_4.6.bb           |  8 +-------
 toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb       |  5 +----
 4 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
index 5c2435f..29ddd67 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
@@ -2,22 +2,3 @@ inherit cross-canadian
 
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-cross-canadian.inc
-require recipes-devtools/gcc/gcc-configure-sdk.inc
-require recipes-devtools/gcc/gcc-package-sdk.inc
-
-DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
-RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
-
-SYSTEMHEADERS = "/usr/include"
-SYSTEMLIBS = "/lib/"
-SYSTEMLIBS1 = "/usr/lib/"
-
-EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
-    --disable-libgomp --disable-libmudflap \
-    --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
-    --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
-
-# to find libmpfr
-# export LD_LIBRARY_PATH = "{STAGING_DIR_HOST}${layout_exec_prefix}"
-
-PARALLEL_MAKE = ""
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb
index eb8896c..cdaa7e8 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb
@@ -1,8 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-cross4.inc
-
-EXTRA_OECONF += "--disable-libunwind-exceptions \
-                 --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
-                 --with-system-zlib "
-
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+require recipes-devtools/gcc/gcc-cross.inc
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb
index 13431c8..b755f55 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb
@@ -1,8 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-configure-runtime.inc
-require recipes-devtools/gcc/gcc-package-runtime.inc
-
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
-
-EXTRA_OECONF += "--disable-libunwind-exceptions"
-EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
+require recipes-devtools/gcc/gcc-runtime.inc
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb
index 97e6c32..6ad8973 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb
@@ -1,5 +1,2 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-configure-target.inc
-require recipes-devtools/gcc/gcc-package-target.inc
-
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
+require recipes-devtools/gcc/gcc-target.inc
-- 
1.8.4


