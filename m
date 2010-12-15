Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PSqql-0004qs-4F
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 13:52:55 +0100
Received: by ywi6 with SMTP id 6so1019462ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 04:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gcOwcPmyYXOhfl1Z4UnBf/R1cOinADLD6xAdvnVunM4=;
	b=xq1dP9LI/lVxKJtZFRcFjv9un5SVLUgpX+OmnngFkn9U2F6vz3xyvu/aQFQObOxvxD
	wOZuz9IQZjd6vvlFC6+Q6HzicRObyYd6lZEtH56t9tDUM4Ql5CulJ008ilOSEDm4VmnL
	5T7kfSw73HWuCQEkQOGfOlbK7qalD099EPvs4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=bS6WR2UVvJb2nqK/8OH+YA0azVa8bK6p+WVEXStY81aHhDr3qeg0OcwGBpNOARgmWN
	foz+I2cAczJHOXDBVnhneWAr9oiLtSNT4/gGV6Nd6SXDJfwEwXqN2yh0cZCUNa3fCvFg
	u9X0kiCjKmURkZ9C+z+2Fe3Ec1xti6qY9bFhM=
Received: by 10.150.196.16 with SMTP id t16mr10058952ybf.29.1292417467856;
	Wed, 15 Dec 2010 04:51:07 -0800 (PST)
Received: from ossystems.com.br ([189.114.111.55])
	by mx.google.com with ESMTPS id p1sm799286ybn.17.2010.12.15.04.51.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Dec 2010 04:51:06 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 4A6806100FB; Wed, 15 Dec 2010 10:50:29 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Dec 2010 10:50:25 -0200
Message-Id: <1292417425-1328-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.3
In-Reply-To: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] classes/gitpv.bbclass: use 'git describe' to for package version
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
X-List-Received-Date: Wed, 15 Dec 2010 12:52:55 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/gitpv.bbclass |   41 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 classes/gitpv.bbclass

diff --git a/classes/gitpv.bbclass b/classes/gitpv.bbclass
new file mode 100644
index 0000000..c9496f1
--- /dev/null
+++ b/classes/gitpv.bbclass
@@ -0,0 +1,41 @@
+# gitpv.bbclass provides a PV variable which is a sortable version
+# with the output of "git describe".
+#
+# It can handle SRCREV = ${AUTOREV}, as well as SRCREV = "<hash>"
+
+PV = "${@get_git_pv(d)}"
+
+def git_drop_tag_prefix(version):
+    import re
+    if re.match("v\d", version):
+        return version[1:]
+    else:
+        return version
+
+def get_git_pv(d):
+    import os
+    import bb
+
+    urls = bb.data.getVar('SRC_URI', d, 1).split()
+
+    for url in urls:
+        (type, host, path, user, pswd, parm) = bb.decodeurl(bb.data.expand(url, d))
+        if type in ['git']:
+            gitsrcname = '%s%s' % (host, path.replace('/', '.'))
+            repodir = os.path.join(bb.data.expand('${GITDIR}', d), gitsrcname)
+            rev = bb.fetch.get_srcrev(d).split('+')[1]
+
+            cwd = os.getcwd()
+            os.chdir(repodir)
+
+            try:
+                ver = bb.fetch.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip()
+            except Exception:
+                commits = bb.fetch.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+                ver = "0.0-%s-g%s" % commits, rev[:7]
+
+            os.chdir(cwd)
+
+            return git_drop_tag_prefix(ver)
+
+        return "0+0"
-- 
1.7.3



