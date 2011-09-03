Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QzzM9-0002Wt-0M
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 01:10:33 +0200
Received: by ywa12 with SMTP id 12so2601127ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 16:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=RB2p1yy/q6J3NGqKCigHroFdveb8CMktD0UCSYofg5k=;
	b=wpHokBoeXhwzMCgtATvfZFvkgLP08snMkxfuHSy56NycyU5eeHWKL9dJIw+/lPPM55
	qLBW7f75rCIYPOYdLq5DcDyl5TSjr6sIa2llYCexHAbw817nlJ2zQsaC3w+hwx6lDn01
	58yMQoDXX/1MGlbfJfnS77EWSi6hDCQnTqXM8=
Received: by 10.150.206.9 with SMTP id d9mr1902617ybg.427.1315091131426;
	Sat, 03 Sep 2011 16:05:31 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f5sm553704ybd.13.2011.09.03.16.05.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 16:05:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Sep 2011 23:05:17 +0000
Message-Id: <4eda9a09d7beb54d290ba6f89e04150aae3b3857.1315091074.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1315091074.git.otavio@ossystems.com.br>
References: <cover.1315091074.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1315091074.git.otavio@ossystems.com.br>
References: <cover.1315091074.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] gitpkgv: add support SRCREV_FORMAT
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
X-List-Received-Date: Sat, 03 Sep 2011 23:10:33 -0000

In case of multiple GIT repositories are used, SRCREV_FORMAT will be
respected while filling it with the proper GIT information to each
revision.

This new feature needed heavy changes in the code so basically it was
a rewrote version that keeps compatibility with previous usage.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/gitpkgv.bbclass |   59 +++++++++++++++++++++++----------------
 1 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index bedceb9..238b0d2 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -48,37 +48,48 @@ def gitpkgv_drop_tag_prefix(version):
         return version
 
 def get_git_pkgv(d, use_tags):
-	import os
-	import bb
+    import os
+    import bb
 
-	urls = bb.data.getVar('SRC_URI', d, 1).split()
+    src_uri = bb.data.getVar('SRC_URI', d, 1).split()
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+    ud = fetcher.ud
 
-	for url in urls:
-		(type, host, path, user, pswd, parm) = bb.decodeurl(bb.data.expand(url, d))
-		if type in ['git']:
+    #
+    # If SRCREV_FORMAT is set respect it for tags
+    #
+    format = bb.data.getVar('SRCREV_FORMAT', d, True)
+    if not format:
+        format = 'default'
 
-			gitsrcname = '%s%s' % (host, path.replace('/', '.'))
-			repodir = os.path.join(bb.data.expand('${GITDIR}', d), gitsrcname)
-			if not os.path.exists(repodir):
-				return None
+    found = False
+    for url in ud.values():
+        if url.type == 'git':
+            for name, rev in url.revisions.items():
+                if not os.path.exists(url.localpath):
+                    return None
 
-			rev = bb.fetch.get_srcrev(d).split('+')[1]
+                found = True
 
-			cwd = os.getcwd()
-			os.chdir(repodir)
+                cwd = os.getcwd()
+                os.chdir(url.localpath)
 
-			commits = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+                commits = bb.fetch2.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
 
-			if use_tags:
-				try:
-					ver = gitpkgv_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip())
-				except Exception:
-					ver = "0.0-%s-g%s" % (commits, rev[:7])
-			else:
-				ver = "%s+%s" % (commits, rev[:7])
+                if use_tags:
+                    try:
+                        output = bb.fetch2.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip()
+                        ver = gitpkgv_drop_tag_prefix(output)
+                    except Exception:
+                        ver = "0.0-%s-g%s" % (commits, rev[:7])
+                else:
+                    ver = "%s+%s" % (commits, rev[:7])
 
-			os.chdir(cwd)
+                os.chdir(cwd)
 
-			return ver
+                format = format.replace(name, ver)
 
-	return "0+0"
+    if found:
+        return format
+
+    return '0+0'
-- 
1.7.2.5



