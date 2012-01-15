Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmDgK-0006Ue-2q
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 01:10:44 +0100
Received: from mizar.localdomain (87.2.250.15) by smtp205.alice.it (8.6.023.02)
	id 4EECA2D803FF8D87; Sun, 15 Jan 2012 01:03:10 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jan 2012 01:03:04 +0100
Message-Id: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld] [PATCH 0/2] [Zaurus] Minor changes
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
X-List-Received-Date: Sun, 15 Jan 2012 00:10:44 -0000

* Standardize the initramfs-kexecboot images and adapt
* mimicking core-image-minimal-initramfs.
*
* Remove legacy device table for Zaurus, now using devtmpfs in kernel.

Andrea Adami (2):
  initramfs-kexecboot-* images: adapt to oe-core
  zaurus.inc: remove IMAGE_DEVICETABLE settings, now using devtmpfs

 conf/machine/include/zaurus.inc                    |    5 -----
 recipes-bsp/images/initramfs-kexecboot-image.bb    |    5 +++++
 .../images/initramfs-kexecboot-klibc-image.bb      |    2 ++
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
1.7.3.4



