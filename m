Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhNjk-0003Uz-LV
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 15:49:44 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtIFAGcgPU1bdWOb/2dsb2JhbACEE5I4jxCrGpAugSSDOHQEiyA
X-IronPort-AV: E=Sophos;i="4.60,370,1291590000"; d="scan'208";a="800176472"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Jan 2011 15:49:01 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNj2-0006W5-OT; Mon, 24 Jan 2011 15:49:00 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNj2-0007lr-L2; Mon, 24 Jan 2011 15:49:00 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhNj2-0006LD-AK; Mon, 24 Jan 2011 15:49:00 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 15:48:58 +0100
Message-Id: <97b6dd6720dcdcdbd27616740b3707bc108a4927.1295880053.git.vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <cover.1295880053.git.vjaquez@igalia.com>
References: <cover.1295880053.git.vjaquez@igalia.com>
In-Reply-To: <cover.1295880053.git.vjaquez@igalia.com>
References: <cover.1295880053.git.vjaquez@igalia.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 1/2] u-boot-sakoman: fix break caused by the new binutils
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
X-List-Received-Date: Mon, 24 Jan 2011 14:49:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New assemblers need -march=armv7-a+sec on command line or .arch_extension sec
inline to enable use of the smc instruction.

This patch adds as-instr to check the latter to conditionally enable the
former in AFLAGS for files that use smc.

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 .../fix-break-caused-by-new-binutils.patch         |   31 ++++++++++++++++++++
 recipes/u-boot/u-boot-sakoman_git.bb               |    1 +
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binutils.patch

diff --git a/recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binutils.patch b/recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binutils.patch
new file mode 100644
index 0000000..16bc980
--- /dev/null
+++ b/recipes/u-boot/u-boot-sakoman/fix-break-caused-by-new-binutils.patch
@@ -0,0 +1,31 @@
+Index: git/arch/arm/cpu/armv7/omap4/Makefile
+===================================================================
+--- git.orig/arch/arm/cpu/armv7/omap4/Makefile
++++ git/arch/arm/cpu/armv7/omap4/Makefile
+@@ -26,6 +26,8 @@ include $(TOPDIR)/config.mk
+ LIB	=  $(obj)lib$(SOC).o
+ 
+ SOBJS	+= lowlevel_init.o
++plus_sec := $(call as-instr,.arch_extension sec,+sec)
++lowlevel_init.o: AFLAGS += -Wa,-march=armv7-a$(plus_sec)
+ 
+ COBJS	+= board.o
+ COBJS	+= mem.o
+Index: git/config.mk
+===================================================================
+--- git.orig/config.mk
++++ git/config.mk
+@@ -266,3 +266,13 @@ cmd_link_o_target = $(if $(strip $1),\
+ 		      rm -f $@; $(AR) rcs $@ )
+ 
+ #########################################################################
++
++# Tries to compile an assembly instruction
++as-instr = $(shell if echo -e "$(1)" | \
++            $(CC) $(AFLAGS) -c -xassembler - \
++             -o $(TMPOUT)astest$$$$.out > /dev/null 2>&1; \
++         then rm $(TMPOUT)astest$$$$.out; echo "$(2)"; \
++         else echo "$(3)"; fi)
++
++#########################################################################
++
diff --git a/recipes/u-boot/u-boot-sakoman_git.bb b/recipes/u-boot/u-boot-sakoman_git.bb
index 5b9ff11..8dfe713 100644
--- a/recipes/u-boot/u-boot-sakoman_git.bb
+++ b/recipes/u-boot/u-boot-sakoman_git.bb
@@ -7,6 +7,7 @@ SRCREV = "261733408a27d14590cf3ec6b596461808050e32"
 PV = "2010.12+${PR}+git${SRCREV}"
 
 SRC_URI = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
+	   file://fix-break-caused-by-new-binutils.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
1.7.0.2



