Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58S-00039a-LV
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:24 +0200
Received: (qmail 30343 invoked by uid 813007); 1 Jul 2009 18:54:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:12 +0200
Message-Id: <1246474461-16671-6-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 011/125] (e)glibc-package: set LD_LIBRARY_PATH on binary locale generation
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:24 -0000

From: Roman I Khimov <khimov@altell.ru>

Locale generation might fail with SIGSEGV if host libs get messed with target
libs, that might easily happen via /etc/ld.so.cache when building x86(_64)
target on x86(_64) host. So explicitly specify LD_LIBRARY_PATH to prevent that.

Acked-by: Tom Rini <trini@embeddedalley.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
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





