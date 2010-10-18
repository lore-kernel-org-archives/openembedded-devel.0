Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1P7spV-0003yl-7G
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 18:44:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 0037A8CBC00;
	Mon, 18 Oct 2010 12:44:24 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23074-04; Mon, 18 Oct 2010 12:44:24 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id D14DE8CBDB5; Mon, 18 Oct 2010 12:44:24 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id CD6C08C68BD;
	Mon, 18 Oct 2010 12:44:23 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id AFD915000E7; Mon, 18 Oct 2010 12:44:23 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 12:44:23 -0400
Message-Id: <1287420263-28528-1-git-send-email-msmith@cbnco.com>
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
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v3] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 16:44:59 -0000

The previous system("cp %s/* ...") missed dotfiles/dirs at the
top-level.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Graham Gower <graham.gower@gmail.com>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/package.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index e2a61bf..2769595 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -356,15 +356,15 @@ python package_do_split_locales() {
 }
 
 python perform_packagecopy () {
-	dest = bb.data.getVar('D', d, True)
-	dvar = bb.data.getVar('PKGD', d, True)
+	installdest = bb.data.getVar('D', d, True)
+	pkgcopy = bb.data.getVar('PKGD', d, True)
 
-	bb.mkdirhier(dvar)
+	bb.mkdirhier(pkgcopy)
 
 	# Start by package population by taking a copy of the installed 
 	# files to operate on
-	os.system('rm -rf %s/*' % (dvar))
-	os.system('cp -pPR %s/* %s/' % (dest, dvar))
+	os.system('rm -rf %s/*' % (pkgcopy))
+	os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy))
 }
 
 python populate_packages () {
-- 
1.7.0.4



