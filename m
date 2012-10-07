Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TKtXK-0005Vi-CD
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Oct 2012 18:17:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Oct 2012 09:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,547,1344236400"; d="scan'208";a="201559628"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.60])
	by azsmga001.ch.intel.com with ESMTP; 07 Oct 2012 09:03:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2012 17:03:46 +0100
Message-Id: <cover.1349625647.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 0/2] Fix mysql_config
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
X-List-Received-Date: Sun, 07 Oct 2012 16:17:02 -0000

A fix for mysql_config that I found was needed to build modphp with
mysql support. I tested building qt4-x11-free and cherokee before and
after this fix; the former was unaffected whereas the latter ended up
with mysql support actually enabled, so this was broken previously
despite having mysql5 in DEPENDS. Hence, also bump PR on cherokee to
force it to rebuild with mysql support.


The following changes since commit 68f05443333afa527e3b24e4caae6115dfb6b6b6:

  opencv: bump PR due libav update (2012-10-05 11:27:25 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mysqlfix
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/mysqlfix

Paul Eggleton (2):
  mysql: fix include path reported by mysql_config
  cherokee: bump PR to enable mysql support

 .../cherokee/cherokee_1.2.98.bb                    |    2 +-
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.9.5



