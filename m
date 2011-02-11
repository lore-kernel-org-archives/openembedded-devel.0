Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PnsUe-0001IB-EL
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:53:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3A6C1314D9F1;
	Fri, 11 Feb 2011 13:51:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id oQdPpey16JlB; Fri, 11 Feb 2011 13:51:48 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id F2470314D9FC;
	Fri, 11 Feb 2011 13:51:46 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 12:51:46 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:51:43 +0000
Message-Id: <1297428703-2330-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
References: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] gitpkgv.bbclass: rename git_drop_tag_prefix to fix conflict
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
X-List-Received-Date: Fri, 11 Feb 2011 12:53:00 -0000

* fixes ERROR: Error Method already seen: git_drop_tag_prefix in
  'gitver.bbclass' now in 'gitpkgv.bbclass'

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/gitpkgv.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/gitpkgv.bbclass b/classes/gitpkgv.bbclass
index d4b8287..bedceb9 100644
--- a/classes/gitpkgv.bbclass
+++ b/classes/gitpkgv.bbclass
@@ -40,7 +40,7 @@
 GITPKGV = "${@get_git_pkgv(d, False)}"
 GITPKGVTAG = "${@get_git_pkgv(d, True)}"
 
-def git_drop_tag_prefix(version):
+def gitpkgv_drop_tag_prefix(version):
     import re
     if re.match("v\d", version):
         return version[1:]
@@ -71,7 +71,7 @@ def get_git_pkgv(d, use_tags):
 
 			if use_tags:
 				try:
-					ver = git_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip())
+					ver = gitpkgv_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip())
 				except Exception:
 					ver = "0.0-%s-g%s" % (commits, rev[:7])
 			else:
-- 
1.7.2.3



