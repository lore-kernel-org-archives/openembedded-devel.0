Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXnct-00040r-IG
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 06:31:35 +0100
Received: by ggnh1 with SMTP id h1so5846385ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bkx6cki3khKK782GyxrNE4+uPjLRnnAhaP/jhg7iOuU=;
	b=WnfaMj+y7aUf+UmaN5zc1a7FpQlYVVCkBT5itI1TYfbqCX5LgWgirS1SM9DfKuGwAA
	pYzV67XWMqzdY0oDk7tO7ITqq1eL16nCxtZ3tIhoABxgTmVS4AlpPvC0oW7htqFzkqSQ
	Q6Z52DyTuO6i6Hhp3oKEaxDz7JWLX7cYzZXeE=
Received: by 10.101.137.9 with SMTP id p9mr1383725ann.71.1323149088038;
	Mon, 05 Dec 2011 21:24:48 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id d6sm47774282anm.16.2011.12.05.21.24.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:24:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:24:35 -0800
Message-Id: <1323149076-10389-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [[meta-oe] 1/2] gcc-4.6: Delete the patch that is now applied in oe-core
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
X-List-Received-Date: Tue, 06 Dec 2011 05:31:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch    |   34 --------------------
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    1 -
 2 files changed, 0 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch
deleted file mode 100644
index 04dabaf..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
-
- 	gcc/
- 	Backport from mainline:
- 
-	2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
-
-	* config/arm/arm.c (arm_rtx_costs_1): Don't modify the costs of SET.
-	(arm_size_rtx_costs): Likewise.
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2011-08-12 08:08:31 +0000
-+++ new/gcc/config/arm/arm.c	2011-08-18 13:53:37 +0000
-@@ -7464,6 +7464,9 @@
- 	*total = COSTS_N_INSNS (4);
-       return true;
- 
-+    case SET:
-+      return false;
-+
-     default:
-       *total = COSTS_N_INSNS (4);
-       return false;
-@@ -7811,6 +7814,9 @@
-       *total = COSTS_N_INSNS (1) + 1;
-       return true;
- 
-+    case SET:
-+      return false;
-+
-     default:
-       if (mode != VOIDmode)
- 	*total = COSTS_N_INSNS (ARM_NUM_REGS (mode));
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index fcdccf5..882876e 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -39,7 +39,6 @@ file://linaro/gcc-4.6-linaro-r106786.patch \
 file://linaro/gcc-4.6-linaro-r106787.patch \
 file://linaro/gcc-4.6-linaro-r106789.patch \
 file://linaro/gcc-4.6-linaro-r106792.patch \
-file://linaro/gcc-4.6-linaro-r106793.patch \
 file://linaro/gcc-4.6-linaro-r106794.patch \
 file://linaro/gcc-4.6-linaro-r106796.patch \
 file://linaro/gcc-4.6-linaro-r106797.patch \
-- 
1.7.5.4



