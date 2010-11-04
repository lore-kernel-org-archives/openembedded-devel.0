Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PE0ee-0004ZV-FR
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 15:19:05 +0100
Received: by yxe42 with SMTP id 42so1444280yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=yASOqISqbeSMRQbwqz18K+VvB7fqUuZwCgrj34a398Q=;
	b=WtqiZ7A1EAI1PAkLfniBSAmvEexEpSYGAuRiGpgbXTiXvoGAh43zH+N7z2dxla6jPq
	gVPtWPLWRUzpYqnuHMNyUVVmo2uco3MV5L5/V/bwfQsalEEyS2PhKs+MH6JQS4XdrTO7
	Y1rv5F34y2pXQEMi/vfnOUa4DHdoAKYoRlSrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NgquhQ6/vdpPefsP1J/EWVelr5gQ1mX65P5p1MY9PXEx+5WD5u3TPpcng/p5ATfqoB
	2X6GRM8BNbKe4IKci4fbyrGTpo1B9gVQ25HkQ2vBc7fstm8IrJMNCBxlETJI3M59cI7V
	YtOQwNeADCaaT83SvzbhgKeH89CFkyLuT4RIs=
Received: by 10.42.110.70 with SMTP id o6mr382452icp.400.1288880291884;
	Thu, 04 Nov 2010 07:18:11 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id d21sm9671099ibg.21.2010.11.04.07.18.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 07:18:10 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 07:18:02 -0700
Message-Id: <1288880282-13579-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] metadata_scm: use rev-parse rather than show-ref
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
X-List-Received-Date: Thu, 04 Nov 2010 14:19:05 -0000

From: Chris Larson <chris_larson@mentor.com>

show-ref will show all matching refs, so a "show-ref HEAD" will show not just
the local HEAD, but the fetched remote ones as well.  This isn't what we want
for this function, so change it to use rev-parse with --verify, and also
change it to use --short, to shorten the hash to a more palatable length.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/metadata_scm.bbclass |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/classes/metadata_scm.bbclass b/classes/metadata_scm.bbclass
index ffc6a8a..f79ea19 100644
--- a/classes/metadata_scm.bbclass
+++ b/classes/metadata_scm.bbclass
@@ -63,14 +63,18 @@ def base_get_metadata_svn_revision(path, d):
 	return revision
 
 def base_get_metadata_git_branch(path, d):
-	branch = os.popen('cd %s; PATH=%s git symbolic-ref HEAD 2>/dev/null' % (path, d.getVar("PATH", 1))).read().rstrip()
-
-	if len(branch) != 0:
-		return branch.replace("refs/heads/", "")
-	return "<unknown>"
+    try:
+        rev = oe_run(d, ["git", "symbolic-ref", "HEAD"], cwd=path).rstrip()
+    except oe.process.CmdError:
+        rev = "<unknown>"
+    else:
+        rev = rev.replace("refs/heads/", "")
+    return rev
 
 def base_get_metadata_git_revision(path, d):
-	rev = os.popen("cd %s; PATH=%s git show-ref HEAD 2>/dev/null" % (path, d.getVar("PATH", 1))).read().split(" ")[0].rstrip()
-	if len(rev) != 0:
-		return rev
-	return "<unknown>"
+    try:
+        rev = oe_run(d, ["git", "rev-parse", "--verify", "--short", "HEAD"],
+                     cwd=path).rstrip()
+    except oe.process.CmdError:
+        rev = "<unknown>"
+    return rev
-- 
1.7.2.3



