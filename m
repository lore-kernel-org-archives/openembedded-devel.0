Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M28PO-0002ZI-Sn
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 20:33:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 880AF4A7214;
	Thu,  7 May 2009 14:27:17 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13901-03; Thu,  7 May 2009 14:27:17 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 651CE4A7B21; Thu,  7 May 2009 14:27:17 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id D5BAD49B4AA;
	Thu,  7 May 2009 14:27:15 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id C687441733; Thu,  7 May 2009 14:27:15 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 May 2009 14:27:15 -0400
Message-Id: <1241720835-17998-3-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1241720835-17998-2-git-send-email-msmith@cbnco.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 3/3] grub: split menu.lst into a separate package, grub-config.
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
X-List-Received-Date: Thu, 07 May 2009 18:33:32 -0000

This makes it easier for overlays to override the configuration.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/grub/files/menu.lst     |    6 ++++++
 recipes/grub/grub-0.97/menu.lst |    6 ------
 recipes/grub/grub-config_1.0.bb |   13 +++++++++++++
 recipes/grub/grub_0.97.bb       |   12 +++++-------
 4 files changed, 24 insertions(+), 13 deletions(-)
 create mode 100644 recipes/grub/files/menu.lst
 delete mode 100644 recipes/grub/grub-0.97/menu.lst
 create mode 100644 recipes/grub/grub-config_1.0.bb

diff --git a/recipes/grub/files/menu.lst b/recipes/grub/files/menu.lst
new file mode 100644
index 0000000..510e8f8
--- /dev/null
+++ b/recipes/grub/files/menu.lst
@@ -0,0 +1,6 @@
+# menu.lst
+default 0
+timeout 5
+title   OpenEmbedded Linux (hda1)
+root    (hd0,0)
+kernel  /boot/bzImage root=/dev/hda1 ro 
diff --git a/recipes/grub/grub-0.97/menu.lst b/recipes/grub/grub-0.97/menu.lst
deleted file mode 100644
index 510e8f8..0000000
--- a/recipes/grub/grub-0.97/menu.lst
+++ /dev/null
@@ -1,6 +0,0 @@
-# menu.lst
-default 0
-timeout 5
-title   OpenEmbedded Linux (hda1)
-root    (hd0,0)
-kernel  /boot/bzImage root=/dev/hda1 ro 
diff --git a/recipes/grub/grub-config_1.0.bb b/recipes/grub/grub-config_1.0.bb
new file mode 100644
index 0000000..f6e82a7
--- /dev/null
+++ b/recipes/grub/grub-config_1.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Configuration file for grub"
+SECTION = "bootloaders"
+PRIORITY = "optional"
+PR = "r0"
+
+SRC_URI = "file://menu.lst"
+
+do_install() {
+	install -D -m 0644 ${WORKDIR}/menu.lst \
+		${D}${libdir}/grub/i386${TARGET_VENDOR}/menu.lst
+}
+
+FILES_${PN} += "${libdir}"
diff --git a/recipes/grub/grub_0.97.bb b/recipes/grub/grub_0.97.bb
index e1162ef..8822b7e 100644
--- a/recipes/grub/grub_0.97.bb
+++ b/recipes/grub/grub_0.97.bb
@@ -3,11 +3,13 @@ HOMEPAGE = "http://www.gnu.org/software/grub"
 SECTION = "bootloaders"
 PRIORITY = "optional"
 RDEPENDS = "diffutils"
-PR = "r4"
+PR = "r5"
+
+# menu.lst is shipped in a separate package that overlays can override.
+RRECOMMENDS = "grub-config"
 
 SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-           file://automake-1.10.patch;patch=1 \
-           file://menu.lst"
+           file://automake-1.10.patch;patch=1"
 
 inherit autotools
 
@@ -21,10 +23,6 @@ python __anonymous () {
 do_install_append() {
         install -d ${D}/boot/
 	ln -sf ..${libdir}/grub/i386${TARGET_VENDOR}/ ${D}/boot/grub
-
-	# TODO: better use grub-set-default script here?
-	install -m 0644 ${WORKDIR}/menu.lst \
-		${D}${libdir}/grub/i386${TARGET_VENDOR}/
 }
 
 FILES_${PN}-doc = "${datadir}"
-- 
1.5.6.5



