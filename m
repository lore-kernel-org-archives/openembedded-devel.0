Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MaYVh-0005BH-8N
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 19:18:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id BA6C95315EF;
	Mon, 10 Aug 2009 13:02:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13620-06; Mon, 10 Aug 2009 13:02:00 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 9B53752730D; Mon, 10 Aug 2009 13:02:00 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 94CA7531B8D;
	Mon, 10 Aug 2009 13:01:59 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 7AFBA416FF; Mon, 10 Aug 2009 13:01:59 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Aug 2009 13:01:56 -0400
Message-Id: <1249923716-19141-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] pciutils: fix generation of pci.ids.gz
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
X-List-Received-Date: Mon, 10 Aug 2009 17:18:13 -0000

Set ZLIB=yes to prevent auto-detection by the lib/configure script,
which only looks in /usr/include.

Also fix perms for pci.ids.gz.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/pciutils/pciutils_3.1.2.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/pciutils/pciutils_3.1.2.bb b/recipes/pciutils/pciutils_3.1.2.bb
index f23e6dd..914fdf7 100644
--- a/recipes/pciutils/pciutils_3.1.2.bb
+++ b/recipes/pciutils/pciutils_3.1.2.bb
@@ -12,12 +12,13 @@ SRC_URI_append_nylon = "file://gcc-3-compatibility.patch;patch=1 "
 
 PARALLEL_MAKE = ""
 
-PR ="r4"
+PR ="r5"
 
 EXTRA_OEMAKE += "'STRIP = '"
 export SHARED=yes
 
 do_configure () {
+	export ZLIB=yes
 	(cd lib && ./configure ${datadir} ${PV} ${TARGET_OS} 2.4.21 ${TARGET_ARCH})
 }
 
@@ -34,7 +35,7 @@ do_install () {
 
 do_install_append () {
 	install -d ${D}/${datadir}
-	install -m 6440 ${WORKDIR}/${PN}-${PV}/pci.ids ${D}/${datadir}
+	install -m 0644 ${WORKDIR}/${PN}-${PV}/pci.ids.gz ${D}/${datadir}
 
 	# The makefile does not install the development files:
 	# libpci.so pci.h header.h config.h types.h
@@ -59,4 +60,4 @@ do_stage () {
 
 
 PACKAGES =+ "pciutils-ids"
-FILES_pciutils-ids="${datadir}/pci.ids"
+FILES_pciutils-ids="${datadir}/pci.ids.gz"
-- 
1.6.3



