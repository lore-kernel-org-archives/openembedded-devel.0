Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PO6AZ-0002JC-Gf
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 11:13:44 +0100
Received: by fxm17 with SMTP id 17so5528254fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=IkRZmQG/KzE2MF3jWgfjWFpx+lnLoE0KrTYo9BeMHf4=;
	b=ayLtMGjje8T31xKZyf57MamSNk0jIOqFAxRR+HvLDlbx+vEWxerflZ6Aj+2eXPwQya
	IkL/6kXTb7mhK5caw+OcWVXv3E83xM/GGS7UPf0TNXEQhi8fFbTBtOnwPtsqK8MkAjNx
	bIQm6G0OAK0RVlWjk7UwHkF0y45hnHC3QW/jc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xaTvMc0/0zs+k7VO3NxaMHLVdg5fWAMnzkbQtDY1UnYgyGRlOyjtJRwf995HNpuno5
	heFpktV5PDyRWHmxfndPGKc8NrFs5Hoh5UoIlD6NKobICCC8MVX6OYhRUdwVsAwEO3QB
	cqyT9yYvT69P0Q9q3mYvtg/qmnrcNg069ZYgo=
Received: by 10.223.125.136 with SMTP id y8mr299804far.149.1291284740772;
	Thu, 02 Dec 2010 02:12:20 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n26sm106246fam.37.2010.12.02.02.12.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Dec 2010 02:12:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Dec 2010 11:12:14 +0100
Message-Id: <1291284734-27056-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] nokia900.conf: MACHINE_EXTRA_RRECOMMENDS add needed kernel-modules
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
X-List-Received-Date: Thu, 02 Dec 2010 10:13:44 -0000

* list all which are loaded after boot (ie with udev)
* remove those which are handled by some task-base-* anyways (like g-ether, vfat etc)
* remove those which are in RDEPENDS of some already listed module here
---
 conf/machine/nokia900.conf |   36 +++++++++++++++++++++++++++++++++++-
 recipes/tasks/task-base.bb |    2 +-
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/conf/machine/nokia900.conf b/conf/machine/nokia900.conf
index caeb00a..5ed0dae 100644
--- a/conf/machine/nokia900.conf
+++ b/conf/machine/nokia900.conf
@@ -14,7 +14,41 @@ XSERVER = "xserver-xorg \
            xf86-input-keyboard \
            xf86-video-omapfb "
 
-MACHINE_EXTRA_RRECOMMENDS = "watchdog"
+MACHINE_EXTRA_RRECOMMENDS = "watchdog \
+# common \
+  kernel-module-tsl2563 \
+  kernel-module-smc91x \
+  kernel-module-leds-lp5523 \
+# 2.6.28 \
+  kernel-module-adp1653 \
+  kernel-module-ad5820 \
+  kernel-module-et8ek8 \
+  kernel-module-fmtx-si4713 \
+  kernel-module-leds-twl4030-vibra \
+  kernel-module-lis302dl \
+  kernel-module-nokia-av \
+  kernel-module-omap-ssi \
+  kernel-module-omap-wdt \
+  kernel-module-phonet \
+  kernel-module-radio-bcm2048 \
+  kernel-module-rtc-twl4030 \
+  kernel-module-smia-sensor \
+  kernel-module-ssi-mcsaab-imp \
+  kernel-module-tsc2005 \
+  kernel-module-twl4030-wdt \
+  kernel-module-wl12xx \
+# 2.6.35 \
+  kernel-module-cmt-speech \
+  kernel-module-gpio-keys \
+  kernel-module-hci-h4p \
+  kernel-module-hsi-char \
+  kernel-module-isp1704-charger \
+  kernel-module-lis3lv02d-i2c \
+  kernel-module-mailbox-mach \
+  kernel-module-rtc-twl \
+  kernel-module-twl4030-pwrbutton \
+  kernel-module-wl1251-spi \
+"
 
 GUI_MACHINE_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "800"
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index 6e2d9f0..32d871d 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r91"
+PR = "r92"
 
 inherit task
 
-- 
1.7.3.2



