Return-Path: <linus.walleij@linaro.org>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 525906D3D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:02:58 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id fb10so2092783wid.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 05:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w1WtvLXdQwlo86SAokV98ymHQBvDrnsBDGUcjBh6ttE=;
	b=EqL8Zs/NnQlNBY16MOuiadxATeVcHfQ6Z7K9xu8zE7VCqnpirJYrCzKlO7jMwUCcKb
	6ITMOBpGZ/sXCpXil8RfwQ0zd45gw2WI+Hc8qdQ9Bm4WpJDFgsqAHMvYdcRmHnFutEdu
	7vF3TwI3Qo9CbL5qDh7gPxde5SsrjlPhZZCBVXDcXNdzy4dED8+OgtIws1Jg3ZyLat4F
	PGnMEbfKDnZkFLQpGBOeeKuLeaUUyuIJDHPI7eIaBZ9KOMFtsRWiE4kK33UNhnGzIAMh
	J/lbK7nveD+sUS+sb9xI3DnpLHMEdByVVfDSq9VTSERorPNS1UmqVGB2sRTFP8CrBlTC
	A3LQ==
X-Gm-Message-State: ALoCoQlX+qehhrMHb607kDG4oUAAT4D5xvaBh149A0794aW4KskOj4eILGKQm/5ApRJL7f4Jy3Yu
X-Received: by 10.180.36.80 with SMTP id o16mr12350733wij.1.1384174979797;
	Mon, 11 Nov 2013 05:02:59 -0800 (PST)
Received: from localhost.localdomain ([85.235.11.236])
	by mx.google.com with ESMTPSA id
	td6sm34011917wic.10.2013.11.11.05.02.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 05:02:59 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2013 14:02:55 +0100
Message-Id: <1384174975-5042-1-git-send-email-linus.walleij@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-handheld] [PATCH 2/3] h3600: update defconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2013 13:02:58 -0000

Enable some vital kernel options such as DEVTMPFS and
EABI.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../linux/linux-yocto-3.10/h3600/defconfig         | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig b/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
index 2b4adc5f89d9..612502a801fb 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.10/h3600/defconfig
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_MODULES=y
@@ -13,6 +12,7 @@ CONFIG_SA1100_H3600=y
 CONFIG_PCCARD=y
 CONFIG_PCMCIA_SA1100=y
 CONFIG_PREEMPT=y
+CONFIG_AEABI=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 # CONFIG_CPU_FREQ_STAT is not set
@@ -21,12 +21,13 @@ CONFIG_NET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 # CONFIG_IPV6 is not set
-CONFIG_IRDA=m
+CONFIG_IRDA=y
 CONFIG_IRLAN=m
 CONFIG_IRNET=m
 CONFIG_IRCOMM=m
 # CONFIG_WIRELESS is not set
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
 CONFIG_MTD=y
 CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_BLOCK=y
@@ -48,17 +49,34 @@ CONFIG_PPP_BSDCOMP=m
 CONFIG_PPP_DEFLATE=m
 CONFIG_PPP_ASYNC=m
 # CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_IPAQ_MICRO=y
 # CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_IPAQ_MICRO=y
 # CONFIG_SERIO is not set
 CONFIG_SERIAL_SA1100=y
 CONFIG_SERIAL_SA1100_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
+CONFIG_POWER_SUPPLY=y
+CONFIG_BATTERY_IPAQ_MICRO=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_SA1100=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_LOGO=y
 # CONFIG_USB_SUPPORT is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_IPAQ_MICRO=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_SA11X0=y
+CONFIG_DMATEST=y
 CONFIG_EXT2_FS=y
 CONFIG_MSDOS_FS=m
 CONFIG_VFAT_FS=m
@@ -70,3 +88,4 @@ CONFIG_CRAMFS=m
 CONFIG_NFS_FS=y
 CONFIG_NFSD=m
 CONFIG_NLS=y
+CONFIG_DEBUG_FS=y
-- 
1.8.3.1


