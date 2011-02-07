Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PmTQG-0002vf-8a
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 16:54:40 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p17Frat5025620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Feb 2011 16:53:36 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Mon,  7 Feb 2011 16:53:36 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Feb 2011 16:53:06 +0100
Message-Id: <1297093986-24331-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.995
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] gcc-4.5: added thumb2 build patch
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
X-List-Received-Date: Mon, 07 Feb 2011 15:54:40 -0000

Fix for http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43999 and is
required to build gcc for Thumb2 only architectures (e.g. Cortex-M3).

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 recipes/gcc/gcc-4.5.inc                |    3 ++-
 recipes/gcc/gcc-4.5/thumb2-build.patch |   11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.5/thumb2-build.patch

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index b630528..9ba2e22 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r31"
+INC_PR = "r32"
 
 SRCREV = "168622"
 PV = "4.5"
@@ -166,6 +166,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 #	   file://linaro/gcc-4.5-linaro-r99457.patch \
 	   file://gcc-scalar-widening-pr45847.patch \
 	   file://gcc-arm-volatile-bitfield-fix.patch \
+	   file://thumb2-build.patch \
 	  "
 
 SRC_URI_append_mips64 = " file://mips64-nomultilib.patch "
diff --git a/recipes/gcc/gcc-4.5/thumb2-build.patch b/recipes/gcc/gcc-4.5/thumb2-build.patch
new file mode 100644
index 0000000..8fefbfa
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/thumb2-build.patch
@@ -0,0 +1,11 @@
+Index: gcc/config/arm/lib1funcs.asm
+===================================================================
+--- a/gcc/config/arm/lib1funcs.asm	(revision 163231)
++++ b/gcc/config/arm/lib1funcs.asm	(working copy)
+@@ -642,5 +642,5 @@
+ 	cmp	\dividend, #0			@ Early termination?
+-	do_it	hs, t
++	do_it	ne, t
+ 	movnes	\curbit,   \curbit,  lsr #4	@ No, any more bits to do?
+ 	movne	\divisor,  \divisor, lsr #4
+ 	bne	1b
-- 
1.7.4



