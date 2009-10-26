Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1N2Elg-0002Jh-TI
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 02:53:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 29CCC5AAFED;
	Sun, 25 Oct 2009 21:52:03 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04605-03; Sun, 25 Oct 2009 21:52:03 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id E9F705AAFC6; Sun, 25 Oct 2009 21:52:02 -0400 (EDT)
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 7E4CE5AAFC6;
	Sun, 25 Oct 2009 21:52:01 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 63FB640AA2; Sun, 25 Oct 2009 21:52:01 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Oct 2009 21:52:00 -0400
Message-Id: <1256521920-9126-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] gitver.bbclass: fix git dependency tracking
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
X-List-Received-Date: Mon, 26 Oct 2009 01:53:12 -0000

.git/HEAD doesn't usually change on a commit, but the ref it points to
(e.g. .git/refs/heads/master) should. Handle this and another couple of
cases: if a tag is added without a new commit, or if the ref is in
packed-refs.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 classes/gitver.bbclass |   32 +++++++++++++++++++++-----------
 1 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/classes/gitver.bbclass b/classes/gitver.bbclass
index 92c053a..5b4ba8d 100644
--- a/classes/gitver.bbclass
+++ b/classes/gitver.bbclass
@@ -8,20 +8,14 @@
 
 GITVER = "${@get_git_pv('${S}', d)}"
 
-def gitver_mark_dependency(d):
-    from bb.data import expand
-    from bb.parse import mark_dependency
-    from os.path import abspath
-
-    fn = abspath(expand("${S}/.git/HEAD", d))
-    mark_dependency(d, fn)
-
 def get_git_pv(path, d, tagadjust=None):
     from subprocess import Popen, PIPE
-    from os.path import join
+    import os
     from bb import error
+    from bb.parse import mark_dependency
 
-    env = {"GIT_DIR": join(d.getVar("S", True), ".git")}
+    gitdir = os.path.abspath(os.path.join(d.getVar("S", True), ".git"))
+    env = { "GIT_DIR": gitdir }
 
     def popen(cmd, **kwargs):
         kwargs["stderr"] = PIPE
@@ -39,7 +33,23 @@ def get_git_pv(path, d, tagadjust=None):
             return
         return stdout.rstrip()
 
-    gitver_mark_dependency(d)
+    # Force the recipe to be reparsed so the version gets bumped
+    # if the active branch is switched, or if the branch changes.
+    mark_dependency(d, os.path.join(gitdir, "HEAD"))
+
+    ref = popen(["git", "symbolic-ref", "HEAD"])
+    reffile = os.path.join(gitdir, ref)
+    if ref and os.path.exists(reffile):
+        mark_dependency(d, reffile)
+    else:
+        # The ref might be hidden in packed-refs. Force a reparse if anything
+        # in the working copy changes.
+        mark_dependency(d, os.path.join(gitdir, "index"))
+
+    # Catch new tags.
+    tagdir = os.path.join(gitdir, "refs", "tags")
+    if os.path.exists(tagdir):
+        mark_dependency(d, tagdir)
 
     ver = popen(["git", "describe", "--tags"], cwd=path)
     if not ver:
-- 
1.6.3



