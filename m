Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@sles10-64.ott.cti.com>) id 1MT0q7-0006My-FT
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 23:56:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0FECE3BFA68;
	Mon, 20 Jul 2009 17:42:09 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30714-02; Mon, 20 Jul 2009 17:42:08 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id D9EC14ECC92; Mon, 20 Jul 2009 17:42:08 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 9C4722709B8;
	Mon, 20 Jul 2009 17:42:07 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1001)
	id 7FE2BA843D4; Mon, 20 Jul 2009 17:42:07 -0400 (EDT)
From: Josh Mahonin <jmahonin@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jul 2009 17:41:00 -0400
Message-Id: <1248126060-4365-1-git-send-email-jmahonin@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] pciutils_3.1.2.bb: Make sure lspci reads pci.ids.gz from right location
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
X-List-Received-Date: Mon, 20 Jul 2009 21:56:07 -0000

Previously this version of 'lspci' would attempt to open pci.ids, because of
incorrect paths at configure-time.  New pciutils Makefile makes use of a
'DESTDIR' flag that we can set as the staging directory, and an 'IDSDIR' flag
which holds the location of the pci.ids{.gz} files.  Also bumped PR.

Signed-off-by: Josh Mahonin <jmahonin@cbnco.com>
---
 recipes/pciutils/pciutils_3.1.2.bb |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/recipes/pciutils/pciutils_3.1.2.bb b/recipes/pciutils/pciutils_3.1.2.bb
index d7458a1..ae7317e 100644
--- a/recipes/pciutils/pciutils_3.1.2.bb
+++ b/recipes/pciutils/pciutils_3.1.2.bb
@@ -12,7 +12,7 @@ SRC_URI_append_nylon = "file://gcc-3-compatibility.patch;patch=1 "
 
 PARALLEL_MAKE = ""
 
-PR ="r2"
+PR ="r3"
 
 EXTRA_OEMAKE += "'STRIP = '"
 export SHARED=yes
@@ -21,18 +21,20 @@ do_configure () {
 	(cd lib && ./configure ${datadir} ${PV} ${TARGET_OS} 2.4.21 ${TARGET_ARCH})
 }
 
-export PREFIX = "${D}${prefix}"
-export SBINDIR = "${D}${sbindir}"
-export SHAREDIR = "${D}${datadir}"
-export MANDIR = "${D}${mandir}"
+export DESTDIR = "${D}"
+export PREFIX = "${prefix}"
+export SBINDIR = "${sbindir}"
+export SHAREDIR = "${datadir}"
+export MANDIR = "${mandir}"
+export IDSDIR = "${datadir}"
 
 do_install () {
 	oe_runmake install
 }
 
 do_install_append () {
-	install -d ${D}/${prefix}/share
-	install -m 6440 ${WORKDIR}/${PN}-${PV}/pci.ids ${D}/${prefix}/share
+	install -d ${D}/${datadir}
+	install -m 6440 ${WORKDIR}/${PN}-${PV}/pci.ids.gz ${D}/${datadir}
 
 	# The makefile does not install the development files:
 	# libpci.so pci.h header.h config.h types.h
@@ -57,4 +59,4 @@ do_stage () {
 
 
 PACKAGES =+ "pciutils-ids"
-FILES_pciutils-ids="${prefix}/share/pci.ids"
+FILES_pciutils-ids="${datadir}/pci.ids.gz"
-- 
1.6.3



