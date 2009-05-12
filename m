Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M3iDs-0003nl-Pi
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 05:00:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C30A94AA67F;
	Mon, 11 May 2009 22:53:29 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05829-01; Mon, 11 May 2009 22:53:29 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 63B824AA66B; Mon, 11 May 2009 22:53:28 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 104864A81A5;
	Mon, 11 May 2009 22:53:25 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 04E9B4194E; Mon, 11 May 2009 22:53:24 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 22:53:24 -0400
Message-Id: <1242096804-27041-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1242096804-27041-1-git-send-email-msmith@cbnco.com>
References: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
	<1242096804-27041-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] grub: Split the grub-install script and friends into a separate package.
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
X-List-Received-Date: Tue, 12 May 2009 03:00:05 -0000

In the main grub package, menu.lst and stage1/2 files will now be
installed in /boot/grub.

stage2_eltorito is split into its own package for bootable ISOs.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/grub/grub_0.97.bb |   36 +++++++++++++++++++++---------------
 1 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/recipes/grub/grub_0.97.bb b/recipes/grub/grub_0.97.bb
index ef37af1..40adff9 100644
--- a/recipes/grub/grub_0.97.bb
+++ b/recipes/grub/grub_0.97.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "GRand Unified Bootloader"
 HOMEPAGE = "http://www.gnu.org/software/grub"
 SECTION = "bootloaders"
 PRIORITY = "optional"
-RDEPENDS = "diffutils"
-PR = "r4"
+RDEPENDS_${PN}-install = "diffutils"
+PR = "r5"
 
 SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://automake-1.10.patch;patch=1 \
@@ -11,20 +11,26 @@ SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
 
 inherit autotools
 
-python __anonymous () {
-    import re
-    host = bb.data.getVar('HOST_SYS', d, 1)
-    if not re.match('i.86.*-linux', host):
-        raise bb.parse.SkipPackage("incompatible with host %s" % host)
-}
-
 do_install_append() {
-        install -d ${D}/boot/
-	ln -sf ../usr/lib/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
+        install -m 0644 -D ${WORKDIR}/menu.lst ${D}/boot/grub/menu.lst
 
-	# TODO: better use grub-set-default script here?
-	install -m 0644  ${WORKDIR}/menu.lst ${D}/boot/grub
+        # Copy stage1/1_5/2 files to /boot/grub
+        GRUB_TARGET_ARCH=$(echo ${TARGET_ARCH} | sed -e 's/.86/386/')
+        install -m 0644 \
+                ${D}/${libdir}/grub/${GRUB_TARGET_ARCH}${TARGET_VENDOR}/* \
+                ${D}/boot/grub/
 }
 
-FILES_${PN}-doc = "${datadir}"
-FILES_${PN} = "/boot /usr"
+PACKAGES =+ "${PN}-install ${PN}-eltorito"
+
+FILES_${PN}-install = " \
+        ${sbindir}/grub-install \
+        ${sbindir}/grub-terminfo \
+        ${sbindir}/grub-md5-crypt \
+        ${bindir}/mbchk \
+        ${libdir}/grub \
+"
+FILES_${PN}-eltorito = "/boot/grub/stage2_eltorito"
+FILES_${PN} += "/boot"
+
+COMPATIBLE_HOST = "i.86.*-linux"
-- 
1.5.6.5



