Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id B4E4F72BEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 20:47:53 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id k11so16918070wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 12:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wXGdvck6oAD1ikqpXbP5egMUgy3NzxBUTquUzzOb3zw=;
	b=zrv1uYh31Nw+AtTLRytQsN9FNSZNnLRlfFFViKtCT1sSN5sfJrHeDLD07s9ihjXx/5
	z2BKNRq+Q2YZ/4RO6fpsH2zQvJpKujFIDykWIoRR/w/1zt8lZaAi0vdr6+KMqVj8E4vT
	s1E9AeAg04lSC3sPbaLrEZdOs4pgS+7DtSszA/c2VyHn3A1SRt4XRnvIReRMo+Poo6f/
	2i4Jd4R8yMlw3tycEDzjfxvHtf3LskuKLVItPb2bhVwAyEBrzBNSPmyCY7Wm0sc0tYSD
	Tcocm7fdDQjN7HxbTldxB1qDMBa5M/qk6QQNmzEoemhRXTB94aszXWmqEq2WJ1m1/rkB
	LFoA==
X-Received: by 10.194.94.164 with SMTP id dd4mr22638716wjb.56.1421354873597;
	Thu, 15 Jan 2015 12:47:53 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id gz7sm392409wib.22.2015.01.15.12.47.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 12:47:53 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jan 2015 21:47:00 +0100
Message-Id: <1421354822-21485-2-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1421354822-21485-1-git-send-email-max.oss.09@gmail.com>
References: <1421354822-21485-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][RFC 1/3] binaries run by qemu: remove linking with -static
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
X-List-Received-Date: Thu, 15 Jan 2015 20:47:54 -0000

For the machine colibri-t20 a build of openjdk-7 fails with segmentation
faults during the qemu-arm runs.
e.g.
Segmentation fault (core dumped) | qemu-arm -cpu cortex-a8 -s 2097152
  -L .../sysroots/colibri-t20 \
  -E LD_LIBRARY_PATH=.../sysroots/colibri-t20/lib ./mkbc - bytecodes_arm.s

The machine uses the following tunes and (through angstrom) a Linaro toolchain:
DEFAULTTUNE = "armv7athf"
TUNE_CCARGS += "-mfpu=vfpv3-d16"

Resulting in:
TUNE_FEATURES     = "armv7a vfp thumb callconvention-hard"
TARGET_FPU        = "vfp"

I found that qemu-arm can not execute any binary which is compiled with the
compiler for Colibri-T20 and is linked with the -static flag.
Even a simple hello world program does not work. When executing that
hello world on the real hardware it also generates a segmentation fault.

Removing the -static flag fixed this.

Note that other machines, colibri-t30 or i.mx6 based ones with neon but
otherwise identical setup do not suffer from the issue.
DEFAULTTUNE = "armv7athf-neon"

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch  | 2 +-
 recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch | 2 +-
 recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch | 2 +-
 recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch  | 2 +-
 recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch      | 2 +-
 recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
index ec10e69..a67106b 100644
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
@@ -35,7 +35,7 @@ Index: openjdk/hotspot/make/linux/makefiles/zeroshark.make
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
diff --git a/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
index 9a60bd6..2f952d9 100644
--- a/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b27/icedtea-crosscompile-fix.patch
@@ -463,7 +463,7 @@ index 1fa311d..f3d06ad 100644
  $(SIZERS): $(SIZERS_C) 
  	$(prep-target)
 -	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -o $@ $(SIZER)$(suffix $@).c
++	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
  
  $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
  	$(prep-target)
diff --git a/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
index 3b34160..ddc9bc2 100644
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b32/icedtea-crosscompile-fix.patch
@@ -247,7 +247,7 @@ index 1fa311d..f3d06ad 100644
  $(SIZERS): $(SIZERS_C) 
  	$(prep-target)
 -	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -o $@ $(SIZER)$(suffix $@).c
++	$(CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
  
  $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
  	$(prep-target)
diff --git a/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
index 91ace0e..0bca9b1 100644
--- a/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-6-6b32/icedtea-zero-hotspotfix.patch
@@ -35,7 +35,7 @@ index c2a1484..f460d85 100644
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
diff --git a/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch b/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
index 38fb191..4ab9c7f 100644
--- a/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
+++ b/recipes-core/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
@@ -88,7 +88,7 @@ Index: icedtea6-1.8/ports/hotspot/make/linux/makefiles/zeroshark.make
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
diff --git a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
index 83dba2b..7275d17 100644
--- a/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
+++ b/recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
@@ -25,13 +25,13 @@ index c2a1484..156bdd0 100644
  mkbc:	$(GAMMADIR)/tools/mkbc.c
  	@echo Compiling mkbc tool
 -	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
  
  mkoffsets:	asm_helper.cpp
  	@echo Compiling offset generator
  	$(QUIETLY) $(REMOVE_TARGET)
 -	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -static -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) $(CFLAGS) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
  
  endif
  
-- 
1.9.3


