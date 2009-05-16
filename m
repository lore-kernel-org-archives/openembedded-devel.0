Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M5OMc-0008S9-Aa
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 20:12:02 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M5OFk-000Ipu-8P; Sat, 16 May 2009 22:04:56 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2009 22:04:40 +0400
Message-Id: <1242497080-28506-3-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1242497080-28506-2-git-send-email-khimov@altell.ru>
References: <20090515183512.GZ7973@smtp.west.cox.net>
	<1242497080-28506-1-git-send-email-khimov@altell.ru>
	<1242497080-28506-2-git-send-email-khimov@altell.ru>
Subject: [PATCH 3/3] (e)glibc-package: enable binary locale generation on x86 and x86_64
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

---
 recipes/eglibc/eglibc-package.bbclass |    4 +++-
 recipes/glibc/glibc-package.bbclass   |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 241499f..22ff52b 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -24,7 +24,7 @@ python __anonymous () {
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
 
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.*"
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
 
 PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
@@ -287,6 +287,8 @@ python package_do_split_gconvs () {
 
 	def output_locale_binary(name, locale, encoding):
 		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
+		if target_arch in ("i486", "i586", "i686"):
+			target_arch = "i386"
 		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
 		if kernel_ver is None:
 			qemu = "qemu-%s  -s 1048576" % target_arch
diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index 46f809e..ac7e0f3 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -24,7 +24,7 @@ python __anonymous () {
 ENABLE_BINARY_LOCALE_GENERATION ?= "0"
 
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.*"
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
 
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
-- 
1.6.3.1



