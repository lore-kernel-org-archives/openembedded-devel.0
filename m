Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1TSkOQ-0005MO-Qg
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 09:08:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so1907050eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2012 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=MXSeyWireRD7DTGMBB8DzhEZvjz8Ts2BqrYpsRSx5vA=;
	b=t0tm5rFNFL8CRE/rNm+dFQgib+a+REfTcinDbMMQWjGfL8iy03MdBuOw8/CjBHPH3p
	gj/GVjo+ihAAz6QilTDM2KMBlYBbUzSOUdbDi47LgCwHqgSE/cI7O6QTnrPGLUrGSh7x
	vl1NmN2A+EeQ48/LaLuR8e8xgqVYa9br/qhE85jnun3K8D6VaJcMLaf6O0SB9G+B/pkt
	E/eZz2mBO+vkIbqywsjL7YpGRaIEylSyWRcaHZ8GhYmYPEAIln5NPduzY8Wqr7M1fv+F
	piKlnsZ+xNxOZLXQL3bRb+4gCABbewXKcRfFBkO6L7SfsfTZFITV2bGoV6TgfPK7unre
	Hl/Q==
Received: by 10.14.199.134 with SMTP id x6mr58864509een.31.1351497285099;
	Mon, 29 Oct 2012 00:54:45 -0700 (PDT)
Received: from localhost.localdomain
	(83-64-248-68.inzersdorf.xdsl-line.inode.at. [83.64.248.68])
	by mx.google.com with ESMTPS id s1sm21199754eem.9.2012.10.29.00.54.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 00:54:44 -0700 (PDT)
Sender: Radek Dostal <dasty82@gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 08:53:35 +0100
Message-Id: <1351497216-13574-1-git-send-email-rd@radekdostal.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Radek Dostal <rd@radekdostal.com>
Subject: [meta-oe][PATCH] gitver: fix gitver to work with yocto 1.3
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
X-List-Received-Date: Mon, 29 Oct 2012 08:08:18 -0000

replace oe_run and oe.process with bb.process
gitver got broken by following oe-core commits:
  15ad62ab1be060d8a7cdc2d28167ea3af4cfd5d5
  d56062cbf92ef206bf06c767befacb66927a9a36

Signed-off-by: Radek Dostal <rd@radekdostal.com>
---
 meta-oe/classes/gitver.bbclass |   21 ++++++++-------------
 1 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
index ee8323d..e7b5155 100644
--- a/meta-oe/classes/gitver.bbclass
+++ b/meta-oe/classes/gitver.bbclass
@@ -16,28 +16,23 @@ GIT_TAGADJUST = "git_drop_tag_prefix(version)"
 GITVER = "${@get_git_pv('${S}', d, tagadjust=lambda version:${GIT_TAGADJUST})}"
 GITSHA = "${@get_git_hash('${S}', d)}"
 
-def get_git_hash(path, d):
-    return oe_run(d, ["git", "rev-parse", "--short", "HEAD"], cwd=path).rstrip()
+def gitrev_run(cmd, path):
+    (output, error) = bb.process.run(cmd, cwd=path)
+    return output.rstrip()
 
 def get_git_pv(path, d, tagadjust=None):
     import os
-    import oe.process
+    import bb.process
 
     gitdir = os.path.abspath(os.path.join(d.getVar("S", True), ".git"))
-    def git(cmd):
-        try:
-            return oe_run(d, ["git"] + cmd, cwd=gitdir).rstrip()
-        except oe.process.CmdError, exc:
-            bb.fatal(str(exc))
-
     try:
-        ver = oe_run(d, ["git", "describe", "--tags"], cwd=gitdir).rstrip()
+        ver = gitrev_run("git describe --tags", gitdir)
     except Exception, exc:
         bb.fatal(str(exc))
 
     if not ver:
         try:
-            ver = get_git_hash(gitdir, d)
+            ver = gitrev_run("git rev-parse --short HEAD", gitdir)
         except Exception, exc:
             bb.fatal(str(exc))
 
@@ -63,8 +58,8 @@ def mark_recipe_dependencies(path, d):
     mark_dependency(d, os.path.join(gitdir, "index"))
 
     try:
-        ref = oe_run(d, ["git", "symbolic-ref", "-q", "HEAD"], cwd=gitdir).rstrip()
-    except oe.process.CmdError:
+        ref = gitrev_run("git symbolic-ref -q HEAD", gitdir)
+    except bb.process.CmdError:
         pass
     else:
         if ref:
-- 
1.7.5.4



