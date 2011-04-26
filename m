Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QEfop-0005Fg-Dq
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 12:48:43 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3QAjxwe031291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 Apr 2011 12:45:59 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 26 Apr 2011 12:45:59 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 12:45:57 +0200
Message-Id: <1303814757-9940-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4.4
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] gitpkgv.bbclass: cache GITPKGV result
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
X-List-Received-Date: Tue, 26 Apr 2011 10:48:43 -0000

gitpkgv runs the 'git rev-list | wc -l' several times when processing a
package using GITPKGV.  This takes ages for packages like the linux
kernel which has a) a large repository and b) lots of subpackages.

This patch caches the result of 'git rev-list' into the sources cache
directory and uses it on the next run.  Because collisions of the sha1
hash are very unlikely, the git revision is used directly as the key.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/gitpkgv.bbclass |   29 +++++++++++++++++++++++------
 1 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/classes/gitpkgv.bbclass b/classes/gitpkgv.bbclass
index bedceb9..76c660b 100644
--- a/classes/gitpkgv.bbclass
+++ b/classes/gitpkgv.bbclass
@@ -50,8 +50,11 @@ def gitpkgv_drop_tag_prefix(version):
 def get_git_pkgv(d, use_tags):
 	import os
 	import bb
+	from pipes import quote
 
 	urls = bb.data.getVar('SRC_URI', d, 1).split()
+	cachedir = bb.data.expand("${DL_DIR}/gitpkgv", d)
+	bb.mkdirhier(cachedir)
 
 	for url in urls:
 		(type, host, path, user, pswd, parm) = bb.decodeurl(bb.data.expand(url, d))
@@ -63,22 +66,36 @@ def get_git_pkgv(d, use_tags):
 				return None
 
 			rev = bb.fetch.get_srcrev(d).split('+')[1]
+			rev_file = os.path.join(cachedir, rev)
 
-			cwd = os.getcwd()
-			os.chdir(repodir)
+			vars = { 'repodir' : quote(repodir),
+				 'rev' : quote(rev),
+			       }
 
-			commits = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+			if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
+				commits = bb.fetch.runfetchcmd(
+				       "cd %(repodir)s && "
+				       "git rev-list %(rev)s -- 2> /dev/null | wc -l" % vars,
+				       d, quiet=True).strip()
+
+				if commits != "0":
+					oe.path.remove(rev_file, recurse=False)
+					open(rev_file, "w").write("%d\n" % commits)
+			else:
+				commits = open(rev_file, "r").readline(128).strip()
 
 			if use_tags:
 				try:
-					ver = gitpkgv_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip())
+					tmp = bb.fetch.runfetchcmd(
+					"cd %(repodir)s && "
+					"git describe %(rev)s 2>/dev/null" % vars,
+					d, quiet=True).strip()
+					ver = gitpkgv_drop_tag_prefix(tmp)
 				except Exception:
 					ver = "0.0-%s-g%s" % (commits, rev[:7])
 			else:
 				ver = "%s+%s" % (commits, rev[:7])
 
-			os.chdir(cwd)
-
 			return ver
 
 	return "0+0"
-- 
1.7.4.4



