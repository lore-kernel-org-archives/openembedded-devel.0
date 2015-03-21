Return-Path: <sam.nelson@ti.com>
X-Greylist: delayed 422 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 21 Mar 2015 02:40:00 UTC
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6136013D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Mar 2015 02:40:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2L2Wx4j030261
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 21:32:59 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2L2WvNl005424
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 21:32:58 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 21:32:57 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2L2WsNk028261;	Fri, 20 Mar 2015 21:32:56 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Mar 2015 22:32:49 -0400
Message-ID: <1426905170-24218-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] openjdk: Add patch to avoid build issue with linaro toolchain 4.7
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
X-List-Received-Date: Sat, 21 Mar 2015 02:40:00 -0000
Content-Type: text/plain

- "-fuse-ld=bfd" is only supported in the linaro toolchain verion 4.8
- This is work around to support the 4.7 version

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../openjdk-7-25b30/icedtea-crosscompile-fix.patch |    9 +++++----
 .../openjdk-7-25b30/icedtea-zero-hotspotfix.patch  |    8 +++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
index 0c6aac4..61b7d8c 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
@@ -319,7 +319,7 @@ index 53d31f3..183c063 100644
  endif # 32
  endif # !macosx
  endif # solaris
-@@ -337,15 +321,11 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
+@@ -337,15 +321,12 @@ WRAPPER_GENERATOR_TEMPDIR=$(TEMPDIR)/sun/awt/X11/generator
  WRAPPER_GENERATOR_CLASS=$(WRAPPER_GENERATOR_TEMPDIR)/WrapperGenerator.class 
  XLIBTYPES=$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
  
@@ -332,11 +332,12 @@ index 53d31f3..183c063 100644
  $(SIZERS): $(SIZERS_C) 
  	$(prep-target)
 -	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
++	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c || \
++	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -o $@ $(SIZER)$(suffix $@).c
  
  $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
  	$(prep-target)
-@@ -358,6 +334,16 @@ $(SIZERS_C): $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
+@@ -358,6 +335,16 @@ $(SIZERS_C): $(WRAPPER_GENERATOR_CLASS) $(XLIBTYPES)
  	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
  
  $(SIZES): $(SIZERS)
@@ -353,7 +354,7 @@ index 53d31f3..183c063 100644
  	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
  	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
  	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-@@ -366,6 +352,7 @@ $(SIZES): $(SIZERS)
+@@ -366,6 +353,7 @@ $(SIZES): $(SIZERS)
  	    $(ECHO) GENERATING $@; \
  	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
  	fi
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
index 784f2de..baa7395 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
@@ -2,7 +2,7 @@ diff --git openjdk/hotspot/make/linux/makefiles/zeroshark.make openjdk/hotspot/m
 index c2a1484..156bdd0 100644
 --- openjdk/hotspot/make/linux/makefiles/zeroshark.make
 +++ openjdk/hotspot/make/linux/makefiles/zeroshark.make
-@@ -32,26 +32,28 @@ Obj_Files += cppInterpreter_arm.o
+@@ -32,26 +32,30 @@ Obj_Files += cppInterpreter_arm.o
  Obj_Files += thumb2.o
  
  CFLAGS += -DHOTSPOT_ASM
@@ -25,13 +25,15 @@ index c2a1484..156bdd0 100644
  mkbc:	$(GAMMADIR)/tools/mkbc.c
  	@echo Compiling mkbc tool
 -	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE) || \
++	$(CC_COMPILE) -static -o $@ $< $(COMPILE_DONE)
  
  mkoffsets:	asm_helper.cpp
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) $(CFLAGS) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE) || \
++	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -static -o $@ $< $(COMPILE_DONE)
  
  endif
  
-- 
1.7.9.5


