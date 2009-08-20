Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MdyYN-0003jQ-1J
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 05:43:09 +0200
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP
	id E3FCC1B79E; Wed, 19 Aug 2009 20:25:49 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2009 20:24:34 -0700
Message-Id: <1250738680-20274-3-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0
In-Reply-To: <1250738680-20274-2-git-send-email-clarson@mvista.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
Cc: Dale Farnsworth <dfarnsworth@mvista.com>
Subject: [PATCH] patch.bbclass: Add "git" patchtool mechanism, which uses git-apply
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
X-List-Received-Date: Thu, 20 Aug 2009 03:43:14 -0000

From: Dale Farnsworth <dfarnsworth@mvista.com>

It can be selected by setting PATCHTOOL = "git".

This is useful because git-apply honors the permissions information
produced by git-format-patch.

Signed-off-by: Dale Farnsworth <dfarnsworth@mvista.com>
Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/patch.bbclass |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 2aa63c0..650d9c1 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -189,6 +189,24 @@ def patch_init(d):
 		def Clean(self):
 			""""""
 
+	class GitApplyTree(PatchTree):
+		def __init__(self, dir, d):
+			PatchTree.__init__(self, dir, d)
+
+		def _applypatch(self, patch, force = False, reverse = False, run = True):
+			shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
+
+			if reverse:
+				shellcmd.append('-R')
+
+			shellcmd.append(patch['file'])
+
+			if not run:
+				return "sh" + "-c" + " ".join(shellcmd)
+
+			return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+
+
 	class QuiltTree(PatchSet):
 		def _runcmd(self, args, run = True):
 			quiltrc = bb.data.getVar('QUILTRCFILE', self.d, 1)
@@ -424,6 +442,7 @@ def patch_init(d):
 	g["PatchSet"] = PatchSet
 	g["PatchTree"] = PatchTree
 	g["QuiltTree"] = QuiltTree
+	g["GitApplyTree"] = GitApplyTree
 	g["Resolver"] = Resolver
 	g["UserResolver"] = UserResolver
 	g["NOOPResolver"] = NOOPResolver
@@ -449,6 +468,7 @@ python patch_do_patch() {
 	patchsetmap = {
 		"patch": PatchTree,
 		"quilt": QuiltTree,
+		"git": GitApplyTree,
 	}
 
 	cls = patchsetmap[bb.data.getVar('PATCHTOOL', d, 1) or 'quilt']
-- 
1.6.0



