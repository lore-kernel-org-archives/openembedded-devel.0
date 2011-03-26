Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q3KQi-0002Uo-Te
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 04:44:53 +0100
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIN006MN8DEJDF5@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	25 Mar 2011 21:32:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1DE7A14AF6C; Fri,
	25 Mar 2011 22:32:02 -0400 (EDT)
Date: Fri, 25 Mar 2011 22:32:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110326023201.GA13132@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request for external toolchains updates	and matrix-gui
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
X-List-Received-Date: Sat, 26 Mar 2011 03:44:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 8 commits for the external CSL and Angstrom toolchains, as well
as a trivial SRCREV update for TI's matrix-gui. All are cherry picked from oe.dev


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---


Denys Dmytriyenko (5):
  external-toolchain-angstrom: use pre-built Angstrom toolchain
  local.conf: add example to use external angstrom toolchain
  external-toolchain-csl: update licensing info, document exceptions
  external-toolchain-angstrom: update licensing info, document
    exceptions
  external-toolchain-angstrom: variable name for gdb license got
    changed

Jeff Lance (1):
  matrix-gui: Bump up SRCREV

Tom Rini (2):
  local.conf.sample: Add an example for using CodeSourcery tools
  local.conf.sample: Typo fix

 conf/local.conf.sample                             |   22 +
 recipes/meta/external-toolchain-angstrom.bb        |  487 ++++++++++++++++++++
 recipes/meta/external-toolchain-angstrom/SUPPORTED |    4 +
 recipes/meta/external-toolchain-csl.bb             |   39 +-
 recipes/ti/matrix-gui-common_1.4.bb                |    4 +-
 recipes/ti/matrix-gui-e_1.3.bb                     |    4 +-
 recipes/ti/matrix-gui_1.3.bb                       |    4 +-
 7 files changed, 545 insertions(+), 19 deletions(-)
 create mode 100644 recipes/meta/external-toolchain-angstrom.bb
 create mode 100644 recipes/meta/external-toolchain-angstrom/SUPPORTED



