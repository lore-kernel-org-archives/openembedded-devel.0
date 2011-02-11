Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PnsUa-0001Hj-Py
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:52:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 93727314D9FD;
	Fri, 11 Feb 2011 13:51:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id l+ejDg5XFOBG; Fri, 11 Feb 2011 13:51:44 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 55439314D3FC;
	Fri, 11 Feb 2011 13:51:43 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 12:51:43 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:51:40 +0000
Message-Id: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] utils.bbclass: restore previous implementation of explode_deps()
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
X-List-Received-Date: Fri, 11 Feb 2011 12:52:57 -0000

* explode_deps() changed its behavior to omit version information
  when the function was removed from OE in favor of BitBake's
  implementation in March 2010. Since then, packages didn't contain
  versioned runtime dependencies.

  See commit 89b7e433719f43f1c36c76cb8856d559014e99bc

* This patch restores the previous implementation of explode_deps(),
  thus fixing the generation of versioned runtime dependencies.

* Reimplementing explode_deps() using bb.utils.explode_dep_versions()
  didn't work, because it choked upon parsing inline python code, e.g.
  on update-modules_1.0.bb's RDEPENDS_${PN} field.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Chris Larson <chris_larson@mentor.com>
---
 classes/utils.bbclass |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 2fa6204..eea084a 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -423,7 +423,21 @@ def check_app_exists(app, d):
 	return bool(which(path, app))
 
 def explode_deps(s):
-	return bb.utils.explode_deps(s)
+	r = []
+	l = s.split()
+	flag = False
+	for i in l:
+		if i[0] == '(':
+			flag = True
+			j = []
+		if flag:
+			j.append(i)
+			if i.endswith(')'):
+				flag = False
+				r[-1] += ' ' + ' '.join(j)
+		else:
+			r.append(i)
+	return r
 
 def base_set_filespath(path, d):
 	bb.note("base_set_filespath usage is deprecated, %s should be fixed" % d.getVar("P", 1))
-- 
1.7.2.3



