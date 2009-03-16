Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjMJG-00085J-KO
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 00:33:33 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGM000P0HEM17V2@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	16 Mar 2009 18:32:47 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 28F486B83CC; Mon,
	16 Mar 2009 19:32:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2009 19:32:43 -0400
Message-id: <1237246365-32076-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1237246365-32076-1-git-send-email-denis@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50, FM_FAKE_HELO_VERIZON,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] recipes: fix hardcoded instances of packages/
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
X-List-Received-Date: Mon, 16 Mar 2009 23:33:33 -0000

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/kexecboot/linux-kexecboot.inc |    2 +-
 recipes/libffi/libffi_2.0+gcc4.3.2.bb |    2 +-
 recipes/libffi/libffi_3.0.8.bb        |    2 +-
 recipes/mamona/gcc-noemu_4.1.1.bb     |    2 +-
 recipes/mamona/gcc-noemu_4.1.2.bb     |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/kexecboot/linux-kexecboot.inc b/recipes/kexecboot/linux-kexecboot.inc
index 2056758..31b6377 100644
--- a/recipes/kexecboot/linux-kexecboot.inc
+++ b/recipes/kexecboot/linux-kexecboot.inc
@@ -6,7 +6,7 @@ SRC_URI = "file://defconfig"
 LOGO_SIZE = '${@base_conditional("GUI_MACHINE_CLASS", "bigscreen", "vga", "qvga", d)}'
 SRC_URI += "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
 
-require packages/linux/linux.inc
+require recipes/linux/linux.inc
 
 DONT_CHECK_KERNELSIZE = ""
 INITRAMFS_IMAGE = "initramfs-kexecboot-image"
diff --git a/recipes/libffi/libffi_2.0+gcc4.3.2.bb b/recipes/libffi/libffi_2.0+gcc4.3.2.bb
index 5a2ae1a..be98050 100644
--- a/recipes/libffi/libffi_2.0+gcc4.3.2.bb
+++ b/recipes/libffi/libffi_2.0+gcc4.3.2.bb
@@ -1,4 +1,4 @@
-require packages/gcc/gcc-common.inc
+require recipes/gcc/gcc-common.inc
 SECTION = "libs"
 DESCRIPTION = "Foreign Function Interface library"
 LICENSE = "libffi"
diff --git a/recipes/libffi/libffi_3.0.8.bb b/recipes/libffi/libffi_3.0.8.bb
index 0bad49b..cef09ae 100644
--- a/recipes/libffi/libffi_3.0.8.bb
+++ b/recipes/libffi/libffi_3.0.8.bb
@@ -1,4 +1,4 @@
-require packages/gcc/gcc-common.inc
+require recipes/gcc/gcc-common.inc
 
 SECTION = "libs"
 DESCRIPTION = "Foreign Function Interface library"
diff --git a/recipes/mamona/gcc-noemu_4.1.1.bb b/recipes/mamona/gcc-noemu_4.1.1.bb
index 1582598..56ba167 100644
--- a/recipes/mamona/gcc-noemu_4.1.1.bb
+++ b/recipes/mamona/gcc-noemu_4.1.1.bb
@@ -57,7 +57,7 @@ JAVA_arm = ""
 JAVA = ""
 
 LANGUAGES = "c,c++${FORTRAN}${JAVA}"
-require packages/gcc/gcc-${PV}.inc
+require recipes/gcc/gcc-${PV}.inc
 
 EXTRA_OECONF += "--disable-libspp --with-slibdir=\"/lib\""
 
diff --git a/recipes/mamona/gcc-noemu_4.1.2.bb b/recipes/mamona/gcc-noemu_4.1.2.bb
index 9015e10..44b1d44 100644
--- a/recipes/mamona/gcc-noemu_4.1.2.bb
+++ b/recipes/mamona/gcc-noemu_4.1.2.bb
@@ -77,7 +77,7 @@ JAVA_arm = ""
 
 
 LANGUAGES = "c,c++${FORTRAN}${JAVA}"
-require packages/gcc/gcc-${PV}.inc
+require recipes/gcc/gcc-${PV}.inc
 
 
 EXTRA_OECONF += " --disable-libssp --with-slibdir=\"/lib\" "
-- 
1.6.0.6



