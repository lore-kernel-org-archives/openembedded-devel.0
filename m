Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1URRLU-00034K-Ez
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 20:08:22 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so1951560eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 10:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=yRnQuii/vUQKVpTnGoBE17Fp+05qYU6S2ecAxwjDSUg=;
	b=N+JGI/olF7lAWwUvfHHkK04fQSNw+p/3dr0G6p2Qi5D2gzfELsXQKMDYRkLsO0tEyD
	8GqQVqY7jYnIEaMWUJAIwAax+IjLWDQD0nbfPmqDdz5WO9VsQk2AZn4BTD4n+G+41qRL
	dZrPhg9Na3GNSRSgEzRso4nFyNugnOP9ApVQYPoH1GjhAD244N17vxXngaHsfEZMzIQQ
	ZTW1M1ulJVNN+ZqQKQfMApQ1q5v5i/jLWe2j3lynh1nXH7Rl2+ScjPymisSyX1uVKuIA
	gi/5bcLBbxDmiwG2lkDTAUrVrs0rfw1iU5wxQTqkD7SH6BUVeb/2ZXFnAySAbla/fgXA
	S9tw==
X-Received: by 10.14.219.8 with SMTP id l8mr43243301eep.40.1365961840756;
	Sun, 14 Apr 2013 10:50:40 -0700 (PDT)
Received: from mizar.localdomain
	(host5-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.5])
	by mx.google.com with ESMTPS id u44sm22625959eel.7.2013.04.14.10.50.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 10:50:39 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2013 19:50:31 +0200
Message-Id: <1365961831-6466-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto_3.8: remove patch already upstream
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
X-List-Received-Date: Sun, 14 Apr 2013 18:08:22 -0000

* the spitz_pm patch was pushed upstream with commit
* id 510fcb0d331f314cd20d0067d56f29302846f47b
*
* remove it to unbreak do_patch

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.8/akita/akita.scc          |  1 -
 .../linux/linux-yocto-3.8/spitz/spitz.scc          |  1 -
 .../linux/linux-yocto-3.8/spitz_pm.patch           | 53 ----------------------
 3 files changed, 55 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
index e1549ef..bad38c4 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
@@ -6,6 +6,5 @@ include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
 patch sharpsl_param.patch
-patch spitz_pm.patch
 patch pxa27x-sa1100-rtc.patch
 patch spi-pxa2xx-fix-mem.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
index fe6aac8..f9f9381 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
@@ -5,6 +5,5 @@ include ../zaurus-common.scc
 include ../zaurus-usb-host.scc
 
 patch sharpsl_param.patch
-patch spitz_pm.patch
 patch pxa27x-sa1100-rtc.patch
 patch spi-pxa2xx-fix-mem.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch b/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
deleted file mode 100644
index 34bcb9d..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Subject: [PATCH] [ARM] pxa/spitz_pm.c: Fix hang under certain conditions when resuming from STR.
-
-Devices that use spitz_pm.c will fail to resume
-from STR (Suspend To Ram) when the charger plug is inserted
-or removed when a device is in STR mode. The culprit is
-a misconfigured gpio line - GPIO18. GPIO18 should be configured as a
-regular GPIO input but it gets configured as an alternate function
-GPIO18_RDY. And then later in postsuspend() it gets configured as
-a regular GPIO18 input line.
-
-Fix this by removing the GPIO18_RDY configuration so that GPIO18
-only gets configured as a regular gpio input.
-
-Signed-off-by: Marko Katic <dromede@gmail.com>
----
- arch/arm/mach-pxa/spitz_pm.c |    8 ++------
- 1 files changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
-index 438f02f..842596d 100644
---- a/arch/arm/mach-pxa/spitz_pm.c
-+++ b/arch/arm/mach-pxa/spitz_pm.c
-@@ -86,10 +86,7 @@ static void spitz_discharge1(int on)
- 	gpio_set_value(SPITZ_GPIO_LED_GREEN, on);
- }
- 
--static unsigned long gpio18_config[] = {
--	GPIO18_RDY,
--	GPIO18_GPIO,
--};
-+static unsigned long gpio18_config = GPIO18_GPIO;
- 
- static void spitz_presuspend(void)
- {
-@@ -112,7 +109,7 @@ static void spitz_presuspend(void)
- 	PGSR3 &= ~SPITZ_GPIO_G3_STROBE_BIT;
- 	PGSR2 |= GPIO_bit(SPITZ_GPIO_KEY_STROBE0);
- 
--	pxa2xx_mfp_config(&gpio18_config[0], 1);
-+	pxa2xx_mfp_config(&gpio18_config, 1);
- 	gpio_request_one(18, GPIOF_OUT_INIT_HIGH, "Unknown");
- 	gpio_free(18);
- 
-@@ -131,7 +128,6 @@ static void spitz_presuspend(void)
- 
- static void spitz_postsuspend(void)
- {
--	pxa2xx_mfp_config(&gpio18_config[1], 1);
- }
- 
- static int spitz_should_wakeup(unsigned int resume_on_alarm)
--- 
-1.7.4.1
-- 
1.8.1.5



