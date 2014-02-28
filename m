Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7586E40A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 00:51:42 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2014 01:51:31 +0100
Message-Id: <1393548691-24359-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] libconnman-qt: update to 1.0.50+git80ac184
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2014 00:51:43 -0000

Allows to install versions for Qt4/X11 and Qt4/Embedded into
the same filesystem by overriding the target name.

This version also removes a superflous .pc file from ${libdir}.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
index 77e70e8..3f91be2 100644
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
 SECTION = "qt/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
-SRCREV = "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
-PV = "1.0.46+git${SRCPV}"
+SRCREV = "80ac184d859ea90c026403f5a520644945a5081a"
+PV = "1.0.50+git${SRCPV}"
 
 SRC_URI = "git://github.com/nemomobile/libconnman-qt.git;branch=master"
 
@@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
-EXTRA_QMAKEVARS_PRE += "CONFIG+=notests"
+EXTRA_QMAKEVARS_PRE += "CONFIG+=notests TARGET_SUFFIX=${QT_DIR_NAME}"
 
 do_configure_prepend() {
     # Hack *.pro variables
@@ -37,7 +37,6 @@ FILES_${PN}-dev = " \
     ${libdir}/libconnman-qt*${SOLIBSDEV} \
     ${libdir}/libconnman-qt*.prl \
     ${libdir}/pkgconfig/connman-qt*.pc \
-    ${libdir}/connman-qt*.pc \
 "
 FILES_${PN}-plugin = " \
     ${PLUGINS_TARGET}/qmldir \
-- 
1.8.3.2


