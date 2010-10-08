Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1P4D5n-0004cV-4J
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 15:34:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 117D28C1A84
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Oct 2010 09:34:14 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31618-10 for <openembedded-devel@lists.openembedded.org>; 
	Fri,  8 Oct 2010 09:34:14 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id AAE288C1C24; Fri,  8 Oct 2010 09:34:13 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 87924608878
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Oct 2010 09:34:12 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 768AB5000E5; Fri,  8 Oct 2010 09:34:12 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Oct 2010 09:34:12 -0400
Message-Id: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Fri, 08 Oct 2010 13:34:37 -0000

Use shutil.copytree() to copy D ("image") to PKGD ("package"). The
previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

I sent an earlier version of this a couple of weeks back, but it relied
on shutil.copytree() functionality only available in Python 2.5+. This
version should work on 2.4 (i.e. RHEL 5).

 classes/package.bbclass |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 35d9864..e7659ae 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -354,15 +354,20 @@ python package_do_split_locales() {
 }
 
 python perform_packagecopy () {
-	dest = bb.data.getVar('D', d, True)
-	dvar = bb.data.getVar('PKGD', d, True)
+	import shutil
+
+	installdest = bb.data.getVar('D', d, True)
+	pkgcopy = bb.data.getVar('PKGD', d, True)
 
-	bb.mkdirhier(dvar)
+	# Start package population by taking a copy of the installed 
+	# files to operate on. Create missing parent directories of
+	# pkgcopy first (shutil.copytree() does this automatically but only
+	# in Python 2.5+).
+	bb.mkdirhier(pkgcopy)
+	shutil.rmtree(pkgcopy, True)
 
-	# Start by package population by taking a copy of the installed 
-	# files to operate on
-	os.system('rm -rf %s/*' % (dvar))
-	os.system('cp -pPR %s/* %s/' % (dest, dvar))
+	# Preserve symlinks.
+	shutil.copytree(installdest, pkgcopy, symlinks=True)
 }
 
 python populate_packages () {
-- 
1.7.0.4



