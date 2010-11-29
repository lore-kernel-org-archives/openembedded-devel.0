Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PN5N6-00041w-K9
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 16:10:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3A99E314B3D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 16:09:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id fG5RXOJ1+kxn
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 16:09:02 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 11B4B314B2A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 16:09:01 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 29 Nov 2010 15:09:00 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Nov 2010 15:09:00 +0000
Message-Id: <1291043340-13199-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] package.bbclass: call PACKAGESTRIPFUNCS before populate_packages
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
X-List-Received-Date: Mon, 29 Nov 2010 15:10:29 -0000

  Introduce run_strip_funcs() to call the functions in
  PACKAGESTRIPFUNCS and place it before populate_packages().

  This allows users of do_split_packages() to package the .debug
  directories, which get created by do_runstrip().

  do_split_packages() is usually prepended to populate_packages().

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/package.bbclass |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 2769595..678ffa9 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -367,6 +367,12 @@ python perform_packagecopy () {
 	os.system('cp -pPR %s/. %s/' % (installdest, pkgcopy))
 }
 
+python run_strip_funcs() {
+	if (bb.data.getVar('PACKAGE_STRIP', d, True) != 'no'):
+		for f in (bb.data.getVar('PACKAGESTRIPFUNCS', d, True) or '').split():
+			bb.build.exec_func(f, d)
+}
+
 python populate_packages () {
 	import glob, errno, re,os
 
@@ -391,11 +397,6 @@ python populate_packages () {
 		else:
 			package_list.append(pkg)
 
-
-	if (bb.data.getVar('PACKAGE_STRIP', d, True) != 'no'):
-		for f in (bb.data.getVar('PACKAGESTRIPFUNCS', d, True) or '').split():
-			bb.build.exec_func(f, d)
-
 	pkgdest = bb.data.getVar('PKGDEST', d, True)
 	os.system('rm -rf %s' % pkgdest)
 
@@ -1011,6 +1012,7 @@ PACKAGE_PREPROCESS_FUNCS ?= ""
 PACKAGEFUNCS ?= "perform_packagecopy \
                 ${PACKAGE_PREPROCESS_FUNCS} \
 		package_do_split_locales \
+		run_strip_funcs \
 		populate_packages \
 		package_do_shlibs \
 		package_do_pkgconfig \
-- 
1.7.1



