Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Pq54Z-00016F-7b
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 15:43:11 +0100
Received: from localhost.localdomain (95.232.143.186) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC7FB5F01DE6F3F; Thu, 17 Feb 2011 15:39:19 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Thu, 17 Feb 2011 15:39:06 +0100
Message-Id: <1297953548-26589-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297953548-26589-1-git-send-email-GNUtoo@no-log.org>
References: <1297953548-26589-1-git-send-email-GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] bug20: add MACHINE_EXTRA_RRECOMMENDS
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
X-List-Received-Date: Thu, 17 Feb 2011 14:43:11 -0000

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/machine/bug20.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
index 7b71629..a9441bd 100644
--- a/conf/machine/bug20.conf
+++ b/conf/machine/bug20.conf
@@ -13,6 +13,8 @@ XSERVER = "xserver-xorg \
            xf86-video-omapfb \
            xf86-input-keyboard"
 
+MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw marvell-sdio-fw kernel-modules"
+
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
-- 
1.7.0.4



