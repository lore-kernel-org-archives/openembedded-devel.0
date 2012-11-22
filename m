Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbaGI-0007ZB-1a
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 18:08:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2012 08:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="221146312"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by azsmga001.ch.intel.com with ESMTP; 22 Nov 2012 08:54:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Nov 2012 16:54:05 +0000
Message-Id: <7da3e44c0dc53c05acce387bf5461d0e292f8d34.1353603007.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353603007.git.paul.eggleton@linux.intel.com>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353603007.git.paul.eggleton@linux.intel.com>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/ntp/ntp/ntpd.service           |    0
 .../recipes-support/ntp/ntp/ntpdate.service        |    0
 .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpd.service (100%)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp/ntpdate.service (100%)
 rename meta-systemd/{meta-oe => meta-networking}/recipes-support/ntp/ntp_4.2.6p3.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpd.service
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp/ntpdate.service
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
diff --git a/meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bbappend
rename to meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p3.bbappend
-- 
1.7.9.5



