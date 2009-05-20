Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M6hqv-0004ED-QI
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 11:12:49 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 747F668498;
	Wed, 20 May 2009 13:04:45 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 13:04:38 +0400
Message-Id: <1242810278-22217-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1242810278-22217-1-git-send-email-khimov@altell.ru>
References: <1242810278-22217-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 2/2] (e)glibc-package: enable binary locale generation for powerpc
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
X-List-Received-Date: Wed, 20 May 2009 09:13:05 -0000

It works there, so add to whitelist.
---
 recipes/eglibc/eglibc-package.bbclass |    4 +++-
 recipes/glibc/glibc-package.bbclass   |    6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 22ff52b..f2acc96 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -24,7 +24,7 @@ python __anonymous () {
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
 
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
 
 PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
@@ -289,6 +289,8 @@ python package_do_split_gconvs () {
 		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
 		if target_arch in ("i486", "i586", "i686"):
 			target_arch = "i386"
+		elif target_arch == "powerpc":
+			target_arch = "ppc"
 		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
 		if kernel_ver is None:
 			qemu = "qemu-%s  -s 1048576" % target_arch
diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index ac7e0f3..78738c2 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -24,7 +24,7 @@ python __anonymous () {
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
 
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
 
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
@@ -250,7 +250,9 @@ python package_do_split_gconvs () {
 	def output_locale_binary(name, locale, encoding):
 		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
 		if target_arch in ("i486", "i586", "i686"):
-		   target_arch = "i386"
+			target_arch = "i386"
+		elif target_arch == "powerpc":
+			target_arch = "ppc"
 
 		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
 		if kernel_ver is None:
-- 
1.6.3.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



