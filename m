Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NR0KH-0006FL-6h
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 10:31:16 +0100
Received: by mail-px0-f183.google.com with SMTP id 13so6335645pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 01:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=OfqAqKYF77qA7KV7L/scE3195ucc9O9i/6//D0qdMM4=;
	b=lj+tDBbIAFk0NdQiCb88g7FqAIbWezsxA08/KUpwrtf/89NYuS/xp1tsv0debUfFav
	0M8/X6ZssfQnCUDnDbFIwg1GNyzGnlr/2Pj/sl8va3OmioLL7em8GcbeJdZ/wtq18qzh
	qkEOI4J0zJXZBA366DtS+aZmwPeV1dbVL0Qxs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZTNTuf0009MrMc5hu0SN7Ne+TPlC58KVG7RxyTeXjVmqu4kVxRU6hQCBoQvMjsYvFZ
	wsBqTfafe4+6/IMHg6lWRqit7nTN2YR5KWAkg/qcBwMfcecD9Ajl8t8Cz7foxx+eEoD8
	f8lfiESHkEUI8g2/VeLip7tiuxBGcvqHd1DcU=
Received: by 10.142.75.21 with SMTP id x21mr14558554wfa.150.1262424554358;
	Sat, 02 Jan 2010 01:29:14 -0800 (PST)
Received: from localhost ([123.54.101.56])
	by mx.google.com with ESMTPS id 20sm16020564pzk.1.2010.01.02.01.29.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 02 Jan 2010 01:29:14 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jan 2010 17:29:03 +0800
Message-Id: <1262424543-21993-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix the wrong setting in qemumips/uClibc.machine
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
X-List-Received-Date: Sat, 02 Jan 2010 09:31:16 -0000

* In the previous version, the qemumips/uClibc.machine is copied from qemux86/uClibc.machine without any modification, which causes the compilation of uClibc for qemumips failed.

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 .../uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine |   49 +++++++++-----------
 1 files changed, 22 insertions(+), 27 deletions(-)

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



