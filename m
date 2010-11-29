Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PN0HE-0000UN-Ha
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 10:44:07 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 9E13B1B421;
	Mon, 29 Nov 2010 10:44:05 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Nov 2010 10:42:45 +0100
Message-Id: <1291023765-1226-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] disko: add dependency python-scons-native
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
X-List-Received-Date: Mon, 29 Nov 2010 09:44:07 -0000

* add dependency python-scons-native
* moved other dependencies to disko.inc
---
 recipes/disko/disko.inc      |    2 +-
 recipes/disko/disko_1.6.0.bb |    1 -
 recipes/disko/disko_1.7.0.bb |    1 -
 recipes/disko/disko_git.bb   |    1 -
 4 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/recipes/disko/disko.inc b/recipes/disko/disko.inc
index 8f531c5..21375c6 100644
--- a/recipes/disko/disko.inc
+++ b/recipes/disko/disko.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Disko is an application framework, that can be used to develop GUI applications for embedded devices."
 LICENSE = "GPL"
 
-DEPENDS = "sqlite3 libpng jpeg curl alsa-lib freetype libxml2 libsigc++-2.0 openssl"
+DEPENDS = "python-scons-native sqlite3 libpng jpeg curl alsa-lib freetype libxml2 libsigc++-2.0 openssl taglib directfb virtual/libx11 hal libxv libxxf86vm"
 
 inherit scons pkgconfig
 
diff --git a/recipes/disko/disko_1.6.0.bb b/recipes/disko/disko_1.6.0.bb
index baf7fb3..db69223 100644
--- a/recipes/disko/disko_1.6.0.bb
+++ b/recipes/disko/disko_1.6.0.bb
@@ -4,7 +4,6 @@ PR = "r0"
 
 require disko.inc
 
-DEPENDS += "taglib directfb virtual/libx11 hal libxv libxxf86vm"
 
 SRC_URI = "http://www.diskohq.com/repository/ubuntu/pool/${PN}_${PV}.tar.bz2  \
 	   file://pkgconfig.patch \
diff --git a/recipes/disko/disko_1.7.0.bb b/recipes/disko/disko_1.7.0.bb
index 7907d7a..c815a43 100644
--- a/recipes/disko/disko_1.7.0.bb
+++ b/recipes/disko/disko_1.7.0.bb
@@ -4,7 +4,6 @@ PR = "r0"
 
 require disko.inc
 
-DEPENDS += "taglib directfb virtual/libx11 hal libxv libxxf86vm"
 
 SRC_URI = "http://www.diskohq.com/repository/ubuntu/pool/${PN}_${PV}.tar.gz \
            file://mmsfiletransfer.patch \
diff --git a/recipes/disko/disko_git.bb b/recipes/disko/disko_git.bb
index 71d694d..8e853e6 100644
--- a/recipes/disko/disko_git.bb
+++ b/recipes/disko/disko_git.bb
@@ -8,7 +8,6 @@ DEFAULT_PREFERENCE = "-1"
 
 require disko.inc
 
-DEPENDS += "taglib directfb virtual/libx11 hal libxv libxxf86vm"
 
 SRC_URI = "git://www.diskohq.org/disko.git;protocol=git \
 	   file://pkgconfig.patch \
-- 
1.7.0.4



