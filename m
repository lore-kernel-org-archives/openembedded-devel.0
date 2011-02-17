Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1Pq54Z-00016E-7k
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 15:43:11 +0100
Received: from localhost.localdomain (95.232.143.186) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC7FB5F01DE6F50; Thu, 17 Feb 2011 15:39:21 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Thu, 17 Feb 2011 15:39:08 +0100
Message-Id: <1297953548-26589-4-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297953548-26589-1-git-send-email-GNUtoo@no-log.org>
References: <1297953548-26589-1-git-send-email-GNUtoo@no-log.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] com.buglabs.bug.base: add support for bug 1.x
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

Without that fix, it fails to fetch the now gone hirop branch

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/buglabs-osgi/com.buglabs.bug.base.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/buglabs-osgi/com.buglabs.bug.base.bb b/recipes/buglabs-osgi/com.buglabs.bug.base.bb
index 5efee5e..9f0b100 100644
--- a/recipes/buglabs-osgi/com.buglabs.bug.base.bb
+++ b/recipes/buglabs-osgi/com.buglabs.bug.base.bb
@@ -1,13 +1,13 @@
 require bug-osgi.inc
-PR = "${INC_PR}.10+svnr${SRCREV}"
+PR = "${INC_PR}.11+svnr${SRCREV}"
 EXTRA_CP += "servlet-2.3.1"
 DEPENDS += "com.buglabs.common com.buglabs.bug.jni.input  com.buglabs.bug.jni.common servlet2.3 com.buglabs.osgi.http"
 
-SUBMODULE_bug = "hirop"
 SUBMODULE_bug20 = "molly"
 SUBMODULE_beagleboard = "beagle"
 
 SRC_URI = "svn://bugcamp.net/bug/trunk;module=${PN}.${SUBMODULE};proto=svn "
+SRC_URI_bug = "svn://bugcamp.net/bug/tags/releases/R1.4.3;module=${PN};proto=svn"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
1.7.0.4



