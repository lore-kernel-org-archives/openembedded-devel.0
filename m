Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QASLt-0005o2-09
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 21:37:17 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJN0041VQDO8HA6@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	14 Apr 2011 14:34:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D743314AF5B; Thu,
	14 Apr 2011 15:34:36 -0400 (EDT)
Date: Thu, 14 Apr 2011 15:34:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110414193436.GA26286@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request for TI matrix-gui, ipc and	sgx/gles
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
X-List-Received-Date: Thu, 14 Apr 2011 19:37:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 5 commits for TI related changes - matrix-gui rev bump,
new ti-ipc version and sgx/gles fixes for ti816x.
All are cherry picked from oe.dev


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---


Jeff Lance (1):
  matrix-gui: Bump up SRCREV

Siddharth Heroor (4):
  ti-ipc: Add version 1.22.05.27
  omap3-sgx-modules: Update TI816x Module Location and Platform
    variables.
  libgles-omap3: Correct libraries for TI816x.
  libgles-omap3: Remove SGX Fixup for TI816x.

 recipes/powervr-drivers/libgles-omap3/rc.pvr       |   10 +++-------
 .../powervr-drivers/libgles-omap3_4.03.00.01.bb    |    4 +++-
 .../omap3-sgx-modules_1.6.16.3977.bb               |    4 ++--
 recipes/ti/matrix-gui-common_1.4.bb                |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb                     |    4 ++--
 recipes/ti/matrix-gui_1.3.bb                       |    4 ++--
 recipes/ti/ti-ipc_1.22.05.27.bb                    |    6 ++++++
 7 files changed, 20 insertions(+), 16 deletions(-)
 create mode 100644 recipes/ti/ti-ipc_1.22.05.27.bb



