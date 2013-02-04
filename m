Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U2KUM-0000wS-P6
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 12:45:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2013 03:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="280620289"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Feb 2013 03:29:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:29:35 +0000
Message-Id: <cover.1359977333.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 0/3] Fix use of R* package variables
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
X-List-Received-Date: Mon, 04 Feb 2013 11:45:34 -0000

The package needs to be specified when using R* variables, so fix the
few cases where it wasn't.



The following changes since commit 74ec0813562525d02da6ac45eb0237382e98a72f:

  xchat: add libsexy to DEPENDS (2013-02-01 17:44:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/pkgvar-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/pkgvar-fixes

Paul Eggleton (3):
  gnome-vfs: use RPROVIDES correctly
  tiobench: use RDEPENDS correctly
  qconnman: use RCONFLICTS correctly

 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb |    2 +-
 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb   |    2 +-
 meta-oe/recipes-qt/qconnman/qconnman-e_git.bb          |    2 +-
 meta-oe/recipes-qt/qconnman/qconnman_git.bb            |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.10.4



