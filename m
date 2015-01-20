Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id C54F072C22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:14:50 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id m14so12900211wev.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fug2VlwhzWKmOm36DkLfLdorCXCgs6W9hmAjle74rTU=;
	b=gDVx0F+cjhR4S7GsIigy3AhZvthMaZJ3rWvkrlkhKqzYaSfRpYLeN3fZeA8U7gud6C
	JKUSj+os8gxUyk0NZ6lOH5/ab64UT6963gsjAfVOjp7qG6ZSsKsZRS5s355qGZxRX42V
	uu7kAff5ePHfq5UPikpxtokvHE7Yw0kjhQ7SXaLuF4EkgG+Fd7t8YbnBWw1vGia8hvgk
	SoUZswiBO3RRZ2NLNzj0IpNa29buaVm+BBevLQzvY+U00k4oq43D/L11xMeG3oklY78j
	qLqErJg1AlnlkHkvskEFxfJm4lwuuR7A/3LAwubQmmD8qsNcH9DTqvCC9fQvSqggaYRX
	r5lA==
X-Received: by 10.180.91.201 with SMTP id cg9mr48299894wib.63.1421766890909;
	Tue, 20 Jan 2015 07:14:50 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id gu5sm3372486wib.24.2015.01.20.07.14.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jan 2015 07:14:50 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jan 2015 16:14:23 +0100
Message-Id: <1421766864-9515-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-java][PATCH 1/2] binaries run by qemu: link with -static, force ld.bfd
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
X-List-Received-Date: Tue, 20 Jan 2015 15:14:55 -0000

For machines using DEFAULTTUNE = "armv7ahf" or DEFAULTTUNE = "armv7athf" a build
of openjdk-7 fails with segmentation faults during the qemu-arm runs.

e.g.
Segmentation fault (core dumped) | qemu-arm -cpu cortex-a8 -s 2097152
  -L .../sysroots/colibri-t20 \
  -E LD_LIBRARY_PATH=.../sysroots/colibri-t20/lib ./mkbc - bytecodes_arm.s

I found that qemu-arm can not execute any binary which is compiled with the
resulting compiler and is linked with the gold linker and the -static flag.
Even a simple hello world program does not work. When executing that
hello world on the real hardware it also generates a segmentation fault.

Removing the -static flag or forcing the bfd linker fixed this.

Note that other machines, colibri-t30 or i.mx6 based ones with neon but
otherwise identical setup do not suffer from the issue.
DEFAULTTUNE = "armv7athf-neon" works.

While at it convert the sizer call for openjdk-7 used when building xawt
also to use -static even though the code is currently disabled.

Further details:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-January/099795.html

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch  | 2 +-
 recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch | 2 +-
 recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch | 2 +-
 recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch  | 2 +-
 recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch      | 2 +-
 .../openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch         | 7 ++++++-
 recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch | 4 ++--
 7 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
index ec10e69..ba738d6 100644
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
@@ -35,7 +35,7 @@ Index: openjdk/hotspot/make/linux/makefiles/zeroshark.make
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
diff --git a/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
index 9a60bd6..0723954 100644
--- a/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
@@ -463,7 +463,7 @@ index 1fa311d..f3d06ad 100644
  $(SIZERS): $(SIZERS_C) 
  	$(prep-target)
 -	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -o $@ $(SIZER)$(suffix $@).c
++	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
  
  $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
  	$(prep-target)
diff --git a/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
index 3b34160..067b356 100644
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
@@ -247,7 +247,7 @@ index 1fa311d..f3d06ad 100644
  $(SIZERS): $(SIZERS_C) 
  	$(prep-target)
 -	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -o $@ $(SIZER)$(suffix $@).c
++	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
  
  $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
  	$(prep-target)
diff --git a/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
index 91ace0e..f14deaf 100644
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
@@ -35,7 +35,7 @@ index c2a1484..f460d85 100644
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
diff --git a/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch b/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
index 38fb191..3d4a68c 100644
--- a/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
+++ b/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
@@ -88,7 +88,7 @@ Index: icedtea6-1.8/ports/hotspot/make/linux/makefiles/zeroshark.make
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
index 39436a5..0c6aac4 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
@@ -319,7 +319,7 @@ index 53d31f3..183c063 100644
  endif # 32
  endif # !macosx
  endif # solaris
-@@ -337,11 +317,7 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
+@@ -337,15 +321,11 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
  WRAPPER_GENERATOR_CLASS=$(WRAPPER_GENERATOR_TEMPDIR)/WrapperGenerator.class 
  XLIBTYPES=$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
  
@@ -331,6 +331,11 @@ index 53d31f3..183c063 100644
  
  $(SIZERS): $(SIZERS_C) 
  	$(prep-target)
+-	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
++	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
+ 
+ $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
+ 	$(prep-target)
 @@ -358,6 +334,16 @@ $(SIZERS_C): $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
  	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
  
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
index 83dba2b..784f2de 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
@@ -25,13 +25,13 @@ index c2a1484..156bdd0 100644
  mkbc:	$(GAMMADIR)/tools/mkbc.c
  	@echo Compiling mkbc tool
 -	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE)
  
  mkoffsets:	asm_helper.cpp
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -static -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
-- 
1.9.3


