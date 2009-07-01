Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58R-00039B-KB
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:23 +0200
Received: (qmail 30207 invoked by uid 813007); 1 Jul 2009 18:54:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:27 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:07 +0200
Message-Id: <1246474461-16671-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 006/125] base.bbclass: check_gcc3 needs to check for gcc-3.4.6 first. Comment on what this function is used for primarily. The default gcc3-native that we build is called 'gcc-3.4.6' so look for that one first.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:24 -0000

From: Tom Rini <trini@embeddedalley.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/base.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 270b05d..0baf0e0 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1236,8 +1236,11 @@ def check_app_exists(app, d):
 	return len(which(path, app)) != 0
 
 def check_gcc3(data):
+	# Primarly used by qemu to make sure we have a workable gcc-3.4.x.
+	# Start by checking for the program name as we build it, was not
+	# all host-provided gcc-3.4's will work.
 
-	gcc3_versions = 'gcc-3.4 gcc34 gcc-3.4.4 gcc-3.4.6 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
+	gcc3_versions = 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
 
 	for gcc3 in gcc3_versions.split():
 		if check_app_exists(gcc3, data):
-- 
1.6.3.1





