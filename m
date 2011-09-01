Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9SV-00053y-7y
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:45:39 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OJuzKFalJ3/JOsEeailtWNtcJcUZsLW/Og8t08d0bf0=;
	b=BGtHHvQGz06NRmC/wuABWzzIP4JhgxB3SHSKke97K9i4cw1qcOa/Z81xT9BWXkhKTy
	OWei8DRJz3CFf55/WB6vUwieGQlb+EWZDulTBpa67qsAybq+N3apPUwQJik/eeVS/5VU
	3n+KUzva5/c+u6Au6FM9yNmqBa4OmmTaN2ImM=
Received: by 10.223.71.145 with SMTP id h17mr530480faj.49.1314891645961;
	Thu, 01 Sep 2011 08:40:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f4sm129692fah.4.2011.09.01.08.40.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:40:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:09 +0200
Message-Id: <b348c7bafa860743dacf0e1330afee4945de15f0.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 02/10] linux-2.6.39: upgrade to 2.6.39.4 and import 2 patches from meta-zaurus
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
X-List-Received-Date: Thu, 01 Sep 2011 15:45:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 ++++++++++
 .../linux/linux-2.6.39/locomo_kbd_tweak-r2.patch   |   66 ++++++++++++++++++++
 recipes-kernel/linux/linux_2.6.39.bb               |    5 ++
 3 files changed, 105 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-2.6.39/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-2.6.39/locomo_kbd_tweak-r2.patch

diff --git a/recipes-kernel/linux/linux-2.6.39/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch b/recipes-kernel/linux/linux-2.6.39/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
new file mode 100644
index 0000000..d86b47d
--- /dev/null
+++ b/recipes-kernel/linux/linux-2.6.39/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
@@ -0,0 +1,34 @@
+From 31d99c4c9f14e571ca0e22c5862dd5b6a871e2dd Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Fri, 5 Aug 2011 15:32:23 +0400
+Subject: [PATCH] pcmcia/pxa2xx_sharpsl: retain ops structure on collie
+
+The pxa2xx_sharpsl driver part is also used on collie, which (as
+a StrongARM board) has different expectations for PCMCIA drivers.
+So, on collie place sharpsl_pcmcia_ops in .data section rather than
+in __initdata.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ drivers/pcmcia/pxa2xx_sharpsl.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/pcmcia/pxa2xx_sharpsl.c b/drivers/pcmcia/pxa2xx_sharpsl.c
+index 81af2b3..1b5b749 100644
+--- a/drivers/pcmcia/pxa2xx_sharpsl.c
++++ b/drivers/pcmcia/pxa2xx_sharpsl.c
+@@ -222,7 +222,11 @@ static void sharpsl_pcmcia_socket_suspend(struct soc_pcmcia_socket *skt)
+ 	sharpsl_pcmcia_init_reset(skt);
+ }
+ 
++#ifdef CONFIG_SA1100_COLLIE
++static struct pcmcia_low_level sharpsl_pcmcia_ops = {
++#else
+ static struct pcmcia_low_level sharpsl_pcmcia_ops __initdata = {
++#endif
+ 	.owner                  = THIS_MODULE,
+ 	.hw_init                = sharpsl_pcmcia_hw_init,
+ 	.hw_shutdown            = sharpsl_pcmcia_hw_shutdown,
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-2.6.39/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-2.6.39/locomo_kbd_tweak-r2.patch
new file mode 100644
index 0000000..0d47ade
--- /dev/null
+++ b/recipes-kernel/linux/linux-2.6.39/locomo_kbd_tweak-r2.patch
@@ -0,0 +1,66 @@
+ drivers/input/keyboard/locomokbd.c |   61 +++++++++++++++++++++++--------------
+ 1 file changed, 39 insertions(+), 22 deletions(-)
+
+Index: linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c
+===================================================================
+--- linux-2.6.26-rc4.orig/drivers/input/keyboard/locomokbd.c	2008-05-26 19:08:11.000000000 +0100
++++ linux-2.6.26-rc4/drivers/input/keyboard/locomokbd.c	2008-06-01 18:35:55.000000000 +0100
+@@ -41,25 +41,32 @@
+ 
+ #define LOCOMOKBD_NUMKEYS	128
+ 
+-#define KEY_ACTIVITY		KEY_F16
+-#define KEY_CONTACT		KEY_F18
+-#define KEY_CENTER		KEY_F15
++#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
++#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
++#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
++#define LOCOMO_KEY_MENU		KEY_F12
++#define LOCOMO_KEY_MAIL		KEY_F10
++#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
++#define LOCOMO_KEY_CANCEL	KEY_POWER
++#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
+ 
+-static const unsigned char
++#define LOCOMO_KEY_FN		KEY_F9
++
++static const unsigned char 
+ locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
+-	0, KEY_ESC, KEY_ACTIVITY, 0, 0, 0, 0, 0, 0, 0,				/* 0 - 9 */
+-	0, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_HOME, KEY_CONTACT,			/* 10 - 19 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,						/* 20 - 29 */
+-	0, 0, 0, KEY_CENTER, 0, KEY_MAIL, 0, 0, 0, 0,				/* 30 - 39 */
+-	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,					/* 40 - 49 */
+-	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,		/* 50 - 59 */
+-	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, KEY_ENTER, 0, 0,			/* 60 - 69 */
+-	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,	/* 70 - 79 */
+-	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,		/* 80 - 89 */
+-	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,				/* 90 - 99 */
+-	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,		/* 100 - 109 */
+-	KEY_LEFTSHIFT, KEY_TAB, KEY_LEFTCTRL, 0, 0, 0, 0, 0, 0, 0,		/* 110 - 119 */
+-	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0		/* 120 - 128 */
++	0, LOCOMO_KEY_CANCEL, LOCOMO_KEY_CALENDER, LOCOMO_KEY_HOME, 0, 0, 0, 0, 0, 0,	/* 0 - 9 */
++	0, 0, 0, 0, 0, 0, 0, LOCOMO_KEY_MENU, 0, LOCOMO_KEY_ADDRESS,			/* 10 - 19 */
++	0, 0, 0, 0, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,					/* 20 - 29 */
++	0, 0, 0, LOCOMO_KEY_CENTER, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,			/* 30 - 39 */
++	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,						/* 40 - 49 */
++	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,			/* 50 - 59 */
++	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, LOCOMO_KEY_OK, 0, 0,			/* 60 - 69 */
++	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,		/* 70 - 79 */
++	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,			/* 80 - 89 */
++	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,					/* 90 - 99 */
++	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,			/* 100 - 109 */
++	KEY_LEFTSHIFT, KEY_TAB, LOCOMO_KEY_FN, 0, 0, 0, 0, 0, 0, 0,			/* 110 - 119 */
++	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0			/* 120 - 128 */
+ };
+ 
+ #define KB_ROWS			16
+@@ -68,7 +75,7 @@
+ #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
+ 
+ #define KB_DELAY		8
+-#define SCAN_INTERVAL		(HZ/10)
++#define SCAN_INTERVAL		(HZ/20)
+ 
+ struct locomokbd {
+ 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
diff --git a/recipes-kernel/linux/linux_2.6.39.bb b/recipes-kernel/linux/linux_2.6.39.bb
index fc30491..c74598c 100644
--- a/recipes-kernel/linux/linux_2.6.39.bb
+++ b/recipes-kernel/linux/linux_2.6.39.bb
@@ -11,6 +11,9 @@ DEFAULT_PREFERENCE_tosa = "1"
 DEFAULT_PREFERENCE_h1940 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v2.6/patch-${PV}.4.bz2;apply=yes;name=stablepatch \
+           file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
+           file://locomo_kbd_tweak-r2.patch \
            file://defconfig "
 
 SRC_URI_append_akita = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
@@ -22,3 +25,5 @@ SRC_URI_append_spitz = " file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 "
 
 SRC_URI[kernel.md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
 SRC_URI[kernel.sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
+SRC_URI[stablepatch.md5sum] = "ff5eb7323c054a128d2922bde3297ed5"
+SRC_URI[stablepatch.sha256sum] = "132ba590e92d5c9a1bb0dc0885795a095d48e7db2552f1c9e3c26ce946a70a40"
-- 
1.7.6.1



