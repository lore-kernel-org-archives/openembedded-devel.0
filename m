Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QZlEC-0005Re-8z
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 16:49:56 +0200
Received: by yxe1 with SMTP id 1so797273yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=GrdfVft26/3e4Bm8UyvM3mxKCcefFeMu8u6yneozLsc=;
	b=Gb9meZRLXbGfGD4QQx5xpVgKJ0qZTAy3kGWOPXHip81UJe3y0vp0BlvPDh9+T8qtdf
	m22AuJG0LF/HelmqfdWvvm7yW4YeDiuuKhjwThBeA2XV97sieDA2XyYjq6g2+uL9Z107
	cG1A5+Gv3mqEv9oATqWpjjnG3+tlGm6v9iVkM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tqyoYxAk/8y3vzlEoVa+4So07y1aMb0IHPZixBNLZCbhPCSOzlwVxAPNPUGWFMVJ5j
	nYigbR8/ni5TVVrwnF1tK2xFBRBeiclGCbnBro3JUwQIbLsg7mHhK9pgBwdeApKoNS3n
	nSmnWz32icUujrks1V1bNihthZMi8FR4MaS70=
Received: by 10.236.109.130 with SMTP id s2mr3428077yhg.245.1308840374194;
	Thu, 23 Jun 2011 07:46:14 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i30sm1042364yhm.7.2011.06.23.07.46.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 07:46:13 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2011 09:43:39 -0500
Message-Id: <1308840219-2216-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH v2 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Thu, 23 Jun 2011 14:49:58 -0000

* Modify to use OE MACHINE name for platforms
* Add all Sitara platforms
* Update SRCREV to 42

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
Updated in version 2:

  Updated SRCREV to 42 to pull in makefile.init with condtional paths
  Removed "sed" from recipe which added condtional paths
  Changed comment from Arago MACHINE to OE MACHINE
---
 recipes/ti/matrix-tui.inc    |   11 ++---------
 recipes/ti/matrix-tui_1.1.bb |    4 ++--
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
index 1ad8aa8..ef89f1f 100644
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
@@ -28,7 +21,6 @@ S = "${WORKDIR}/trunk"
 #INITSCRIPT_PARAMS = "defaults 99"
 
 do_configure() {
-	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:' makefile.init
 	sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
 }
 
@@ -39,11 +31,12 @@ do_compile() {
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
index 9814d5f..0c2adc0 100644
--- a/recipes/ti/matrix-tui_1.1.bb
+++ b/recipes/ti/matrix-tui_1.1.bb
@@ -1,4 +1,4 @@
 require matrix-tui.inc
 
-SRCREV = "37"
-PR = "${INC_PR}.4"
+SRCREV = "42"
+PR = "${INC_PR}.5"
-- 
1.7.0.4



