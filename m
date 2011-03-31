Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q5MJE-0000HZ-RV
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 20:09:29 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIX004AMP0A3U55@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	31 Mar 2011 13:07:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ED5C814AF6C; Thu,
	31 Mar 2011 14:07:21 -0400 (EDT)
Date: Thu, 31 Mar 2011 14:07:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110331180721.GD23178@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request for new TI machines, angstrom	and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 18:09:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 8 commits for the external Angstrom toolchain fix,
qt4 security advisory fix, as well as for addition of new TI machines.
All are cherry picked from oe.dev

The machine commits were reordered to add kernel and u-boot recipes before the 
actual machine configs.


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---


Chase Maupin (6):
  linux-omap3: add PSP recipe for am387x-evm
  u-boot: Add PSP version for am387x-evm
  sort: Add ti814x machine types
  ti814x: Add new machine definitions
  am-benchmarks: Add support for am387x-evm machine
  matrix-gui: Add support for am387x-evm machine

Denys Dmytriyenko (2):
  external-toolchain-angstrom: don't stage .la files
  qt4: security advisory - blacklist fraudulent comodo certificates

 conf/machine/am387x-evm.conf                       |    5 +
 conf/machine/c6a814x-evm.conf                      |    5 +
 conf/machine/dm814x-evm.conf                       |    5 +
 conf/machine/include/ti814x.inc                    |   26 +
 contrib/angstrom/sort.sh                           |    2 +-
 .../ti814x/defconfig                               | 1927 ++++++++++++++++++++
 recipes/linux/linux-omap3_2.6.37-psp04.01.00.03.bb |   10 +
 recipes/meta/external-toolchain-angstrom.bb        |    4 +-
 ...klist-fraudulent-comodo-certificates-patch.diff |  134 ++
 recipes/qt4/qt-4.6.3.inc                           |    8 +-
 recipes/qt4/qt-4.7.1.inc                           |    3 +-
 recipes/qt4/qt4-embedded_4.6.3.bb                  |    2 +-
 recipes/qt4/qt4-embedded_4.7.1.bb                  |    2 +-
 recipes/ti/am-benchmarks_1.2.bb                    |    5 +-
 recipes/ti/matrix-gui-common.inc                   |    5 +-
 recipes/ti/matrix-gui-e.inc                        |    5 +-
 recipes/ti/matrix-gui.inc                          |    5 +-
 recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb    |   14 +
 18 files changed, 2149 insertions(+), 18 deletions(-)
 create mode 100644 conf/machine/am387x-evm.conf
 create mode 100644 conf/machine/c6a814x-evm.conf
 create mode 100644 conf/machine/dm814x-evm.conf
 create mode 100644 conf/machine/include/ti814x.inc
 create mode 100644 recipes/linux/linux-omap3-2.6.37-psp04.01.00.03/ti814x/defconfig
 create mode 100644 recipes/linux/linux-omap3_2.6.37-psp04.01.00.03.bb
 create mode 100644 recipes/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
 create mode 100644 recipes/u-boot/u-boot_2010.06-psp04.01.00.03.bb



