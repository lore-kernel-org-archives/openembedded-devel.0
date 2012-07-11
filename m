Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sp5eO-0001hI-Ru
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 00:44:52 +0200
Received: from mizar.localdomain (87.0.20.4) by smtp209.alice.it (8.6.023.02)
	id 4FFCD577002AE39B; Thu, 12 Jul 2012 00:33:40 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jul 2012 00:33:01 +0200
Message-Id: <1342045981-29287-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] formfactor: fix sed expression
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
X-List-Received-Date: Wed, 11 Jul 2012 22:44:53 -0000

* a last-minute check was added...with a missing '*'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/formfactor_0.0.bbappend |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index e888ec1..22fd9db 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,10 +1,10 @@
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 do_install_prepend () {
 	# provide machine-specific /etc/rotation for psplash
-	sed -n 's/^[ \t]DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc '[0-9]' > ${S}/rotation
+	sed -n 's/^[ \t]*DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc '[0-9]' > ${S}/rotation
 	printf "\n" >> ${S}/rotation
 }
 
-- 
1.7.8.6



