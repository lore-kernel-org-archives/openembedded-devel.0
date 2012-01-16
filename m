Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmaIf-0001qM-Au
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 01:19:51 +0100
Received: from mizar.localdomain (87.5.74.30) by smtp206.alice.it (8.6.023.02)
	id 4ECA607907BDF9E6; Mon, 16 Jan 2012 01:12:14 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jan 2012 01:12:08 +0100
Message-Id: <1326672731-7001-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld] [PATCH 0/3] [zaurus] rely on devtmpfs in kernel
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
X-List-Received-Date: Mon, 16 Jan 2012 00:19:51 -0000

* No need for static device tables when using devtmpfs.
* The /dev directory must exist, though: kexecboot provides it
* Bump to latest kexecboot to manage the empty /dev and
* increase PR of linux-kexecboot to keep in synch.

Andrea Adami (3):
  kexecboot_git: move to 8f1d3cc3d9c650c6a6c88f83071185d6ee0ef9c7
  linux-kexecboot: bump INC_PR to follow kexecboot upgrade
  zaurus.inc: don't install device nodes, rely on devtmpfs

 conf/machine/include/zaurus.inc              |    2 ++
 recipes-bsp/kexecboot/kexecboot-klibc_git.bb |    4 ++--
 recipes-bsp/kexecboot/kexecboot.inc          |    3 ++-
 recipes-bsp/kexecboot/kexecboot_git.bb       |    4 ++--
 recipes-kernel/linux/linux-kexecboot.inc     |    2 +-
 5 files changed, 9 insertions(+), 6 deletions(-)

-- 
1.7.3.4



