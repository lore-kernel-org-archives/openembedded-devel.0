Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1OzDfg-0004TO-5p
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:11:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id A258B8A8959
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:10:54 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09872-07 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 24 Sep 2010 15:10:54 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 8097F8AA60A; Fri, 24 Sep 2010 15:10:54 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 77F308A5B62
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:10:53 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 72B8B14097E5; Fri, 24 Sep 2010 15:10:53 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Sep 2010 15:10:53 -0400
Message-Id: <1285355453-14622-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Fri, 24 Sep 2010 19:11:00 -0000

Use shtuil.copytree() to copy D ("image") to PKGD ("package"). The
previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.

Relies on Python 2.5+ version of copytree() to create missing path
components.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 classes/package.bbclass |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index c378133..be2e514 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -354,15 +354,18 @@ python package_do_split_locales() {
 }
 
 python perform_packagecopy () {
-	dest = bb.data.getVar('D', d, True)
-	dvar = bb.data.getVar('PKGD', d, True)
+	import shutil
 
-	bb.mkdirhier(dvar)
+	installdest = bb.data.getVar('D', d, True)
+	pkgcopy = bb.data.getVar('PKGD', d, True)
 
-	# Start by package population by taking a copy of the installed 
+	# Start package population by taking a copy of the installed 
 	# files to operate on
-	os.system('rm -rf %s/*' % (dvar))
-	os.system('cp -pPR %s/* %s/' % (dest, dvar))
+	shutil.rmtree(pkgcopy, True)
+
+	# copytree() automatically creates missing path components in pkgcopy.
+	# Preserve symlinks (don't dereference).
+	shutil.copytree(installdest, pkgcopy, symlinks=True)
 }
 
 python populate_packages () {
-- 
1.7.0.4



