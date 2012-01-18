Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RnfRp-0004St-FF
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 01:01:45 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650162CF8C; Thu, 19 Jan 2012 00:54:06 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:52:56 +0100
Message-Id: <1326930779-21885-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld] [PATCH 0/3] do not force build of linux-kexecboot
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
X-List-Received-Date: Thu, 19 Jan 2012 00:01:45 -0000

* This patchset makes minor changes to the initramfs-kexecboot images
* in order to make clear there are two binaries inside.
* Following patches are Zaurus-specific and allow to build generic images
* without building zaurus-installer (which builds linux-kexecboot)

Andrea Adami (3):
  initramfs-kexecboot(-klibc)-image: explicitly install kexec(-klibc)
  kexecboot-cfg: Inhibit toolchain dependencies and echo
    $DISTRO_VERSION
  zaurus.inc: decouple build of zaurus-installer (and linux-kexecboot)

 conf/machine/include/initramfs-kexecboot.inc       |   18 ------------------
 conf/machine/include/zaurus.inc                    |   14 +++++++++-----
 recipes-bsp/images/initramfs-kexecboot-image.bb    |    2 +-
 .../images/initramfs-kexecboot-klibc-image.bb      |    2 +-
 recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb         |    6 ++++--
 5 files changed, 15 insertions(+), 27 deletions(-)
 delete mode 100644 conf/machine/include/initramfs-kexecboot.inc

-- 
1.7.3.4



