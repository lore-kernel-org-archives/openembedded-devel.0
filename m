Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RC1uD-00081F-Jy
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 06:19:29 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LSO007NFH2OEC70@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	06 Oct 2011 23:13:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 87E5314AF5D; Fri,
	07 Oct 2011 00:13:36 -0400 (EDT)
Date: Fri, 07 Oct 2011 00:13:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111007041336.GC26170@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request 20111006
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
X-List-Received-Date: Fri, 07 Oct 2011 04:19:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 3 commits, that update wireless stuff and are quite
trivial - new version for iw and updated SRCREVs for wpa_supplicant and
hostapd. All are cherry-picked from oe.dev.

Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---

The following changes since commit 56a79a34b0461dae629e7aedb7d9e4d0e6137743:
  Philip Balister (1):
        uhd : Update SRCREV to head of master branch.

Eyal Reizer (3):
  iw: build version 0.9.22 from git sources
  wpa_supplicant update to use a newer commit
  hostapd: update to use a newer commit

 recipes/hostap/hostap-daemon_git.bb          |    5 +--
 recipes/iw/iw_git.bb                         |   27 ++++++++++++++++++++++++++
 recipes/wpa-supplicant/wpa-supplicant_git.bb |    6 +---
 3 files changed, 31 insertions(+), 7 deletions(-)
 create mode 100644 recipes/iw/iw_git.bb



