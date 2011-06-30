Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qc9I0-0003dK-OD
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 06:55:45 +0200
Received: by yxe1 with SMTP id 1so804357yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jun 2011 21:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=q4TLsdQX19hfBt57rP71ufe/vXuAHc4J30FgsPd8EIc=;
	b=AnGA7aGPIgtle9NWnmC2EEYZHjxfSt1MVruIV3WrBw6ZeWZjROfr/HTNeCBPrCmmyf
	E0zWrcqkpoH1zgfM6wUD31QfAYCcVMgWOt1+pca9YcP359Rp1qjiJPYrHjjV8TWjKurw
	uS6hFqQs8sI32arEskYmNhPwL8SXJC+vUAHVk=
Received: by 10.90.249.13 with SMTP id w13mr1429995agh.122.1309409520861;
	Wed, 29 Jun 2011 21:52:00 -0700 (PDT)
Received: from [192.168.1.105] (cpe-76-184-244-226.tx.res.rr.com
	[76.184.244.226])
	by mx.google.com with ESMTPS id r10sm1678471anh.28.2011.06.29.21.51.59
	(version=SSLv3 cipher=OTHER); Wed, 29 Jun 2011 21:52:00 -0700 (PDT)
Message-ID: <4E0C00ED.40407@gmail.com>
Date: Wed, 29 Jun 2011 23:51:57 -0500
From: Joel A Fernandes <agnel.joel@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: beagleboard@googlegroups.com, jkridner@ti.com, Koen <k-kooi@ti.com>
Subject: [PATCH] linux-omap-psp-2.6.32 kernel: Fixed User-button GPIO to correct value for -xM
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
X-List-Received-Date: Thu, 30 Jun 2011 04:55:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

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
1.7.1



