Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OSY7i-0001V1-99
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 18:20:54 +0200
Received: from p5b03300d.dip.t-dialin.net ([91.3.48.13] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OSY3B-0007yY-EF by authid <stefan@sostec.de> with cram_md5;
	Sat, 26 Jun 2010 18:16:16 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1OSY37-00067d-UM; Sat, 26 Jun 2010 18:16:09 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Jun 2010 18:16:07 +0200
Message-Id: <1277568967-23506-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH] shadow: Disable email checking completely
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
X-List-Received-Date: Sat, 26 Jun 2010 16:20:55 -0000

From: Stefan Schmidt <stefan@buglabs.net>

This allows faster login due to not checking for new emails.

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/shadow/shadow.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 460930b..d2ac65d 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -13,7 +13,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
 
-INC_PR = "r14"
+INC_PR = "r15"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -81,6 +81,9 @@ do_install_append() {
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



