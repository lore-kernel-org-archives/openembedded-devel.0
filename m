Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Uas1t-0006Ew-NJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:26:54 +0200
Received: by mail-pd0-f176.google.com with SMTP id x10so2944435pdj.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=13TCHMUBEi6/CrYZbYlfrOdDGfDJnyagiseu0Qg7cpk=;
	b=onMLkCjRSt03petXaqav2iXMLFAKvEqf3ARDRgomXyscNuDtQ4lTQi0OwrXYIeoBaZ
	VdZvexBgbgglz+h9fKizP5RzzZwBlWdrAJVUusWtaD/SQuhBhaUUvv41ZBav1B/MxADP
	QpHkK5nWM8+3UrhEFQ0iWW1bsi9IDl0EcPVacCXOcAijjnTfC5HhDd7BP2Mlre1XKSn5
	U5cmLdHvQYxQVXuRwhbJFlbPURmZXhrFRk+Zcc76AidOfX66CE3bakKjxhN/Ih1VLLbH
	Jtarx90EHtXhbTtI5o6MjbfXUi8EvApL6hNRf2cJ2Z+RQT4Ahi24hnK+iHMDIT08c8gZ
	Trqw==
X-Received: by 10.68.88.194 with SMTP id bi2mr18197543pbb.12.1368209327178;
	Fri, 10 May 2013 11:08:47 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id sq9sm3816784pab.5.2013.05.10.11.08.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 May 2013 11:08:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 11:07:17 -0700
Message-Id: <1368209237-2666-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] LuaJIT: Upgrade 2.0.0 -> 2.0.1
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
X-List-Received-Date: Fri, 10 May 2013 18:26:54 -0000

Fix stripping related warnings
Drop foldarith_for_spe patch not neded anymore
QA Error about elocations in .text are still there like 2.0.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../disable_lj_vm_foldarith_for_spe.patch          |   13 --------
 ...p-automatically-this-leaves-the-stripping.patch |   33 ++++++++++++++++++++
 .../luajit/{luajit_2.0.0.bb => luajit_2.0.1.bb}    |   13 ++++----
 3 files changed, 39 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.0.bb => luajit_2.0.1.bb} (79%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch b/meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch
deleted file mode 100644
index c96fc77..0000000
--- a/meta-oe/recipes-devtools/luajit/luajit-2.0.0/disable_lj_vm_foldarith_for_spe.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: LuaJIT-2.0.0/src/lj_vmmath.c
-===================================================================
---- LuaJIT-2.0.0.orig/src/lj_vmmath.c	2012-11-08 02:10:00.000000000 -0800
-+++ LuaJIT-2.0.0/src/lj_vmmath.c	2012-11-19 22:15:28.613527136 -0800
-@@ -22,7 +22,7 @@
- LJ_FUNCA double lj_vm_tanh(double x) { return tanh(x); }
- #endif
- 
--#if !LJ_TARGET_X86ORX64
-+#if !(LJ_TARGET_X86ORX64 || LJ_TARGET_PPCSPE)
- double lj_vm_foldarith(double x, double y, int op)
- {
-   switch (op) {
diff --git a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
new file mode 100644
index 0000000..f123b3f
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
@@ -0,0 +1,33 @@
+From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 May 2013 10:42:45 -0700
+Subject: [PATCH] Do not strip automatically, this leaves the stripping
+ busines to OE
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 278324a..5ecd6d5 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -665,12 +665,10 @@ $(LUAJIT_A): $(LJVMCORE_O)
+ $(LUAJIT_SO): $(LJVMCORE_O)
+ 	$(E) "DYNLINK   $@"
+ 	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
+-	$(Q)$(TARGET_STRIP) $@
+ 
+ $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
+ 	$(E) "LINK      $@"
+ 	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
+-	$(Q)$(TARGET_STRIP) $@
+ 	$(E) "OK        Successfully built LuaJIT"
+ 
+ ##############################################################################
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
similarity index 79%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
rename to meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
index 3878386..99a2ca6 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.1.bb
@@ -1,15 +1,14 @@
 DESCRIPTION = " a Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9511885992e4900014e3b13ca6372b7d"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1793ef52a5d577794cd886a501a7f861"
 HOMEPAGE = "http://luajit.org"
 
 DEPENDS += "lua5.1"
-PR = "r2"
 SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
-           file://disable_lj_vm_foldarith_for_spe.patch \
-"
-SRC_URI[md5sum] = "97a2b87cc0490784f54b64cfb3b8f5ad"
-SRC_URI[sha256sum] = "deaed645c4a093c5fb250c30c9933c9131ee05c94b13262d58f6e0b60b338c15"
+           file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
+          "
+SRC_URI[md5sum] = "85e406e8829602988eb1233a82e29f1f"
+SRC_URI[sha256sum] = "2371cceb53453d8a7b36451e6a0ccdb66236924545d6042ddd4c34e9668990c0"
 
 S = "${WORKDIR}/LuaJIT-${PV}"
 
@@ -43,7 +42,7 @@ do_install () {
 PACKAGES += 'luajit-common'
 
 FILES_${PN} += "${libdir}/libluajit-5.1.so.2 \
-    ${libdir}/libluajit-5.1.so.2.0.0 \
+    ${libdir}/libluajit-5.1.so.${PV} \
 "
 FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
     ${libdir}/libluajit-5.1.so \
-- 
1.7.9.5



