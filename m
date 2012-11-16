Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TZQbu-0000wB-Id
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 19:25:50 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAGIBjXH025269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Nov 2012 19:11:46 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TZQOH-0008Ex-1J; Fri, 16 Nov 2012 19:11:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Nov 2012 19:11:31 +0100
Message-Id: <1353089491-31640-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353082752-8187-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1353082752-8187-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.5
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2] gitpkgv.bbclass: cache GITPKGV result
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
X-List-Received-Date: Fri, 16 Nov 2012 18:25:50 -0000

gitpkgv runs the 'git rev-list | wc -l' several times when processing a
package using GITPKGV.  This takes ages for packages like the linux
kernel which has a) a large repository and b) lots of subpackages.

This patch caches the result of 'git rev-list' and uses it on the next
run.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta-oe/classes/gitpkgv.bbclass | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 165ba1e..7bdc538 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -50,6 +50,7 @@ def gitpkgv_drop_tag_prefix(version):
 def get_git_pkgv(d, use_tags):
     import os
     import bb
+    from pipes import quote
 
     src_uri = d.getVar('SRC_URI', 1).split()
     fetcher = bb.fetch2.Fetch(src_uri, d)
@@ -71,22 +72,39 @@ def get_git_pkgv(d, use_tags):
 
                 found = True
 
-                cwd = os.getcwd()
-                os.chdir(url.localpath)
+                vars = { 'repodir' : quote(url.localpath),
+                         'rev' : quote(rev) }
 
-                commits = bb.fetch2.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+                rev = bb.fetch2.get_srcrev(d).split('+')[1]
+                rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + rev)
+
+                if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
+                    commits = bb.fetch2.runfetchcmd(
+                        "cd %(repodir)s && "
+                        "git rev-list %(rev)s -- 2> /dev/null "
+                        "| wc -l" % vars,
+                        d, quiet=True).strip().lstrip('0')
+
+                    if commits != "":
+                        oe.path.remove(rev_file, recurse=False)
+                        open(rev_file, "w").write("%d\n" % int(commits))
+                    else:
+                        commits = "0"
+                else:
+                    commits = open(rev_file, "r").readline(128).strip()
 
                 if use_tags:
                     try:
-                        output = bb.fetch2.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip()
+                        output = bb.fetch2.runfetchcmd(
+                            "cd %(repodir)s && "
+                            "git describe %(rev)s 2>/dev/null" % vars,
+                            d, quiet=True).strip()
                         ver = gitpkgv_drop_tag_prefix(output)
                     except Exception:
                         ver = "0.0-%s-g%s" % (commits, rev[:7])
                 else:
                     ver = "%s+%s" % (commits, rev[:7])
 
-                os.chdir(cwd)
-
                 format = format.replace(name, ver)
 
     if found:
-- 
1.7.11.7



