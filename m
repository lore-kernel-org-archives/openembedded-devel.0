Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M4wjW-0008Uj-Rd
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 14:41:50 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 792F16846C;
	Fri, 15 May 2009 16:34:42 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2009 16:34:09 +0400
Message-Id: <1242390849-28989-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1242390849-28989-1-git-send-email-khimov@altell.ru>
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 2/2] glibc-package: set LD_LIBRARY_PATH on binary locale generation
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

Locale generation might fail with SIGSEGV if host libs get messed with target
libs, that might easily happen via /etc/ld.so.cache. So explicitly specify
LD_LIBRARY_PATH to prevent that.
---
 recipes/glibc/glibc-package.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
1.6.3


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



