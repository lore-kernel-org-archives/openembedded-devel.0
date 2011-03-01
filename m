Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1PuThp-0004AI-2r
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:49:53 +0100
Received: from localhost.localdomain (80.116.58.157) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C05723F09; Tue, 1 Mar 2011 18:45:46 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2011 18:45:32 +0100
Message-Id: <1299001532-3260-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1299001532-3260-1-git-send-email-GNUtoo@no-log.org>
References: <1299001532-3260-1-git-send-email-GNUtoo@no-log.org>
Subject: [PATCH] netbase and opkg: reorder init scripts to make networking come up at first boot
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
X-List-Received-Date: Tue, 01 Mar 2011 17:49:53 -0000

Without that fix, usb0 doesn't come up at first boot
  (tested on the bug machine, with Angstrom on a console-image).

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/netbase/netbase_4.21.bb |    2 +-
 recipes/opkg/files/configure    |    2 +-
 recipes/opkg/opkg.inc           |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index f3ae6e9..075c9db 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -9,7 +9,7 @@ inherit update-rc.d
 SRC_URI_OVERRIDES_PACKAGE_ARCH = "1"
 
 INITSCRIPT_NAME = "networking"
-INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
+INITSCRIPT_PARAMS = "start 41 S . stop 41 0 6 1 ."
 # On MNCI etc, start very late so that our own apps come up faster
 INITSCRIPT_PARAMS_openmn = "start 85 1 2 3 4 5 . stop 85 0 6 1 ."
 # On SlugOS (NSLU2) delay the stop until after network apps have exited
diff --git a/recipes/opkg/files/configure b/recipes/opkg/files/configure
index d5dd74d..633d8d3 100644
--- a/recipes/opkg/files/configure
+++ b/recipes/opkg/files/configure
@@ -22,4 +22,4 @@ else
 fi
 
 # delete myself
-rm -f /etc/rcS.d/S98configure
+rm -f /etc/rcS.d/S40configure
diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 6970f2f..8980c14 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 SRCREV = "609"
 PV = "0.1.8+svnr${SRCPV}"
 CONFLICTS = "ipkg"
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 	   file://configure \
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 
 do_install_prepend() {
   install -d ${D}${sysconfdir}/rcS.d
-  install -m 0755 ${WORKDIR}/configure ${D}${sysconfdir}/rcS.d/S98configure
+  install -m 0755 ${WORKDIR}/configure ${D}${sysconfdir}/rcS.d/S40configure
 }
 
 EXTRA_OECONF += " --disable-gpg \ 
-- 
1.7.0.4



