Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 65AD377BB4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 06:55:37 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w50so12328077wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s/z8JneRcIcC6XdjnOdXcKkuYu95/wsG6RbzkLD9zkw=;
	b=qVxNIexTvQf3MJ3l4rRugBpjGfMleM1J3Fw6rc5h5YnuPjnWsMbt9HFnaHNl5rTtCh
	Im6R+PKA1fdluWG2wQSkMIu0iPnc02TCJf8vgfq1q5+QSlM0B3OElkhQ/o0MZ7xKLs3K
	AnQ35RLrmyvh2s1GEBde//rY0Go6FdOCgJoxAj3qp8llJrgj7R2ReuwzGqlSyjdVF5ir
	WHVugN8VKJhk8lJl2Rl6WETWoE0oBOuQ2geiFcG9b3K0x4a/E9oP452z8sMziDX7+BNI
	AKAcnUygwX2PdQuspiPedZSc9JnxCNueLfAc8Au90wKc2rgxNcsb6FcfEStq7Vp/t8rN
	w0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s/z8JneRcIcC6XdjnOdXcKkuYu95/wsG6RbzkLD9zkw=;
	b=Nj59URpFRSSKs3nZWLkhkJoK2admusvKBZtN5+uCRnmOlcLDDUNhkpjdjZio4BcmSh
	TSmbslsy2Ld9Yg52omZhpbcomxOsteXrYpo9XIbJ28nbzMgP99rLqELO1zkHBBryAE7y
	EIpSV4GugrKRmpf860BqGpdsbWiNrq3gk7vlodt3woW3Vpi3nn0Dl3cpppRPD3vXWj4/
	rbUotMjCfExVG1v3DmgDiTue3LoZpQs6o5HD4xQLqwGJAfU2CLKXverO4h/TQTMelj2w
	6sd60q58QQvwqdT546MzVpypabG9LbJZ29QyUOEh0l6vws6UfCV7oJP0dpRc1zGg6afL
	OeHQ==
X-Gm-Message-State: AN3rC/5sMccX4ksA1aw6Ymfk3/f7qRUTW8WgX276wL8RA9oB2AjOs0D1
	qU9pGhlYjHJGTQ==
X-Received: by 10.223.172.105 with SMTP id v96mr860231wrc.1.1492930538263;
	Sat, 22 Apr 2017 23:55:38 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.223.154])
	by smtp.gmail.com with ESMTPSA id 81sm8059503wmj.9.2017.04.22.23.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Apr 2017 23:55:37 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 08:54:56 +0200
Message-Id: <1492930496-6082-6-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
References: <1492930496-6082-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-java][PATCH 5/5] openjdk-8-cross.inc: fix a libpng build issue
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
X-List-Received-Date: Sun, 23 Apr 2017 06:55:37 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

JDK/JRE fails to build for ARM NEON machines, due to a undefined symbol
in libpng, as follows:
| build/jdk/objs/libsplashscreen/pngrutil.o: In function `png_init_filter_functions':
| jdk/src/share/native/sun/awt/libpng/pngrutil.c:4002: undefined reference to `png_init_filter_functions_neon'

This is a known issue already fixed in openjdk upstream, back-port the fix.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc           |  1 +
 .../openjdk8-fix-libpng-neon-build.patch           | 29 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 247438f..ad3a44d 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -13,6 +13,7 @@ PATCHES_URI_append = "\
     file://openjdk8-silence-d_fortify_source-warning.patch;apply=no \
     file://openjdk8-fix-zero-mode-crash.patch;apply=no \
     file://openjdk8-add-missing-linker-flags.patch;apply=no \
+    file://openjdk8-fix-libpng-neon-build.patch;apply=no \
 "
 
 DEPENDS = "\
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch
new file mode 100644
index 0000000..dd6d8e3
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-libpng-neon-build.patch
@@ -0,0 +1,29 @@
+# HG changeset patch
+# User enevill
+# Date 1430816900 0
+#      Tue May 05 09:08:20 2015 +0000
+# Node ID 88d2b7d7285281d41bcff45af0dd983b0f72811e
+# Parent  51f5501a54a62aceed6342e7ea3a9a3c67f3885d
+8078245: AARCH64: JDK fails to build due to undefined symbol in libpng
+Summary: Add -DPNG_ARM_NEON_OPT=0 to LIBSPLASHSCREEN_CFLAGS flags
+Reviewed-by: dholmes, ihse, erikj
+
+Upstream-Status: Backport
+
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ jdk/make/lib/Awt2dLibraries.gmk |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git jdk/make/lib/Awt2dLibraries.gmk jdk/make/lib/Awt2dLibraries.gmk
+--- jdk/make/lib/Awt2dLibraries.gmk
++++ jdk/make/lib/Awt2dLibraries.gmk
+@@ -1205,7 +1205,7 @@ ifndef BUILD_HEADLESS_ONLY
+     LIBSPLASHSCREEN_DIRS += $(JDK_TOPDIR)/src/macosx/native/sun/awt/splashscreen
+   endif
+
+-  LIBSPLASHSCREEN_CFLAGS := -DSPLASHSCREEN -DPNG_NO_MMX_CODE \
++  LIBSPLASHSCREEN_CFLAGS := -DSPLASHSCREEN -DPNG_NO_MMX_CODE -DPNG_ARM_NEON_OPT=0 \
+       $(foreach dir, $(LIBSPLASHSCREEN_DIRS), -I$(dir))
+
+   ifeq ($(OPENJDK_TARGET_OS), macosx)
-- 
2.7.4


