Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58T-00039v-Mj
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:25 +0200
Received: (qmail 30451 invoked by uid 813007); 1 Jul 2009 18:54:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:16 +0200
Message-Id: <1246474461-16671-10-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 015/125] (e)glibc-package: enable binary locale generation for powerpc
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:26 -0000

From: Roman Khimov <khimov@altell.ru>

It works there, so add to whitelist.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
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





