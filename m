Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Sp0xo-00038O-Qd
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jul 2012 19:44:36 +0200
Received: from mizar.localdomain (87.0.20.4) by smtp208.alice.it (8.6.023.02)
	id 4FFCD56D0021C791; Wed, 11 Jul 2012 19:33:24 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2012 19:33:22 +0200
Message-Id: <1342028002-4580-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] formfactor: add machine-specific /etc/rotation for psplash
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
X-List-Received-Date: Wed, 11 Jul 2012 17:44:37 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/formfactor_0.0.bbappend |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index e406684..aaa24f5 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,4 +1,17 @@
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
+do_install_prepend () {
+	# provide machine-specific /etc/rotation for psplash
+	sed -n 's/^[ \t]DISPLAY_ORIENTATION[ \t]*//p' ${S}/machconfig | tr -dc '[0-9]' > ${S}/rotation
+	printf "\n" >> ${S}/rotation
+}
+
+do_install_append () {
+	# Only install file if it has a content
+	if [ -s "${S}/rotation" ]; then
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${S}/rotation ${D}${sysconfdir}/rotation
+	fi
+}
-- 
1.7.8.6



