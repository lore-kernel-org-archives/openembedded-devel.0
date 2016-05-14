Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 89D116011C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2016 22:46:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r12so10640854wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2016 15:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RtSG6hcT+Ii9m8UPbQ6eJWUfvP0z31ADiLLboefe0zg=;
	b=bG5f/erzxNkMaW4lGr97/xwJj3auP8FfCLF7YleqcMPR+hMZNsGwFYNkPVoapckLFB
	reE4uIt3+vqvuQl2DqXZmux2eAns32zw1rOa2o711iNdrEC/GAznYqiaoURxcP9fGQQz
	+xygQyZirkhNnMaytQqYHZbuprbN9szgE6uJNNsgUTV6dAKQQLvuPOQTrdr1yY9XBAaC
	Y5N5xCmXGPqsf2cjksK67wEvoiKJ72wK4qxVLj4kfTQ5moUgwudjhoSk0qkH8B0xPZgq
	jlRydx92erlTiHksR3hoqcrbJeCoNQJM3ZzXDdidfhUPMYKEj87X+k18ODdYtIwh2rst
	N8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RtSG6hcT+Ii9m8UPbQ6eJWUfvP0z31ADiLLboefe0zg=;
	b=hkWum2H8cm+xVCzYCeo+LsbLQGX4RndszuLKB3fYXIJlbadOA0oq9GSSLqwEurf97J
	+YcjH1PkuR0uehjQ/tHQF6hvlbR5cHuERjY5L6U+fqdLwFvcXaUFNBKMCm6XS/umVKo9
	dJk3go6xG8SEqtdslKSlcddW8N0sxyRw8p0hrC7/6ACyXBUs5uwOx7OXO58RtPJCUBOK
	R5WlAeQWwk7ofsrJmxugIKltIe5rHCnLoVeckCZ9AYVb3gA6VXbKMvr5J3FX4awF44ZS
	K9UdSOpgw2aUuOrj+LEffoaQCliTMPd2yj92Wq4irAHUO1kZOL1GDPzikwPr/wheXjO0
	gfYA==
X-Gm-Message-State: AOPr4FVKsW5dZwQc0s4zg1w+4ZkkUXH374qG3a49mOcQNsAHUf+T2KBafy4dMLAPWAVPSA==
X-Received: by 10.28.2.67 with SMTP id 64mr9932625wmc.70.1463266009672;
	Sat, 14 May 2016 15:46:49 -0700 (PDT)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host175-222-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.222.175]) by smtp.gmail.com with ESMTPSA id
	m20sm10360523wma.23.2016.05.14.15.46.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 May 2016 15:46:49 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2016 00:46:42 +0200
Message-Id: <1463266002-7909-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld] Pull Request 2016-05-15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 May 2016 22:46:51 -0000

The following changes since commit 796a12685dc6a32f6ccc1cb048291f8143d4c9fe:

  zaurus.inc: mention linux-kexecboot in the notes for the installer (2016-04-24 00:53:16 +0200)

are available in the git repository at:

  https://github.com/LinuxPDA/meta-handheld master

for you to fetch changes up to 3bf35a8a1da5b1ef63acd70988fcb89128297d97:

  linux-handheld_4.4: update from 4.4.8 to 4.4.10 (2016-05-11 22:33:22 +0200)

----------------------------------------------------------------
Andrea Adami (15):
      zaurus-legacy-tar: update SRC_URI
      zaurus.inc: add BAD_RECOMMENDATIONS for eudev-hwdb (6MB)
      linux-handheld: update to 4.4.8
      linux-handheld: switch Zaurus to XZ kernel compression
      linux-kexecboot: switch to XZ kernel compression
      linux-handheld_4.4: readd LOCOMO_KEY_CENTER
      linux-kexecboot_4.4: readd the OK button for poodle and collie
      zaurus.inc: switch from cpio.lzma to cpio.xz
      linux-kexecboot_4.4: switch to cpio.xz for the initramfs
      linux-kexecboot_4.4: fix defconfig for collie
      linux-handheld-4.4: update patch for sound/soc/pxa module autoloading
      linux-handheld_4.4: remove extraneous patch
      linux-kexecboot_4.4: optimize and standardize Zaurus defconfigs
      linux-handheld_4.4: unify spitz and akita configuration
      linux-handheld_4.4: update from 4.4.8 to 4.4.10

 conf/machine/include/zaurus.inc                    |  4 +-
 recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb      | 18 ++--
 ...-fix-module-autoload-for-platform-drivers.patch | 95 ++++++++++++++++++++++
 .../linux/linux-handheld-4.4/akita/defconfig       |  2 +-
 .../linux/linux-handheld-4.4/c7x0/defconfig        |  1 +
 .../linux/linux-handheld-4.4/collie/defconfig      |  4 +-
 ...aengine-mmp-pdma-add-number-of-requestors.patch | 34 ++++++++
 ...-emit-added-moved-or-deleted-file-warning.patch | 26 ------
 .../0090-locomokbd.c-fix-missing-KEY_CENTER.patch  | 39 +++++++++
 ...omokbd.c-invert-KEY_ENTER-and-KEY_KPENTER.patch | 31 +++++++
 .../linux/linux-handheld-4.4/poodle/defconfig      |  4 +-
 .../snd-soc-pxa2xx-modalias.patch                  |  7 --
 .../linux/linux-handheld-4.4/spitz/defconfig       |  4 +-
 .../linux/linux-handheld-4.4/tosa/defconfig        |  2 +-
 recipes-kernel/linux/linux-handheld_4.4.bb         | 14 ++--
 .../linux/linux-kexecboot-4.4/akita/defconfig      | 51 ++++++++++--
 .../linux/linux-kexecboot-4.4/c7x0/defconfig       | 51 ++++++++++--
 .../linux/linux-kexecboot-4.4/collie/defconfig     | 23 +++++-
 .../linux/linux-kexecboot-4.4/poodle/defconfig     | 52 +++++++++---
 .../linux/linux-kexecboot-4.4/spitz/defconfig      | 52 ++++++++++--
 .../linux/linux-kexecboot-4.4/tosa/defconfig       | 73 +++++++++++++----
 recipes-kernel/linux/linux-kexecboot_4.4.bb        |  2 +
 22 files changed, 477 insertions(+), 112 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/ASoC-pxa-fix-module-autoload-for-platform-drivers.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/dmaengine-mmp-pdma-add-number-of-requestors.patch
 delete mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0039-XXX-don-t-emit-added-moved-or-deleted-file-warning.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0090-locomokbd.c-fix-missing-KEY_CENTER.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0091-locomokbd.c-invert-KEY_ENTER-and-KEY_KPENTER.patch
 delete mode 100644 recipes-kernel/linux/linux-handheld-4.4/snd-soc-pxa2xx-modalias.patch

-- 
1.9.1


