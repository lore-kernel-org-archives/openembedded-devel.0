Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OrX1j-0004fV-A7
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 16:14:13 +0200
Received: by bwz12 with SMTP id 12so1769747bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nzQxda1g2ChLdFopDIvb1k+9Xe2asK24Ej1loNy+rcs=;
	b=g5dqk6UIRdgsGngtuEcfWGF9cdN7Y7bqFBeMHKZuvnvTbbeQ0+RIhT8sBgcGsyBhxF
	5aTf6f13P1Q61EuktFh4ff0SiaFXVwHT3SPRbg25WF6entLjfboU8OwXdnYxa9jOSGlk
	LoAbok5z5l3+2oVGRSH8Uxzv+jEHU2Upv6hH8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gZIT1g3q+lD7eAYlv5w7KTCD2Td3DLJ2Qe8xZKjGOf19+tsIhSnfF0TEoIYI9WbNzo
	89DuuW+e+KNwCHz1fCRVllQH1y73pPnzgQAeeMbbsVjXEaALYC/ZFYZPGALQ2Dq8OL+i
	DCdV/oupZvQ2mp3M3XjfyHew+TV5Ug1FFdQ4c=
Received: by 10.204.8.10 with SMTP id f10mr509341bkf.181.1283523203973;
	Fri, 03 Sep 2010 07:13:23 -0700 (PDT)
Received: from localhost.localdomain (85-127-150-21.dynamic.xdsl-line.inode.at
	[85.127.150.21])
	by mx.google.com with ESMTPS id 11sm1500207bkj.23.2010.09.03.07.13.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Sep 2010 07:13:23 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Sep 2010 16:14:46 +0200
Message-Id: <1283523286-30999-3-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
References: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] u-boot: Unbreak u-boot 2009.08 for gcc >= 4.4
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
X-List-Received-Date: Fri, 03 Sep 2010 14:14:20 -0000

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../u-boot-2009.08/dont-inline-weak-symbols.patch  |   45 ++++++++++++++++++++
 recipes/u-boot/u-boot_2009.08.bb                   |    5 ++-
 2 files changed, 49 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch

diff --git a/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch b/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch
new file mode 100644
index 0000000..5931ccf
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.08/dont-inline-weak-symbols.patch
@@ -0,0 +1,45 @@
+Patch initially created by Ron Lee and archived in OE patchwork at
+http://patchwork.openembedded.org/patch/1534/.
+
+GCC 4.4 complains about this now.
+
+Signed-off-by: Ron Lee <ron@debian.org>
+---
+ lib_arm/board.c |   18 +++++++++---------
+ 1 files changed, 9 insertions(+), 9 deletions(-)
+
+--- a/lib_arm/board.c
++++ b/lib_arm/board.c
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
diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_2009.08.bb
index 506a0cb..868e618 100644
--- a/recipes/u-boot/u-boot_2009.08.bb
+++ b/recipes/u-boot/u-boot_2009.08.bb
@@ -7,7 +7,10 @@ DEFAULT_PREFERENCE_at91sam9g45ek = "1"
 DEFAULT_PREFERENCE_igep0020 = "1"
 DEFAULT_PREFERENCE_babbage  = "1"
 
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
+SRC_URI = "\
+    ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
+    file://dont-inline-weak-symbols.patch \
+"
 
 SRC_URI_append_igep0020 = " \
 	file://update-mach-types.patch \
-- 
1.7.1



