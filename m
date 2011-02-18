Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PqR5G-0004Z0-HL
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 15:13:22 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 0056A491283
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 15:12:10 +0100 (CET)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 18 Feb 2011 15:12:11 +0100
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 5FA867208C; Fri, 18 Feb 2011 15:12:10 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 15:12:02 +0100
Message-Id: <1298038322-20481-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
X-OriginalArrivalTime: 18 Feb 2011 14:12:11.0110 (UTC)
	FILETIME=[D58CF860:01CBCF75]
Subject: [PATCH v2] u-boot-2009.03: use AMD fixups for AMIC too
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
X-List-Received-Date: Fri, 18 Feb 2011 14:13:22 -0000

From: Mario Schuknecht <m.schuknecht@dresearch.de>

* AMIC flashes are AMD clones and need the same fixups.

Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch |   11 +++++++++++
 recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch |    3 ++-
 recipes/u-boot/u-boot_2009.03.bb                   |    7 +++++--
 3 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch

diff --git a/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch b/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
new file mode 100644
index 0000000..9d8c7ab
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.03/cfi-amic-fixup.patch
@@ -0,0 +1,11 @@
+diff -Nurd u-boot-2009.03.orig//drivers/mtd/cfi_flash.c u-boot-2009.03/drivers/mtd/cfi_flash.c
+--- u-boot-2009.03.orig//drivers/mtd/cfi_flash.c	2011-02-18 14:11:24.870432001 +0100
++++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2011-02-18 14:11:45.440432001 +0100
+@@ -1883,6 +1883,7 @@
+ 		/* Do manufacturer-specific fixups */
+ 		switch (info->manufacturer_id) {
+ 		case 0x0001:
++		case 0x0037: // AMIC
+ 			flash_fixup_amd(info, &qry);
+ 			break;
+ 		case 0x001f:
diff --git a/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch b/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
index 5b91d28..20a47da 100644
--- a/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
+++ b/recipes/u-boot/u-boot-2009.03/hipox/00-hipox.patch
@@ -6190,10 +6190,11 @@ diff -Nurd u-boot-2009.03.orig/cpu/arm926ejs/start.S u-boot-2009.03/cpu/arm926ej
 diff -Nurd u-boot-2009.03.orig/drivers/mtd/cfi_flash.c u-boot-2009.03/drivers/mtd/cfi_flash.c
 --- u-boot-2009.03.orig/drivers/mtd/cfi_flash.c	2009-04-15 11:05:24.000000000 +0200
 +++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2009-04-15 11:08:18.000000000 +0200
-@@ -1883,6 +1883,7 @@
+@@ -1883,7 +1883,8 @@
  		/* Do manufacturer-specific fixups */
  		switch (info->manufacturer_id) {
  		case 0x0001:
+ 		case 0x0037: // AMIC
 +		case 0x00da: // Winbond
  			flash_fixup_amd(info, &qry);
  			break;
diff --git a/recipes/u-boot/u-boot_2009.03.bb b/recipes/u-boot/u-boot_2009.03.bb
index 2cbded9..4b822f1 100644
--- a/recipes/u-boot/u-boot_2009.03.bb
+++ b/recipes/u-boot/u-boot_2009.03.bb
@@ -6,9 +6,12 @@ DEFAULT_PREFERENCE_hipox = "1"
 
 DEPENDS_append_hipox = " oxnas-boot-tools oxnas-boot-tools-native "
 
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
+	file://cfi-amic-fixup.patch \
+"
 
-SRC_URI_append_hipox = "file://00-hipox.patch \
+SRC_URI_append_hipox = " \
+	file://00-hipox.patch \
 	file://01-hipox-fix-gmac-reset.patch \
 	file://02-hipox-enable-mmu.patch \
 	file://03-hipox-direct-switch.patch \
-- 
1.7.1



