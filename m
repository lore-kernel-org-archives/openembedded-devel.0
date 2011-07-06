Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QeHLX-0003Z3-Fr
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 03:56:11 +0200
Received: by gwb11 with SMTP id 11so2706582gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jul 2011 18:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4SqYLbVeY4kSOFT5f0w6Jipjs7wZK7VlVKuWy/xCOqA=;
	b=TG+YTuhg5Xbs9GV414CyWM2TILmJJKz/SsTcuwUQL6jZ8XUyaH7t5RG5w4dc5cLn9d
	J3C7nKaFFLhrwH0NbRpswJZdB2+x01lkA+iZ7Mw2w84MglVRSv8b7IPirwEy+lhHYY6z
	+6mIXER8WxrLJqUqvHc/ecxTVHxpP+tjwmzIY=
Received: by 10.151.4.13 with SMTP id g13mr6331474ybi.398.1309917141088;
	Tue, 05 Jul 2011 18:52:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id j8sm437305yba.11.2011.07.05.18.52.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 18:52:20 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jul 2011 20:48:56 -0500
Message-Id: <1309916936-17283-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com,
	Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, beagle@list.ti.com
Subject: [PATCH v2] linux-omap-psp: Fix the user button GPIO to the correct value for a BeagleBoard-xM
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
X-List-Received-Date: Wed, 06 Jul 2011 01:56:11 -0000

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 ...agle-cleaned-up-board-revision-conditions.patch |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch b/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch
index 513a101..fb91cb6 100644
--- a/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch
+++ b/recipes/linux/linux-omap-psp-2.6.32/beagleboard-xmc/0008-omap3-beagle-cleaned-up-board-revision-conditions.patch
@@ -143,8 +143,8 @@ index 4bde54b..664a9c6 100644
  	omap3_beagle_i2c_init();
  
 -	if (cpu_is_omap3630()) {
-+	if ((omap3_beagle_get_rev() != OMAP3BEAGLE_BOARD_XMAB) &&
-+		(omap3_beagle_get_rev() != OMAP3BEAGLE_BOARD_XMC)) {
++	if ((omap3_beagle_get_rev() == OMAP3BEAGLE_BOARD_XMAB) ||
++		(omap3_beagle_get_rev() == OMAP3BEAGLE_BOARD_XMC)) {
  		gpio_buttons[0].gpio = 4;
  	}
  
-- 
1.7.0.4



