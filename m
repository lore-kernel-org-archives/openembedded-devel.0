Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Md2Xd-0006Um-Ck
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 15:46:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id E166053D3E0;
	Mon, 17 Aug 2009 09:29:31 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22172-03; Mon, 17 Aug 2009 09:29:31 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id C0A6453F59C; Mon, 17 Aug 2009 09:29:31 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 4B15653D3E0;
	Mon, 17 Aug 2009 09:29:28 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 44E98A0C0D3; Mon, 17 Aug 2009 09:29:28 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 09:29:03 -0400
Message-Id: <1250515743-10823-3-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1250515743-10823-2-git-send-email-msmith@cbnco.com>
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com>
	<1250515743-10823-2-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 3/3] syslinux: upgrade to 3.82 and split into a few packages
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
X-List-Received-Date: Mon, 17 Aug 2009 13:46:45 -0000

3.63 is no longer available.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

I guess I changed a few too many lines for
git format-patch -M -C --find-copies-harder to recognize it as a pair
of renames (syslinux, syslinux-native 3.63 -> 3.82).


 conf/checksums.ini                       |    4 +++
 recipes/syslinux/syslinux-native_3.63.bb |   23 ----------------
 recipes/syslinux/syslinux-native_3.82.bb |   24 +++++++++++++++++
 recipes/syslinux/syslinux_3.63.bb        |   32 -----------------------
 recipes/syslinux/syslinux_3.82.bb        |   41 ++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+), 55 deletions(-)
 delete mode 100644 recipes/syslinux/syslinux-native_3.63.bb
 create mode 100644 recipes/syslinux/syslinux-native_3.82.bb
 delete mode 100644 recipes/syslinux/syslinux_3.63.bb
 create mode 100644 recipes/syslinux/syslinux_3.82.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index b50f7f7..eb7c56b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23278,6 +23278,10 @@ sha256=c087b112da0afd1c50ba8a8a2727c4cabfb1e5a57f43701c5abdc05865072649
 md5=ee6b84cc7b598b4e1a00a4a8c6676d4e
 sha256=d4d17102e014d3183a11719896061dc464c3d9a836caaf47b3b57da4ac23b52d
 
+[http://kernel.org/pub/linux/utils/boot/syslinux/syslinux-3.82.tar.bz2]
+md5=c9f4e73e385c86b3a8faf9b615a04836
+sha256=1dbbf8cfd10fc07187fa8bfede23639fc95314976730f3474cb349e8bf6c6f61
+
 [http://www.balabit.com/downloads/files/syslog-ng/sources/1.6/src/syslog-ng-1.6.11.tar.gz]
 md5=8f9ca6140f428dc9adec9fa1c270a2dd
 sha256=dd37f1e280bd6c2d66c9a15aa3ee9e209a1b649e3b79e70fee58aea1cb0ea093
diff --git a/recipes/syslinux/syslinux-native_3.63.bb b/recipes/syslinux/syslinux-native_3.63.bb
deleted file mode 100644
index 3cd1ff8..0000000
--- a/recipes/syslinux/syslinux-native_3.63.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-# syslinux-native OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Copyright (C) 2009, O.S. Systems Software Ltda.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require syslinux_${PV}.bb
-inherit native
-
-STAGE_TEMP="${WORKDIR}/stage_temp"
-
-do_stage() {
-	install -d ${STAGE_TEMP}
-	oe_runmake install INSTALLROOT="${STAGE_TEMP}"
-
-	install -d ${STAGING_BINDIR}
-	install -m 755 ${STAGE_TEMP}/usr/bin/syslinux ${STAGING_BINDIR}
-	install -m 755 ${STAGE_TEMP}/sbin/extlinux ${STAGING_BINDIR}
-
-	install -d ${STAGING_DATADIR}/syslinux
-	install -m 0644 ${STAGE_TEMP}/usr/lib/syslinux/isolinux.bin ${STAGING_DATADIR}/syslinux/isolinux.bin
-	install -m 644 ${S}/ldlinux.sys ${STAGING_DATADIR}/syslinux/ldlinux.sys
-	install -m 644 ${S}/ldlinux.bss ${STAGING_DATADIR}/syslinux/ldlinux.bss
-}
diff --git a/recipes/syslinux/syslinux-native_3.82.bb b/recipes/syslinux/syslinux-native_3.82.bb
new file mode 100644
index 0000000..69ab9c1
--- /dev/null
+++ b/recipes/syslinux/syslinux-native_3.82.bb
@@ -0,0 +1,24 @@
+# syslinux-native OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Copyright (C) 2009, O.S. Systems Software Ltda.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require syslinux_${PV}.bb
+inherit native
+
+STAGE_TEMP="${WORKDIR}/stage_temp"
+
+do_stage() {
+	install -d ${STAGE_TEMP}
+	oe_runmake install INSTALLROOT="${STAGE_TEMP}"
+
+	install -d ${STAGING_BINDIR}
+	install -m 755 ${STAGE_TEMP}/${bindir}/syslinux ${STAGING_BINDIR}
+	install -m 755 ${STAGE_TEMP}/${base_sbindir}/extlinux ${STAGING_BINDIR}
+
+	install -d ${STAGING_DATADIR}/syslinux
+	install -m 0644 ${STAGE_TEMP}/${datadir}/syslinux/isolinux.bin ${STAGING_DATADIR}/syslinux/isolinux.bin
+	install -m 0644 ${STAGE_TEMP}/${datadir}/syslinux/mbr.bin ${STAGING_DATADIR}/syslinux/mbr.bin
+	install -m 0644 ${S}/core/ldlinux.sys ${STAGING_DATADIR}/syslinux/ldlinux.sys
+	install -m 0644 ${S}/core/ldlinux.bss ${STAGING_DATADIR}/syslinux/ldlinux.bss
+}
diff --git a/recipes/syslinux/syslinux_3.63.bb b/recipes/syslinux/syslinux_3.63.bb
deleted file mode 100644
index 95fb557..0000000
--- a/recipes/syslinux/syslinux_3.63.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-# syslinux OE build file
-# Copyright (C) 2009, O.S. Systems Software Ltda.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION="A multi-purpose linux bootloader"
-HOMEPAGE="http://syslinux.zytor.com/"
-LICENSE="GPL"
-DEPENDS="nasm-native"
-RDEPENDS="mtools"
-PR="r2"
-
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 "
-
-S="${WORKDIR}/syslinux-${PV}"
-
-inherit autotools
-
-do_configure_prepend() {
-	# drop win32 targets or build fails
-	sed -i 's,win32/\S*,,g' -i Makefile
-}
-
-do_compile() {
-	oe_runmake CC="${CC}"
-}
-
-do_install() {
-	oe_runmake install INSTALLROOT="${D}"
-
-	# we don't use com32, drop it
-	rm -r "${D}/${libdir}/syslinux/com32"
-}
diff --git a/recipes/syslinux/syslinux_3.82.bb b/recipes/syslinux/syslinux_3.82.bb
new file mode 100644
index 0000000..4c4102e
--- /dev/null
+++ b/recipes/syslinux/syslinux_3.82.bb
@@ -0,0 +1,41 @@
+# syslinux OE build file
+# Copyright (C) 2009, O.S. Systems Software Ltda.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION = "A multi-purpose linux bootloader"
+HOMEPAGE = "http://syslinux.zytor.com/"
+LICENSE = "GPL"
+DEPENDS = "nasm-native"
+RRECOMMENDS_${PN} = "mtools"
+PR = "r0"
+
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 "
+
+EXTRA_OEMAKE = " \
+	BINDIR=${bindir} SBINDIR=${base_sbindir} LIBDIR=${libdir} \
+	DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
+"
+
+do_configure() {
+	# drop win32 targets or build fails
+	sed -e 's,win32/\S*,,g' -i Makefile
+
+	# clean installer executables included in source tarball
+	oe_runmake clean
+}
+
+do_compile() {
+	# Rebuild only the installer; keep precompiled bootloaders
+	# as per author's request (doc/distrib.txt)
+	oe_runmake CC="${CC}" installer
+}
+
+do_install() {
+	oe_runmake install INSTALLROOT="${D}"
+}
+
+PACKAGES =+ "${PN}-extlinux ${PN}-mbr"
+FILES_${PN} = "${bindir}/syslinux"
+FILES_${PN}-extlinux = "${base_sbindir}/extlinux"
+FILES_${PN}-mbr = "${datadir}/${PN}/mbr.bin"
+FILES_${PN}-dev += "${datadir}/${PN}/com32"
-- 
1.6.3



