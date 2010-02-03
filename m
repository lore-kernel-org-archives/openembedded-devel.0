Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1Ncd4g-0000ad-03
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 12:07:14 +0100
Received: by pxi9 with SMTP id 9so1223066pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 03:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=gP4rTzBVWA8uiqroKiKk3yFUYpINIu8bgk2cgmB/to4=;
	b=WefYNUy7Q18EeOjHKQbEok6r/SQ2InKWIRVyGtOADdIIFOKf24Iekm6m1QvSz6LXbQ
	/4A/Mj66PRiztTi906wDZBNxSfeqMB6U9culhtty2XnqEbI3u1NpeLf7ZVML9NXqPDvI
	nHOqFo7Rxpe/W8WTy0ocOoE8Z8x5ZlYLPVRjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=whQgmVFhm951pYfnrfM5W0dOtVpukEu0HDSHGowHm5yo+msO8wTzItYTCQCB2dRwlR
	vKNvAjhz6QkjJnReIEWaqmwvcdolxUPyi+MoGhUADC7lEh0jYvhoNxwz66a5RuNPG4U9
	834pDvHdbGsOfSer/N04etXNfilkCWekf6si4=
Received: by 10.142.119.24 with SMTP id r24mr1350169wfc.30.1265195077479;
	Wed, 03 Feb 2010 03:04:37 -0800 (PST)
Received: from localhost ([123.162.69.234])
	by mx.google.com with ESMTPS id 21sm6321394pzk.11.2010.02.03.03.04.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Feb 2010 03:04:36 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Feb 2010 19:04:10 +0800
Message-Id: <1265195050-20607-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] u-boot: add patches to remove 'inline' keyword of functions with weak attribution
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
X-List-Received-Date: Wed, 03 Feb 2010 11:07:14 -0000

* some functions in u-boot source are defined or declared as 'inline' functions with weak attribution.
* gcc-4.4.* complains about them

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 .../u-boot-remove-inline-of-weak-functions.patch   |   47 ++++++++++++++++++++
 .../04-hipox-remove-inline-of-weak-functions.patch |   34 ++++++++++++++
 ...t-2009.08-remove-inline-of-weak-functions.patch |   40 +++++++++++++++++
 recipes/u-boot/u-boot_2009.01.bb                   |    3 +-
 recipes/u-boot/u-boot_2009.03.bb                   |    3 +-
 recipes/u-boot/u-boot_2009.08.bb                   |    3 +-
 recipes/u-boot/u-boot_git.bb                       |   23 +++++++++-
 7 files changed, 148 insertions(+), 5 deletions(-)
 create mode 100644 recipes/u-boot/files/u-boot-remove-inline-of-weak-functions.patch
 create mode 100644 recipes/u-boot/u-boot-2009.03/hipox/04-hipox-remove-inline-of-weak-functions.patch
 create mode 100644 recipes/u-boot/u-boot-2009.08/u-boot-2009.08-remove-inline-of-weak-functions.patch

diff --git a/recipes/u-boot/files/u-boot-remove-inline-of-weak-functions.patch b/recipes/u-boot/files/u-boot-remove-inline-of-weak-functions.patch
new file mode 100644
index 0000000..ea0c2d7
--- /dev/null
+++ b/recipes/u-boot/files/u-boot-remove-inline-of-weak-functions.patch
@@ -0,0 +1,47 @@
+Remove 'inline' keyword of functions with weak attribution
+
+* gcc-4.4 complains about 'inline' functions with 'weak' attribution
+Index: git/lib_arm/board.c
+===================================================================
+--- git.orig/lib_arm/board.c	2010-01-26 04:56:38.000000000 +0800
++++ git/lib_arm/board.c	2010-02-02 19:31:42.000000000 +0800
+@@ -123,19 +123,19 @@
+  * May be supplied by boards if desired
+  */
+ void inline __coloured_LED_init (void) {}
+-void inline coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
++void coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
+ void inline __red_LED_on (void) {}
+-void inline red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
++void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
+ void inline __red_LED_off(void) {}
+-void inline red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
++void red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
+ void inline __green_LED_on(void) {}
+-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
+ void inline __green_LED_off(void) {}
+-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
++void green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
+ void inline __yellow_LED_on(void) {}
+-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
++void yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
+ void inline __yellow_LED_off(void) {}
+-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
++void yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
+ 
+ /************************************************************************
+  * Init Utilities							*
+Index: git/common/main.c
+===================================================================
+--- git.orig/common/main.c	2010-02-02 19:32:17.000000000 +0800
++++ git/common/main.c	2010-02-02 19:32:21.000000000 +0800
+@@ -48,7 +48,7 @@
+  * Board-specific Platform code can reimplement show_boot_progress () if needed
+  */
+ void inline __show_boot_progress (int val) {}
+-void inline show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
++void show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
+ 
+ #if defined(CONFIG_BOOT_RETRY_TIME) && defined(CONFIG_RESET_TO_RETRY)
+ extern int do_reset (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]);		/* for do_reset() prototype */
diff --git a/recipes/u-boot/u-boot-2009.03/hipox/04-hipox-remove-inline-of-weak-functions.patch b/recipes/u-boot/u-boot-2009.03/hipox/04-hipox-remove-inline-of-weak-functions.patch
new file mode 100644
index 0000000..ab74cb1
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.03/hipox/04-hipox-remove-inline-of-weak-functions.patch
@@ -0,0 +1,34 @@
+Remove 'inline' keyword of functions with weak attribution
+
+* gcc-4.4 complains about 'inline' functions with 'weak' attribution
+Index: u-boot-2009.03/lib_arm/board.c
+===================================================================
+--- u-boot-2009.03.orig/lib_arm/board.c	2010-02-03 18:16:29.000000000 +0800
++++ u-boot-2009.03/lib_arm/board.c	2010-02-03 18:22:58.000000000 +0800
+@@ -123,19 +123,19 @@
+  * May be supplied by boards if desired
+  */
+ void inline __coloured_LED_init (void) {}
+-void inline coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
++void coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
+ void inline __red_LED_on (void) {}
+-void inline red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
++void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
+ void inline __red_LED_off(void) {}
+-void inline red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
++void red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
+ void inline __green_LED_on(void) {}
+-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
+ void inline __green_LED_off(void) {}
+-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
++void green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
+ void inline __yellow_LED_on(void) {}
+-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
++void yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
+ void inline __yellow_LED_off(void) {}
+-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
++void yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
+ 
+ /************************************************************************
+  * Init Utilities							*
diff --git a/recipes/u-boot/u-boot-2009.08/u-boot-2009.08-remove-inline-of-weak-functions.patch b/recipes/u-boot/u-boot-2009.08/u-boot-2009.08-remove-inline-of-weak-functions.patch
new file mode 100644
index 0000000..77c97ea
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.08/u-boot-2009.08-remove-inline-of-weak-functions.patch
@@ -0,0 +1,40 @@
+Remove 'inline' keyword of functions with weak attribution
+
+* gcc-4.4 complains about 'inline' functions with 'weak' attribution
+Index: u-boot-2009.08/lib_arm/board.c
+===================================================================
+--- u-boot-2009.08.orig/lib_arm/board.c	2009-09-01 01:57:42.000000000 +0800
++++ u-boot-2009.08/lib_arm/board.c	2010-02-03 18:45:50.000000000 +0800
+@@ -124,23 +124,23 @@
+  * May be supplied by boards if desired
+  */
+ void inline __coloured_LED_init (void) {}
+-void inline coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
++void coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
+ void inline __red_LED_on (void) {}
+-void inline red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
++void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
+ void inline __red_LED_off(void) {}
+-void inline red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
++void red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
+ void inline __green_LED_on(void) {}
+-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
+ void inline __green_LED_off(void) {}
+-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
++void green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
+ void inline __yellow_LED_on(void) {}
+-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
++void yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
+ void inline __yellow_LED_off(void) {}
+-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
++void yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
+ void inline __blue_LED_on(void) {}
+-void inline blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on")));
++void blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on")));
+ void inline __blue_LED_off(void) {}
+-void inline blue_LED_off(void)__attribute__((weak, alias("__blue_LED_off")));
++void blue_LED_off(void)__attribute__((weak, alias("__blue_LED_off")));
+ 
+ /************************************************************************
+  * Init Utilities							*
diff --git a/recipes/u-boot/u-boot_2009.01.bb b/recipes/u-boot/u-boot_2009.01.bb
index dfb3b3a..940102d 100644
--- a/recipes/u-boot/u-boot_2009.01.bb
+++ b/recipes/u-boot/u-boot_2009.01.bb
@@ -14,9 +14,10 @@ DEFAULT_PREFERENCE_at91cap9adk	 = "1"
 DEFAULT_PREFERENCE_atngw100	 = "1"
 DEFAULT_PREFERENCE_atstk1000	 = "1"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
+SRC_URI += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 
 SRC_URI_append_at91sam9263ek = "\
 	   file://u-boot-2009.01-exp-002-at91sam9g20ek.patch;patch=1 \
diff --git a/recipes/u-boot/u-boot_2009.03.bb b/recipes/u-boot/u-boot_2009.03.bb
index a70fa6a..b3e55e1 100644
--- a/recipes/u-boot/u-boot_2009.03.bb
+++ b/recipes/u-boot/u-boot_2009.03.bb
@@ -1,4 +1,4 @@
-PR = "r2"
+PR = "r3"
 require u-boot.inc
 
 DEFAULT_PREFERENCE = "-1"
@@ -10,6 +10,7 @@ SRC_URI_append_hipox = "file://00-hipox.patch;patch=1 \
 	file://01-hipox-fix-gmac-reset.patch;patch=1 \
 	file://02-hipox-enable-mmu.patch;patch=1 \
 	file://03-hipox-direct-switch.patch;patch=1 \
+	file://04-hipox-remove-inline-of-weak-functions.patch;patch=1 \
 "
 
 TARGET_LDFLAGS = ""
diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_2009.08.bb
index 21715a0..1ba7c2f 100644
--- a/recipes/u-boot/u-boot_2009.08.bb
+++ b/recipes/u-boot/u-boot_2009.08.bb
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r2"
 require u-boot.inc
 
 DEFAULT_PREFERENCE = "-1"
@@ -7,6 +7,7 @@ DEFAULT_PREFERENCE_at91sam9g45ek = "1"
 DEFAULT_PREFERENCE_igep0020 = "1"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+SRC_URI += "file://u-boot-2009.08-remove-inline-of-weak-functions.patch;patch=1"
 
 SRC_URI_append_igep0020 = " \
 	file://update-mach-types.patch;patch=1 \
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 8f21e7f..f9026d0 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,9 +1,11 @@
 require u-boot.inc
-PR ="r37"
+PR ="r38"
 
 FILESPATHPKG =. "u-boot-git:"
 
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git "
+SRC_URI += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
+
 SRCREV_davinci-sffsdr = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
 SRCREV_akita = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
 SRCREV_spitz = "9bf86baaa3b35b25baa2d664e2f7f6cafad689ee"
@@ -24,6 +26,7 @@ file://i2c.patch;patch=1 \
 file://720MHz.patch;patch=1 \
 file://dss.patch;patch=1 \
 "
+SRC_URI_beagleboard += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 
 SRCREV_beagleboard = "a5cf522a91ba479d459f8221135bdb3e9ae97479"
 PV_beagleboard = "2009.11-rc1+${PR}+gitr${SRCREV}"
@@ -45,11 +48,13 @@ SRC_URI_omap3-touchbook = "git://gitorious.org/u-boot-omap3/mainline.git;branch=
                  file://mmcinit.patch;patch=1 \
                  file://touchbook-config.patch;patch=1 \
 "
+SRC_URI_omap3-touchbook += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_omap3-touchbook = "d363f9cb0918a1b6b92e2e20d01543d0c4f53274"
 PV_omap3-touchbook = "2009.05+${PR}+gitr${SRCREV}"
 
 
 SRC_URI_omap3evm = "git://gitorious.org/u-boot-omap3/mainline.git;branch=omap3-dev;protocol=git"
+SRC_URI_omap3evm += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_omap3evm = "2dea1db2a3b7c12ed70bbf8ee50755089c5e5170"
 PV_omap3evm = "2009.03+${PR}+gitr${SRCREV}"
 
@@ -76,6 +81,7 @@ file://omap3evm/0016-Config-option-and-name-changed-to-omap3517_evm.patch;patch=
 PV_am3517-evm = "2009.03+${PR}+gitr${SRCREV}"
 
 SRC_URI_omapzoom = "git://www.sakoman.net/git/u-boot-omap3.git;branch=omap3-dev;protocol=git"
+SRC_URI_omapzoom += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_omapzoom = "d691b424f1f5bf7eea3a4131dfc578d272e8f335"
 PV_omapzoom = "2009.01+${PR}+gitr${SRCREV}"
 
@@ -86,65 +92,79 @@ SRC_URI_overo = "git://gitorious.org/u-boot-omap3/mainline.git;branch=omap3-dev;
                  file://fw-env.patch;patch=1 \
                  file://dss2.patch;patch=1 \
 "
+SRC_URI_overo += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_overo = "2dea1db2a3b7c12ed70bbf8ee50755089c5e5170"
 PV_overo = "2009.03+${PR}+gitr${SRCREV}"
 
 # Davinci dm355-evm/dm365-evm/dm6446-evm - PSP.03.01.00.28 (Phase 3 build 28)
 
 SRC_URI_dm355-evm    = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git"
+SRC_URI_dm355-evm   += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_dm355-evm     = "f8d047c84137ab331c0ee2c3e94c3f1ec4228298"
 PV_dm355-evm         = "2009.10+2009.11-rc1+${PR}+gitr${SRCREV}"
 
 SRC_URI_dm365-evm    = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git"
+SRC_URI_dm365-evm    += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_dm365-evm     = "f8d047c84137ab331c0ee2c3e94c3f1ec4228298"
 PV_dm365-evm         = "2009.10+2009.11-rc1+${PR}+gitr${SRCREV}"
 
 SRC_URI_dm6446-evm   = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git"
+SRC_URI_dm6446-evm   += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_dm6446-evm    = "f8d047c84137ab331c0ee2c3e94c3f1ec4228298"
 PV_dm6446-evm        = "2009.10+2009.11-rc1+${PR}+gitr${SRCREV}"
 
 # Davinci dm6467-evm/dm6467-evm - PSP.03.02.00 (DM6467 Beta)
 
 SRC_URI_dm6467-evm   = "git://arago-project.org/git/people/hemant/u-boot-dm646x.git;protocol=git"
+SRC_URI_dm6467-evm   += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_dm6467-evm    = "b037106746e5b942d7ef06bfcd776a7cdfe32f68"
 PV_dm6467-evm        = "1.3.4+${PR}+gitr${SRCREV}"
 
 SRC_URI_dm6467t-evm  = "git://arago-project.org/git/people/hemant/u-boot-dm646x.git;protocol=git"
+SRC_URI_dm6467t-evm  += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_dm6467t-evm   = "b037106746e5b942d7ef06bfcd776a7cdfe32f68"
 PV_dm6467t-evm       = "1.3.4+${PR}+gitr${SRCREV}"
 
 # OMAPL da380-omapl137/da850-omapl138-evm/hawkboard - PSP 3.20.00.07 (Beta)
 
 SRC_URI_da830-omapl137-evm = "git://arago-project.org/git/people/sekhar/u-boot-omapl1.git;protocol=git;branch=master"
+SRC_URI_da830-omap1137-evm += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_da830-omapl137-evm  = "0d291f2f255e6d66a78b3dc2445362a96ae39a57"
 PV_da830-omapl137-evm      = "2009.08+gitr${SRCREV}"
 
 SRC_URI_da850-omapl138-evm = "git://arago-project.org/git/people/sekhar/u-boot-omapl1.git;protocol=git;branch=master"
+SRC_URI_da830-omap1138-evm += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_da850-omapl138-evm  = "0d291f2f255e6d66a78b3dc2445362a96ae39a57"
 PV_da850-omapl138-evm      = "2009.08+gitr${SRCREV}"
 
 SRC_URI_hawkboard          = "git://arago-project.org/git/people/sekhar/u-boot-omapl1.git;protocol=git;branch=master"
+SRC_URI_hawkboard          += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_hawkboard           = "0d291f2f255e6d66a78b3dc2445362a96ae39a57"
 PV_hawkboard               = "2009.08+gitr${SRCREV}"
 
 SRC_URI_dm355-leopard = "git://www.denx.de/git/u-boot-arm.git;protocol=git;branch=next \
                         file://leopardboard-support.patch;patch=1 \
 "
+SRC_URI_dm355-leopard += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_dm355-leopard = "86d5c98d3d97d631b1d3a5f5e6a17e87c99b42cf"
 PV_dm355-leopard = "2009.05+2009.06-rc2+gitr${SRCREV}"
 
 SRC_URI_neuros-osd2 = "git://github.com/neuros/u-boot.git;protocol=git;branch=neuros"
+SRC_URI_neuros-osd2 += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_neuros-osd2 = "8de979d346624c0e4cfe2e5c0f08ce20ca4b5d14"
 
 SRC_URI_sequoia = "git://www.denx.de/git/u-boot.git;protocol=git"
 SRCREV_sequoa = "cf3b41e0c1111dbb865b6e34e9f3c3d3145a6093"
 
 SRC_URI_sequoia = "git://www.denx.de/git/u-boot.git;protocol=git;tag=cf3b41e0c1111dbb865b6e34e9f3c3d3145a6093 "
+SRC_URI_sequoia += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 
 SRC_URI_mini2440 = "git://repo.or.cz/u-boot-openmoko/mini2440.git;protocol=git;branch=dev-mini2440-stable"
+SRC_URI_mini2440 += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_mini2440 = "3516c35fb777ca959e5cadf2156a792ca10e1cff"
 
 SRC_URI_micro2440 = "git://repo.or.cz/u-boot-openmoko/mini2440.git;protocol=git;branch=dev-mini2440-stable"
+SRC_URI_micro2440 += "file://u-boot-remove-inline-of-weak-functions.patch;patch=1"
 SRCREV_micro2440 = "3516c35fb777ca959e5cadf2156a792ca10e1cff"
 
 SRC_URI_neuros-osd2 += "file://Makefile-fix.patch;patch=1"
@@ -165,7 +185,6 @@ SRCREV_sheevaplug = "119b9942da2e450d4e525fc004208dd7f7d062e0"
 
 S = "${WORKDIR}/git"
 
-
 do_configure_prepend_akita() {
         sed -i s:ROOT_FLASH_SIZE:${ROOT_FLASH_SIZE}:g ${S}/include/configs/akita.h
 }
-- 
1.5.4.3



