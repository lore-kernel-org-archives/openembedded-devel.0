Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QUQTP-0003eA-Uf
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 23:39:36 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMH0080HQNHEUH1@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Jun 2011 16:35:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3868614AF5D; Wed,
	08 Jun 2011 17:35:41 -0400 (EDT)
Date: Wed, 08 Jun 2011 17:35:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110608213541.GB29476@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request 20110608
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
X-List-Received-Date: Wed, 08 Jun 2011 21:39:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 15 commits for various bug fixes and enhancements.
All, except one, are cherry picked from oe.dev. The qt-4.6.3 one instead
of moving the patch from 4.7.3 just adds it, as there is no 4.7.3 version
available in the maintenance branch.


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---


Anand Balagopalakrishnan (1):
  libgles-omap3: Specify the Window System to be updated in powervr.ini

Antonio Ospite (1):
  tzcode-native: update to 2011d

Bob Foerster (1):
  tzcode-native: update to 2011e

Denys Dmytriyenko (1):
  qt-4.6.3: update qt's powervr graphics driver plugin to work with SGX
    DDK v1.6

Eyal Reizer (3):
  ti-wifi-utils: install calibrator ini files to rootfs
  crda: fix regulatory domain agent for building with libnl2
  wpa-gui-e: build the latest version from git sources

Jeff Lance (1):
  matrix_gui: Update SRCREV to revision 257

Koen Kooi (2):
  x-load git: bump SRCREV
  x-load: sync with meta-texasinstruments for beagle C5 support

Siddharth Heroor (3):
  ti816x machine: Fix JFFS Image command
  ti816x machine: Update for latest kernel version
  sysvinit: bump PR for ti816x serial console change

Stanislav Brabec (2):
  crda: Fix build by disabling of make environment overrides.
  crda: Upgrade regulatory database to 2011.04.28.

 conf/machine/include/ti816x.inc                    |    4 +-
 recipes/crda/crda_1.1.1.bb                         |   13 +-
 recipes/powervr-drivers/libgles-omap3.inc          |    4 +-
 recipes/qt4/files/0001-wsegl2-support.patch        |  997 ++++++++++++++++++++
 recipes/qt4/qt-4.6.3.inc                           |    1 +
 recipes/sysvinit/sysvinit_2.86.bb                  |    2 +-
 recipes/ti/matrix-gui-common_1.4.bb                |    4 +-
 recipes/ti/matrix-gui-e_1.3.bb                     |    4 +-
 recipes/ti/matrix-gui_1.3.bb                       |    4 +-
 recipes/ti/ti-wifi-utils_git.bb                    |   12 +-
 ...code-native_2011b.bb => tzcode-native_2011e.bb} |   10 +-
 recipes/wpa-supplicant/wpa-gui-e_git.bb            |   27 +
 .../x-load-git/0001-Beagle-Rev-C5-support.patch    |   60 ++
 recipes/x-load/x-load_git.bb                       |    5 +-
 14 files changed, 1124 insertions(+), 23 deletions(-)
 create mode 100644 recipes/qt4/files/0001-wsegl2-support.patch
 rename recipes/tzcode/{tzcode-native_2011b.bb => tzcode-native_2011e.bb} (51%)
 create mode 100644 recipes/wpa-supplicant/wpa-gui-e_git.bb
 create mode 100644 recipes/x-load/x-load-git/0001-Beagle-Rev-C5-support.patch



