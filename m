Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QeUfL-0005uz-0h
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 18:09:31 +0200
Received: by yxi19 with SMTP id 19so47579yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=btlyIcvYlcX7v4T7ACGE8V2+8gbc5EfOTFTrc9+/xDk=;
	b=VUfxgRGDMOCgkMmQiUmmgGngR6Vos32T03D/P9hnfOPcUs2xxgq3wAI13AgNPByXmI
	sWsl3EF7P7XblASkEzbTr//FKwqibl+tutlH2WdPFERs3YoIvApYP5m4G+f3Ummth293
	lgheS2l4NNkvQZpMnZ/Fjb/XioiBQTkbmkDGI=
Received: by 10.100.230.6 with SMTP id c6mr7031700anh.163.1309968340156;
	Wed, 06 Jul 2011 09:05:40 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x33sm7672165ana.48.2011.07.06.09.05.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jul 2011 09:05:39 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jul 2011 11:02:46 -0500
Message-Id: <1309968166-23347-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, beagleboard@googlegroups.com, k-kooi@ti.com,
	Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com, beagle@list.ti.com
Subject: [PATCH v3] linux-omap-psp: Fix the user button GPIO to the correct value for a BeagleBoard-xM
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
X-List-Received-Date: Wed, 06 Jul 2011 16:09:31 -0000

The user-button wasn't working for me with the the linux-omap-psp-2.6.32 kernel, this change fixes it. I noticed the correct value in the linux-omap-2.6.39 sources

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Changes since v2:
* Bumped PR
* Made the commit summary more descriptive, removed full stop

 conf/machine/include/omap3.inc                     |    2 +-
 ...agle-cleaned-up-board-revision-conditions.patch |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index c762d41..f806a32 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -4,7 +4,7 @@ TARGET_ARCH = "arm"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r102"
+MACHINE_KERNEL_PR = "r103"
 
 KERNEL_IMAGETYPE = "uImage"
 
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



