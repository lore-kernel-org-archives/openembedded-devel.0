Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NV6On-0002ub-Bq
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 17:48:52 +0100
Received: (qmail 21581 invoked by uid 813007); 13 Jan 2010 16:46:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Jan 2010 16:46:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jan 2010 17:46:32 +0100
Message-Id: <1263401193-12161-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1263401193-12161-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1263401193-12161-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 1/2] bug: use full X.org
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
X-List-Received-Date: Wed, 13 Jan 2010 16:48:52 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/machine/bug.conf |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
index 3e0389a..d79cf15 100644
--- a/conf/machine/bug.conf
+++ b/conf/machine/bug.conf
@@ -14,3 +14,11 @@ CPU_FEATURES += "vfp"
 require conf/machine/include/tune-arm1136jf-s.inc
 
 KERNEL_IMAGETYPE = "uImage"
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-tslib \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard"
-- 
1.6.6





