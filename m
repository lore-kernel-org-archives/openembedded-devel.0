Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MPVNY-0000x8-Ux
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 07:44:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 63CAE505C73;
	Sat, 11 Jul 2009 01:31:12 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16888-07; Sat, 11 Jul 2009 01:31:12 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id EBB3C505C79; Sat, 11 Jul 2009 01:31:11 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id CFA505044C6;
	Sat, 11 Jul 2009 01:31:10 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id C74C2A26471; Sat, 11 Jul 2009 01:31:10 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jul 2009 01:31:06 -0400
Message-Id: <1247290267-16928-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/2] package classes: count dotfiles as non-empty
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
X-List-Received-Date: Sat, 11 Jul 2009 05:44:09 -0000

Allow a package to be built that contains only dotfiles or
dot directories under '/'.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 classes/package.bbclass     |    2 +-
 classes/package_deb.bbclass |    2 +-
 classes/package_ipk.bbclass |    2 +-
 classes/package_tar.bbclass |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 3360dcb..f6bd7c5 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -539,7 +539,7 @@ python emit_pkgdata() {
 			allow_empty = bb.data.getVar('ALLOW_EMPTY', d, 1)
 		root = "%s/install/%s" % (workdir, pkg)
 		os.chdir(root)
-		g = glob('*')
+		g = glob('*') + glob('.[!.]*')
 		if g or allow_empty == "1":
 			packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
 			file(packagedfile, 'w').close()
diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index 5127d32..e5339a9 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -130,7 +130,7 @@ python do_package_deb () {
 
         os.chdir(root)
         from glob import glob
-        g = glob('*')
+        g = glob('*') + glob('.[!.]*')
         try:
             del g[g.index('DEBIAN')]
             del g[g.index('./DEBIAN')]
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 1f1b5c9..e3a7522 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -186,7 +186,7 @@ python do_package_ipk () {
 		bb.mkdirhier(pkgoutdir)
 		os.chdir(root)
 		from glob import glob
-		g = glob('*')
+		g = glob('*') + glob('.[!.]*')
 		try:
 			del g[g.index('CONTROL')]
 			del g[g.index('./CONTROL')]
diff --git a/classes/package_tar.bbclass b/classes/package_tar.bbclass
index 76f48ca..cb70a5f 100644
--- a/classes/package_tar.bbclass
+++ b/classes/package_tar.bbclass
@@ -84,7 +84,7 @@ python do_package_tar () {
 		tarfn = bb.data.getVar('PKGFN', localdata, 1)
 		os.chdir(root)
 		from glob import glob
-		if not glob('*'):
+		if not glob('*') + glob('.[!.]*'):
 			bb.note("Not creating empty archive for %s-%s" % (pkg, bb.data.expand('${PV}-${PR}${DISTRO_PR}', d, True)))
 			continue
 		ret = os.system("tar -czf %s %s" % (tarfn, '.'))
-- 
1.6.3



