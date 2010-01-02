Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NQyXX-00028G-Fg
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 08:36:50 +0100
Received: by pwi18 with SMTP id 18so8578120pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jan 2010 23:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=El3ryxuSzgidiEKLgut0ojdMxDINK4D7wtyjv7tKrGs=;
	b=PhwLWgA1swg7CfJ5tGkJgSSatg3F+3l8fwH/KOWD2pN0wzq/5uQ38vEaai7CAv/Vqv
	mDw5H1z1ly1+0RGKOX3kmycrhdzsSmVmkT4aZK6Nod56bn9z/DoNNEXWqemT0NZJb2Ar
	1YLEq1IdhVe1wOfWUONUxcQqoTv5DO5WuI3CU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=skxaTfuxWp6ftoX0johBkaojIsdqnFMyQLPQOa04MbdRnWWcRqTAOx3G2896KuoILM
	SKYfaEBucWpLD+0rydc48rswrPRLtoD3sO1vDzu8Om4CjKqI861GJkdGDxNS5AUNbFeG
	eat7stjJt/eBPcrTWf0DSo2djHYsYA9uN9lJ8=
Received: by 10.142.2.14 with SMTP id 14mr6746562wfb.93.1262417685883;
	Fri, 01 Jan 2010 23:34:45 -0800 (PST)
Received: from localhost ([123.54.101.56])
	by mx.google.com with ESMTPS id 21sm15941365pzk.11.2010.01.01.23.34.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 01 Jan 2010 23:34:45 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2010 15:34:34 +0800
Message-Id: <1262417674-26652-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix compiling error of uclibc-initial-0.9.30.1 due to incorrect uClibc.machine for qemumips
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
X-List-Received-Date: Sat, 02 Jan 2010 07:36:50 -0000

1. Add mips entry for linux-uclibc into package_qa_get_machine_dict of insane.bbclass. Without it the insance check will fail due to key miss exception.
2. Rewrite the complete qemumips/uClibc.machine, In the previous one, the TARGET_ARCH is set i386 (not mips).
---
 classes/insane.bbclass                             |    1 +
 .../uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine |   49 +++++++++-----------
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 495c3a5..804caf0 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -61,6 +61,7 @@ def package_qa_get_machine_dict():
                         "i486":       (   3,     0,    0,          True,          True),
                         "i586":       (   3,     0,    0,          True,          True),
                         "i686":       (   3,     0,    0,          True,          True),
+                        "mips":       (   8,     0,    0,          False,         True),
                         "mipsel":     (   8,     0,    0,          True,          True),
                         "avr32":      (6317,     0,    0,          False,         True),
 			"sh4":        (42,	 0,    0,          True,          True),
diff --git a/recipes/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine b/recipes/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
index 44fec16..1cf1add 100644
--- a/recipes/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
+++ b/recipes/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
@@ -1,21 +1,22 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
+# Wed Jul  9 13:37:36 2008
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
 # TARGET_frv is not set
 # TARGET_h8300 is not set
 # TARGET_hppa is not set
-TARGET_i386=y
+# TARGET_i386 is not set
 # TARGET_i960 is not set
 # TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
-# TARGET_mips is not set
+TARGET_mips=y
 # TARGET_nios is not set
 # TARGET_nios2 is not set
 # TARGET_powerpc is not set
@@ -25,44 +26,38 @@ TARGET_i386=y
 # TARGET_v850 is not set
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
+# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="i386"
+TARGET_ARCH="mips"
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
+ARCH_CFLAGS="-mno-split-addresses"
+CONFIG_MIPS_O32_ABI=y
+# CONFIG_MIPS_N32_ABI is not set
+# CONFIG_MIPS_N64_ABI is not set
+# CONFIG_MIPS_ISA_1 is not set
+# CONFIG_MIPS_ISA_2 is not set
+# CONFIG_MIPS_ISA_3 is not set
+# CONFIG_MIPS_ISA_4 is not set
+CONFIG_MIPS_ISA_MIPS32=y
+# CONFIG_MIPS_ISA_MIPS64 is not set
 TARGET_SUBARCH=""
 
 #
 # Using ELF file format
 #
-ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+ARCH_ANY_ENDIAN=y
+# ARCH_BIG_ENDIAN is not set
+ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_WANTS_LITTLE_ENDIAN=y
 ARCH_HAS_MMU=y
 ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
+# DO_C99_MATH is not set
+# UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
 
-- 
1.5.4.3



