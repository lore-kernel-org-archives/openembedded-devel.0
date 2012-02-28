Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1S2UzX-0006Os-S4
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 22:53:52 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1SLailP005053
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 15:36:45 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLahrK026738
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 03:06:43 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 29 Feb 2012 03:06:43 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1SLacgi017059;
	Wed, 29 Feb 2012 03:06:42 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Feb 2012 15:36:36 -0600
Message-ID: <1330464996-24176-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1330464996-24176-1-git-send-email-Chase.Maupin@ti.com>
References: <1330464996-24176-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [meta-oe][PATCH 1/1] nbench-byte: import recipe for oe-classic
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
X-List-Received-Date: Tue, 28 Feb 2012 21:53:52 -0000
Content-Type: text/plain

* Import the nbench-byte recipe from the oe-classic git repo at
  git://git.openembedded.org/openembedded commit id:
    * 6fe7cef27069415f2eba36bc640cf59013d4979b
* Update LICENSE checksums
* Original Author:
    * Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
* Modifications by:
    * Koen Kooi <koen@openembedded.org>
    * Martin Jansa <Martin.Jansa@gmail.com>
    * Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../nbench-byte/nbench-byte/nbench_32bits.patch    |   46 ++++++++++++++++++++
 .../nbench-byte/nbench-byte_2.2.3.bb               |   26 +++++++++++
 2 files changed, 72 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch
new file mode 100644
index 0000000..1b8a4dc
--- /dev/null
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/nbench_32bits.patch
@@ -0,0 +1,46 @@
+From 81f4043a6787060029ef20eed21cdcf3e50337df Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Tue, 28 Feb 2012 14:58:35 -0600
+Subject: [PATCH] nbench: modify Makefile for 32bit
+
+* Patch taken from OE classic git repository as of commit id
+  ad42bf9065928b2902d7d9534709d3ccea7ec956 and was added by:
+    * Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+* Notes from original patch were:
+
+BYTE Magazine's native benchmarks (also called BYTEmark) designed to
+expose the capabilities of a system's CPU, FPU and memory system.
+
+http://www.tux.org/~mayer/linux/
+
+Recipe from old Atmel overlay.
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: Chase Maupin <chase.maupin@ti.com>
+---
+ Makefile |    8 ++------
+ 1 files changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5045c77..915866d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -119,12 +119,8 @@ emfloat.o: emfloat.h emfloat.c nmglobal.h pointer.h Makefile
+ 	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\
+ 		-c emfloat.c
+ 
+-pointer.h: pointer Makefile
+-	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\
+-		-o pointer pointer.c
+-	rm -f pointer.h
+-	if [ "4" = `./pointer` ] ; then touch pointer.h ;\
+-	else echo "#define LONG64" >pointer.h ; fi
++pointer.h: Makefile
++	touch pointer.h ;
+ 
+ misc.o: misc.h misc.c Makefile
+ 	$(CC) $(MACHINE) $(DEFINES) $(CFLAGS)\
+-- 
+1.7.0.4
+
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
new file mode 100644
index 0000000..9a002de
--- /dev/null
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
+designed to expose the capabilities of a system's CPU, FPU, \
+and memory system."
+HOMEPAGE = "http://www.tux.org/~mayer/linux/"
+LICENSE = "freely distributable"
+LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
+SECTION = "console/utils"
+
+SRC_URI = "http://www.tux.org/~mayer/linux/${PN}-${PV}.tar.gz \
+           file://nbench_32bits.patch"
+
+PR = "r1"
+
+TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}"
+do_compile() {
+	oe_runmake
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0644 NNET.DAT ${D}${bindir}/
+	install -m 0755 nbench ${D}${bindir}/
+}
+
+SRC_URI[md5sum] = "285dfab361080759d477ea1fe7d3093a"
+SRC_URI[sha256sum] = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed9101ac"
-- 
1.7.0.4



