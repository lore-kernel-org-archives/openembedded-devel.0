Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QZSme-0003iw-FX
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 21:08:16 +0200
Received: by gyd12 with SMTP id 12so490166gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 12:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+Haq8CZ1oL98dq4R3wW2mqHlurh/KY3MVNPICtkMEgk=;
	b=Birs5+Pdjb8iQsAVsoMhPe3YAKw4cR8J5H2NxlMZboZlCrj7BCAYMLa7mUh+Ijf4Fq
	4T1AQWWOfAFbsbkrhi9XBGmELV50R4e/qUDmfMq/Euo4osKuIwbywYhtC1bSvoebVqgn
	xwlSUuEiuFEbVQyLsv1zfwDDBGsCMU3CrFbs8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CHA7jEakz373j+9O4x9l1vDrNCQ9I5laD22X1e3UqPLRfBAIJ3dkMuQb5VF1iCh4tx
	FcczNX8qQi/R4ZzbXiW6+FHrLYNcTwsOkLAoE08X9lppXSOEGOlls4WGMwvEYp1iUZM2
	eHg9sUPJi2JJpvtAJ5gEOVDIA/sPiLrd1dAxg=
Received: by 10.236.155.135 with SMTP id j7mr1156858yhk.100.1308769478126;
	Wed, 22 Jun 2011 12:04:38 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i61sm513956yhe.61.2011.06.22.12.04.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 12:04:37 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2011 14:02:01 -0500
Message-Id: <1308769321-26192-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Wed, 22 Jun 2011 19:08:16 -0000

* Modify to use arago MACHINE name for platforms
* Add all Sitara platforms
* Update SRCREV to 41

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-tui.inc    |   12 +++---------
 recipes/ti/matrix-tui_1.1.bb |    4 ++--
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
index 1ad8aa8..a3793d3 100644
--- a/recipes/ti/matrix-tui.inc
+++ b/recipes/ti/matrix-tui.inc
@@ -9,13 +9,6 @@ INC_PR = "r7"
 
 COMPATIBLE_MACHINE = "(omapl138|omap3)"
 
-PLATFORM_am37x-evm = "am3715"
-PLATFORM_beagleboard = "am3715"
-PLATFORM_am3517-evm = "am3517"
-PLATFORM_am180x-evm = "am180x"
-PLATFORM_am181x-evm = "am181x"
-PLATFORM_da850-omapl138-evm = "am180x"
-
 SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
 	file://init \
 "
@@ -28,7 +21,7 @@ S = "${WORKDIR}/trunk"
 #INITSCRIPT_PARAMS = "defaults 99"
 
 do_configure() {
-	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:' makefile.init
+	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-arago-linux-gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-arago-linux-gnueabi:' makefile.init
 	sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
 }
 
@@ -39,11 +32,12 @@ do_compile() {
 	export TUI_INCLUDE_PATH=${STAGING_INCDIR}
 	export XML_INCLUDE_PATH=${STAGING_INCDIR}/libxml2
 	export TUI_LIB_PATH=${STAGING_LIBDIR}
+	export PLATFORM=${MACHINE}
 	make release
 }
 
 do_install() {
-	export PLATFORM=${PLATFORM}
+	export PLATFORM=${MACHINE}
 	make DESTDIR=${D} install
 	install -d ${D}${sysconfdir}/init.d/
 	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-tui
diff --git a/recipes/ti/matrix-tui_1.1.bb b/recipes/ti/matrix-tui_1.1.bb
index 9814d5f..7e95d62 100644
--- a/recipes/ti/matrix-tui_1.1.bb
+++ b/recipes/ti/matrix-tui_1.1.bb
@@ -1,4 +1,4 @@
 require matrix-tui.inc
 
-SRCREV = "37"
-PR = "${INC_PR}.4"
+SRCREV = "41"
+PR = "${INC_PR}.5"
-- 
1.7.0.4



