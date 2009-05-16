Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M5OMc-0008S8-6M
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 20:12:02 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M5OFj-000Ipu-R4; Sat, 16 May 2009 22:04:56 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2009 22:04:39 +0400
Message-Id: <1242497080-28506-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1242497080-28506-1-git-send-email-khimov@altell.ru>
References: <20090515183512.GZ7973@smtp.west.cox.net>
	<1242497080-28506-1-git-send-email-khimov@altell.ru>
Subject: [PATCH 2/3] (e)glibc-package: set LD_LIBRARY_PATH on binary locale generation
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

Locale generation might fail with SIGSEGV if host libs get messed with target
libs, that might easily happen via /etc/ld.so.cache when building x86(_64)
target on x86(_64) host. So explicitly specify LD_LIBRARY_PATH to prevent that.
---
 recipes/eglibc/eglibc-package.bbclass |    3 ++-
 recipes/glibc/glibc-package.bbclass   |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 01f698a..241499f 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -309,11 +309,12 @@ python package_do_split_gconvs () {
 		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
 
 		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
+		ldlibdir = "%s/lib" % treedir
 		path = bb.data.getVar("PATH", d, 1)
 		i18npath = base_path_join(treedir, datadir, "i18n")
 
 		localedef_opts = "--force --old-style --no-archive --prefix=%s --inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir, locale, encoding, name)
-		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, treedir, localedef_opts)
+		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, treedir, localedef_opts)
 		bb.note("generating locale %s (%s)" % (locale, encoding))
 		if os.system(cmd):
 			raise bb.build.FuncFailed("localedef returned an error (command was %s)." % cmd)
diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index 8db8c5c..46f809e 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -273,6 +273,7 @@ python package_do_split_gconvs () {
 		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
 
 		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
+		ldlibdir = "%s/lib" % treedir
 		path = bb.data.getVar("PATH", d, 1)
 		i18npath = base_path_join(treedir, datadir, "i18n")
 
@@ -282,7 +283,7 @@ python package_do_split_gconvs () {
 		if not qemu_options:
 			qemu_options = bb.data.getVar('QEMU_OPTIONS', d, 1)
 		
-		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, qemu_options, treedir, localedef_opts)
+		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
 		bb.note("generating locale %s (%s)" % (locale, encoding))
 		if os.system(cmd):
 			raise bb.build.FuncFailed("localedef returned an error (command was %s)." % cmd)
-- 
1.6.3.1



