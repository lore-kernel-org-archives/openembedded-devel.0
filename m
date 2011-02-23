Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsETE-0000sE-HW
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:33 +0100
Received: by gwaa20 with SMTP id a20so1107697gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=HJQ0De1gIjh9NzlZrgbg3zM0YwLZ+2bNby1piars68c=;
	b=WeBXwNCGwgmr057G8eTV9QzKw9N2flouPbJjkmmT7ncvUBs8gRHa+LncQh6r/m/SW4
	f0ajW0NXiivI3dNwHmzDkms9HcSQOJYlZ2bwBBjZLHh3/QU3kFDgYtrL08SwLMhguL/l
	M+i4yLlzTMoBSSCZarBwkHAboFvCGzTr7Wz78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Xc0CAheYpFjBsLFBhFdNJcG24XB+Q19OkAgKhsogDasJouN3ELs7fe5odA/XyJYUoc
	GAoPKr9Ehq8QtkHSW0ZrSexYr7cbvBSgjS58w9eHoJ3EdTHj+iCy3bGXsgX8WXakBnHm
	Kdb5cpsaj8ZFk53C+Bh2Ny2b2/ZfNc8jSAXag=
Received: by 10.236.195.6 with SMTP id o6mr3038574yhn.33.1298466487059;
	Wed, 23 Feb 2011 05:08:07 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:06 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:19 +0000
Message-Id: <1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/14] syslinux: add isolinux and chain packages
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:33 -0000

This syncs the package recipe with the O.S. Systems tree adding more
packages and fixing GNU_HASH issues.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/syslinux/syslinux_3.82.bb |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/recipes/syslinux/syslinux_3.82.bb b/recipes/syslinux/syslinux_3.82.bb
index f899d9f..fcb066d 100644
--- a/recipes/syslinux/syslinux_3.82.bb
+++ b/recipes/syslinux/syslinux_3.82.bb
@@ -1,5 +1,5 @@
 # syslinux OE build file
-# Copyright (C) 2009, O.S. Systems Software Ltda.  All Rights Reserved
+# Copyright (C) 2009, 2011, O.S. Systems Software Ltda.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 DESCRIPTION = "A multi-purpose linux bootloader"
@@ -7,7 +7,7 @@ HOMEPAGE = "http://syslinux.zytor.com/"
 LICENSE = "GPL"
 DEPENDS = "nasm-native"
 RRECOMMENDS_${PN} = "mtools"
-PR = "r0"
+PR = "r3"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 "
 
@@ -27,17 +27,20 @@ do_configure() {
 do_compile() {
 	# Rebuild only the installer; keep precompiled bootloaders
 	# as per author's request (doc/distrib.txt)
-	oe_runmake CC="${CC}" installer
+	oe_runmake CC="${CC}" LDFLAGS="${LDFLAGS}" installer
 }
 
 do_install() {
 	oe_runmake install INSTALLROOT="${D}"
 }
 
-PACKAGES =+ "${PN}-extlinux ${PN}-mbr"
+PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux"
 FILES_${PN} = "${bindir}/syslinux"
 FILES_${PN}-extlinux = "${base_sbindir}/extlinux"
 FILES_${PN}-mbr = "${datadir}/${PN}/mbr.bin"
+FILES_${PN}-chain = "${datadir}/${PN}/chain.c32"
+FILES_${PN}-isolinux = "${datadir}/${PN}/isolinux.bin"
+FILES_${PN}-pxelinux = "${datadir}/${PN}/pxelinux.0"
 FILES_${PN}-dev += "${datadir}/${PN}/com32"
 
 SRC_URI[md5sum] = "c9f4e73e385c86b3a8faf9b615a04836"
-- 
1.7.2.3



