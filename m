Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joerg@hakker.de>) id 1LoNbs-0004RT-Ee
	for Openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 21:57:28 +0200
Received: from tristan.localnet (port-92-202-121-238.dynamic.qsc.de
	[92.202.121.238])
	by mrelayeu.kundenserver.de (node=mrelayeu8) with ESMTP (Nemesis)
	id 0ML31I-1LoNZm3FNZ-0003vR; Mon, 30 Mar 2009 21:55:19 +0200
From: =?iso-8859-1?q?J=F6rg_Bakker?= <joerg@hakker.de>
To: Openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 21:55:16 +0200
User-Agent: KMail/1.11.1 (Linux/2.6.27-11-generic; KDE/4.2.1; i686; ; )
MIME-Version: 1.0
Message-Id: <200903302155.17027.joerg@hakker.de>
X-Provags-ID: V01U2FsdGVkX182ElK+bm6bSKCrhH9UiNowBtEv86WWQj9dnS0
	OHkzrhJ9L3AqgK96u1c2s2JeTM9dm1iq2QniDhB5eMUiNGw+o5
	EYHWqOKGUjMjQUUAMkubw==
Subject: [PATCH] linux-epia-2.6.19.2
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
X-List-Received-Date: Mon, 30 Mar 2009 19:57:28 -0000
X-Groupsio-MsgNum: 8846
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_lOS0JWSPdgLQZWj"

--Boundary-00=_lOS0JWSPdgLQZWj
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Building of linux-epia-2.6.19.2 stops with the following error:

| make[2]: Entering directory `/home/jb/devel/cc/jammsession/oe/build/tmp/work/epia-angstrom-linux/linux-epia-2.6.19.2-r1/linux-2.6.19.2'
|   CC      scripts/mod/empty.o
|   HOSTCC  scripts/mod/mk_elfconfig
|   MKELF   scripts/mod/elfconfig.h
|   HOSTCC  scripts/mod/file2alias.o
|   GEN     include/asm-i386/asm-offsets.h
| make[1]: Leaving directory `/home/jb/devel/cc/jammsession/oe/build/tmp/work/epia-angstrom-linux/linux-epia-2.6.19.2-r1/linux-2.6.19.2'
|   HOSTCC  scripts/mod/modpost.o
|   HOSTCC  scripts/mod/sumversion.o
| scripts/mod/sumversion.c: In function 'get_src_version':
| scripts/mod/sumversion.c:384: error: 'PATH_MAX' undeclared (first use in this function)
| scripts/mod/sumversion.c:384: error: (Each undeclared identifier is reported only once
| scripts/mod/sumversion.c:384: error: for each function it appears in.)
| scripts/mod/sumversion.c:384: warning: unused variable 'filelist'
| make[2]: *** [scripts/mod/sumversion.o] Error 1
| make[2]: Leaving directory `/home/jb/devel/cc/jammsession/oe/build/tmp/work/epia-angstrom-linux/linux-epia-2.6.19.2-r1/linux-2.6.19.2'
| make[1]: *** [scripts/mod] Error 2
| make[1]: Leaving directory `/home/jb/devel/cc/jammsession/oe/build/tmp/work/epia-angstrom-linux/linux-epia-2.6.19.2-r1/linux-2.6.19.2'
| make: *** [scripts] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/jb/devel/cc/jammsession/oe/build/tmp/work/epia-angstrom-linux/linux-epia-2.6.19.2-r1/temp/log.do_compile.3783
NOTE: package linux-epia-2.6.19.2-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package linux-epia-2.6.19.2: failed
ERROR: Build of /home/jb/devel/cc/jammsession/oe/openembedded/recipes/linux/linux-epia_2.6.19.2.bb do_compile failed
ERROR: Task 1181 (/home/jb/devel/cc/jammsession/oe/openembedded/recipes/linux/linux-epia_2.6.19.2.bb, do_compile) failed

OE Build Configuration:
BB_VERSION        = "1.8.13"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "8f8efbe43a7f28802d066f7f83915e8fbd0d4cc2"
TARGET_ARCH       = "i586"                                    
TARGET_OS         = "linux"                                   
MACHINE           = "epia"                                    
DISTRO            = "angstrom"                                
DISTRO_VERSION    = "2009.X-test-20090329"                    

The attached patch fixes this.


--Boundary-00=_lOS0JWSPdgLQZWj
Content-Type: text/x-patch;
  charset="UTF-8";
  name="linux-epia-2619-limits.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="linux-epia-2619-limits.patch"

diff -Nur openembedded/recipes/linux/linux-epia-2.6.19.2/linux-epia-2619-limits.patch build/recipes/linux/linux-epia-2.6.19.2/linux-epia-2619-limits.patch
--- openembedded/recipes/linux/linux-epia-2.6.19.2/linux-epia-2619-limits.patch	1970-01-01 01:00:00.000000000 +0100
+++ build/recipes/linux/linux-epia-2.6.19.2/linux-epia-2619-limits.patch	2009-03-21 18:02:08.000000000 +0100
@@ -0,0 +1,10 @@
+--- linux-2.6.19.2/scripts/mod/sumversion.c.orig	2009-03-15 21:44:58.000000000 +0100
++++ linux-2.6.19.2/scripts/mod/sumversion.c	2009-03-15 21:44:58.000000000 +0100
+@@ -8,6 +8,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include "modpost.h"
++#include <linux/limits.h>
+ 
+ /*
+  * Stolen form Cryptographic API.
diff -Nur openembedded/recipes/linux/linux-epia_2.6.19.2.bb build/recipes/linux/linux-epia_2.6.19.2.bb
--- openembedded/recipes/linux/linux-epia_2.6.19.2.bb	2009-03-21 10:44:07.000000000 +0100
+++ build/recipes/linux/linux-epia_2.6.19.2.bb	2009-03-21 18:03:19.000000000 +0100
@@ -6,7 +6,8 @@
 KERNEL_CCSUFFIX = "-3.3.4"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
-           file://epia_defconfig"
+           file://epia_defconfig \
+	   file://linux-epia-2619-limits.patch;patch=1"
 S = "${WORKDIR}/linux-${PV}"
 
 COMPATIBLE_HOST = 'i.86.*-linux'

--Boundary-00=_lOS0JWSPdgLQZWj--
