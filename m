Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXi-0002xw-LT
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:39 +0100
Received: (qmail 14286 invoked by uid 813007); 22 Mar 2010 11:08:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:55 +0100
Message-Id: <1269256016-13155-10-git-send-email-marcin@juszkiewicz.com.pl>
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
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH][STABLE] shadow: run pwconv and grpconv in postinst
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:39 -0000

From: Koen Kooi <koen@openembedded.org>

* this converts oldstyle formats to the proper one
---
 recipes/shadow/shadow.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 9da5845..5e3d2f2 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -11,7 +11,7 @@ LICENSE = "BSD"
 SECTION = "base"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -89,6 +89,11 @@ do_install_append() {
 pkg_postinst_${PN} () {
     update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 100
     update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 100
+    if [ "x$D" != "x" ]; then
+        exit 1
+    fi  
+	pwconv
+	grpconv
 }
 
 pkg_prerm_${PN} () {
-- 
1.7.0.2





