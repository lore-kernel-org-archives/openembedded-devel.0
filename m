Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbaCA-0007G3-I6
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 18:04:10 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2012 08:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="171453258"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2012 08:49:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2012 16:49:33 +0000
Message-Id: <cover.1353602922.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH v2 0/2] ntp fixes
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
X-List-Received-Date: Thu, 22 Nov 2012 17:04:10 -0000

Changes since v1:
* Fix hardcoded paths in scripts
* Move contents of ntp-bin package to previously empty ntp-utils package
* Move the ntp server configuration to runtime (/etc/default/ntpdate)
* Specify configuration files using CONFFILES
* Remove unused init script path from FILES_ntpdate


The following changes since commit d08ee5a51d4e89ae587d170f8b99062689841428:

  qt4-embedded: drop bbappend for 4.8.1 (2012-11-22 09:48:36 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/ntp
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/ntp

Paul Eggleton (2):
  ntp: cleanup recipes and fix SSL support
  ntp: make servers configurable and default to none configured

 meta-networking/recipes-support/ntp/files/ntp      |   31 -------
 meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
 meta-networking/recipes-support/ntp/files/ntpdate  |   11 ++-
 .../recipes-support/ntp/files/ntpdate.default      |    7 ++
 .../recipes-support/ntp/files/openssl-check.patch  |   59 ++++++++++++
 .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   11 ---
 meta-networking/recipes-support/ntp/ntp.inc        |   94 ++++++++++++++++----
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   44 +--------
 8 files changed, 154 insertions(+), 105 deletions(-)
 delete mode 100755 meta-networking/recipes-support/ntp/files/ntp
 create mode 100644 meta-networking/recipes-support/ntp/files/ntpdate.default
 create mode 100644 meta-networking/recipes-support/ntp/files/openssl-check.patch
 delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb

-- 
1.7.9.5



