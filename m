Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MbDxs-0006rm-OO
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 15:34:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 567FE536263;
	Wed, 12 Aug 2009 09:17:39 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07171-07; Wed, 12 Aug 2009 09:17:39 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 3B4D55376B5; Wed, 12 Aug 2009 09:17:38 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 7C516536263;
	Wed, 12 Aug 2009 09:17:35 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 5F843A0C07E; Wed, 12 Aug 2009 09:17:35 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2009 09:17:31 -0400
Message-Id: <1250083051-31424-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <19c1b8a90908101812v662e21b4h54683ac6fe4380b1@mail.gmail.com>
References: <19c1b8a90908101812v662e21b4h54683ac6fe4380b1@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH v2] pciutils: fix generation of pci.ids.gz
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
X-List-Received-Date: Wed, 12 Aug 2009 13:34:29 -0000

Set ZLIB=yes to prevent auto-detection by the lib/configure script,
which only looks in /usr/include.

Ship pci.ids in pci-ids-uncompressed for users of old hal versions.

Pass PREFIX to Make and use the install-lib target to save work.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/pciutils/pciutils_3.1.2.bb |   46 ++++++++++++++----------------------
 1 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/recipes/pciutils/pciutils_3.1.2.bb b/recipes/pciutils/pciutils_3.1.2.bb
index f23e6dd..ae7b3a7 100644
--- a/recipes/pciutils/pciutils_3.1.2.bb
+++ b/recipes/pciutils/pciutils_3.1.2.bb
@@ -12,15 +12,10 @@ SRC_URI_append_nylon = "file://gcc-3-compatibility.patch;patch=1 "
 
 PARALLEL_MAKE = ""
 
-PR ="r4"
+PR = "r5"
 
-EXTRA_OEMAKE += "'STRIP = '"
+EXTRA_OEMAKE += "'STRIP = ' PREFIX=${prefix} LIBDIR=${libdir}"
 export SHARED=yes
-
-do_configure () {
-	(cd lib && ./configure ${datadir} ${PV} ${TARGET_OS} 2.4.21 ${TARGET_ARCH})
-}
-
 export DESTDIR = "${D}"
 export PREFIX = "${prefix}"
 export SBINDIR = "${sbindir}"
@@ -28,35 +23,30 @@ export SHAREDIR = "${datadir}"
 export MANDIR = "${mandir}"
 export IDSDIR = "${datadir}"
 
-do_install () {
-	oe_runmake install
+do_configure () {
+	export ZLIB=yes
+	(cd lib && ./configure ${datadir} ${PV} ${TARGET_OS} 2.4.21 ${TARGET_ARCH})
 }
 
-do_install_append () {
-	install -d ${D}/${datadir}
-	install -m 6440 ${WORKDIR}/${PN}-${PV}/pci.ids ${D}/${datadir}
-
-	# The makefile does not install the development files:
-	# libpci.so pci.h header.h config.h types.h
-	install -d ${D}/${libdir}
-	install -d ${D}/${includedir}/pci
+do_install () {
+	oe_runmake install install-lib
 
+	# "make install" misses the debug file for the library
 	oe_libinstall -so -C lib libpci ${D}/${libdir}
-	install -m 0644 ${S}/lib/pci.h ${D}/${includedir}/pci/
-	install -m 0644 ${S}/lib/header.h ${D}/${includedir}/pci/
-	install -m 0644 ${S}/lib/config.h ${D}/${includedir}/pci/
-	install -m 0644 ${S}/lib/types.h ${D}/${includedir}/pci/
+
+	# Some older versions of hal may need the uncompressed version.
+	# We install it in a separate package, pciutils-ids-uncompressed.
+	install -m 0644 ${S}/pci.ids ${D}/${datadir}
 }
 
 do_stage () {
+	oe_runmake install-lib DESTDIR=${STAGING_DIR_HOST}
+
+	# "make install-lib" misses the symlink libpci.so.3
 	oe_libinstall -so -C lib libpci ${STAGING_LIBDIR}
-	install -m 0755 -d ${STAGING_INCDIR}/pci
-	install -m 0644 ${S}/lib/pci.h ${STAGING_INCDIR}/pci/
-	install -m 0644 ${S}/lib/header.h ${STAGING_INCDIR}/pci/
-	install -m 0644 ${S}/lib/config.h ${STAGING_INCDIR}/pci/
-	install -m 0644 ${S}/lib/types.h ${STAGING_INCDIR}/pci/
 }
 
 
-PACKAGES =+ "pciutils-ids"
-FILES_pciutils-ids="${datadir}/pci.ids"
+PACKAGES =+ "${PN}-ids ${PN}-ids-uncompressed"
+FILES_${PN}-ids = "${datadir}/pci.ids.gz"
+FILES_${PN}-ids-uncompressed = "${datadir}/pci.ids"
-- 
1.6.3



