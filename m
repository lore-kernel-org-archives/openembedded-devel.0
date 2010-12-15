Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PSyl5-0008Qe-G3
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 22:19:36 +0100
Received: by yxd5 with SMTP id 5so1377509yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 13:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=20CaT421RDlG1F6KtirRHAgwmPHfdRY5Gd5dxBENx7k=;
	b=ZRH4jORBaD5KHn25H7MYXfPxdRUDxioVyniH4/xA1YQCpVVIwrEydJf6EoaGdXeTvE
	6cmlr325fjV5guYlBnHDbRWFtwbIfuqEnQLaLuF7yR6orco8EKL+S1L7mn2WK8RMXnkQ
	ELR4uQjvVvVtcDM3K+IuzBX8nMJv0Gb/DMYEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=lCGGBb3WMwymwbA31Ye9FUky9OQfnfshQypcMkPpW2JYhpjH5VGgqsdq7V8+28jCod
	a2qEDlfE+JA/BtqPrJ990N0iwbcrk9zmlIdTij3/zxPAWhfnJMcgqAsFkhNPr4sMDrWk
	iKKA1x4vkynRvMZMuIDsCjsIKu3zEKs8mj9Xs=
Received: by 10.151.10.12 with SMTP id n12mr10535723ybi.220.1292447873564;
	Wed, 15 Dec 2010 13:17:53 -0800 (PST)
Received: from ossystems.com.br ([189.114.111.55])
	by mx.google.com with ESMTPS id v6sm4216770ybk.8.2010.12.15.13.17.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 13:17:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id B4FF46100FB; Wed, 15 Dec 2010 19:17:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Dec 2010 19:17:13 -0200
Message-Id: <1292447833-14403-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.3
In-Reply-To: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] classes/gitpkgv.bbclass: use 'git describe' information and simplify usage
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
X-List-Received-Date: Wed, 15 Dec 2010 21:19:36 -0000

By default the PKGV is going to use 'git describe' information except
if 'GITPKGV_USE_TAGS = "0"' is used.

For easy usage, the class defines PV and PKGV for sane values making
it quite trivial for its use.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/gitpkgv.bbclass |   41 +++++++++++++++++++++++++----------------
 1 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/classes/gitpkgv.bbclass b/classes/gitpkgv.bbclass
index bc1dc32..ed34a50 100644
--- a/classes/gitpkgv.bbclass
+++ b/classes/gitpkgv.bbclass
@@ -1,27 +1,27 @@
-# gitpkgv.bbclass provides a GITPKGV variable which is a sortable version
-# with the format NN+GITHASH, to be used in PKGV, where
-#
-# NN equals the total number of revs up to SRCREV
-# GITHASH is SRCREV's (full) hash
+# gitpkgv.bbclass provides a PKGV variable based on 'git describe'
+# output or the number of commits up to SRCREV.
 #
 # gitpkgv.bbclass assumes the git repository has been cloned, and contains
-# SRCREV. So ${GITPKGV} should never be used in PV, only in PKGV.
-# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<some fixed git hash>"
-#
-# use example:
+# SRCREV. So it should never be used in PV, only in PKGV.
 #
-# inherit gitpkgv
-#
-# PV = "1.0+git${SRCPV}"
-# PKGV = "1.0+git${GITPKGV}"
+# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<some fixed git hash>"
 
-GITPKGV = "${@get_git_pkgv(d)}"
+PV = "gitr${SRCPV}"
+PKGV = "${@get_git_pkgv(d)}"
+
+def git_drop_tag_prefix(version):
+    import re
+    if re.match("v\d", version):
+        return version[1:]
+    else:
+        return version
 
 def get_git_pkgv(d):
 	import os
 	import bb
 
 	urls = bb.data.getVar('SRC_URI', d, 1).split()
+	use_tags = bb.data.getVar('GITPKGV_USE_TAGS', d, 1)
 
 	for url in urls:
 		(type, host, path, user, pswd, parm) = bb.decodeurl(bb.data.expand(url, d))
@@ -33,9 +33,18 @@ def get_git_pkgv(d):
 
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
+				ver = "0.0-%s-g%s" % commits, rev[:7]
+
 			os.chdir(cwd)
 
-			return "%s+%s" % (output.split()[0], rev)
+			return ver
 
 	return "0+0"
-- 
1.7.3



