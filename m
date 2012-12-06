Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TgPE4-0002Hy-Nj
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Dec 2012 01:22:04 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3229922eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 16:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=x1Oj88gyoJHWSecJoOUYi/pstmjb6F51KMeCSA9t/OM=;
	b=FvrJWhJ/EZihcD5xxdFo+/7ycoOwaQExjoI/3/BlAg5hTxtPXTEjPibMD8VmJDKQrI
	Olk2ypkGSqBVGPtc2rEz3Pbz8BYmS8eLYsvGGzy5khejurmRNXdcK+WYwosmyQz5iMsa
	n1DK7TGOq8yvK/6aFTr/Q9Pf3+Wm85BQMoAq8ttfWhWQb7p2+vejeKCkW92WDld2EFPu
	R5vtUILPZmC0/N1BHxoBSOsEUqTALMdkiFS5m0D1Xc2jKkOHLIbryA4gJFPB+0Hqjh0s
	8WL07ymG+HBQn74ckvIVz8SdMY3Djukq6wY1JlEPwfILD3YbMF6inL4KB15adT0PYBMX
	UHaA==
Received: by 10.14.205.198 with SMTP id j46mr66545294eeo.27.1354752459768;
	Wed, 05 Dec 2012 16:07:39 -0800 (PST)
Received: from mizar.localdomain
	(host81-51-dynamic.5-87-r.retail.telecomitalia.it. [87.5.51.81])
	by mx.google.com with ESMTPS id i49sm12406067eem.6.2012.12.05.16.07.38
	(version=SSLv3 cipher=OTHER); Wed, 05 Dec 2012 16:07:39 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Dec 2012 01:07:10 +0100
Message-Id: <1354752430-14139-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1354752430-14139-1-git-send-email-andrea.adami@gmail.com>
References: <1354752430-14139-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux-yocto_3.4: use a single copy of the locomo keymap patch
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
X-List-Received-Date: Thu, 06 Dec 2012 00:22:04 -0000

* shared by collie and poodle

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../{collie => }/locomo_kbd_tweak-r2.patch         |    0
 .../poodle/locomo_kbd_tweak-r2.patch               |   80 --------------------
 2 files changed, 0 insertions(+), 80 deletions(-)
 rename recipes-kernel/linux/linux-yocto-3.4/{collie => }/locomo_kbd_tweak-r2.patch (100%)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/locomo_kbd_tweak-r2.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch
similarity index 100%
rename from recipes-kernel/linux/linux-yocto-3.4/collie/locomo_kbd_tweak-r2.patch
rename to recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/locomo_kbd_tweak-r2.patch b/recipes-kernel/linux/linux-yocto-3.4/poodle/locomo_kbd_tweak-r2.patch
deleted file mode 100644
index e6178e2..0000000
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/locomo_kbd_tweak-r2.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From e60a4a9a3336a24a8e6ca3ea69587c60cb953881 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 21 Apr 2012 23:48:57 +0200
-Subject: [PATCH 43/43] locomokbd: apply tweaks for Zaurus
-
-* from http://www.rpsys.net/openzaurus/patches/
-
-Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- drivers/input/keyboard/locomokbd.c |   45 ++++++++++++++++++++---------------
- 1 files changed, 26 insertions(+), 19 deletions(-)
-
-diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
-index b1ab298..9bb5bc6 100644
---- a/drivers/input/keyboard/locomokbd.c
-+++ b/drivers/input/keyboard/locomokbd.c
-@@ -41,25 +41,32 @@ MODULE_LICENSE("GPL");
- 
- #define LOCOMOKBD_NUMKEYS	128
- 
--#define KEY_ACTIVITY		KEY_F16
--#define KEY_CONTACT		KEY_F18
--#define KEY_CENTER		KEY_F15
--
--static const unsigned char
-+#define LOCOMO_KEY_CALENDER	KEY_LEFTCTRL
-+#define LOCOMO_KEY_ADDRESS	KEY_LEFTALT	/* Needed for SysRQ */
-+#define LOCOMO_KEY_HOME		KEY_SYSRQ	/* Needed for SysRQ */
-+#define LOCOMO_KEY_MENU		KEY_F12
-+#define LOCOMO_KEY_MAIL		KEY_F10
-+#define LOCOMO_KEY_OK		KEY_F11		/* Don't hardwire to KEY_RETURN */
-+#define LOCOMO_KEY_CANCEL	KEY_POWER
-+#define LOCOMO_KEY_CENTER	KEY_F5		/* Don't hardwire to KEY_RETURN */
-+
-+#define LOCOMO_KEY_FN		KEY_F9
-+
-+static const unsigned char 
- locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
--	0, KEY_ESC, KEY_ACTIVITY, 0, 0, 0, 0, 0, 0, 0,				/* 0 - 9 */
--	0, 0, 0, 0, 0, 0, 0, KEY_MENU, KEY_HOME, KEY_CONTACT,			/* 10 - 19 */
--	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,						/* 20 - 29 */
--	0, 0, 0, KEY_CENTER, 0, KEY_MAIL, 0, 0, 0, 0,				/* 30 - 39 */
--	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,					/* 40 - 49 */
--	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,		/* 50 - 59 */
--	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, KEY_ENTER, 0, 0,			/* 60 - 69 */
--	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,	/* 70 - 79 */
--	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,		/* 80 - 89 */
--	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,				/* 90 - 99 */
--	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,		/* 100 - 109 */
--	KEY_LEFTSHIFT, KEY_TAB, KEY_LEFTCTRL, 0, 0, 0, 0, 0, 0, 0,		/* 110 - 119 */
--	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0		/* 120 - 128 */
-+	0, LOCOMO_KEY_CANCEL, LOCOMO_KEY_CALENDER, LOCOMO_KEY_HOME, 0, 0, 0, 0, 0, 0,	/* 0 - 9 */
-+	0, 0, 0, 0, 0, 0, 0, LOCOMO_KEY_MENU, 0, LOCOMO_KEY_ADDRESS,			/* 10 - 19 */
-+	0, 0, 0, 0, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,					/* 20 - 29 */
-+	0, 0, 0, LOCOMO_KEY_CENTER, 0, LOCOMO_KEY_MAIL, 0, 0, 0, 0,			/* 30 - 39 */
-+	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_RIGHT,						/* 40 - 49 */
-+	KEY_UP, KEY_LEFT, 0, 0, KEY_P, 0, KEY_O, KEY_I, KEY_Y, KEY_T,			/* 50 - 59 */
-+	KEY_E, KEY_W, 0, 0, 0, 0, KEY_DOWN, LOCOMO_KEY_OK, 0, 0,			/* 60 - 69 */
-+	KEY_BACKSPACE, 0, KEY_L, KEY_U, KEY_H, KEY_R, KEY_D, KEY_Q, 0, 0,		/* 70 - 79 */
-+	0, 0, 0, 0, 0, 0, KEY_ENTER, KEY_RIGHTSHIFT, KEY_K, KEY_J,			/* 80 - 89 */
-+	KEY_G, KEY_F, KEY_X, KEY_S, 0, 0, 0, 0, 0, 0,					/* 90 - 99 */
-+	0, 0, KEY_DOT, 0, KEY_COMMA, KEY_N, KEY_B, KEY_C, KEY_Z, KEY_A,			/* 100 - 109 */
-+	KEY_LEFTSHIFT, KEY_TAB, LOCOMO_KEY_FN, 0, 0, 0, 0, 0, 0, 0,			/* 110 - 119 */
-+	KEY_M, KEY_SPACE, KEY_V, KEY_APOSTROPHE, KEY_SLASH, 0, 0, 0			/* 120 - 128 */
- };
- 
- #define KB_ROWS			16
-@@ -68,7 +75,7 @@ locomokbd_keycode[LOCOMOKBD_NUMKEYS] __devinitconst = {
- #define SCANCODE(c,r)		( ((c)<<4) + (r) + 1 )
- 
- #define KB_DELAY		8
--#define SCAN_INTERVAL		(HZ/10)
-+#define SCAN_INTERVAL		(HZ/20)
- 
- struct locomokbd {
- 	unsigned char keycode[LOCOMOKBD_NUMKEYS];
--- 
-1.7.3.4
-
-- 
1.7.8.6



