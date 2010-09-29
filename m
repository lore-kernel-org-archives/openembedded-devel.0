Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0zMA-0002nL-W0
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:18:12 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 600F2491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 18:17:58 +0200 (CEST)
Received: from localhost.localdomain ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 29 Sep 2010 18:17:58 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 18:17:13 +0200
Message-Id: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 29 Sep 2010 16:17:58.0134 (UTC)
	FILETIME=[E144F160:01CB5FF1]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Wed, 29 Sep 2010 16:18:12 -0000

libunwind causes cross gcc build to fail if libunwind is built first:

...
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb -isystem/SCRATCH/maniac/oe-merge-test/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -g -Os -O2 -g -Os -DIN_GCC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -isystem ./include  -fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED   -I. -I. -I../.././gcc -I/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc -I/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/. -I/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc -I/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../include  -DHAVE_CC_TLS -o _ucmpdi2_s.o -MT _ucmpdi2_s.o
  \
  -MD -MP -MF _ucmpdi2_s.dep -DSHARED -DL_ucmpdi2 -c /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/libgcc2.c
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:40: error: expected ')' before '*' token
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:41: error: expected ')' before '*' token
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:42: error: expected ')' before '*' token
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/unwind-arm.c:47: warning: data definition has no type or storage class
...

| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/pr-support.c:396: error: expected '=', ',', ';', 'asm' or '__attribute__' before '_Unwind_GetDataRelBase'
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/config/arm/pr-support.c:402: error: expected '=', ',', ';', 'asm' or '__attribute__' before '_Unwind_GetTextRelBase'
| make[2]: *** [unwind-arm.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: *** [pr-support.o] Error 1
...

| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:212: error: 'lsda_header_info' has no member named 'LPStart'
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:214: error: 'lsda_header_info' has no member named 'action_table'
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:234: error: expected ')' before 'ue_header'
| /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/libgcc/../gcc/unwind-c.c:123: warning: unused parameter 'ue_header'
| make[2]: *** [unwind-c.o] Error 1
| make[2]: Leaving directory `/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc'
| make[1]: *** [all-target-libgcc] Error 2
| make[1]: Leaving directory `/SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/gcc-4.3.3-r17.1/gcc-4.3.3/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gcc-4.3.3-r17.1: task do_compile: Failed

It looks like libunwind provides header files that are named
identically to gcc header files. gcc then confuses these headers when it
is built, causing a break of the build.

This patch makes libunwind depend on gcc which resolves the build issue. Both
build nicely when gcc is built first.

Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
---
 recipes/libunwind/libunwind.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/libunwind/libunwind.inc b/recipes/libunwind/libunwind.inc
index 6994095..4340192 100644
--- a/recipes/libunwind/libunwind.inc
+++ b/recipes/libunwind/libunwind.inc
@@ -1,7 +1,8 @@
 DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
 HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
-INC_PR = "r1"
+INC_PR = "r2"
+DEPENDS = "gcc"
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz;name=archive"
 
-- 
1.7.0.4



