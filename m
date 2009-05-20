Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M6geN-0005Bc-OI
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 09:55:48 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJX000WRMZZC5X8@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 May 2009 02:47:59 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0BA8A14AF1F; Wed,
	20 May 2009 03:47:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 03:47:50 -0400
Message-id: <1242805678-20645-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
Subject: [PATCHv2 0/8] Restructure TI DaVinci platforms and introduce new EVMs
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
X-List-Received-Date: Wed, 20 May 2009 07:55:58 -0000

Second version of the patches, addressing all the previous comments.

This set of patches restructures the support for Texas Instruments DaVinci
platforms by reusing the existing davinci-dvevm machine (renaming it along
the way to a more specific dm6446-evm) and introducing new EVM boards -
dm6467-evm, dm355-evm, dm365-evm and dm357-evm. Not all the boards have
proper support in the upstream kernel/u-boot yet.

Denys Dmytriyenko (8):
  davinci.inc: add common DaVinci machine configuration
  dm6446-evm: rename machine from davinci-dvevm and add defconfig
  dm6467-evm: add new machine definition and defconfig
  dm355-evm: add new machine definition and defconfig
  dm365-evm: add new machine definition
  dm357-evm: add new machine definition
  linux-davinci: build linux-davinci kernels for dm6446, dm6467 and
    dm355 EVMs
  u-boot: update git recipe with the new DaVinci EVMs

 conf/machine/davinci-dvevm.conf                  |   24 -
 conf/machine/dm355-evm.conf                      |    7 +
 conf/machine/dm357-evm.conf                      |    7 +
 conf/machine/dm365-evm.conf                      |    7 +
 conf/machine/dm6446-evm.conf                     |    7 +
 conf/machine/dm6467-evm.conf                     |    7 +
 conf/machine/include/davinci.inc                 |   26 +
 recipes/linux/linux-davinci/dm355-evm/defconfig  | 1223 +++++++++++++++
 recipes/linux/linux-davinci/dm6446-evm/defconfig | 1738 ++++++++++++++++++++++
 recipes/linux/linux-davinci/dm6467-evm/defconfig | 1241 +++++++++++++++
 recipes/linux/linux-davinci_2.6.28.bb            |    4 +-
 recipes/linux/linux-davinci_git.bb               |   11 +-
 recipes/u-boot/u-boot_git.bb                     |    6 +-
 13 files changed, 4278 insertions(+), 30 deletions(-)
 delete mode 100644 conf/machine/davinci-dvevm.conf
 create mode 100644 conf/machine/dm355-evm.conf
 create mode 100644 conf/machine/dm357-evm.conf
 create mode 100644 conf/machine/dm365-evm.conf
 create mode 100644 conf/machine/dm6446-evm.conf
 create mode 100644 conf/machine/dm6467-evm.conf
 create mode 100644 conf/machine/include/davinci.inc
 create mode 100644 recipes/linux/linux-davinci/dm355-evm/defconfig
 create mode 100644 recipes/linux/linux-davinci/dm6446-evm/defconfig
 create mode 100644 recipes/linux/linux-davinci/dm6467-evm/defconfig



