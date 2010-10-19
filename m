Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eQ-0001X9-VY
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:31 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so1460553fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=iq27uuUcqg9akXT0n1rl0JIlORM/zqMSuA2815S+KJs=;
	b=bzSLG3ilvPSrpS/x8C6V80xOFcKy+zoZF+FdNvQuScsYAly354D/i9kNT8nD8+xTDm
	rUwmTQGpgV5bucPe0DXM0Ap3+hz0zXj96tKqqd3LIptyBCWrDk535lpKCv0jKq5SCN/e
	100Oz8cr/hjrWiaZqD52mT3WuXr4YO+a/LZiw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lk/X/A8ilhmLVtrdd+D+5ZFy+EEGo2F5/jdiYVwODRfp14gFoGxMn17+usilFxO4Ad
	dR89AsBEopg3vB5xVCwf+wlTTlgWWRgBAWUfKY0fUGw4KQn9Zf72U+iXHUajCOptJWLq
	BSVAIIzc7NWrcrn242ip5byhlMerbAcuH50S8=
Received: by 10.102.244.17 with SMTP id r17mr588101muh.70.1287477238923;
	Tue, 19 Oct 2010 01:33:58 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n8sm3314766faa.7.2010.10.19.01.33.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:22 +0200
Message-Id: <1287477207-27752-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/13] om-3d7k: remove machine definition, because it was canceled long time ago
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/om-3d7k.conf |   39 ---------------------------------------
 1 files changed, 0 insertions(+), 39 deletions(-)
 delete mode 100644 conf/machine/om-3d7k.conf

diff --git a/conf/machine/om-3d7k.conf b/conf/machine/om-3d7k.conf
deleted file mode 100644
index 0ebd2a0..0000000
--- a/conf/machine/om-3d7k.conf
+++ /dev/null
@@ -1,39 +0,0 @@
-#-----------------------------------------------------------------------------
-#@TYPE: Machine
-#@NAME: Openmoko 3D7K
-#@DESCRIPTION: Machine configuration for the Openmoko 3D7K GSM phone
-#-----------------------------------------------------------------------------
-
-TARGET_ARCH = "arm"
-
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-2.6.29"
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
-
-MACHINE_FEATURES = "kernel26 apm alsa bluetooth usbgadget usbhost phone vfat ext2"
-MACHINE_DISPLAY_WIDTH_PIXELS = "480"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
-MACHINE_DISPLAY_ORIENTATION = "0"
-MACHINE_DISPLAY_PPI = "285"
-XSERVER = "xserver-xorg"
-
-# package machine specific modules
-MACHINE_EXTRA_RRECOMMENDS = "\
-  kernel-modules \
-"
-
-# device has 4 UARTS:
-# ttySAC0: mc75 GSM modem
-# ttySAC1: NC
-# ttySAC2: NC
-# ttySAC3: serial console
-SERIAL_CONSOLE = "115200 ttySAC3"
-USE_VT = "0"
-
-# used by some images
-ROOT_FLASH_SIZE = "256"
-
-# boots only from SD
-IMAGE_FSTYPES = "tar.bz2"
-
-# tune for S3C6410
-include conf/machine/include/tune-arm1176jzf-s.inc
-- 
1.7.3.1



