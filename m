Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NiDJr-0001vO-3y
	for openembedded-devel@openembedded.org; Thu, 18 Feb 2010 21:49:58 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Feb 2010 21:46:11 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Feb 2010 21:46:11 +0100
Received: from localhost.localdomain ([80.117.36.203]) by
	FBCMCL01B09.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 18 Feb 2010 21:46:10 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2010 21:45:46 +0100
Message-Id: <1266525946-8354-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <1266525946-8354-1-git-send-email-GNUtoo@no-log.org>
References: <E1Ngbii-0008Ch-On@melo.openembedded.org>
	<1266525946-8354-1-git-send-email-GNUtoo@no-log.org>
X-OriginalArrivalTime: 18 Feb 2010 20:46:10.0748 (UTC)
	FILETIME=[6718B7C0:01CAB0DB]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libxml2 : convert to new staging and fix python error in gnome-doc-utils
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
X-List-Received-Date: Thu, 18 Feb 2010 20:49:58 -0000

Converting libxml2 recipes to the new staging way
  fixed the error where,during the compilation of gnome-doc-utils
  libxml2.py couldn't be find,but strangely the libxml package had
  only libxml.py

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/libxml/libxml2-native.inc      |    4 ++--
 recipes/libxml/libxml2-native_2.7.3.bb |    2 +-
 recipes/libxml/libxml2.inc             |    5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes/libxml/libxml2-native.inc b/recipes/libxml/libxml2-native.inc
index 3f67152..82d36b9 100644
--- a/recipes/libxml/libxml2-native.inc
+++ b/recipes/libxml/libxml2-native.inc
@@ -22,6 +22,6 @@ do_configure (){
 	autotools_do_configure ${EXTRA_LIBXML2_OECONF}
 }
 
-do_stage () {
-	oe_runmake install
+do_install_append() {
+	:
 }
diff --git a/recipes/libxml/libxml2-native_2.7.3.bb b/recipes/libxml/libxml2-native_2.7.3.bb
index 48e3598..bcbfb66 100644
--- a/recipes/libxml/libxml2-native_2.7.3.bb
+++ b/recipes/libxml/libxml2-native_2.7.3.bb
@@ -1,2 +1,2 @@
 require libxml2-native.inc
-PR = "r0"
+PR = "r1"
diff --git a/recipes/libxml/libxml2.inc b/recipes/libxml/libxml2.inc
index 101489e..bf2bf4d 100644
--- a/recipes/libxml/libxml2.inc
+++ b/recipes/libxml/libxml2.inc
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools pkgconfig binconfig
 
@@ -13,8 +13,7 @@ EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog
 
 export LDFLAGS += "-ldl"
 
-do_stage() {
-	autotools_stage_all
+do_install_append() {
 	install -d ${STAGING_DATADIR}/aclocal/
 	install -d ${STAGING_BINDIR_CROSS}
 
-- 
1.6.4.4



