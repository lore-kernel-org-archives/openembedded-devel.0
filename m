Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UMb4j-00074B-H4
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 11:30:49 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id E8A3CEA042
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2013 11:23:21 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 7E80BA4063C; Mon,  1 Apr 2013 11:13:59 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2013 11:13:24 +0200
Message-Id: <cover.1364806552.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-handheld][PATCH 0/2] Pull request 20130401
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
X-List-Received-Date: Mon, 01 Apr 2013 09:30:49 -0000

Hello,

The patches that come as a follow-up of this message add machine
support for Qi-Hardware's Ben Nanonote handheld.
The recipes were imported from "oe-classic" and fixed to comply to the
rules in oe-core. This work is intended to be used by the JLime
distribution which is being ported to oe-core.

The modifications are done on top of the master branch in the
meta-handheld layer.
Please pull into the meta-handheld layer.

The following changes since commit a268810f7c2c1f13e01cc02bcddc23c46118551d:

  linux-yocto-tiny-kexecboot: add patch fixing mtd on SL-C3200 (2013-03-20 09:23:00 +0000)

are available in the git repository at:

  git://seketeli.fr/~apelete/meta-handheld.git add-nanonote

Apelete Seketeli (2):
  ben-nanonote: import ben-nanonote machine support
  ben-nanonote: clean machine conf according to oe-core rules

 conf/machine/ben-nanonote.conf                     |   29 +
 .../config-ben-nanonote                            | 1301 ++++++++++
 .../jz4740-udc.patch                               | 2561 ++++++++++++++++++++
 .../logo_linux_clut224.tar.gz                      |  Bin 0 -> 8416 bytes
 .../modifier-keys.patch                            |  604 +++++
 .../linux/linux-jlime-ben-nanonote_2.6.36.bb       |   51 +
 6 files changed, 4546 insertions(+)
 create mode 100644 conf/machine/ben-nanonote.conf
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/logo_linux_clut224.tar.gz
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote_2.6.36.bb

-- 
1.7.10.4



