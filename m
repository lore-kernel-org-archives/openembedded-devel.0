Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TTCH6-0000q7-Uk
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2012 14:54:36 +0100
Received: by mail-ea0-f175.google.com with SMTP id c1so116622eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2012 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+xWqmWncULhN2G0xUfJUk71q+X61fq1ptU0CmRaij54=;
	b=KbAN5VCsDayNPN3yxfEV8zFHNpJFGM3s0dfRAuV3JDhVxpCHa4NGTHgfTWuslth9Oz
	+wEoycIEbFcJM2QzV0HIxgbFUmbfu4E15mJRktNjhuBwu4SIY6wpkbfn7Hrw//39i8uH
	k5J9+M7EZq9P6uw7B6mYSosGjRH77gNKVOFjMEjKbPjHMH1FxSTLyn8vQmI4tvIVFQAN
	+3p9C3d8Vrn3yBajXY+hua1PxYMyLAljM0HL9iyh6clcH0L+BYlBbcMCRCk0gtO6oZZu
	xE/YUUy8q8DhOIJshN2I2Pk0Mo17QR7V6z8snR7lA1KDY6NAL+KWkXuf9iNiAI2cQllY
	ipSA==
Received: by 10.14.173.137 with SMTP id v9mr60542357eel.41.1351604461236;
	Tue, 30 Oct 2012 06:41:01 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id k2sm1516267eep.15.2012.10.30.06.40.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 06:40:59 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2012 14:40:44 +0100
Message-Id: <1351604444-16246-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] maliit-plugins: Clean up recipe and add missing RDEPENDS
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
X-List-Received-Date: Tue, 30 Oct 2012 13:54:37 -0000

The following errors are only shown when started from console, also there are no visible errors during execution.
Error fixed: QML Image: Error decoding: file:///usr/share/maliit/plugins/org/nemomobile/icon-m-input-methods-shift-lowercase.svg: Unsupported image format

This is unaffected from whether libqtsvg4 is installed or not.

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../recipes-support/maliit/maliit-plugins_git.bb   |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 932c0ae..2fb52c7 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -8,6 +8,8 @@ inherit autotools qt4x11
 
 DEPENDS = "maliit-framework"
 
+RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
+
 SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
 
 SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
@@ -23,12 +25,8 @@ FILES_${PN} += "\
     ${datadir} \
     "
 
-FILES_${PN}-dbg += "\
-    ${libdir}/maliit/plugins-*/.debug \
-    "
+FILES_${PN}-dbg += "${libdir}/maliit/plugins-*/.debug"
 
 S= "${WORKDIR}/git"
 
-do_install() {
-  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
-}
\ No newline at end of file
+EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
-- 
1.7.9.5



