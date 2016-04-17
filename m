Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1675C606BF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2016 22:28:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y144so20052439wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2016 15:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WLAFmptexq6TlGCL5Vs2ghy8M/iRMFlSCe4lJjaRSqU=;
	b=WefM+/LzMEjZq6wA9Y/LtdfmYYA3836yORj79rVcJPB6SZrPHDqQQ3t7anNbpOParD
	7Ei/Qm05HJUfH8+NOVKjDqNS6A2MMe/g9Utcx0aCh1tpxwQa4t6Vjfr4zfHsufeNm1OF
	hOeOsLkytGgbU8lqkKDR1/WWRWkChDrT+bOoSlDZI807Tt+jFCX7bZLSpef5NoIAxcZi
	rgT0SY44BkMHV4iiIl1cNcu58gAxzXk0xQ2z+EZQGCgoSFDlSHiFw6ciChx8Xbo7URRx
	Fnm5J7ZREMjWfecfOxxHviajRuaBrJNhMxKV2HQnazrT3taMCObrIQu2MJzaYwaKUpiz
	4scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WLAFmptexq6TlGCL5Vs2ghy8M/iRMFlSCe4lJjaRSqU=;
	b=WltN5zGDFyVvlxpxDPACGQ/pSiSgLPao5u67o2RBCF+m2yWUEpmZW0jg3ncKtOEV8G
	kw7IWj00lXDWhP0DL0WJwGoFHmexLl8EoQt/TlKLxYpGvGfNMjDLN79ktBLr+Rq1sAYD
	+iqneYLe3a7a1Gv6gP6tPIsY75V5dU3fTplS0dAqM8aB4+USjSuV2s3QzxPENxUePxRF
	s/4KYZqC7AByd3ZO8EygGrJWNqDYsSLOV/taAHhxP7op8SWNcKnZfYifLonnSbMMtq1q
	0w5uvymmiFsEd2jZXV3DSmVwz8o5J3Umm39VXjdZ6CtNtBBvvZLdPTikO9rfqan/VrC+
	2vQA==
X-Gm-Message-State: AOPr4FVg4tGfakLAtmnn3WumX5zY4c+FGENpzcqz5odBJqRaHAlTcfM/iA70W7TpzrkKmQ==
X-Received: by 10.28.54.208 with SMTP id y77mr14484522wmh.17.1460932123968;
	Sun, 17 Apr 2016 15:28:43 -0700 (PDT)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host122-91-dynamic.45-79-r.retail.telecomitalia.it. [79.45.91.122])
	by smtp.gmail.com with ESMTPSA id
	j71sm23466248wmj.21.2016.04.17.15.28.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Apr 2016 15:28:43 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 00:28:20 +0200
Message-Id: <1460932100-11873-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld] Pull Request 2016-04-18
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
X-List-Received-Date: Sun, 17 Apr 2016 22:28:44 -0000

The following changes since commit 526de214f4f88b41c41adc74da30637757acbee7:

  linux-handheld: initial commit of v. 4.4 for PXA and SA1100 devices (2016-01-19 22:50:27 +0100)

are available in the git repository at:

  https://github.com/LinuxPDA/meta-handheld master

for you to fetch changes up to 6e6542bd551df995f6e1b205becd1324632c0bbd:

  zaurus.inc: mention linux-kexecboot in the notes for the installer (2016-04-17 22:51:56 +0200)

----------------------------------------------------------------
Andrea Adami (10):
      linux-gcw0-kexecboot: fix INITRAMFS_TASK matching oe-core changes
      zaurusd: fix build using autotools-brokensep
      linux-handheld_4.4: update to 4.4.6
      linux-gcw0-kexecboot: skip do_shared_workdir
      linux-gcw0-kexecboot: parametrize the 'require' using ${PV}
      linux-handheld_4.4: update defconfigs for spitz/akita
      linux-handheld_4.4: upate to 4.4.7
      linux-kexecboot_4.4: Initial commit for Zaurus devices
      zaurus-installer: switch to linux-kexecboot
      zaurus.inc: mention linux-kexecboot in the notes for the installer

 conf/machine/include/zaurus.inc                    |   4 +-
 recipes-bsp/zaurus-utils/zaurus-installer.bb       |   4 +-
 recipes-bsp/zaurusd/zaurusd_git.bb                 |   2 +-
 recipes-kernel/linux/linux-gcw0-kexecboot_4.0.bb   |   5 +-
 .../linux/linux-handheld-4.4/akita/defconfig       |   5 +-
 .../linux/linux-handheld-4.4/spitz/defconfig       |   4 +-
 recipes-kernel/linux/linux-handheld_4.4.bb         |   6 +-
 .../linux/linux-kexecboot-4.4/akita/defconfig      | 135 +++++++++++++++++
 .../linux/linux-kexecboot-4.4/c7x0/defconfig       | 134 +++++++++++++++++
 .../linux/linux-kexecboot-4.4/collie/defconfig     | 163 +++++++++++++++++++++
 .../linux/linux-kexecboot-4.4/poodle/defconfig     | 139 ++++++++++++++++++
 .../linux/linux-kexecboot-4.4/spitz/3200-mtd.patch |  13 ++
 .../linux/linux-kexecboot-4.4/spitz/defconfig      | 134 +++++++++++++++++
 .../linux/linux-kexecboot-4.4/tosa/defconfig       | 136 +++++++++++++++++
 recipes-kernel/linux/linux-kexecboot_4.4.bb        |  42 ++++++
 15 files changed, 916 insertions(+), 10 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/spitz/3200-mtd.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot_4.4.bb

-- 
1.9.1


