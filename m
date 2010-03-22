Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXi-0002xo-EM
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:38 +0100
Received: (qmail 14223 invoked by uid 813007); 22 Mar 2010 11:08:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:54 +0100
Message-Id: <1269256016-13155-9-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David-John Willis <John.Willis@Distant-earth.com>,
	Chris Larson <clarson@mvista.com>
Subject: [PATCH][STABLE] shadow: Fix issue that stopped shadow.inc from packaging /usr/bin/passwd correctly and bump INC_PR.
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:38 -0000

From: David-John Willis <John.Willis@Distant-earth.com>

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 recipes/shadow/shadow.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 68381f0..9da5845 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -11,7 +11,7 @@ LICENSE = "BSD"
 SECTION = "base"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -79,8 +79,8 @@ do_install_append() {
   sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
   sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
 
+  mv ${D}${bindir}/passwd ${D}${bindir}/passwd.${PN}
   mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
-  mv ${D}${bindir}/passwd ${D}${bindir}/chpasswd.${PN}
 
   # Ensure we add a suitable securetty file to the package that has most common embedded TTYs defined.
   install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
-- 
1.7.0.2





