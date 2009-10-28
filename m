Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N360v-0001ub-Mj
	for openembedded-devel@openembedded.org; Wed, 28 Oct 2009 11:44:29 +0100
Received: (qmail 31100 invoked by uid 813007); 28 Oct 2009 10:43:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Oct 2009 10:43:20 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 11:45:55 +0100
Message-Id: <1256726758-22996-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH 3/6] coreutils-native: make mandatory dep for all packages
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
X-List-Received-Date: Wed, 28 Oct 2009 10:44:29 -0000

From: Roman I Khimov <khimov@altell.ru>

Gives us guaranteed sane GNU coreutils on any host. Should greatly ease
support for various non-GNU host systems and allow to safely remove some other
native packages like 'install-native'.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/base.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 611c71d..e622aee 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -134,9 +134,11 @@ def base_dep_prepend(d):
 	# the case where host == build == target, for now we don't work in
 	# that case though.
 	#
-	deps = "shasum-native "
-	if bb.data.getVar('PN', d, True) == "shasum-native":
+	deps = "shasum-native coreutils-native"
+	if bb.data.getVar('PN', d, True) == "shasum-native" or bb.data.getVar('PN', d, True) == "stagemanager-native":
 		deps = ""
+	if bb.data.getVar('PN', d, True) == "coreutils-native":
+		deps = "shasum-native"
 
 	# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
 	# we need that built is the responsibility of the patch function / class, not
-- 
1.6.5





