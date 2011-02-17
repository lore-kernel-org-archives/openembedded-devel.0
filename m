Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Pq54Z-00016H-8G
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 15:43:11 +0100
Received: from localhost.localdomain (95.232.143.186) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC7FB5F01DE6F48; Thu, 17 Feb 2011 15:39:20 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Thu, 17 Feb 2011 15:39:07 +0100
Message-Id: <1297953548-26589-3-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297953548-26589-1-git-send-email-GNUtoo@no-log.org>
References: <1297953548-26589-1-git-send-email-GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] task-bug: make it compatible with bug 1.x, machine arch ${PN}
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
X-List-Received-Date: Thu, 17 Feb 2011 14:43:11 -0000

Some packages like bug2v4l2 are specific to bug 2.0, so we need
  to machine arch the package depending on them.
We also need to

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/tasks/task-bug.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes/tasks/task-bug.bb b/recipes/tasks/task-bug.bb
index 2fbcb6d..1317a6e 100644
--- a/recipes/tasks/task-bug.bb
+++ b/recipes/tasks/task-bug.bb
@@ -1,12 +1,14 @@
 # Copyright (C) 2011 Bug Labs, Inc
 
-PR = "r87"
+PR = "r88"
 
 ALLOW_EMPTY = "1"
 
 PACKAGES += "${PN}-java ${PN}-java-osgi ${PN}-audio ${PN}-devlangs ${PN}-x11 ${PN}-network ${PN}-x11-debug ${PN}-debug"
 
-RDEPENDS_${PN} = "kernel-modules \
+PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "${MACHINE_EXTRA_RRECOMMENDS} \
                   bug-udev \
                   repo-feed-configs \
                   diffutils \
@@ -19,12 +21,11 @@ RDEPENDS_${PN} = "kernel-modules \
                   nano \
                   lsof \
                   file \
-                  bug2v4l2 \
 "
+RDEPENDS_${PN}_append_bug20 = "bug2v4l2"
 
 RDEPENDS_${PN}-network = "\
                   dnsmasq \
-                  marvell-sdio-fw \
                   hostap-daemon \
                   iptables \
                   eject \
-- 
1.7.0.4



