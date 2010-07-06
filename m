Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OWEex-00081z-9c
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 22:22:45 +0200
Received: from p5b034b65.dip.t-dialin.net ([91.3.75.101] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OWEa3-0004FN-P3 by authid <stefan@sostec.de> with cram_md5;
	Tue, 06 Jul 2010 22:17:28 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1OWEa0-0007JU-TF; Tue, 06 Jul 2010 22:17:20 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jul 2010 22:17:16 +0200
Message-Id: <1278447438-27251-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH][STABLE 1/3] shadow: Disable email checking completely
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
X-List-Received-Date: Tue, 06 Jul 2010 20:22:53 -0000

From: Stefan Schmidt <stefan@buglabs.net>

This allows faster login due to not checking for new emails. Adjust PR to 14 as
stable is behind .dev here.

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/shadow/shadow.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 30bd92f..55487df 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -11,7 +11,7 @@ LICENSE = "BSD"
 SECTION = "base"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -79,6 +79,9 @@ do_install_append() {
   sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
   sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
 
+  # disable checking emails at all
+  sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
+
   install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
   for i in passwd chfn newgrp chsh ; do
     mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
-- 
1.7.1



