Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1PsDGh-00050z-BH
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 12:52:31 +0100
Received: by gravedo.de (Postfix, from userid 5001)
	id 475EB799025; Wed, 23 Feb 2011 12:51:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (dslb-088-071-242-144.pools.arcor-ip.net
	[88.71.242.144]) by gravedo.de (Postfix) with ESMTPSA id 811C3798D67;
	Wed, 23 Feb 2011 12:51:05 +0100 (CET)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 12:51:01 +0100
Message-Id: <1298461861-12737-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] e-module: introduce INC_PR and use it in all depending recipes
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
X-List-Received-Date: Wed, 23 Feb 2011 11:52:31 -0000

We set INC_PR initially to r5 as some of the dependencies already defined a PR which max
was r4.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/e17/cpu_svn.bb          |    1 +
 recipes/e17/diskio_svn.bb       |    1 +
 recipes/e17/e-module.inc        |    1 +
 recipes/e17/efm-path_svn.bb     |    1 +
 recipes/e17/efm-pathbar_svn.bb  |    3 ++-
 recipes/e17/flame_svn.bb        |    1 +
 recipes/e17/forecasts_svn.bb    |    1 +
 recipes/e17/news_svn.bb         |    1 +
 recipes/e17/notification_svn.bb |    1 +
 recipes/e17/places_svn.bb       |    3 +--
 recipes/e17/rain_svn.bb         |    1 +
 recipes/e17/screenshot_svn.bb   |    1 +
 recipes/e17/uptime_svn.bb       |    1 +
 13 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/recipes/e17/cpu_svn.bb b/recipes/e17/cpu_svn.bb
index 3dc049d..ccc6e7e 100644
--- a/recipes/e17/cpu_svn.bb
+++ b/recipes/e17/cpu_svn.bb
@@ -1,4 +1,5 @@
 LICENSE = "MIT"
 PV = "0.0.1+svnr${SRCREV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
diff --git a/recipes/e17/diskio_svn.bb b/recipes/e17/diskio_svn.bb
index 0e854ba..f748a29 100644
--- a/recipes/e17/diskio_svn.bb
+++ b/recipes/e17/diskio_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.0.1+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/e-module.inc b/recipes/e17/e-module.inc
index 185c841..3834a2e 100644
--- a/recipes/e17/e-module.inc
+++ b/recipes/e17/e-module.inc
@@ -3,6 +3,7 @@ SECTION = "x11/multimedia"
 DEPENDS = "e-wm"
 
 SRCREV = "${EFL_SRCREV}"
+INC_PR = "r5"
 
 SRCNAME = "E-MODULES-EXTRA/${PN}"
 
diff --git a/recipes/e17/efm-path_svn.bb b/recipes/e17/efm-path_svn.bb
index ecfd838..685513f 100644
--- a/recipes/e17/efm-path_svn.bb
+++ b/recipes/e17/efm-path_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.0.1+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/efm-pathbar_svn.bb b/recipes/e17/efm-pathbar_svn.bb
index d7666fd..54c5a0b 100644
--- a/recipes/e17/efm-pathbar_svn.bb
+++ b/recipes/e17/efm-pathbar_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.0.1+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
@@ -11,4 +12,4 @@ do_configure_prepend() {
 }
 
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug/"
-FILES_${PN} += "${libdir}/enlightenment/modules/"
\ No newline at end of file
+FILES_${PN} += "${libdir}/enlightenment/modules/"
diff --git a/recipes/e17/flame_svn.bb b/recipes/e17/flame_svn.bb
index c46314c..11769c6 100644
--- a/recipes/e17/flame_svn.bb
+++ b/recipes/e17/flame_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.0.3+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/forecasts_svn.bb b/recipes/e17/forecasts_svn.bb
index 676945e..a6316ed 100644
--- a/recipes/e17/forecasts_svn.bb
+++ b/recipes/e17/forecasts_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.2.0+svnr${SRCREV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/news_svn.bb b/recipes/e17/news_svn.bb
index c72fbb5..1e429e7 100644
--- a/recipes/e17/news_svn.bb
+++ b/recipes/e17/news_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.1.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/notification_svn.bb b/recipes/e17/notification_svn.bb
index a8c53a5..1f4567a 100644
--- a/recipes/e17/notification_svn.bb
+++ b/recipes/e17/notification_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/places_svn.bb b/recipes/e17/places_svn.bb
index 0956fa0..3476a59 100644
--- a/recipes/e17/places_svn.bb
+++ b/recipes/e17/places_svn.bb
@@ -1,7 +1,6 @@
 LICENSE = "BSD"
 PV = "0.1.0+svnr${SRCPV}"
-
-PR = "r4"
+PR = "${INC_PR}.4"
 
 require e-module.inc
 
diff --git a/recipes/e17/rain_svn.bb b/recipes/e17/rain_svn.bb
index e9ab9de..8738f35 100644
--- a/recipes/e17/rain_svn.bb
+++ b/recipes/e17/rain_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.0.3+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/screenshot_svn.bb b/recipes/e17/screenshot_svn.bb
index dc8acc3..0cd0d8b 100644
--- a/recipes/e17/screenshot_svn.bb
+++ b/recipes/e17/screenshot_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.3.0+svnr${SRCREV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/recipes/e17/uptime_svn.bb b/recipes/e17/uptime_svn.bb
index 42c0d72..c6d7434 100644
--- a/recipes/e17/uptime_svn.bb
+++ b/recipes/e17/uptime_svn.bb
@@ -1,5 +1,6 @@
 LICENSE = "MIT"
 PV = "0.0.2+svnr${SRCREV}"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
-- 
1.7.1



