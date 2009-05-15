Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M4wjW-0008Ui-Rb
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 14:41:50 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 507086846B;
	Fri, 15 May 2009 16:34:42 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2009 16:34:08 +0400
Message-Id: <1242390849-28989-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 1/2] glibc-package: fix kernel version passed to qemu
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
X-List-Received-Date: Fri, 15 May 2009 12:41:51 -0000

Binary locale generation fails with

FATAL: kernel too old

if glibc is configured for kernels newer then 2.6.16.

Fix qemu "-r" parameter to match OLDEST_KERNEL.
---
 recipes/glibc/glibc-package.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

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
1.6.3


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



