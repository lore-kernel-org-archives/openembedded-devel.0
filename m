Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rlmhj-000370-3s
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 20:22:23 +0100
Received: by eekd17 with SMTP id d17so947542eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2012 11:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a7pNdg1g7ZbIV9FuZcCyx1SzfxBIH/r8vhJvILXmXNA=;
	b=pd7Zvv4fVie3EBPTrgvHiDNt3FhKQDNs3JMgfsqkcogGfevOYoRfnVbZqyyfoMO6Vy
	Ml6upZdi2p54TuWbRwPlU8yaf1IgaVRqtYuuuPOAW1mewLBsyLyId4pVMZnAuzyge6gc
	zpfDEE8c3c3rcnwAbZBjONF0xfhQcryoUx7J0=
Received: by 10.213.35.145 with SMTP id p17mr253513ebd.58.1326482087480;
	Fri, 13 Jan 2012 11:14:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm33096748eef.7.2012.01.13.11.14.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jan 2012 11:14:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2012 20:14:39 +0100
Message-Id: <cover.1326481985.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [meta-handheld][PATCH 0/4] Kernel upgrade and small fixes
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
X-List-Received-Date: Fri, 13 Jan 2012 19:22:23 -0000

The following changes since commit d76030c7744dfb480c8d43073762d11dcae4893a:

  linux(-kexecboot): upgrade from 3.1.6 to 3.1.7 (2012-01-05 08:49:23 +0000)

are available in the git repository at:
  git://gitorious.org/shr/meta-handheld jansa/pull

Martin Jansa (4):
  zaurus.inc: weak assignment to IMAGE_FSTYPES
  linux(-kexecboot)-git: upgrade to 3.2.0-rc7
  linux(-kexecboot)-3.2: add 3.2.1 for spitz
  linux(-kexecboot)-3.1: move common stuff like SRC_URI and checksums
    to .inc file

 conf/machine/include/zaurus.inc                    |    2 +-
 recipes-kernel/linux/linux-3.1.inc                 |   19 +
 recipes-kernel/linux/linux-3.2.inc                 |   14 +
 recipes-kernel/linux/linux-3.2/spitz/defconfig     |  384 ++++++++++++++++++++
 recipes-kernel/linux/linux-git.inc                 |    4 +-
 .../linux/linux-kexecboot-3.2/spitz/defconfig      |  128 +++++++
 recipes-kernel/linux/linux-kexecboot_3.1.bb        |   21 +-
 recipes-kernel/linux/linux-kexecboot_3.2.bb        |    5 +
 recipes-kernel/linux/linux-kexecboot_git.bb        |    2 +
 recipes-kernel/linux/linux/spitz/defconfig         |    7 +
 recipes-kernel/linux/linux_3.1.bb                  |   21 +-
 recipes-kernel/linux/linux_3.2.bb                  |    4 +
 recipes-kernel/linux/linux_git.bb                  |    2 +
 13 files changed, 570 insertions(+), 43 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.1.inc
 create mode 100644 recipes-kernel/linux/linux-3.2.inc
 create mode 100644 recipes-kernel/linux/linux-3.2/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot-3.2/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-kexecboot_3.2.bb
 create mode 100644 recipes-kernel/linux/linux_3.2.bb

-- 
1.7.8.3



