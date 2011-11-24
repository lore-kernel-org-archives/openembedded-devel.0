Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTWTa-00038J-Hj
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 11:24:18 +0100
Received: by wwo1 with SMTP id 1so2939576wwo.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 02:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3MYjiZM+yrEc1dQI/W7uSXafZrLfczhDpJ1ZReHhYkg=;
	b=RhoqPgFougGKFmyNsXnJ1TtaX4Hi/8Vhmiz+eH28Pv6DHTEYtxl8yJzkZguJeo9B3F
	FFD5n1jmGyeA9j3J7sBBFlEzEd5wOfIg+TNwf2XnlX/NAOMf/cIIQ6UWY8rsRuZ5FhhB
	aS+RuJrjvkmNXcaa+xVRt/BPeqWW7Qwxzhspo=
Received: by 10.227.205.135 with SMTP id fq7mr17563892wbb.19.1322129861569;
	Thu, 24 Nov 2011 02:17:41 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	fy13sm23684222wbb.18.2011.11.24.02.17.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:17:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 11:17:33 +0100
Message-Id: <cover.1322129758.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <1864854.crejHBLR9b@helios>
References: <1864854.crejHBLR9b@helios>
Subject: [meta-handheld 0/6] Kernel upgrade
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
X-List-Received-Date: Thu, 24 Nov 2011 10:24:18 -0000

Removed changes for iPAQs.

The following changes since commit 2ed328bd842c96496fb5bbeecd3f6c7ed2df4c65:

  zaurus.inc: use xserver-xorg-lite (2011-11-24 00:07:54 +0000)

are available in the git repository at:
  git://gitorious.org/shr/meta-handheld jansa/pull

Andrea Adami (2):
  linux(kexecboot): initial commit of kernel 3.1 updated to patchset 1
  linux(kexecboot): update from 3.1.1 to 3.1.2

Martin Jansa (4):
  linux-kexecboot: use kernel_conf_variable like linux.inc does and
    respect CMDLINE_DEBUG
  linux-kexecboot: don't disable DEBUG, PRINTK, BUG with CMDLINE_DEBUG
    not just loglevel=3
  linux-git: move CMDLINE_DEBUG to linux-git.inc to be used also for
    linux-kexecboot
  linux-git: upgrade to 3.2.0-rc3

 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 ++
 recipes-kernel/linux/linux-3.1/akita/defconfig     |  378 +++++++++++++++++++
 recipes-kernel/linux/linux-3.1/c7x0/defconfig      |  316 ++++++++++++++++
 recipes-kernel/linux/linux-3.1/collie/defconfig    |  322 +++++++++++++++++
 .../linux/linux-3.1/locomo_kbd_tweak-r2.patch      |   66 ++++
 recipes-kernel/linux/linux-3.1/poodle/defconfig    |  317 ++++++++++++++++
 recipes-kernel/linux/linux-3.1/spitz/defconfig     |  378 +++++++++++++++++++
 recipes-kernel/linux/linux-3.1/tosa/defconfig      |  379 ++++++++++++++++++++
 recipes-kernel/linux/linux-git.inc                 |    8 +-
 ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 ++
 .../linux/linux-kexecboot-3.1/akita/defconfig      |  132 +++++++
 .../linux/linux-kexecboot-3.1/c7x0/defconfig       |  134 +++++++
 .../linux/linux-kexecboot-3.1/collie/defconfig     |  144 ++++++++
 .../linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch  |   66 ++++
 .../linux/linux-kexecboot-3.1/poodle/defconfig     |  136 +++++++
 .../linux/linux-kexecboot-3.1/spitz/defconfig      |  132 +++++++
 .../linux/linux-kexecboot-3.1/tosa/defconfig       |  134 +++++++
 recipes-kernel/linux/linux-kexecboot.inc           |  128 ++++----
 .../linux/linux-kexecboot/spitz/defconfig          |    7 +-
 recipes-kernel/linux/linux-kexecboot_3.1.bb        |   26 ++
 recipes-kernel/linux/linux.inc                     |    4 +-
 recipes-kernel/linux/linux/spitz/defconfig         |   26 +-
 recipes-kernel/linux/linux_3.1.bb                  |   25 ++
 recipes-kernel/linux/linux_git.bb                  |    1 -
 24 files changed, 3238 insertions(+), 89 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-3.1/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-3.1/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.1/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bb
 create mode 100644 recipes-kernel/linux/linux_3.1.bb

-- 
1.7.8.rc3



