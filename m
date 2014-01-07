Return-Path: <apelete@seketeli.net>
Received: from ms.seketeli.fr (seketeli.net [94.23.218.202])
	by mail.openembedded.org (Postfix) with ESMTP id 379F960D2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 18:44:24 +0000 (UTC)
Received: from amegan.ahome.fr (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.fr (Postfix) with ESMTPSA id 5962E2360059;
	Tue,  7 Jan 2014 19:44:25 +0100 (CET)
Received: by amegan.ahome.fr (Postfix, from userid 1000)
	id 2F66CA40051; Tue,  7 Jan 2014 19:31:26 +0100 (CET)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2014 19:31:02 +0100
Message-Id: <cover.1389118170.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [meta-handheld][PATCH 0/2] Pull request 20140107
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2014 18:44:25 -0000

Hello,

The Qi-Hardware community kernel now has an upstream compliant driver
to provide USB support for the Ben Nanonote, along with other features
and fixes.
The aforementioned changes were submitted upstream in order to have
full upstream support for the Ben kernel.

The patches that come as a follow-up of this message are an attempt to
provide an up-to-date kernel recipe for the Ben Nanonote in the
meantime, until the Qi-Hardware patches land upstream.

Changes were built from scratch and successfully tested on device.

The following changes since commit c82171b469e4515023908d86482df9baf7c5fc01:

  linux-yocto*: collie: update Partition Configuration Register patch (2013-12-31 18:38:11 +0100)

are available in the git repository at:

  git://git.seketeli.net/~apelete/meta-handheld.git update-ben-kernel-3.12

Apelete Seketeli (2):
  linux-jlime-ben-nanonote: update recipe to kernel 3.12
  linux-qi-ben-nanonote: rename previous linux-jlime-ben-nanonote
    recipe

 conf/machine/ben-nanonote.conf                     |    2 +-
 .../config-ben-nanonote                            | 1301 ----------
 .../fix-gcc-4.6.0-build-errors.patch               |  124 -
 .../jz4740-udc.patch                               | 2561 --------------------
 .../logo_linux_clut224.tar.gz                      |  Bin 8416 -> 0 bytes
 .../modifier-keys.patch                            |  604 -----
 ...ote_2.6.36.bb => linux-qi-ben-nanonote_3.12.bb} |   13 +-
 7 files changed, 4 insertions(+), 4601 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/config-ben-nanonote
 delete mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/jz4740-udc.patch
 delete mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/logo_linux_clut224.tar.gz
 delete mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/modifier-keys.patch
 rename recipes-kernel/linux/{linux-jlime-ben-nanonote_2.6.36.bb => linux-qi-ben-nanonote_3.12.bb} (68%)

-- 
1.7.10.4


