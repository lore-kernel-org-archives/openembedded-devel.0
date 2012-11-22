Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TbaGK-0007ZA-GZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 18:08:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2012 08:54:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,301,1352102400"; d="scan'208";a="221146318"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by azsmga001.ch.intel.com with ESMTP; 22 Nov 2012 08:54:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Nov 2012 16:54:07 +0000
Message-Id: <0e751bcadb280dcb479584a60a02f71a88f02d21.1353603007.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353603007.git.paul.eggleton@linux.intel.com>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353603007.git.paul.eggleton@linux.intel.com>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
Subject: [meta-systemd][PATCH 3/3] meta-systemd: ntp: update for server config improvements
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

This makes the service use the ntpdate-sync command which reads the
servers set in /etc/default/ntpdate; if nothing is set then no error is
produced on startup.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/ntp/ntp/ntpdate.service        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
index b2bc632..10cbd70 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
@@ -4,7 +4,7 @@ Before=ntpd.service
 
 [Service]
 Type=oneshot
-ExecStart=/usr/bin/ntpd -q -g -x
+ExecStart=/usr/bin/ntpdate-sync silent
 RemainAfterExit=yes
 
 [Install]
-- 
1.7.9.5



