Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbEL2-000656-4g
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 18:43:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Nov 2012 09:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,293,1352102400"; d="scan'208";a="220730118"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.187])
	by azsmga001.ch.intel.com with ESMTP; 21 Nov 2012 09:29:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2012 17:29:28 +0000
Message-Id: <cover.1353518890.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH 0/2] ntp fixes
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
X-List-Received-Date: Wed, 21 Nov 2012 17:43:52 -0000

The following changes since commit 9637cb304f1e9116b037d0afd69014836a2fa512:

  Revert "ntp: Clean up recipes" (2012-11-21 08:32:18 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/ntp
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/ntp

Paul Eggleton (2):
  ntp: cleanup recipes and fix SSL support
  ntp: make servers configurable and default to none configured

 .../recipes-support/ntp/files/openssl-check.patch  |   59 ++++++++++++++
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   11 ---
 meta-networking/recipes-support/ntp/ntp.inc        |   83 ++++++++++++++++----
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   44 +----------
 4 files changed, 130 insertions(+), 67 deletions(-)
 create mode 100644 meta-networking/recipes-support/ntp/files/openssl-check.patch
 delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb

-- 
1.7.9.5



