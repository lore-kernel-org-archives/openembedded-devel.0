Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PTExa-0002gt-OP
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 15:37:35 +0100
Received: by gxk21 with SMTP id 21so2183212gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 06:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer;
	bh=QNx0eCES//4T7Sqj6dd6OQ0ggtER/CekqxFGoHh2G5M=;
	b=Xdhj6GC8zTG7JxpLsWbN2NFUrZ3dvdwsRSni/tO9TcNGm+quOgTtoAmxAn99MIagvF
	lCWgtgJQJJc9coNRWhma40vDkX7UI5XhqHXllz8ZsCG1+zd9mquQ57c2jk6j+BmOoJol
	Lc9PG+0jMjI4UltONeu95S48yxZaJWxkyISW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=hUvmhagrROUOFpH9Vgx4rntg0+p6/vMVCWwgGb8ezgRw3T7qVRzrp8/oqQ4LWcC0Vs
	8LYOjeW3FpRh/SAh618C+V54rNkx7L5RiNHo/UBiZYsySIofU2RCMAo1CMkksNh4shZY
	2Zx3aNvX7Oacy5ZoeW/1QqhrBBiYtkzDcnJIw=
Received: by 10.150.97.16 with SMTP id u16mr969242ybb.185.1292510154326;
	Thu, 16 Dec 2010 06:35:54 -0800 (PST)
Received: from ossystems.com.br ([189.114.111.55])
	by mx.google.com with ESMTPS id l4sm4751840ybj.21.2010.12.16.06.35.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 06:35:53 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 436AD6100FB; Thu, 16 Dec 2010 12:35:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 12:35:12 -0200
Message-Id: <1292510112-32629-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.3
X-SA-Exim-Connect-IP: 209.85.161.179
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
X-List-Received-Date: Thu, 16 Dec 2010 14:37:35 -0000

Using ${GITPKGVTAG} allows for automatic versioning based on the
repository tags. For those that doesn't want to use it, ${GITPKGV} is
still available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/gitpkgv.bbclass |   54 +++++++++++++++++++++++++++++++++++++---------
 1 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/classes/gitpkgv.bbclass b/classes/gitpkgv.bbclass
index bc1dc32..ab8ba6e 100644
--- a/classes/gitpkgv.bbclass
+++ b/classes/gitpkgv.bbclass
@@ -1,12 +1,19 @@
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
+# contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG}should never be used
+# in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as well as
+# SRCREV = "<some fixed git hash>"
 #
 # use example:
 #
@@ -14,10 +21,26 @@
 #
 # PV = "1.0+git${SRCPV}"
 # PKGV = "1.0+git${GITPKGV}"
+#
+# or
+#
+# inherit gitpkgv
+#
+# PV = "gitr${SRCPV}"
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
 
@@ -33,9 +56,18 @@ def get_git_pkgv(d):
 
 			cwd = os.getcwd()
 			os.chdir(repodir)
-			output = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True)
+
+			try:
+				if not use_tags:
+					raise Exception("Ignoring tag values.")
+
+				ver = git_drop_tag_prefix(bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip())
+			except Exception:
+				commits = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+				ver = "%s+%s" % commits, rev[:7]
+
 			os.chdir(cwd)
 
-			return "%s+%s" % (output.split()[0], rev)
+			return ver
 
 	return "0+0"
-- 
1.7.3



