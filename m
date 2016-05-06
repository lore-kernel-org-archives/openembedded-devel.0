Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E536975D4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 16:02:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r12so9443338wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b6ys1f/5oNNLeyYy8843SHNGV24PVOb6fiOoQ1MOMp8=;
	b=KxAmNkXaZuDER/byEWKIXGmc7b49Zjr1Y+9ZKzr4zJSXxqlRjiRq3MjrGqanNXfDJh
	VmbE27a3l6rNpIv8LyGHlBKR1yus6y+qlBy/jeY2dYr3rnCPcpzx/gZQzQ8P9Dhy6qLJ
	8g5zys7sk1f+kc6l2jjPL0uXDyJ6FeA9YWm9+gifOAwf+Wdfjcwgc+ESiiPVaTOtJ6We
	juHtizYccyZ7rsiQXWpFS+alEIJ4uY2yqRZ1v9Xhm5AhbT5Xb0M6DDcBIa1RDuEx7EOh
	9yiYzBKZimcY64WcX74XNXDncr5dzbL5efRbt10AzGjSlBGH2iQwxl0dhYBmVGxUk3WO
	203A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b6ys1f/5oNNLeyYy8843SHNGV24PVOb6fiOoQ1MOMp8=;
	b=GvsEwhOSChbSnDjRoND1dlBbwe4oHMhUanjkI/m8AqcWVvnxH0DVxGgWjn5pweJw5R
	icrH41ibEPcAs82DpdD5GbQW+lh+LQKni548elsUuFyOMPIyE7ahYryC5TVMpHrln+gO
	lfAJZzj3VHnrTndt8ZqBMx6OsSZ0DwK3uq+c6/7HEDk5yDGHW7kR2/qmNOirKcBtFG+a
	4CsmSlYKKDBQENHKEIKtkPAKpsQm4uNx9TL83ph8Iqrz0SlqCQc5kdp6e19mZD7PUszE
	9p8gkZ7l3dJ6sytiE+HToWsD8LUAIhxe7gVGT/IwOAc/3NgdAcuGkcJ7N9KQaqD9p59A
	J05Q==
X-Gm-Message-State: AOPr4FWu3boLC/uCpaCe7e4y1lX/ubPO3t+vEc1L7HEgEjMorZKuGtkky3EzFYLCQ2haPA==
X-Received: by 10.28.48.203 with SMTP id w194mr10764840wmw.67.1462550527957;
	Fri, 06 May 2016 09:02:07 -0700 (PDT)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host16-38-dynamic.45-79-r.retail.telecomitalia.it. [79.45.38.16])
	by smtp.gmail.com with ESMTPSA id
	hk7sm15600184wjb.5.2016.05.06.09.01.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2016 09:02:07 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 18:01:40 +0200
Message-Id: <cover.1462550232.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld] Pull Request 2016-05-06
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
X-List-Received-Date: Fri, 06 May 2016 16:02:08 -0000

The following changes since commit 796a12685dc6a32f6ccc1cb048291f8143d4c9fe:

  zaurus.inc: mention linux-kexecboot in the notes for the installer (2016-04-24 00:53:16 +0200)

are available in the git repository at:

  https://github.com/LinuxPDA/meta-handheld master

for you to fetch changes up to 8155d87e06a4198542c559f77883bf6411021bef:

  linux-handheld_4.4: unify spitz and akita configuration (2016-05-06 15:47:56 +0200)

----------------------------------------------------------------
Andrea Adami (14):
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

 conf/machine/include/zaurus.inc                    |  4 +-
 recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb      | 18 ++--
 ...-fix-module-autoload-for-platform-drivers.patch | 95 ++++++++++++++++++++++
 .../linux/linux-handheld-4.4/akita/defconfig       |  2 +-
 .../linux/linux-handheld-4.4/c7x0/defconfig        |  1 +
 .../linux/linux-handheld-4.4/collie/defconfig      |  4 +-
 ...-emit-added-moved-or-deleted-file-warning.patch | 26 ------
 .../0090-locomokbd.c-fix-missing-KEY_CENTER.patch  | 39 +++++++++
 ...omokbd.c-invert-KEY_ENTER-and-KEY_KPENTER.patch | 31 +++++++
 .../linux/linux-handheld-4.4/poodle/defconfig      |  4 +-
 .../snd-soc-pxa2xx-modalias.patch                  |  7 --
 .../linux/linux-handheld-4.4/spitz/defconfig       |  4 +-
 .../linux/linux-handheld-4.4/tosa/defconfig        |  2 +-
 recipes-kernel/linux/linux-handheld_4.4.bb         | 11 +--
 .../linux/linux-kexecboot-4.4/akita/defconfig      | 51 ++++++++++--
 .../linux/linux-kexecboot-4.4/c7x0/defconfig       | 51 ++++++++++--
 .../linux/linux-kexecboot-4.4/collie/defconfig     | 23 +++++-
 .../linux/linux-kexecboot-4.4/poodle/defconfig     | 52 +++++++++---
 .../linux/linux-kexecboot-4.4/spitz/defconfig      | 52 ++++++++++--
 .../linux/linux-kexecboot-4.4/tosa/defconfig       | 73 +++++++++++++----
 recipes-kernel/linux/linux-kexecboot_4.4.bb        |  2 +
 21 files changed, 440 insertions(+), 112 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/ASoC-pxa-fix-module-autoload-for-platform-drivers.patch
 delete mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0039-XXX-don-t-emit-added-moved-or-deleted-file-warning.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0090-locomokbd.c-fix-missing-KEY_CENTER.patch
 create mode 100644 recipes-kernel/linux/linux-handheld-4.4/locomo/0091-locomokbd.c-invert-KEY_ENTER-and-KEY_KPENTER.patch
 delete mode 100644 recipes-kernel/linux/linux-handheld-4.4/snd-soc-pxa2xx-modalias.patch
-- 
1.9.1


