Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MCZXU-0002FY-IH
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 15:32:57 +0200
Received: (qmail 29817 invoked by uid 813007); 5 Jun 2009 13:23:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Jun 2009 13:23:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Jun 2009 15:24:32 +0200
Message-Id: <1244208273-14048-4-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [PATCH 3/4] angstrom: disable binary locales for ep9312 (tuning) instead of ep93xx (machine)
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
X-List-Received-Date: Fri, 05 Jun 2009 13:32:57 -0000

ep93xx can be built for armv4t which supports binary locales

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/distro/include/angstrom.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index a91efe4..9d4668b 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -54,7 +54,7 @@ THUMB_INTERWORK = "yes"
 #Use this variable in feeds and other parts that need a URI
 ANGSTROM_URI ?= "http://www.angstrom-distribution.org"
 
-#Use this variable to select which recipe you want to use to get feed configs (/etc/ipkg/*, /etc/apt/sources.list)
+#Use this variable to select which recipe you want to use to get feed configs (/etc/ipkg/, /etc/apt/sources.list)
 # usefull for derivative distros and local testing
 # As this is runtime we can't and won't use virtual/feed-configs
 ANGSTROM_FEED_CONFIGS ?= "angstrom-feed-configs"
@@ -100,7 +100,7 @@ ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY = "1"
 
 #qemu doesn't like this fp
-ENABLE_BINARY_LOCALE_GENERATION_ep93xx = "0"
+ENABLE_BINARY_LOCALE_GENERATION_ep9312 = "0"
 
 #qemu has taken a dislike to armeb as well
 ENABLE_BINARY_LOCALE_GENERATION_armeb = "0"
-- 
1.6.3.1





