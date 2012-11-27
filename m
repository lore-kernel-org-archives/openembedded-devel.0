Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdKEa-0006oL-Kt
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 13:25:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Nov 2012 04:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,328,1352102400"; d="scan'208";a="222959999"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.231])
	by azsmga001.ch.intel.com with ESMTP; 27 Nov 2012 04:11:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 12:11:31 +0000
Message-Id: <cover.1354018185.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 0/4] Remove recipes in other layers
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
X-List-Received-Date: Tue, 27 Nov 2012 12:25:52 -0000

Remove some recipes now maintained in other layers. This is just the
low-hanging fruit, there are others that will need a closer look.


The following changes since commit e4236266b7ac6103e4b9400eb51b5cb0037f3ba9:

  hiawatha: add CONFFILES and a php example (2012-11-27 10:48:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup4
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup4

Paul Eggleton (4):
  libcgroup: remove
  socat: remove
  ptpd: remove
  netperf: remove

 .../recipes-benchmark/netperf/files/cpu_set.patch  |   24 -
 meta-oe/recipes-benchmark/netperf/files/init       |   51 --
 .../recipes-benchmark/netperf/files/vfork.patch    |   26 -
 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb |   56 --
 .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26 -
 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb    |   20 -
 meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb |   27 -
 .../socat/socat-1.7.1.2/compile.patch              |  939 --------------------
 meta-oe/recipes-support/socat/socat_1.7.1.2.bb     |   21 -
 9 files changed, 1190 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/netperf/files/cpu_set.patch
 delete mode 100644 meta-oe/recipes-benchmark/netperf/files/init
 delete mode 100644 meta-oe/recipes-benchmark/netperf/files/vfork.patch
 delete mode 100644 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb
 delete mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
 delete mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
 delete mode 100644 meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb
 delete mode 100644 meta-oe/recipes-support/socat/socat-1.7.1.2/compile.patch
 delete mode 100644 meta-oe/recipes-support/socat/socat_1.7.1.2.bb

-- 
1.7.9.5



