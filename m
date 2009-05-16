Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M5OMc-0008S7-5F
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 20:12:02 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M5OFj-000Ipu-DD; Sat, 16 May 2009 22:04:55 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2009 22:04:38 +0400
Message-Id: <1242497080-28506-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <20090515183512.GZ7973@smtp.west.cox.net>
References: <20090515183512.GZ7973@smtp.west.cox.net>
Subject: [PATCH 1/3] (e)glibc-package: fix kernel version passed to qemu
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
X-List-Received-Date: Sat, 16 May 2009 18:12:02 -0000

Binary locale generation fails with

FATAL: kernel too old

if (e)glibc is configured for kernels newer than 2.6.16. This comes from
kernel version check in sysdeps/unix/sysv/linux/dl-osinfo.h. We configure
(e)glibc with "--enable-kernel=${OLDEST_KERNEL}", so to pass this check we
need kernel version reported from QEMU to (e)glibc be $OLDEST_KERNEL or higher.

Fix qemu "-r" parameter to match OLDEST_KERNEL.
---
 recipes/eglibc/eglibc-package.bbclass |    6 +++++-
 recipes/glibc/glibc-package.bbclass   |    6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 7fcb558..01f698a 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -287,7 +287,11 @@ python package_do_split_gconvs () {
 
 	def output_locale_binary(name, locale, encoding):
 		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
-		qemu = "qemu-%s -r 2.6.16" % target_arch
+		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
+		if kernel_ver is None:
+			qemu = "qemu-%s  -s 1048576" % target_arch
+		else:
+			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
 		pkgname = 'locale-base-' + legitimize_package_name(name)
 		m = re.match("(.*)\.(.*)", name)
 		if m:
diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index 89fbd1c..8db8c5c 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -252,7 +252,11 @@ python package_do_split_gconvs () {
 		if target_arch in ("i486", "i586", "i686"):
 		   target_arch = "i386"
 
-		qemu = "qemu-%s  -s 1048576 -r 2.6.16" % target_arch
+		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
+		if kernel_ver is None:
+			qemu = "qemu-%s  -s 1048576" % target_arch
+		else:
+			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
 		pkgname = 'locale-base-' + legitimize_package_name(name)
 		m = re.match("(.*)\.(.*)", name)
 		if m:
-- 
1.6.3.1



