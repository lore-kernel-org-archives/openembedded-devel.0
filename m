Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TgPDv-0002GR-Nm
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2012 01:21:55 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2228206eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 16:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=dj+HieGt89TN0H18Ghmm59PT1cl4dAJSJfd/wR5ZACI=;
	b=N6ynHWoJKXhNw5GdOdQxmX1KnaumG2YGTGhf7B/j5TfVhmU6FWD8xsqFw3BbYDbyr0
	IRiC+PP1bF20Z/qK16o0LGSdELGPc3Ye/awaepeQHeYvfDI8joRx2v5ypj5WMLX9ByJb
	I/yNUSiKaAnRZu+n0FHvnyQigJcHKjUHk0WSKG26mkRXz5sfNTx/SnMmZZYUdHql1NuE
	5IWrYj1nhw8rdJlsxfuDFywx6sXM4ztxIJmWNGMuGZpEiKbMM6cw2Y5nl+Bz1G8OiLaF
	lb5vOhgrCrOwzBojprkcX2jBoRrtQ68X6NPiSFAPIoD6MaU1LQhtdiF115ntKYXS/A2O
	W+vQ==
Received: by 10.14.225.4 with SMTP id y4mr36319381eep.6.1354752453533;
	Wed, 05 Dec 2012 16:07:33 -0800 (PST)
Received: from mizar.localdomain
	(host81-51-dynamic.5-87-r.retail.telecomitalia.it. [87.5.51.81])
	by mx.google.com with ESMTPS id i49sm12406067eem.6.2012.12.05.16.07.32
	(version=SSLv3 cipher=OTHER); Wed, 05 Dec 2012 16:07:32 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Dec 2012 01:07:09 +0100
Message-Id: <1354752430-14139-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1354752430-14139-1-git-send-email-andrea.adami@gmail.com>
References: <1354752430-14139-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] linux-yocto_3.4: remove superseded patch for collie and fix do_patch
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
X-List-Received-Date: Thu, 06 Dec 2012 00:21:55 -0000

* there have been two commits fixing drivers/pcmcia/pxa2xx-sharpsl.c

* PCMCIA: pxa: convert PXA socket drivers to use new irq/gpio managemen
* a9bb5a4bf9f84256499c802fd397d56d55227e4f
*
* pcmcia: sharpsl: don't discard sharpsl_pcmcia_ops
* fdc858a466b738d35d3492bc7cf77b1dac98bf7c

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 --------------------
 .../linux/linux-yocto-3.4/collie/collie.scc        |    1 -
 2 files changed, 0 insertions(+), 35 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch b/recipes-kernel/linux/linux-yocto-3.4/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
deleted file mode 100644
index d86b47d..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 31d99c4c9f14e571ca0e22c5862dd5b6a871e2dd Mon Sep 17 00:00:00 2001
-From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-Date: Fri, 5 Aug 2011 15:32:23 +0400
-Subject: [PATCH] pcmcia/pxa2xx_sharpsl: retain ops structure on collie
-
-The pxa2xx_sharpsl driver part is also used on collie, which (as
-a StrongARM board) has different expectations for PCMCIA drivers.
-So, on collie place sharpsl_pcmcia_ops in .data section rather than
-in __initdata.
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
----
- drivers/pcmcia/pxa2xx_sharpsl.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/drivers/pcmcia/pxa2xx_sharpsl.c b/drivers/pcmcia/pxa2xx_sharpsl.c
-index 81af2b3..1b5b749 100644
---- a/drivers/pcmcia/pxa2xx_sharpsl.c
-+++ b/drivers/pcmcia/pxa2xx_sharpsl.c
-@@ -222,7 +222,11 @@ static void sharpsl_pcmcia_socket_suspend(struct soc_pcmcia_socket *skt)
- 	sharpsl_pcmcia_init_reset(skt);
- }
- 
-+#ifdef CONFIG_SA1100_COLLIE
-+static struct pcmcia_low_level sharpsl_pcmcia_ops = {
-+#else
- static struct pcmcia_low_level sharpsl_pcmcia_ops __initdata = {
-+#endif
- 	.owner                  = THIS_MODULE,
- 	.hw_init                = sharpsl_pcmcia_hw_init,
- 	.hw_shutdown            = sharpsl_pcmcia_hw_shutdown,
--- 
-1.7.2.5
-
diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
index 45ac852..b7c11fa 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
@@ -3,4 +3,3 @@ kconf hardware collie.cfg
 include ../zaurus-common.scc
 
 patch locomo_kbd_tweak-r2.patch
-patch 0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
-- 
1.7.8.6



