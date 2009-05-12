Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M3gN9-0007Ab-5E
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 03:01:31 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJI00BO4AIS9AFL@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	11 May 2009 19:54:34 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1439014AF5D; Mon,
	11 May 2009 20:54:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 20:54:20 -0400
Message-id: <1242089668-11610-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
Subject: [PATCH 0/8] Restructure TI DaVinci platforms and introduce new EVMs
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
X-List-Received-Date: Tue, 12 May 2009 01:01:31 -0000

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
 conf/machine/dm355-evm.conf                      |   13 +
 conf/machine/dm357-evm.conf                      |   13 +
 conf/machine/dm365-evm.conf                      |   13 +
 conf/machine/dm6446-evm.conf                     |   13 +
 conf/machine/dm6467-evm.conf                     |   13 +
 conf/machine/include/davinci.inc                 |   24 +
 recipes/linux/linux-davinci/dm355-evm/defconfig  | 1223 +++++++++++++++
 recipes/linux/linux-davinci/dm6446-evm/defconfig | 1738 ++++++++++++++++++++++
 recipes/linux/linux-davinci/dm6467-evm/defconfig | 1241 +++++++++++++++
 recipes/linux/linux-davinci_2.6.28.bb            |    4 +-
 recipes/linux/linux-davinci_git.bb               |   11 +-
 recipes/u-boot/u-boot_git.bb                     |    6 +-
 13 files changed, 4306 insertions(+), 30 deletions(-)
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



