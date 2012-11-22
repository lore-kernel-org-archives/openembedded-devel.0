Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbaGH-0007ZA-6c
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 18:08:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2012 08:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="221146306"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by azsmga001.ch.intel.com with ESMTP; 22 Nov 2012 08:54:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Nov 2012 16:54:04 +0000
Message-Id: <cover.1353603007.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH 0/3] Fix ntp bbappends
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
X-List-Received-Date: Thu, 22 Nov 2012 17:08:28 -0000

This is the meta-systemd patch series corresponding to the recently sent
out patches for ntp in meta-networking. 1/3 and 2/3 should be applied
ASAP even if 3/3 is not applied immediately, as the layer is currently
broken; 3/3 needs to wait until after the meta-networking patches go in.


The following changes since commit d08ee5a51d4e89ae587d170f8b99062689841428:

  qt4-embedded: drop bbappend for 4.8.1 (2012-11-22 09:48:36 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/ntp-systemd
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/ntp-systemd

Otavio Salvador (2):
  meta-systemd: Move ntp recipes to 'meta-networking' sublayer
  meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5

Paul Eggleton (1):
  meta-systemd: ntp: update for server config improvements

 .../recipes-support/ntp/ntp/ntpd.service           |    0
 .../recipes-support/ntp/ntp/ntpdate.service        |    2 +-
 .../recipes-support/ntp/ntp_4.2.6p5.bbappend}      |    0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpd.service (100%)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpdate.service (80%)
 rename meta-systemd/{meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend => meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend} (100%)

-- 
1.7.9.5



