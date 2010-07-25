Received: from evil.bitcloner.org ([62.2.86.239])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1Ocyt8-0004kO-4N
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 12:56:59 +0200
Received: from frbg-5f73351c.pool.mediaways.net ([95.115.53.28])
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(envelope-from <betheg@bitcloner.org>) id 1Ocyr4-0000fb-IH
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 12:54:50 +0200
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jul 2010 12:54:40 +0200
Message-Id: <1280055280-22965-1-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] freesmartphone: bump SRCREV
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
X-List-Received-Date: Sun, 25 Jul 2010 10:56:59 -0000


Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 recipes/freesmartphone/cornucopia.inc         |    2 +-
 recipes/freesmartphone/fso-specs_git.bb       |    4 ++--
 recipes/freesmartphone/fsodeviced_git.bb      |    2 +-
 recipes/freesmartphone/fsoinitd_git.bb        |    2 +-
 recipes/freesmartphone/fsotdld_git.bb         |    2 +-
 recipes/freesmartphone/fsousaged_git.bb       |    2 +-
 recipes/freesmartphone/libfso-glib_git.bb     |    4 ++--
 recipes/freesmartphone/libfsoframework_git.bb |    2 +-
 recipes/freesmartphone/mdbus2_git.bb          |    2 +-
 recipes/freesmartphone/mterm2_git.bb          |    2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes/freesmartphone/cornucopia.inc b/recipes/freesmartphone/cornucopia.inc
index cfd1446..43bdac6 100644
--- a/recipes/freesmartphone/cornucopia.inc
+++ b/recipes/freesmartphone/cornucopia.inc
@@ -7,7 +7,7 @@ DEPENDS = "vala-native glib-2.0 dbus dbus-glib libfso-glib libgee"
 DEPENDS += "${@['libfsoframework', ''][(bb.data.getVar('PN', d, 1) in 'libfsoframework libfsobasics'.split())]}"
 PV = "invalid, please override"
 
-FSO_CORNUCOPIA_SRCREV ?= "bb089b7d8e4916381ce8a70581454349cd137879"
+FSO_CORNUCOPIA_SRCREV ?= "823c55b80559ad4bc5687ddf47c12d1d224f68f5"
 INC_PR = "r2"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/fso-specs_git.bb b/recipes/freesmartphone/fso-specs_git.bb
index a607f03..fef75bd 100644
--- a/recipes/freesmartphone/fso-specs_git.bb
+++ b/recipes/freesmartphone/fso-specs_git.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://docs.freesmartphone.org"
 LICENSE = "BSD"
 DEPENDS = "libxslt-native"
 SECTION = "devel/specifications"
-SRCREV = "6e6f1a6efc57f52987f0e6cdf86c78abe7c55f25"
-PV = "2010.05.29.1+gitr${SRCPV}"
+SRCREV = "317e48c0bf2bdad4bf97a145c236fcbbadf3557e"
+PV = "2010.07.16.1+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
diff --git a/recipes/freesmartphone/fsodeviced_git.bb b/recipes/freesmartphone/fsodeviced_git.bb
index bc973a3..9cbc8a7 100644
--- a/recipes/freesmartphone/fsodeviced_git.bb
+++ b/recipes/freesmartphone/fsodeviced_git.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "libcanberra-alsa"
 # RRECOMMENDS_${PN} += "fso-alsa-data"
 RPROVIDES_${PN} = "openmoko-alsa-scenarios virtual/alsa-scenarios"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.0+gitr${SRCPV}"
+PV = "0.9.4+gitr${SRCPV}"
 PE = "2"
 PR = "${INC_PR}.13"
 
diff --git a/recipes/freesmartphone/fsoinitd_git.bb b/recipes/freesmartphone/fsoinitd_git.bb
index dfb0b94..8c98ceb 100644
--- a/recipes/freesmartphone/fsoinitd_git.bb
+++ b/recipes/freesmartphone/fsoinitd_git.bb
@@ -2,7 +2,7 @@ require cornucopia.inc
 inherit fso-plugin
 
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.0.0+gitr${SRCPV}"
+PV = "0.1.0+gitr${SRCPV}"
 PR = "${INC_PR}.1"
 
 EXTRA_OECONF = ""
diff --git a/recipes/freesmartphone/fsotdld_git.bb b/recipes/freesmartphone/fsotdld_git.bb
index 8f8b98f..3145b71 100644
--- a/recipes/freesmartphone/fsotdld_git.bb
+++ b/recipes/freesmartphone/fsotdld_git.bb
@@ -2,7 +2,7 @@ require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PR = "${INC_PR}.3"
-PV = "0.0.0+gitr${SRCPV}"
+PV = "0.3.1+gitr${SRCPV}"
 PE = "1"
 
 DEPENDS += "libfsotransport libfsoresource"
diff --git a/recipes/freesmartphone/fsousaged_git.bb b/recipes/freesmartphone/fsousaged_git.bb
index b6806a7..d6a2adf 100644
--- a/recipes/freesmartphone/fsousaged_git.bb
+++ b/recipes/freesmartphone/fsousaged_git.bb
@@ -1,6 +1,6 @@
 require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.1.2+gitr${SRCPV}"
+PV = "0.9.5+gitr${SRCPV}"
 PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/freesmartphone/libfso-glib_git.bb b/recipes/freesmartphone/libfso-glib_git.bb
index 31b6f4f..70289ae 100644
--- a/recipes/freesmartphone/libfso-glib_git.bb
+++ b/recipes/freesmartphone/libfso-glib_git.bb
@@ -3,8 +3,8 @@ AUTHOR = "Didier 'Ptitjes"
 LICENSE = "LGPL"
 SECTION = "devel"
 DEPENDS = "vala-dbus-binding-tool-native dbus-glib glib-2.0 fso-specs"
-SRCREV = "52d81d44133bf8fe07757e9076007db9e8d8d932"
-PV = "2010.05.29.1+gitr${SRCPV}"
+SRCREV = "b9f76110c6f76128aa4e7b28dcecd27b70cf3ee8"
+PV = "2010.07.16.1+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
diff --git a/recipes/freesmartphone/libfsoframework_git.bb b/recipes/freesmartphone/libfsoframework_git.bb
index c07f609..138c10a 100644
--- a/recipes/freesmartphone/libfsoframework_git.bb
+++ b/recipes/freesmartphone/libfsoframework_git.bb
@@ -2,7 +2,7 @@ require cornucopia.inc
 DESCRIPTION = "freesmartphone.org support library"
 DEPENDS += "libfsobasics alsa-lib"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.8.0+gitr${SRCPV}"
+PV = "0.8.1+gitr${SRCPV}"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/freesmartphone/mdbus2_git.bb b/recipes/freesmartphone/mdbus2_git.bb
index cfa6ef3..80a22bb 100644
--- a/recipes/freesmartphone/mdbus2_git.bb
+++ b/recipes/freesmartphone/mdbus2_git.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 dbus dbus-glib"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "2.0.0+gitr${SRCPV}"
+PV = "2.0.1+gitr${SRCPV}"
 PR = "${INC_PR}.0"
 PE = "1"
 
diff --git a/recipes/freesmartphone/mterm2_git.bb b/recipes/freesmartphone/mterm2_git.bb
index 8615af7..d549f3b 100644
--- a/recipes/freesmartphone/mterm2_git.bb
+++ b/recipes/freesmartphone/mterm2_git.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 DEPENDS = "dbus dbus-glib readline libfsoframework libfsotransport"
 LICENSE = "GPL"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.1.0+gitr${SRCPV}"
+PV = "1.9.0+gitr${SRCPV}"
 PE = "1"
 PR = "${INC_PR}.0"
 
-- 
1.7.1



