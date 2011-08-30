Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyO7q-00043d-0N
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 15:13:10 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyO37-0006CO-Ur from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 06:08:18 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 30 Aug 2011 15:08:16 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 18:08:34 +0500
Message-Id: <95b817a700e9717ccfed4167ee0be3fb9547c1b4.1314709432.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314709432.git.noor_ahsan@mentor.com>
References: <cover.1314709432.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 30 Aug 2011 13:08:17.0285 (UTC)
	FILETIME=[E2237350:01CC6715]
Subject: [meta-oe][PATCH v2 3/3] iozone3: Add version 263 (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 13:13:10 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Import from oe.dev commit id b55dcd636a162541a4cdcace8c106869fbb9465b.
* Bring LIC_FILES_CHKSUM from iozone.c file.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../iozone3/iozone3/copyright.txt                  |   62 +++++++++++
 .../iozone3/iozone3/fileop-arm.patch               |   32 ++++++
 meta-oe/recipes-benchmark/iozone3/iozone3_263.bb   |  111 ++++++++++++++++++++
 3 files changed, 205 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/copyright.txt
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3_263.bb

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/copyright.txt b/meta-oe/recipes-benchmark/iozone3/iozone3/copyright.txt
new file mode 100644
index 0000000..3468fa9
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3/copyright.txt
@@ -0,0 +1,62 @@
+LICENSE:
+
+ Copyright 1991, 1992, 1994, 1998, 1999, 2002   William D. Norcott
+
+ License to freely use and distribute this software is hereby granted 
+ by the author, subject to the condition that this copyright notice 
+ remains intact.  The author retains the exclusive right to publish 
+ derivative works based on this work, including, but not limited to
+ revised versions of this work.
+
+
+
+Below is author reply to question about distributing iozone3 in
+OpenEmbedded:
+
+========================================================================
+
+Marcin,
+
+        Re-distribution is permitted as long as the copyright is
+    maintained and the source code is not changed. I do not
+    see a problem with your mods to enable fileop for Linux-arm,
+    as these mods have been returned to the Iozone folks,
+    and they have been accepted for inclusion in the next
+    release :-)
+
+Thank you for your contribution,
+Don Capps
+
+----- Original Message ----- 
+From: "Marcin Juszkiewicz" <firma@hrw.one.pl>
+To: "Don Capps" <don.capps2@verizon.net>; "William D. Norcott" 
+<wnorcott@us.oracle.com>
+Sent: Sunday, October 29, 2006 4:55 PM
+Subject: iozone3 263 patch for arm and License question
+
+
+> Morning
+>
+> I want to include iozone3 in OpenEmbedded [1] metadata to give it for
+> other developers. Currently OE is used to build few distributions for
+> misc platforms: ARM, SH3, SH4, x86, PowerPC and different types of
+> machines (PDA, settopbox, devboards, desktops, thin clients, routers).
+>
+> According to your distribution of derivations is forbidden. Packaging
+> iozone3 in OpenEmbedded will not involve any source code changes. But
+> when I was building it for ARM I discovered that fileop binary was not
+> built - so I created patch for it (attached). Not yet tested it on target
+> device.
+>
+> Thus, I seek your written permission via e-mail to distribute a package of
+> the unmodified source code and also a package of the pre-compiled binary.
+> Your copyright statement will be included in the package.
+>
+>
+> 1. http://www.openembedded.org/
+>
+> Regards
+> -- 
+> JID: hrw-jabber.org
+> OpenEmbedded developer/consultant
+
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch b/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
new file mode 100644
index 0000000..c71bfee
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
@@ -0,0 +1,32 @@
+Modify makefile to compile fileop.c file for ARM architecture.
+
+Upstream-Status: Inappropriate [not author]
+Index: current/makefile
+===================================================================
+--- current.orig/makefile	2006-10-14 21:42:36.000000000 +0200
++++ current/makefile	2006-10-14 21:40:02.000000000 +0200
+@@ -190,9 +190,10 @@
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O
+ #
+-linux-arm:	iozone_linux-arm.o  libbif.o libasync.o
++linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o
+ 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
+ 		-lrt -lpthread -o iozone
++	$(CC)  -O3 -Dlinux fileop_linux-arm.o -o fileop
+ 
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
+@@ -725,6 +726,12 @@
+ 	@echo ""
+ 	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-AMD64.o
+ 
++fileop_linux-arm.o:	fileop.c
++	@echo ""
++	@echo "Building fileop for Linux-arm"
++	@echo ""
++	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux-arm.o
++
+ fileop_windows.o: fileop.c
+ 	@echo ""
+ 	@echo "Building fileop for Windows"
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
new file mode 100644
index 0000000..c1aa7fb
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
@@ -0,0 +1,111 @@
+DESCRIPTION = "Filesystem and Disk Benchmarking Tool"
+HOMEPAGE = "http://www.iozone.org/"
+AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.oracle.com>"
+SECTION = "console/tests"
+LICENSE = "iozone3"
+LIC_FILES_CHKSUM = "file://iozone.c;beginline=237;endline=241;md5=ab42a6185fd0443978871f11a007ac0b"
+
+
+SRC_URI = "http://www.iozone.org/src/current/iozone3_263.tar \
+	   file://copyright.txt \
+           file://fileop-arm.patch \
+           "
+SRC_URI[md5sum] = "44fd88df361ec4508e10c8d6615245fa"
+SRC_URI[sha256sum] = "920fde1a3843539570e2df4aa611e74df102e52d363c5973d5a9d15bdf976461"
+
+S = "${WORKDIR}/${PN}_${PV}/src/current/"
+
+EXTRA_OEMAKE_powerpc = "linux-powerpc CC='${CC}'"
+EXTRA_OEMAKE_powerpc64 = "linux-powerpc64 CC='${CC}'"
+EXTRA_OEMAKE_arm = "linux-arm CC='${CC}'"
+EXTRA_OEMAKE = "linux CC='${CC}'"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install() {
+       install -d ${D}${bindir} \
+                  ${D}${mandir}/man1 \
+		  ${D}${datadir}/doc/${PN}/examples
+
+       install -m 0755 ${S}/iozone ${D}${bindir}
+       install -m 0755 ${S}/fileop ${D}${bindir}
+       install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/iozone.1 ${D}${mandir}/man1/
+       install -m 0644 ${WORKDIR}/copyright.txt ${D}${datadir}/doc/${PN}/
+
+       install -m 0644 ${S}/*.dem ${D}${datadir}/doc/${PN}/examples
+       install -m 0644 ${S}/client_list ${D}${datadir}/doc/${PN}/examples
+       install -m 0644 ${S}/Gnuplot.txt ${D}${datadir}/doc/${PN}/examples
+
+       install -m 0755 ${S}/Generate_Graphs ${D}${datadir}/doc/${PN}/examples
+       install -m 0755 ${S}/gengnuplot.sh ${D}${datadir}/doc/${PN}/examples
+       install -m 0755 ${S}/report.pl ${D}${datadir}/doc/${PN}/examples
+
+       install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Iozone_ps.gz ${D}${datadir}/doc/${PN}/
+       install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/IOzone_msword_98.pdf ${D}${datadir}/doc/${PN}/
+       install -m 0644 ${WORKDIR}/${PN}_${PV}/docs/Run_rules.doc ${D}${datadir}/doc/${PN}/
+}
+
+FILES_${PN} += "${datadir}/doc/${PN}/copyright.txt"
+
+# LICENSE:
+#
+#  Copyright 1991, 1992, 1994, 1998, 1999, 2002   William D. Norcott
+#
+#  License to freely use and distribute this software is hereby granted
+#  by the author, subject to the condition that this copyright notice
+#  remains intact.  The author retains the exclusive right to publish
+#  derivative works based on this work, including, but not limited to
+#  revised versions of this work.
+#
+
+#
+# Below is author reply to question about distributing iozone3 in
+# OpenEmbedded:
+#
+# ========================================================================
+#
+# Marcin,
+#
+#         Re-distribution is permitted as long as the copyright is
+#     maintained and the source code is not changed. I do not
+#     see a problem with your mods to enable fileop for Linux-arm,
+#     as these mods have been returned to the Iozone folks,
+#     and they have been accepted for inclusion in the next
+#     release :-)
+#
+# Thank you for your contribution,
+# Don Capps
+#
+# ----- Original Message -----
+# From: "Marcin Juszkiewicz" <firma@hrw.one.pl>
+# To: "Don Capps" <don.capps2@verizon.net>; "William D. Norcott"
+# <wnorcott@us.oracle.com>
+# Sent: Sunday, October 29, 2006 4:55 PM
+# Subject: iozone3 263 patch for arm and License question
+#
+#
+# > Morning
+# >
+# > I want to include iozone3 in OpenEmbedded [1] metadata to give it for
+# > other developers. Currently OE is used to build few distributions for
+# > misc platforms: ARM, SH3, SH4, x86, PowerPC and different types of
+# > machines (PDA, settopbox, devboards, desktops, thin clients, routers).
+# >
+# > According to your distribution of derivations is forbidden. Packaging
+# > iozone3 in OpenEmbedded will not involve any source code changes. But
+# > when I was building it for ARM I discovered that fileop binary was not
+# > built - so I created patch for it (attached). Not yet tested it on target
+# > device.
+# >
+# > Thus, I seek your written permission via e-mail to distribute a package of
+# > the unmodified source code and also a package of the pre-compiled binary.
+# > Your copyright statement will be included in the package.
+# >
+# >
+# > 1. http://www.openembedded.org/
+# >
+# > Regards
+# > --
+# > JID: hrw-jabber.org
+# > OpenEmbedded developer/consultant
+
-- 
1.7.0.4



