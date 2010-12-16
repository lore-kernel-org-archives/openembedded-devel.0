Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PTGP5-0002Ac-0G
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 17:10:03 +0100
Received: by yxd5 with SMTP id 5so1786497yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 08:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Er3xvK3ZlqnoZd6h/LaxfJb28x3sJc764mhsI5jk6AM=;
	b=plcROGapuBjw4EHhVH51w+J5iXwQxZKgoA6eklERlzC+AUcZAUeA8qlMfI560QxcVf
	aFHNEUnazxr0TtOrQZE6EjXNw6LHOKRkYJ7iR8gwxD7Qd3z7jGhQiQB0Hs04f9URmzOE
	OUUxkVg6dMatjC9r0UtbGiE6U3jX8v3eBHdwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=BHjtJm7Y/uIxM/SwUQ/lOSY6pmTeofsdqnbqLnuPU4SZlwWmeOUUb4yK6Xk1OEu4HY
	kzq2eVh9rGIU0wEatgoCXvAdp9CG4WjfNpHXQOliBqkT9DiNqlTrC7jOkHXsc0w22Kcb
	9T4jW4ph1jej+Xs/SzkOLWFc7YNrt58tDWUV0=
Received: by 10.150.96.9 with SMTP id t9mr1139647ybb.318.1292515700280;
	Thu, 16 Dec 2010 08:08:20 -0800 (PST)
Received: from ossystems.com.br ([189.114.111.55])
	by mx.google.com with ESMTPS id v4sm4800806ybe.17.2010.12.16.08.08.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 08:08:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 8F1156100FB; Thu, 16 Dec 2010 14:07:40 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 14:07:37 -0200
Message-Id: <1292515657-15330-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.3
In-Reply-To: <1292510112-32629-1-git-send-email-otavio@ossystems.com.br>
References: <1292510112-32629-1-git-send-email-otavio@ossystems.com.br>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] classes/gitpkgv.bbclass: add GITPKGVTAG that uses 'git describe'
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
X-List-Received-Date: Thu, 16 Dec 2010 16:10:03 -0000

Using ${GITPKGVTAG} allows for automatic versioning based on the
repository tags. For those that doesn't want to use it, ${GITPKGV} is
still available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/gitpkgv.bbclass |   59 ++++++++++++++++++++++++++++++++++++----------
 1 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/classes/gitpkgv.bbclass b/classes/gitpkgv.bbclass
index bc1dc32..ebedcb7 100644
--- a/classes/gitpkgv.bbclass
+++ b/classes/gitpkgv.bbclass
@@ -1,23 +1,46 @@
-# gitpkgv.bbclass provides a GITPKGV variable which is a sortable version
-# with the format NN+GITHASH, to be used in PKGV, where
+# gitpkgv.bbclass provides a GITPKGV and GITPKGVTAG variables to be
+# used in PKGV, as described bellow:
 #
-# NN equals the total number of revs up to SRCREV
-# GITHASH is SRCREV's (full) hash
+# - GITPKGV which is a sortable version with the format NN+GITHASH, to
+#   be used in PKGV, where
 #
-# gitpkgv.bbclass assumes the git repository has been cloned, and contains
-# SRCREV. So ${GITPKGV} should never be used in PV, only in PKGV.
-# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<some fixed git hash>"
+#   NN equals the total number of revs up to SRCREV
+#   GITHASH is SRCREV's (full) hash
+#
+# - GITPKGVTAG which is the output of 'git describe' allowing for
+#   automatic versioning
+#
+# gitpkgv.bbclass assumes the git repository has been cloned, and
+# contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
+# used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
+# well as SRCREV = "<some fixed git hash>"
 #
 # use example:
 #
 # inherit gitpkgv
 #
-# PV = "1.0+git${SRCPV}"
-# PKGV = "1.0+git${GITPKGV}"
+# PV = "1.0+gitr${SRCPV}"
+# PKGV = "1.0+gitr${GITPKGV}"
+#
+# or
+#
+# inherit gitpkgv
+#
+# PV = "1.0+gitr${SRCPV}"
+# PKGV = "${GITPKGVTAG}"
 
-GITPKGV = "${@get_git_pkgv(d)}"
 
-def get_git_pkgv(d):
+GITPKGV = "${@get_git_pkgv(d, False)}"
+GITPKGVTAG = "${@get_git_pkgv(d, True)}"
+
+def git_drop_tag_prefix(version):
+    import re
+    if re.match("v\d", version):
+        return version[1:]
+    else:
+        return version
+
+def get_git_pkgv(d, use_tags):
 	import os
 	import bb
 
@@ -33,9 +56,19 @@ def get_git_pkgv(d):
 
 			cwd = os.getcwd()
 			os.chdir(repodir)
-			output = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True)
+
+			commits = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+
+			if use_tags:
+				try:
+					ver = git_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip())
+				except Exception:
+					ver = "0.0-%s-g%s" % commits, rev[:7]
+			else:
+				ver = "%s+%s" % commits, rev[:7]
+
 			os.chdir(cwd)
 
-			return "%s+%s" % (output.split()[0], rev)
+			return ver
 
 	return "0+0"
-- 
1.7.3



