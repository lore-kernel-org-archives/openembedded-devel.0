Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id C742C61A4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 09:44:05 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 3D3244B0049;
	Fri, 24 May 2013 11:44:01 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2013 11:44:36 +0200
Message-Id: <1369388677-15423-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/2] qtjsbackend: fix hardfloat detection in v8
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
X-List-Received-Date: Fri, 24 May 2013 09:44:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtjsbackend.inc                     |    1 +
 .../qtjsbackend/0001-Fix-hardfloat-detection.patch |   33 ++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch

diff --git a/recipes-qt/qt5/qtjsbackend.inc b/recipes-qt/qt5/qtjsbackend.inc
index 4479654..a0dc632 100644
--- a/recipes-qt/qt5/qtjsbackend.inc
+++ b/recipes-qt/qt5/qtjsbackend.inc
@@ -13,4 +13,5 @@ INC_PR = "r0"
 
 SRC_URI += " \
     file://0002-v8.pro-respect-external-host-bindir-when-set.patch \
+    file://0001-Fix-hardfloat-detection.patch \
 "
diff --git a/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch b/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch
new file mode 100644
index 0000000..3d86fbf
--- /dev/null
+++ b/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch
@@ -0,0 +1,33 @@
+From 05a87fccb76447ce3cb4b926128af929f26469bb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Wed, 22 May 2013 18:50:01 +0200
+Subject: [PATCH] Fix hardfloat detection
+
+based on the same patch for nodejs which says :
+
+gcc has a builtin define to denote hard abi when in use, e.g. when
+using -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore
+we should check that to determine which calling convention is in use
+and not __VFP_FP__ which merely indicates presence of VFP unit
+
+The fix has been provided by Khem Raj <raj.khem@gmail.com>
+---
+ src/3rdparty/v8/src/platform-linux.cc |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/v8/src/platform-linux.cc b/src/3rdparty/v8/src/platform-linux.cc
+index f6db423..8ae2249 100644
+--- a/src/3rdparty/v8/src/platform-linux.cc
++++ b/src/3rdparty/v8/src/platform-linux.cc
+@@ -167,7 +167,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
+ // calling this will return 1.0 and otherwise 0.0.
+ static void ArmUsingHardFloatHelper() {
+   asm("mov r0, #0":::"r0");
+-#if defined(__VFP_FP__) && !defined(__SOFTFP__)
++#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
+   // Load 0x3ff00000 into r1 using instructions available in both ARM
+   // and Thumb mode.
+   asm("mov r1, #3":::"r1");
+-- 
+1.7.10.4
+
-- 
1.7.10.4


