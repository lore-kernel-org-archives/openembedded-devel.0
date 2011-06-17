Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QXc6x-0003Nh-BR
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jun 2011 18:41:38 +0200
Received: by pzk36 with SMTP id 36so2180984pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2011 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=VV+t8I7AVqo8VdZW/7iw4tbqDbBa6hQl+NwvVeNd6ZI=;
	b=FcB66i/7GsEXhtALyE7pO7Xr5yq1v4+iRChp8m8Sf9/UXUNUF8oxUwVQpv5GuihKLz
	NtOzsvQYVfJtVvpz15Ta+TforABgCgy3irCc5yoq1aWf/xUBMonlPNcwJq/akcbuZlMM
	QTt52IgqRrdwDvmAXo1t0nLipSjZ6etl/tzdk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pkT5FIlBnAFlUAB9kqttvbe3xhJMj2euLAEsuDCklq70O2qz0kcUptgX8ySA1R05RC
	jTyW1zkbl2pfGPYr7BdLy1btIgcqP0dGG0TW9A7t5m7QaETIYXbBtZu8nJyK7mNNVg+i
	nNLPo1HQYirz/s0SJdTag0LFOYqmmDZ/mxRq8=
Received: by 10.68.44.137 with SMTP id e9mr1102319pbm.288.1308328685705;
	Fri, 17 Jun 2011 09:38:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 10sm1566705pbk.93.2011.06.17.09.38.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 09:38:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2011 09:37:23 -0700
Message-Id: <1308328643-15069-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-oe][PATCH] gcc-4.5: Upgrade to latest gcc-4_5-branch and linaro 4.5
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
X-List-Received-Date: Fri, 17 Jun 2011 16:41:38 -0000

Additionally fix ppc build break caused by linaro android config
patches.

Angstrom console-image built clean from scratch for arm ppc mips x86 x86_64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |   32 +-
 .../gcc/gcc-4.5/gcc-ppc-config-fix.patch           |  227 +
 .../gcc-4.5/gcc-ppc-include-config-linux.h.patch   |   73 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch |  278 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch | 6070 ++++++++++++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch |   26 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch |   21 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch |   20 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch |   24 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch |  582 ++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch |   32 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch |   45 +
 12 files changed, 7213 insertions(+), 217 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 7c166f2..774ee51 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,14 +14,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-INC_PR = "r36"
-# BINV should  point to minor release 
-BINV = "${PV}.3"
+INC_PR = "r37"
 
-SRC_URI[md5sum] = "8e0b5c12212e185f3e4383106bfa9cc6"
-SRC_URI[sha256sum] = "0a8847af44a9b33813b199997a73139517c96adfd519eaf24c79d4d9d09f65de"
+# BINV should be incremented after updating to a revision
+# after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
+# the value will be minor-release+1 e.g. if minor release was
+# 4.5.1 then the value below will be 2 which will mean 4.5.2
+# which will be next minor release and so on.
 
-SRC_URI = "${GNU_MIRROR}/gcc/gcc-${BINV}/gcc-${BINV}.tar.bz2 \
+BINV = "${PV}.4"
+
+SRCREV = 175127
+BRANCH = "gcc-4_5-branch"
+PR_append = "+svnr${SRCPV}"
+
+SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
        file://100-uclibc-conf.patch \
        file://gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -177,6 +184,15 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${BINV}/gcc-${BINV}.tar.bz2 \
        file://linaro/gcc-4.5-linaro-r99495.patch \
        file://linaro/gcc-4.5-linaro-r99498.patch \
        file://linaro/gcc-4.5-linaro-r99502.patch \
+       file://linaro/gcc-4.5-linaro-r99503.patch \
+       file://linaro/gcc-4.5-linaro-r99504.patch \
+       file://linaro/gcc-4.5-linaro-r99506.patch \
+       file://linaro/gcc-4.5-linaro-r99507.patch \
+       file://linaro/gcc-4.5-linaro-r99510.patch \
+       file://linaro/gcc-4.5-linaro-r99511.patch \
+       file://linaro/gcc-4.5-linaro-r99514.patch \
+       file://linaro/gcc-4.5-linaro-r99516.patch \
+	\
        file://more-epilogues.patch \
        file://gcc-scalar-widening-pr45847.patch \
        file://gcc-arm-volatile-bitfield-fix.patch \
@@ -198,13 +214,15 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${BINV}/gcc-${BINV}.tar.bz2 \
        file://COLLECT_GCC_OPTIONS.patch \
        file://gcc-poison-dir-extend.patch \
        file://gcc-poison-parameters.patch \
+       file://gcc-ppc-config-fix.patch \
+       file://gcc-ppc-include-config-linux.h.patch \
        "
 
 # Language Overrides
 FORTRAN = ""
 JAVA = ""
 
-S = "${WORKDIR}/gcc-${BINV}"
+S = "${WORKDIR}/${BRANCH}"
 
 #EXTRA_OECONF_BASE = "  --enable-cheaders=c_std \
 #			--enable-libssp \
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
new file mode 100644
index 0000000..9c2c298
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-config-fix.patch
@@ -0,0 +1,227 @@
+commit de784bee66a1ec1d0dad00d9eedbe9b1667dd883
+Author: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date:   Mon Dec 20 15:29:31 2010 +0000
+
+    	* config/rs6000/freebsd.h (SVR4_ASM_SPEC): Don't define.
+    	(DBX_REGISTER_NUMBER): Define.
+    	* config/rs6000/lynx.h (DBX_REGISTER_NUMBER): Define.
+    	* config/rs6000/netbsd.h (DBX_REGISTER_NUMBER): Define.
+    	* config/rs6000/sysv4.h (SIZE_TYPE): Define.
+    	(ASM_SPEC): Define without using SVR4_ASM_SPEC.
+    	(DBX_REGISTER_NUMBER): Undefine.
+    	* config.gcc (powerpc-*-eabispe*, powerpc-*-eabisimaltivec*,
+    	powerpc-*-eabisim*, powerpc-*-elf*, powerpc-*-eabialtivec*,
+    	powerpc-xilinx-eabi*, powerpc-*-eabi*, powerpc-*-rtems*,
+    	powerpc-*-linux* | powerpc64-*-linux*, powerpc64-*-gnu*,
+    	powerpc-*-gnu-gnualtivec*, powerpc-*-gnu*,
+    	powerpc-wrs-vxworks|powerpc-wrs-vxworksae, powerpcle-*-elf*,
+    	powerpcle-*-eabisim*, powerpcle-*-eabi*): Don't use svr4.h.
+    
+    
+    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@168085 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Index: gcc-4.5.3/gcc/config.gcc
+===================================================================
+--- gcc-4.5.3.orig/gcc/config.gcc	2011-06-15 21:18:55.000000000 -0700
++++ gcc-4.5.3/gcc/config.gcc	2011-06-16 15:01:07.945285352 -0700
+@@ -1989,53 +1989,53 @@
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	;;
+ powerpc-*-eabispe*)
+-	tm_file="${tm_file} dbxelf.h elfos.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabispe.h"
++	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabispe.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-spe rs6000/t-ppccomm"
+ 	use_gcc_stdint=wrap
+ 	;;
+ powerpc-*-eabisimaltivec*)
+-	tm_file="${tm_file} dbxelf.h elfos.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabisim.h rs6000/eabialtivec.h"
++	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabisim.h rs6000/eabialtivec.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcendian rs6000/t-ppccomm"
+ 	use_gcc_stdint=wrap
+ 	;;
+ powerpc-*-eabisim*)
+-	tm_file="${tm_file} dbxelf.h elfos.h usegas.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabisim.h"
++	tm_file="${tm_file} dbxelf.h elfos.h usegas.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabisim.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm"
+ 	use_gcc_stdint=wrap
+ 	;;
+ powerpc-*-elf*)
+-	tm_file="${tm_file} dbxelf.h elfos.h usegas.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h"
++	tm_file="${tm_file} dbxelf.h elfos.h usegas.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm"
+ 	;;
+ powerpc-*-eabialtivec*)
+-	tm_file="${tm_file} dbxelf.h elfos.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabialtivec.h"
++	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/eabialtivec.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcendian rs6000/t-ppccomm"
+ 	use_gcc_stdint=wrap
+ 	;;
+ powerpc-xilinx-eabi*)
+-	tm_file="${tm_file} dbxelf.h elfos.h usegas.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/singlefp.h rs6000/xfpu.h rs6000/xilinx.h"
++	tm_file="${tm_file} dbxelf.h elfos.h usegas.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/singlefp.h rs6000/xfpu.h rs6000/xilinx.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm rs6000/t-xilinx"
+ 	use_gcc_stdint=wrap
+ 	;;
+ powerpc-*-eabi*)
+-	tm_file="${tm_file} dbxelf.h elfos.h usegas.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h"
++	tm_file="${tm_file} dbxelf.h elfos.h usegas.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm"
+ 	use_gcc_stdint=wrap
+ 	;;
+ powerpc-*-rtems*)
+-	tm_file="${tm_file} dbxelf.h elfos.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/rtems.h rtems.h"
++	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/eabi.h rs6000/e500.h rs6000/rtems.h rtems.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-rtems t-rtems rs6000/t-ppccomm"
+ 	;;
+ powerpc-*-linux* | powerpc64-*-linux*)
+-	tm_file="${tm_file} dbxelf.h elfos.h svr4.h freebsd-spec.h rs6000/sysv4.h"
++	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="t-dfprules rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
+ 	maybe_biarch=yes
+@@ -2079,12 +2079,12 @@
+ 	fi
+ 	;;
+ powerpc64-*-gnu*)
+-	tm_file="${tm_file} elfos.h svr4.h freebsd-spec.h gnu.h rs6000/sysv4.h rs6000/default64.h rs6000/linux64.h rs6000/gnu.h glibc-stdint.h"
++	tm_file="${tm_file} elfos.h freebsd-spec.h gnu.h rs6000/sysv4.h rs6000/default64.h rs6000/linux64.h rs6000/gnu.h glibc-stdint.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt rs6000/linux64.opt"
+ 	tmake_file="t-slibgcc-elf-ver t-slibgcc-libgcc t-gnu"
+ 	;;
+ powerpc-*-gnu-gnualtivec*)
+-	tm_file="${cpu_type}/${cpu_type}.h elfos.h svr4.h freebsd-spec.h gnu.h rs6000/sysv4.h rs6000/linux.h rs6000/linuxaltivec.h rs6000/gnu.h glibc-stdint.h"
++	tm_file="${cpu_type}/${cpu_type}.h elfos.h freebsd-spec.h gnu.h rs6000/sysv4.h rs6000/linux.h rs6000/linuxaltivec.h rs6000/gnu.h glibc-stdint.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcos t-slibgcc-elf-ver t-slibgcc-libgcc t-gnu rs6000/t-ppccomm"
+ 	if test x$enable_threads = xyes; then
+@@ -2092,7 +2092,7 @@
+ 	fi
+ 	;;
+ powerpc-*-gnu*)
+-	tm_file="${cpu_type}/${cpu_type}.h elfos.h svr4.h freebsd-spec.h gnu.h rs6000/sysv4.h rs6000/linux.h rs6000/gnu.h glibc-stdint.h"
++	tm_file="${cpu_type}/${cpu_type}.h elfos.h freebsd-spec.h gnu.h rs6000/sysv4.h rs6000/linux.h rs6000/gnu.h glibc-stdint.h"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcos t-slibgcc-elf-ver t-slibgcc-libgcc t-gnu rs6000/t-ppccomm"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	if test x$enable_threads = xyes; then
+@@ -2100,7 +2100,7 @@
+ 	fi
+ 	;;
+ powerpc-wrs-vxworks|powerpc-wrs-vxworksae)
+-	tm_file="${tm_file} elfos.h svr4.h freebsd-spec.h rs6000/sysv4.h"
++	tm_file="${tm_file} elfos.h freebsd-spec.h rs6000/sysv4.h"
+ 	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppccomm rs6000/t-vxworks"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	extra_headers=ppc-asm.h
+@@ -2126,18 +2126,18 @@
+ 	gas=yes
+ 	;;
+ powerpcle-*-elf*)
+-	tm_file="${tm_file} dbxelf.h elfos.h usegas.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/sysv4le.h"
++	tm_file="${tm_file} dbxelf.h elfos.h usegas.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/sysv4le.h"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	;;
+ powerpcle-*-eabisim*)
+-	tm_file="${tm_file} dbxelf.h elfos.h usegas.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/sysv4le.h rs6000/eabi.h rs6000/e500.h rs6000/eabisim.h"
++	tm_file="${tm_file} dbxelf.h elfos.h usegas.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/sysv4le.h rs6000/eabi.h rs6000/e500.h rs6000/eabisim.h"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	use_gcc_stdint=wrap
+ 	;;
+ powerpcle-*-eabi*)
+-	tm_file="${tm_file} dbxelf.h elfos.h usegas.h svr4.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/sysv4le.h rs6000/eabi.h rs6000/e500.h"
++	tm_file="${tm_file} dbxelf.h elfos.h usegas.h freebsd-spec.h newlib-stdint.h rs6000/sysv4.h rs6000/sysv4le.h rs6000/eabi.h rs6000/e500.h"
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-ppcgas rs6000/t-ppccomm"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	use_gcc_stdint=wrap
+Index: gcc-4.5.3/gcc/config/rs6000/freebsd.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/rs6000/freebsd.h	2009-08-10 11:23:57.000000000 -0700
++++ gcc-4.5.3/gcc/config/rs6000/freebsd.h	2011-06-16 15:02:02.775285339 -0700
+@@ -69,6 +69,4 @@
+ /* Override rs6000.h definition.  */
+ #undef  ASM_APP_OFF
+ #define ASM_APP_OFF "#NO_APP\n"
+-/* Define SVR4_ASM_SPEC, we use GAS by default. See svr4.h for details.  */
+-#define SVR4_ASM_SPEC \
+-  "%{v:-V} %{Wa,*:%*}"
++#define DBX_REGISTER_NUMBER(REGNO) rs6000_dbx_register_number (REGNO)
+Index: gcc-4.5.3/gcc/config/rs6000/lynx.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/rs6000/lynx.h	2007-08-02 03:49:31.000000000 -0700
++++ gcc-4.5.3/gcc/config/rs6000/lynx.h	2011-06-16 15:01:07.945285352 -0700
+@@ -1,5 +1,5 @@
+ /* Definitions for Rs6000 running LynxOS.
+-   Copyright (C) 1995, 1996, 2000, 2002, 2003, 2004, 2005, 2007
++   Copyright (C) 1995, 1996, 2000, 2002, 2003, 2004, 2005, 2007, 2010
+    Free Software Foundation, Inc.
+    Contributed by David Henkel-Wallace, Cygnus Support (gumby@cygnus.com)
+    Rewritten by Adam Nemet, LynuxWorks Inc.
+@@ -105,6 +105,8 @@
+ #undef HAVE_AS_TLS
+ #define HAVE_AS_TLS 0
+ 
++#define DBX_REGISTER_NUMBER(REGNO) rs6000_dbx_register_number (REGNO)
++
+ #ifdef CRT_BEGIN
+ /* This function is part of crtbegin*.o which is at the beginning of
+    the link and is called from .fini which is usually toward the end
+Index: gcc-4.5.3/gcc/config/rs6000/netbsd.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/rs6000/netbsd.h	2009-02-20 07:20:38.000000000 -0800
++++ gcc-4.5.3/gcc/config/rs6000/netbsd.h	2011-06-16 15:01:07.945285352 -0700
+@@ -1,6 +1,6 @@
+ /* Definitions of target machine for GNU compiler,
+    for PowerPC NetBSD systems.
+-   Copyright 2002, 2003, 2007, 2008 Free Software Foundation, Inc.
++   Copyright 2002, 2003, 2007, 2008, 2010 Free Software Foundation, Inc.
+    Contributed by Wasabi Systems, Inc.
+ 
+    This file is part of GCC.
+@@ -89,3 +89,5 @@
+ 
+ #undef  TARGET_VERSION
+ #define TARGET_VERSION fprintf (stderr, " (NetBSD/powerpc ELF)");
++
++#define DBX_REGISTER_NUMBER(REGNO) rs6000_dbx_register_number (REGNO)
+Index: gcc-4.5.3/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/rs6000/sysv4.h	2011-06-15 21:18:57.000000000 -0700
++++ gcc-4.5.3/gcc/config/rs6000/sysv4.h	2011-06-16 15:01:07.945285352 -0700
+@@ -293,6 +293,10 @@
+ #define	RESTORE_FP_PREFIX "_restfpr_"
+ #define RESTORE_FP_SUFFIX ""
+ 
++/* Type used for size_t, as a string used in a declaration.  */
++#undef  SIZE_TYPE
++#define SIZE_TYPE "unsigned int"
++
+ /* Type used for ptrdiff_t, as a string used in a declaration.  */
+ #define PTRDIFF_TYPE "int"
+ 
+@@ -588,9 +592,8 @@
+ /* Override svr4.h definition.  */
+ #undef	ASM_SPEC
+ #define	ASM_SPEC "%(asm_cpu) \
+-%{,assembler|,assembler-with-cpp: %{mregnames} %{mno-regnames}}" \
+-SVR4_ASM_SPEC \
+-"%{mrelocatable} %{mrelocatable-lib} %{fpic|fpie|fPIC|fPIE:-K PIC} \
++%{,assembler|,assembler-with-cpp: %{mregnames} %{mno-regnames}} \
++%{mrelocatable} %{mrelocatable-lib} %{fpic|fpie|fPIC|fPIE:-K PIC} \
+ %{memb|msdata=eabi: -memb} \
+ %{mlittle|mlittle-endian:-mlittle; \
+   mbig|mbig-endian      :-mbig;    \
+@@ -1127,3 +1130,5 @@
+ 
+ /* This target uses the sysv4.opt file.  */
+ #define TARGET_USES_SYSV4_OPT 1
++
++#undef DBX_REGISTER_NUMBER
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch
new file mode 100644
index 0000000..97364d9
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-ppc-include-config-linux.h.patch
@@ -0,0 +1,73 @@
+The patch is a solution for https://bugs.launchpad.net/ubuntu/+source/gcc-4.5/+bug/768921
+
+-Khem
+
+Index: gcc-4_5-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config.gcc	2011-06-16 21:23:22.000000000 -0700
++++ gcc-4_5-branch/gcc/config.gcc	2011-06-16 21:51:20.845279713 -0700
+@@ -2035,7 +2035,7 @@
+ 	tmake_file="rs6000/t-fprules rs6000/t-fprules-fpbit rs6000/t-rtems t-rtems rs6000/t-ppccomm"
+ 	;;
+ powerpc-*-linux* | powerpc64-*-linux*)
+-	tm_file="${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"
++	tm_file="${tm_file} dbxelf.h elfos.h linux.h freebsd-spec.h rs6000/sysv4.h"
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="t-dfprules rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
+ 	maybe_biarch=yes
+Index: gcc-4_5-branch/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/rs6000/sysv4.h	2011-06-16 21:23:22.000000000 -0700
++++ gcc-4_5-branch/gcc/config/rs6000/sysv4.h	2011-06-16 22:08:49.425279473 -0700
+@@ -620,6 +620,7 @@
+ #define CC1_SECURE_PLT_DEFAULT_SPEC ""
+ #endif
+ 
++#undef CC1_SPEC
+ /* Pass -G xxx to the compiler and set correct endian mode.  */
+ #define	CC1_SPEC "%{G*} %(cc1_cpu) \
+ %{mlittle|mlittle-endian: %(cc1_endian_little);           \
+@@ -903,22 +904,13 @@
+ #define LINK_START_LINUX_SPEC ""
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+-#if DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
+-#elif DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
+-#else
+-#error "Unsupported DEFAULT_LIBC"
+-#endif
+-#define LINUX_DYNAMIC_LINKER \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
+ 
+ #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+   %{!dynamic-linker:-dynamic-linker " LINUX_DYNAMIC_LINKER "}}}"
+ 
+ #if defined(HAVE_LD_EH_FRAME_HDR)
++# undef LINK_EH_SPEC
+ # define LINK_EH_SPEC "--no-add-needed %{!static:--eh-frame-hdr} "
+ #endif
+ 
+@@ -1113,6 +1105,7 @@
+    be stacked, so that invocations of #pragma pack(pop)' will return
+    to the previous value.  */
+ 
++#undef HANDLE_PRAGMA_PACK_PUSH_POP
+ #define HANDLE_PRAGMA_PACK_PUSH_POP 1
+ 
+ /* Select a format to encode pointers in exception handling data.  CODE
+Index: gcc-4_5-branch/gcc/config/freebsd-spec.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/freebsd-spec.h	2011-06-16 17:59:03.000000000 -0700
++++ gcc-4_5-branch/gcc/config/freebsd-spec.h	2011-06-16 22:11:34.145279435 -0700
+@@ -154,6 +154,7 @@
+ #endif
+ 
+ #if defined(HAVE_LD_EH_FRAME_HDR)
++#undef LINK_EH_SPEC
+ #define LINK_EH_SPEC "%{!static:--eh-frame-hdr} "
+ #endif
+ 
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
index aa9d6aa..ec0eebd 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
@@ -98,8 +98,8 @@
 === added file 'gcc/config/arm/arm-ldmstm.ml'
 Index: gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml
 ===================================================================
---- /dev/null
-+++ gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml	2011-06-16 18:46:26.355282255 -0700
 @@ -0,0 +1,333 @@
 +(* Auto-generate ARM ldm/stm patterns
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -436,9 +436,9 @@ Index: gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml
 +  patterns ();
 Index: gcc-4_5-branch/gcc/config/arm/arm-protos.h
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm-protos.h
-+++ gcc-4_5-branch/gcc/config/arm/arm-protos.h
-@@ -100,14 +100,11 @@ extern int symbol_mentioned_p (rtx);
+--- gcc-4_5-branch.orig/gcc/config/arm/arm-protos.h	2011-06-16 18:46:18.000000000 -0700
++++ gcc-4_5-branch/gcc/config/arm/arm-protos.h	2011-06-16 18:46:26.355282255 -0700
+@@ -99,14 +99,11 @@
  extern int label_mentioned_p (rtx);
  extern RTX_CODE minmax_code (rtx);
  extern int adjacent_mem_locations (rtx, rtx);
@@ -460,9 +460,9 @@ Index: gcc-4_5-branch/gcc/config/arm/arm-protos.h
  extern enum machine_mode arm_select_dominance_cc_mode (rtx, rtx,
 Index: gcc-4_5-branch/gcc/config/arm/arm.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.c
-+++ gcc-4_5-branch/gcc/config/arm/arm.c
-@@ -753,6 +753,12 @@ static const char * const arm_condition_
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.c	2011-06-16 18:46:23.000000000 -0700
++++ gcc-4_5-branch/gcc/config/arm/arm.c	2011-06-16 18:46:26.365282255 -0700
+@@ -753,6 +753,12 @@
    "hi", "ls", "ge", "lt", "gt", "le", "al", "nv"
  };
  
@@ -475,7 +475,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  #define ARM_LSL_NAME (TARGET_UNIFIED_ASM ? "lsl" : "asl")
  #define streq(string1, string2) (strcmp (string1, string2) == 0)
  
-@@ -9680,24 +9686,125 @@ adjacent_mem_locations (rtx a, rtx b)
+@@ -9668,24 +9674,125 @@
    return 0;
  }
  
@@ -612,7 +612,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
    /* Loop over the operands and check that the memory references are
       suitable (i.e. immediate offsets from the same base register).  At
-@@ -9735,32 +9842,30 @@ load_multiple_sequence (rtx *operands, i
+@@ -9723,32 +9830,30 @@
  	  if (i == 0)
  	    {
  	      base_reg = REGNO (reg);
@@ -659,7 +659,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  	}
        else
  	/* Not a suitable memory address.  */
-@@ -9769,167 +9874,90 @@ load_multiple_sequence (rtx *operands, i
+@@ -9757,167 +9862,90 @@
  
    /* All the useful information has now been extracted from the
       operands into unsorted_regs and unsorted_offsets; additionally,
@@ -888,7 +888,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
    /* Loop over the operands and check that the memory references are
       suitable (i.e. immediate offsets from the same base register).  At
-@@ -9964,32 +9992,32 @@ store_multiple_sequence (rtx *operands, 
+@@ -9952,32 +9980,32 @@
  	      && (GET_CODE (offset = XEXP (XEXP (operands[nops + i], 0), 1))
  		  == CONST_INT)))
  	{
@@ -937,7 +937,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  	}
        else
  	/* Not a suitable memory address.  */
-@@ -9998,111 +10026,65 @@ store_multiple_sequence (rtx *operands, 
+@@ -9986,111 +10014,65 @@
  
    /* All the useful information has now been extracted from the
       operands into unsorted_regs and unsorted_offsets; additionally,
@@ -1087,7 +1087,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
    /* XScale has load-store double instructions, but they have stricter
       alignment requirements than load-store multiple, so we cannot
-@@ -10139,18 +10121,10 @@ arm_gen_load_multiple (int base_regno, i
+@@ -10127,18 +10109,10 @@
        start_sequence ();
  
        for (i = 0; i < count; i++)
@@ -1109,7 +1109,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
        seq = get_insns ();
        end_sequence ();
-@@ -10159,41 +10133,40 @@ arm_gen_load_multiple (int base_regno, i
+@@ -10147,41 +10121,40 @@
      }
  
    result = gen_rtx_PARALLEL (VOIDmode,
@@ -1170,7 +1170,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
       the pros/cons of ldm/stm usage for XScale.  */
    if (low_irq_latency || (arm_tune_xscale && count <= 2 && ! optimize_size))
      {
-@@ -10202,18 +10175,10 @@ arm_gen_store_multiple (int base_regno, 
+@@ -10190,18 +10163,10 @@
        start_sequence ();
  
        for (i = 0; i < count; i++)
@@ -1192,7 +1192,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
        seq = get_insns ();
        end_sequence ();
-@@ -10222,29 +10187,319 @@ arm_gen_store_multiple (int base_regno, 
+@@ -10210,29 +10175,319 @@
      }
  
    result = gen_rtx_PARALLEL (VOIDmode,
@@ -1522,7 +1522,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  }
  
  int
-@@ -10280,20 +10535,21 @@ arm_gen_movmemqi (rtx *operands)
+@@ -10268,20 +10523,21 @@
    for (i = 0; in_words_to_go >= 2; i+=4)
      {
        if (in_words_to_go > 4)
@@ -1554,9 +1554,9 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  					       dstbase, &dstoffset));
 Index: gcc-4_5-branch/gcc/config/arm/arm.h
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.h
-+++ gcc-4_5-branch/gcc/config/arm/arm.h
-@@ -1143,6 +1143,9 @@ extern int arm_structure_size_boundary;
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.h	2011-06-16 18:46:20.000000000 -0700
++++ gcc-4_5-branch/gcc/config/arm/arm.h	2011-06-16 18:46:26.375282255 -0700
+@@ -1143,6 +1143,9 @@
    ((MODE) == TImode || (MODE) == EImode || (MODE) == OImode \
     || (MODE) == CImode || (MODE) == XImode)
  
@@ -1566,7 +1566,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.h
  /* The order in which register should be allocated.  It is good to use ip
     since no saving is required (though calls clobber it) and it never contains
     function parameters.  It is quite good to use lr since other calls may
-@@ -2823,4 +2826,8 @@ enum arm_builtins
+@@ -2821,4 +2824,8 @@
  #define NEED_INDICATE_EXEC_STACK	0
  #endif
  
@@ -1577,8 +1577,8 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.h
  #endif /* ! GCC_ARM_H */
 Index: gcc-4_5-branch/gcc/config/arm/arm.md
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.md
-+++ gcc-4_5-branch/gcc/config/arm/arm.md
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.md	2011-06-16 18:46:23.000000000 -0700
++++ gcc-4_5-branch/gcc/config/arm/arm.md	2011-06-16 18:46:26.375282255 -0700
 @@ -6282,7 +6282,7 @@
  
  ;; load- and store-multiple insns
@@ -1847,7 +1847,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.md
  
  ;; Move a block of memory if it is word aligned and MORE than 2 words long.
  ;; We could let this apply for blocks of less than this, but it clobbers so
-@@ -9031,8 +8804,8 @@
+@@ -9025,8 +8798,8 @@
  	if (REGNO (reg) == R0_REGNUM)
  	  {
  	    /* On thumb we have to use a write-back instruction.  */
@@ -1858,7 +1858,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.md
  	    size = TARGET_ARM ? 16 : 0;
  	  }
  	else
-@@ -9078,8 +8851,8 @@
+@@ -9072,8 +8845,8 @@
  	if (REGNO (reg) == R0_REGNUM)
  	  {
  	    /* On thumb we have to use a write-back instruction.  */
@@ -1869,7 +1869,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.md
  	    size = TARGET_ARM ? 16 : 0;
  	  }
  	else
-@@ -10672,87 +10445,6 @@
+@@ -10666,87 +10439,6 @@
    ""
  )
  
@@ -1957,7 +1957,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.md
  (define_split
    [(set (match_operand:SI 0 "s_register_operand" "")
  	(and:SI (ge:SI (match_operand:SI 1 "s_register_operand" "")
-@@ -11554,6 +11246,8 @@
+@@ -11549,6 +11241,8 @@
    "
  )
  
@@ -1968,8 +1968,8 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.md
  ;; Load the Maverick co-processor patterns
 Index: gcc-4_5-branch/gcc/config/arm/ldmstm.md
 ===================================================================
---- /dev/null
-+++ gcc-4_5-branch/gcc/config/arm/ldmstm.md
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/config/arm/ldmstm.md	2011-06-16 18:46:26.375282255 -0700
 @@ -0,0 +1,1191 @@
 +/* ARM ldm/stm instruction patterns.  This file was automatically generated
 +   using arm-ldmstm.ml.  Please do not edit manually.
@@ -3164,8 +3164,8 @@ Index: gcc-4_5-branch/gcc/config/arm/ldmstm.md
 +
 Index: gcc-4_5-branch/gcc/config/arm/predicates.md
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/predicates.md
-+++ gcc-4_5-branch/gcc/config/arm/predicates.md
+--- gcc-4_5-branch.orig/gcc/config/arm/predicates.md	2011-06-16 18:46:18.000000000 -0700
++++ gcc-4_5-branch/gcc/config/arm/predicates.md	2011-06-16 18:46:26.375282255 -0700
 @@ -211,6 +211,11 @@
    (and (match_code "ior,xor,and")
         (match_test "mode == GET_MODE (op)")))
@@ -3314,9 +3314,9 @@ Index: gcc-4_5-branch/gcc/config/arm/predicates.md
    return true;
 Index: gcc-4_5-branch/gcc/config/i386/i386.md
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/i386/i386.md
-+++ gcc-4_5-branch/gcc/config/i386/i386.md
-@@ -4934,6 +4934,7 @@
+--- gcc-4_5-branch.orig/gcc/config/i386/i386.md	2011-06-16 18:46:21.000000000 -0700
++++ gcc-4_5-branch/gcc/config/i386/i386.md	2011-06-16 18:46:26.385282255 -0700
+@@ -4960,6 +4960,7 @@
     (set (match_operand:SSEMODEI24 2 "register_operand" "")
  	(fix:SSEMODEI24 (match_dup 0)))]
    "TARGET_SHORTEN_X87_SSE
@@ -3324,7 +3324,7 @@ Index: gcc-4_5-branch/gcc/config/i386/i386.md
     && peep2_reg_dead_p (2, operands[0])"
    [(set (match_dup 2) (fix:SSEMODEI24 (match_dup 1)))]
    "")
-@@ -20036,15 +20037,14 @@
+@@ -20057,15 +20058,14 @@
  ;;  leal    (%edx,%eax,4), %eax
  
  (define_peephole2
@@ -3345,7 +3345,7 @@ Index: gcc-4_5-branch/gcc/config/i386/i386.md
  		   (clobber (reg:CC FLAGS_REG))])]
    "INTVAL (operands[2]) >= 0 && INTVAL (operands[2]) <= 3
     /* Validate MODE for lea.  */
-@@ -20053,31 +20053,27 @@
+@@ -20074,31 +20074,27 @@
  	    || GET_MODE (operands[0]) == HImode))
         || GET_MODE (operands[0]) == SImode
         || (TARGET_64BIT && GET_MODE (operands[0]) == DImode))
@@ -3389,87 +3389,11 @@ Index: gcc-4_5-branch/gcc/config/i386/i386.md
    operands[0] = dest;
  })
  
-Index: gcc-4_5-branch/gcc/df-problems.c
-===================================================================
---- gcc-4_5-branch.orig/gcc/df-problems.c
-+++ gcc-4_5-branch/gcc/df-problems.c
-@@ -3748,9 +3748,22 @@ df_simulate_find_defs (rtx insn, bitmap 
-   for (def_rec = DF_INSN_UID_DEFS (uid); *def_rec; def_rec++)
-     {
-       df_ref def = *def_rec;
--      /* If the def is to only part of the reg, it does
--	 not kill the other defs that reach here.  */
--      if (!(DF_REF_FLAGS (def) & (DF_REF_PARTIAL | DF_REF_CONDITIONAL)))
-+      bitmap_set_bit (defs, DF_REF_REGNO (def));
-+    }
-+}
-+
-+/* Find the set of real DEFs, which are not clobbers, for INSN.  */
-+
-+void
-+df_simulate_find_noclobber_defs (rtx insn, bitmap defs)
-+{
-+  df_ref *def_rec;
-+  unsigned int uid = INSN_UID (insn);
-+
-+  for (def_rec = DF_INSN_UID_DEFS (uid); *def_rec; def_rec++)
-+    {
-+      df_ref def = *def_rec;
-+      if (!(DF_REF_FLAGS (def) & (DF_REF_MUST_CLOBBER | DF_REF_MAY_CLOBBER)))
- 	bitmap_set_bit (defs, DF_REF_REGNO (def));
-     }
- }
-@@ -3921,7 +3934,7 @@ df_simulate_initialize_forwards (basic_b
-     {
-       df_ref def = *def_rec;
-       if (DF_REF_FLAGS (def) & DF_REF_AT_TOP)
--	bitmap_clear_bit (live, DF_REF_REGNO (def));
-+	bitmap_set_bit (live, DF_REF_REGNO (def));
-     }
- }
- 
-@@ -3942,7 +3955,7 @@ df_simulate_one_insn_forwards (basic_blo
-      while here the scan is performed forwards!  So, first assume that the
-      def is live, and if this is not true REG_UNUSED notes will rectify the
-      situation.  */
--  df_simulate_find_defs (insn, live);
-+  df_simulate_find_noclobber_defs (insn, live);
- 
-   /* Clear all of the registers that go dead.  */
-   for (link = REG_NOTES (insn); link; link = XEXP (link, 1))
-Index: gcc-4_5-branch/gcc/df.h
-===================================================================
---- gcc-4_5-branch.orig/gcc/df.h
-+++ gcc-4_5-branch/gcc/df.h
-@@ -978,6 +978,7 @@ extern void df_note_add_problem (void);
- extern void df_md_add_problem (void);
- extern void df_md_simulate_artificial_defs_at_top (basic_block, bitmap);
- extern void df_md_simulate_one_insn (basic_block, rtx, bitmap);
-+extern void df_simulate_find_noclobber_defs (rtx, bitmap);
- extern void df_simulate_find_defs (rtx, bitmap);
- extern void df_simulate_defs (rtx, bitmap);
- extern void df_simulate_uses (rtx, bitmap);
-Index: gcc-4_5-branch/gcc/fwprop.c
-===================================================================
---- gcc-4_5-branch.orig/gcc/fwprop.c
-+++ gcc-4_5-branch/gcc/fwprop.c
-@@ -228,7 +228,10 @@ single_def_use_enter_block (struct dom_w
- 
-   process_uses (df_get_artificial_uses (bb_index), DF_REF_AT_TOP);
-   process_defs (df_get_artificial_defs (bb_index), DF_REF_AT_TOP);
--  df_simulate_initialize_forwards (bb, local_lr);
-+
-+  /* We don't call df_simulate_initialize_forwards, as it may overestimate
-+     the live registers if there are unused artificial defs.  We prefer
-+     liveness to be underestimated.  */
- 
-   FOR_BB_INSNS (bb, insn)
-     if (INSN_P (insn))
 Index: gcc-4_5-branch/gcc/genoutput.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/genoutput.c
-+++ gcc-4_5-branch/gcc/genoutput.c
-@@ -266,6 +266,8 @@ output_operand_data (void)
+--- gcc-4_5-branch.orig/gcc/genoutput.c	2011-06-16 17:59:04.000000000 -0700
++++ gcc-4_5-branch/gcc/genoutput.c	2011-06-16 18:46:26.385282255 -0700
+@@ -266,6 +266,8 @@
  
        printf ("    %d,\n", d->strict_low);
  
@@ -3480,9 +3404,9 @@ Index: gcc-4_5-branch/gcc/genoutput.c
        printf("  },\n");
 Index: gcc-4_5-branch/gcc/genrecog.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/genrecog.c
-+++ gcc-4_5-branch/gcc/genrecog.c
-@@ -1782,20 +1782,11 @@ change_state (const char *oldpos, const 
+--- gcc-4_5-branch.orig/gcc/genrecog.c	2011-06-16 17:59:04.000000000 -0700
++++ gcc-4_5-branch/gcc/genrecog.c	2011-06-16 18:46:26.395282255 -0700
+@@ -1782,20 +1782,11 @@
    int odepth = strlen (oldpos);
    int ndepth = strlen (newpos);
    int depth;
@@ -3503,77 +3427,11 @@ Index: gcc-4_5-branch/gcc/genrecog.c
    /* Go down to desired level.  */
    while (depth < ndepth)
      {
-Index: gcc-4_5-branch/gcc/ifcvt.c
-===================================================================
---- gcc-4_5-branch.orig/gcc/ifcvt.c
-+++ gcc-4_5-branch/gcc/ifcvt.c
-@@ -4011,6 +4011,7 @@ dead_or_predicable (basic_block test_bb,
-   basic_block new_dest = dest_edge->dest;
-   rtx head, end, jump, earliest = NULL_RTX, old_dest;
-   bitmap merge_set = NULL;
-+  bitmap merge_set_noclobber  = NULL;
-   /* Number of pending changes.  */
-   int n_validated_changes = 0;
-   rtx new_dest_label;
-@@ -4169,6 +4170,7 @@ dead_or_predicable (basic_block test_bb,
- 		       end of the block.  */
- 
-       merge_set = BITMAP_ALLOC (&reg_obstack);
-+      merge_set_noclobber = BITMAP_ALLOC (&reg_obstack);
- 
-       /* If we allocated new pseudos (e.g. in the conditional move
- 	 expander called from noce_emit_cmove), we must resize the
-@@ -4187,6 +4189,7 @@ dead_or_predicable (basic_block test_bb,
- 		  df_ref def = *def_rec;
- 		  bitmap_set_bit (merge_set, DF_REF_REGNO (def));
- 		}
-+              df_simulate_find_noclobber_defs (insn, merge_set_noclobber);
- 	    }
- 	}
- 
-@@ -4197,7 +4200,7 @@ dead_or_predicable (basic_block test_bb,
- 	  unsigned i;
- 	  bitmap_iterator bi;
- 
--          EXECUTE_IF_SET_IN_BITMAP (merge_set, 0, i, bi)
-+          EXECUTE_IF_SET_IN_BITMAP (merge_set_noclobber, 0, i, bi)
- 	    {
- 	      if (i < FIRST_PSEUDO_REGISTER
- 		  && ! fixed_regs[i]
-@@ -4233,7 +4236,7 @@ dead_or_predicable (basic_block test_bb,
- 	   TEST_SET & DF_LIVE_IN (merge_bb)
- 	 are empty.  */
- 
--      if (bitmap_intersect_p (merge_set, test_set)
-+      if (bitmap_intersect_p (merge_set_noclobber, test_set)
- 	  || bitmap_intersect_p (merge_set, test_live)
- 	  || bitmap_intersect_p (test_set, df_get_live_in (merge_bb)))
- 	intersect = true;
-@@ -4320,6 +4323,7 @@ dead_or_predicable (basic_block test_bb,
- 	    remove_reg_equal_equiv_notes_for_regno (i);
- 
- 	  BITMAP_FREE (merge_set);
-+          BITMAP_FREE (merge_set_noclobber);
- 	}
- 
-       reorder_insns (head, end, PREV_INSN (earliest));
-@@ -4340,7 +4344,10 @@ dead_or_predicable (basic_block test_bb,
-   cancel_changes (0);
-  fail:
-   if (merge_set)
--    BITMAP_FREE (merge_set);
-+    {
-+      BITMAP_FREE (merge_set);
-+      BITMAP_FREE (merge_set_noclobber);
-+    }
-   return FALSE;
- }
- 
 Index: gcc-4_5-branch/gcc/recog.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/recog.c
-+++ gcc-4_5-branch/gcc/recog.c
-@@ -2082,6 +2082,7 @@ extract_insn (rtx insn)
+--- gcc-4_5-branch.orig/gcc/recog.c	2011-06-16 18:46:02.000000000 -0700
++++ gcc-4_5-branch/gcc/recog.c	2011-06-16 18:46:26.395282255 -0700
+@@ -2082,6 +2082,7 @@
  			       recog_data.operand_loc,
  			       recog_data.constraints,
  			       recog_data.operand_mode, NULL);
@@ -3581,7 +3439,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  	  if (noperands > 0)
  	    {
  	      const char *p =  recog_data.constraints[0];
-@@ -2111,6 +2112,7 @@ extract_insn (rtx insn)
+@@ -2111,6 +2112,7 @@
        for (i = 0; i < noperands; i++)
  	{
  	  recog_data.constraints[i] = insn_data[icode].operand[i].constraint;
@@ -3589,7 +3447,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  	  recog_data.operand_mode[i] = insn_data[icode].operand[i].mode;
  	  /* VOIDmode match_operands gets mode from their real operand.  */
  	  if (recog_data.operand_mode[i] == VOIDmode)
-@@ -2909,6 +2911,10 @@ struct peep2_insn_data
+@@ -2909,6 +2911,10 @@
  
  static struct peep2_insn_data peep2_insn_data[MAX_INSNS_PER_PEEP2 + 1];
  static int peep2_current;
@@ -3600,7 +3458,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  /* The number of instructions available to match a peep2.  */
  int peep2_current_count;
  
-@@ -2917,6 +2923,16 @@ int peep2_current_count;
+@@ -2917,6 +2923,16 @@
     DF_LIVE_OUT for the block.  */
  #define PEEP2_EOB	pc_rtx
  
@@ -3617,7 +3475,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  /* Return the Nth non-note insn after `current', or return NULL_RTX if it
     does not exist.  Used by the recognizer to find the next insn to match
     in a multi-insn pattern.  */
-@@ -2926,9 +2942,7 @@ peep2_next_insn (int n)
+@@ -2926,9 +2942,7 @@
  {
    gcc_assert (n <= peep2_current_count);
  
@@ -3628,7 +3486,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  
    return peep2_insn_data[n].insn;
  }
-@@ -2941,9 +2955,7 @@ peep2_regno_dead_p (int ofs, int regno)
+@@ -2941,9 +2955,7 @@
  {
    gcc_assert (ofs < MAX_INSNS_PER_PEEP2 + 1);
  
@@ -3639,7 +3497,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  
    gcc_assert (peep2_insn_data[ofs].insn != NULL_RTX);
  
-@@ -2959,9 +2971,7 @@ peep2_reg_dead_p (int ofs, rtx reg)
+@@ -2959,9 +2971,7 @@
  
    gcc_assert (ofs < MAX_INSNS_PER_PEEP2 + 1);
  
@@ -3650,7 +3508,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  
    gcc_assert (peep2_insn_data[ofs].insn != NULL_RTX);
  
-@@ -2996,12 +3006,8 @@ peep2_find_free_register (int from, int 
+@@ -2996,12 +3006,8 @@
    gcc_assert (from < MAX_INSNS_PER_PEEP2 + 1);
    gcc_assert (to < MAX_INSNS_PER_PEEP2 + 1);
  
@@ -3665,7 +3523,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  
    gcc_assert (peep2_insn_data[from].insn != NULL_RTX);
    REG_SET_TO_HARD_REG_SET (live, peep2_insn_data[from].live_before);
-@@ -3010,8 +3016,7 @@ peep2_find_free_register (int from, int 
+@@ -3010,8 +3016,7 @@
      {
        HARD_REG_SET this_live;
  
@@ -3675,7 +3533,7 @@ Index: gcc-4_5-branch/gcc/recog.c
        gcc_assert (peep2_insn_data[from].insn != NULL_RTX);
        REG_SET_TO_HARD_REG_SET (this_live, peep2_insn_data[from].live_before);
        IOR_HARD_REG_SET (live, this_live);
-@@ -3104,19 +3109,234 @@ peep2_reinit_state (regset live)
+@@ -3104,19 +3109,234 @@
    COPY_REG_SET (peep2_insn_data[MAX_INSNS_PER_PEEP2].live_before, live);
  }
  
@@ -3913,7 +3771,7 @@ Index: gcc-4_5-branch/gcc/recog.c
    df_analyze ();
  
    /* Initialize the regsets we're going to use.  */
-@@ -3126,214 +3346,59 @@ peephole2_optimize (void)
+@@ -3126,214 +3346,59 @@
  
    FOR_EACH_BB_REVERSE (bb)
      {
@@ -3950,7 +3808,9 @@ Index: gcc-4_5-branch/gcc/recog.c
 -	      peep2_insn_data[peep2_current].insn = insn;
 -	      df_simulate_one_insn_backwards (bb, insn, live);
 -	      COPY_REG_SET (peep2_insn_data[peep2_current].live_before, live);
--
++	  rtx attempt, head;
++	  int match_len;
+ 
 -	      if (RTX_FRAME_RELATED_P (insn))
 -		{
 -		  /* If an insn has RTX_FRAME_RELATED_P set, peephole
@@ -3972,9 +3832,7 @@ Index: gcc-4_5-branch/gcc/recog.c
 -		    {
 -		      int j;
 -		      rtx old_insn, new_insn, note;
-+	  rtx attempt, head;
-+	  int match_len;
- 
+-
 -		      j = i + peep2_current;
 -		      if (j >= MAX_INSNS_PER_PEEP2 + 1)
 -			j -= MAX_INSNS_PER_PEEP2 + 1;
@@ -4170,7 +4028,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  	}
      }
  
-@@ -3341,7 +3406,7 @@ peephole2_optimize (void)
+@@ -3341,7 +3406,7 @@
    for (i = 0; i < MAX_INSNS_PER_PEEP2 + 1; ++i)
      BITMAP_FREE (peep2_insn_data[i].live_before);
    BITMAP_FREE (live);
@@ -4181,9 +4039,9 @@ Index: gcc-4_5-branch/gcc/recog.c
  #endif /* HAVE_peephole2 */
 Index: gcc-4_5-branch/gcc/recog.h
 ===================================================================
---- gcc-4_5-branch.orig/gcc/recog.h
-+++ gcc-4_5-branch/gcc/recog.h
-@@ -194,6 +194,9 @@ struct recog_data
+--- gcc-4_5-branch.orig/gcc/recog.h	2011-06-16 17:59:04.000000000 -0700
++++ gcc-4_5-branch/gcc/recog.h	2011-06-16 18:46:26.405282255 -0700
+@@ -194,6 +194,9 @@
    /* Gives the constraint string for operand N.  */
    const char *constraints[MAX_RECOG_OPERANDS];
  
@@ -4193,7 +4051,7 @@ Index: gcc-4_5-branch/gcc/recog.h
    /* Gives the mode of operand N.  */
    enum machine_mode operand_mode[MAX_RECOG_OPERANDS];
  
-@@ -260,6 +263,8 @@ struct insn_operand_data
+@@ -260,6 +263,8 @@
  
    const char strict_low;
  
@@ -4204,9 +4062,9 @@ Index: gcc-4_5-branch/gcc/recog.h
  
 Index: gcc-4_5-branch/gcc/reload.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/reload.c
-+++ gcc-4_5-branch/gcc/reload.c
-@@ -3631,7 +3631,7 @@ find_reloads (rtx insn, int replace, int
+--- gcc-4_5-branch.orig/gcc/reload.c	2011-06-16 17:59:04.000000000 -0700
++++ gcc-4_5-branch/gcc/reload.c	2011-06-16 18:46:26.405282255 -0700
+@@ -3631,7 +3631,7 @@
  		   || modified[j] != RELOAD_WRITE)
  		  && j != i
  		  /* Ignore things like match_operator operands.  */
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch
new file mode 100644
index 0000000..abbd95b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99503.patch
@@ -0,0 +1,6070 @@
+2011-04-20  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/testsuite/
+	From  Richard Earnshaw  <rearnsha@arm.com>
+
+	PR target/46329
+	* gcc.target/arm/pr46329.c: New test.
+
+	gcc/
+	PR target/46329
+	* config/arm/arm.c (arm_legitimate_constant_p_1): Return false
+	for all Neon struct constants.
+
+2011-04-20  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* doc/tm.texi (LEGITIMATE_CONSTANT_P): Replace with...
+	(TARGET_LEGITIMATE_CONSTANT_P): ...this.
+	* target.h (gcc_target): Add legitimate_constant_p.
+	* target-def.h (TARGET_LEGITIMATE_CONSTANT_P): Define.
+	(TARGET_INITIALIZER): Include it.
+	* calls.c (precompute_register_parameters): Replace uses of
+	LEGITIMATE_CONSTANT_P with targetm.legitimate_constant_p.
+	(emit_library_call_value_1): Likewise.
+	* expr.c (move_block_to_reg, can_store_by_pieces, emit_move_insn)
+	(compress_float_constant, emit_push_insn, expand_expr_real_1): Likewise.
+	* recog.c (general_operand, immediate_operand): Likewise.
+	* reload.c (find_reloads_toplev, find_reloads_address_part): Likewise.
+	* reload1.c (init_eliminable_invariants): Likewise.
+	* targhooks.h (default_legitimate_constant_p); Declare.
+	* targhooks.c (default_legitimate_constant_p): New function.
+
+	* config/arm/arm-protos.h (arm_cannot_force_const_mem): Delete.
+	* config/arm/arm.h (ARM_LEGITIMATE_CONSTANT_P): Likewise.
+	(THUMB_LEGITIMATE_CONSTANT_P, LEGITIMATE_CONSTANT_P): Likewise.
+	* config/arm/arm.c (TARGET_LEGITIMATE_CONSTANT_P): Define.
+	(arm_legitimate_constant_p_1, thumb_legitimate_constant_p)
+	(arm_legitimate_constant_p): New functions.
+	(arm_cannot_force_const_mem): Make static.
+
+2011-04-20  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* hooks.h (hook_bool_mode_uhwi_false): Declare.
+	* hooks.c (hook_bool_mode_uhwi_false): New function.
+	* doc/tm.texi (TARGET_ARRAY_MODE_SUPPORTED_P): Document.
+	* target.h (array_mode_supported_p): New hook.
+	* target-def.h (TARGET_ARRAY_MODE_SUPPORTED_P): Define if undefined.
+	(TARGET_INITIALIZER): Include it.
+	* stor-layout.c (mode_for_array): New function.
+	(layout_type): Use it.
+	* config/arm/arm.c (arm_array_mode_supported_p): New function.
+	(TARGET_ARRAY_MODE_SUPPORTED_P): Define.
+
+2011-04-20  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/testsuite/
+	Backport from mainline:
+
+	2011-04-12  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* gcc.target/arm/neon-vld3-1.c: New test.
+	* gcc.target/arm/neon-vst3-1.c: New test.
+	* gcc.target/arm/neon/v*.c: Regenerate.
+
+	gcc/
+	Backport from mainline:
+
+	2011-04-12  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* config/arm/arm.c (arm_print_operand): Use MEM_SIZE to get the
+	size of a '%A' memory reference.
+	(T_DREG, T_QREG): New neon_builtin_type_bits.
+	(arm_init_neon_builtins): Assert that the load and store operands
+	are neon_struct_operands.
+	(locate_neon_builtin_icode): Provide the neon_builtin_type_bits.
+	(NEON_ARG_MEMORY): New builtin_arg.
+	(neon_dereference_pointer): New function.
+	(arm_expand_neon_args): Add a neon_builtin_type_bits argument.
+	Handle NEON_ARG_MEMORY.
+	(arm_expand_neon_builtin): Update after above interface changes.
+	Use NEON_ARG_MEMORY for loads and stores.
+	* config/arm/predicates.md (neon_struct_operand): New predicate.
+	* config/arm/neon.md (V_two_elem): Tweak formatting.
+	(V_three_elem): Use BLKmode for accesses that have no associated mode.
+	(neon_vld1<mode>, neon_vld1_dup<mode>)
+	(neon_vst1_lane<mode>, neon_vst1<mode>, neon_vld2<mode>)
+	(neon_vld2_lane<mode>, neon_vld2_dup<mode>, neon_vst2<mode>)
+	(neon_vst2_lane<mode>, neon_vld3<mode>, neon_vld3_lane<mode>)
+	(neon_vld3_dup<mode>, neon_vst3<mode>, neon_vst3_lane<mode>)
+	(neon_vld4<mode>, neon_vld4_lane<mode>, neon_vld4_dup<mode>)
+	(neon_vst4<mode>): Replace pointer operand with a memory operand.
+	Use %A in the output template.
+	(neon_vld3qa<mode>, neon_vld3qb<mode>, neon_vst3qa<mode>)
+	(neon_vst3qb<mode>, neon_vld4qa<mode>, neon_vld4qb<mode>)
+	(neon_vst4qa<mode>, neon_vst4qb<mode>): Likewise, but halve
+	the width of the memory access.  Remove post-increment.
+	* config/arm/neon-testgen.ml: Allow addresses to have an alignment.
+
+2011-04-20  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-03-30  Richard Sandiford  <richard.sandiford@linaro.org>
+		    Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	PR target/43590
+	* config/arm/neon.md (neon_vld3qa<mode>, neon_vld4qa<mode>): Remove
+	operand 1 and reshuffle the operands to match.
+	(neon_vld3<mode>, neon_vld4<mode>): Update accordingly.
+
+=== modified file 'gcc/calls.c'
+--- old/gcc/calls.c	2010-11-04 12:43:52 +0000
++++ new/gcc/calls.c	2011-04-20 10:07:36 +0000
+@@ -674,7 +674,7 @@
+ 	/* If the value is a non-legitimate constant, force it into a
+ 	   pseudo now.  TLS symbols sometimes need a call to resolve.  */
+ 	if (CONSTANT_P (args[i].value)
+-	    && !LEGITIMATE_CONSTANT_P (args[i].value))
++	    && !targetm.legitimate_constant_p (args[i].mode, args[i].value))
+ 	  args[i].value = force_reg (args[i].mode, args[i].value);
+ 
+ 	/* If we are to promote the function arg to a wider mode,
+@@ -3413,7 +3413,8 @@
+ 
+       /* Make sure it is a reasonable operand for a move or push insn.  */
+       if (!REG_P (addr) && !MEM_P (addr)
+-	  && ! (CONSTANT_P (addr) && LEGITIMATE_CONSTANT_P (addr)))
++	  && !(CONSTANT_P (addr)
++	       && targetm.legitimate_constant_p (Pmode, addr)))
+ 	addr = force_operand (addr, NULL_RTX);
+ 
+       argvec[count].value = addr;
+@@ -3453,7 +3454,7 @@
+ 
+       /* Make sure it is a reasonable operand for a move or push insn.  */
+       if (!REG_P (val) && !MEM_P (val)
+-	  && ! (CONSTANT_P (val) && LEGITIMATE_CONSTANT_P (val)))
++	  && !(CONSTANT_P (val) && targetm.legitimate_constant_p (mode, val)))
+ 	val = force_operand (val, NULL_RTX);
+ 
+       if (pass_by_reference (&args_so_far, mode, NULL_TREE, 1))
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-02-08 12:07:29 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-04-20 10:07:36 +0000
+@@ -81,7 +81,6 @@
+ extern enum reg_class coproc_secondary_reload_class (enum machine_mode, rtx,
+ 						     bool);
+ extern bool arm_tls_referenced_p (rtx);
+-extern bool arm_cannot_force_const_mem (rtx);
+ 
+ extern int cirrus_memory_offset (rtx);
+ extern int arm_coproc_mem_operand (rtx, bool);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-03-02 11:29:06 +0000
++++ new/gcc/config/arm/arm.c	2011-04-20 10:10:50 +0000
+@@ -140,6 +140,8 @@
+ static void arm_output_mi_thunk (FILE *, tree, HOST_WIDE_INT, HOST_WIDE_INT,
+ 				 tree);
+ static bool arm_have_conditional_execution (void);
++static bool arm_cannot_force_const_mem (rtx);
++static bool arm_legitimate_constant_p (enum machine_mode, rtx);
+ static bool arm_rtx_costs_1 (rtx, enum rtx_code, int*, bool);
+ static bool arm_size_rtx_costs (rtx, enum rtx_code, enum rtx_code, int *);
+ static bool thumb2_size_rtx_costs (rtx, enum rtx_code, enum rtx_code, int *);
+@@ -222,6 +224,8 @@
+ static tree arm_promoted_type (const_tree t);
+ static tree arm_convert_to_type (tree type, tree expr);
+ static bool arm_scalar_mode_supported_p (enum machine_mode);
++static bool arm_array_mode_supported_p (enum machine_mode,
++					unsigned HOST_WIDE_INT);
+ static bool arm_frame_pointer_required (void);
+ static bool arm_can_eliminate (const int, const int);
+ static void arm_asm_trampoline_template (FILE *);
+@@ -355,6 +359,8 @@
+ #define TARGET_SHIFT_TRUNCATION_MASK arm_shift_truncation_mask
+ #undef TARGET_VECTOR_MODE_SUPPORTED_P
+ #define TARGET_VECTOR_MODE_SUPPORTED_P arm_vector_mode_supported_p
++#undef TARGET_ARRAY_MODE_SUPPORTED_P
++#define TARGET_ARRAY_MODE_SUPPORTED_P arm_array_mode_supported_p
+ 
+ #undef  TARGET_MACHINE_DEPENDENT_REORG
+ #define TARGET_MACHINE_DEPENDENT_REORG arm_reorg
+@@ -467,6 +473,9 @@
+ #undef TARGET_HAVE_CONDITIONAL_EXECUTION
+ #define TARGET_HAVE_CONDITIONAL_EXECUTION arm_have_conditional_execution
+ 
++#undef TARGET_LEGITIMATE_CONSTANT_P
++#define TARGET_LEGITIMATE_CONSTANT_P arm_legitimate_constant_p
++
+ #undef TARGET_CANNOT_FORCE_CONST_MEM
+ #define TARGET_CANNOT_FORCE_CONST_MEM arm_cannot_force_const_mem
+ 
+@@ -6447,9 +6456,47 @@
+   return for_each_rtx (&x, arm_tls_operand_p_1, NULL);
+ }
+ 
++/* Implement TARGET_LEGITIMATE_CONSTANT_P.
++
++   On the ARM, allow any integer (invalid ones are removed later by insn
++   patterns), nice doubles and symbol_refs which refer to the function's
++   constant pool XXX.
++
++   When generating pic allow anything.  */
++
++static bool
++arm_legitimate_constant_p_1 (enum machine_mode mode, rtx x)
++{
++  /* At present, we have no support for Neon structure constants, so forbid
++     them here.  It might be possible to handle simple cases like 0 and -1
++     in future.  */
++  if (TARGET_NEON && VALID_NEON_STRUCT_MODE (mode))
++    return false;
++
++  return flag_pic || !label_mentioned_p (x);
++}
++
++static bool
++thumb_legitimate_constant_p (enum machine_mode mode ATTRIBUTE_UNUSED, rtx x)
++{
++  return (GET_CODE (x) == CONST_INT
++	  || GET_CODE (x) == CONST_DOUBLE
++	  || CONSTANT_ADDRESS_P (x)
++	  || flag_pic);
++}
++
++static bool
++arm_legitimate_constant_p (enum machine_mode mode, rtx x)
++{
++  return (!arm_cannot_force_const_mem (x)
++	  && (TARGET_32BIT
++	      ? arm_legitimate_constant_p_1 (mode, x)
++	      : thumb_legitimate_constant_p (mode, x)));
++}
++
+ /* Implement TARGET_CANNOT_FORCE_CONST_MEM.  */
+ 
+-bool
++static bool
+ arm_cannot_force_const_mem (rtx x)
+ {
+   rtx base, offset;
+@@ -16847,7 +16894,7 @@
+       {
+ 	rtx addr;
+ 	bool postinc = FALSE;
+-	unsigned align, modesize, align_bits;
++	unsigned align, memsize, align_bits;
+ 
+ 	gcc_assert (GET_CODE (x) == MEM);
+ 	addr = XEXP (x, 0);
+@@ -16862,12 +16909,12 @@
+ 	   instruction (for some alignments) as an aid to the memory subsystem
+ 	   of the target.  */
+ 	align = MEM_ALIGN (x) >> 3;
+-	modesize = GET_MODE_SIZE (GET_MODE (x));
++	memsize = INTVAL (MEM_SIZE (x));
+ 	
+ 	/* Only certain alignment specifiers are supported by the hardware.  */
+-	if (modesize == 16 && (align % 32) == 0)
++	if (memsize == 16 && (align % 32) == 0)
+ 	  align_bits = 256;
+-	else if ((modesize == 8 || modesize == 16) && (align % 16) == 0)
++	else if ((memsize == 8 || memsize == 16) && (align % 16) == 0)
+ 	  align_bits = 128;
+ 	else if ((align % 8) == 0)
+ 	  align_bits = 64;
+@@ -16875,7 +16922,7 @@
+ 	  align_bits = 0;
+ 	
+ 	if (align_bits != 0)
+-	  asm_fprintf (stream, ", :%d", align_bits);
++	  asm_fprintf (stream, ":%d", align_bits);
+ 
+ 	asm_fprintf (stream, "]");
+ 
+@@ -18398,12 +18445,14 @@
+   T_V2SI  = 0x0004,
+   T_V2SF  = 0x0008,
+   T_DI    = 0x0010,
++  T_DREG  = 0x001F,
+   T_V16QI = 0x0020,
+   T_V8HI  = 0x0040,
+   T_V4SI  = 0x0080,
+   T_V4SF  = 0x0100,
+   T_V2DI  = 0x0200,
+   T_TI	  = 0x0400,
++  T_QREG  = 0x07E0,
+   T_EI	  = 0x0800,
+   T_OI	  = 0x1000
+ };
+@@ -19049,10 +19098,9 @@
+ 		    if (is_load && k == 1)
+ 		      {
+ 		        /* Neon load patterns always have the memory operand
+-			   (a SImode pointer) in the operand 1 position.  We
+-			   want a const pointer to the element type in that
+-			   position.  */
+-		        gcc_assert (insn_data[icode].operand[k].mode == SImode);
++			   in the operand 1 position.  */
++			gcc_assert (insn_data[icode].operand[k].predicate
++				    == neon_struct_operand);
+ 
+ 			switch (1 << j)
+ 			  {
+@@ -19087,10 +19135,9 @@
+ 		    else if (is_store && k == 0)
+ 		      {
+ 		        /* Similarly, Neon store patterns use operand 0 as
+-			   the memory location to store to (a SImode pointer).
+-			   Use a pointer to the element type of the store in
+-			   that position.  */
+-			gcc_assert (insn_data[icode].operand[k].mode == SImode);
++			   the memory location to store to.  */
++			gcc_assert (insn_data[icode].operand[k].predicate
++				    == neon_struct_operand);
+ 
+ 			switch (1 << j)
+ 			  {
+@@ -19410,10 +19457,11 @@
+ }
+ 
+ static enum insn_code
+-locate_neon_builtin_icode (int fcode, neon_itype *itype)
++locate_neon_builtin_icode (int fcode, neon_itype *itype,
++			   enum neon_builtin_type_bits *type_bit)
+ {
+   neon_builtin_datum key, *found;
+-  int idx;
++  int idx, type, ntypes;
+ 
+   key.base_fcode = fcode;
+   found = (neon_builtin_datum *)
+@@ -19426,20 +19474,83 @@
+   if (itype)
+     *itype = found->itype;
+ 
++  if (type_bit)
++    {
++      ntypes = 0;
++      for (type = 0; type < T_MAX; type++)
++	if (found->bits & (1 << type))
++	  {
++	    if (ntypes == idx)
++	      break;
++	    ntypes++;
++	  }
++      gcc_assert (type < T_MAX);
++      *type_bit = (enum neon_builtin_type_bits) (1 << type);
++    }
+   return found->codes[idx];
+ }
+ 
+ typedef enum {
+   NEON_ARG_COPY_TO_REG,
+   NEON_ARG_CONSTANT,
++  NEON_ARG_MEMORY,
+   NEON_ARG_STOP
+ } builtin_arg;
+ 
+ #define NEON_MAX_BUILTIN_ARGS 5
+ 
++/* EXP is a pointer argument to a Neon load or store intrinsic.  Derive
++   and return an expression for the accessed memory.
++
++   The intrinsic function operates on a block of registers that has
++   mode REG_MODE.  This block contains vectors of type TYPE_BIT.
++   The function references the memory at EXP in mode MEM_MODE;
++   this mode may be BLKmode if no more suitable mode is available.  */
++
++static tree
++neon_dereference_pointer (tree exp, enum machine_mode mem_mode,
++			  enum machine_mode reg_mode,
++			  enum neon_builtin_type_bits type_bit)
++{
++  HOST_WIDE_INT reg_size, vector_size, nvectors, nelems;
++  tree elem_type, upper_bound, array_type;
++
++  /* Work out the size of the register block in bytes.  */
++  reg_size = GET_MODE_SIZE (reg_mode);
++
++  /* Work out the size of each vector in bytes.  */
++  gcc_assert (type_bit & (T_DREG | T_QREG));
++  vector_size = (type_bit & T_QREG ? 16 : 8);
++
++  /* Work out how many vectors there are.  */
++  gcc_assert (reg_size % vector_size == 0);
++  nvectors = reg_size / vector_size;
++
++  /* Work out how many elements are being loaded or stored.
++     MEM_MODE == REG_MODE implies a one-to-one mapping between register
++     and memory elements; anything else implies a lane load or store.  */
++  if (mem_mode == reg_mode)
++    nelems = vector_size * nvectors;
++  else
++    nelems = nvectors;
++
++  /* Work out the type of each element.  */
++  gcc_assert (POINTER_TYPE_P (TREE_TYPE (exp)));
++  elem_type = TREE_TYPE (TREE_TYPE (exp));
++
++  /* Create a type that describes the full access.  */
++  upper_bound = build_int_cst (size_type_node, nelems - 1);
++  array_type = build_array_type (elem_type, build_index_type (upper_bound));
++
++  /* Dereference EXP using that type.  */
++  exp = convert (build_pointer_type (array_type), exp);
++  return fold_build1 (INDIRECT_REF, array_type, exp);
++}
++
+ /* Expand a Neon builtin.  */
+ static rtx
+ arm_expand_neon_args (rtx target, int icode, int have_retval,
++		      enum neon_builtin_type_bits type_bit,
+ 		      tree exp, ...)
+ {
+   va_list ap;
+@@ -19448,7 +19559,9 @@
+   rtx op[NEON_MAX_BUILTIN_ARGS];
+   enum machine_mode tmode = insn_data[icode].operand[0].mode;
+   enum machine_mode mode[NEON_MAX_BUILTIN_ARGS];
++  enum machine_mode other_mode;
+   int argc = 0;
++  int opno;
+ 
+   if (have_retval
+       && (!target
+@@ -19466,26 +19579,46 @@
+         break;
+       else
+         {
++          opno = argc + have_retval;
++          mode[argc] = insn_data[icode].operand[opno].mode;
+           arg[argc] = CALL_EXPR_ARG (exp, argc);
++          if (thisarg == NEON_ARG_MEMORY)
++            {
++              other_mode = insn_data[icode].operand[1 - opno].mode;
++              arg[argc] = neon_dereference_pointer (arg[argc], mode[argc],
++                                                    other_mode, type_bit);
++            }
+           op[argc] = expand_normal (arg[argc]);
+-          mode[argc] = insn_data[icode].operand[argc + have_retval].mode;
+ 
+           switch (thisarg)
+             {
+             case NEON_ARG_COPY_TO_REG:
+               /*gcc_assert (GET_MODE (op[argc]) == mode[argc]);*/
+-              if (!(*insn_data[icode].operand[argc + have_retval].predicate)
++              if (!(*insn_data[icode].operand[opno].predicate)
+                      (op[argc], mode[argc]))
+                 op[argc] = copy_to_mode_reg (mode[argc], op[argc]);
+               break;
+ 
+             case NEON_ARG_CONSTANT:
+               /* FIXME: This error message is somewhat unhelpful.  */
+-              if (!(*insn_data[icode].operand[argc + have_retval].predicate)
++              if (!(*insn_data[icode].operand[opno].predicate)
+                     (op[argc], mode[argc]))
+ 		error ("argument must be a constant");
+               break;
+ 
++            case NEON_ARG_MEMORY:
++	      gcc_assert (MEM_P (op[argc]));
++	      PUT_MODE (op[argc], mode[argc]);
++	      /* ??? arm_neon.h uses the same built-in functions for signed
++		 and unsigned accesses, casting where necessary.  This isn't
++		 alias safe.  */
++	      set_mem_alias_set (op[argc], 0);
++	      if (!(*insn_data[icode].operand[opno].predicate)
++                    (op[argc], mode[argc]))
++		op[argc] = (replace_equiv_address
++			    (op[argc], force_reg (Pmode, XEXP (op[argc], 0))));
++              break;
++
+             case NEON_ARG_STOP:
+               gcc_unreachable ();
+             }
+@@ -19564,14 +19697,15 @@
+ arm_expand_neon_builtin (int fcode, tree exp, rtx target)
+ {
+   neon_itype itype;
+-  enum insn_code icode = locate_neon_builtin_icode (fcode, &itype);
++  enum neon_builtin_type_bits type_bit;
++  enum insn_code icode = locate_neon_builtin_icode (fcode, &itype, &type_bit);
+ 
+   switch (itype)
+     {
+     case NEON_UNOP:
+     case NEON_CONVERT:
+     case NEON_DUPLANE:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_BINOP:
+@@ -19581,90 +19715,90 @@
+     case NEON_SCALARMULH:
+     case NEON_SHIFTINSERT:
+     case NEON_LOGICBINOP:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+         NEON_ARG_STOP);
+ 
+     case NEON_TERNOP:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_GETLANE:
+     case NEON_FIXCONV:
+     case NEON_SHIFTIMM:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT, NEON_ARG_CONSTANT,
+         NEON_ARG_STOP);
+ 
+     case NEON_CREATE:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_DUP:
+     case NEON_SPLIT:
+     case NEON_REINTERP:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_COMBINE:
+     case NEON_VTBL:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_RESULTPAIR:
+-      return arm_expand_neon_args (target, icode, 0, exp,
++      return arm_expand_neon_args (target, icode, 0, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_STOP);
+ 
+     case NEON_LANEMUL:
+     case NEON_LANEMULL:
+     case NEON_LANEMULH:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_LANEMAC:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_CONSTANT, NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_SHIFTACC:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_SCALARMAC:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+ 	NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_SELECT:
+     case NEON_VTBX:
+-      return arm_expand_neon_args (target, icode, 1, exp,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
+ 	NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_STOP);
+ 
+     case NEON_LOAD1:
+     case NEON_LOADSTRUCT:
+-      return arm_expand_neon_args (target, icode, 1, exp,
+-	NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++	NEON_ARG_MEMORY, NEON_ARG_STOP);
+ 
+     case NEON_LOAD1LANE:
+     case NEON_LOADSTRUCTLANE:
+-      return arm_expand_neon_args (target, icode, 1, exp,
+-	NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
++      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++	NEON_ARG_MEMORY, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+ 	NEON_ARG_STOP);
+ 
+     case NEON_STORE1:
+     case NEON_STORESTRUCT:
+-      return arm_expand_neon_args (target, icode, 0, exp,
+-	NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
++      return arm_expand_neon_args (target, icode, 0, type_bit, exp,
++	NEON_ARG_MEMORY, NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_STORE1LANE:
+     case NEON_STORESTRUCTLANE:
+-      return arm_expand_neon_args (target, icode, 0, exp,
+-	NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
++      return arm_expand_neon_args (target, icode, 0, type_bit, exp,
++	NEON_ARG_MEMORY, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+ 	NEON_ARG_STOP);
+     }
+ 
+@@ -22349,6 +22483,20 @@
+   return false;
+ }
+ 
++/* Implements target hook array_mode_supported_p.  */
++
++static bool
++arm_array_mode_supported_p (enum machine_mode mode,
++			    unsigned HOST_WIDE_INT nelems)
++{
++  if (TARGET_NEON
++      && (VALID_NEON_DREG_MODE (mode) || VALID_NEON_QREG_MODE (mode))
++      && (nelems >= 2 && nelems <= 4))
++    return true;
++
++  return false;
++}
++
+ /* Implement TARGET_SHIFT_TRUNCATION_MASK.  SImode shifts use normal
+    ARM insns and therefore guarantee that the shift count is modulo 256.
+    DImode shifts (those implemented by lib1funcs.asm or by optabs.c)
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-02-08 12:07:29 +0000
++++ new/gcc/config/arm/arm.h	2011-04-20 10:07:36 +0000
+@@ -1996,27 +1996,6 @@
+ #define TARGET_DEFAULT_WORD_RELOCATIONS 0
+ #endif
+ 
+-/* Nonzero if the constant value X is a legitimate general operand.
+-   It is given that X satisfies CONSTANT_P or is a CONST_DOUBLE.
+-
+-   On the ARM, allow any integer (invalid ones are removed later by insn
+-   patterns), nice doubles and symbol_refs which refer to the function's
+-   constant pool XXX.
+-
+-   When generating pic allow anything.  */
+-#define ARM_LEGITIMATE_CONSTANT_P(X)	(flag_pic || ! label_mentioned_p (X))
+-
+-#define THUMB_LEGITIMATE_CONSTANT_P(X)	\
+- (   GET_CODE (X) == CONST_INT		\
+-  || GET_CODE (X) == CONST_DOUBLE	\
+-  || CONSTANT_ADDRESS_P (X)		\
+-  || flag_pic)
+-
+-#define LEGITIMATE_CONSTANT_P(X)			\
+-  (!arm_cannot_force_const_mem (X)			\
+-   && (TARGET_32BIT ? ARM_LEGITIMATE_CONSTANT_P (X)	\
+-		    : THUMB_LEGITIMATE_CONSTANT_P (X)))
+-
+ #ifndef SUBTARGET_NAME_ENCODING_LENGTHS
+ #define SUBTARGET_NAME_ENCODING_LENGTHS
+ #endif
+
+=== modified file 'gcc/config/arm/neon-testgen.ml'
+--- old/gcc/config/arm/neon-testgen.ml	2010-08-20 13:27:11 +0000
++++ new/gcc/config/arm/neon-testgen.ml	2011-04-20 10:00:39 +0000
+@@ -177,7 +177,7 @@
+       let alt2 = commas (fun x -> x) (n_things n elt_regexp) "" in
+         "\\\\\\{((" ^ alt1 ^ ")|(" ^ alt2 ^ "))\\\\\\}"
+     | (PtrTo elt | CstPtrTo elt) ->
+-      "\\\\\\[" ^ (analyze_shape_elt elt) ^ "\\\\\\]"
++      "\\\\\\[" ^ (analyze_shape_elt elt) ^ "\\(:\\[0-9\\]+\\)?\\\\\\]"
+     | Element_of_dreg -> (analyze_shape_elt Dreg) ^ "\\\\\\[\\[0-9\\]+\\\\\\]"
+     | Element_of_qreg -> (analyze_shape_elt Qreg) ^ "\\\\\\[\\[0-9\\]+\\\\\\]"
+     | All_elements_of_dreg -> (analyze_shape_elt Dreg) ^ "\\\\\\[\\\\\\]"
+
+=== modified file 'gcc/config/arm/neon.md'
+--- old/gcc/config/arm/neon.md	2010-11-04 11:47:50 +0000
++++ new/gcc/config/arm/neon.md	2011-04-20 10:00:39 +0000
+@@ -259,20 +259,18 @@
+ 
+ ;; Mode of pair of elements for each vector mode, to define transfer
+ ;; size for structure lane/dup loads and stores.
+-(define_mode_attr V_two_elem [(V8QI "HI") (V16QI "HI")
+-			      (V4HI "SI") (V8HI "SI")
++(define_mode_attr V_two_elem [(V8QI "HI")   (V16QI "HI")
++                              (V4HI "SI")   (V8HI "SI")
+                               (V2SI "V2SI") (V4SI "V2SI")
+                               (V2SF "V2SF") (V4SF "V2SF")
+                               (DI "V2DI")   (V2DI "V2DI")])
+ 
+ ;; Similar, for three elements.
+-;; ??? Should we define extra modes so that sizes of all three-element
+-;; accesses can be accurately represented?
+-(define_mode_attr V_three_elem [(V8QI "SI")   (V16QI "SI")
+-			        (V4HI "V4HI") (V8HI "V4HI")
+-                                (V2SI "V4SI") (V4SI "V4SI")
+-                                (V2SF "V4SF") (V4SF "V4SF")
+-                                (DI "EI")     (V2DI "EI")])
++(define_mode_attr V_three_elem [(V8QI "BLK") (V16QI "BLK")
++                                (V4HI "BLK") (V8HI "BLK")
++                                (V2SI "BLK") (V4SI "BLK")
++                                (V2SF "BLK") (V4SF "BLK")
++                                (DI "EI")    (V2DI "EI")])
+ 
+ ;; Similar, for four elements.
+ (define_mode_attr V_four_elem [(V8QI "SI")   (V16QI "SI")
+@@ -4567,16 +4565,16 @@
+ 
+ (define_insn "neon_vld1<mode>"
+   [(set (match_operand:VDQX 0 "s_register_operand" "=w")
+-        (unspec:VDQX [(mem:VDQX (match_operand:SI 1 "s_register_operand" "r"))]
++        (unspec:VDQX [(match_operand:VDQX 1 "neon_struct_operand" "Um")]
+                     UNSPEC_VLD1))]
+   "TARGET_NEON"
+-  "vld1.<V_sz_elem>\t%h0, [%1]"
++  "vld1.<V_sz_elem>\t%h0, %A1"
+   [(set_attr "neon_type" "neon_vld1_1_2_regs")]
+ )
+ 
+ (define_insn "neon_vld1_lane<mode>"
+   [(set (match_operand:VDX 0 "s_register_operand" "=w")
+-        (unspec:VDX [(mem:<V_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:VDX [(match_operand:<V_elem> 1 "neon_struct_operand" "Um")
+                      (match_operand:VDX 2 "s_register_operand" "0")
+                      (match_operand:SI 3 "immediate_operand" "i")]
+                     UNSPEC_VLD1_LANE))]
+@@ -4587,9 +4585,9 @@
+   if (lane < 0 || lane >= max)
+     error ("lane out of range");
+   if (max == 1)
+-    return "vld1.<V_sz_elem>\t%P0, [%1]";
++    return "vld1.<V_sz_elem>\t%P0, %A1";
+   else
+-    return "vld1.<V_sz_elem>\t{%P0[%c3]}, [%1]";
++    return "vld1.<V_sz_elem>\t{%P0[%c3]}, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_mode_nunits>") (const_int 2))
+@@ -4599,7 +4597,7 @@
+ 
+ (define_insn "neon_vld1_lane<mode>"
+   [(set (match_operand:VQX 0 "s_register_operand" "=w")
+-        (unspec:VQX [(mem:<V_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:VQX [(match_operand:<V_elem> 1 "neon_struct_operand" "Um")
+                      (match_operand:VQX 2 "s_register_operand" "0")
+                      (match_operand:SI 3 "immediate_operand" "i")]
+                     UNSPEC_VLD1_LANE))]
+@@ -4618,9 +4616,9 @@
+     }
+   operands[0] = gen_rtx_REG (<V_HALF>mode, regno);
+   if (max == 2)
+-    return "vld1.<V_sz_elem>\t%P0, [%1]";
++    return "vld1.<V_sz_elem>\t%P0, %A1";
+   else
+-    return "vld1.<V_sz_elem>\t{%P0[%c3]}, [%1]";
++    return "vld1.<V_sz_elem>\t{%P0[%c3]}, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_mode_nunits>") (const_int 2))
+@@ -4630,14 +4628,14 @@
+ 
+ (define_insn "neon_vld1_dup<mode>"
+   [(set (match_operand:VDX 0 "s_register_operand" "=w")
+-        (unspec:VDX [(mem:<V_elem> (match_operand:SI 1 "s_register_operand" "r"))]
++        (unspec:VDX [(match_operand:<V_elem> 1 "neon_struct_operand" "Um")]
+                     UNSPEC_VLD1_DUP))]
+   "TARGET_NEON"
+ {
+   if (GET_MODE_NUNITS (<MODE>mode) > 1)
+-    return "vld1.<V_sz_elem>\t{%P0[]}, [%1]";
++    return "vld1.<V_sz_elem>\t{%P0[]}, %A1";
+   else
+-    return "vld1.<V_sz_elem>\t%h0, [%1]";
++    return "vld1.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
+@@ -4647,14 +4645,14 @@
+ 
+ (define_insn "neon_vld1_dup<mode>"
+   [(set (match_operand:VQX 0 "s_register_operand" "=w")
+-        (unspec:VQX [(mem:<V_elem> (match_operand:SI 1 "s_register_operand" "r"))]
++        (unspec:VQX [(match_operand:<V_elem> 1 "neon_struct_operand" "Um")]
+                     UNSPEC_VLD1_DUP))]
+   "TARGET_NEON"
+ {
+   if (GET_MODE_NUNITS (<MODE>mode) > 2)
+-    return "vld1.<V_sz_elem>\t{%e0[], %f0[]}, [%1]";
++    return "vld1.<V_sz_elem>\t{%e0[], %f0[]}, %A1";
+   else
+-    return "vld1.<V_sz_elem>\t%h0, [%1]";
++    return "vld1.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
+@@ -4663,15 +4661,15 @@
+ )
+ 
+ (define_insn "neon_vst1<mode>"
+-  [(set (mem:VDQX (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:VDQX 0 "neon_struct_operand" "=Um")
+ 	(unspec:VDQX [(match_operand:VDQX 1 "s_register_operand" "w")]
+ 		     UNSPEC_VST1))]
+   "TARGET_NEON"
+-  "vst1.<V_sz_elem>\t%h1, [%0]"
++  "vst1.<V_sz_elem>\t%h1, %A0"
+   [(set_attr "neon_type" "neon_vst1_1_2_regs_vst2_2_regs")])
+ 
+ (define_insn "neon_vst1_lane<mode>"
+-  [(set (mem:<V_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_elem> 0 "neon_struct_operand" "=Um")
+ 	(vec_select:<V_elem>
+ 	  (match_operand:VDX 1 "s_register_operand" "w")
+ 	  (parallel [(match_operand:SI 2 "neon_lane_number" "i")])))]
+@@ -4682,9 +4680,9 @@
+   if (lane < 0 || lane >= max)
+     error ("lane out of range");
+   if (max == 1)
+-    return "vst1.<V_sz_elem>\t{%P1}, [%0]";
++    return "vst1.<V_sz_elem>\t{%P1}, %A0";
+   else
+-    return "vst1.<V_sz_elem>\t{%P1[%c2]}, [%0]";
++    return "vst1.<V_sz_elem>\t{%P1[%c2]}, %A0";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_mode_nunits>") (const_int 1))
+@@ -4692,7 +4690,7 @@
+                     (const_string "neon_vst1_vst2_lane")))])
+ 
+ (define_insn "neon_vst1_lane<mode>"
+-  [(set (mem:<V_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_elem> 0 "neon_struct_operand" "=Um")
+         (vec_select:<V_elem>
+            (match_operand:VQX 1 "s_register_operand" "w")
+            (parallel [(match_operand:SI 2 "neon_lane_number" "i")])))]
+@@ -4711,24 +4709,24 @@
+     }
+   operands[1] = gen_rtx_REG (<V_HALF>mode, regno);
+   if (max == 2)
+-    return "vst1.<V_sz_elem>\t{%P1}, [%0]";
++    return "vst1.<V_sz_elem>\t{%P1}, %A0";
+   else
+-    return "vst1.<V_sz_elem>\t{%P1[%c2]}, [%0]";
++    return "vst1.<V_sz_elem>\t{%P1[%c2]}, %A0";
+ }
+   [(set_attr "neon_type" "neon_vst1_vst2_lane")]
+ )
+ 
+ (define_insn "neon_vld2<mode>"
+   [(set (match_operand:TI 0 "s_register_operand" "=w")
+-        (unspec:TI [(mem:TI (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:TI [(match_operand:TI 1 "neon_struct_operand" "Um")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VLD2))]
+   "TARGET_NEON"
+ {
+   if (<V_sz_elem> == 64)
+-    return "vld1.64\t%h0, [%1]";
++    return "vld1.64\t%h0, %A1";
+   else
+-    return "vld2.<V_sz_elem>\t%h0, [%1]";
++    return "vld2.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
+@@ -4738,16 +4736,16 @@
+ 
+ (define_insn "neon_vld2<mode>"
+   [(set (match_operand:OI 0 "s_register_operand" "=w")
+-        (unspec:OI [(mem:OI (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:OI [(match_operand:OI 1 "neon_struct_operand" "Um")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VLD2))]
+   "TARGET_NEON"
+-  "vld2.<V_sz_elem>\t%h0, [%1]"
++  "vld2.<V_sz_elem>\t%h0, %A1"
+   [(set_attr "neon_type" "neon_vld2_2_regs_vld1_vld2_all_lanes")])
+ 
+ (define_insn "neon_vld2_lane<mode>"
+   [(set (match_operand:TI 0 "s_register_operand" "=w")
+-        (unspec:TI [(mem:<V_two_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:TI [(match_operand:<V_two_elem> 1 "neon_struct_operand" "Um")
+                     (match_operand:TI 2 "s_register_operand" "0")
+                     (match_operand:SI 3 "immediate_operand" "i")
+                     (unspec:VD [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+@@ -4764,7 +4762,7 @@
+   ops[1] = gen_rtx_REG (DImode, regno + 2);
+   ops[2] = operands[1];
+   ops[3] = operands[3];
+-  output_asm_insn ("vld2.<V_sz_elem>\t{%P0[%c3], %P1[%c3]}, [%2]", ops);
++  output_asm_insn ("vld2.<V_sz_elem>\t{%P0[%c3], %P1[%c3]}, %A2", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vld1_vld2_lane")]
+@@ -4772,7 +4770,7 @@
+ 
+ (define_insn "neon_vld2_lane<mode>"
+   [(set (match_operand:OI 0 "s_register_operand" "=w")
+-        (unspec:OI [(mem:<V_two_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:OI [(match_operand:<V_two_elem> 1 "neon_struct_operand" "Um")
+                     (match_operand:OI 2 "s_register_operand" "0")
+                     (match_operand:SI 3 "immediate_operand" "i")
+                     (unspec:VMQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+@@ -4794,7 +4792,7 @@
+   ops[1] = gen_rtx_REG (DImode, regno + 4);
+   ops[2] = operands[1];
+   ops[3] = GEN_INT (lane);
+-  output_asm_insn ("vld2.<V_sz_elem>\t{%P0[%c3], %P1[%c3]}, [%2]", ops);
++  output_asm_insn ("vld2.<V_sz_elem>\t{%P0[%c3], %P1[%c3]}, %A2", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vld1_vld2_lane")]
+@@ -4802,15 +4800,15 @@
+ 
+ (define_insn "neon_vld2_dup<mode>"
+   [(set (match_operand:TI 0 "s_register_operand" "=w")
+-        (unspec:TI [(mem:<V_two_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:TI [(match_operand:<V_two_elem> 1 "neon_struct_operand" "Um")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VLD2_DUP))]
+   "TARGET_NEON"
+ {
+   if (GET_MODE_NUNITS (<MODE>mode) > 1)
+-    return "vld2.<V_sz_elem>\t{%e0[], %f0[]}, [%1]";
++    return "vld2.<V_sz_elem>\t{%e0[], %f0[]}, %A1";
+   else
+-    return "vld1.<V_sz_elem>\t%h0, [%1]";
++    return "vld1.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
+@@ -4819,16 +4817,16 @@
+ )
+ 
+ (define_insn "neon_vst2<mode>"
+-  [(set (mem:TI (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:TI 0 "neon_struct_operand" "=Um")
+         (unspec:TI [(match_operand:TI 1 "s_register_operand" "w")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VST2))]
+   "TARGET_NEON"
+ {
+   if (<V_sz_elem> == 64)
+-    return "vst1.64\t%h1, [%0]";
++    return "vst1.64\t%h1, %A0";
+   else
+-    return "vst2.<V_sz_elem>\t%h1, [%0]";
++    return "vst2.<V_sz_elem>\t%h1, %A0";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
+@@ -4837,17 +4835,17 @@
+ )
+ 
+ (define_insn "neon_vst2<mode>"
+-  [(set (mem:OI (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:OI 0 "neon_struct_operand" "=Um")
+ 	(unspec:OI [(match_operand:OI 1 "s_register_operand" "w")
+ 		    (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+ 		   UNSPEC_VST2))]
+   "TARGET_NEON"
+-  "vst2.<V_sz_elem>\t%h1, [%0]"
++  "vst2.<V_sz_elem>\t%h1, %A0"
+   [(set_attr "neon_type" "neon_vst1_1_2_regs_vst2_2_regs")]
+ )
+ 
+ (define_insn "neon_vst2_lane<mode>"
+-  [(set (mem:<V_two_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_two_elem> 0 "neon_struct_operand" "=Um")
+ 	(unspec:<V_two_elem>
+ 	  [(match_operand:TI 1 "s_register_operand" "w")
+ 	   (match_operand:SI 2 "immediate_operand" "i")
+@@ -4865,14 +4863,14 @@
+   ops[1] = gen_rtx_REG (DImode, regno);
+   ops[2] = gen_rtx_REG (DImode, regno + 2);
+   ops[3] = operands[2];
+-  output_asm_insn ("vst2.<V_sz_elem>\t{%P1[%c3], %P2[%c3]}, [%0]", ops);
++  output_asm_insn ("vst2.<V_sz_elem>\t{%P1[%c3], %P2[%c3]}, %A0", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vst1_vst2_lane")]
+ )
+ 
+ (define_insn "neon_vst2_lane<mode>"
+-  [(set (mem:<V_two_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_two_elem> 0 "neon_struct_operand" "=Um")
+         (unspec:<V_two_elem>
+            [(match_operand:OI 1 "s_register_operand" "w")
+             (match_operand:SI 2 "immediate_operand" "i")
+@@ -4895,7 +4893,7 @@
+   ops[1] = gen_rtx_REG (DImode, regno);
+   ops[2] = gen_rtx_REG (DImode, regno + 4);
+   ops[3] = GEN_INT (lane);
+-  output_asm_insn ("vst2.<V_sz_elem>\t{%P1[%c3], %P2[%c3]}, [%0]", ops);
++  output_asm_insn ("vst2.<V_sz_elem>\t{%P1[%c3], %P2[%c3]}, %A0", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vst1_vst2_lane")]
+@@ -4903,15 +4901,15 @@
+ 
+ (define_insn "neon_vld3<mode>"
+   [(set (match_operand:EI 0 "s_register_operand" "=w")
+-        (unspec:EI [(mem:EI (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:EI [(match_operand:EI 1 "neon_struct_operand" "Um")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VLD3))]
+   "TARGET_NEON"
+ {
+   if (<V_sz_elem> == 64)
+-    return "vld1.64\t%h0, [%1]";
++    return "vld1.64\t%h0, %A1";
+   else
+-    return "vld3.<V_sz_elem>\t%h0, [%1]";
++    return "vld3.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
+@@ -4920,27 +4918,25 @@
+ )
+ 
+ (define_expand "neon_vld3<mode>"
+-  [(match_operand:CI 0 "s_register_operand" "=w")
+-   (match_operand:SI 1 "s_register_operand" "+r")
++  [(match_operand:CI 0 "s_register_operand")
++   (match_operand:CI 1 "neon_struct_operand")
+    (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+   "TARGET_NEON"
+ {
+-  emit_insn (gen_neon_vld3qa<mode> (operands[0], operands[0],
+-                                    operands[1], operands[1]));
+-  emit_insn (gen_neon_vld3qb<mode> (operands[0], operands[0],
+-                                    operands[1], operands[1]));
++  rtx mem;
++
++  mem = adjust_address (operands[1], EImode, 0);
++  emit_insn (gen_neon_vld3qa<mode> (operands[0], mem));
++  mem = adjust_address (mem, EImode, GET_MODE_SIZE (EImode));
++  emit_insn (gen_neon_vld3qb<mode> (operands[0], mem, operands[0]));
+   DONE;
+ })
+ 
+ (define_insn "neon_vld3qa<mode>"
+   [(set (match_operand:CI 0 "s_register_operand" "=w")
+-        (unspec:CI [(mem:CI (match_operand:SI 3 "s_register_operand" "2"))
+-                    (match_operand:CI 1 "s_register_operand" "0")
++        (unspec:CI [(match_operand:EI 1 "neon_struct_operand" "Um")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VLD3A))
+-   (set (match_operand:SI 2 "s_register_operand" "=r")
+-        (plus:SI (match_dup 3)
+-		 (const_int 24)))]
++                   UNSPEC_VLD3A))]
+   "TARGET_NEON"
+ {
+   int regno = REGNO (operands[0]);
+@@ -4948,8 +4944,8 @@
+   ops[0] = gen_rtx_REG (DImode, regno);
+   ops[1] = gen_rtx_REG (DImode, regno + 4);
+   ops[2] = gen_rtx_REG (DImode, regno + 8);
+-  ops[3] = operands[2];
+-  output_asm_insn ("vld3.<V_sz_elem>\t{%P0, %P1, %P2}, [%3]!", ops);
++  ops[3] = operands[1];
++  output_asm_insn ("vld3.<V_sz_elem>\t{%P0, %P1, %P2}, %A3", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vld3_vld4")]
+@@ -4957,13 +4953,10 @@
+ 
+ (define_insn "neon_vld3qb<mode>"
+   [(set (match_operand:CI 0 "s_register_operand" "=w")
+-        (unspec:CI [(mem:CI (match_operand:SI 3 "s_register_operand" "2"))
+-                    (match_operand:CI 1 "s_register_operand" "0")
++        (unspec:CI [(match_operand:EI 1 "neon_struct_operand" "Um")
++                    (match_operand:CI 2 "s_register_operand" "0")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VLD3B))
+-   (set (match_operand:SI 2 "s_register_operand" "=r")
+-        (plus:SI (match_dup 3)
+-		 (const_int 24)))]
++                   UNSPEC_VLD3B))]
+   "TARGET_NEON"
+ {
+   int regno = REGNO (operands[0]);
+@@ -4971,8 +4964,8 @@
+   ops[0] = gen_rtx_REG (DImode, regno + 2);
+   ops[1] = gen_rtx_REG (DImode, regno + 6);
+   ops[2] = gen_rtx_REG (DImode, regno + 10);
+-  ops[3] = operands[2];
+-  output_asm_insn ("vld3.<V_sz_elem>\t{%P0, %P1, %P2}, [%3]!", ops);
++  ops[3] = operands[1];
++  output_asm_insn ("vld3.<V_sz_elem>\t{%P0, %P1, %P2}, %A3", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vld3_vld4")]
+@@ -4980,7 +4973,7 @@
+ 
+ (define_insn "neon_vld3_lane<mode>"
+   [(set (match_operand:EI 0 "s_register_operand" "=w")
+-        (unspec:EI [(mem:<V_three_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:EI [(match_operand:<V_three_elem> 1 "neon_struct_operand" "Um")
+                     (match_operand:EI 2 "s_register_operand" "0")
+                     (match_operand:SI 3 "immediate_operand" "i")
+                     (unspec:VD [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+@@ -4998,7 +4991,7 @@
+   ops[2] = gen_rtx_REG (DImode, regno + 4);
+   ops[3] = operands[1];
+   ops[4] = operands[3];
+-  output_asm_insn ("vld3.<V_sz_elem>\t{%P0[%c4], %P1[%c4], %P2[%c4]}, [%3]",
++  output_asm_insn ("vld3.<V_sz_elem>\t{%P0[%c4], %P1[%c4], %P2[%c4]}, %A3",
+                    ops);
+   return "";
+ }
+@@ -5007,7 +5000,7 @@
+ 
+ (define_insn "neon_vld3_lane<mode>"
+   [(set (match_operand:CI 0 "s_register_operand" "=w")
+-        (unspec:CI [(mem:<V_three_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:CI [(match_operand:<V_three_elem> 1 "neon_struct_operand" "Um")
+                     (match_operand:CI 2 "s_register_operand" "0")
+                     (match_operand:SI 3 "immediate_operand" "i")
+                     (unspec:VMQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+@@ -5030,7 +5023,7 @@
+   ops[2] = gen_rtx_REG (DImode, regno + 8);
+   ops[3] = operands[1];
+   ops[4] = GEN_INT (lane);
+-  output_asm_insn ("vld3.<V_sz_elem>\t{%P0[%c4], %P1[%c4], %P2[%c4]}, [%3]",
++  output_asm_insn ("vld3.<V_sz_elem>\t{%P0[%c4], %P1[%c4], %P2[%c4]}, %A3",
+                    ops);
+   return "";
+ }
+@@ -5039,7 +5032,7 @@
+ 
+ (define_insn "neon_vld3_dup<mode>"
+   [(set (match_operand:EI 0 "s_register_operand" "=w")
+-        (unspec:EI [(mem:<V_three_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:EI [(match_operand:<V_three_elem> 1 "neon_struct_operand" "Um")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VLD3_DUP))]
+   "TARGET_NEON"
+@@ -5052,11 +5045,11 @@
+       ops[1] = gen_rtx_REG (DImode, regno + 2);
+       ops[2] = gen_rtx_REG (DImode, regno + 4);
+       ops[3] = operands[1];
+-      output_asm_insn ("vld3.<V_sz_elem>\t{%P0[], %P1[], %P2[]}, [%3]", ops);
++      output_asm_insn ("vld3.<V_sz_elem>\t{%P0[], %P1[], %P2[]}, %A3", ops);
+       return "";
+     }
+   else
+-    return "vld1.<V_sz_elem>\t%h0, [%1]";
++    return "vld1.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
+@@ -5064,16 +5057,16 @@
+                     (const_string "neon_vld1_1_2_regs")))])
+ 
+ (define_insn "neon_vst3<mode>"
+-  [(set (mem:EI (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:EI 0 "neon_struct_operand" "=Um")
+         (unspec:EI [(match_operand:EI 1 "s_register_operand" "w")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VST3))]
+   "TARGET_NEON"
+ {
+   if (<V_sz_elem> == 64)
+-    return "vst1.64\t%h1, [%0]";
++    return "vst1.64\t%h1, %A0";
+   else
+-    return "vst3.<V_sz_elem>\t%h1, [%0]";
++    return "vst3.<V_sz_elem>\t%h1, %A0";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
+@@ -5081,62 +5074,60 @@
+                     (const_string "neon_vst2_4_regs_vst3_vst4")))])
+ 
+ (define_expand "neon_vst3<mode>"
+-  [(match_operand:SI 0 "s_register_operand" "+r")
+-   (match_operand:CI 1 "s_register_operand" "w")
++  [(match_operand:CI 0 "neon_struct_operand")
++   (match_operand:CI 1 "s_register_operand")
+    (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+   "TARGET_NEON"
+ {
+-  emit_insn (gen_neon_vst3qa<mode> (operands[0], operands[0], operands[1]));
+-  emit_insn (gen_neon_vst3qb<mode> (operands[0], operands[0], operands[1]));
++  rtx mem;
++
++  mem = adjust_address (operands[0], EImode, 0);
++  emit_insn (gen_neon_vst3qa<mode> (mem, operands[1]));
++  mem = adjust_address (mem, EImode, GET_MODE_SIZE (EImode));
++  emit_insn (gen_neon_vst3qb<mode> (mem, operands[1]));
+   DONE;
+ })
+ 
+ (define_insn "neon_vst3qa<mode>"
+-  [(set (mem:EI (match_operand:SI 1 "s_register_operand" "0"))
+-        (unspec:EI [(match_operand:CI 2 "s_register_operand" "w")
++  [(set (match_operand:EI 0 "neon_struct_operand" "=Um")
++        (unspec:EI [(match_operand:CI 1 "s_register_operand" "w")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VST3A))
+-   (set (match_operand:SI 0 "s_register_operand" "=r")
+-        (plus:SI (match_dup 1)
+-		 (const_int 24)))]
++                   UNSPEC_VST3A))]
+   "TARGET_NEON"
+ {
+-  int regno = REGNO (operands[2]);
++  int regno = REGNO (operands[1]);
+   rtx ops[4];
+   ops[0] = operands[0];
+   ops[1] = gen_rtx_REG (DImode, regno);
+   ops[2] = gen_rtx_REG (DImode, regno + 4);
+   ops[3] = gen_rtx_REG (DImode, regno + 8);
+-  output_asm_insn ("vst3.<V_sz_elem>\t{%P1, %P2, %P3}, [%0]!", ops);
++  output_asm_insn ("vst3.<V_sz_elem>\t{%P1, %P2, %P3}, %A0", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vst2_4_regs_vst3_vst4")]
+ )
+ 
+ (define_insn "neon_vst3qb<mode>"
+-  [(set (mem:EI (match_operand:SI 1 "s_register_operand" "0"))
+-        (unspec:EI [(match_operand:CI 2 "s_register_operand" "w")
++  [(set (match_operand:EI 0 "neon_struct_operand" "=Um")
++        (unspec:EI [(match_operand:CI 1 "s_register_operand" "w")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VST3B))
+-   (set (match_operand:SI 0 "s_register_operand" "=r")
+-        (plus:SI (match_dup 1)
+-		 (const_int 24)))]
++                   UNSPEC_VST3B))]
+   "TARGET_NEON"
+ {
+-  int regno = REGNO (operands[2]);
++  int regno = REGNO (operands[1]);
+   rtx ops[4];
+   ops[0] = operands[0];
+   ops[1] = gen_rtx_REG (DImode, regno + 2);
+   ops[2] = gen_rtx_REG (DImode, regno + 6);
+   ops[3] = gen_rtx_REG (DImode, regno + 10);
+-  output_asm_insn ("vst3.<V_sz_elem>\t{%P1, %P2, %P3}, [%0]!", ops);
++  output_asm_insn ("vst3.<V_sz_elem>\t{%P1, %P2, %P3}, %A0", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vst2_4_regs_vst3_vst4")]
+ )
+ 
+ (define_insn "neon_vst3_lane<mode>"
+-  [(set (mem:<V_three_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_three_elem> 0 "neon_struct_operand" "=Um")
+         (unspec:<V_three_elem>
+            [(match_operand:EI 1 "s_register_operand" "w")
+             (match_operand:SI 2 "immediate_operand" "i")
+@@ -5155,7 +5146,7 @@
+   ops[2] = gen_rtx_REG (DImode, regno + 2);
+   ops[3] = gen_rtx_REG (DImode, regno + 4);
+   ops[4] = operands[2];
+-  output_asm_insn ("vst3.<V_sz_elem>\t{%P1[%c4], %P2[%c4], %P3[%c4]}, [%0]",
++  output_asm_insn ("vst3.<V_sz_elem>\t{%P1[%c4], %P2[%c4], %P3[%c4]}, %A0",
+                    ops);
+   return "";
+ }
+@@ -5163,7 +5154,7 @@
+ )
+ 
+ (define_insn "neon_vst3_lane<mode>"
+-  [(set (mem:<V_three_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_three_elem> 0 "neon_struct_operand" "=Um")
+         (unspec:<V_three_elem>
+            [(match_operand:CI 1 "s_register_operand" "w")
+             (match_operand:SI 2 "immediate_operand" "i")
+@@ -5187,7 +5178,7 @@
+   ops[2] = gen_rtx_REG (DImode, regno + 4);
+   ops[3] = gen_rtx_REG (DImode, regno + 8);
+   ops[4] = GEN_INT (lane);
+-  output_asm_insn ("vst3.<V_sz_elem>\t{%P1[%c4], %P2[%c4], %P3[%c4]}, [%0]",
++  output_asm_insn ("vst3.<V_sz_elem>\t{%P1[%c4], %P2[%c4], %P3[%c4]}, %A0",
+                    ops);
+   return "";
+ }
+@@ -5195,15 +5186,15 @@
+ 
+ (define_insn "neon_vld4<mode>"
+   [(set (match_operand:OI 0 "s_register_operand" "=w")
+-        (unspec:OI [(mem:OI (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:OI [(match_operand:OI 1 "neon_struct_operand" "Um")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VLD4))]
+   "TARGET_NEON"
+ {
+   if (<V_sz_elem> == 64)
+-    return "vld1.64\t%h0, [%1]";
++    return "vld1.64\t%h0, %A1";
+   else
+-    return "vld4.<V_sz_elem>\t%h0, [%1]";
++    return "vld4.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
+@@ -5212,27 +5203,25 @@
+ )
+ 
+ (define_expand "neon_vld4<mode>"
+-  [(match_operand:XI 0 "s_register_operand" "=w")
+-   (match_operand:SI 1 "s_register_operand" "+r")
++  [(match_operand:XI 0 "s_register_operand")
++   (match_operand:XI 1 "neon_struct_operand")
+    (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+   "TARGET_NEON"
+ {
+-  emit_insn (gen_neon_vld4qa<mode> (operands[0], operands[0],
+-                                    operands[1], operands[1]));
+-  emit_insn (gen_neon_vld4qb<mode> (operands[0], operands[0],
+-                                    operands[1], operands[1]));
++  rtx mem;
++
++  mem = adjust_address (operands[1], OImode, 0);
++  emit_insn (gen_neon_vld4qa<mode> (operands[0], mem));
++  mem = adjust_address (mem, OImode, GET_MODE_SIZE (OImode));
++  emit_insn (gen_neon_vld4qb<mode> (operands[0], mem, operands[0]));
+   DONE;
+ })
+ 
+ (define_insn "neon_vld4qa<mode>"
+   [(set (match_operand:XI 0 "s_register_operand" "=w")
+-        (unspec:XI [(mem:XI (match_operand:SI 3 "s_register_operand" "2"))
+-                    (match_operand:XI 1 "s_register_operand" "0")
++        (unspec:XI [(match_operand:OI 1 "neon_struct_operand" "Um")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VLD4A))
+-   (set (match_operand:SI 2 "s_register_operand" "=r")
+-        (plus:SI (match_dup 3)
+-		 (const_int 32)))]
++                   UNSPEC_VLD4A))]
+   "TARGET_NEON"
+ {
+   int regno = REGNO (operands[0]);
+@@ -5241,8 +5230,8 @@
+   ops[1] = gen_rtx_REG (DImode, regno + 4);
+   ops[2] = gen_rtx_REG (DImode, regno + 8);
+   ops[3] = gen_rtx_REG (DImode, regno + 12);
+-  ops[4] = operands[2];
+-  output_asm_insn ("vld4.<V_sz_elem>\t{%P0, %P1, %P2, %P3}, [%4]!", ops);
++  ops[4] = operands[1];
++  output_asm_insn ("vld4.<V_sz_elem>\t{%P0, %P1, %P2, %P3}, %A4", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vld3_vld4")]
+@@ -5250,13 +5239,10 @@
+ 
+ (define_insn "neon_vld4qb<mode>"
+   [(set (match_operand:XI 0 "s_register_operand" "=w")
+-        (unspec:XI [(mem:XI (match_operand:SI 3 "s_register_operand" "2"))
+-                    (match_operand:XI 1 "s_register_operand" "0")
++        (unspec:XI [(match_operand:OI 1 "neon_struct_operand" "Um")
++                    (match_operand:XI 2 "s_register_operand" "0")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VLD4B))
+-   (set (match_operand:SI 2 "s_register_operand" "=r")
+-        (plus:SI (match_dup 3)
+-		 (const_int 32)))]
++                   UNSPEC_VLD4B))]
+   "TARGET_NEON"
+ {
+   int regno = REGNO (operands[0]);
+@@ -5265,8 +5251,8 @@
+   ops[1] = gen_rtx_REG (DImode, regno + 6);
+   ops[2] = gen_rtx_REG (DImode, regno + 10);
+   ops[3] = gen_rtx_REG (DImode, regno + 14);
+-  ops[4] = operands[2];
+-  output_asm_insn ("vld4.<V_sz_elem>\t{%P0, %P1, %P2, %P3}, [%4]!", ops);
++  ops[4] = operands[1];
++  output_asm_insn ("vld4.<V_sz_elem>\t{%P0, %P1, %P2, %P3}, %A4", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vld3_vld4")]
+@@ -5274,7 +5260,7 @@
+ 
+ (define_insn "neon_vld4_lane<mode>"
+   [(set (match_operand:OI 0 "s_register_operand" "=w")
+-        (unspec:OI [(mem:<V_four_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:OI [(match_operand:<V_four_elem> 1 "neon_struct_operand" "Um")
+                     (match_operand:OI 2 "s_register_operand" "0")
+                     (match_operand:SI 3 "immediate_operand" "i")
+                     (unspec:VD [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+@@ -5293,7 +5279,7 @@
+   ops[3] = gen_rtx_REG (DImode, regno + 6);
+   ops[4] = operands[1];
+   ops[5] = operands[3];
+-  output_asm_insn ("vld4.<V_sz_elem>\t{%P0[%c5], %P1[%c5], %P2[%c5], %P3[%c5]}, [%4]",
++  output_asm_insn ("vld4.<V_sz_elem>\t{%P0[%c5], %P1[%c5], %P2[%c5], %P3[%c5]}, %A4",
+                    ops);
+   return "";
+ }
+@@ -5302,7 +5288,7 @@
+ 
+ (define_insn "neon_vld4_lane<mode>"
+   [(set (match_operand:XI 0 "s_register_operand" "=w")
+-        (unspec:XI [(mem:<V_four_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:XI [(match_operand:<V_four_elem> 1 "neon_struct_operand" "Um")
+                     (match_operand:XI 2 "s_register_operand" "0")
+                     (match_operand:SI 3 "immediate_operand" "i")
+                     (unspec:VMQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+@@ -5326,7 +5312,7 @@
+   ops[3] = gen_rtx_REG (DImode, regno + 12);
+   ops[4] = operands[1];
+   ops[5] = GEN_INT (lane);
+-  output_asm_insn ("vld4.<V_sz_elem>\t{%P0[%c5], %P1[%c5], %P2[%c5], %P3[%c5]}, [%4]",
++  output_asm_insn ("vld4.<V_sz_elem>\t{%P0[%c5], %P1[%c5], %P2[%c5], %P3[%c5]}, %A4",
+                    ops);
+   return "";
+ }
+@@ -5335,7 +5321,7 @@
+ 
+ (define_insn "neon_vld4_dup<mode>"
+   [(set (match_operand:OI 0 "s_register_operand" "=w")
+-        (unspec:OI [(mem:<V_four_elem> (match_operand:SI 1 "s_register_operand" "r"))
++        (unspec:OI [(match_operand:<V_four_elem> 1 "neon_struct_operand" "Um")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VLD4_DUP))]
+   "TARGET_NEON"
+@@ -5349,12 +5335,12 @@
+       ops[2] = gen_rtx_REG (DImode, regno + 4);
+       ops[3] = gen_rtx_REG (DImode, regno + 6);
+       ops[4] = operands[1];
+-      output_asm_insn ("vld4.<V_sz_elem>\t{%P0[], %P1[], %P2[], %P3[]}, [%4]",
++      output_asm_insn ("vld4.<V_sz_elem>\t{%P0[], %P1[], %P2[], %P3[]}, %A4",
+                        ops);
+       return "";
+     }
+   else
+-    return "vld1.<V_sz_elem>\t%h0, [%1]";
++    return "vld1.<V_sz_elem>\t%h0, %A1";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
+@@ -5363,16 +5349,16 @@
+ )
+ 
+ (define_insn "neon_vst4<mode>"
+-  [(set (mem:OI (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:OI 0 "neon_struct_operand" "=Um")
+         (unspec:OI [(match_operand:OI 1 "s_register_operand" "w")
+                     (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+                    UNSPEC_VST4))]
+   "TARGET_NEON"
+ {
+   if (<V_sz_elem> == 64)
+-    return "vst1.64\t%h1, [%0]";
++    return "vst1.64\t%h1, %A0";
+   else
+-    return "vst4.<V_sz_elem>\t%h1, [%0]";
++    return "vst4.<V_sz_elem>\t%h1, %A0";
+ }
+   [(set (attr "neon_type")
+       (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
+@@ -5381,64 +5367,62 @@
+ )
+ 
+ (define_expand "neon_vst4<mode>"
+-  [(match_operand:SI 0 "s_register_operand" "+r")
+-   (match_operand:XI 1 "s_register_operand" "w")
++  [(match_operand:XI 0 "neon_struct_operand")
++   (match_operand:XI 1 "s_register_operand")
+    (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+   "TARGET_NEON"
+ {
+-  emit_insn (gen_neon_vst4qa<mode> (operands[0], operands[0], operands[1]));
+-  emit_insn (gen_neon_vst4qb<mode> (operands[0], operands[0], operands[1]));
++  rtx mem;
++
++  mem = adjust_address (operands[0], OImode, 0);
++  emit_insn (gen_neon_vst4qa<mode> (mem, operands[1]));
++  mem = adjust_address (mem, OImode, GET_MODE_SIZE (OImode));
++  emit_insn (gen_neon_vst4qb<mode> (mem, operands[1]));
+   DONE;
+ })
+ 
+ (define_insn "neon_vst4qa<mode>"
+-  [(set (mem:OI (match_operand:SI 1 "s_register_operand" "0"))
+-        (unspec:OI [(match_operand:XI 2 "s_register_operand" "w")
++  [(set (match_operand:OI 0 "neon_struct_operand" "=Um")
++        (unspec:OI [(match_operand:XI 1 "s_register_operand" "w")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VST4A))
+-   (set (match_operand:SI 0 "s_register_operand" "=r")
+-        (plus:SI (match_dup 1)
+-		 (const_int 32)))]
++                   UNSPEC_VST4A))]
+   "TARGET_NEON"
+ {
+-  int regno = REGNO (operands[2]);
++  int regno = REGNO (operands[1]);
+   rtx ops[5];
+   ops[0] = operands[0];
+   ops[1] = gen_rtx_REG (DImode, regno);
+   ops[2] = gen_rtx_REG (DImode, regno + 4);
+   ops[3] = gen_rtx_REG (DImode, regno + 8);
+   ops[4] = gen_rtx_REG (DImode, regno + 12);
+-  output_asm_insn ("vst4.<V_sz_elem>\t{%P1, %P2, %P3, %P4}, [%0]!", ops);
++  output_asm_insn ("vst4.<V_sz_elem>\t{%P1, %P2, %P3, %P4}, %A0", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vst2_4_regs_vst3_vst4")]
+ )
+ 
+ (define_insn "neon_vst4qb<mode>"
+-  [(set (mem:OI (match_operand:SI 1 "s_register_operand" "0"))
+-        (unspec:OI [(match_operand:XI 2 "s_register_operand" "w")
++  [(set (match_operand:OI 0 "neon_struct_operand" "=Um")
++        (unspec:OI [(match_operand:XI 1 "s_register_operand" "w")
+                     (unspec:VQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
+-                   UNSPEC_VST4B))
+-   (set (match_operand:SI 0 "s_register_operand" "=r")
+-        (plus:SI (match_dup 1)
+-		 (const_int 32)))]
++                   UNSPEC_VST4B))]
+   "TARGET_NEON"
+ {
+-  int regno = REGNO (operands[2]);
++  int regno = REGNO (operands[1]);
+   rtx ops[5];
+   ops[0] = operands[0];
+   ops[1] = gen_rtx_REG (DImode, regno + 2);
+   ops[2] = gen_rtx_REG (DImode, regno + 6);
+   ops[3] = gen_rtx_REG (DImode, regno + 10);
+   ops[4] = gen_rtx_REG (DImode, regno + 14);
+-  output_asm_insn ("vst4.<V_sz_elem>\t{%P1, %P2, %P3, %P4}, [%0]!", ops);
++  output_asm_insn ("vst4.<V_sz_elem>\t{%P1, %P2, %P3, %P4}, %A0", ops);
+   return "";
+ }
+   [(set_attr "neon_type" "neon_vst2_4_regs_vst3_vst4")]
+ )
+ 
+ (define_insn "neon_vst4_lane<mode>"
+-  [(set (mem:<V_four_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_four_elem> 0 "neon_struct_operand" "=Um")
+         (unspec:<V_four_elem>
+            [(match_operand:OI 1 "s_register_operand" "w")
+             (match_operand:SI 2 "immediate_operand" "i")
+@@ -5458,7 +5442,7 @@
+   ops[3] = gen_rtx_REG (DImode, regno + 4);
+   ops[4] = gen_rtx_REG (DImode, regno + 6);
+   ops[5] = operands[2];
+-  output_asm_insn ("vst4.<V_sz_elem>\t{%P1[%c5], %P2[%c5], %P3[%c5], %P4[%c5]}, [%0]",
++  output_asm_insn ("vst4.<V_sz_elem>\t{%P1[%c5], %P2[%c5], %P3[%c5], %P4[%c5]}, %A0",
+                    ops);
+   return "";
+ }
+@@ -5466,7 +5450,7 @@
+ )
+ 
+ (define_insn "neon_vst4_lane<mode>"
+-  [(set (mem:<V_four_elem> (match_operand:SI 0 "s_register_operand" "r"))
++  [(set (match_operand:<V_four_elem> 0 "neon_struct_operand" "=Um")
+         (unspec:<V_four_elem>
+            [(match_operand:XI 1 "s_register_operand" "w")
+             (match_operand:SI 2 "immediate_operand" "i")
+@@ -5491,7 +5475,7 @@
+   ops[3] = gen_rtx_REG (DImode, regno + 8);
+   ops[4] = gen_rtx_REG (DImode, regno + 12);
+   ops[5] = GEN_INT (lane);
+-  output_asm_insn ("vst4.<V_sz_elem>\t{%P1[%c5], %P2[%c5], %P3[%c5], %P4[%c5]}, [%0]",
++  output_asm_insn ("vst4.<V_sz_elem>\t{%P1[%c5], %P2[%c5], %P3[%c5], %P4[%c5]}, %A0",
+                    ops);
+   return "";
+ }
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-04-06 12:29:08 +0000
++++ new/gcc/config/arm/predicates.md	2011-04-20 10:00:39 +0000
+@@ -681,3 +681,7 @@
+    } 
+   return true; 
+ })
++
++(define_special_predicate "neon_struct_operand"
++  (and (match_code "mem")
++       (match_test "TARGET_32BIT && neon_vector_mem_operand (op, 2)")))
+
+=== modified file 'gcc/doc/tm.texi'
+--- old/gcc/doc/tm.texi	2011-02-08 10:51:58 +0000
++++ new/gcc/doc/tm.texi	2011-04-20 10:07:36 +0000
+@@ -2642,8 +2642,8 @@
+ register, so @code{PREFERRED_RELOAD_CLASS} returns @code{NO_REGS} when
+ @var{x} is a floating-point constant.  If the constant can't be loaded
+ into any kind of register, code generation will be better if
+-@code{LEGITIMATE_CONSTANT_P} makes the constant illegitimate instead
+-of using @code{PREFERRED_RELOAD_CLASS}.
++@code{TARGET_LEGITIMATE_CONSTANT_P} makes the constant illegitimate instead
++of using @code{TARGET_PREFERRED_RELOAD_CLASS}.
+ 
+ If an insn has pseudos in it after register allocation, reload will go
+ through the alternatives and call repeatedly @code{PREFERRED_RELOAD_CLASS}
+@@ -4367,6 +4367,34 @@
+ must have move patterns for this mode.
+ @end deftypefn
+ 
++@deftypefn {Target Hook} bool TARGET_ARRAY_MODE_SUPPORTED_P (enum machine_mode @var{mode}, unsigned HOST_WIDE_INT @var{nelems})
++Return true if GCC should try to use a scalar mode to store an array
++of @var{nelems} elements, given that each element has mode @var{mode}.
++Returning true here overrides the usual @code{MAX_FIXED_MODE} limit
++and allows GCC to use any defined integer mode.
++
++One use of this hook is to support vector load and store operations
++that operate on several homogeneous vectors.  For example, ARM Neon
++has operations like:
++
++@smallexample
++int8x8x3_t vld3_s8 (const int8_t *)
++@end smallexample
++
++where the return type is defined as:
++
++@smallexample
++typedef struct int8x8x3_t
++@{
++  int8x8_t val[3];
++@} int8x8x3_t;
++@end smallexample
++
++If this hook allows @code{val} to have a scalar mode, then
++@code{int8x8x3_t} can have the same mode.  GCC can then store
++@code{int8x8x3_t}s in registers rather than forcing them onto the stack.
++@end deftypefn
++
+ @node Scalar Return
+ @subsection How Scalar Function Values Are Returned
+ @cindex return values in registers
+@@ -5600,13 +5628,13 @@
+ You may assume that @var{addr} is a valid address for the machine.
+ @end defmac
+ 
+-@defmac LEGITIMATE_CONSTANT_P (@var{x})
+-A C expression that is nonzero if @var{x} is a legitimate constant for
+-an immediate operand on the target machine.  You can assume that
+-@var{x} satisfies @code{CONSTANT_P}, so you need not check this.  In fact,
+-@samp{1} is a suitable definition for this macro on machines where
+-anything @code{CONSTANT_P} is valid.
+-@end defmac
++@deftypefn {Target Hook} bool TARGET_LEGITIMATE_CONSTANT_P (enum machine_mode @var{mode}, rtx @var{x})
++This hook returns true if @var{x} is a legitimate constant for a
++@var{mode}-mode immediate operand on the target machine.  You can assume that
++@var{x} satisfies @code{CONSTANT_P}, so you need not check this.
++
++The default definition returns true.
++@end deftypefn
+ 
+ @deftypefn {Target Hook} rtx TARGET_DELEGITIMIZE_ADDRESS (rtx @var{x})
+ This hook is used to undo the possibly obfuscating effects of the
+
+=== modified file 'gcc/expr.c'
+--- old/gcc/expr.c	2011-03-23 12:22:13 +0000
++++ new/gcc/expr.c	2011-04-20 10:07:36 +0000
+@@ -1537,7 +1537,7 @@
+   if (nregs == 0)
+     return;
+ 
+-  if (CONSTANT_P (x) && ! LEGITIMATE_CONSTANT_P (x))
++  if (CONSTANT_P (x) && !targetm.legitimate_constant_p (mode, x))
+     x = validize_mem (force_const_mem (mode, x));
+ 
+   /* See if the machine can do this with a load multiple insn.  */
+@@ -2366,7 +2366,7 @@
+ 		    offset -= size;
+ 
+ 		  cst = (*constfun) (constfundata, offset, mode);
+-		  if (!LEGITIMATE_CONSTANT_P (cst))
++		  if (!targetm.legitimate_constant_p (mode, cst))
+ 		    return 0;
+ 
+ 		  if (!reverse)
+@@ -3440,7 +3440,7 @@
+ 
+       y_cst = y;
+ 
+-      if (!LEGITIMATE_CONSTANT_P (y))
++      if (!targetm.legitimate_constant_p (mode, y))
+ 	{
+ 	  y = force_const_mem (mode, y);
+ 
+@@ -3496,7 +3496,7 @@
+ 
+   REAL_VALUE_FROM_CONST_DOUBLE (r, y);
+ 
+-  if (LEGITIMATE_CONSTANT_P (y))
++  if (targetm.legitimate_constant_p (dstmode, y))
+     oldcost = rtx_cost (y, SET, speed);
+   else
+     oldcost = rtx_cost (force_const_mem (dstmode, y), SET, speed);
+@@ -3519,7 +3519,7 @@
+ 
+       trunc_y = CONST_DOUBLE_FROM_REAL_VALUE (r, srcmode);
+ 
+-      if (LEGITIMATE_CONSTANT_P (trunc_y))
++      if (targetm.legitimate_constant_p (srcmode, trunc_y))
+ 	{
+ 	  /* Skip if the target needs extra instructions to perform
+ 	     the extension.  */
+@@ -3932,7 +3932,7 @@
+ 	 by setting SKIP to 0.  */
+       skip = (reg_parm_stack_space == 0) ? 0 : not_stack;
+ 
+-      if (CONSTANT_P (x) && ! LEGITIMATE_CONSTANT_P (x))
++      if (CONSTANT_P (x) && !targetm.legitimate_constant_p (mode, x))
+ 	x = validize_mem (force_const_mem (mode, x));
+ 
+       /* If X is a hard register in a non-integer mode, copy it into a pseudo;
+@@ -8951,7 +8951,7 @@
+ 	   constant and we don't need a memory reference.  */
+ 	if (CONSTANT_P (op0)
+ 	    && mode2 != BLKmode
+-	    && LEGITIMATE_CONSTANT_P (op0)
++	    && targetm.legitimate_constant_p (mode2, op0)
+ 	    && !must_force_mem)
+ 	  op0 = force_reg (mode2, op0);
+ 
+
+=== modified file 'gcc/hooks.c'
+--- old/gcc/hooks.c	2009-11-26 01:52:19 +0000
++++ new/gcc/hooks.c	2011-04-20 10:06:58 +0000
+@@ -86,6 +86,15 @@
+   return true;
+ }
+ 
++/* Generic hook that takes (enum machine_mode, unsigned HOST_WIDE_INT)
++   and returns false.  */
++bool
++hook_bool_mode_uhwi_false (enum machine_mode mode ATTRIBUTE_UNUSED,
++			   unsigned HOST_WIDE_INT value ATTRIBUTE_UNUSED)
++{
++  return false;
++}
++
+ /* Generic hook that takes (FILE *, const char *) and does nothing.  */
+ void
+ hook_void_FILEptr_constcharptr (FILE *a ATTRIBUTE_UNUSED, const char *b ATTRIBUTE_UNUSED)
+
+=== modified file 'gcc/hooks.h'
+--- old/gcc/hooks.h	2009-11-26 01:52:19 +0000
++++ new/gcc/hooks.h	2011-04-20 10:06:58 +0000
+@@ -32,6 +32,8 @@
+ extern bool hook_bool_mode_false (enum machine_mode);
+ extern bool hook_bool_mode_const_rtx_false (enum machine_mode, const_rtx);
+ extern bool hook_bool_mode_const_rtx_true (enum machine_mode, const_rtx);
++extern bool hook_bool_mode_uhwi_false (enum machine_mode,
++				       unsigned HOST_WIDE_INT);
+ extern bool hook_bool_tree_false (tree);
+ extern bool hook_bool_const_tree_false (const_tree);
+ extern bool hook_bool_tree_true (tree);
+
+=== modified file 'gcc/recog.c'
+--- old/gcc/recog.c	2011-02-08 12:07:29 +0000
++++ new/gcc/recog.c	2011-04-20 10:07:36 +0000
+@@ -932,7 +932,9 @@
+     return ((GET_MODE (op) == VOIDmode || GET_MODE (op) == mode
+ 	     || mode == VOIDmode)
+ 	    && (! flag_pic || LEGITIMATE_PIC_OPERAND_P (op))
+-	    && LEGITIMATE_CONSTANT_P (op));
++	    && targetm.legitimate_constant_p (mode == VOIDmode
++					      ? GET_MODE (op)
++					      : mode, op));
+ 
+   /* Except for certain constants with VOIDmode, already checked for,
+      OP's mode must match MODE if MODE specifies a mode.  */
+@@ -1109,7 +1111,9 @@
+ 	  && (GET_MODE (op) == mode || mode == VOIDmode
+ 	      || GET_MODE (op) == VOIDmode)
+ 	  && (! flag_pic || LEGITIMATE_PIC_OPERAND_P (op))
+-	  && LEGITIMATE_CONSTANT_P (op));
++	  && targetm.legitimate_constant_p (mode == VOIDmode
++					    ? GET_MODE (op)
++					    : mode, op));
+ }
+ 
+ /* Returns 1 if OP is an operand that is a CONST_INT.  */
+@@ -1175,7 +1179,9 @@
+       return ((GET_MODE (op) == VOIDmode || GET_MODE (op) == mode
+ 	       || mode == VOIDmode)
+ 	      && (! flag_pic || LEGITIMATE_PIC_OPERAND_P (op))
+-	      && LEGITIMATE_CONSTANT_P (op));
++	      && targetm.legitimate_constant_p (mode == VOIDmode
++						? GET_MODE (op)
++						: mode, op));
+     }
+ 
+   if (GET_MODE (op) != mode && mode != VOIDmode)
+
+=== modified file 'gcc/reload.c'
+--- old/gcc/reload.c	2011-02-08 12:07:29 +0000
++++ new/gcc/reload.c	2011-04-20 10:07:36 +0000
+@@ -4739,7 +4739,8 @@
+ 	    simplify_gen_subreg (GET_MODE (x), reg_equiv_constant[regno],
+ 				 GET_MODE (SUBREG_REG (x)), SUBREG_BYTE (x));
+ 	  gcc_assert (tem);
+-	  if (CONSTANT_P (tem) && !LEGITIMATE_CONSTANT_P (tem))
++	  if (CONSTANT_P (tem)
++	      && !targetm.legitimate_constant_p (GET_MODE (x), tem))
+ 	    {
+ 	      tem = force_const_mem (GET_MODE (x), tem);
+ 	      i = find_reloads_address (GET_MODE (tem), &tem, XEXP (tem, 0),
+@@ -6061,7 +6062,7 @@
+ 			   enum reload_type type, int ind_levels)
+ {
+   if (CONSTANT_P (x)
+-      && (! LEGITIMATE_CONSTANT_P (x)
++      && (!targetm.legitimate_constant_p (mode, x)
+ 	  || PREFERRED_RELOAD_CLASS (x, rclass) == NO_REGS))
+     {
+       x = force_const_mem (mode, x);
+@@ -6071,7 +6072,7 @@
+ 
+   else if (GET_CODE (x) == PLUS
+ 	   && CONSTANT_P (XEXP (x, 1))
+-	   && (! LEGITIMATE_CONSTANT_P (XEXP (x, 1))
++	   && (!targetm.legitimate_constant_p (GET_MODE (x), XEXP (x, 1))
+ 	       || PREFERRED_RELOAD_CLASS (XEXP (x, 1), rclass) == NO_REGS))
+     {
+       rtx tem;
+
+=== modified file 'gcc/reload1.c'
+--- old/gcc/reload1.c	2011-03-02 13:30:06 +0000
++++ new/gcc/reload1.c	2011-04-20 10:07:36 +0000
+@@ -4164,6 +4164,9 @@
+ 		}
+ 	      else if (function_invariant_p (x))
+ 		{
++		  enum machine_mode mode;
++
++		  mode = GET_MODE (SET_DEST (set));
+ 		  if (GET_CODE (x) == PLUS)
+ 		    {
+ 		      /* This is PLUS of frame pointer and a constant,
+@@ -4176,12 +4179,11 @@
+ 		      reg_equiv_invariant[i] = x;
+ 		      num_eliminable_invariants++;
+ 		    }
+-		  else if (LEGITIMATE_CONSTANT_P (x))
++		  else if (targetm.legitimate_constant_p (mode, x))
+ 		    reg_equiv_constant[i] = x;
+ 		  else
+ 		    {
+-		      reg_equiv_memory_loc[i]
+-			= force_const_mem (GET_MODE (SET_DEST (set)), x);
++		      reg_equiv_memory_loc[i] = force_const_mem (mode, x);
+ 		      if (! reg_equiv_memory_loc[i])
+ 			reg_equiv_init[i] = NULL_RTX;
+ 		    }
+
+=== modified file 'gcc/stor-layout.c'
+--- old/gcc/stor-layout.c	2011-04-06 12:29:08 +0000
++++ new/gcc/stor-layout.c	2011-04-20 10:06:58 +0000
+@@ -507,6 +507,34 @@
+   return MIN (BIGGEST_ALIGNMENT, MAX (1, mode_base_align[mode]*BITS_PER_UNIT));
+ }
+ 
++/* Return the natural mode of an array, given that it is SIZE bytes in
++   total and has elements of type ELEM_TYPE.  */
++
++static enum machine_mode
++mode_for_array (tree elem_type, tree size)
++{
++  tree elem_size;
++  unsigned HOST_WIDE_INT int_size, int_elem_size;
++  bool limit_p;
++
++  /* One-element arrays get the component type's mode.  */
++  elem_size = TYPE_SIZE (elem_type);
++  if (simple_cst_equal (size, elem_size))
++    return TYPE_MODE (elem_type);
++
++  limit_p = true;
++  if (host_integerp (size, 1) && host_integerp (elem_size, 1))
++    {
++      int_size = tree_low_cst (size, 1);
++      int_elem_size = tree_low_cst (elem_size, 1);
++      if (int_elem_size > 0
++	  && int_size % int_elem_size == 0
++	  && targetm.array_mode_supported_p (TYPE_MODE (elem_type),
++					     int_size / int_elem_size))
++	limit_p = false;
++    }
++  return mode_for_size_tree (size, MODE_INT, limit_p);
++}
+ 
+ /* Subroutine of layout_decl: Force alignment required for the data type.
+    But if the decl itself wants greater alignment, don't override that.  */
+@@ -2044,14 +2072,8 @@
+ 	    && (TYPE_MODE (TREE_TYPE (type)) != BLKmode
+ 		|| TYPE_NO_FORCE_BLK (TREE_TYPE (type))))
+ 	  {
+-	    /* One-element arrays get the component type's mode.  */
+-	    if (simple_cst_equal (TYPE_SIZE (type),
+-				  TYPE_SIZE (TREE_TYPE (type))))
+-	      SET_TYPE_MODE (type, TYPE_MODE (TREE_TYPE (type)));
+-	    else
+-	      SET_TYPE_MODE (type, mode_for_size_tree (TYPE_SIZE (type),
+-						       MODE_INT, 1));
+-
++	    SET_TYPE_MODE (type, mode_for_array (TREE_TYPE (type),
++						 TYPE_SIZE (type)));
+ 	    if (TYPE_MODE (type) != BLKmode
+ 		&& STRICT_ALIGNMENT && TYPE_ALIGN (type) < BIGGEST_ALIGNMENT
+ 		&& TYPE_ALIGN (type) < GET_MODE_ALIGNMENT (TYPE_MODE (type)))
+
+=== modified file 'gcc/target-def.h'
+--- old/gcc/target-def.h	2010-08-10 13:31:21 +0000
++++ new/gcc/target-def.h	2011-04-20 10:07:36 +0000
+@@ -553,12 +553,17 @@
+ #define TARGET_VECTOR_MODE_SUPPORTED_P hook_bool_mode_false
+ #endif
+ 
++#ifndef TARGET_ARRAY_MODE_SUPPORTED_P
++#define TARGET_ARRAY_MODE_SUPPORTED_P hook_bool_mode_uhwi_false
++#endif
++
+ /* In hooks.c.  */
+ #define TARGET_CANNOT_MODIFY_JUMPS_P hook_bool_void_false
+ #define TARGET_BRANCH_TARGET_REGISTER_CLASS \
+   default_branch_target_register_class
+ #define TARGET_BRANCH_TARGET_REGISTER_CALLEE_SAVED hook_bool_bool_false
+ #define TARGET_HAVE_CONDITIONAL_EXECUTION default_have_conditional_execution
++#define TARGET_LEGITIMATE_CONSTANT_P default_legitimate_constant_p
+ #define TARGET_CANNOT_FORCE_CONST_MEM hook_bool_rtx_false
+ #define TARGET_CANNOT_COPY_INSN_P NULL
+ #define TARGET_COMMUTATIVE_P hook_bool_const_rtx_commutative_p
+@@ -961,6 +966,7 @@
+   TARGET_BRANCH_TARGET_REGISTER_CLASS,		\
+   TARGET_BRANCH_TARGET_REGISTER_CALLEE_SAVED,	\
+   TARGET_HAVE_CONDITIONAL_EXECUTION,		\
++  TARGET_LEGITIMATE_CONSTANT_P,			\
+   TARGET_CANNOT_FORCE_CONST_MEM,		\
+   TARGET_CANNOT_COPY_INSN_P,			\
+   TARGET_COMMUTATIVE_P,				\
+@@ -985,6 +991,7 @@
+   TARGET_ADDR_SPACE_HOOKS,			\
+   TARGET_SCALAR_MODE_SUPPORTED_P,		\
+   TARGET_VECTOR_MODE_SUPPORTED_P,               \
++  TARGET_ARRAY_MODE_SUPPORTED_P,		\
+   TARGET_RTX_COSTS,				\
+   TARGET_ADDRESS_COST,				\
+   TARGET_ALLOCATE_INITIAL_VALUE,		\
+
+=== modified file 'gcc/target.h'
+--- old/gcc/target.h	2010-08-10 13:31:21 +0000
++++ new/gcc/target.h	2011-04-20 10:07:36 +0000
+@@ -645,7 +645,10 @@
+   /* Return true if the target supports conditional execution.  */
+   bool (* have_conditional_execution) (void);
+ 
+-  /* True if the constant X cannot be placed in the constant pool.  */
++  /* See tm.texi.  */
++  bool (* legitimate_constant_p) (enum machine_mode, rtx);
++
++    /* True if the constant X cannot be placed in the constant pool.  */
+   bool (* cannot_force_const_mem) (rtx);
+ 
+   /* True if the insn X cannot be duplicated.  */
+@@ -764,6 +767,9 @@
+      for further details.  */
+   bool (* vector_mode_supported_p) (enum machine_mode mode);
+ 
++  /* See tm.texi.  */
++  bool (* array_mode_supported_p) (enum machine_mode, unsigned HOST_WIDE_INT);
++
+   /* Compute a (partial) cost for rtx X.  Return true if the complete
+      cost has been computed, and false if subexpressions should be
+      scanned.  In either case, *TOTAL contains the cost result.  */
+
+=== modified file 'gcc/targhooks.c'
+--- old/gcc/targhooks.c	2010-03-27 10:27:39 +0000
++++ new/gcc/targhooks.c	2011-04-20 10:07:36 +0000
+@@ -1008,4 +1008,15 @@
+ #endif
+ }
+ 
++bool
++default_legitimate_constant_p (enum machine_mode mode ATTRIBUTE_UNUSED,
++			       rtx x ATTRIBUTE_UNUSED)
++{
++#ifdef LEGITIMATE_CONSTANT_P
++  return LEGITIMATE_CONSTANT_P (x);
++#else
++  return true;
++#endif
++}
++
+ #include "gt-targhooks.h"
+
+=== modified file 'gcc/targhooks.h'
+--- old/gcc/targhooks.h	2010-03-27 10:27:39 +0000
++++ new/gcc/targhooks.h	2011-04-20 10:07:36 +0000
+@@ -132,3 +132,4 @@
+ extern rtx default_addr_space_convert (rtx, tree, tree);
+ extern unsigned int default_case_values_threshold (void);
+ extern bool default_have_conditional_execution (void);
++extern bool default_legitimate_constant_p (enum machine_mode, rtx);
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-vld3-1.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-vld3-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-vld3-1.c	2011-04-20 10:00:39 +0000
+@@ -0,0 +1,27 @@
++/* { dg-do run } */
++/* { dg-require-effective-target arm_neon_hw } */
++/* { dg-options "-O2" } */
++/* { dg-add-options arm_neon } */
++
++#include "arm_neon.h"
++
++uint32_t buffer[12];
++
++void __attribute__((noinline))
++foo (uint32_t *a)
++{
++  uint32x4x3_t x;
++
++  x = vld3q_u32 (a);
++  x.val[0] = vaddq_u32 (x.val[0], x.val[1]);
++  vst3q_u32 (a, x);
++}
++
++int
++main (void)
++{
++  buffer[0] = 1;
++  buffer[1] = 2;
++  foo (buffer);
++  return buffer[0] != 3;
++}
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-vst3-1.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-vst3-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-vst3-1.c	2011-04-20 10:00:39 +0000
+@@ -0,0 +1,25 @@
++/* { dg-do run } */
++/* { dg-require-effective-target arm_neon_hw } */
++/* { dg-options "-O2" } */
++/* { dg-add-options arm_neon } */
++
++#include "arm_neon.h"
++
++uint32_t buffer[64];
++
++void __attribute__((noinline))
++foo (uint32_t *a)
++{
++  uint32x4x3_t x;
++
++  x = vld3q_u32 (a);
++  a[35] = 1;
++  vst3q_lane_u32 (a + 32, x, 1);
++}
++
++int
++main (void)
++{
++  foo (buffer);
++  return buffer[35] != 1;
++}
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x4_t = vld1q_dup_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x8_t = vld1q_dup_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x16_t = vld1q_dup_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x8_t = vld1q_dup_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x4_t = vld1q_dup_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x2_t = vld1q_dup_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x16_t = vld1q_dup_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x8_t = vld1q_dup_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x4_t = vld1q_dup_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x2_t = vld1q_dup_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x16_t = vld1q_dup_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x4_t = vld1q_lane_f32 (0, arg1_float32x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x8_t = vld1q_lane_p16 (0, arg1_poly16x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly8x16_t = vld1q_lane_p8 (0, arg1_poly8x16_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x8_t = vld1q_lane_s16 (0, arg1_int16x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x4_t = vld1q_lane_s32 (0, arg1_int32x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int64x2_t = vld1q_lane_s64 (0, arg1_int64x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int8x16_t = vld1q_lane_s8 (0, arg1_int8x16_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x8_t = vld1q_lane_u16 (0, arg1_uint16x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x4_t = vld1q_lane_u32 (0, arg1_uint32x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint64x2_t = vld1q_lane_u64 (0, arg1_uint64x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint8x16_t = vld1q_lane_u8 (0, arg1_uint8x16_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x4_t = vld1q_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x8_t = vld1q_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x16_t = vld1q_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x8_t = vld1q_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x4_t = vld1q_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x2_t = vld1q_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x16_t = vld1q_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x8_t = vld1q_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x4_t = vld1q_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x2_t = vld1q_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x16_t = vld1q_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2_t = vld1_dup_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4_t = vld1_dup_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8_t = vld1_dup_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4_t = vld1_dup_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2_t = vld1_dup_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1_t = vld1_dup_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8_t = vld1_dup_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4_t = vld1_dup_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2_t = vld1_dup_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1_t = vld1_dup_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8_t = vld1_dup_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x2_t = vld1_lane_f32 (0, arg1_float32x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x4_t = vld1_lane_p16 (0, arg1_poly16x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly8x8_t = vld1_lane_p8 (0, arg1_poly8x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x4_t = vld1_lane_s16 (0, arg1_int16x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x2_t = vld1_lane_s32 (0, arg1_int32x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int64x1_t = vld1_lane_s64 (0, arg1_int64x1_t, 0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int8x8_t = vld1_lane_s8 (0, arg1_int8x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x4_t = vld1_lane_u16 (0, arg1_uint16x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x2_t = vld1_lane_u32 (0, arg1_uint32x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint64x1_t = vld1_lane_u64 (0, arg1_uint64x1_t, 0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint8x8_t = vld1_lane_u8 (0, arg1_uint8x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1f32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2_t = vld1_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1p16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4_t = vld1_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1p8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8_t = vld1_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1s16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4_t = vld1_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1s32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2_t = vld1_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1s64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1_t = vld1_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1s8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8_t = vld1_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1u16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4_t = vld1_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1u32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2_t = vld1_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1u64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1_t = vld1_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld1u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld1u8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8_t = vld1_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x4x2_t = vld2q_lane_f32 (0, arg1_float32x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x8x2_t = vld2q_lane_p16 (0, arg1_poly16x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x8x2_t = vld2q_lane_s16 (0, arg1_int16x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x4x2_t = vld2q_lane_s32 (0, arg1_int32x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x8x2_t = vld2q_lane_u16 (0, arg1_uint16x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x4x2_t = vld2q_lane_u32 (0, arg1_uint32x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_float32x4x2_t = vld2q_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_poly16x8x2_t = vld2q_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_poly8x16x2_t = vld2q_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int16x8x2_t = vld2q_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int32x4x2_t = vld2q_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int8x16x2_t = vld2q_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint16x8x2_t = vld2q_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint32x4x2_t = vld2q_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint8x16x2_t = vld2q_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2x2_t = vld2_dup_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4x2_t = vld2_dup_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8x2_t = vld2_dup_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4x2_t = vld2_dup_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2x2_t = vld2_dup_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1x2_t = vld2_dup_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8x2_t = vld2_dup_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4x2_t = vld2_dup_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2x2_t = vld2_dup_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1x2_t = vld2_dup_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8x2_t = vld2_dup_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x2x2_t = vld2_lane_f32 (0, arg1_float32x2x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x4x2_t = vld2_lane_p16 (0, arg1_poly16x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly8x8x2_t = vld2_lane_p8 (0, arg1_poly8x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x4x2_t = vld2_lane_s16 (0, arg1_int16x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x2x2_t = vld2_lane_s32 (0, arg1_int32x2x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int8x8x2_t = vld2_lane_s8 (0, arg1_int8x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x4x2_t = vld2_lane_u16 (0, arg1_uint16x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x2x2_t = vld2_lane_u32 (0, arg1_uint32x2x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint8x8x2_t = vld2_lane_u8 (0, arg1_uint8x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2f32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2x2_t = vld2_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2p16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4x2_t = vld2_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2p8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8x2_t = vld2_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2s16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4x2_t = vld2_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2s32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2x2_t = vld2_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2s64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1x2_t = vld2_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2s8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8x2_t = vld2_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2u16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4x2_t = vld2_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2u32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2x2_t = vld2_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2u64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1x2_t = vld2_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld2u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld2u8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8x2_t = vld2_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x4x3_t = vld3q_lane_f32 (0, arg1_float32x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x8x3_t = vld3q_lane_p16 (0, arg1_poly16x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x8x3_t = vld3q_lane_s16 (0, arg1_int16x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x4x3_t = vld3q_lane_s32 (0, arg1_int32x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x8x3_t = vld3q_lane_u16 (0, arg1_uint16x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x4x3_t = vld3q_lane_u32 (0, arg1_uint32x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_float32x4x3_t = vld3q_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_poly16x8x3_t = vld3q_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_poly8x16x3_t = vld3q_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int16x8x3_t = vld3q_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int32x4x3_t = vld3q_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int8x16x3_t = vld3q_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint16x8x3_t = vld3q_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint32x4x3_t = vld3q_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint8x16x3_t = vld3q_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2x3_t = vld3_dup_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4x3_t = vld3_dup_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8x3_t = vld3_dup_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4x3_t = vld3_dup_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2x3_t = vld3_dup_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1x3_t = vld3_dup_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8x3_t = vld3_dup_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4x3_t = vld3_dup_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2x3_t = vld3_dup_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1x3_t = vld3_dup_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8x3_t = vld3_dup_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x2x3_t = vld3_lane_f32 (0, arg1_float32x2x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x4x3_t = vld3_lane_p16 (0, arg1_poly16x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly8x8x3_t = vld3_lane_p8 (0, arg1_poly8x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x4x3_t = vld3_lane_s16 (0, arg1_int16x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x2x3_t = vld3_lane_s32 (0, arg1_int32x2x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int8x8x3_t = vld3_lane_s8 (0, arg1_int8x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x4x3_t = vld3_lane_u16 (0, arg1_uint16x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x2x3_t = vld3_lane_u32 (0, arg1_uint32x2x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint8x8x3_t = vld3_lane_u8 (0, arg1_uint8x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3f32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2x3_t = vld3_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3p16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4x3_t = vld3_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3p8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8x3_t = vld3_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3s16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4x3_t = vld3_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3s32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2x3_t = vld3_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3s64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1x3_t = vld3_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3s8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8x3_t = vld3_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3u16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4x3_t = vld3_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3u32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2x3_t = vld3_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3u64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1x3_t = vld3_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld3u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld3u8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8x3_t = vld3_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x4x4_t = vld4q_lane_f32 (0, arg1_float32x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x8x4_t = vld4q_lane_p16 (0, arg1_poly16x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x8x4_t = vld4q_lane_s16 (0, arg1_int16x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x4x4_t = vld4q_lane_s32 (0, arg1_int32x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x8x4_t = vld4q_lane_u16 (0, arg1_uint16x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x4x4_t = vld4q_lane_u32 (0, arg1_uint32x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_float32x4x4_t = vld4q_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_poly16x8x4_t = vld4q_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_poly8x16x4_t = vld4q_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int16x8x4_t = vld4q_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int32x4x4_t = vld4q_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_int8x16x4_t = vld4q_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint16x8x4_t = vld4q_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint32x4x4_t = vld4q_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c	2011-04-20 10:00:39 +0000
+@@ -15,6 +15,6 @@
+   out_uint8x16x4_t = vld4q_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2x4_t = vld4_dup_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4x4_t = vld4_dup_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8x4_t = vld4_dup_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4x4_t = vld4_dup_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2x4_t = vld4_dup_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1x4_t = vld4_dup_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8x4_t = vld4_dup_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4x4_t = vld4_dup_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2x4_t = vld4_dup_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1x4_t = vld4_dup_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8x4_t = vld4_dup_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_float32x2x4_t = vld4_lane_f32 (0, arg1_float32x2x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly16x4x4_t = vld4_lane_p16 (0, arg1_poly16x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_poly8x8x4_t = vld4_lane_p8 (0, arg1_poly8x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int16x4x4_t = vld4_lane_s16 (0, arg1_int16x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int32x2x4_t = vld4_lane_s32 (0, arg1_int32x2x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_int8x8x4_t = vld4_lane_s8 (0, arg1_int8x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint16x4x4_t = vld4_lane_u16 (0, arg1_uint16x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint32x2x4_t = vld4_lane_u32 (0, arg1_uint32x2x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   out_uint8x8x4_t = vld4_lane_u8 (0, arg1_uint8x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4f32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_float32x2x4_t = vld4_f32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4p16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly16x4x4_t = vld4_p16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4p8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_poly8x8x4_t = vld4_p8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4s16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int16x4x4_t = vld4_s16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4s32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int32x2x4_t = vld4_s32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4s64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int64x1x4_t = vld4_s64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4s8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_int8x8x4_t = vld4_s8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4u16.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint16x4x4_t = vld4_u16 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4u32.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint32x2x4_t = vld4_u32 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4u64.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint64x1x4_t = vld4_u64 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vld4u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vld4u8.c	2011-04-20 10:00:39 +0000
+@@ -15,5 +15,5 @@
+   out_uint8x8x4_t = vld4_u8 (0);
+ }
+ 
+-/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_f32 (arg0_float32_t, arg1_float32x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_p16 (arg0_poly16_t, arg1_poly16x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_p8 (arg0_poly8_t, arg1_poly8x16_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_s16 (arg0_int16_t, arg1_int16x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_s32 (arg0_int32_t, arg1_int32x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_s64 (arg0_int64_t, arg1_int64x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_s8 (arg0_int8_t, arg1_int8x16_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_u16 (arg0_uint16_t, arg1_uint16x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_u32 (arg0_uint32_t, arg1_uint32x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_u64 (arg0_uint64_t, arg1_uint64x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_lane_u8 (arg0_uint8_t, arg1_uint8x16_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_f32 (arg0_float32_t, arg1_float32x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_p16 (arg0_poly16_t, arg1_poly16x8_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_p8 (arg0_poly8_t, arg1_poly8x16_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_s16 (arg0_int16_t, arg1_int16x8_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_s32 (arg0_int32_t, arg1_int32x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_s64 (arg0_int64_t, arg1_int64x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_s8 (arg0_int8_t, arg1_int8x16_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_u16 (arg0_uint16_t, arg1_uint16x8_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_u32 (arg0_uint32_t, arg1_uint32x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_u64 (arg0_uint64_t, arg1_uint64x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1q_u8 (arg0_uint8_t, arg1_uint8x16_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_f32 (arg0_float32_t, arg1_float32x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_p16 (arg0_poly16_t, arg1_poly16x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_p8 (arg0_poly8_t, arg1_poly8x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_s16 (arg0_int16_t, arg1_int16x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_s32 (arg0_int32_t, arg1_int32x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_s64 (arg0_int64_t, arg1_int64x1_t, 0);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_s8 (arg0_int8_t, arg1_int8x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_u16 (arg0_uint16_t, arg1_uint16x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_u32 (arg0_uint32_t, arg1_uint32x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_u64 (arg0_uint64_t, arg1_uint64x1_t, 0);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_lane_u8 (arg0_uint8_t, arg1_uint8x8_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1f32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_f32 (arg0_float32_t, arg1_float32x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1p16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_p16 (arg0_poly16_t, arg1_poly16x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1p8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_p8 (arg0_poly8_t, arg1_poly8x8_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1s16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_s16 (arg0_int16_t, arg1_int16x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1s32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_s32 (arg0_int32_t, arg1_int32x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1s64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_s64 (arg0_int64_t, arg1_int64x1_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1s8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_s8 (arg0_int8_t, arg1_int8x8_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1u16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_u16 (arg0_uint16_t, arg1_uint16x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1u32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_u32 (arg0_uint32_t, arg1_uint32x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1u64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_u64 (arg0_uint64_t, arg1_uint64x1_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst1u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst1u8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst1_u8 (arg0_uint8_t, arg1_uint8x8_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2q_lane_f32 (arg0_float32_t, arg1_float32x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2q_lane_p16 (arg0_poly16_t, arg1_poly16x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2q_lane_s16 (arg0_int16_t, arg1_int16x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2q_lane_s32 (arg0_int32_t, arg1_int32x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2q_lane_u16 (arg0_uint16_t, arg1_uint16x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2q_lane_u32 (arg0_uint32_t, arg1_uint32x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_f32 (arg0_float32_t, arg1_float32x4x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_p16 (arg0_poly16_t, arg1_poly16x8x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_p8 (arg0_poly8_t, arg1_poly8x16x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_s16 (arg0_int16_t, arg1_int16x8x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_s32 (arg0_int32_t, arg1_int32x4x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_s8 (arg0_int8_t, arg1_int8x16x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_u16 (arg0_uint16_t, arg1_uint16x8x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_u32 (arg0_uint32_t, arg1_uint32x4x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst2q_u8 (arg0_uint8_t, arg1_uint8x16x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_f32 (arg0_float32_t, arg1_float32x2x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_p16 (arg0_poly16_t, arg1_poly16x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_p8 (arg0_poly8_t, arg1_poly8x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_s16 (arg0_int16_t, arg1_int16x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_s32 (arg0_int32_t, arg1_int32x2x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_s8 (arg0_int8_t, arg1_int8x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_u16 (arg0_uint16_t, arg1_uint16x4x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_u32 (arg0_uint32_t, arg1_uint32x2x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_lane_u8 (arg0_uint8_t, arg1_uint8x8x2_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2f32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_f32 (arg0_float32_t, arg1_float32x2x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2p16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_p16 (arg0_poly16_t, arg1_poly16x4x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2p8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_p8 (arg0_poly8_t, arg1_poly8x8x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2s16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_s16 (arg0_int16_t, arg1_int16x4x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2s32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_s32 (arg0_int32_t, arg1_int32x2x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2s64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_s64 (arg0_int64_t, arg1_int64x1x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2s8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_s8 (arg0_int8_t, arg1_int8x8x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2u16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_u16 (arg0_uint16_t, arg1_uint16x4x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2u32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_u32 (arg0_uint32_t, arg1_uint32x2x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2u64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_u64 (arg0_uint64_t, arg1_uint64x1x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst2u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst2u8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst2_u8 (arg0_uint8_t, arg1_uint8x8x2_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3q_lane_f32 (arg0_float32_t, arg1_float32x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3q_lane_p16 (arg0_poly16_t, arg1_poly16x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3q_lane_s16 (arg0_int16_t, arg1_int16x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3q_lane_s32 (arg0_int32_t, arg1_int32x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3q_lane_u16 (arg0_uint16_t, arg1_uint16x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3q_lane_u32 (arg0_uint32_t, arg1_uint32x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_f32 (arg0_float32_t, arg1_float32x4x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_p16 (arg0_poly16_t, arg1_poly16x8x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_p8 (arg0_poly8_t, arg1_poly8x16x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_s16 (arg0_int16_t, arg1_int16x8x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_s32 (arg0_int32_t, arg1_int32x4x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_s8 (arg0_int8_t, arg1_int8x16x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_u16 (arg0_uint16_t, arg1_uint16x8x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_u32 (arg0_uint32_t, arg1_uint32x4x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst3q_u8 (arg0_uint8_t, arg1_uint8x16x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_f32 (arg0_float32_t, arg1_float32x2x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_p16 (arg0_poly16_t, arg1_poly16x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_p8 (arg0_poly8_t, arg1_poly8x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_s16 (arg0_int16_t, arg1_int16x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_s32 (arg0_int32_t, arg1_int32x2x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_s8 (arg0_int8_t, arg1_int8x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_u16 (arg0_uint16_t, arg1_uint16x4x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_u32 (arg0_uint32_t, arg1_uint32x2x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_lane_u8 (arg0_uint8_t, arg1_uint8x8x3_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3f32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_f32 (arg0_float32_t, arg1_float32x2x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3p16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_p16 (arg0_poly16_t, arg1_poly16x4x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3p8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_p8 (arg0_poly8_t, arg1_poly8x8x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3s16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_s16 (arg0_int16_t, arg1_int16x4x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3s32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_s32 (arg0_int32_t, arg1_int32x2x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3s64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_s64 (arg0_int64_t, arg1_int64x1x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3s8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_s8 (arg0_int8_t, arg1_int8x8x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3u16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_u16 (arg0_uint16_t, arg1_uint16x4x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3u32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_u32 (arg0_uint32_t, arg1_uint32x2x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3u64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_u64 (arg0_uint64_t, arg1_uint64x1x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst3u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst3u8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst3_u8 (arg0_uint8_t, arg1_uint8x8x3_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4q_lane_f32 (arg0_float32_t, arg1_float32x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4q_lane_p16 (arg0_poly16_t, arg1_poly16x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4q_lane_s16 (arg0_int16_t, arg1_int16x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4q_lane_s32 (arg0_int32_t, arg1_int32x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4q_lane_u16 (arg0_uint16_t, arg1_uint16x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4q_lane_u32 (arg0_uint32_t, arg1_uint32x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_f32 (arg0_float32_t, arg1_float32x4x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_p16 (arg0_poly16_t, arg1_poly16x8x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_p8 (arg0_poly8_t, arg1_poly8x16x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_s16 (arg0_int16_t, arg1_int16x8x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_s32 (arg0_int32_t, arg1_int32x4x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_s8 (arg0_int8_t, arg1_int8x16x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_u16 (arg0_uint16_t, arg1_uint16x8x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_u32 (arg0_uint32_t, arg1_uint32x4x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c	2011-04-20 10:00:39 +0000
+@@ -16,6 +16,6 @@
+   vst4q_u8 (arg0_uint8_t, arg1_uint8x16x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_f32 (arg0_float32_t, arg1_float32x2x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_p16 (arg0_poly16_t, arg1_poly16x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_p8 (arg0_poly8_t, arg1_poly8x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_s16 (arg0_int16_t, arg1_int16x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_s32 (arg0_int32_t, arg1_int32x2x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_s8 (arg0_int8_t, arg1_int8x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_u16 (arg0_uint16_t, arg1_uint16x4x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_u32 (arg0_uint32_t, arg1_uint32x2x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_lane_u8 (arg0_uint8_t, arg1_uint8x8x4_t, 1);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4f32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4f32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4f32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_f32 (arg0_float32_t, arg1_float32x2x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4p16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4p16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4p16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_p16 (arg0_poly16_t, arg1_poly16x4x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4p8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4p8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4p8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_p8 (arg0_poly8_t, arg1_poly8x8x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4s16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4s16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_s16 (arg0_int16_t, arg1_int16x4x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4s32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4s32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_s32 (arg0_int32_t, arg1_int32x2x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4s64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4s64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_s64 (arg0_int64_t, arg1_int64x1x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4s8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4s8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_s8 (arg0_int8_t, arg1_int8x8x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u16.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4u16.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4u16.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_u16 (arg0_uint16_t, arg1_uint16x4x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u32.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4u32.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4u32.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_u32 (arg0_uint32_t, arg1_uint32x2x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u64.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4u64.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4u64.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_u64 (arg0_uint64_t, arg1_uint64x1x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u8.c'
+--- old/gcc/testsuite/gcc.target/arm/neon/vst4u8.c	2010-08-20 13:27:11 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon/vst4u8.c	2011-04-20 10:00:39 +0000
+@@ -16,5 +16,5 @@
+   vst4_u8 (arg0_uint8_t, arg1_uint8x8x4_t);
+ }
+ 
+-/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@.*\)?\n" } } */
++/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@.*\)?\n" } } */
+ /* { dg-final { cleanup-saved-temps } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr46329.c'
+--- old/gcc/testsuite/gcc.target/arm/pr46329.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr46329.c	2011-05-03 12:49:58 +0000
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O2" } */
++/* { dg-add-options arm_neon } */
++
++int __attribute__ ((vector_size (32))) x;
++void
++foo (void)
++{
++  x <<= x;
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch
new file mode 100644
index 0000000..b287c4d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99504.patch
@@ -0,0 +1,26 @@
+Remove the following
+
+ 2011-04-20  Richard Sandiford  <richard.sandiford@linaro.org>
+ 
+	gcc/testsuite/
+	From  Richard Earnshaw  <rearnsha@arm.com>
+
+	PR target/46329
+	* gcc.target/arm/pr46329.c: New test.
+
+=== removed file 'gcc/testsuite/gcc.target/arm/pr46329.c'
+--- old/gcc/testsuite/gcc.target/arm/pr46329.c	2011-05-03 12:49:58 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr46329.c	1970-01-01 00:00:00 +0000
+@@ -1,11 +0,0 @@
+-/* { dg-do compile } */
+-/* { dg-require-effective-target arm_neon_ok } */
+-/* { dg-options "-O2" } */
+-/* { dg-add-options arm_neon } */
+-
+-int __attribute__ ((vector_size (32))) x;
+-void
+-foo (void)
+-{
+-  x <<= x;
+-}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch
new file mode 100644
index 0000000..9432f4c
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99506.patch
@@ -0,0 +1,21 @@
+2011-05-06  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	From Sergey Grechanik  <mouseentity@ispras.ru>, approved for mainline
+
+	* config/arm/arm.c (coproc_secondary_reload_class): Return NO_REGS
+	for constant vectors.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-04-20 10:10:50 +0000
++++ new/gcc/config/arm/arm.c	2011-05-04 15:13:02 +0000
+@@ -9353,7 +9353,7 @@
+   /* The neon move patterns handle all legitimate vector and struct
+      addresses.  */
+   if (TARGET_NEON
+-      && MEM_P (x)
++      && (MEM_P (x) || GET_CODE (x) == CONST_VECTOR)
+       && (GET_MODE_CLASS (mode) == MODE_VECTOR_INT
+ 	  || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT
+ 	  || VALID_NEON_STRUCT_MODE (mode)))
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch
new file mode 100644
index 0000000..f3d5eee
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99507.patch
@@ -0,0 +1,20 @@
+2011-05-03  Tom de Vries  <tom@codesourcery.com>
+
+	gcc/
+	* stmt.c (set_jump_prob): Make robust against *inv_scale == 0.
+
+=== modified file 'gcc/stmt.c'
+--- old/gcc/stmt.c	2011-02-07 13:23:30 +0000
++++ new/gcc/stmt.c	2011-05-06 19:17:34 +0000
+@@ -2312,7 +2312,9 @@
+ set_jump_prob (rtx jump, int prob, int *inv_scale)
+ {
+   /* j[i] = p[i] * scale / REG_BR_PROB_BASE.  */
+-  int jump_prob = prob * REG_BR_PROB_BASE / *inv_scale;
++  int jump_prob = (*inv_scale > 0
++                   ? prob * REG_BR_PROB_BASE / *inv_scale
++                   : REG_BR_PROB_BASE / 2);
+   /* f[i] = REG_BR_PROB_BASE - j[i].  */
+   int fallthrough_prob = REG_BR_PROB_BASE - jump_prob;
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch
new file mode 100644
index 0000000..b4e4e88
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99510.patch
@@ -0,0 +1,24 @@
+2011-05-13  Michael Hope  <michael.hope@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-05-05  Michael Hope  <michael.hope@linaro.org>
+
+	PR pch/45979
+	* config/host-linux.c (TRY_EMPTY_VM_SPACE): Define for
+	__ARM_EABI__ hosts.
+
+=== modified file 'gcc/config/host-linux.c'
+--- old/gcc/config/host-linux.c	2009-02-20 15:20:38 +0000
++++ new/gcc/config/host-linux.c	2011-05-06 20:16:10 +0000
+@@ -86,6 +86,8 @@
+ # define TRY_EMPTY_VM_SPACE	0x60000000
+ #elif defined(__mc68000__)
+ # define TRY_EMPTY_VM_SPACE	0x40000000
++#elif defined(__ARM_EABI__)
++# define TRY_EMPTY_VM_SPACE     0x60000000
+ #else
+ # define TRY_EMPTY_VM_SPACE	0
+ #endif
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch
new file mode 100644
index 0000000..8d096c2
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99511.patch
@@ -0,0 +1,582 @@
+2011-05-13 Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	* loop-doloop.c (doloop_condition_get): Support new form of
+	doloop pattern and use prev_nondebug_insn instead of PREV_INSN.
+	* config/arm/thumb2.md (*thumb2_addsi3_compare0): Remove "*".
+	(doloop_end): New.
+	* config/arm/arm.md (*addsi3_compare0): Remove "*".
+	* params.def (sms-min-sc): New param flag.
+	* doc/invoke.texi (sms-min-sc): Document it.
+	* ddg.c (create_ddg_dep_from_intra_loop_link): If a true dep edge
+	enters the branch create an anti edge in the opposite direction
+	to prevent the creation of reg-moves.
+	(get_node_of_insn_uid, check_closing_branch_deps): Delete
+	functions.
+	(create_ddg): Restore previous definition and implementation.
+	* ddg.h (create_ddg): Restore previous definition.
+	* modulo-sched.c: Adjust comment to reflect the fact we are
+	scheduling closing branch.
+	(PS_STAGE_COUNT): Rename to CALC_STAGE_COUNT and redefine.
+	(stage_count): New field in struct partial_schedule.
+	(calculate_stage_count): New function.
+	(normalize_sched_times): Rename to reset_sched_times and handle
+	incrementing the sched time of the nodes by a constant value
+	passed as parameter.
+	(duplicate_insns_of_cycles): Skip closing branch.
+	(sms_schedule_by_order): Schedule closing branch.
+	(ps_insn_find_column): Handle closing branch.
+	(sms_schedule): Call reset_sched_times and adjust the code to
+	support scheduling of the closing branch. Use sms-min-sc.
+	Support new form of doloop pattern.
+	(ps_insert_empty_row): Update calls to normalize_sched_times
+	and rotate_partial_schedule functions.	
+	(mark_doloop_insns): Remove.
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2011-03-24 07:45:38 +0000
++++ new/gcc/ddg.c	2011-05-11 08:00:14 +0000
+@@ -60,8 +60,6 @@
+ static ddg_edge_ptr create_ddg_edge (ddg_node_ptr, ddg_node_ptr, dep_type,
+ 				     dep_data_type, int, int);
+ static void add_edge_to_ddg (ddg_ptr g, ddg_edge_ptr);
+-static ddg_node_ptr get_node_of_insn_uid (ddg_ptr, int);
+-
+ 
+ /* Auxiliary variable for mem_read_insn_p/mem_write_insn_p.  */
+ static bool mem_ref_p;
+@@ -199,6 +197,11 @@
+         }
+     }
+ 
++  /* If a true dep edge enters the branch create an anti edge in the
++     opposite direction to prevent the creation of reg-moves.  */
++  if ((DEP_TYPE (link) == REG_DEP_TRUE) && JUMP_P (dest_node->insn))
++    create_ddg_dep_no_link (g, dest_node, src_node, ANTI_DEP, REG_DEP, 1);
++
+    latency = dep_cost (link);
+    e = create_ddg_edge (src_node, dest_node, t, dt, latency, distance);
+    add_edge_to_ddg (g, e);
+@@ -452,65 +455,12 @@
+   sched_free_deps (head, tail, false);
+ }
+ 
+-/* Given DOLOOP_INSNS which holds the instructions that
+-   belong to the do-loop part; mark closing_branch_deps field in ddg G
+-   as TRUE if the do-loop part's instructions are dependent on the other
+-   loop instructions.  Otherwise mark it as FALSE.  */
+-static void
+-check_closing_branch_deps (ddg_ptr g, sbitmap doloop_insns)
+-{
+-  sbitmap_iterator sbi;
+-  unsigned int u = 0;
+-
+-  EXECUTE_IF_SET_IN_SBITMAP (doloop_insns, 0, u, sbi)
+-  {
+-    ddg_edge_ptr e;
+-    ddg_node_ptr u_node = get_node_of_insn_uid (g, u);
+-
+-    gcc_assert (u_node);
+-
+-    for (e = u_node->in; e != 0; e = e->next_in)
+-      {
+-	ddg_node_ptr v_node = e->src;
+-
+-	if (((unsigned int) INSN_UID (v_node->insn) == u)
+-	    || DEBUG_INSN_P (v_node->insn))
+-	  continue;
+-	
+-	/* Ignore dependencies between memory writes and the
+-	   jump.  */
+-	if (JUMP_P (u_node->insn)
+-	    && e->type == OUTPUT_DEP 
+-            && mem_write_insn_p (v_node->insn))
+-	  continue;
+-	if (!TEST_BIT (doloop_insns, INSN_UID (v_node->insn)))
+-	  {
+-	    g->closing_branch_deps = 1;
+-	    return;
+-	  }
+-      }
+-    for (e = u_node->out; e != 0; e = e->next_out)
+-      {
+-	ddg_node_ptr v_node = e->dest;
+-
+-	if (((unsigned int) INSN_UID (v_node->insn) == u)
+-            || DEBUG_INSN_P (v_node->insn))
+-	  continue;
+-	if (!TEST_BIT (doloop_insns, INSN_UID (v_node->insn)))
+-	  {
+-	    g->closing_branch_deps = 1;
+-	    return;
+-	  }
+-      }
+-  }
+-  g->closing_branch_deps = 0;
+-}
+ 
+ /* Given a basic block, create its DDG and return a pointer to a variable
+    of ddg type that represents it.
+    Initialize the ddg structure fields to the appropriate values.  */
+ ddg_ptr
+-create_ddg (basic_block bb, sbitmap doloop_insns)
++create_ddg (basic_block bb, int closing_branch_deps)
+ {
+   ddg_ptr g;
+   rtx insn, first_note;
+@@ -520,6 +470,7 @@
+   g = (ddg_ptr) xcalloc (1, sizeof (struct ddg));
+ 
+   g->bb = bb;
++  g->closing_branch_deps = closing_branch_deps;
+ 
+   /* Count the number of insns in the BB.  */
+   for (insn = BB_HEAD (bb); insn != NEXT_INSN (BB_END (bb));
+@@ -592,11 +543,6 @@
+   /* Build the data dependency graph.  */
+   build_intra_loop_deps (g);
+   build_inter_loop_deps (g);
+-
+-  /* Check whether the do-loop part is decoupled from the other loop
+-     instructions.  */
+-  check_closing_branch_deps (g, doloop_insns);
+-
+   return g;
+ }
+ 
+@@ -890,18 +836,6 @@
+   return NULL;
+ }
+ 
+-/* Given the uid of an instruction UID return the node that represents it.  */
+-static ddg_node_ptr
+-get_node_of_insn_uid (ddg_ptr g, int uid)
+-{
+-  int i;
+-
+-  for (i = 0; i < g->num_nodes; i++)
+-    if (uid == INSN_UID (g->nodes[i].insn))
+-      return &g->nodes[i];
+-  return NULL;
+-}
+-
+ /* Given a set OPS of nodes in the DDG, find the set of their successors
+    which are not in OPS, and set their bits in SUCC.  Bits corresponding to
+    OPS are cleared from SUCC.  Leaves the other bits in SUCC unchanged.  */
+
+=== modified file 'gcc/ddg.h'
+--- old/gcc/ddg.h	2011-03-24 07:45:38 +0000
++++ new/gcc/ddg.h	2011-05-11 08:00:14 +0000
+@@ -167,7 +167,7 @@
+ };
+ 
+ 
+-ddg_ptr create_ddg (basic_block, sbitmap);
++ddg_ptr create_ddg (basic_block, int closing_branch_deps);
+ void free_ddg (ddg_ptr);
+ 
+ void print_ddg (FILE *, ddg_ptr);
+
+=== modified file 'gcc/doc/invoke.texi'
+--- old/gcc/doc/invoke.texi	2011-04-17 23:04:58 +0000
++++ new/gcc/doc/invoke.texi	2011-05-11 08:00:14 +0000
+@@ -8430,6 +8430,10 @@
+ The maximum number of best instructions in the ready list that are considered
+ for renaming in the selective scheduler.  The default value is 2.
+ 
++@item sms-min-sc
++The minimum value of stage count that swing modulo scheduler will
++generate.  The default value is 2.
++
+ @item max-last-value-rtl
+ The maximum size measured as number of RTLs that can be recorded in an expression
+ in combiner for a pseudo register as last known value of that register.  The default
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-03-24 07:45:38 +0000
++++ new/gcc/modulo-sched.c	2011-05-11 08:00:14 +0000
+@@ -84,14 +84,13 @@
+       II cycles (i.e. use register copies to prevent a def from overwriting
+       itself before reaching the use).
+ 
+-    SMS works with countable loops (1) whose control part can be easily
+-    decoupled from the rest of the loop and (2) whose loop count can
+-    be easily adjusted.  This is because we peel a constant number of
+-    iterations into a prologue and epilogue for which we want to avoid
+-    emitting the control part, and a kernel which is to iterate that
+-    constant number of iterations less than the original loop.  So the
+-    control part should be a set of insns clearly identified and having
+-    its own iv, not otherwise used in the loop (at-least for now), which
++    SMS works with countable loops whose loop count can be easily
++    adjusted.  This is because we peel a constant number of iterations
++    into a prologue and epilogue for which we want to avoid emitting
++    the control part, and a kernel which is to iterate that constant
++    number of iterations less than the original loop.  So the control
++    part should be a set of insns clearly identified and having its
++    own iv, not otherwise used in the loop (at-least for now), which
+     initializes a register before the loop to the number of iterations.
+     Currently SMS relies on the do-loop pattern to recognize such loops,
+     where (1) the control part comprises of all insns defining and/or
+@@ -116,7 +115,7 @@
+ 
+ /* The number of different iterations the nodes in ps span, assuming
+    the stage boundaries are placed efficiently.  */
+-#define CALC_STAGE_COUNT(min_cycle,max_cycle,ii) ((max_cycle - min_cycle \
++#define CALC_STAGE_COUNT(max_cycle,min_cycle,ii) ((max_cycle - min_cycle \
+                          + 1 + ii - 1) / ii)
+ /* The stage count of ps.  */
+ #define PS_STAGE_COUNT(ps) (((partial_schedule_ptr)(ps))->stage_count)
+@@ -200,7 +199,6 @@
+ static void duplicate_insns_of_cycles (partial_schedule_ptr,
+ 				       int, int, int, rtx);
+ static int calculate_stage_count (partial_schedule_ptr ps);
+-
+ #define SCHED_ASAP(x) (((node_sched_params_ptr)(x)->aux.info)->asap)
+ #define SCHED_TIME(x) (((node_sched_params_ptr)(x)->aux.info)->time)
+ #define SCHED_FIRST_REG_MOVE(x) \
+@@ -318,7 +316,7 @@
+                              : prev_nondebug_insn (tail));
+ 
+   for (insn = head; insn != first_insn_not_to_check; insn = NEXT_INSN (insn))
+-    if (reg_mentioned_p (reg, insn) && NONDEBUG_INSN_P (insn))
++    if (reg_mentioned_p (reg, insn) && !DEBUG_INSN_P (insn))
+       {
+         if (dump_file)
+         {
+@@ -337,24 +335,6 @@
+ #endif
+ }
+ 
+-/* Mark in DOLOOP_INSNS the instructions that belong to the do-loop part.
+-  Use TAIL to recognize that part.  */
+-static void
+-mark_doloop_insns (sbitmap doloop_insns, rtx tail)
+-{
+-  rtx first_insn_not_to_check, insn;
+-
+-  /* This is the first instruction which belongs the doloop part.  */
+-  first_insn_not_to_check = (GET_CODE (PATTERN (tail)) == PARALLEL ? tail
+-			     : prev_nondebug_insn (tail));
+-
+-  sbitmap_zero (doloop_insns);
+-  for (insn = first_insn_not_to_check; insn != NEXT_INSN (tail);
+-       insn = NEXT_INSN (insn))
+-    if (NONDEBUG_INSN_P (insn))
+-      SET_BIT (doloop_insns, INSN_UID (insn));
+-}
+-
+ /* Check if COUNT_REG is set to a constant in the PRE_HEADER block, so
+    that the number of iterations is a compile-time constant.  If so,
+    return the rtx that sets COUNT_REG to a constant, and set COUNT to
+@@ -607,44 +587,42 @@
+ 	ddg_node_ptr u = crr_insn->node;
+ 	int normalized_time = SCHED_TIME (u) - amount;
+ 	int new_min_cycle = PS_MIN_CYCLE (ps) - amount;
+-        /* The first cycle in row zero after the rotation.  */
+-	int new_first_cycle_in_row_zero = 
+-	  new_min_cycle + ii - SMODULO (new_min_cycle, ii);
++        int sc_until_cycle_zero, stage;
+ 
+-	if (dump_file)
+-	  fprintf (dump_file, "crr_insn->node=%d, crr_insn->cycle=%d,\
+-		   min_cycle=%d\n", crr_insn->node->cuid, SCHED_TIME
+-		   (u), ps->min_cycle);
++        if (dump_file)
++          {
++            /* Print the scheduling times after the rotation.  */
++            fprintf (dump_file, "crr_insn->node=%d (insn id %d), "
++                     "crr_insn->cycle=%d, min_cycle=%d", crr_insn->node->cuid,
++                     INSN_UID (crr_insn->node->insn), SCHED_TIME (u),
++                     normalized_time);
++            if (JUMP_P (crr_insn->node->insn))
++              fprintf (dump_file, " (branch)");
++            fprintf (dump_file, "\n");
++          }
++	
+ 	gcc_assert (SCHED_TIME (u) >= ps->min_cycle);
+ 	gcc_assert (SCHED_TIME (u) <= ps->max_cycle);
+ 	SCHED_TIME (u) = normalized_time;
+-	crr_insn->cycle = normalized_time;
+ 	SCHED_ROW (u) = SMODULO (normalized_time, ii);
+-
+-	/* If min_cycle is in row zero after the rotation then
+-	   the stage count can be calculated by dividing the cycle
+-	   with ii.  Otherwise, the calculation is done by dividing the
+-	   SMSed kernel into two intervals:
+-
+-	   1) min_cycle	              <= interval 0 < first_cycle_in_row_zero
+-	   2) first_cycle_in_row_zero <= interval 1 < max_cycle
+-	   
+-	   Cycles in interval 0 are in stage 0. The stage of cycles
+-	   in interval 1 should be added by 1 to take interval 0 into
+-	   account.  */
+-	if (SMODULO (new_min_cycle, ii) == 0)
+-          SCHED_STAGE (u) = normalized_time / ii;
+-        else
+-	  {
+-            if (crr_insn->cycle < new_first_cycle_in_row_zero)
+-	      SCHED_STAGE (u) = 0;
+-	    else
+-              SCHED_STAGE (u) = 
+-		((SCHED_TIME (u) - new_first_cycle_in_row_zero) / ii) + 1;
++      
++        /* The calculation of stage count is done adding the number
++           of stages before cycle zero and after cycle zero.  */
++	sc_until_cycle_zero = CALC_STAGE_COUNT (-1, new_min_cycle, ii);
++	
++	if (SCHED_TIME (u) < 0)
++	  {
++	    stage = CALC_STAGE_COUNT (-1, SCHED_TIME (u), ii);
++	    SCHED_STAGE (u) = sc_until_cycle_zero - stage;
++	  }
++	else
++	  {
++	    stage = CALC_STAGE_COUNT (SCHED_TIME (u), 0, ii);
++	    SCHED_STAGE (u) = sc_until_cycle_zero + stage - 1;
+ 	  }
+       }
+ }
+-
++ 
+ /* Set SCHED_COLUMN of each node according to its position in PS.  */
+ static void
+ set_columns_for_ps (partial_schedule_ptr ps)
+@@ -694,8 +672,8 @@
+ 
+         /* Do not duplicate any insn which refers to count_reg as it
+            belongs to the control part.
+-           If closing_branch_deps is true the closing branch is scheduled
+-           as well and thus should be ignored.
++           The closing branch is scheduled as well and thus should
++           be ignored.
+            TODO: This should be done by analyzing the control part of
+            the loop.  */
+         if (reg_mentioned_p (count_reg, u_node->insn)
+@@ -945,8 +923,7 @@
+   basic_block condition_bb = NULL;
+   edge latch_edge;
+   gcov_type trip_count = 0;
+-  sbitmap doloop_insns;
+-  
++
+   loop_optimizer_init (LOOPS_HAVE_PREHEADERS
+ 		       | LOOPS_HAVE_RECORDED_EXITS);
+   if (number_of_loops () <= 1)
+@@ -971,7 +948,6 @@
+   setup_sched_infos ();
+   haifa_sched_init ();
+ 
+-  doloop_insns = sbitmap_alloc (get_max_uid () + 1);
+   /* Allocate memory to hold the DDG array one entry for each loop.
+      We use loop->num as index into this array.  */
+   g_arr = XCNEWVEC (ddg_ptr, number_of_loops ());
+@@ -1104,16 +1080,18 @@
+ 
+ 	  continue;
+ 	}
+-      mark_doloop_insns (doloop_insns, tail);
+-      if (! (g = create_ddg (bb, doloop_insns)))
++
++      /* Always schedule the closing branch with the rest of the
++         instructions. The branch is rotated to be in row ii-1 at the
++         end of the scheduling procedure to make sure it's the last
++         instruction in the iteration.  */
++      if (! (g = create_ddg (bb, 1)))
+         {
+           if (dump_file)
+ 	    fprintf (dump_file, "SMS create_ddg failed\n");
+ 	  continue;
+         }
+-      if (dump_file)
+-        fprintf (dump_file, "SMS closing_branch_deps: %d\n", 
+-                 g->closing_branch_deps); 
++
+       g_arr[loop->num] = g;
+       if (dump_file)
+         fprintf (dump_file, "...OK\n");
+@@ -1215,16 +1193,17 @@
+ 
+       ps = sms_schedule_by_order (g, mii, maxii, node_order);
+ 
+-      if (ps)
+-	{
+-	  stage_count = calculate_stage_count (ps);
+-	  gcc_assert(stage_count >= 1);
+-	  PS_STAGE_COUNT(ps) = stage_count;
+-	}
+-      
+-      /* Stage count of 1 means that there is no interleaving between
+-         iterations, let the scheduling passes do the job.  */
+-      if (stage_count <= 1
++       if (ps)
++       {
++         stage_count = calculate_stage_count (ps);
++         gcc_assert(stage_count >= 1);
++         PS_STAGE_COUNT(ps) = stage_count;
++       }
++
++      /* The default value of PARAM_SMS_MIN_SC is 2 as stage count of
++         1 means that there is no interleaving between iterations thus
++         we let the scheduling passes do the job in this case.  */
++      if (stage_count < (unsigned) PARAM_VALUE (PARAM_SMS_MIN_SC)
+ 	  || (count_init && (loop_count <= stage_count))
+ 	  || (flag_branch_probabilities && (trip_count <= stage_count)))
+ 	{
+@@ -1242,21 +1221,12 @@
+       else
+ 	{
+ 	  struct undo_replace_buff_elem *reg_move_replaces;
+-	  int amount;
+-
+-	  /* Set the stage boundaries.  If the DDG is built with closing_branch_deps,
+-	     the closing_branch was scheduled and should appear in the last (ii-1)
+-	     row.  Otherwise, we are free to schedule the branch, and we let nodes
+-	     that were scheduled at the first PS_MIN_CYCLE cycle appear in the first
+-	     row; this should reduce stage_count to minimum.
+-             TODO: Revisit the issue of scheduling the insns of the
+-             control part relative to the branch when the control part
+-             has more than one insn.  */
+-	  amount = (g->closing_branch_deps)? SCHED_TIME (g->closing_branch) + 1: 
+-	    PS_MIN_CYCLE (ps);
++          int amount = SCHED_TIME (g->closing_branch) + 1;
++	  
++	  /* Set the stage boundaries.	The closing_branch was scheduled
++	     and should appear in the last (ii-1) row.  */
+ 	  reset_sched_times (ps, amount);
+ 	  rotate_partial_schedule (ps, amount);
+-	  
+ 	  set_columns_for_ps (ps);
+ 
+ 	  canon_loop (loop);
+@@ -1267,13 +1237,8 @@
+ 		       "SMS succeeded %d %d (with ii, sc)\n", ps->ii,
+ 		       stage_count);
+ 	      print_partial_schedule (ps, dump_file);
+-	      if (!g->closing_branch_deps)
+-		fprintf (dump_file,
+-			 "SMS Branch (%d) will later be scheduled at \
+-			 cycle %d.\n",
+-			 g->closing_branch->cuid, PS_MIN_CYCLE (ps) - 1);
+-            }
+-
++	    }
++ 
+           /* case the BCT count is not known , Do loop-versioning */
+ 	  if (count_reg && ! count_init)
+             {
+@@ -1318,7 +1283,6 @@
+     }
+ 
+   free (g_arr);
+-  sbitmap_free (doloop_insns);
+ 
+   /* Release scheduler data, needed until now because of DFA.  */
+   haifa_sched_finish ();
+@@ -1826,13 +1790,6 @@
+ 	      RESET_BIT (tobe_scheduled, u);
+ 	      continue;
+ 	    }
+-	  /* Closing branch handled later unless closing_branch_deps
+-	     is true.  */
+-	  if (JUMP_P (insn) && !g->closing_branch_deps) 
+-	    {
+-	      RESET_BIT (tobe_scheduled, u);
+-	      continue;
+-	    }
+ 
+ 	  if (TEST_BIT (sched_nodes, u))
+ 	    continue;
+@@ -2675,9 +2632,9 @@
+        last_in_row = next_ps_i;
+     }
+ 
+-  /* If closing_branch_deps is true we are scheduling the closing
+-     branch as well.  Make sure there is no dependent instruction after
+-     it as the branch should be the last instruction.  */
++  /* The closing branch is scheduled as well.  Make sure there is no
++     dependent instruction after it as the branch should be the last
++     instruction in the row.  */
+   if (JUMP_P (ps_i->node->insn)) 
+     {
+       if (first_must_follow)
+@@ -2918,51 +2875,21 @@
+   return ps_i;
+ }
+ 
+-/* Calculate the stage count of the partial schedule PS.  */
++/* Calculate the stage count of the partial schedule PS.  The calculation
++   takes into account the rotation to bring the closing branch to row
++   ii-1.  */
+ int
+ calculate_stage_count (partial_schedule_ptr ps)
+ {
+-  int stage_count;
+-
+-  /* If closing_branch_deps is false then the stage
+-     boundaries are placed efficiently, meaning that min_cycle will be
+-     placed at row 0. Otherwise, the closing branch will be placed in
+-     row ii-1. For the later case we assume the final SMSed kernel can
+-     be divided into two intervals. This assumption is used for the
+-     stage count calculation:
+-
+-     1) min_cycle               <= interval 0 < first_cycle_in_row_zero
+-     2) first_cycle_in_row_zero <= interval 1 < max_cycle
+-   */
+-  stage_count =
+-    CALC_STAGE_COUNT (PS_MIN_CYCLE (ps), PS_MAX_CYCLE (ps), ps->ii);
+-  if (ps->g->closing_branch_deps)
+-    {
+-      int new_min_cycle;
+-      int new_min_cycle_row;
+-      int rotation_amount = SCHED_TIME (ps->g->closing_branch) + 1;
+-
+-      /* This is the new value of min_cycle after the final rotation to
+-         bring closing branch into row ii-1.  */
+-      new_min_cycle = PS_MIN_CYCLE (ps) - rotation_amount;
+-      /* This is the row which the the new min_cycle will be placed in.  */
+-      new_min_cycle_row = SMODULO (new_min_cycle, ps->ii);
+-      /* If the row of min_cycle is zero then interval 0 is empty.
+-         Otherwise, we need to calculate interval 1 and add it by one
+-         to take interval 0 into account.  */
+-      if (new_min_cycle_row != 0)
+-	{
+-	  int new_max_cycle, first_cycle_in_row_zero;
+-
+-	  new_max_cycle = PS_MAX_CYCLE (ps) - rotation_amount;
+-	  first_cycle_in_row_zero =
+-	    new_min_cycle + ps->ii - new_min_cycle_row;
+-
+-	  stage_count =
+-	    CALC_STAGE_COUNT (first_cycle_in_row_zero, new_max_cycle,
+-			      ps->ii) + 1;
+-	}
+-    }
++  int rotation_amount = (SCHED_TIME (ps->g->closing_branch)) + 1;
++  int new_min_cycle = PS_MIN_CYCLE (ps) - rotation_amount;
++  int new_max_cycle = PS_MAX_CYCLE (ps) - rotation_amount;
++  int stage_count = CALC_STAGE_COUNT (-1, new_min_cycle, ps->ii);
++
++  /* The calculation of stage count is done adding the number of stages
++     before cycle zero and after cycle zero.  */ 
++  stage_count += CALC_STAGE_COUNT (new_max_cycle, 0, ps->ii);
++
+   return stage_count;
+ }
+ 
+
+=== modified file 'gcc/params.def'
+--- old/gcc/params.def	2011-02-01 14:20:13 +0000
++++ new/gcc/params.def	2011-05-11 08:00:14 +0000
+@@ -324,6 +324,11 @@
+ 	 "sms-max-ii-factor",
+ 	 "A factor for tuning the upper bound that swing modulo scheduler uses for scheduling a loop",
+ 	 100, 0, 0)
++/* The minimum value of stage count that swing modulo scheduler will generate.  */
++DEFPARAM(PARAM_SMS_MIN_SC,
++        "sms-min-sc",
++        "The minimum value of stage count that swing modulo scheduler will generate.",
++        2, 1, 1)
+ DEFPARAM(PARAM_SMS_DFA_HISTORY,
+ 	 "sms-dfa-history",
+ 	 "The number of cycles the swing modulo scheduler considers when checking conflicts using DFA",
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch
new file mode 100644
index 0000000..3fe9bbc
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99514.patch
@@ -0,0 +1,32 @@
+2011-05-19  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	* ddg.c (free_ddg_all_sccs): Free sccs field in struct
+	ddg_all_sccs.
+	* modulo-sched.c (sms_schedule): Avoid unfreed
+	memory when SMS fails.
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2011-05-11 08:00:14 +0000
++++ new/gcc/ddg.c	2011-05-13 16:16:22 +0000
+@@ -978,6 +978,7 @@
+   for (i = 0; i < all_sccs->num_sccs; i++)
+     free_scc (all_sccs->sccs[i]);
+ 
++  free (all_sccs->sccs);
+   free (all_sccs);
+ }
+ 
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-05-11 08:00:14 +0000
++++ new/gcc/modulo-sched.c	2011-05-13 16:16:22 +0000
+@@ -1216,7 +1216,6 @@
+ 	      fprintf (dump_file, HOST_WIDEST_INT_PRINT_DEC, trip_count);
+ 	      fprintf (dump_file, ")\n");
+ 	    }
+-	  continue;
+ 	}
+       else
+ 	{
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch
new file mode 100644
index 0000000..e058eb1
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99516.patch
@@ -0,0 +1,45 @@
+2011-06-09  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	LP:748138
+
+	gcc/
+	* cfgrtl.c (try_redirect_by_replacing_jump): Treat EXIT_BLOCK_PTR case
+	separately before call to redirect_jump(). Add assertion.
+	(patch_jump_insn): Same.
+
+=== modified file 'gcc/cfgrtl.c'
+--- old/gcc/cfgrtl.c	2011-02-08 10:51:58 +0000
++++ new/gcc/cfgrtl.c	2011-05-12 08:56:07 +0000
+@@ -835,11 +835,10 @@
+       if (dump_file)
+ 	fprintf (dump_file, "Redirecting jump %i from %i to %i.\n",
+ 		 INSN_UID (insn), e->dest->index, target->index);
+-      if (!redirect_jump (insn, block_label (target), 0))
+-	{
+-	  gcc_assert (target == EXIT_BLOCK_PTR);
+-	  return NULL;
+-	}
++      if (target == EXIT_BLOCK_PTR)
++	return NULL;
++      if (! redirect_jump (insn, block_label (target), 0))
++	gcc_unreachable ();
+     }
+ 
+   /* Cannot do anything for target exit block.  */
+@@ -1019,11 +1018,10 @@
+ 	  /* If the substitution doesn't succeed, die.  This can happen
+ 	     if the back end emitted unrecognizable instructions or if
+ 	     target is exit block on some arches.  */
+-	  if (!redirect_jump (insn, block_label (new_bb), 0))
+-	    {
+-	      gcc_assert (new_bb == EXIT_BLOCK_PTR);
+-	      return false;
+-	    }
++	  if (new_bb == EXIT_BLOCK_PTR)
++	    return false;
++	  if (! redirect_jump (insn, block_label (new_bb), 0))
++	    gcc_unreachable ();
+ 	}
+     }
+   return true;
+
-- 
1.7.4.1



