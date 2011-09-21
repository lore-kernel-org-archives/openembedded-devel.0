Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1R6Vep-0001W7-1v
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 00:52:47 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LRW00LA29YEPTC4@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	21 Sep 2011 17:47:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3649114AF5F; Wed,
	21 Sep 2011 18:47:02 -0400 (EDT)
Date: Wed, 21 Sep 2011 18:47:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110921224702.GM26078@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request 20110921
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
X-List-Received-Date: Wed, 21 Sep 2011 22:52:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 5 commits to gcc (4.5) that update the maintenance branch
to match the mainline. Part of this update is to fix the ICE building newer
kernels (2.6.39 - 3.0.x). All are cherry-picked from oe.dev.


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---

The following changes since commit a342b5f63af5b3f22aadabec6e9e99d6fd3bfabf:
  Steffen Sledz (1):
        linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux 2.6.26

Khem Raj (3):
  gcc-4.5: Fix segfault in dwarf2out
  gcc-4.5: Fix the ARM ICE regression at -Os -g
  conf/,gcc-common.inc: Add support for ARM hard float toolchain

Steve Sakoman (1):
  gcc: Fix broken g77 link

Tom Rini (1):
  gcc-package-target.inc: Switch to TARGET_PREFIX in symlinks

 conf/distro/include/sane-toolchain.inc             |    3 +-
 conf/distro/minimal-uclibc.conf                    |    3 -
 conf/machine/include/tune-cortexa8.inc             |    6 +-
 recipes/gcc/gcc-4.5.inc                            |    9 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch |  230 ++++++++++++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch |   42 ++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch |   22 ++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch |   61 +++++
 recipes/gcc/gcc-common.inc                         |   12 +-
 recipes/gcc/gcc-package-target.inc                 |   12 +-
 10 files changed, 383 insertions(+), 17 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch



