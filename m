Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TjAOY-0001uU-9f
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 16:08:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2012 06:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,274,1355126400"; d="scan'208";a="180451161"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.1])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Dec 2012 06:53:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 14:53:34 +0000
Message-Id: <cover.1355410208.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 0/3] Cleanups
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
X-List-Received-Date: Thu, 13 Dec 2012 15:08:51 -0000

"startline" -> "beginline" for LIC_FILES_CHKSUM in meta-oe and
meta-networking, as well as removing libnl which is now in OE-Core.


The following changes since commit f36e2e2ea4edcd4a0e65ed1c213bce388231214c:

  gcalctool: upgrade to 5.32.0 (2012-12-11 01:54:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup5
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup5

Paul Eggleton (3):
  Fix erroneous use of "startline" in LIC_FILES_CHKSUM
  Fix erroneous use of "startline" in LIC_FILES_CHKSUM
  libnl: remove

 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    4 +-
 meta-networking/recipes-support/mtr/mtr_0.82.bb    |    2 +-
 meta-networking/recipes-support/tunctl/tunctl.inc  |    2 +-
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |    2 +-
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |    2 +-
 .../socketcan/libsocketcan_0.0.8.bb                |    2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb          |    2 +-
 meta-oe/recipes-support/libnl/libnl_3.2.9.bb       |   52 --------------------
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb   |    2 +-
 9 files changed, 9 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.9.bb

-- 
1.7.10.4



