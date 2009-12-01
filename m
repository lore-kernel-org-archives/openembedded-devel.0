Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NFXGr-0002j7-LX
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 19:16:20 +0100
Received: (qmail 27178 invoked by uid 813007); 1 Dec 2009 18:14:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Dec 2009 18:14:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2009 19:14:52 +0100
Message-Id: <1259691294-1131-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5.3
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 1/3] bug: ship SDIO firmware for WiFi
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
X-List-Received-Date: Tue, 01 Dec 2009 18:16:20 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 conf/machine/bug.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
index cec3d5b..3e0389a 100644
--- a/conf/machine/bug.conf
+++ b/conf/machine/bug.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for the BUG base unit.
 TARGET_ARCH = "arm"
 
-MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw"
+MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw marvell-sdio-fw"
 PREFERRED_PROVIDER_virtual/kernel = "linux-bug"
 
 MACHINE_FEATURES = "kernel26 screen touchscreen hotplug alsa wifi usbhost usbgadget"
-- 
1.6.5.2





