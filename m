Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA9B67780A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:38:37 +0000 (UTC)
Received: from localhost (192.168.0.21) by mail.hanoverdisplays.com
	(192.168.0.31) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Tue, 27 Jun 2017 09:38:37 +0100
From: Alejandro Mery <amery@hanoverdisplays.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Jun 2017 09:38:13 +0100
Message-ID: <20170627083813.118669-1-amery@hanoverdisplays.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170623202324.69194-1-amery@hanoverdisplays.com>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.0.21]
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: localhost
X-GFI-SMTP-RemoteIP: 192.168.0.21
Subject: [meta-oe][morty][PATCH v2 5/6] gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Jun 2017 08:38:38 -0000
Content-Type: text/plain

v2:
* use git rev-parse instead of rev-list for consistency with get_git_pv
* fix getVar() to pass `expand` as required by morty's bitbake

Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/gitver.bbclass | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
index adb434a46..875a3d79d 100644
--- a/meta-oe/classes/gitver.bbclass
+++ b/meta-oe/classes/gitver.bbclass
@@ -13,16 +13,15 @@ def git_drop_tag_prefix(version):
         return version
 
 GIT_TAGADJUST = "git_drop_tag_prefix(version)"
-GITVER = "${@get_git_pv('${S}', d, tagadjust=lambda version:${GIT_TAGADJUST})}"
-GITSHA = "${@get_git_hash('${S}', d)}"
+GITVER = "${@get_git_pv(d, tagadjust=lambda version:${GIT_TAGADJUST})}"
+GITSHA = "${@get_git_hash(d)}"
 
 def gitrev_run(cmd, path):
     (output, error) = bb.process.run(cmd, cwd=path)
     return output.rstrip()
 
-def get_git_pv(path, d, tagadjust=None):
+def get_git_pv(d, tagadjust=None):
     import os
-    import bb.process
 
     srcdir = d.getVar("EXTERNALSRC", True) or d.getVar("S", True)
     gitdir = os.path.abspath(os.path.join(srcdir, ".git"))
@@ -46,6 +45,17 @@ def get_git_pv(path, d, tagadjust=None):
             ver = tagadjust(ver)
         return ver
 
+def get_git_hash(d):
+    import os
+
+    srcdir = d.getVar("EXTERNALSRC", True) or d.getVar("S", True)
+    gitdir = os.path.abspath(os.path.join(srcdir, ".git"))
+    try:
+        return gitrev_run("git rev-parse HEAD", gitdir)
+
+    except Exception as exc:
+        bb.fatal(str(exc))
+
 def mark_recipe_dependencies(path, d):
     from bb.parse import mark_dependency
 
-- 
2.13.0


