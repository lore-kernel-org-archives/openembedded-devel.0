Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OguQ1-0006i6-Fr
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 08:59:12 +0200
Received: by pxi16 with SMTP id 16so221448pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 23:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=gegV1eIc75DBWMF+HEOj/1wGPsVQgjqCwMlH2ccfqrM=;
	b=NkJTSiieHMJC7xLqNDdu2A1JxdOla6XIPPKO/eBG8svT+h9umKyOfVC+tf9krXQXnK
	xmVAzv1BbrwMFi615xbBbMm4p23wA+bJ/0Yrh6x6R1r397ecdhcSjQl0FnjjJPcRszef
	l8C5eqWRmtKwoxoWH2RvgHEF2nTFHNlXjakYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=H2lZWc31d4K69I4xarx/aR7EWXF2uLeyym1gZO+mIYkiUkxuYlF3xot/XFiiMiboxU
	U54AO8682e21Z6cC5PcGu/70KtbATTw6ijdetyA72zTv2DdUYd1lf4bO51xfzWNF8KvN
	NPBZEFTMxAphzLgRs7Tt+6PI6TiyAPJxndFBk=
Received: by 10.142.172.5 with SMTP id u5mr3656830wfe.148.1280991540197;
	Wed, 04 Aug 2010 23:59:00 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	w27sm11493362wfd.5.2010.08.04.23.58.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 23:58:59 -0700 (PDT)
Message-ID: <4C5A612E.9040702@gmail.com>
Date: Thu, 05 Aug 2010 16:28:54 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Remove redundant dependencies upon opkg and opkg-collateral.
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
X-List-Received-Date: Thu, 05 Aug 2010 06:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

rootfs_ipk.bbclass already pulls these in, so avoid some confusion.

This is totally untested.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/images/base-image.bb        |    5 -----
 recipes/images/minimal-gpe-image.bb |    1 -
 recipes/images/nas-server-image.bb  |    3 ---
 recipes/images/x11-sato-image.bb    |    2 --
 recipes/tasks/task-slugos.bb        |    1 -
 5 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/recipes/images/base-image.bb b/recipes/images/base-image.bb
index ee1f115..51d6d34 100644
--- a/recipes/images/base-image.bb
+++ b/recipes/images/base-image.bb
@@ -20,9 +20,6 @@ IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 DISTRO_SSH_DAEMON ?= "dropbear"
 
-IPKG_VARIANT ?= "opkg"
-DISTRO_PACKAGE_MANAGER ?= "${IPKG_VARIANT}"
-
 # FIXME: We need a distro-indendent way of specifying feed configs.
 # Once the RFC for the DISTRO_FEED_CONFIGS variable name is approved,
 # we can remove this default definition and set it in the distro config.
@@ -31,7 +28,6 @@ DISTRO_FEED_CONFIGS ?= "${ANGSTROM_FEED_CONFIGS}"
 DEPENDS = "\
 	task-boot \
 	${DISTRO_SSH_DAEMON} \
-	${DISTRO_PACKAGE_MANAGER} \
 	${DISTRO_FEED_CONFIGS} \
 	${@base_contains('MACHINE_FEATURES', 'ext2', 'task-base-ext2', '', d)} \
 	${@base_contains('MACHINE_FEATURES', 'usbhost', 'task-base-usbhost', '', d)} \
@@ -40,7 +36,6 @@ DEPENDS = "\
 IMAGE_INSTALL = "\
 	task-boot \
 	${DISTRO_SSH_DAEMON} \
-	${DISTRO_PACKAGE_MANAGER} \
 	${DISTRO_FEED_CONFIGS} \
 	${@base_contains('MACHINE_FEATURES', 'ext2', 'task-base-ext2', '', d)} \
 	${@base_contains('MACHINE_FEATURES', 'usbhost', 'task-base-usbhost', '', d)} \
diff --git a/recipes/images/minimal-gpe-image.bb b/recipes/images/minimal-gpe-image.bb
index 0c5c863..b8ddacb 100644
--- a/recipes/images/minimal-gpe-image.bb
+++ b/recipes/images/minimal-gpe-image.bb
@@ -17,7 +17,6 @@ IMAGE_INSTALL = "\
     matchbox-wm \
     gpe-terminal \
     angstrom-feed-configs \
-    opkg opkg-collateral \
     ${SPLASH} \
     "
 
diff --git a/recipes/images/nas-server-image.bb b/recipes/images/nas-server-image.bb
index 61e8296..f26a357 100644
--- a/recipes/images/nas-server-image.bb
+++ b/recipes/images/nas-server-image.bb
@@ -20,14 +20,12 @@
 # intended to be distro-agnostic.
 
 DISTRO_SSH_DAEMON ?= "dropbear"
-DISTRO_PACKAGE_MANAGER ?= "opkg opkg-collateral"
 
 DEPENDS = "\
 	task-boot \
 	${@base_contains('MACHINE_FEATURES', 'apex', 'task-base-apex', '', d)} \
 	task-distro-base task-machine-base \
 	${DISTRO_SSH_DAEMON} \
-	${DISTRO_PACKAGE_MANAGER} \
 	${@base_contains('MACHINE_FEATURES', 'ext2', 'task-base-ext2', '', d)} \
 	${@base_contains('MACHINE_FEATURES', 'usbhost', 'task-base-usbhost', '', d)} \
 	task-nas-server-everything \
@@ -41,7 +39,6 @@ IMAGE_INSTALL = "\
 	task-boot \
 	${@base_contains('MACHINE_FEATURES', 'apex', 'task-base-apex', '', d)} \
 	${DISTRO_SSH_DAEMON} \
-	${DISTRO_PACKAGE_MANAGER} \
 	${@base_contains('MACHINE_FEATURES', 'ext2', 'task-base-ext2', '', d)} \
 	${@base_contains('MACHINE_FEATURES', 'usbhost', 'task-base-usbhost', '', d)} \
 	${IMAGE_INSTALL_TASKS} \
diff --git a/recipes/images/x11-sato-image.bb b/recipes/images/x11-sato-image.bb
index c2ed50e..f79beae 100644
--- a/recipes/images/x11-sato-image.bb
+++ b/recipes/images/x11-sato-image.bb
@@ -1,5 +1,4 @@
 DISTRO_SSH_DAEMON ?= "dropbear"
-DISTRO_PACKAGE_MANAGER ?= "opkg opkg-collateral"
 
 XSERVER ?= "xserver-kdrive-fbdev"
 
@@ -8,7 +7,6 @@ IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 IMAGE_INSTALL = "\
 	task-base-extended \
 	${DISTRO_SSH_DAEMON} \
-	${DISTRO_PACKAGE_MANAGER} \
 	pointercal \
 	matchbox-wm \
 	matchbox-keyboard matchbox-keyboard-applet matchbox-keyboard-im \
diff --git a/recipes/tasks/task-slugos.bb b/recipes/tasks/task-slugos.bb
index c007779..297d6f0 100644
--- a/recipes/tasks/task-slugos.bb
+++ b/recipes/tasks/task-slugos.bb
@@ -133,7 +133,6 @@ RDEPENDS_${PN} += "\
         busybox initscripts-slugos slugos-init \
         update-modules sysvinit udev \
 	module-init-tools modutils-initscripts \
-        opkg-collateral ${IPKG_VARIANT} \
 	libgcc \
 	beep \
 	util-linux-mount \
-- 
1.7.1



