Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1My1Q9-0005Ug-4c
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 12:49:32 +0200
Received: by fxm3 with SMTP id 3so11137228fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Tdn/tno4VwTDD6F694UJxyq/XzfizSQyYVf+/dzA+Vk=;
	b=D8Fwi6vOHx2TxzFO5WvmJ3ow+d0vL386NFWL+rkun2q8EBFvaE9u279QKyFEzUPbWB
	LIG0HLfxcvnQdgLXoxVG3dPYYPpBUdu3Z4xJvdh3qpkdha06BE8mxXpEMGs+qKEyyVwn
	JF8bDVu1EyxtvL+W9xvwFDW8QcZKAqBx70UDA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=bD2tE5uKfN3tmSBpicTezgVXrMjiye1W/8lTYruTqCmQ7NaAUfaKQFch/VX/NaVi1O
	i7M0tO6E/HC9bLZ67w45WMM7YJ/zfZJ+LfHAqg4CSmJ4Sfm/b4RObZyn8Uic9i/Tl0jM
	wAmcjwwhG24QDxz0pSljD8S3jwm/zsUYdVJJY=
Received: by 10.102.226.14 with SMTP id y14mr3588770mug.76.1255517314287;
	Wed, 14 Oct 2009 03:48:34 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j10sm2337461mue.36.2009.10.14.03.48.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Oct 2009 03:48:33 -0700 (PDT)
From: "Martin.Jansa" <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Oct 2009 12:48:28 +0200
Message-Id: <1255517308-31136-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1255517308-31136-1-git-send-email-Martin.Jansa@gmail.com>
References: <1255517308-31136-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] Fix preferred provider for mesa
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
X-List-Received-Date: Wed, 14 Oct 2009 10:49:32 -0000

---
 conf/distro/include/preferred-shr-versions.inc |    2 --
 conf/distro/include/shr-om-gta02-kms.conf      |    3 ---
 conf/distro/include/shr-om-gta02.conf          |    4 ++--
 conf/machine/om-gta02.conf                     |    1 -
 4 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 1df8df2..6b1d3bf 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -1207,8 +1207,6 @@ PREFERRED_VERSION_mdev ?= "1.2.1"
 PREFERRED_VERSION_mdk2 ?= "v33"
 PREFERRED_VERSION_memedit ?= "0.7"
 PREFERRED_VERSION_memtester ?= "4.0.6"
-PREFERRED_VERSION_mesa ?= "7.4"
-PREFERRED_VERSION_mesa-dri ?= "7.5.1"
 PREFERRED_VERSION_meta-e-x11 ?= "1.0"
 PREFERRED_VERSION_meta-e-x11-core ?= "1.0"
 PREFERRED_VERSION_meta-gpe ?= "1.0"
diff --git a/conf/distro/include/shr-om-gta02-kms.conf b/conf/distro/include/shr-om-gta02-kms.conf
index d57cc35..2ddce41 100644
--- a/conf/distro/include/shr-om-gta02-kms.conf
+++ b/conf/distro/include/shr-om-gta02-kms.conf
@@ -1,8 +1,5 @@
 # SHR-specific overrides for building KMS enabled system
 PREFERRED_PROVIDER_virtual/kernel = "linux-openmoko-shr-drm-devel"
-PREFERRED_PROVIDER_mesa = "mesa-dri"
 PREFERRED_PROVIDER_xf86-video-glamo = "xf86-video-glamo-kms"
 
-MACHINE_DRI_MODULES = "glamo"
-
 XSERVER = "xserver-xorg xf86-video-glamo-kms xf86-input-evdev xf86-input-keyboard xf86-input-mouse"
diff --git a/conf/distro/include/shr-om-gta02.conf b/conf/distro/include/shr-om-gta02.conf
index e66fba5..78d8e24 100644
--- a/conf/distro/include/shr-om-gta02.conf
+++ b/conf/distro/include/shr-om-gta02.conf
@@ -2,8 +2,8 @@
 PREFERRED_PROVIDER_virtual/kernel = "linux-openmoko-shr-devel"
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 PREFERRED_PROVIDER_xf86-video-glamo = "xf86-video-glamo"
-PREFERRED_PROVIDER_mesa = "mesa"
-PREFERRED_PROVIDER_drm = "libdrm"
+PREFERRED_PROVIDER_mesa = "mesa-dri"
+MACHINE_DRI_MODULES = "glamo"
 
 XSERVER = "xserver-xorg xf86-video-glamo xf86-input-evdev xf86-input-keyboard xf86-input-mouse"
 
diff --git a/conf/machine/om-gta02.conf b/conf/machine/om-gta02.conf
index ff7e8c0..ca45ddf 100644
--- a/conf/machine/om-gta02.conf
+++ b/conf/machine/om-gta02.conf
@@ -8,7 +8,6 @@ TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-openmoko-stable"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive-glamo"
-PREFERRED_PROVIDER_mesa ?= "mesa-dri"
 UBOOT_ENTRYPOINT = "30008000"
 
 MACHINE_FEATURES = "kernel26 apm alsa bluetooth gps usbgadget usbhost phone wifi vfat ext2"
-- 
1.6.5



