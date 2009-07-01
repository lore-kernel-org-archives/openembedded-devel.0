Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58R-00039C-KC
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:23 +0200
Received: (qmail 30232 invoked by uid 813007); 1 Jul 2009 18:54:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:27 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:08 +0200
Message-Id: <1246474461-16671-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 007/125] base.bbclass: added 'gcc-3.4' to list of gcc3 versions (Debian systems)
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

From: Marcin Juszkiewicz <marcin@buglabs.net>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 0baf0e0..a901f02 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1240,7 +1240,7 @@ def check_gcc3(data):
 	# Start by checking for the program name as we build it, was not
 	# all host-provided gcc-3.4's will work.
 
-	gcc3_versions = 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
+	gcc3_versions = 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
 
 	for gcc3 in gcc3_versions.split():
 		if check_app_exists(gcc3, data):
-- 
1.6.3.1





