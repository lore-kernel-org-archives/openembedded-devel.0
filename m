Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1RYJSz-0006ds-CX
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 16:31:29 +0100
Received: from jcn (79.2.147.153) by smtp207.alice.it (8.6.023.02)
	id 4ED236CF0194740B; Wed, 7 Dec 2011 16:18:25 +0100
Received: from ao2 by jcn with local (Exim 4.77)
	(envelope-from <ospite@studenti.unina.it>)
	id 1RYJGE-0002El-VD; Wed, 07 Dec 2011 16:18:19 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2011 16:18:11 +0100
Message-Id: <1323271091-8549-1-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.7.3
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Subject: [oe-core][PATCH] gcc-4.6.inc: remove gcc-arm-set-cost.patch merged upstream
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
X-List-Received-Date: Wed, 07 Dec 2011 15:31:29 -0000

gcc-arm-set-cost.patch is not needed anymore as it has been merged
upstream, remove it.

Having it around breaks compilation with messages like:

.../gcc-4.6.2+svnr181430-r22/gcc-4_6-branch/gcc/config/arm/arm.c:7945:5: error: duplicate case value

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---

Hi,

please review this one with extra care ;)

Thanks,
   Antonio Ospite
   http://ao2.it

 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |   34 --------------------
 2 files changed, 1 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 18e0536..e6a9b1a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r19"
+PR = "r20"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -72,7 +72,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://pr46934.patch \
 	   file://pr32219.patch \
 	   file://pr47551.patch \
-	   file://gcc-arm-set-cost.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
deleted file mode 100644
index 04dabaf..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
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
-- 
1.7.7.3



