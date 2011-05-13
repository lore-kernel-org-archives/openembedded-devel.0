Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrll-0003CT-G7
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:47:01 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF0178; Fri, 13 May 2011 14:44:14 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Fri, 13 May 2011 14:43:06 +0200
Message-Id: <1305290588-7057-8-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/12] matchbox-panel: depend on xterm(matchbox panel contain an xterm launcher)
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
X-List-Received-Date: Fri, 13 May 2011 12:47:01 -0000

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/matchbox-panel/matchbox-panel_0.9.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/matchbox-panel/matchbox-panel_0.9.3.bb b/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
index 092d8ba..221f0ad 100644
--- a/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
+++ b/recipes/matchbox-panel/matchbox-panel_0.9.3.bb
@@ -1,5 +1,6 @@
 require matchbox-panel.inc
-PR ="r6"
+RDEPENDS += "xterm"
+PR ="r7"
 SRC_URI = "http://projects.o-hand.com/matchbox/sources/${PN}/0.9/${PN}-${PV}.tar.gz \
 	   file://mb-applet-battery-repaint-093.patch \
 	   file://mb-applet-system-monitor-crash.patch \
-- 
1.7.0.4



