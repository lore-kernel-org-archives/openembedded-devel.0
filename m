Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58U-0003AW-UW
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:27 +0200
Received: (qmail 30588 invoked by uid 813007); 1 Jul 2009 18:54:31 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:30 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:21 +0200
Message-Id: <1246474461-16671-15-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH 020/125] angstrom: stop disabling binary localegen for >=armv6 per RFC on the ml
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:27 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/distro/include/angstrom.inc |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 60f2e55..a814b01 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -101,11 +101,6 @@ ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 # We only want to build UTF8 locales
 LOCALE_UTF8_ONLY = "1"
 
-#qemu doesn't like armv6/eabi/vfp
-ENABLE_BINARY_LOCALE_GENERATION_armv6 = "0"
-ENABLE_BINARY_LOCALE_GENERATION_armv6-novfp = "0"
-ENABLE_BINARY_LOCALE_GENERATION_armv7a = "0"
-
 #qemu has taken a dislike to armeb as well
 ENABLE_BINARY_LOCALE_GENERATION_armeb = "0"
 
-- 
1.6.3.1





