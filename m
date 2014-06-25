Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 52CAF6FE96
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 12:53:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5PCrAAE006075;
	Wed, 25 Jun 2014 07:53:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5PCrACE004746;
	Wed, 25 Jun 2014 07:53:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 25 Jun 2014 07:53:09 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5PCr67r030862;
	Wed, 25 Jun 2014 07:53:07 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jun 2014 07:53:03 -0500
Message-ID: <1403700783-25551-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [for daisy][meta-networking][PATCH] ptpd: update to 2.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jun 2014 12:53:17 -0000
Content-Type: text/plain

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ptpd/ptpd-2.2.0/ld-as-needed.patch             |   37 --------------------
 meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb |   28 ---------------
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb |   29 +++++++++++++++
 3 files changed, 29 insertions(+), 65 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
 delete mode 100644 meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch b/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
deleted file mode 100644
index 7d5251b..0000000
--- a/meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Patch from http://patch-tracker.debian.org/package/ptpd
-
-Description: Fix ld --as-needed
- This patch fixes the order of gcc arguments to fix ld --as-needed
-Author: Roland Stigge <stigge@antcom.de>
-Bug-Debian: http://bugs.debian.org/607583
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- src/Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index a672625..88a2fc8 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -40,7 +40,7 @@ CFLAGS += -DDBG_SIGUSR2_CHANGE_DEBUG
- 
- CFLAGS += -DPTP_EXPERIMENTAL
- 
--LDFLAGS+= -lm -lrt
-+LIBS += -lm -lrt
- 
- PROG = ptpd
- SRCS = ptpd.c arith.c bmc.c protocol.c display.c\
-@@ -63,7 +63,7 @@ TAGFILES = GPATH GRTAGS GSYMS GTAGS cscope.in.out cscope.out cscope.po.out
- all: $(PROG)
- 
- $(PROG): $(OBJS)
--	$(CC) -o $@ $(OBJS) $(LDFLAGS)
-+	$(CC) -o $@ $(OBJS) $(LDFLAGS) $(LIBS)
- 
- $(OBJS): $(HDRS)
- 
--- 
-1.7.4
-
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
deleted file mode 100644
index f2e895d..0000000
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.2.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "The PTP daemon (PTPd)"
-DESCRIPTION = "The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as \
-defined by the relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2002, \
-and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise \
-time coordination of LAN connected computers."
-HOMEPAGE = "http://sourceforge.net/projects/ptpd"
-SECTION = "network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://../COPYRIGHT;md5=3d8ac2c46c116bce2d2ad838b6cf3491"
-
-PR = "r1"
-
-SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz \
-           file://ld-as-needed.patch;striplevel=2 \
-"
-
-SRC_URI[md5sum] = "c63a3a149d30c710773ccb02df5782a3"
-SRC_URI[sha256sum] = "f2266a22db84318d8b9ce266ea83772c03438c31f4993fa9643fa675a07c26b4"
-
-S = "${WORKDIR}/ptpd-${PV}/src"
-
-EXTRA_OEMAKE = ""
-
-do_install() {
-    install -d ${D}${bindir} ${D}${mandir}/man8
-    install -m 0755 ptpd2 ${D}${bindir}
-    install -m 0644 ptpd2.8 ${D}${mandir}/man8
-}
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
new file mode 100644
index 0000000..54679dc
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "The PTP daemon (PTPd)"
+DESCRIPTION = "The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as \
+defined by the relevant IEEE 1588 standard. PTP Version 1 implements IEEE-1588-2002, \
+and PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise \
+time coordination of LAN connected computers."
+HOMEPAGE = "http://sourceforge.net/projects/ptpd"
+SECTION = "network"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4019cad2b3cd55f22ea819ffad6ccd41"
+
+DEPENDS = "libpcap"
+
+inherit autotools
+
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz"
+
+S = "${WORKDIR}/ptpd-${PV}"
+SRC_URI[md5sum] = "f5e931b4a229705ff0dbdfe22490566b"
+SRC_URI[sha256sum] = "1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7"
+
+EXTRA_OEMAKE = ""
+
+EXTRA_OECONF += "--disable-snmp"
+
+do_install() {
+    install -d ${D}${bindir} ${D}${mandir}/man8
+    install -m 0755 ${B}/src/ptpd2 ${D}${bindir}
+    install -m 0644 ${B}/src/ptpd2.8 ${D}${mandir}/man8
+}
-- 
1.7.0.4


