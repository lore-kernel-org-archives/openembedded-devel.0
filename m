Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF7A76FF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 04:19:58 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so8036199pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 21:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7tN2s+J2SBy9+JdBC0UB+gSLLdblEziMvAYSn5ENsjM=;
	b=FVnQHTfNXzBu0kclBZ6dmJFwxBYQZjuWE/EQU55qlOixjqEDoi84/IWTREWi+zLyNU
	Fsv3Q4cRyFt7OHLubzOnHi6HZ9fG0HkCyb0U5BwhtYVKFeEI8PQ++XJklbmxF38glyFG
	Kl4yGx6BaFsMOEzYR5dCvFPHX6efrgVPCslfrXAUIMnCCyjbJq8p179nF6Q2dm+lAMOQ
	dInryxa1scWOv8F1jQkuglDBGlRzr8KLcpdFpgaVoNoLbUL79S78osdMi881q8QN4k4H
	fWEmcNtLFoHoBzZsC7GIwqodq3mUr+tzgIsQJc4cp8TnIeNo4NorQFZMzS5WavE9/nS0
	f6dg==
X-Received: by 10.68.94.69 with SMTP id da5mr1373002pbb.65.1445314798980;
	Mon, 19 Oct 2015 21:19:58 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	we9sm914465pab.3.2015.10.19.21.19.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 21:19:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 21:29:19 -0700
Message-Id: <1445315359-30016-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-oe][PATCH] luajit: Upgrade to 2.1 beta1
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
X-List-Received-Date: Tue, 20 Oct 2015 04:20:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...p-automatically-this-leaves-the-stripping.patch | 33 ----------------------
 .../luajit/{luajit_2.0.4.bb => luajit_2.1.bb}      | 17 +++++------
 2 files changed, 9 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.4.bb => luajit_2.1.bb} (74%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch b/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
deleted file mode 100644
index f123b3f..0000000
--- a/meta-oe/recipes-devtools/luajit/luajit/0001-Do-not-strip-automatically-this-leaves-the-stripping.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 528009f5ca0685c95ef27f6c8957160499c0576a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 10 May 2013 10:42:45 -0700
-Subject: [PATCH] Do not strip automatically, this leaves the stripping
- busines to OE
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile |    2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 278324a..5ecd6d5 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -665,12 +665,10 @@ $(LUAJIT_A): $(LJVMCORE_O)
- $(LUAJIT_SO): $(LJVMCORE_O)
- 	$(E) "DYNLINK   $@"
- 	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
--	$(Q)$(TARGET_STRIP) $@
- 
- $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
- 	$(E) "LINK      $@"
- 	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
--	$(Q)$(TARGET_STRIP) $@
- 	$(E) "OK        Successfully built LuaJIT"
- 
- ##############################################################################
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
similarity index 74%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
rename to meta-oe/recipes-devtools/luajit/luajit_2.1.bb
index 4a15a4e..ba439d0 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
@@ -3,13 +3,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3992f1fbae3b8b061f9056b7fcda8cc6"
 HOMEPAGE = "http://luajit.org"
 
-SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
-           file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
+SRCREV = "776c6935ed807fc3b1ee6cd89a0cf682ffb7e9de"
+SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v${PV} \
 "
-SRC_URI[md5sum] = "dd9c38307f2223a504cbfb96e477eca0"
-SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746beef1807d"
 
-S = "${WORKDIR}/LuaJIT-${PV}"
+SPIN = ".0-beta1"
+
+S = "${WORKDIR}/git"
 
 inherit pkgconfig binconfig
 
@@ -23,7 +23,7 @@ do_configure_prepend() {
 EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
                 TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}" \
                 TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
-                TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}"'
+                TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}" TARGET_STRIP="/bin/echo"'
 EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86 = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
@@ -36,7 +36,8 @@ do_compile () {
 }
 
 do_install () {
-    oe_runmake 'DESTDIR=${D}' install
+    oe_runmake 'DESTDIR=${D}' 'TARGET_STRIP=/bin/echo' install
+    ln -s ${bindir}/${BPN}-${PV}${SPIN} ${D}${bindir}/luajit
     rmdir ${D}${datadir}/lua/5.* \
           ${D}${datadir}/lua \
           ${D}${libdir}/lua/5.* \
@@ -52,5 +53,5 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
     ${libdir}/libluajit-5.1.so \
     ${libdir}/pkgconfig/luajit.pc \
 "
-FILES_luajit-common = "${datadir}/${BPN}-${PV}"
+FILES_luajit-common = "${datadir}/${BPN}-${PV}${SPIN}"
 
-- 
2.6.1


