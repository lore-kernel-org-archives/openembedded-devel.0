Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Srua2-0002br-On
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:32:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 8458BEA054
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:24:34 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id E438060BFC; Thu, 19 Jul 2012 19:20:40 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:20:36 +0200
Message-Id: <0ac962f0656daf53869cdfa168d2ad846bab1d77.1342677799.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
In-Reply-To: <cover.1342677797.git.apelete@seketeli.net>
References: <cover.1342677797.git.apelete@seketeli.net>
Subject: [2011.03-maintenance][PATCH 5/9] netsurf: update SRC_URI
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
X-List-Received-Date: Thu, 19 Jul 2012 17:32:02 -0000

Update the SRC_URI of the following recipes, since the NetSurf project
has moved the download repository of its source packages:
- hubbub_0.0.2.bb
- libcss_0.0.2.bb
- libnsbmp_0.0.2.bb
- libnsgif_0.0.2.bb
- libparserutils_0.0.2.bb
- libwapcaplet_0.0.2.bb
- netsurf_2.6.bb

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 recipes/netsurf/hubbub_0.0.2.bb         |    2 +-
 recipes/netsurf/libcss_0.0.2.bb         |    2 +-
 recipes/netsurf/libnsbmp_0.0.2.bb       |    2 +-
 recipes/netsurf/libnsgif_0.0.2.bb       |    2 +-
 recipes/netsurf/libparserutils_0.0.2.bb |    2 +-
 recipes/netsurf/libwapcaplet_0.0.2.bb   |    2 +-
 recipes/netsurf/netsurf_2.6.bb          |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes/netsurf/hubbub_0.0.2.bb b/recipes/netsurf/hubbub_0.0.2.bb
index 0d6b828..319fe1d 100644
--- a/recipes/netsurf/hubbub_0.0.2.bb
+++ b/recipes/netsurf/hubbub_0.0.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "libparserutils"
 
 PR = "r1"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/hubbub-${PV}-src.tar.gz"
+SRC_URI = "http://download.netsurf-browser.org/libs/releases/hubbub-${PV}-src.tar.gz"
 
 inherit pkgconfig
 
diff --git a/recipes/netsurf/libcss_0.0.2.bb b/recipes/netsurf/libcss_0.0.2.bb
index 42424c4..213b57e 100644
--- a/recipes/netsurf/libcss_0.0.2.bb
+++ b/recipes/netsurf/libcss_0.0.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "libwapcaplet"
 
 PR = "r1"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/libcss-${PV}-src.tar.gz \
+SRC_URI = "http://download.netsurf-browser.org/libs/releases/libcss-${PV}-src.tar.gz \
 	   file://no-werror.patch"
 
 inherit pkgconfig
diff --git a/recipes/netsurf/libnsbmp_0.0.2.bb b/recipes/netsurf/libnsbmp_0.0.2.bb
index db02c1e..56eeb81 100644
--- a/recipes/netsurf/libnsbmp_0.0.2.bb
+++ b/recipes/netsurf/libnsbmp_0.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 
 PR = "r1"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/libnsbmp-${PV}-src.tar.gz"
+SRC_URI = "http://download.netsurf-browser.org/libs/releases/libnsbmp-${PV}-src.tar.gz"
 
 inherit pkgconfig
 
diff --git a/recipes/netsurf/libnsgif_0.0.2.bb b/recipes/netsurf/libnsgif_0.0.2.bb
index 5291169..57283f3 100644
--- a/recipes/netsurf/libnsgif_0.0.2.bb
+++ b/recipes/netsurf/libnsgif_0.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 
 PR = "r1"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/libnsgif-${PV}-src.tar.gz"
+SRC_URI = "http://download.netsurf-browser.org/libs/releases/libnsgif-${PV}-src.tar.gz"
 
 inherit pkgconfig
 
diff --git a/recipes/netsurf/libparserutils_0.0.2.bb b/recipes/netsurf/libparserutils_0.0.2.bb
index ea59272..cca2c02 100644
--- a/recipes/netsurf/libparserutils_0.0.2.bb
+++ b/recipes/netsurf/libparserutils_0.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 
 PR = "r1"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/libparserutils-${PV}-src.tar.gz"
+SRC_URI = "http://download.netsurf-browser.org/libs/releases/libparserutils-${PV}-src.tar.gz"
 
 inherit pkgconfig
 
diff --git a/recipes/netsurf/libwapcaplet_0.0.2.bb b/recipes/netsurf/libwapcaplet_0.0.2.bb
index 3ef4b3c..02c1d7a 100644
--- a/recipes/netsurf/libwapcaplet_0.0.2.bb
+++ b/recipes/netsurf/libwapcaplet_0.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 
 PR = "r1"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/libwapcaplet-${PV}-src.tar.gz"
+SRC_URI = "http://download.netsurf-browser.org/libs/releases/libwapcaplet-${PV}-src.tar.gz"
 
 inherit pkgconfig
 
diff --git a/recipes/netsurf/netsurf_2.6.bb b/recipes/netsurf/netsurf_2.6.bb
index 607a18a..1e07223 100644
--- a/recipes/netsurf/netsurf_2.6.bb
+++ b/recipes/netsurf/netsurf_2.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.netsurf-browser.org/"
 SECTION = "x11/network"
 LICENSE = "GPLv2"
 
-SRC_URI = "http://www.netsurf-browser.org/downloads/releases/netsurf-${PV}-src.tar.gz \
+SRC_URI = "http://download.netsurf-browser.org/netsurf/releases/source/netsurf-${PV}-src.tar.gz \
 	   file://fix_makefile.patch \
 	   file://debugxml_fix.patch \
 	   file://netsurf.png \
-- 
1.7.10.4



