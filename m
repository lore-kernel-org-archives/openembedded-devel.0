Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q5onX-0003GX-Vz
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 02:34:40 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ0005JB1HZTWT2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	01 Apr 2011 19:32:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B4F1C14AF6C; Fri,
	01 Apr 2011 20:32:23 -0400 (EDT)
Date: Fri, 01 Apr 2011 20:32:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110402003223.GA4182@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [2011.03-maintenance] Pull request for TI edma3lld-sysbios, cgt6x	and beagle u-boot changes
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
X-List-Received-Date: Sat, 02 Apr 2011 00:34:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 5 commits for TI related changes - edma3lld-sysbios mods,
new cgt6x version and u-boot change for beagleboard xM-C.
All are cherry picked from oe.dev


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---


Jason Kridner (1):
  u-boot: BeagleBoard: add rev xM-C detection

Siddharth Heroor (4):
  TI EDMA3LLD Sysbios: Move installer unpack to recipe version
  TI EDMA3LLD Sysbios: Update recipe for SRC_URI
  TI EDMA3LLD Sysbios: Add version 02.11.01.02
  ti-cgt6x: Add release 7.2.2

 recipes/ti/ti-cgt6x_7.2.2.bb                       |    8 ++
 recipes/ti/ti-edma3lld-sysbios.inc                 |    8 +--
 recipes/ti/ti-edma3lld-sysbios_02.10.03.04.bb      |    5 ++
 recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb      |    6 ++
 ...0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch |   68 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    3 +-
 6 files changed, 91 insertions(+), 7 deletions(-)
 create mode 100644 recipes/ti/ti-cgt6x_7.2.2.bb
 create mode 100644 recipes/ti/ti-edma3lld-sysbios_02.11.01.02.bb
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0017-BeagleBoard-add-xM-rev-C-to-ID-table.patch



