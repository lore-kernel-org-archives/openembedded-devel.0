Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1eKy-0005zh-0z
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 13:31:28 +0200
Received: by mail-ew0-f211.google.com with SMTP id 3so223119ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=gq/h+CiYiEQuB64WMvXxHNwJTSv1pF5nKongA22Cf1s=;
	b=aFbp6hfWtv7HR7I1z6UmGCSNIovJrIMYzBRYkxD3E3jRhIa1JgaudajE3LGpZ0JOst
	IvFdov6S5s3pKsLbJChkX3/r28qwwc3ubCi99jeOzU1A27QsSk1jJJkLoGh++mx4QWQb
	J7HuizPoUhTTXtN0mwvnJ7PuzKJDvISV3SSFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=atsaFxReXftIc3p3e3xCPs2gSahUQK07Utlm+njAGdtdFlLk6IaCY1Ht75JWcUmpuH
	kvk0wiWMC/gD3BjV6J3WlmHo4hlZycDo9zCoRp5Avqlw8UjFhyWfcs3Fr8LjgDSl1NyZ
	vMlbvhU8CAV0unJpV8N8DVgLFwEcYiu3F+J24=
Received: by 10.102.174.3 with SMTP id w3mr3012384mue.48.1271158078904;
	Tue, 13 Apr 2010 04:27:58 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y2sm22636362mug.21.2010.04.13.04.27.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 04:27:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 13:23:53 +0200
Message-Id: <1271157835-27308-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/6] freesmartphone: use SRCPV in git recipes
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
X-List-Received-Date: Tue, 13 Apr 2010 11:31:28 -0000

* with PE bump
* FSO people usually use fso-autorev.inc already, so this change won't
  change PV scheme

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/freesmartphone/dbus-hlid_git.bb            |    3 ++-
 recipes/freesmartphone/frameworkd_git.bb           |    3 ++-
 recipes/freesmartphone/fso-abyss_git.bb            |    5 +++--
 recipes/freesmartphone/fso-apm_git.bb              |    3 ++-
 recipes/freesmartphone/fso-boot_git.bb             |    3 ++-
 recipes/freesmartphone/fso-gpsd_git.bb             |    3 ++-
 recipes/freesmartphone/fso-gsm0710muxd_git.bb      |    3 ++-
 recipes/freesmartphone/fso-monitord_git.bb         |    3 ++-
 recipes/freesmartphone/fso-sounds.bb               |    3 ++-
 recipes/freesmartphone/fso-specs_git.bb            |    3 ++-
 recipes/freesmartphone/fsodatad_git.bb             |    3 ++-
 recipes/freesmartphone/fsodeviced_git.bb           |    4 ++--
 recipes/freesmartphone/fsogsmd_git.bb              |    3 ++-
 recipes/freesmartphone/fsomusicd_git.bb            |    3 ++-
 recipes/freesmartphone/fsonetworkd_git.bb          |    3 ++-
 recipes/freesmartphone/fsotdld_git.bb              |    3 ++-
 recipes/freesmartphone/fsousaged_git.bb            |    3 ++-
 recipes/freesmartphone/gsmd2_git.bb                |    3 ++-
 .../illume-theme-freesmartphone_git.bb             |    3 ++-
 recipes/freesmartphone/libframeworkd-glib_git.bb   |    3 ++-
 recipes/freesmartphone/libfso-glib_git.bb          |    3 ++-
 recipes/freesmartphone/libfsobasics_git.bb         |    3 ++-
 recipes/freesmartphone/libfsoframework_git.bb      |    3 ++-
 recipes/freesmartphone/libfsoresource_git.bb       |    3 ++-
 recipes/freesmartphone/libfsotransport_git.bb      |    3 ++-
 recipes/freesmartphone/libgsm0710_git.bb           |    3 ++-
 recipes/freesmartphone/libgsm0710mux_git.bb        |    3 ++-
 recipes/freesmartphone/libpersistence_git.bb       |    3 ++-
 recipes/freesmartphone/mdbus2_git.bb               |    3 ++-
 recipes/freesmartphone/mdbus_git.bb                |    3 ++-
 recipes/freesmartphone/mickeyterm_git.bb           |    3 ++-
 recipes/freesmartphone/msmcommd_git.bb             |    3 ++-
 recipes/freesmartphone/mterm2_git.bb               |    3 ++-
 recipes/freesmartphone/multicat_git.bb             |    3 ++-
 recipes/freesmartphone/opimd-utils_git.bb          |    3 ++-
 recipes/freesmartphone/pycd_git.bb                 |    3 ++-
 recipes/freesmartphone/zhone2_git.bb               |    3 ++-
 recipes/freesmartphone/zhone_git.bb                |    3 ++-
 recipes/libgdbus/libgdbus_git.bb                   |    4 ++--
 recipes/libgee/libgee_git.bb                       |    3 ++-
 recipes/libnl/libnl2_git.bb                        |    3 ++-
 .../mobile-broadband-provider-info_git.bb          |    3 ++-
 recipes/serial-utils/pty-forward-native.bb         |    3 ++-
 recipes/serial-utils/serial-forward_git.bb         |    3 ++-
 .../vala-dbus-binding-tool.inc                     |    1 +
 .../vala-dbus-binding-tool_git.bb                  |    2 +-
 recipes/vala-terminal/vala-terminal_git.bb         |    3 ++-
 47 files changed, 93 insertions(+), 49 deletions(-)

diff --git a/recipes/freesmartphone/dbus-hlid_git.bb b/recipes/freesmartphone/dbus-hlid_git.bb
index f9bd114..c37e180 100644
--- a/recipes/freesmartphone/dbus-hlid_git.bb
+++ b/recipes/freesmartphone/dbus-hlid_git.bb
@@ -5,7 +5,8 @@ SECTION = "console/network"
 DEPENDS = "vala-native dbus dbus-glib"
 LICENSE = "GPL"
 SRCREV = "5df7f49fe8881804aaab544a569fd164c3e93afb"
-PV = "1.0.1+gitr${SRCREV}"
+PV = "1.0.1+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/dbus-hlid.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/frameworkd_git.bb b/recipes/freesmartphone/frameworkd_git.bb
index 707f1d8..2b6b0bb 100644
--- a/recipes/freesmartphone/frameworkd_git.bb
+++ b/recipes/freesmartphone/frameworkd_git.bb
@@ -5,8 +5,9 @@ SECTION = "console/network"
 DEPENDS = "python-cython-native python-pyrex-native"
 LICENSE = "GPL"
 SRCREV = "f751f2724eea23d0ca050bdf2672f9011ae09517"
-PV = "0.9.5.9+gitr${SRCREV}"
+PV = "0.9.5.9+gitr${SRCPV}"
 PR = "r3"
+PE = "1"
 
 inherit distutils update-rc.d python-dir
 
diff --git a/recipes/freesmartphone/fso-abyss_git.bb b/recipes/freesmartphone/fso-abyss_git.bb
index 0296bfd..c23bbf4 100644
--- a/recipes/freesmartphone/fso-abyss_git.bb
+++ b/recipes/freesmartphone/fso-abyss_git.bb
@@ -5,8 +5,9 @@ SECTION = "console/network"
 DEPENDS = "vala-native dbus dbus-glib libgsm0710mux"
 LICENSE = "GPL"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.2+gitr${SRCREV}"
-PR = "r0"
+PV = "0.9.2+gitr${SRCPV}"
+PE = "1"
+PR = "r1"
 
 SRC_URI = "\
   ${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git;branch=master \
diff --git a/recipes/freesmartphone/fso-apm_git.bb b/recipes/freesmartphone/fso-apm_git.bb
index 01d9adb..a42492f 100644
--- a/recipes/freesmartphone/fso-apm_git.bb
+++ b/recipes/freesmartphone/fso-apm_git.bb
@@ -3,10 +3,11 @@ AUTHOR = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
 HOMEPAGE = "http://www.freesmartphone.org"
 SECTION = "console"
 LICENSE = "GPLv2"
+PE = "1"
 DEPENDS = "vala-native"
 RCONFLICTS = "apm"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "2.0.0+gitr${SRCREV}"
+PV = "2.0.0+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/fso-boot_git.bb b/recipes/freesmartphone/fso-boot_git.bb
index 2266bee..3241ce5 100644
--- a/recipes/freesmartphone/fso-boot_git.bb
+++ b/recipes/freesmartphone/fso-boot_git.bb
@@ -1,6 +1,7 @@
 require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
+PE = "1"
 PR = "${INC_PR}.0"
-PV = "0.2.0+gitr${SRCREV}"
+PV = "0.2.0+gitr${SRCPV}"
 S = "${WORKDIR}/git/tools/${PN}"
diff --git a/recipes/freesmartphone/fso-gpsd_git.bb b/recipes/freesmartphone/fso-gpsd_git.bb
index c8b1542..6ada1f5 100644
--- a/recipes/freesmartphone/fso-gpsd_git.bb
+++ b/recipes/freesmartphone/fso-gpsd_git.bb
@@ -3,7 +3,8 @@ LICENSE = "GPL"
 SECTION = "network"
 DEPENDS = "dbus-glib"
 SRCREV = "39e810899110a9bb302cf2064e1c0f73541fb4e6"
-PV = "0.8+gitr${SRCREV}"
+PV = "0.8+gitr${SRCPV}"
+PE = "1"
 PR = "r2"
 
 SRC_URI = "\
diff --git a/recipes/freesmartphone/fso-gsm0710muxd_git.bb b/recipes/freesmartphone/fso-gsm0710muxd_git.bb
index bfc01b4..aec38f0 100644
--- a/recipes/freesmartphone/fso-gsm0710muxd_git.bb
+++ b/recipes/freesmartphone/fso-gsm0710muxd_git.bb
@@ -4,7 +4,8 @@ SECTION = "console/network"
 DEPENDS = "dbus dbus-glib"
 LICENSE = "GPL"
 SRCREV = "1d69fb5b666ac2a9e54e46978c7afa8fe5dfc3c9"
-PV = "0.9.3.1+gitr${SRCREV}"
+PV = "0.9.3.1+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/gsm0710muxd.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/fso-monitord_git.bb b/recipes/freesmartphone/fso-monitord_git.bb
index 58adb83..0c931bd 100644
--- a/recipes/freesmartphone/fso-monitord_git.bb
+++ b/recipes/freesmartphone/fso-monitord_git.bb
@@ -4,7 +4,8 @@ SECTION = "console/network"
 DEPENDS = "vala-native dbus dbus-glib"
 LICENSE = "GPL"
 SRCREV = "b4ae1e9b10e710042624c2cf1a15b91a7d5b1d44"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/fso-monitord.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/fso-sounds.bb b/recipes/freesmartphone/fso-sounds.bb
index 32ca0cc..1349e3e 100644
--- a/recipes/freesmartphone/fso-sounds.bb
+++ b/recipes/freesmartphone/fso-sounds.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "A set of notification sounds"
 LICENSE = "CC"
 SECTION = "multimedia"
 SRCREV = "3a4767ec01988bd0fd8f72f0c35d6d36e5fbc815"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
+PE = "1"
 PR = "r2"
 
 SRC_URI = "\
diff --git a/recipes/freesmartphone/fso-specs_git.bb b/recipes/freesmartphone/fso-specs_git.bb
index d2daa2d..b97566e 100644
--- a/recipes/freesmartphone/fso-specs_git.bb
+++ b/recipes/freesmartphone/fso-specs_git.bb
@@ -5,7 +5,8 @@ LICENSE = "BSD"
 DEPENDS = "libxslt-native"
 SECTION = "devel/specifications"
 SRCREV = "e3fcb57675f7f48b6848f5b8114961f9418eb17b"
-PV = "0.5.0-gitr${SRCREV}"
+PV = "0.5.0+gitr${SRCPV}"
+PE = "1"
 PR = "r2"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/specs.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/fsodatad_git.bb b/recipes/freesmartphone/fsodatad_git.bb
index 7858638..9892e12 100644
--- a/recipes/freesmartphone/fsodatad_git.bb
+++ b/recipes/freesmartphone/fsodatad_git.bb
@@ -2,7 +2,8 @@ require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PR = "${INC_PR}.2"
-PV = "0.1.0+gitr${SRCREV}"
+PV = "0.1.0+gitr${SRCPV}"
+PE = "1"
 
 DEPENDS += "\
   libxml2 \
diff --git a/recipes/freesmartphone/fsodeviced_git.bb b/recipes/freesmartphone/fsodeviced_git.bb
index b7e93cb..90eb91c 100644
--- a/recipes/freesmartphone/fsodeviced_git.bb
+++ b/recipes/freesmartphone/fsodeviced_git.bb
@@ -7,8 +7,8 @@ RDEPENDS += "libcanberra-alsa"
 # RRECOMMENDS += "fso-alsa-data"
 RPROVIDES_${PN} = "openmoko-alsa-scenarios virtual/alsa-scenarios"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.0+gitr${SRCREV}"
-PE = "1"
+PV = "0.9.0+gitr${SRCPV}"
+PE = "2"
 PR = "${INC_PR}.10"
 
 EXTRA_OECONF = "\
diff --git a/recipes/freesmartphone/fsogsmd_git.bb b/recipes/freesmartphone/fsogsmd_git.bb
index abbe36c..d331f31 100644
--- a/recipes/freesmartphone/fsogsmd_git.bb
+++ b/recipes/freesmartphone/fsogsmd_git.bb
@@ -2,7 +2,8 @@ require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PR = "${INC_PR}.0"
-PV = "0.5.0+gitr${SRCREV}"
+PV = "0.5.0+gitr${SRCPV}"
+PE = "1"
 
 DEPENDS += "libfsoresource libgsm0710mux ppp msmcommd"
 
diff --git a/recipes/freesmartphone/fsomusicd_git.bb b/recipes/freesmartphone/fsomusicd_git.bb
index 4648c73..2d1de2b 100644
--- a/recipes/freesmartphone/fsomusicd_git.bb
+++ b/recipes/freesmartphone/fsomusicd_git.bb
@@ -6,8 +6,9 @@ require cornucopia.inc
 
 DEPENDS += "gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
 PR = "${INC_PR}.3"
+PE = "1"
 
 RDEPENDS += "\
 #gst-plugins-base
diff --git a/recipes/freesmartphone/fsonetworkd_git.bb b/recipes/freesmartphone/fsonetworkd_git.bb
index 67cc22a..e64de8e 100644
--- a/recipes/freesmartphone/fsonetworkd_git.bb
+++ b/recipes/freesmartphone/fsonetworkd_git.bb
@@ -1,5 +1,6 @@
 require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.1.0.0+gitr${SRCREV}"
+PV = "0.1.0.0+gitr${SRCPV}"
+PE = "1"
 PR = "${INC_PR}.2"
diff --git a/recipes/freesmartphone/fsotdld_git.bb b/recipes/freesmartphone/fsotdld_git.bb
index 3ae74ce..d6cf3b7 100644
--- a/recipes/freesmartphone/fsotdld_git.bb
+++ b/recipes/freesmartphone/fsotdld_git.bb
@@ -2,6 +2,7 @@ require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
 PR = "${INC_PR}.2"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
+PE = "1"
 
 DEPENDS += "libfsotransport libfsoresource"
diff --git a/recipes/freesmartphone/fsousaged_git.bb b/recipes/freesmartphone/fsousaged_git.bb
index 3516e47..b6806a7 100644
--- a/recipes/freesmartphone/fsousaged_git.bb
+++ b/recipes/freesmartphone/fsousaged_git.bb
@@ -1,5 +1,6 @@
 require cornucopia.inc
 inherit fso-plugin
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.1.2+gitr${SRCREV}"
+PV = "0.9.1.2+gitr${SRCPV}"
+PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/freesmartphone/gsmd2_git.bb b/recipes/freesmartphone/gsmd2_git.bb
index 96ed563..12ddac5 100644
--- a/recipes/freesmartphone/gsmd2_git.bb
+++ b/recipes/freesmartphone/gsmd2_git.bb
@@ -5,7 +5,8 @@ SECTION = "console/network"
 DEPENDS = "dbus dbus-glib"
 LICENSE = "GPL"
 SRCREV = "c16883a079aeff8780e5d461ec4e8348537ab4d8"
-PV = "0.1.0+gitr${SRCREV}"
+PV = "0.1.0+gitr${SRCPV}"
+PE = "1"
 PR = "r1"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/gsmd2.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/illume-theme-freesmartphone_git.bb b/recipes/freesmartphone/illume-theme-freesmartphone_git.bb
index 2babd91..f9c6599 100644
--- a/recipes/freesmartphone/illume-theme-freesmartphone_git.bb
+++ b/recipes/freesmartphone/illume-theme-freesmartphone_git.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "http://illume.projects.openmoko.org/"
 LICENSE = "MIT/BSD"
 DEPENDS = "edje-native eet-native"
 SRCREV = "b1b0f6adc59e6f72a3929771058e3750bf181bc5"
-PV = "0.1.0+gitr${SRCREV}"
+PV = "0.1.0+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/artwork.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/libframeworkd-glib_git.bb b/recipes/freesmartphone/libframeworkd-glib_git.bb
index 4c7b5a0..bfbe560 100644
--- a/recipes/freesmartphone/libframeworkd-glib_git.bb
+++ b/recipes/freesmartphone/libframeworkd-glib_git.bb
@@ -3,7 +3,8 @@ LICENSE = "LGPL"
 SECTION = "devel"
 DEPENDS = "dbus-glib"
 SRCREV = "487b092dd3daa12a5beff0abe1be3f53d82f4bf0"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/libframeworkd-glib.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/libfso-glib_git.bb b/recipes/freesmartphone/libfso-glib_git.bb
index 922ff54..18d4f80 100644
--- a/recipes/freesmartphone/libfso-glib_git.bb
+++ b/recipes/freesmartphone/libfso-glib_git.bb
@@ -4,7 +4,8 @@ LICENSE = "LGPL"
 SECTION = "devel"
 DEPENDS = "vala-native vala-dbus-binding-tool-native dbus-glib glib-2.0 fso-specs"
 SRCREV = "f1a0b3fe2ed6e15d83ad4880b4eb7aece00f9d57"
-PV = "0.2.2+gitr${SRCREV}"
+PV = "0.2.2+gitr${SRCPV}"
+PE = "1"
 PR = "r3"
 
 inherit autotools_stage pkgconfig vala
diff --git a/recipes/freesmartphone/libfsobasics_git.bb b/recipes/freesmartphone/libfsobasics_git.bb
index b34cc3e..3512c13 100644
--- a/recipes/freesmartphone/libfsobasics_git.bb
+++ b/recipes/freesmartphone/libfsobasics_git.bb
@@ -3,5 +3,6 @@ require cornucopia.inc
 DESCRIPTION = "freesmartphone.org support library"
 DEPENDS += "libnl2"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.9+gitr${SRCREV}"
+PV = "0.9.9+gitr${SRCPV}"
+PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/freesmartphone/libfsoframework_git.bb b/recipes/freesmartphone/libfsoframework_git.bb
index afc4291..c07f609 100644
--- a/recipes/freesmartphone/libfsoframework_git.bb
+++ b/recipes/freesmartphone/libfsoframework_git.bb
@@ -2,6 +2,7 @@ require cornucopia.inc
 DESCRIPTION = "freesmartphone.org support library"
 DEPENDS += "libfsobasics alsa-lib"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.8.0+gitr${SRCREV}"
+PV = "0.8.0+gitr${SRCPV}"
+PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/freesmartphone/libfsoresource_git.bb b/recipes/freesmartphone/libfsoresource_git.bb
index 3e809f2..fe6c371 100644
--- a/recipes/freesmartphone/libfsoresource_git.bb
+++ b/recipes/freesmartphone/libfsoresource_git.bb
@@ -2,5 +2,6 @@ require cornucopia.inc
 DESCRIPTION = "freesmartphone.org dbus resource library"
 DEPENDS += "libfso-glib"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.1.1+gitr${SRCREV}"
+PV = "0.1.1+gitr${SRCPV}"
+PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/freesmartphone/libfsotransport_git.bb b/recipes/freesmartphone/libfsotransport_git.bb
index 79bde22..7e7e6d6 100644
--- a/recipes/freesmartphone/libfsotransport_git.bb
+++ b/recipes/freesmartphone/libfsotransport_git.bb
@@ -1,5 +1,6 @@
 require cornucopia.inc
 DESCRIPTION = "freesmartphone.org transport library"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.6+gitr${SRCREV}"
+PV = "0.9.6+gitr${SRCPV}"
+PE = "1"
 PR = "${INC_PR}.0"
diff --git a/recipes/freesmartphone/libgsm0710_git.bb b/recipes/freesmartphone/libgsm0710_git.bb
index ab1f81d..6b78c9f 100644
--- a/recipes/freesmartphone/libgsm0710_git.bb
+++ b/recipes/freesmartphone/libgsm0710_git.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "A GSM 07.10 Protocol Engine"
 LICENSE = "GPL"
 SECTION = "devel"
 SRCREV = "52eea64bdbb79c09002b46e98a5e656509884f72"
-PV = "1.2.0+gitr${SRCREV}"
+PV = "1.2.0+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/libgsm0710.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/libgsm0710mux_git.bb b/recipes/freesmartphone/libgsm0710mux_git.bb
index 0f7dad9..f85be3c 100644
--- a/recipes/freesmartphone/libgsm0710mux_git.bb
+++ b/recipes/freesmartphone/libgsm0710mux_git.bb
@@ -4,7 +4,8 @@ LICENSE = "GPL"
 SECTION = "devel"
 DEPENDS = "glib-2.0 libgsm0710 libfsotransport"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.9.2+gitr${SRCREV}"
+PV = "0.9.2+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/libpersistence_git.bb b/recipes/freesmartphone/libpersistence_git.bb
index f204d44..0550045 100644
--- a/recipes/freesmartphone/libpersistence_git.bb
+++ b/recipes/freesmartphone/libpersistence_git.bb
@@ -4,7 +4,8 @@ LICENSE = "LGPL"
 SECTION = "devel"
 DEPENDS = "libgee"
 SRCREV = "217ad803745f8ac1f3c72c6715e2c0faefb3fd06"
-PV = "0.1.0+gitr${SRCREV}"
+PV = "0.1.0+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "\
diff --git a/recipes/freesmartphone/mdbus2_git.bb b/recipes/freesmartphone/mdbus2_git.bb
index eb00e83..76af519 100644
--- a/recipes/freesmartphone/mdbus2_git.bb
+++ b/recipes/freesmartphone/mdbus2_git.bb
@@ -5,8 +5,9 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 dbus dbus-glib"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "2.0.0+gitr${SRCREV}"
+PV = "2.0.0+gitr${SRCPV}"
 PR = "r0"
+PE = "1"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git;branch=master"
 S = "${WORKDIR}/git/tools/mdbus2"
diff --git a/recipes/freesmartphone/mdbus_git.bb b/recipes/freesmartphone/mdbus_git.bb
index b5bf378..f90fd7e 100644
--- a/recipes/freesmartphone/mdbus_git.bb
+++ b/recipes/freesmartphone/mdbus_git.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://www.freesmartphone.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 SRCREV = "${FSO_PYTHONHELPERS_SRCREV}"
-PV = "0.9.2+gitr${SRCREV}"
+PV = "0.9.2+gitr${SRCPV}"
+PE = "1"
 PR = "r2"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/python-helpers.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/mickeyterm_git.bb b/recipes/freesmartphone/mickeyterm_git.bb
index 9e89a55..2073021 100644
--- a/recipes/freesmartphone/mickeyterm_git.bb
+++ b/recipes/freesmartphone/mickeyterm_git.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://www.freesmartphone.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 SRCREV = "${FSO_PYTHONHELPERS_SRCREV}"
-PV = "2.9.1+gitr${SRCREV}"
+PV = "2.9.1+gitr${SRCPV}"
+PE = "1"
 PR = "r3"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/python-helpers.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/msmcommd_git.bb b/recipes/freesmartphone/msmcommd_git.bb
index 8af07b1..7177e50 100644
--- a/recipes/freesmartphone/msmcommd_git.bb
+++ b/recipes/freesmartphone/msmcommd_git.bb
@@ -5,8 +5,9 @@ SECTION = "console/network"
 LICENSE = "GPL"
 DEPENDS = "libgee libfsotransport"
 SRCREV = "23c0cd870fc989792a20c6c662db4400129bd471"
-PV = "0.1.0+gitr${SRCREV}"
+PV = "0.1.0+gitr${SRCPV}"
 PR = "r2"
+PE = "1"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/msmcomm.git;protocol=git;branch=master"
 S = "${WORKDIR}/git"
diff --git a/recipes/freesmartphone/mterm2_git.bb b/recipes/freesmartphone/mterm2_git.bb
index 4b8a670..f459a4a 100644
--- a/recipes/freesmartphone/mterm2_git.bb
+++ b/recipes/freesmartphone/mterm2_git.bb
@@ -5,7 +5,8 @@ SECTION = "console/network"
 DEPENDS = "dbus dbus-glib readline libfsoframework libfsotransport"
 LICENSE = "GPL"
 SRCREV = "${FSO_CORNUCOPIA_SRCREV}"
-PV = "0.1.0+gitr${SRCREV}"
+PV = "0.1.0+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "\
diff --git a/recipes/freesmartphone/multicat_git.bb b/recipes/freesmartphone/multicat_git.bb
index edbbb9a..a47f605 100644
--- a/recipes/freesmartphone/multicat_git.bb
+++ b/recipes/freesmartphone/multicat_git.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://www.freesmartphone.org"
 SECTION = "console"
 LICENSE = "GPLv2"
 SRCREV = "${FSO_PYTHONHELPERS_SRCREV}"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
+PE = "1"
 PR = "r1"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/python-helpers.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/opimd-utils_git.bb b/recipes/freesmartphone/opimd-utils_git.bb
index 08f3293..79a44ae 100644
--- a/recipes/freesmartphone/opimd-utils_git.bb
+++ b/recipes/freesmartphone/opimd-utils_git.bb
@@ -5,8 +5,9 @@ LICENSE ?= "GPL"
 RDEPENDS = "python-elementary python-dbus python-codecs python-shell python python-core python-edbus frameworkd"
 SECTION = "x11/application"
 SRCREV = "1872cdebe1209123710259e25cb8c8b47a627112"
-PV = "0.0.3+gitr${SRCREV}"
+PV = "0.0.3+gitr${SRCPV}"
 PR = "r0"
+PE = "1"
 
 inherit setuptools
 
diff --git a/recipes/freesmartphone/pycd_git.bb b/recipes/freesmartphone/pycd_git.bb
index 7f5f2be..92b0bb9 100644
--- a/recipes/freesmartphone/pycd_git.bb
+++ b/recipes/freesmartphone/pycd_git.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://www.freesmartphone.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 SRCREV = "${FSO_PYTHONHELPERS_SRCREV}"
-PV = "0.1+gitr${SRCREV}"
+PV = "0.1+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/python-helpers.git;protocol=git;branch=master"
diff --git a/recipes/freesmartphone/zhone2_git.bb b/recipes/freesmartphone/zhone2_git.bb
index 14d7097..11402b4 100644
--- a/recipes/freesmartphone/zhone2_git.bb
+++ b/recipes/freesmartphone/zhone2_git.bb
@@ -5,8 +5,9 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 DEPENDS = "edje-native vala-native evas ecore edje libeflvala libfsobasics libfsoframework libfso-glib"
 SRCREV = "1e3dca8a407f4e69636c47d9f22b31f8ae718d5a"
-PV = "2.0.0+gitr${SRCREV}"
+PV = "2.0.0+gitr${SRCPV}"
 PR = "r2"
+PE = "1"
 
 SRC_URI = "\
   ${FREESMARTPHONE_GIT}/aurora.git;protocol=git;branch=master \
diff --git a/recipes/freesmartphone/zhone_git.bb b/recipes/freesmartphone/zhone_git.bb
index 964b58a..c1559f4 100644
--- a/recipes/freesmartphone/zhone_git.bb
+++ b/recipes/freesmartphone/zhone_git.bb
@@ -3,7 +3,8 @@ LICENSE = "GPL"
 SECTION = "x11"
 DEPENDS = "edje-native python-pyrex-native python-cython-native"
 SRCREV = "bd1e895f73a0e5beb2608ebe111d7ef32ee3adbc"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
+PE = "1"
 PR = "r13"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/zhone.git;protocol=git;branch=master \
diff --git a/recipes/libgdbus/libgdbus_git.bb b/recipes/libgdbus/libgdbus_git.bb
index 0cacab8..73c95f3 100644
--- a/recipes/libgdbus/libgdbus_git.bb
+++ b/recipes/libgdbus/libgdbus_git.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.moblin.org/projects/projects_connman.php"
 LICENSE = "GPL LGPL"
 DEPENDS = "glib-2.0 dbus"
 SRCREV = "aeab6e3c0185b271ca343b439470491b99cc587f"
-PE = "1"
-PV = "0.2+gitr${SRCREV}"
+PE = "2"
+PV = "0.2+gitr${SRCPV}"
 
 SRC_URI  = "git://git.moblin.org/repos/projects/libgdbus.git;protocol=http"
 S = "${WORKDIR}/git"
diff --git a/recipes/libgee/libgee_git.bb b/recipes/libgee/libgee_git.bb
index 26b1fe5..c6324c7 100644
--- a/recipes/libgee/libgee_git.bb
+++ b/recipes/libgee/libgee_git.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 DEPENDS = "glib-2.0"
 LICENSE = "LGPL"
 SRCREV = "a86abd4240622ec377bbc5773850a4593e13f7eb"
-PV = "0.5.0+gitr${SRCREV}"
+PV = "0.5.0+gitr${SRCPV}"
+PE = "1"
 
 SRC_URI = "\
   git://git.gnome.org/libgee;protocol=git;branch=master \
diff --git a/recipes/libnl/libnl2_git.bb b/recipes/libnl/libnl2_git.bb
index 9deaad2..3e17517 100644
--- a/recipes/libnl/libnl2_git.bb
+++ b/recipes/libnl/libnl2_git.bb
@@ -3,7 +3,8 @@ SECTION = "libs/network"
 LICENSE = "LGPL"
 HOMEPAGE = "http://people.suug.ch/~tgr/libnl"
 SRCREV = "8808743839b0f459394ecd00cb0f7c1896c0ab7a"
-PV = "1.9+gitr${SRCREV}"
+PV = "1.9+gitr${SRCPV}"
+PE = "1"
 PR = "r1"
 
 inherit autotools
diff --git a/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 0fa6115..eb7d19c 100644
--- a/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/recipes/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "Mobile Broadband Service Provider Database"
 SECTION = "network"
 LICENSE = "CCPD"
 SRCREV = "bc536218490377ccbd09c4e5858d37c91c2f03f7"
-PV = "gitr${SRCREV}"
+PV = "1.0.0+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info;protocol=git"
diff --git a/recipes/serial-utils/pty-forward-native.bb b/recipes/serial-utils/pty-forward-native.bb
index f14c057..6ea4f2f 100644
--- a/recipes/serial-utils/pty-forward-native.bb
+++ b/recipes/serial-utils/pty-forward-native.bb
@@ -3,7 +3,8 @@ AUTHOR = "Holger 'Zecke' Freyther"
 LICENSE = "GPL"
 SECTION = "console/network"
 SRCREV = "4662b55fdba528bb5b3349f83055bf236af5d63b"
-PV = "1.1+gitr${SRCREV}"
+PV = "1.1+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git"
diff --git a/recipes/serial-utils/serial-forward_git.bb b/recipes/serial-utils/serial-forward_git.bb
index 54154ab..2ba9486 100644
--- a/recipes/serial-utils/serial-forward_git.bb
+++ b/recipes/serial-utils/serial-forward_git.bb
@@ -3,7 +3,8 @@ AUTHOR = "Holger 'Zecke' Freyther'"
 LICENSE = "GPL"
 SECTION = "console/devel"
 SRCREV = "50cf4ff2198589a8db369789fc038604a892a54d"
-PV = "1.1+gitr${SRCREV}"
+PV = "1.1+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git/;protocol=git"
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index b28079c..93e60b5 100644
--- a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -3,6 +3,7 @@ SECTION = "devel"
 DEPENDS = "vala libgee libxml2 intltool-native"
 HOMEPAGE = "http://wiki.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
 LICENSE = "GPLv2"
+PE = "1"
 INC_PR = "r3"
 
 SRC_URI = "http://downloads.freesmartphone.org/sources/vala-dbus-binding-tool-${PV}.tar.bz2;name=archive"
diff --git a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
index e4e7a2c..5eb7a45 100644
--- a/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ b/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -1,6 +1,6 @@
 require vala-dbus-binding-tool.inc
 SRCREV = "8e6868c6a2fe055daf8b1cf3d68134fb83909186"
-PV = "0.1.6+gitr${SRCREV}"
+PV = "0.1.6+gitr${SRCPV}"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-dbus-binding-tool.git;protocol=git;branch=master"
 S = "${WORKDIR}/git"
diff --git a/recipes/vala-terminal/vala-terminal_git.bb b/recipes/vala-terminal/vala-terminal_git.bb
index ff79481..a782bf7 100644
--- a/recipes/vala-terminal/vala-terminal_git.bb
+++ b/recipes/vala-terminal/vala-terminal_git.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "A lightweight Terminal Emulator based on libvte, written in Vala.
 SECTION = "x11/applications"
 DEPENDS = "vala-native vte"
 SRCREV = "fda5f26710acfc0befe04c8f2e58b35bdba297f7"
-PV = "1.1.1+gitr${SRCREV}"
+PV = "1.1.1+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 inherit autotools
-- 
1.7.0.4



