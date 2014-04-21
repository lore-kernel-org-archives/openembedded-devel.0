Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAAAA65D21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 05:46:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L5k4WQ013471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 22:46:04 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Apr 2014 22:46:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 01:46:02 -0400
Message-ID: <1398059162-6678-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] iozone: update version to 414
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
X-List-Received-Date: Mon, 21 Apr 2014 05:46:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- use BPN to fix multilib builds
- drop the fileop-arm.patch since the issue is already
  fixed in the new version.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../iozone3/iozone3/fileop-arm.patch               |   32 ------------
 .../iozone3/{iozone3_263.bb => iozone3_414.bb}     |   51 +++++++++++---------
 2 files changed, 27 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_263.bb => iozone3_414.bb} (63%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch b/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
deleted file mode 100644
index c71bfee..0000000
--- a/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Modify makefile to compile fileop.c file for ARM architecture.
-
-Upstream-Status: Inappropriate [not author]
-Index: current/makefile
-===================================================================
---- current.orig/makefile	2006-10-14 21:42:36.000000000 +0200
-+++ current/makefile	2006-10-14 21:40:02.000000000 +0200
-@@ -190,9 +190,10 @@
- #
- # GNU 'C' compiler Linux build with threads, largefiles, async I/O
- #
--linux-arm:	iozone_linux-arm.o  libbif.o libasync.o
-+linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o
- 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
- 		-lrt -lpthread -o iozone
-+	$(CC)  -O3 -Dlinux fileop_linux-arm.o -o fileop
- 
- #
- # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
-@@ -725,6 +726,12 @@
- 	@echo ""
- 	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-AMD64.o
- 
-+fileop_linux-arm.o:	fileop.c
-+	@echo ""
-+	@echo "Building fileop for Linux-arm"
-+	@echo ""
-+	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-arm.o
-+
- fileop_windows.o: fileop.c
- 	@echo ""
- 	@echo "Building fileop for Windows"
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
similarity index 63%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
index 9de0ac7..14373b9 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb
@@ -3,46 +3,49 @@ HOMEPAGE = "http://www.iozone.org/"
 AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.oracle.com>"
 SECTION = "console/tests"
 LICENSE = "iozone3"
-LIC_FILES_CHKSUM = "file://iozone.c;beginline=237;endline=241;md5=ab42a6185fd0443978871f11a007ac0b"
+LIC_FILES_CHKSUM = "file://iozone.c;beginline=266;endline=270;md5=ab42a6185fd0443978871f11a007ac0b"
 
-
-SRC_URI = "http://www.iozone.org/src/current/iozone3_263.tar \
+SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://copyright.txt \
-    file://fileop-arm.patch \
 "
-SRC_URI[md5sum] = "44fd88df361ec4508e10c8d6615245fa"
-SRC_URI[sha256sum] = "920fde1a3843539570e2df4aa611e74df102e52d363c5973d5a9d15bdf976461"
+SRC_URI[md5sum] = "a40dcda593f5841d0aaffe9f21172020"
+SRC_URI[sha256sum] = "9f60e854d7bc5bc3de15355cf5621e15098bd744a26845d11730b3060f4a5fff"
 
-S = "${WORKDIR}/${PN}_${PV}/src/current/"
+S = "${WORKDIR}/${BPN}_${PV}/src/current/"
 
-EXTRA_OEMAKE_powerpc = "linux-powerpc CC='${CC}'"
-EXTRA_OEMAKE_powerpc64 = "linux-powerpc64 CC='${CC}'"
-EXTRA_OEMAKE_arm = "linux-arm CC='${CC}'"
-EXTRA_OEMAKE = "linux CC='${CC}'"
+#
+# All other arches can use the default OEMAKE except those
+# explicitly listed below. Another, the iozone3 Makefile
+# needs to be told about the cross-compiler explicitly here.
+#
+EXTRA_OEMAKE_powerpc = "linux-powerpc CC='${CC}' GCC='${CC}'"
+EXTRA_OEMAKE_powerpc64 = "linux-powerpc64 CC='${CC}' GCC='${CC}'"
+EXTRA_OEMAKE_arm = "linux-arm CC='${CC}' GCC='${CC}'"
+EXTRA_OEMAKE = "linux CC='${CC}' GCC='${CC}'"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
     install -d ${D}${bindir} \
-        ${D}${mandir}/man1 \
-    ${D}${datadir}/doc/${PN}/examples
+               ${D}${mandir}/man1 \
+               ${D}${datadir}/doc/${BPN}/examples
 
     install -m 0755 ${S}/iozone ${D}${bindir}
     install -m 0755 ${S}/fileop ${D}${bindir}
-    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/iozone.1 ${D}${mandir}/man1/
-    install -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${PN}/
+    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/iozone.1 ${D}${mandir}/man1/
+    install -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${BPN}/
 
-    install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${PN}/examples
-    install -m 0644 ${S}/client_list ${D}${datadir}/doc/${PN}/examples
-    install -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${PN}/examples
+    install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${BPN}/examples
+    install -m 0644 ${S}/client_list ${D}${datadir}/doc/${BPN}/examples
+    install -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${BPN}/examples
 
-    install -m 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${PN}/examples
-    install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${PN}/examples
-    install -m 0755 ${S}/report.pl ${D}${datadir}/doc/${PN}/examples
+    install -m 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${BPN}/examples
+    install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${BPN}/examples
+    install -m 0755 ${S}/report.pl ${D}${datadir}/doc/${BPN}/examples
 
-    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Iozone_ps.gz ${D}${datadir}/doc/${PN}/
-    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/IOzone_msword_98.pdf ${D}${datadir}/doc/${PN}/
-    install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Run_rules.doc ${D}${datadir}/doc/${PN}/
+    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Iozone_ps.gz ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/IOzone_msword_98.pdf ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${WORKDIR}/${BPN}_${PV}/docs/Run_rules.doc ${D}${datadir}/doc/${BPN}/
 }
 
 FILES_${PN} += "${datadir}/doc/${PN}/copyright.txt"
-- 
1.7.9.5


